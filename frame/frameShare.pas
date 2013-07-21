unit frameShare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, MemDS, DBAccess, dxBar, cxClasses, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, ExtCtrls, cxCalendar, cxCalc, Uni,
  cxDBLookupComboBox;

type
  TshareFrame = class(TFrame)
    aclObjects: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    bmnObjects: TdxBarManager;
    bmnObjectsBar: TdxBar;
    mniAdd: TdxBarButton;
    mniEdit: TdxBarButton;
    mniDel: TdxBarButton;
    dsList: TDataSource;
    qList: TUniQuery;
    pnlList: TPanel;
    dbgList: TcxGrid;
    dbgListView: TcxGridDBTableView;
    dbgListLevel: TcxGridLevel;
    dbgListViewguid: TcxGridDBColumn;
    dbgListViewobject_guid: TcxGridDBColumn;
    dbgListViewowner_guid: TcxGridDBColumn;
    dbgListViewstart_date: TcxGridDBColumn;
    dbgListViewfinish_date: TcxGridDBColumn;
    dbgListViewshare: TcxGridDBColumn;
    dbgListViewarea: TcxGridDBColumn;
    dbgListViewshare_area: TcxGridDBColumn;
    procedure PEvents(Sender: TObject);
  private
    procedure ShareAdd;
    procedure ShareEdit;
    procedure ShareDel;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure LoadData();
  end;

implementation

uses dmCon, dmData, CORLoggerLib, formEditShare;

{$R *.dfm}

{ TframeMEMShares }

procedure TshareFrame.AfterConstruction;
begin
  LogDebug(ClassName, 'Frame created');
  LoadData();
end;

procedure TshareFrame.BeforeDestruction;
begin
  LogDebug(ClassName, 'Frame destroyed');
end;

procedure TshareFrame.LoadData();
begin
  LogDebug(ClassName, '[LoadData] Start');
  dataDm.qObjectCmbList.Close;
  dataDm.qObjectCmbList.Open;

  dataDm.qOwnerCmbList.Close;
  dataDm.qOwnerCmbList.Open;

  dataDm.qShare.Close;
  dataDm.qShare.Open;
  LogDebug(ClassName, '[LoadData] Finish');
end;

procedure TshareFrame.PEvents(Sender: TObject);
begin
  if (Sender is TAction)
  then begin
    if (Sender as TAction) = actAdd
    then ShareAdd;
    if (Sender as TAction) = actEdit
    then ShareEdit;
    if (Sender as TAction) = actDel
    then ShareDel;
  end;
end;

procedure TshareFrame.ShareAdd;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ObjectAdd] Start');
  NGUID := '';
  if addShare() = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjectAdd] Finish');
end;

procedure TshareFrame.ShareEdit;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ObjectEdit] Start');
  NGUID := dataDm.qShare.FieldByName('GUID').AsString;
  if editShare(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjectEdit] Finish');
end;

procedure TshareFrame.ShareDel;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ShareDel] Start');
  NGUID := dataDm.qShare.FieldByName('GUID').AsString;
  if deleteShare(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[ShareDel] Finish');
end;

end.
