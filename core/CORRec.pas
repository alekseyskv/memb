{*********************************************************************
* Раздел: Ядро (CORE)                                                *
* Модуль: CORRec                                                     *
* Дата редактирования: 17.04.2009 11:02                              *
* Назначение: Шаблон формы редактирования любой записи               *
* Используемые объекты базы данных: Нет                              *
*********************************************************************}

unit CORRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, StdCtrls,
  Buttons, cxGraphics, cxDropDownEdit, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCalc, cxMemo, cxCheckBox, dxStatusBar, CORDialogLib,
  cxCheckListBox, cxListBox, cxGroupBox, cxRadioGroup, dxSkinsCore, dxSkinsdxStatusBarPainter,
  cxLookAndFeels, cxLookAndFeelPainters, MemDS, DBAccess, Uni;

type
  TfrmCORRec = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    sbrRec: TdxStatusBar;
    qRec: TUniQuery;
    dsRec: TUniDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PEvents(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qRecAfterInsert(DataSet: TDataSet);
  protected
    GUID: String;
    Action: TRecAction;
    TimeCreate: TDateTime;
  public
    procedure FormPrepare;
    procedure BeforeLoad; virtual;
    procedure LoadRec;
    procedure LoadedRec; virtual;
    procedure SaveRec; virtual;
  end;

implementation

uses CORLoggerLib, dmCon;

{$R *.dfm}

procedure TfrmCORRec.FormCreate(Sender: TObject);
begin
  TimeCreate := Now;
  LogDebug(ClassName, 'Form created');
end;

procedure TfrmCORRec.FormPrepare;
var
  Index: Integer;
begin
  LogDebug(ClassName, '[FormPrepare] Action: ' + RecActionName[Action]);
  Caption := Caption + ' - ' + RecActionName[Action];
  if Action = reaView
  then begin
    for Index := 0 to ComponentCount - 1 do
    begin
      if (Components[Index] is TcxComboBox)
      then begin
        (Components[Index] as TcxComboBox).Properties.ReadOnly := True;
        (Components[Index] as TcxComboBox).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxCheckBox)
      then begin
        (Components[Index] as TcxCheckBox).Properties.ReadOnly := True;
        (Components[Index] as TcxCheckBox).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxTextEdit)
      then begin
        (Components[Index] as TcxTextEdit).Properties.ReadOnly := True;
        (Components[Index] as TcxTextEdit).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxSpinEdit)
      then begin
        (Components[Index] as TcxSpinEdit).Properties.ReadOnly := True;
        (Components[Index] as TcxSpinEdit).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxCalcEdit)
      then begin
        (Components[Index] as TcxCalcEdit).Properties.ReadOnly := True;
        (Components[Index] as TcxCalcEdit).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxDateEdit)
      then begin
        (Components[Index] as TcxDateEdit).Properties.ReadOnly := True;
        (Components[Index] as TcxDateEdit).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxTimeEdit)
      then begin
        (Components[Index] as TcxTimeEdit).Properties.ReadOnly := True;
        (Components[Index] as TcxTimeEdit).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxMemo)
      then begin
        (Components[Index] as TcxMemo).Properties.ReadOnly := True;
        (Components[Index] as TcxMemo).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxCheckListBox)
      then begin
        (Components[Index] as TcxCheckListBox).ReadOnly := True;
        (Components[Index] as TcxCheckListBox).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxListBox)
      then begin
        (Components[Index] as TcxListBox).ReadOnly := True;
        (Components[Index] as TcxListBox).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TcxRadioGroup)
      then begin
        (Components[Index] as TcxRadioGroup).Properties.ReadOnly := True;
        (Components[Index] as TcxRadioGroup).Style.Color := clBtnFace;
      end;
      if (Components[Index] is TBitBtn)
      then begin
        if (Components[Index] as TBitBtn).Default
        then (Components[Index] as TBitBtn).Enabled := False;
      end;
    end;
  end;
end;

procedure TfrmCORRec.FormShow(Sender: TObject);
begin
  sbrRec.Panels[0].Text := llCreateTime + ' ' + FormatDateTime('hh:nn:ss.zzz', Now - TimeCreate);
  LogDebug(ClassName, 'Form displayed');
end;

procedure TfrmCORRec.FormDestroy(Sender: TObject);
begin
  LogDebug(ClassName, 'Form destroyed');
end;

procedure TfrmCORRec.BeforeLoad;
begin
  // no actions
end;

procedure TfrmCORRec.LoadedRec;
begin
  // no actions
end;

procedure TfrmCORRec.LoadRec;
begin
  LogDebug(ClassName, '[LoadRec] Start');
  try
    BeforeLoad;
    qRec.Open;
    if qRec.Locate('guid', self.GUID, [loCaseInsensitive]) then qRec.Edit;
  except
    on E: Exception do
    begin
      CoreErrorText := '[LoadRec] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
      MBox('Невозможно загрузить данные', CoreErrorText, mtError);
      ModalResult := mrCancel;
    end;
  end;
  LogDebug(ClassName, '[LoadRec] Finish');
end;

procedure TfrmCORRec.PEvents(Sender: TObject);
begin
  if (Sender is TBitBtn)
  then begin
    LogDebug(ClassName, '[PEvents] Sender: ' + (Sender as TBitBtn).Name);
    if (Sender as TBitBtn) = btnOk
    then ModalResult := mrOk;
    if (Sender as TBitBtn) = btnCancel
    then ModalResult := mrCancel;
  end;
end;

procedure TfrmCORRec.qRecAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('guid').AsString := connectDM.GenGUID;
end;

procedure TfrmCORRec.SaveRec;
begin
  // no actions
end;

end.
