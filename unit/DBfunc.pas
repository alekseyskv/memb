unit DBfunc;

interface

uses
  SysUtils, SQLite3;

procedure Connect;


implementation

procedure GetArea_Function_Callback(ctx:pointer; n:integer; args:PSQLite3Value);cdecl;
var
  p: PSQLite3Value;
  theString: string;
  res:integer;
begin
  p := args;
  theString := trim(sqlite3_value_text(p^));

  // do something with theString
  //r := InitCap(Arg1);

  // return a number based on string
  sqlite3_result_int(ctx, res);
end;


procedure Connect;
var
  FSQLite: PSQLite3;
  iResult: integer;
begin
  iResult := SQLite3_Open(PAnsiChar(GetCurrentDir + '\member.db'), FSQLite);
  if iResult = SQLITE_OK then
  begin
    //sqlite3_create_collation(FSQLite, 'myCollation', SQLITE_UTF8, nil, @collation_callback);
    sqlite3_create_function(FSQLite, 'INITCAP', 1, SQLITE_UTF8, nil, @GetArea_Function_Callback, nil, nil);
  end;
end;



{
procedure LoadDBfunctions();
begin
  sqlite3_create_function(DB, 'INITCAP', 1, SQLITE_UTF8, nil, InitCap_Function_Callback, nil, nil);
end;
 }

end.
