unit formEditOwner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CORRec, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, DB, MemDS,
  DBAccess, dxStatusBar, StdCtrls, Buttons, cxContainer, cxEdit, cxTextEdit, Uni,
  cxDBEdit;

type
  TeditOwnerForm = class(TfrmCORRec)
    lblName: TLabel;
    ownerNameTextEdt: TcxDBTextEdit;
    qRecguid: TWideStringField;
    qRecname: TWideStringField;
  private
    { Private declarations }
  public
    procedure LoadedRec; override;
    procedure SaveRec; override;
  end;

var
  editOwnerForm: TeditOwnerForm;

function addOwner(): Integer;
function editOwner(AGUID: String): Integer;
function deleteOwner(AGUID: String): Integer;

implementation

uses dmCon, CORLoggerLib, CORDialogLib, MEMDataModule;

{$R *.dfm}

function addOwner(): Integer;
begin
  Result := mrCancel;
  editOwnerForm := TeditOwnerForm.Create(nil);
  try
    editOwnerForm.qRec.Open;
    editOwnerForm.qRec.Insert;
    if editOwnerForm.ShowModal = mrOk then
    begin
      editOwnerForm.qRec.Post;
      Result := mrOk;
    end
    else editOwnerForm.qRec.Cancel;
  finally
    editOwnerForm.Free;
  end;
end;

function editOwner(AGUID: String): Integer;
begin
  Result := mrCancel;
  editOwnerForm := TeditOwnerForm.Create(nil);
  try
    editOwnerForm.GUID := AGUID;
    editOwnerForm.qRec.Open;
    editOwnerForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]);
    editOwnerForm.qRec.Edit;
    if editOwnerForm.ShowModal = mrOk then
    begin
      editOwnerForm.qRec.Post;
      Result := mrOk;
    end
    else editOwnerForm.qRec.Cancel;
  finally
    editOwnerForm.Free;
  end;
end;

function deleteOwner(AGUID: String): Integer;
begin
  Result := mrCancel;
  editOwnerForm := TeditOwnerForm.Create(nil);
  try
    editOwnerForm.qRec.Open;
    if editOwnerForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]) then
    begin
      if MBox('Удалить владельца "' + editOwnerForm.qRec.FieldByName('name').AsString + '"?', '', mtConfirmation) = mrYes then
      begin
        editOwnerForm.qRec.Delete;
        Result := mrOk;
      end
      else editOwnerForm.qRec.Cancel;
    end;
  finally
    editOwnerForm.Free;
  end;
end;


{ TfrmMEMOwnerInfo }

procedure TeditOwnerForm.LoadedRec;
begin
  LogDebug(ClassName, '[LoadedRec] Start');
  LogDebug(ClassName, '[LoadedRec] Finish');
end;

procedure TeditOwnerForm.SaveRec;
var
  NCheck: Boolean;
begin
  LogDebug(ClassName, '[SaveRec] Start');
  NCheck := True;
 { if NCheck then begin
    edtName.Text := Trim(edtName.Text);
    NCheck := edtName.Text <> '';
    if not NCheck then MBox('Поле "Название" должно иметь значение', '', mtWarning);
  end;
  if NCheck then begin
    if GUID = '' then GUID := connectDm.GenGUID;
    if dmMEM.MEMOwnerSave(GUID, edtName.Text) <> mrOk
    then MBox('Невозможно сохранить владельца', CoreErrorText, mtError)
    else ModalResult := mrOk;
  end;}
  LogDebug(ClassName, '[SaveRec] Finish');
end;

end.
