unit MEMDataModule;

interface

uses
  SysUtils, Classes, Controls, DB, MemDS, DBAccess, Uni;

type
  TdmMEM = class(TDataModule)
    spMEMObjectSave: TUniStoredProc;
    spMEMObjectDrop: TUniStoredProc;
    spMEMOwnerSave: TUniStoredProc;
    spMEMOwnerDrop: TUniStoredProc;
    spMEMAreaSave: TUniStoredProc;
    spMEMAreaDrop: TUniStoredProc;
    spMEMShareSave: TUniStoredProc;
    spMEMShareDrop: TUniStoredProc;
    spOBJHouseSave: TUniStoredProc;
    spOBJHouseDrop: TUniStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function OBJHouseSave(const AGUID, AName: String; const AActiveSign: Boolean; const AAddress: String;
      const ATypeId: Integer): Integer;
    function OBJHouseDrop(const AGUID: String): Integer;

    function MEMObjectSave(const AGUID: String; const ATypeId: Integer; const AName: String;
      const ADateBeg, ADateEnd: TDate; const ADescr: String): Integer;
    function MEMObjectDrop(const AGUID: String): Integer;
    function MEMOwnerSave(const AGUID, AName: String): Integer;
    function MEMOwnerDrop(const AGUID: String): Integer;
    function MEMAreaSave(const AGUID, AObjId: String; const ADateBeg: TDate; const AArea: Real): Integer;
    function MEMAreaDrop(const AObjId: String): Integer;
    function MEMShareSave(const AGUID, AObjId, AOwnerId: String; const ADateBeg, ADateEnd: TDate; const AShare: Real): Integer;
    function MEMShareDrop(const AGUID: String): Integer;
  end;

var
  dmMEM: TdmMEM;

implementation

uses CORLoggerLib, dmCon;

{$R *.dfm}

procedure TdmMEM.DataModuleCreate(Sender: TObject);
begin
  LogDebug(ClassName, 'DataModule created');
end;

procedure TdmMEM.DataModuleDestroy(Sender: TObject);
begin
  LogDebug(ClassName, 'DataModule destroyed');
end;

function TdmMEM.OBJHouseSave(const AGUID, AName: String; const AActiveSign: Boolean; const AAddress: String;
  const ATypeId: Integer): Integer;
begin
  LogDebug(ClassName, '[OBJHouseSave] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spOBJHouseSave.Close;
    spOBJHouseSave.ParamByName('AGUID').AsString := AGUID;
    spOBJHouseSave.ParamByName('AName').AsString := AName;
    spOBJHouseSave.ParamByName('AActiveSign').AsBoolean := AActiveSign;
    spOBJHouseSave.ParamByName('AAddress').AsString := AAddress;
    if ATypeId = -1
    then spOBJHouseSave.ParamByName('ATypeId').Clear
    else spOBJHouseSave.ParamByName('ATypeId').AsInteger := ATypeId;
    spOBJHouseSave.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[OBJHouseSave] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[OBJHouseSave] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.OBJHouseDrop(const AGUID: String): Integer;
begin
  LogDebug(ClassName, '[OBJHouseDrop] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spOBJHouseDrop.Close;
    spOBJHouseDrop.ParamByName('AGUID').AsString := AGUID;
    spOBJHouseDrop.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[OBJHouseDrop] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[OBJHouseDrop] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMObjectSave(const AGUID: String; const ATypeId: Integer; const AName: String;
  const ADateBeg, ADateEnd: TDate; const ADescr: String): Integer;
begin
  LogDebug(ClassName, '[MEMObjectSave] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMObjectSave.Close;
    spMEMObjectSave.ParamByName('AGUID').AsString := AGUID;
    spMEMObjectSave.ParamByName('ATypeId').AsInteger := ATypeId;
    spMEMObjectSave.ParamByName('AName').AsString := AName;
    if ADateBeg = 0
    then spMEMObjectSave.ParamByName('ADateBeg').Clear
    else spMEMObjectSave.ParamByName('ADateBeg').AsDate := Trunc(ADateBeg);
    if ADateEnd = 0
    then spMEMObjectSave.ParamByName('ADateEnd').Clear
    else spMEMObjectSave.ParamByName('ADateEnd').AsDate := Trunc(ADateEnd);
    spMEMObjectSave.ParamByName('ADescr').AsString := ADescr;
    spMEMObjectSave.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMObjectSave] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMObjectSave] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMObjectDrop(const AGUID: String): Integer;
begin
  LogDebug(ClassName, '[MEMObjectDrop] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMObjectDrop.Close;
    spMEMObjectDrop.ParamByName('AGUID').AsString := AGUID;
    spMEMObjectDrop.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMObjectDrop] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMObjectDrop] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMOwnerSave(const AGUID, AName: String): Integer;
begin
  LogDebug(ClassName, '[MEMOwnerSave] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMOwnerSave.Close;
    spMEMOwnerSave.ParamByName('AGUID').AsString := AGUID;
    spMEMOwnerSave.ParamByName('AName').AsString := AName;
    spMEMOwnerSave.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMOwnerSave] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMOwnerSave] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMOwnerDrop(const AGUID: String): Integer;
begin
  LogDebug(ClassName, '[MEMOwnerDrop] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMOwnerDrop.Close;
    spMEMOwnerDrop.ParamByName('AGUID').AsString := AGUID;
    spMEMOwnerDrop.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMOwnerDrop] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMOwnerDrop] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMAreaSave(const AGUID, AObjId: String; const ADateBeg: TDate; const AArea: Real): Integer;
begin
  LogDebug(ClassName, '[MEMAreaSave] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMAreaSave.Close;
    spMEMAreaSave.ParamByName('AGUID').AsString := AGUID;
    spMEMAreaSave.ParamByName('AObjId').AsString := AObjId;
    spMEMAreaSave.ParamByName('ADateBeg').AsDate := Trunc(ADateBeg);
    spMEMAreaSave.ParamByName('AArea').AsFloat := AArea;
    spMEMAreaSave.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMAreaSave] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMAreaSave] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMAreaDrop(const AObjId: String): Integer;
begin
  LogDebug(ClassName, '[MEMAreaDrop] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMAreaDrop.Close;
    spMEMAreaDrop.ParamByName('AObjId').AsString := AObjId;
    spMEMAreaDrop.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMAreaDrop] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMAreaDrop] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMShareSave(const AGUID, AObjId, AOwnerId: String; const ADateBeg, ADateEnd: TDate; const AShare: Real): Integer;
begin
  LogDebug(ClassName, '[MEMShareSave] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMShareSave.Close;
    spMEMShareSave.ParamByName('AGUID').AsString := AGUID;
    spMEMShareSave.ParamByName('AObjId').AsString := AObjId;
    spMEMShareSave.ParamByName('AOwnerId').AsString := AOwnerId;
    if ADateBeg = 0
    then spMEMShareSave.ParamByName('ADateBeg').Clear
    else spMEMShareSave.ParamByName('ADateBeg').AsDate := Trunc(ADateBeg);
    if ADateEnd = 0
    then spMEMShareSave.ParamByName('ADateEnd').Clear
    else spMEMShareSave.ParamByName('ADateEnd').AsDate := Trunc(ADateEnd);
    spMEMShareSave.ParamByName('AShare').AsFloat := AShare;
    spMEMShareSave.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMShareSave] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMShareSave] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

function TdmMEM.MEMShareDrop(const AGUID: String): Integer;
begin
  LogDebug(ClassName, '[MEMShareDrop] Start');
  Result := mrCancel;
  try
    if not connectDm.dbServer.InTransaction then connectDm.dbServer.StartTransaction;
    spMEMShareDrop.Close;
    spMEMShareDrop.ParamByName('AGUID').AsString := AGUID;
    spMEMShareDrop.ExecProc;
    connectDm.dbServer.Commit;
    Result := mrOk;
    LogDebug(ClassName, '[MEMShareDrop] OK!');
  except
    on E: Exception do
    begin
      connectDm.dbServer.Rollback;
      CoreErrorText := '[MEMShareDrop] Error: ' + E.Message;
      LogError(ClassName, CoreErrorText);
    end;
  end;
end;

end.
