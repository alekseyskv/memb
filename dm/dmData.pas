unit dmData;

interface

uses
  System.SysUtils, System.Classes, Dialogs, Data.DB, DBAccess, Uni, MemDS;

type
  TdataDm = class(TDataModule)
    qOrganizations: TUniQuery;
    dsOrganizations: TUniDataSource;
    qOrganizationsid: TIntegerField;
    qOrganizationsname: TWideStringField;
    qBuildinds: TUniQuery;
    dsBuildinds: TUniDataSource;
    qBuildindsguid: TWideStringField;
    qBuildindsname: TWideStringField;
    qBuildindsaddress: TWideStringField;
    qBuildindsis_active: TBooleanField;
    qBuildindsorganization_id: TIntegerField;
    dsBuildindsList: TUniDataSource;
    qBuildindsList: TUniQuery;
    qBuildindsListguid: TWideStringField;
    qBuildindsListname: TWideStringField;
    qObjects: TUniQuery;
    dsObjects: TUniDataSource;
    qObjectOwnres: TUniQuery;
    dsObjectOwners: TUniDataSource;
    qObjectsguid: TWideStringField;
    qObjectsname: TWideStringField;
    qObjectsstart_date: TDateField;
    qObjectsfinish_date: TDateField;
    qObjectsarea: TWideStringField;
    qObjectOwnresguid: TWideStringField;
    qObjectOwnresobj_guid: TWideStringField;
    qObjectOwnresowner_guid: TWideStringField;
    qObjectOwnresstart_date: TDateField;
    qObjectOwnresfinish_date: TDateField;
    qObjectOwnresshare: TFloatField;
    qObjectOwnresowner_name: TWideStringField;
    qObjectOwnresshare_area: TWideStringField;
    qOwners: TUniQuery;
    dsOwners: TUniDataSource;
    qOwnerShare: TUniQuery;
    dsOwnerShare: TUniDataSource;
    qOwnersguid: TWideStringField;
    qOwnersname: TWideStringField;
    qOwnerShareguid: TWideStringField;
    qOwnerShareobj_guid: TWideStringField;
    qOwnerShareowner_guid: TWideStringField;
    qOwnerSharestart_date: TDateField;
    qOwnerSharefinish_date: TDateField;
    qOwnerShareshare: TFloatField;
    qOwnerShareshare_area: TWideStringField;
    dsShare: TUniDataSource;
    qShare: TUniQuery;
    qObjectTypes: TUniQuery;
    qObjectsid: TIntegerField;
    WideStringField1: TWideStringField;
    dsObjectTypes: TUniDataSource;
    qOwnerCmbList: TUniQuery;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    dsOwnerCmbList: TUniDataSource;
    qObjectCmbList: TUniQuery;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    dsObjectCmbList: TUniDataSource;
    qShareguid: TWideStringField;
    qShareobject_guid: TWideStringField;
    qShareowner_guid: TWideStringField;
    qSharestart_date: TDateField;
    qSharefinish_date: TDateField;
    qShareshare: TFloatField;
    qSharearea: TFloatField;
    qShareshare_area: TWideStringField;
  private
    { Private declarations }
  public
    function loadData : boolean;
    procedure prepareQuery(d: TDate = 0);
  end;

var
  dataDm: TdataDm;

implementation

uses dmCon, corDialogLib, corLogicLib;

{$R *.dfm}

procedure TdataDm.prepareQuery(d: TDate = 0);
var
  ObjFltr: string;
  OwnerShareFltr: string;
  ShareFltr: string;
begin
  ObjFltr := '';
  OwnerShareFltr := '';
  ShareFltr := '';

  if d <> 0 then
  begin
    ObjFltr := ' AND o.start_date <= :CURDATE AND o.finish_date >= :CURDATE ';
    OwnerShareFltr := ' AND s.start_date <= :CURDATE AND s.finish_date >= :CURDATE ';
    ShareFltr := ' AND s.start_date <= :CURDATE AND s.finish_date >= :CURDATE ';
  end;

  qObjects.Close;
  qOwnerShare.Close;
  qShare.Close;

  qObjects.SQL.Text := 'SELECT o.guid, o.name, o.start_date, o.finish_date, CAST(IFNULL(a.area, 0) AS TEXT) AS area ' +
    'FROM m_object o ' +
    'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area GROUP BY object_guid) a ON a.object_guid = o.guid ' +
    'WHERE o.building_guid = :BGUID ' + ObjFltr +
    'ORDER BY o.name ';

  qOwnerShare.SQL.Text := 'SELECT s.guid, ' +
    's.object_guid AS obj_guid, ' +
    's.owner_guid, ' +
    's.start_date, ' +
    's.finish_date, ' +
    's.share, ' +
    'CAST(s.share * a.area / 100 AS TEXT) AS share_area ' +
    'FROM m_share s ' +
    'LEFT JOIN m_object o ON o.guid = s.object_guid ' +
    'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area GROUP BY object_guid) a ON a.object_guid = s.object_guid ' +
    'WHERE o.building_guid = :BGUID ' + OwnerShareFltr;

  qShare.SQL.Text := 'SELECT s.guid, s.object_guid, s.owner_guid, s.start_date, s.finish_date, s.share, a.area, CAST(s.share * a.area / 100 AS TEXT) AS share_area ' +
    'FROM m_share s ' +
    'INNER JOIN m_object o ON o.guid = s.object_guid ' +
    'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area GROUP BY object_guid) a ON a.object_guid = s.object_guid '+
    'WHERE o.building_guid = :BGUID ' + ShareFltr;

  qObjects.ParamByName('BGUID').AsString := Logic.HouseGUID;
  qOwnerShare.ParamByName('BGUID').AsString := Logic.HouseGUID;
  qShare.ParamByName('BGUID').AsString := Logic.HouseGUID;

  if d <> 0 then
  begin
    qObjects.ParamByName('CURDATE').AsDate := d;
    qOwnerShare.ParamByName('CURDATE').AsDate := d;
    qShare.ParamByName('CURDATE').AsDate := d;
  end;

  qObjects.Open;
  qOwnerShare.Open;
  qShare.Open;

end;

function TdataDm.loadData: boolean;
begin
  try
    qBuildindsList.Open;
    qOrganizations.Open;
    qBuildinds.Open;

    qObjects.Open;
    qObjectOwnres.Open;

    qObjectTypes.Open;

    qOwners.Open;
    qOwnerShare.Open;
    Result := true;
  except
    on E: Exception do
    begin
      MBox('Ошибка при чтении данных', E.Message, mtError);
      Result := false;
    end;
  end;
end;

end.
