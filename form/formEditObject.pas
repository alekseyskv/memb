unit formEditObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CORRec, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, DB, MemDS, DBAccess, dxStatusBar, StdCtrls,
  Buttons, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, cxCalendar, cxCalc,
  ActnList, dxBar, cxDropDownEdit, Uni, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo;

type
  TIds = array of Integer;
  TeditObjectForm = class(TfrmCORRec)
    lblName: TLabel;
    Label1: TLabel;
    dbgList: TcxGrid;
    dbgListView: TcxGridDBTableView;
    dbgListLevel: TcxGridLevel;
    qAreas: TUniQuery;
    lblDateBeg: TLabel;
    lblDateEnd: TLabel;
    lblObjectName: TLabel;
    lblDescr: TLabel;
    dsAreas: TUniDataSource;
    qAreasbegin_date: TDateField;
    qAreasarea: TFloatField;
    objectTypeCmb: TcxDBLookupComboBox;
    objectNameEdt: TcxDBTextEdit;
    startDateEdt: TcxDBDateEdit;
    finishDateEdt: TcxDBDateEdit;
    qRecguid: TWideStringField;
    qRectype_id: TIntegerField;
    qRecname: TWideStringField;
    qRecstart_date: TDateField;
    qRecfinish_date: TDateField;
    qRecdescription: TWideMemoField;
    qRecbuilding_guid: TWideStringField;
    objectDescriptionMemo: TcxDBMemo;
    qAreasguid: TWideStringField;
    qAreasobject_guid: TWideStringField;
    dbgListViewbegin_date: TcxGridDBColumn;
    dbgListViewarea: TcxGridDBColumn;
    dbgListViewguid: TcxGridDBColumn;
    dbgListViewobject_guid: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure qRecAfterInsert(DataSet: TDataSet);
  private
    procedure LoadObjects;
    procedure LoadAreas;
  public
    procedure LoadedRec; override;
    procedure SaveRec; override;
  end;

var
  editObjectForm: TeditObjectForm;

function objectAdd(): Integer;
function objectEdit(AGUID: String): Integer;
function objectDelete(AGUID: String): Integer;

implementation

uses CORLoggerLib, CORLogicLib, CORDialogLib, dmCon, dmData, MEMDataModule;

{$R *.dfm}

function objectAdd(): Integer;
begin
  Result := mrCancel;
  editObjectForm := TeditObjectForm.Create(nil);
  try
    editObjectForm.LoadObjects;
    editObjectForm.qRec.Open;
    editObjectForm.qRec.Insert;
    if editObjectForm.ShowModal = mrOk then
    begin
      editObjectForm.qRec.Post;
      Result := mrOk;
    end
    else editObjectForm.qRec.Cancel;
  finally
    editObjectForm.Free;
  end;
end;

function objectEdit(AGUID: String): Integer;
begin
  Result := mrCancel;
  editObjectForm := TeditObjectForm.Create(nil);
  try
    editObjectForm.LoadObjects;
    editObjectForm.LoadAreas;
    editObjectForm.qRec.Open;
    editObjectForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]);
    editObjectForm.qRec.Edit;
    if editObjectForm.ShowModal = mrOk then
    begin
      editObjectForm.qRec.Post;
      Result := mrOk;
    end
    else editObjectForm.qRec.Cancel;
  finally
    editObjectForm.Free;
  end;
end;

function objectDelete(AGUID: String): Integer;
begin
  Result := mrCancel;
  editObjectForm := TeditObjectForm.Create(nil);
  try
    editObjectForm.qRec.Open;
    if editObjectForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]) then
    begin
      if MBox('Удалить объект "' + editObjectForm.qRec.FieldByName('name').AsString + '"?', '', mtConfirmation) = mrYes then
      begin
        editObjectForm.qRec.Delete;
        Result := mrOk;
      end
      else editObjectForm.qRec.Cancel;
    end;
//MBox('Невозожно удалить объект', CoreErrorText, mtError)
  finally
    editObjectForm.Free;
  end;
end;

{ TfrmMEMObjectInfo }

procedure TeditObjectForm.FormCreate(Sender: TObject);
var
  NField: TField;
begin
  inherited;
end;

procedure TeditObjectForm.LoadObjects;
begin
  LogDebug(ClassName, '[LoadObjects] Start');
  try
    dataDm.qObjectTypes.Close;
    dataDm.qObjectTypes.Open;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadObjects] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
    end;
  end;
  LogDebug(ClassName, '[LoadObjects] Finish');
end;

procedure TeditObjectForm.qRecAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('building_guid').AsString := Logic.HouseGUID
end;

procedure TeditObjectForm.LoadedRec;
var
  Index: Integer;
begin
  LogDebug(ClassName, '[LoadedRec] Start');

  LogDebug(ClassName, '[LoadedRec] Finish');
end;

procedure TeditObjectForm.LoadAreas;
begin
  LogDebug(ClassName, '[LoadAreas] Start');
  try
    qAreas.Close;
    qAreas.Open;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadAreas] Error: ' + E.Message;
      LogDebug(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
    end;
  end;
  LogDebug(ClassName, '[LoadAreas] Finish');
end;

procedure TeditObjectForm.SaveRec;
var
  NCheck: Boolean;
  NDateBeg: TDate;
  NDateEnd: TDate;
begin
  LogDebug(ClassName, '[SaveRec] Start');
  NCheck := True;
 { if NCheck then begin
    NCheck := cbxObjectName.ItemIndex <> -1;
    if not NCheck then MBox('Поле "Тип объекта" должно иметь значение', '', mtWarning);
  end;
  if NCheck then begin
    edtName.Text := Trim(edtName.Text);
    NCheck := edtName.Text <> '';
    if not NCheck then MBox('Поле "Название" должно иметь значение', '', mtWarning);
  end;
  if NCheck then begin
    if GUID = '' then GUID := connectDm.CORGenGUID;
    if edtDateBeg.EditValue = Null then NDateBeg := 0 else NDateBeg := edtDateBeg.Date;
    if edtDateEnd.EditValue = Null then NDateEnd := 0 else NDateEnd := edtDateEnd.Date;
    if dmMEM.MEMObjectSave(GUID, ObjectIds[cbxObjectName.ItemIndex], edtName.Text, NDateBeg,
      NDateEnd, edtDescr.Text) <> mrOk
    then MBox('Невозможно сохранить объект', CoreErrorText, mtError)
    else begin
      dmMEM.MEMAreaDrop(GUID);
      mdtAreas.First;
      while not mdtAreas.Eof do
      begin
        dmMEM.MEMAreaSave(connectDm.CORGenGUID, GUID, mdtAreas.FieldByName('DateBeg').AsDateTime, mdtAreas.FieldByName('Area').AsFloat);
        mdtAreas.Next;
      end;
      ModalResult := mrOk;
    end;
  end; }
  LogDebug(ClassName, '[SaveRec] Finish');
end;

end.
