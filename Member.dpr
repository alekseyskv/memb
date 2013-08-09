program Member;

uses
  Forms,
  dmCon in 'dm\dmCon.pas' {connectDm: TDataModule},
  dmData in 'dm\dmData.pas' {dataDm: TDataModule},
  formMain in 'form\formMain.pas' {mainFrm},
  CORLoggerLib in 'core\CORLoggerLib.pas',
  CORIniLib in 'core\CORIniLib.pas',
  CORDialogLib in 'core\CORDialogLib.pas' {frmCORDialog},
  CORLogicLib in 'core\CORLogicLib.pas',
  frameObjects in 'frame\frameObjects.pas' {objectsFrame: TFrame},
  CORRec in 'core\CORRec.pas' {frmCORRec},
  formEditObject in 'form\formEditObject.pas' {editObjectForm},
  MEMDataModule in 'MEMDataModule.pas' {dmMEM: TDataModule},
  frameOwners in 'frame\frameOwners.pas' {ownersFrame: TFrame},
  formEditOwner in 'form\formEditOwner.pas' {editOwnerForm},
  frameShare in 'frame\frameShare.pas' {shareFrame: TFrame},
  formEditShare in 'form\formEditShare.pas' {editShareForm},
  CORList in 'core\CORList.pas' {frmCORList},
  formEditBuilding in 'form\formEditBuilding.pas' {editBuildingForm},
  config in 'unit\config.pas',
  DBfunc in 'unit\DBfunc.pas' {$R *.res},
  formBuildList in 'form\formBuildList.pas' {buildListForm},
  SQLite3 in 'unit\SQLite3.pas',
  formAbout in 'form\formAbout.pas' {aboutFrm},
  common in 'unit\common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Реестр членов ТСЖ';
  Application.CreateForm(TconnectDm, connectDm);
  Application.CreateForm(TdataDm, dataDm);
  Application.CreateForm(TdmMEM, dmMEM);
  Application.CreateForm(TmainFrm, mainFrm);
  Application.Run;
end.
