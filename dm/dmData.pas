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
  end;

var
  dataDm: TdataDm;

implementation

uses dmCon, corDialoglib;

{$R *.dfm}

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
