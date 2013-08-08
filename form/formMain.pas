unit formMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, cxPC, DB, MemDS, DBAccess, dxBarExtItems,
  cxPCdxBarPopupMenu, Uni, Vcl.ImgList, cxLocalization, cxImage, cxBarEditItem;

type
  TGUIDs = array of String;
  TmainFrm = class(TForm)
    aclMain: TActionList;
    brmMain: TdxBarManager;
    brmMainMenu: TdxBar;
    mniCORFile: TdxBarSubItem;
    mniCORExit: TdxBarButton;
    actCORExit: TAction;
    pclMain: TcxPageControl;
    sbrMain: TdxStatusBar;
    tshObjects: TcxTabSheet;
    tshOwners: TcxTabSheet;
    actVIWObjects: TAction;
    actVIWOwners: TAction;
    mniCORView: TdxBarSubItem;
    mniVIWObjects: TdxBarButton;
    mniVIWOwners: TdxBarButton;
    brmControls: TdxBar;
    tshShares: TcxTabSheet;
    actVIWShares: TAction;
    mniVIWShares: TdxBarButton;
    mniLIBLibrary: TdxBarSubItem;
    mniLIBHouses: TdxBarButton;
    actLIBHouses: TAction;
    buildingCmb: TdxBarCombo;
    qHouses: TUniQuery;
    brmHouse: TdxBar;
    mniDateOper: TdxBarDateCombo;
    qHousesguid: TWideStringField;
    qHousesname: TWideStringField;
    qHousesis_active: TBooleanField;
    greyImgList: TcxImageList;
    cxLocalizer: TcxLocalizer;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PEvents(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LoadLocalizer;
  private
    BuildingGUIDs: TGUIDs;
    procedure LoadBuildingComboBox;
  public
    { Public declarations }
  end;

var
  mainFrm: TmainFrm;

implementation

uses CORLoggerLib, dmCon, CORDialogLib, frameObjects, frameOwners, frameShare,
  CORLogicLib, dmData, frmBuildList;

var
  objectsFrame: TobjectsFrame;
  ownersFrame: TownersFrame;
  shareFrame: TshareFrame;

{$R *.dfm}

procedure TmainFrm.FormCreate(Sender: TObject);
var
  Index: Integer;
begin
  if connectDm.DBConnect <> mrOk
  then MBox('Невозможно соединиться с базой данных', CoreErrorText, mtError);
  for Index := 0 to pclMain.PageCount - 1 do
    pclMain.Pages[Index].TabVisible := False;
  pclMain.ActivePageIndex := 0;
  mniDateOper.Date := Logic.DateOper;
  dataDm.loadData();
  LoadBuildingComboBox;
  LoadLocalizer;

  objectsFrame := TobjectsFrame.Create(Self);
  objectsFrame.Parent := tshObjects;
  objectsFrame.LoadData();
  ownersFrame := TownersFrame.Create(Self);
  ownersFrame.Parent := tshOwners;
  shareFrame := TshareFrame.Create(Self);
  shareFrame.Parent := tshShares;
  LogDebug(ClassName, 'Form created');
end;

procedure TmainFrm.LoadLocalizer;
begin
  if FileExists(GetCurrentDir + '/Russian.lng') then
  begin
    cxLocalizer.LoadFromFile(GetCurrentDir + '/Russian.lng');
    cxLocalizer.Active:=true;
    cxLocalizer.Locale:=1049;
  end;
end;

procedure TmainFrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MBox('Выйти из программы?', '', mtConfirmation) <> mrYes
  then CanClose := False;
end;

procedure TmainFrm.FormDestroy(Sender: TObject);
begin
  shareFrame.Free;
  ownersFrame.Free;
  objectsFrame.Free;
  connectDm.DBDisconnect;
  LogDebug(ClassName, 'Form destroyed');
end;

//------------------------------------
// Заполнение выпадающего списка домов
//------------------------------------
procedure TmainFrm.LoadBuildingComboBox;
begin
  LogDebug(ClassName, '[LoadBuildingComboBox] Start');
  try
    SetLength(BuildingGUIDs, 0);
    buildingCmb.Items.Clear;
    dataDm.qBuildindsList.First;
    while not dataDm.qBuildindsList.Eof do
    begin
      SetLength(BuildingGUIDs, Length(BuildingGUIDs) + 1);
      BuildingGUIDs[Length(BuildingGUIDs) - 1] := dataDm.qBuildindsList.FieldByName('GUID').AsString;
      buildingCmb.Items.Add(dataDm.qBuildindsList.FieldByName('Name').AsString);
      if dataDm.qBuildindsList.FieldByName('GUID').AsString = Logic.HouseGUID
      then buildingCmb.ItemIndex := buildingCmb.Items.Count - 1;
      dataDm.qBuildindsList.Next;
    end;
    if (buildingCmb.ItemIndex = -1) and (buildingCmb.Items.Count > 0)
    then buildingCmb.ItemIndex := 0;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadHouses] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
    end;
  end;
  LogDebug(ClassName, '[LoadHouses] Finish');
end;

procedure TmainFrm.PEvents(Sender: TObject);
begin
  if (Sender is TdxBarDateCombo)
  then begin
    if (Sender as TdxBarDateCombo) = mniDateOper
    then Logic.DateOper := mniDateOper.Date;
  end;
  if (Sender is TdxBarCombo)
  then begin
    if (Sender as TdxBarCombo) = buildingCmb
    then begin
      if (0 <= buildingCmb.ItemIndex) and (buildingCmb.ItemIndex < Length(BuildingGUIDs))
      then begin
        Logic.HouseGUID := BuildingGUIDs[buildingCmb.ItemIndex];
        Caption := APPLICATION_CAPTION + ' [' + buildingCmb.Text + ']';

        dataDm.qObjects.Close;
        dataDm.qObjects.ParamByName('BGUID').AsString := BuildingGUIDs[buildingCmb.ItemIndex];
        dataDm.qObjects.Open;

        dataDm.qOwnerShare.Close;
        dataDm.qOwnerShare.ParamByName('BGUID').AsString := BuildingGUIDs[buildingCmb.ItemIndex];
        dataDm.qOwnerShare.Open;
        {
        SELECT w.guid, w.name
FROM m_owner w
INNER JOIN m_share s ON s.owner_guid = w.guid
INNER JOIN m_object b ON b.guid = s.object_guid

ORDER BY w.name
        }

        dataDm.qShare.Close;
        dataDm.qShare.ParamByName('BGUID').AsString := BuildingGUIDs[buildingCmb.ItemIndex];
        dataDm.qShare.Open;
      end;
    end;
  end;
  if (Sender is TAction)
  then begin
    if (Sender as TAction) = actCORExit
    then Close;
    if (Sender as TAction) = actLIBHouses
    then begin
      ShowBuildingList;
      LoadBuildingComboBox;
    end;
    if (Sender as TAction) = actVIWObjects
    then begin
      objectsFrame.LoadData();
      pclMain.ActivePage := tshObjects;
    end;
    if (Sender as TAction) = actVIWOwners
    then begin
      // вкладка СОБСТВЕННИКИ
      //frameMEMOwners.LoadData('');
      pclMain.ActivePage := tshOwners;
    end;
    if (Sender as TAction) = actVIWShares
    then begin
      shareFrame.LoadData();
      pclMain.ActivePage := tshShares;
    end;
  end;
end;

end.
