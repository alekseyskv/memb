unit formBuildingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CORList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess,
  Menus, ImgList, dxBar, cxClasses, ActnList, StdCtrls, Buttons, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, dxStatusBar,
  cxCheckBox, Uni;

type
  TbuildingListForm = class(TfrmCORList)
    qDataguid: TWideStringField;
    qDatabuilding_name: TWideStringField;
    qDatais_active: TBooleanField;
    qDataorganization_name: TWideStringField;
    dbgListViewbuilding_name: TcxGridDBColumn;
    dbgListViewis_active: TcxGridDBColumn;
    dbgListVieworganization_name: TcxGridDBColumn;
    procedure PEvents(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buildingListForm: TbuildingListForm;

procedure OBJHousesEntry(const AGUID: String);

implementation

uses dmCon, formEditBuilding;

{$R *.dfm}

procedure OBJHousesEntry(const AGUID: String);
begin
  buildingListForm := TbuildingListForm.Create(nil);
  try
    //buildingListForm.GUID := AGUID;
    buildingListForm.LoadData('');
    buildingListForm.qData.Open;
    buildingListForm.ShowModal;
  finally
    buildingListForm.Free;
  end;
end;

procedure TbuildingListForm.PEvents(Sender: TObject);
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
      then LoadData(NGUID);
    end;
    // Редактировать
    if (Sender as TAction) = actEdit
    then begin
      NGUID := qData.FieldByName('GUID').AsString;
      if buildingEdit(NGUID) = mrOk
      then LoadData(NGUID);
    end;
    // Просмотреть
    if (Sender as TAction) = actView
    then begin
      NGUID := qData.FieldByName('GUID').AsString;
      if buildingEdit(NGUID) = mrOk
      then LoadData(NGUID);
    end;
    // Удалить
    if (Sender as TAction) = actDelete
    then begin
      NGUID := qData.FieldByName('GUID').AsString;
      if buildingDelete(NGUID, qData.FieldByName('Name').AsString) = mrOk
      then LoadData('');
    end;
  end;
end;

end.
