unit CORLogicLib;

interface

uses SysUtils;

const
  APPLICATION_CAPTION = 'Реестр членов ТСЖ';

type
  TLogicClass = class
  private
    FDataServer: String;
    FDataPort: Integer;
    FDataUser: String;
    FDataPass: String;
    FDataName: String;
    FDateOper: TDate;
    FHouseGUID: String;
    procedure SetDateOper(Value: TDate);
    procedure SetHouseGUID(Value: String);
  public
    property DataServer: String read FDataServer;
    property DataPort: Integer read FDataPort;
    property DataUser: String read FDataUser;
    property DataPass: String read FDataPass;
    property DataName: String read FDataName;
    property DateOper: TDate read FDateOper write SetDateOper;
    property HouseGUID: String read FHouseGUID write SetHouseGUID;
    constructor Create;
    destructor Destroy; override;
  end;

var
  Logic: TLogicClass;

implementation

uses CORLoggerLib, CORIniLib;

{ TLogic }

constructor TLogicClass.Create;
begin
  FDataServer := INIReadString(DATABASE_SECTION, DATABASE_SERVER, 'LOCALHOST');
  FDataPort := INIReadInteger(DATABASE_SECTION, DATABASE_PORT, 3306);
  FDataUser := INIReadString(DATABASE_SECTION, DATABASE_USER, 'root');
  FDataPass := INIReadString(DATABASE_SECTION, DATABASE_PASS, '');
  FDataName := INIReadString(DATABASE_SECTION, DATABASE_NAME, 'MemberDB');
  FDateOper := INIReadDate(SETTINGS_SECTION, DATE_OPER, Trunc(Date));
  FHouseGUID := INIReadString(SETTINGS_SECTION, HOUSE_GUID, '');
  LogDebug(ClassName, 'Class created');
end;

destructor TLogicClass.Destroy;
begin
  LogDebug(ClassName, 'Class destroyed');
end;

procedure TLogicClass.SetHouseGUID(Value: String);
begin
  if Value <> FHouseGUID
  then begin
    FHouseGUID := Value;
    INIWriteString(SETTINGS_SECTION, HOUSE_GUID, FHouseGUID);
  end;
end;

procedure TLogicClass.SetDateOper(Value: TDate);
begin
  if Trunc(Value) <> FDateOper
  then begin
    FDateOper := Trunc(Value);
    INIWriteDate(SETTINGS_SECTION, DATE_OPER, FDateOper);
  end;
end;

end.
