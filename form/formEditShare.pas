unit formEditShare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CORRec, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, DB, MemDS,
  DBAccess, dxStatusBar, StdCtrls, Buttons, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCalc, Uni, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TGUIDs = array of String;
  TeditShareForm = class(TfrmCORRec)
    lblObjName: TLabel;
    lblOwnerName: TLabel;
    lblDateBeg: TLabel;
    lblDateEnd: TLabel;
    lblShare: TLabel;
    objectCmb: TcxDBLookupComboBox;
    ownerCmb: TcxDBLookupComboBox;
    startDateEdt: TcxDBDateEdit;
    finishDateEdt: TcxDBDateEdit;
    qRecguid: TWideStringField;
    qRecobject_guid: TWideStringField;
    qRecowner_guid: TWideStringField;
    qRecstart_date: TDateField;
    qRecfinish_date: TDateField;
    qRecshare: TFloatField;
    shareCalcEdt: TcxDBCalcEdit;
  private
    ObjGUIDs: TGUIDs;
    OwnerGUIDs: TGUIDs;
  public
    procedure LoadComboItems;
    procedure LoadedRec; override;
    procedure SaveRec; override;
  end;

var
  editShareForm: TeditShareForm;

function addShare(): Integer;
function editShare(AGUID: String): Integer;
function deleteShare(AGUID: String): Integer;

implementation

uses dmCon, dmData, CORLoggerLib, CORDialogLib, MEMDataModule;

{$R *.dfm}

function addShare(): Integer;
begin
  Result := mrCancel;
  editShareForm := TeditShareForm.Create(nil);
  try
    editShareForm.LoadComboItems;
    editShareForm.qRec.Open;
    editShareForm.qRec.Insert;
    if editShareForm.ShowModal = mrOk then
    begin
      editShareForm.qRec.Post;
      Result := mrOk;
    end
    else editShareForm.qRec.Cancel;
  finally
    editShareForm.Free;
  end;
end;

function editShare(AGUID: String): Integer;
begin
  Result := mrCancel;
  editShareForm := TeditShareForm.Create(nil);
  try
    editShareForm.LoadComboItems;
    editShareForm.qRec.Open;
    editShareForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]);
    editShareForm.qRec.Edit;
    if editShareForm.ShowModal = mrOk then
    begin
      editShareForm.qRec.Post;
      Result := mrOk;
    end
    else editShareForm.qRec.Cancel;
  finally
    editShareForm.Free;
  end;
end;

function deleteShare(AGUID: String): Integer;
begin
  Result := mrCancel;
  editShareForm := TeditShareForm.Create(nil);
  try
    editShareForm.qRec.Open;
    if editShareForm.qRec.Locate('guid', AGUID, [loCaseInsensitive]) then
    begin
      if MBox('Удалить выбранную запись?', '', mtConfirmation) = mrYes then
      begin
        editShareForm.qRec.Delete;
        Result := mrOk;
      end
      else editShareForm.qRec.Cancel;
    end;
  finally
    editShareForm.Free;
  end;
end;

{ TfrmMEMShareInfo }

procedure TeditShareForm.LoadComboItems;
begin
  LogDebug(ClassName, '[LoadComboItems] Start');
  try
    dataDm.qOwnerCmbList.Close;
    dataDm.qOwnerCmbList.Open;

    dataDm.qObjectCmbList.Close;
    dataDm.qObjectCmbList.Open;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadComboItems] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
    end;
  end;
  LogDebug(ClassName, '[LoadComboItems] Finish');
end;

procedure TeditShareForm.LoadedRec;
var
  Index: Integer;
begin
  LogDebug(ClassName, '[LoadedRec] Start');
  LogDebug(ClassName, '[LoadedRec] Finish');
end;

procedure TeditShareForm.SaveRec;
var
  NCheck: Boolean;
  NDateBeg: TDate;
  NDateEnd: TDate;
begin
  LogDebug(ClassName, '[SaveRec] Start');
  ModalResult := mrOk;
  LogDebug(ClassName, '[SaveRec] Finish');
end;

end.
