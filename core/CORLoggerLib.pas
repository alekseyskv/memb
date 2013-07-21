unit CORLoggerLib;

interface

uses
  Forms, SysUtils, Types, Windows;

type
  TLogLevel = (lvlDebug, lvlWarn, lvlError, lvlSystem);

const
  LogLevelCh: array [Low(TLogLevel)..High(TLogLevel)] of String = ('D', 'W', 'E', 'S');

type
  TCoreLogger = class
  private
    FFile: TextFile;
    FInDebug: Boolean;
    FLogFileName: String;
    procedure Log(const ALogLevel: TLogLevel; const ASource, AText: String);
  public
    constructor Create;
    destructor Destroy; override;
    property InDebug: Boolean read FInDebug write FInDebug;
  end;

procedure LogSystem(const ASource, AText: String);
procedure LogDebug(const ASource, AText: String);
procedure LogWarn(const ASource, AText: String);
procedure LogError(const ASource, AText: String);
function PassException(const ASource: String; const AException: Exception): Exception;

implementation

var
  Logger: TCoreLogger;

procedure LogSystem(const ASource, AText: String);
begin
  Logger.Log(lvlSystem, ASource, AText);
end;

procedure LogDebug(const ASource, AText: String);
begin
  Logger.Log(lvlDebug, ASource, AText);
end;

procedure LogWarn(const ASource, AText: String);
begin
  Logger.Log(lvlWarn, ASource, AText);
end;

function GetUserNameLog: String;
var
  UserName : array [0..255] of Char;
  UserNameSize : DWORD;
begin
  UserNameSize := 255;
  if GetUserName(@UserName, UserNameSize)
  then begin
    Result := String(UserName);
    Result := AnsiUpperCase(Result[1]) + AnsiLowerCase(Copy(Result, 2, Length(Result)));
  end
  else Result := 'Undefined';
end;

procedure LogError(const ASource, AText: String);
begin
  Logger.Log(lvlError, ASource, AText);
end;

function PassException(const ASource: String; const AException: Exception): Exception;
begin
  LogError(ASource, AException.ClassName + ': ' + AException.Message);
  Result := AException;
end;

constructor TCoreLogger.Create;
var
  I : Integer;
  IsFree : Boolean;
begin
  FInDebug := True;
  inherited;
  I := 0;
  repeat
    FLogFileName := ChangeFileExt(ParamStr(0), '_' + GetUserNameLog + '_' + IntToStr(I) + '.log');
    IsFree := False;
    try
      AssignFile(FFile, FLogFileName);
      Rewrite(FFile);
      CloseFile(FFile);
      IsFree := True;
    except
    end;
    I := I + 1;
  until IsFree;
  AssignFile(FFile, FLogFileName);
  Rewrite(FFile);
  Log(lvlSystem, ClassName, 'Logger start');
end;

destructor TCoreLogger.Destroy;
begin
  Log(lvlSystem, ClassName, 'Logger finish');
  CloseFile(FFile);
end;

procedure TCoreLogger.Log(const ALogLevel: TLogLevel; const ASource, AText: String);
begin
  if InDebug or (ALogLevel <> lvlDebug)
  then WriteLn(FFile, FormatDateTime('yyyymmdd hh:mm:ss', Now) + ' [' + LogLevelCh[ALogLevel] + '] {' + ASource + '}: ' + AText);
end;

initialization

Logger := TCoreLogger.Create;

finalization

Logger.Free;

end.
