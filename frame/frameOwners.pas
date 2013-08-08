unit frameOwners;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls, MemDS,
  DBAccess, dxBar, ActnList, cxCalendar, cxCalc, Uni, cxDBLookupComboBox,
  Vcl.Menus;

type
  TownersFrame = class(TFrame)
    aclObjects: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    bmnObjects: TdxBarManager;
    bmnObjectsBar: TdxBar;
    mniAdd: TdxBarButton;
    mniEdit: TdxBarButton;
    mniDel: TdxBarButton;
    pnlList: TPanel;
    dbgList: TcxGrid;
    dbgListView: TcxGridDBTableView;
    dbgListLevel: TcxGridLevel;
    pnlOwners: TPanel;
    dbgData: TcxGrid;
    dbgDataView: TcxGridDBTableView;
    dbgDataLevel: TcxGridLevel;
    dbgListViewguid: TcxGridDBColumn;
    dbgListViewname: TcxGridDBColumn;
    dbgDataViewguid: TcxGridDBColumn;
    dbgDataViewobj_guid: TcxGridDBColumn;
    dbgDataViewowner_guid: TcxGridDBColumn;
    dbgDataViewstart_date: TcxGridDBColumn;
    dbgDataViewfinish_date: TcxGridDBColumn;
    dbgDataViewshare: TcxGridDBColumn;
    dbgDataViewshare_area: TcxGridDBColumn;
    OwnersPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure PEvents(Sender: TObject);
    procedure PScroll(DataSet: TDataSet);
    procedure dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure OwnerAdd;
    procedure OwnerEdit;
    procedure OwnerDel;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure LoadData();
    procedure LoadObjects;
  end;

implementation

uses dmCon, dmData, CORLoggerLib, formEditOwner, formMain;

{$R *.dfm}

{ TframeMEMOwners }

procedure TownersFrame.AfterConstruction;
begin
  LogDebug(ClassName, 'Frame created');
  LoadData();
end;

procedure TownersFrame.BeforeDestruction;
begin
  LogDebug(ClassName, 'Frame destroyed');
end;

procedure TownersFrame.dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OwnerEdit;
end;

procedure TownersFrame.LoadData();
begin
  LogDebug(ClassName, '[LoadData] Start');
  dataDm.qObjectCmbList.Close;
  dataDm.qObjectCmbList.Open;

  dataDm.qOwners.Close;
  dataDm.qOwners.Open;
  LogDebug(ClassName, '[LoadData] Finish');
end;

procedure TownersFrame.LoadObjects;
begin
  LogDebug(ClassName, '[LoadObjects] Start');
  LogDebug(ClassName, '[LoadObjects] Finish');
end;

procedure TownersFrame.PScroll(DataSet: TDataSet);
begin
  LoadObjects;
end;

procedure TownersFrame.PEvents(Sender: TObject);
begin
  if (Sender is TAction)
  then begin
    if (Sender as TAction) = actAdd
    then OwnerAdd;
    if (Sender as TAction) = actEdit
    then OwnerEdit;
    if (Sender as TAction) = actDel
    then OwnerDel;
  end;
end;

procedure TownersFrame.OwnerAdd;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ObjectAdd] Start');
  NGUID := '';
  if addOwner() = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjectAdd] Finish');
end;

procedure TownersFrame.OwnerEdit;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[OwnerEdit] Start');
  NGUID := dataDm.qOwners.FieldByName('GUID').AsString;
  if editOwner(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[OwnerEdit] Finish');
end;

procedure TownersFrame.OwnerDel;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[OwnerDel] Start');
  NGUID := dataDm.qOwners.FieldByName('GUID').AsString;
  if deleteOwner(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[OwnerDel] Finish');
end;

end.
