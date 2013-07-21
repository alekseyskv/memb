unit dmCon;

interface

uses
  SysUtils, Classes, Controls, Uni, UniProvider, SQLiteUniProvider, DB, DBAccess,
  MySQLUniProvider, SQLServerUniProvider, MemDS;

type
  TconnectDm = class(TDataModule)
    dbServer: TUniConnection;
    SQLServerUniProvider: TSQLServerUniProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function DBConnect: Integer;
    procedure DBDisconnect;
    function GenGUID: String;
  end;

var
  connectDm: TconnectDm;
  CoreErrorText: String;

implementation

uses CORLoggerLib, CORDialogLib, CORLogicLib, dmData;

{$R *.dfm}

{*******************************************************************************
* DataModule creation                                                          *
*******************************************************************************}
procedure TconnectDm.DataModuleCreate(Sender: TObject);
begin
  Logic := TLogicClass.Create;
  LogDebug(ClassName, 'DataModule created');
end;
{*******************************************************************************
* DataModule destruction                                                       *
*******************************************************************************}
procedure TconnectDm.DataModuleDestroy(Sender: TObject);
begin
  Logic.Free;
  LogDebug(ClassName, 'DataModule destroyed');
end;
{*******************************************************************************
* DataBase connection                                                          *
*******************************************************************************}
function TconnectDm.DBConnect: Integer;
var
  dbPath: string;
begin
  Result := mrCancel;
  try
    dbServer.Disconnect;
    dbServer.ProviderName := 'SQLite';
    dbPath := GetCurrentDir + '\member.db';
    LogDebug(ClassName, '[DBConnect] ' + dbPath);
    dbServer.Database := dbPath;
    // sqlite3.dll подгружается из PATH или из CurrentDir, поэтому следующая строка закомментирована
    //dbServer.SpecificOptions.Values['ClientLibrary'] := GetCurrentDir + '\sqlite3.dll';
    dbServer.Connect;
    if dbServer.Connected then Result := mrOk;
    if Result = mrOk
    then
      begin
        LogDebug(ClassName, '[DBConnect] Connected...');

      end
    else LogError(ClassName, '[DBConnect] Connect failed...');
  except
    on E: Exception do
    begin
      CoreErrorText := '[DBConnect] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
      Result := mrCancel;
    end;
  end;

  //DBFunc.Connect;
end;
{*******************************************************************************
* Database disconnection                                                       *
*******************************************************************************}
procedure TconnectDm.DBDisconnect;
begin
  try
    if dbServer.Connected then dbServer.Connected := False;
    if not dbServer.Connected
    then LogDebug(ClassName, '[DBDisconnect] Disconnected...')
    else LogError(ClassName, '[DBDisconnect] Disconnect failed...');
  except
    on E: Exception do
    begin
      CoreErrorText := '[DBDisconnect] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;
{*******************************************************************************
* GUID interface                                                               *
*******************************************************************************}
function TconnectDm.GenGUID: String;
var
  NGUID: TGUID;
begin
  CreateGUID(NGUID);
  Result := GUIDToString(NGUID);
  Result := StringReplace(Result, '{', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll, rfIgnoreCase]);
  LogDebug(ClassName, '[CORGenGUID] GUID: ' + Result);
end;

end.
