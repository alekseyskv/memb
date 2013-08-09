unit CORList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ExtCtrls, DB, MemDS, DBAccess, Menus,
  cxGraphics, cxControls, dxStatusBar, dxBar, cxClasses, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGrid,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  StdCtrls, Buttons, cxLookAndFeels, cxLookAndFeelPainters, Uni;

type
  TfrmCORList = class(TForm)
    sbrList: TdxStatusBar;
    aclList: TActionList;
    bmnList: TdxBarManager;
    bmnRecord: TdxBar;
    pnlData: TPanel;
    imlList: TcxImageList;
    actView: TAction;
    btnView: TdxBarButton;
    pmnList: TPopupMenu;
    mniView: TMenuItem;
    dbgListView: TcxGridDBTableView;
    dbgListLevel: TcxGridLevel;
    dbgList: TcxGrid;
    pnlButtons: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    qData: TUniQuery;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    mniInsert: TMenuItem;
    mniEdit: TMenuItem;
    mniDelete: TMenuItem;
    btnInsert: TdxBarButton;
    btnEdit: TdxBarButton;
    btnDelete: TdxBarButton;
    dsData: TUniDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PEvents(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure LoadParams; virtual;
    procedure AfterLoad; virtual;
  private
    FTimeCreate: TDateTime;
    FSelect: Boolean;
    FGUID: String;
    FShortName: String;
  public
    property Select: Boolean read FSelect write FSelect;
    property GUID: String read FGUID write FGUID;
    property ShortName: String read FShortName write FShortName;
    procedure LoadData();
    procedure SaveData; virtual;
    procedure CancelData; virtual;
  end;

var
  frmCORList: TfrmCORList;

implementation

uses CORLoggerLib, dmCon, CORDialogLib;

{$R *.dfm}

procedure TfrmCORList.FormCreate(Sender: TObject);
begin
  FTimeCreate := Now;
  FSelect := False;
  LogDebug(ClassName, 'Form created');
end;

procedure TfrmCORList.FormShow(Sender: TObject);
begin
  sbrList.Panels[0].Text := llCreateTime + ' ' + FormatDateTime('hh:nn:ss.zzz', Now - FTimeCreate);
  LogDebug(ClassName, 'Form displayed');
end;

procedure TfrmCORList.FormDestroy(Sender: TObject);
begin
  LogDebug(ClassName, 'Form destroyed');
end;

procedure TfrmCORList.LoadParams;
begin
  // no actions
end;

procedure TfrmCORList.AfterLoad;
begin
  // no actions
end;

procedure TfrmCORList.LoadData();
var
  NGUID: String;
begin
  LogDebug(ClassName, '[LoadData] Start');
  try
    LoadParams;
    qData.Close;
    qData.Open;
    sbrList.Panels[1].Text := llRecordCount + IntToStr(qData.RecordCount);
    actInsert.Visible := not FSelect;
    actEdit.Enabled := qData.RecordCount > 0;
    actEdit.Visible := not FSelect;
    actView.Enabled := qData.RecordCount > 0;
    actDelete.Enabled := qData.RecordCount > 0;
    actDelete.Visible := not FSelect;
    btnOk.Enabled := qData.RecordCount > 0;
    pnlButtons.Visible := FSelect;
    AfterLoad;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadData] Error: ' + E.Message;
      LogDebug(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
    end;
  end;
  LogDebug(ClassName, '[LoadData] Finish');
end;

procedure TfrmCORList.PEvents(Sender: TObject);
begin
  if (Sender is TBitBtn)
  then begin
    if (Sender as TBitBtn) = btnOk
    then SaveData;
    if (Sender as TBitBtn) = btnCancel
    then CancelData;
  end;

  if (Sender as TAction) = actDelete
  then
  begin
    if not (dbgListView.Controller.FocusedRowIndex < 0) then
    begin
      if MBox('Удалить запись "' + qData.FieldByName('name').AsString + '"?', '', mtConfirmation) = mrYes then
      begin
        dbgListView.Controller.DeleteSelection;
        LoadData();
      end;
    end;
  end;
end;

procedure TfrmCORList.SaveData;
begin
  // no actions
end;

procedure TfrmCORList.CancelData;
begin
  ModalResult := mrCancel;
end;

end.
