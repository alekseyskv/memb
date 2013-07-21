unit config;

interface

uses
  SysUtils, IniFiles, {Common,} SHFolder;

type
  CurrentUser = record
    Guid: string;
    Name: string;
    Role: integer; // 0-суперадмин 1-админ 2-пользователь
  end;

  InputSettings = record
    ActionDate: TDate;
    InputUserGuid: string;
  end;

  IniSettings = record
    LastSynch: TDateTime; // дата последней синхронизации
    AutoInterval: TTime; // автоинтервал между СТАРТОМ и ФИНИШЕМ
    CellAutoHeight: boolean; // высота ячеек по содежимому
    AutoStart: boolean; // интеллектуальная подстановка СТАРТА
    AvailableForClient: boolean;
    IsReady: boolean;
    InCompletedAkt: boolean;
    SynchLogShow: boolean;
    LastLoggedUser: string;
    ServerLink: string;
    ServerLogin: string;
    ServerPassword: string;
    WorkPath: string;
    TotalCmdPath: string;
  end;

{  TUser = class
   private
     fGuid: string;
     fName: string;
     fLogin: string;
   public
     property Guid : string read fGuid;
     property Name : string read fName;
     property Login : string read fLogin;
     constructor Create(const guid : string; const name : string; const login : string) ;
   end;

  TAgent = class
   private
     fGuid: string;
     fName: string;
   public
     property Guid : string read fGuid;
     property Name : string read fName;
     constructor Create(const guid : string; const name : string) ;
   end;
     }
   procedure readIniSettings();
   procedure saveIniSettings();
   procedure saveIniLastSynchronization();
   procedure saveIniLastLoggedUser();
   function readRegKey: string;
   procedure saveRegKey(key: string);
//   procedure setSpecialPath;

var
  appDataPath: string;
  executedActsPath: string;
  curUser: CurrentUser;
  SettingsIni: IniSettings;
  InputData: InputSettings;
  IsRegistered: boolean;

const
  IniFile = 'LawMatic.ini';
  CompanyName = 'Legal Research Laboratory';
  ProgramName = 'LawMatic B1';

implementation

{constructor TUser.Create(const guid : string; const name : string; const login : string);
begin
  fGuid := guid;
  fName := name;
  fLogin := login;
end;

constructor TAgent.Create(const guid : string; const name : string);
begin
  fGuid := guid;
  fName := name;
end;   }

procedure readIniSettings();
var
  iniSettings: TIniFile;
begin
  iniSettings := TIniFile.Create(appDataPath + IniFile);
  SettingsIni.AutoInterval := iniSettings.ReadTime('tasks', 'AutoInterval', EncodeTime(1,0,0,0)); // 1 час по умолчанию
  SettingsIni.AvailableForClient := iniSettings.ReadBool('tasks', 'AvailableForClient', false);
  SettingsIni.IsReady := iniSettings.ReadBool('tasks', 'IsReady', false);
  SettingsIni.InCompletedAkt := iniSettings.ReadBool('tasks', 'InCompletedAkt', false);
  SettingsIni.AutoStart := iniSettings.ReadBool('tasks', 'AutoStart', false); // false по умолчанию
  SettingsIni.CellAutoHeight := iniSettings.ReadBool('system', 'CellAutoHeight', false); // false по умолчанию
  SettingsIni.LastSynch := iniSettings.ReadDateTime('system', 'LastSynchronization', 0);
  SettingsIni.LastLoggedUser := iniSettings.ReadString('system', 'LastLoggedUser', '');
  SettingsIni.ServerLink := iniSettings.ReadString('system', 'ServerLink', '');
  SettingsIni.ServerLogin := iniSettings.ReadString('system', 'ServerLogin', '');
  SettingsIni.ServerPassword := iniSettings.ReadString('system', 'ServerPassword', '');
  SettingsIni.SynchLogShow :=  iniSettings.ReadBool('system', 'SynchLogShow', false);
  //SettingsIni.WorkPath := iniSettings.ReadString('system', 'WorkPath', TCommon.GetSpecialFolderPath(CSIDL_PERSONAL)); // "Мои документы" по умолчанию
  SettingsIni.TotalCmdPath := iniSettings.ReadString('system', 'TotalCmdPath', '');

  iniSettings.Free;
end;

procedure saveIniSettings();
var
  iniSettings: TIniFile;
begin
  iniSettings := TIniFile.Create(appDataPath + IniFile);
  iniSettings.WriteTime('tasks', 'AutoInterval', SettingsIni.AutoInterval);
  iniSettings.WriteBool('tasks', 'AvailableForClient', SettingsIni.AvailableForClient);
  iniSettings.WriteBool('tasks', 'IsReady', SettingsIni.IsReady);
  iniSettings.WriteBool('tasks', 'InCompletedAkt', SettingsIni.InCompletedAkt);
  iniSettings.WriteBool('tasks', 'AutoStart', SettingsIni.AutoStart);
  iniSettings.WriteBool('system', 'CellAutoHeight', SettingsIni.CellAutoHeight);
  iniSettings.WriteString('system', 'ServerLink', SettingsIni.ServerLink);
  iniSettings.WriteString('system', 'ServerLogin', SettingsIni.ServerLogin);
  iniSettings.WriteString('system', 'ServerPassword', SettingsIni.ServerPassword);
  iniSettings.WriteBool('system', 'SynchLogShow', SettingsIni.SynchLogShow);
  iniSettings.WriteString('system', 'WorkPath', SettingsIni.WorkPath);
  iniSettings.WriteString('system', 'TotalCmdPath', SettingsIni.TotalCmdPath);
  iniSettings.Free;
end;

procedure saveIniLastSynchronization();
var
  iniSettings: TIniFile;
begin
  iniSettings := TIniFile.Create(appDataPath + IniFile);
  iniSettings.WriteDateTime('system', 'LastSynchronization', SettingsIni.LastSynch);
  iniSettings.Free;
end;

procedure saveIniLastLoggedUser();
var
  iniSettings: TIniFile;
begin
  iniSettings := TIniFile.Create(appDataPath + IniFile);
  iniSettings.WriteString('system', 'LastLoggedUser', SettingsIni.LastLoggedUser);
  iniSettings.Free;
end;

procedure saveRegKey(key: string);
var
  ini: TInifile;
begin
  ini := TInifile.Create(appDataPath + 'Reg.key');
  ini.WriteString('Key','Key',key);
  ini.Free;
end;

function readRegKey: string;
var
  ini:TInifile;
begin
  ini:=TInifile.Create(appDataPath + 'Reg.key');
  Result:=ini.ReadString('Key','Key','');
  ini.Free;
end;

{
procedure setSpecialPath;
begin
  executedActsPath := TCommon.GetSpecialFolderPath(CSIDL_PERSONAL)+'\'+ProgramName+'\';
  if not DirectoryExists(executedActsPath) then ForceDirectories(executedActsPath);

  appDataPath := TCommon.GetSpecialFolderPath(CSIDL_APPDATA)+'\'+ProgramName+'\';
  if not DirectoryExists(appDataPath) then ForceDirectories(appDataPath);
end;}

end.
