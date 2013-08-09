unit CORDialogLib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls, Buttons, cxGraphics;

type
  TRecAction = (reaInsert, reaChild, reaEdit, reaView, reaDelete, reaClone);

const
  RecActionName: array [Low(TRecAction)..High(TRecAction)] of String =
    ('Добавление записи', 'Добавление дочерней записи', 'Изменение записи', 'Просмотр записи',
     'Удаление записи', 'Дублирование записи');
  EventNames: array [Low(TMsgDlgType)..High(TMsgDlgType)] of String =
    ('Предупреждение', 'Ошибка приложения', 'Информация', 'Подтверждение', 'Ошибка доступа');

const
  HeightMin = 159;
  HeightMax = 339;

const
  llRecordIdent    = 'Идентификатор записи:';
  llCreateTime     = 'Время создания: ';
  llLoadData       = 'Загрузка данных';
  llRecordCount    = 'Количество записей: ';
  lwNoRecords      = 'Нет записей';

type
  TfrmCORDialog = class(TForm)
    btnOne: TBitBtn;
    btnTwo: TBitBtn;
    memError: TMemo;
    imgEvent: TImage;
    imgMain: TImage;
    lblEvent: TLabel;
    lblText: TLabel;
    imlImages1: TImageList;
    imlImages: TcxImageList;
    procedure ExpandInfo(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure FormPrepare(const AText, AComments: String; const ADlgType: TMsgDlgType);
  public
  end;

function MBox(const AText, AComments: String; const ADlgType: TMsgDlgType): Integer;
function MValue(const AText: String): String;
function MSaveError(const AText: String): String;
function MDelError(const AText: String): String;
function MViewDate(const ADate: TDateTime): String;
function MViewDateS(const ADate: TDateTime): String;

implementation

var
  frmCORDialog: TfrmCORDialog;

{$R *.dfm}

function MBox(const AText, AComments: String; const ADlgType: TMsgDlgType): Integer;
begin
  frmCORDialog := TfrmCORDialog.Create(nil);
  try
    frmCORDialog.FormPrepare(AText, AComments, ADlgType);
    Result := frmCORDialog.ShowModal;
  finally
    frmCORDialog.Free;
  end;
end;

function MValue(const AText: String): String;
begin
  Result := Format('Field "%s" must have a value!', [AText]);
end;
function MSaveError(const AText: String): String;
begin
  Result := Format('%s has not been saved!', [AText]);
end;
function MDelError(const AText: String): String;
begin
  Result := Format('%s has not been deleted!', [AText]);
end;
function MViewDate(const ADate: TDateTime): String;
begin
  Result := FormatDateTime('dd.mm.yyyy hh:nn:ss', ADate);
end;
function MViewDateS(const ADate: TDateTime): String;
begin
  Result := FormatDateTime('dd.mm.yyyy', ADate);
end;

procedure TfrmCORDialog.FormCreate(Sender: TObject);
begin
  imgEvent.Canvas.FloodFill(0, 0, clWhite, fsSurface);
  imgEvent.Canvas.Brush.Color := clBlack;
  imgEvent.Canvas.Brush.Style := bsClear;
  imgEvent.Canvas.Rectangle(0, 0, imgEvent.Width, imgEvent.Height);
end;

procedure TfrmCORDialog.FormPrepare(const AText, AComments: String; const ADlgType: TMsgDlgType);
begin
  Height := HeightMin;
  Caption := Application.Title;
  lblEvent.Caption := EventNames[ADlgType];
  imlImages.Draw(imgMain.Canvas, 0, 0, Ord(ADlgType));
  lblText.Caption := AText;
  memError.Text := AComments;
  if ADlgType = mtWarning then begin
    btnOne.Visible := False;
    btnTwo.Visible := True;
    btnTwo.Default := True;
    btnTwo.Cancel := True;
    btnTwo.Caption := 'Закрыть';
    btnTwo.ModalResult := mrOk;
    memError.Visible := False;
  end;
  if ADlgType = mtError then begin
    btnOne.Visible := True;
    btnOne.Default := True;
    btnOne.Cancel := True;
    btnOne.Caption := 'Закрыть';
    btnOne.ModalResult := mrOk;
    btnTwo.Visible := True;
    btnTwo.Caption := 'Ошибка >>';
    btnTwo.OnClick := ExpandInfo;
  end;
  if ADlgType = mtInformation then begin
    btnOne.Visible := False;
    btnTwo.Visible := True;
    btnTwo.Default := True;
    btnTwo.Cancel := True;
    btnTwo.Caption := 'Закрыть';
    btnTwo.ModalResult := mrOk;
    memError.Visible := False;
  end;
  if ADlgType = mtConfirmation then begin
    btnOne.Visible := True;
    btnOne.Default := True;
    btnOne.Caption := 'Да';
    btnOne.ModalResult := mrYes;
    btnTwo.Visible := True;
    btnTwo.Cancel := True;
    btnTwo.Caption := 'Нет';
    btnTwo.ModalResult := mrNo;
  end;
  if ADlgType = mtCustom then begin
    btnOne.Visible := True;
    btnOne.Default := True;
    btnOne.Cancel := True;
    btnOne.Caption := 'Закрыть';
    btnOne.ModalResult := mrOk;
    btnTwo.Visible := True;
    btnTwo.Caption := 'Доступ >>';
    btnTwo.OnClick := ExpandInfo;
  end;
end;

procedure TfrmCORDialog.ExpandInfo(Sender: TObject);
begin
  if Height = HeightMin
  then Height := HeightMax
  else Height := HeightMin;
end;

end.
