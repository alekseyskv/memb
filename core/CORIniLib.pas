unit CORIniLib;

interface

uses IniFiles, SysUtils, Classes, Forms, Controls;

const
  DATABASE_SECTION = 'DATABASE';
  DATABASE_SERVER  = 'Server';
  DATABASE_PORT    = 'Port';
  DATABASE_USER    = 'User';
  DATABASE_PASS    = 'Pass';
  DATABASE_NAME    = 'Name';
  SETTINGS_SECTION = 'SETTINGS';
  DATE_OPER        = 'DateOper';
  HOUSE_GUID       = 'HouseGUID';

function INIGetFileName: String;
function INIReadString(const ASection, AIdent, ADefault: String): String;
procedure INIWriteString(const ASection, AIdent, AValue: String);
function INIReadInteger(const ASection, AIdent: String; const ADefault: Integer): Integer;
procedure INIWriteInteger(const ASection, AIdent: String; const AValue: Integer);
function INIReadDate(const ASection, AIdent: String; const ADefault: TDate): TDate;
procedure INIWriteDate(const ASection, AIdent: String; const AValue: TDate);

implementation

uses CORLoggerLib;

function INIGetFileName: String;
begin
  Result := ChangeFileExt(ParamStr(0), '.ini');
//  LogDebug('IniLib', '[INIGetFileName] Used ini-file: ' + Result);
end;

function INIReadString(const ASection, AIdent, ADefault: String): String;
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    Result := NIni.ReadString(ASection, AIdent, ADefault);
  finally
    NIni.Free;
  end;
end;

procedure INIWriteString(const ASection, AIdent, AValue: String);
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    NIni.WriteString(ASection, AIdent, AValue);
  finally
    NIni.Free;
  end;
end;

function INIReadInteger(const ASection, AIdent: String; const ADefault: Integer): Integer;
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    Result := NIni.ReadInteger(ASection, AIdent, ADefault);
  finally
    NIni.Free;
  end;
end;

procedure INIWriteInteger(const ASection, AIdent: String; const AValue: Integer);
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    NIni.WriteInteger(ASection, AIdent, AValue);
  finally
    NIni.Free;
  end;
end;

function INIReadDate(const ASection, AIdent: String; const ADefault: TDate): TDate;
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    Result := NIni.ReadDate(ASection, AIdent, ADefault);
  finally
    NIni.Free;
  end;
end;

procedure INIWriteDate(const ASection, AIdent: String; const AValue: TDate);
var
  NIni: TIniFile;
begin
  NIni := TIniFile.Create(INIGetFileName);
  try
    NIni.WriteDate(ASection, AIdent, AValue);
  finally
    NIni.Free;
  end;
end;

end.






