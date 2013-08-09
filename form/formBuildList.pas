unit formBuildList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CORList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, DBAccess, Uni, MemDS,
  Vcl.Menus, Vcl.ImgList, dxBar, cxClasses, Vcl.ActnList, Vcl.StdCtrls,
  Vcl.Buttons, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, dxStatusBar;

type
  TbuildListForm = class(TfrmCORList)
    qDataguid: TWideStringField;
    qDatais_active: TBooleanField;
    qDataorganization_name: TWideStringField;
    dbgListViewguid: TcxGridDBColumn;
    dbgListViewname: TcxGridDBColumn;
    dbgListViewis_active: TcxGridDBColumn;
    dbgListVieworganization_name: TcxGridDBColumn;
    qDataname: TWideStringField;
    procedure PEvents(Sender: TObject);
    procedure dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buildListForm: TbuildListForm;

  procedure ShowBuildingList();

implementation

uses formEditBuilding;

{$R *.dfm}


procedure ShowBuildingList();
begin
  buildListForm := TbuildListForm.Create(nil);
  try
    buildListForm.LoadData();
    buildListForm.ShowModal;
  finally
    buildListForm.Free;
  end;
end;

procedure TbuildListForm.dbgListViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  actView: TAction;
  NGUID: String;
begin
  NGUID := qData.FieldByName('GUID').AsString;
  if buildingEdit(NGUID) = mrOk
  then LoadData();
end;

procedure TbuildListForm.PEvents(Sender: TObject);
var
  NGUID: String;
begin
  inherited;
  if (Sender is TAction)
  then begin
    // Создать
    if (Sender as TAction) = actInsert
    then begin
      NGUID := '';
      if buildingAdd() = mrOk
      then LoadData();
    end;
    // Редактировать
    if (Sender as TAction) = actEdit
    then begin
      NGUID := qData.FieldByName('GUID').AsString;
      if buildingEdit(NGUID) = mrOk
      then LoadData();
    end;
    // Просмотреть
    if (Sender as TAction) = actView
    then begin
      NGUID := qData.FieldByName('GUID').AsString;
      if buildingEdit(NGUID) = mrOk
      then LoadData();
    end;
  end;
end;

end.
