unit formAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, cxImage, ShellApi, dxSkinsCore,
  dxSkinSevenClassic;

type
  TaboutFrm = class(TForm)
    cancelBtn: TcxButton;
    Panel1: TPanel;
    versLbl: TcxLabel;
    progLbl: TcxLabel;
    companyLbl: TcxLabel;
    logoImg: TImage;
    urlLbl: TcxLabel;
    procedure urlLblClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); //overload;
  end;

var
  aboutFrm: TaboutFrm;

implementation

uses
   common, config;

{$R *.dfm}

constructor TaboutFrm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  progLbl.Caption := ProgramName;
  versLbl.Caption := 'Версия: ' + TCommon.GetFileVersion(Application.ExeName);
  companyLbl.Caption := '© 2013 ' + CompanyName;
  urlLbl.Caption := 'www.lawmatic.ru';
end;

procedure TaboutFrm.urlLblClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('http://www.lawmatic.ru/'), nil, nil, SW_SHOW);
end;

end.
