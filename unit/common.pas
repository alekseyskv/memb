unit common;

interface

uses
  Classes, SysUtils, SHFolder, IdHashMessageDigest, Windows, Types, StrUtils;

type
  TGUIDs = array of string;

  TCommon = class sealed
  private

  public
    class function GenerateGuid(): string; static;
    class function GeneratePassword(len: integer): string; static;
    class function ConverDateForSQL(dt: TDateTime): string; static;
    class function ConverDateTimeForSQL(dt: TDateTime): string; static;
    class function MD5(pass: string): string; static;
    class function EncodeSymbols(data: string): string;
    class function GetSpecialFolderPath(folder: integer): string;
    class function GetFileVersion(exePath: string): string;
    class function GetFileSize(FileName: string): Integer;
    class function compareVersions(fromDB: string; fromFile: string): boolean;
    //class function CreateTableStructure : boolean; static;
  end;

implementation

class function TCommon.GenerateGuid : string;
var
  guid: TGUID;
begin
  CreateGUID(guid);
  Result := GUIDToString(guid);
  Result := StringReplace(Result, '{', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll, rfIgnoreCase]);
end;

class function TCommon.GeneratePassword(len: integer) : string;
const
  s = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i: integer;
begin
  for i:=1 to len do
    Result := Result + s[random(length(s))+1];
end;

class function TCommon.ConverDateForSQL(dt: TDateTime) : string;
begin
  DateTimeToString(Result, 'yyyy-mm-dd', dt);
end;

class function TCommon.ConverDateTimeForSQL(dt: TDateTime) : string;
begin
  DateTimeToString(Result, 'yyyy-mm-dd hh:mm:ss', dt);
end;

class function TCommon.MD5(pass: string) : string;
var
  md5indy: TIdHashMessageDigest;
  HEXhash: string;
begin
  md5indy := TIdHashMessageDigest5.Create;
  HEXhash := md5indy.HashStringAsHex(pass);
  Result := HEXhash; // 32 символа
end;

class function TCommon.EncodeSymbols(data: string): string;
begin
  Result := StringReplace(data, #34, #34#34, [rfReplaceAll]); // "
//  Result := StringReplace(data, #39, #39#39, [rfReplaceAll]); // '
end;

class function TCommon.GetSpecialFolderPath(folder: integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := path
  else
    Result := '';
end;

class function TCommon.GetFileSize(FileName: string): Integer;
var
  FS: TFilestream;
begin
  try
    FS := TFilestream.Create(Filename, fmShareDenyRead);
  except
    Result := -1;
  end;
  if Result <> -1 then Result := FS.Size;
  FS.Free;
end;

class function TCommon.GetFileVersion(exePath: string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(exePath), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(exePath), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

class function TCommon.compareVersions(fromDB: string; fromFile: string): boolean;
var
  i: integer;
  exeVersFromDB: TStringDynArray;
  exeVers: TStringDynArray;
  intFile: integer;
  intDB: integer;
begin
  exeVersFromDB := SplitString(fromDB, '.');
  exeVers := SplitString(fromFile, '.');
  Result := true;
  for i := 0 to Length(exeVers) - 1 do
  begin
    intFile := StrToInt(exeVers[i]);
    intDB := StrToInt(exeVersFromDB[i]);
    if intFile > intDB then
    begin
      Result := false;
      exit;
    end;
  end;
end;
 {
class function TCommon.GetFileVersion(exePath: string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(exePath), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(exePath), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;
   }

{
class function TCommon.CreateTableStructure : boolean;
var
  slDBpath: string;
  sldb: TSQLiteDatabase;
  sltb: TSQLIteTable;
  sSQL: String;
begin
  Result := false;

  slDBPath := ExtractFilepath(application.exename) + 'LawMatic.db';
  sldb := TSQLiteDatabase.Create(slDBPath);

  try
//----------------------------------------------------------------------------//
    if sldb.TableExists('lm_users') then
    begin
      sSQL := 'DROP TABLE lm_users';
      sldb.execsql(sSQL);
    end;

    sSQL := 'CREATE TABLE lm_users (' +
      'guid VARCHAR(36) NOT NULL, ' +
      'id INTEGER PRIMARY KEY, ' +
      'login VARCHAR(50), ' +
      'password VARCHAR(50), ' +
      'name VARCHAR(255), ' +
      'role VARCHAR(50));';
    sldb.execsql(sSQL);

    sSQL := 'CREATE INDEX lm_users_name ON lm_users(name);';
    sldb.execsql(sSQL);
//----------------------------------------------------------------------------//
    if sldb.TableExists('lm_cases') then
    begin
      sSQL := 'DROP TABLE lm_cases';
      sldb.execsql(sSQL);
    end;

    sSQL := 'CREATE TABLE lm_cases (' +
      'guid VARCHAR(36) PRIMARY KEY, ' +
      'append_user VARCHAR(36), ' +
      'append_date VARCHAR(19), ' +
      'title TEXT, ' +
      'description TEXT);';
    sldb.execsql(sSQL);

    sSQL := 'CREATE INDEX lm_cases_title ON lm_cases(title);';
    sldb.execsql(sSQL);
//----------------------------------------------------------------------------//
    if sldb.TableExists('lm_agents') then
    begin
      sSQL := 'DROP TABLE lm_agents';
      sldb.execsql(sSQL);
    end;

    sSQL := 'CREATE TABLE lm_agents (' +
      'guid VARCHAR(36) PRIMARY KEY, ' +
      'name VARCHAR(255), ' +
      'type VARCHAR(50), ' +
      'phone VARCHAR(50), ' +
      'email VARCHAR(50), ' +
      'append_user VARCHAR(36), ' +
      'append_date VARCHAR(19));';
    sldb.execsql(sSQL);
    sSQL := 'CREATE INDEX lm_agents_name ON lm_agents(name);';
    sldb.execsql(sSQL);
//----------------------------------------------------------------------------//

  finally
    sldb.Free;
    Result := true;
  end;

end;
}
end.
