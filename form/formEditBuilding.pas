unit formEditBuilding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CORRec, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, DB, MemDS,
  DBAccess, dxStatusBar, StdCtrls, Buttons, cxContainer, cxEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Uni, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TIds = array of Integer;
  TeditBuildingForm = class(TfrmCORRec)
    lblName: TLabel;
    lblControlName: TLabel;
    lblAddress: TLabel;
    typeDBCombo: TcxDBLookupComboBox;
    qRecguid: TWideStringField;
    qRecname: TWideStringField;
    qRecaddress: TWideStringField;
    qRecis_active: TBooleanField;
    qRecorganization_id: TIntegerField;
    nameDBEdit: TcxDBTextEdit;
    addressDBEdit: TcxDBTextEdit;
    isActiveDBCheck: TcxDBCheckBox;
  private
    procedure LoadControls;
  public
//    procedure LoadedRec; override;
    procedure SaveRec; override;
  end;

var
  editBuildingForm: TeditBuildingForm;

function buildingAdd(): Integer;
function buildingEdit(var AGUID: String): Integer;
function buildingDelete(const AGUID, AName: String): Integer;

implementation

uses dmCon, dmData, CORLoggerLib, CORDialogLib, CORLogicLib, MEMDataModule;

{$R *.dfm}

function buildingAdd(): Integer;
begin
  Result := mrCancel;
  editBuildingForm := TeditBuildingForm.Create(nil);
  try
    editBuildingForm.qRec.Open;
    editBuildingForm.qRec.Insert;
    editBuildingForm.qRec.FieldByName('is_active').AsBoolean := false;
    if editBuildingForm.ShowModal = mrOk then
    begin
      editBuildingForm.qRec.Post;
      Result := mrOk;
    end
    else editBuildingForm.qRec.Cancel;
  finally
    editBuildingForm.Free;
  end;
end;

function buildingEdit(var AGUID: String): Integer;
begin
  Result := mrCancel;
  editBuildingForm := TeditBuildingForm.Create(nil);
  try
    editBuildingForm.GUID := AGUID;
    editBuildingForm.qRec.Open;
    editBuildingForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]);
    editBuildingForm.qRec.Edit;
    if editBuildingForm.ShowModal = mrOk then
    begin
      editBuildingForm.qRec.Post;
      Result := mrOk;
    end
    else editBuildingForm.qRec.Cancel;
  finally
    editBuildingForm.Free;
  end;
end;

function buildingDelete(const AGUID, AName: String): Integer;
begin
  Result := mrCancel;
  if MBox('Удалить дом "' + AName + '"?', '', mtConfirmation) = mrYes
  then begin
    if dmMEM.OBJHouseDrop(AGUID) <> mrOk
    then MBox('Невозожно удалить дом', CoreErrorText, mtError)
    else Result := mrOk;
  end;
end;

{ TfrmOBJHouseInfo }

procedure TeditBuildingForm.LoadControls;
begin
  LogDebug(ClassName, '[LoadControls] Start');
  LogDebug(ClassName, '[LoadControls] Finish');
end;
  {
procedure TeditBuildingForm.LoadedRec;
var
  Index: Integer;
begin
  LogDebug(ClassName, '[LoadedRec] Start');
  qRec.Open;
  qRec.Locate('guid', self.GUID, [loCaseInsensitive]);
  LogDebug(ClassName, '[LoadedRec] Finish');
end; }

procedure TeditBuildingForm.SaveRec;
begin
  LogDebug(ClassName, '[SaveRec] Start');
  qRec.Post;
  ModalResult := mrOk;
  LogDebug(ClassName, '[SaveRec] Finish');
end;

end.
