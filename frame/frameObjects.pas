unit frameObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ActnList, dxBar, cxClasses, DB, MemDS, DBAccess, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, ExtCtrls, cxCalc, Grids, DBGrids, cxCalendar, Uni,
  Vcl.Menus;

type
  TobjectsFrame = class(TFrame)
    bmnObjects: TdxBarManager;
    bmnObjectsBar: TdxBar;
    mniAdd: TdxBarButton;
    pnlList: TPanel;
    dbgList: TcxGrid;
    dbgListView: TcxGridDBTableView;
    dbgListLevel: TcxGridLevel;
    mniEdit: TdxBarButton;
    mniDel: TdxBarButton;
    pnlOwners: TPanel;
    dbgData: TcxGrid;
    dbgDataView: TcxGridDBTableView;
    dbgDataLevel: TcxGridLevel;
    dbgListViewname: TcxGridDBColumn;
    dbgListViewstart_date: TcxGridDBColumn;
    dbgListViewfinish_date: TcxGridDBColumn;
    dbgListViewarea: TcxGridDBColumn;
    dbgDataViewowner_guid: TcxGridDBColumn;
    dbgDataViewstart_date: TcxGridDBColumn;
    dbgDataViewfinish_date: TcxGridDBColumn;
    dbgDataViewshare: TcxGridDBColumn;
    dbgDataViewowner_name: TcxGridDBColumn;
    dbgDataViewshare_area: TcxGridDBColumn;
    aclObject: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    ObjectsPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure PEvents(Sender: TObject);
    procedure PScroll(DataSet: TDataSet);
    procedure dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure ObjAdd;
    procedure ObjEdit;
    procedure ObjDel;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure LoadData();
    procedure LoadOwners;
  end;

implementation

uses CORLoggerLib, formEditObject, dmCon, dmData, formMain;

{$R *.dfm}

{ TframeMEMObjects }

procedure TobjectsFrame.AfterConstruction;
begin
  LogDebug(ClassName, 'Frame created');
end;

procedure TobjectsFrame.BeforeDestruction;
begin
  LogDebug(ClassName, 'Frame destroyed');
end;

procedure TobjectsFrame.dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ObjEdit;
end;

procedure TobjectsFrame.LoadData();
var
  NGUID: String;
begin
  LogDebug(ClassName, '[LoadData] Start');
  dataDm.qObjects.Close;
  dataDm.qObjects.Open;

  dataDm.qObjectOwnres.Close;
  dataDm.qObjectOwnres.Open;
  LogDebug(ClassName, '[LoadData] Finish');
end;

procedure TobjectsFrame.LoadOwners;
begin
  LogDebug(ClassName, '[LoadOwners] Start');
  LogDebug(ClassName, '[LoadOwners] Finish');
end;

procedure TobjectsFrame.PScroll(DataSet: TDataSet);
begin
  LoadOwners;
end;

procedure TobjectsFrame.PEvents(Sender: TObject);
begin
  if (Sender is TAction)
  then begin
    if (Sender as TAction) = actAdd
    then ObjAdd;
    if (Sender as TAction) = actEdit
    then ObjEdit;
    if (Sender as TAction) = actDel
    then ObjDel;
  end;
end;

procedure TobjectsFrame.ObjAdd;
begin
  LogDebug(ClassName, '[ObjAdd] Start');
  if objectAdd() = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjAdd] Finish');
end;

procedure TobjectsFrame.ObjEdit;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ObjEdit] Start');
  NGUID := dataDm.qObjects.FieldByName('GUID').AsString;
  if objectEdit(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjEdit] Finish');
end;

procedure TobjectsFrame.ObjDel;
var
  NGUID: String;
begin
  LogDebug(ClassName, '[ObjDel] Start');
  NGUID := dataDm.qObjects.FieldByName('GUID').AsString;
  if objectDelete(NGUID) = mrOk
  then LoadData();
  LogDebug(ClassName, '[ObjDel] Finish');
end;

end.
