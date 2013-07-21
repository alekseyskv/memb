object dataDm: TdataDm
  OldCreateOrder = False
  Height = 527
  Width = 760
  object qOrganizations: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT id, name'
      'FROM m_building_organization'
      'ORDER BY order_num')
    Left = 32
    Top = 12
    object qOrganizationsid: TIntegerField
      FieldName = 'id'
    end
    object qOrganizationsname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsOrganizations: TUniDataSource
    DataSet = qOrganizations
    Left = 32
    Top = 64
  end
  object qBuildinds: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT *'
      'FROM m_building')
    Left = 368
    Top = 12
    object qBuildindsguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qBuildindsname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qBuildindsaddress: TWideStringField
      FieldName = 'address'
      Size = 255
    end
    object qBuildindsis_active: TBooleanField
      FieldName = 'is_active'
    end
    object qBuildindsorganization_id: TIntegerField
      FieldName = 'organization_id'
    end
  end
  object dsBuildinds: TUniDataSource
    DataSet = qBuildinds
    Left = 368
    Top = 64
  end
  object dsBuildindsList: TUniDataSource
    DataSet = qBuildindsList
    Left = 136
    Top = 64
  end
  object qBuildindsList: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT guid, name'
      'FROM m_building'
      'WHERE is_active <> :IsActive'
      'ORDER BY name')
    Left = 136
    Top = 12
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'IsActive'
        Value = False
      end>
    object qBuildindsListguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qBuildindsListname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object qObjects: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      
        'SELECT o.guid, o.name, o.start_date, o.finish_date, CAST(IFNULL(' +
        'a.area, 0) AS TEXT) AS area'
      'FROM m_object o'
      
        'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area' +
        ' GROUP BY object_guid) a ON a.object_guid = o.guid '
      'WHERE o.building_guid = :BGUID'
      'ORDER BY o.name')
    Left = 24
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BGUID'
      end>
    object qObjectsguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qObjectsname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qObjectsstart_date: TDateField
      FieldName = 'start_date'
    end
    object qObjectsfinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qObjectsarea: TWideStringField
      FieldName = 'area'
      ReadOnly = True
      Size = 8192
    end
  end
  object dsObjects: TUniDataSource
    DataSet = qObjects
    Left = 24
    Top = 456
  end
  object qObjectOwnres: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT s.guid, '
      's.object_guid AS obj_guid, '
      's.owner_guid,'
      's.start_date,'
      's.finish_date,'
      's.share,'
      'o.name AS owner_name,'
      'CAST(s.share * a.area / 100 AS TEXT) AS share_area'
      'FROM m_share s'
      'INNER JOIN m_owner o ON o.guid = s.owner_guid'
      
        'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area' +
        ' GROUP BY object_guid) a ON a.object_guid = s.object_guid '
      'ORDER BY o.name')
    MasterSource = dsObjects
    MasterFields = 'guid'
    DetailFields = 'obj_guid'
    Left = 96
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'guid'
      end>
    object qObjectOwnresguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qObjectOwnresobj_guid: TWideStringField
      FieldName = 'obj_guid'
      Size = 36
    end
    object qObjectOwnresowner_guid: TWideStringField
      FieldName = 'owner_guid'
      Size = 36
    end
    object qObjectOwnresstart_date: TDateField
      FieldName = 'start_date'
    end
    object qObjectOwnresfinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qObjectOwnresshare: TFloatField
      FieldName = 'share'
    end
    object qObjectOwnresowner_name: TWideStringField
      FieldName = 'owner_name'
      ReadOnly = True
      Size = 255
    end
    object qObjectOwnresshare_area: TWideStringField
      FieldName = 'share_area'
      ReadOnly = True
      Size = 8192
    end
  end
  object dsObjectOwners: TUniDataSource
    DataSet = qObjectOwnres
    Left = 96
    Top = 456
  end
  object qOwners: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT guid, name'
      'FROM m_owner'
      'ORDER BY name')
    Left = 200
    Top = 408
    object qOwnersguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qOwnersname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsOwners: TUniDataSource
    DataSet = qOwners
    Left = 200
    Top = 456
  end
  object qOwnerShare: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT s.guid, '
      's.object_guid AS obj_guid, '
      's.owner_guid,'
      's.start_date,'
      's.finish_date,'
      's.share,'
      'CAST(s.share * a.area / 100 AS TEXT) AS share_area'
      'FROM m_share s'
      'LEFT JOIN m_object o ON o.guid = s.object_guid'
      
        'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area' +
        ' GROUP BY object_guid) a ON a.object_guid = s.object_guid'
      'WHERE o.building_guid = :BGUID')
    MasterSource = dsOwners
    MasterFields = 'guid'
    DetailFields = 'owner_guid'
    Left = 272
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BGUID'
      end
      item
        DataType = ftUnknown
        Name = 'guid'
      end>
    object qOwnerShareguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qOwnerShareobj_guid: TWideStringField
      FieldName = 'obj_guid'
      Size = 36
    end
    object qOwnerShareowner_guid: TWideStringField
      FieldName = 'owner_guid'
      Size = 36
    end
    object qOwnerSharestart_date: TDateField
      FieldName = 'start_date'
    end
    object qOwnerSharefinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qOwnerShareshare: TFloatField
      FieldName = 'share'
    end
    object qOwnerShareshare_area: TWideStringField
      FieldName = 'share_area'
      ReadOnly = True
      Size = 8192
    end
  end
  object dsOwnerShare: TUniDataSource
    DataSet = qOwnerShare
    Left = 272
    Top = 456
  end
  object dsShare: TUniDataSource
    DataSet = qShare
    Left = 360
    Top = 456
  end
  object qShare: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT '
      's.guid, '
      's.object_guid, '
      's.owner_guid, '
      's.start_date, '
      's.finish_date, '
      's.share,'
      'a.area,'
      'CAST(s.share * a.area / 100 AS TEXT) AS share_area'
      'FROM m_share s'
      'INNER JOIN m_object o ON o.guid = s.object_guid'
      
        'LEFT JOIN (SELECT object_guid, area, MAX(begin_date) FROM m_area' +
        ' GROUP BY object_guid) a ON a.object_guid = s.object_guid '
      'WHERE o.building_guid = :BGUID')
    Left = 360
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BGUID'
      end>
    object qShareguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qShareobject_guid: TWideStringField
      FieldName = 'object_guid'
      Size = 36
    end
    object qShareowner_guid: TWideStringField
      FieldName = 'owner_guid'
      Size = 36
    end
    object qSharestart_date: TDateField
      FieldName = 'start_date'
    end
    object qSharefinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qShareshare: TFloatField
      FieldName = 'share'
    end
    object qSharearea: TFloatField
      FieldName = 'area'
      ReadOnly = True
    end
    object qShareshare_area: TWideStringField
      FieldName = 'share_area'
      ReadOnly = True
      Size = 8192
    end
  end
  object qObjectTypes: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT id, name'
      'FROM m_object_type'
      'ORDER BY order_num')
    Left = 32
    Top = 144
    object qObjectsid: TIntegerField
      FieldName = 'id'
    end
    object WideStringField1: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsObjectTypes: TUniDataSource
    DataSet = qObjectTypes
    Left = 32
    Top = 192
  end
  object qOwnerCmbList: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT guid, name'
      'FROM m_owner'
      'ORDER BY name')
    Left = 584
    Top = 8
    object WideStringField2: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object WideStringField3: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsOwnerCmbList: TUniDataSource
    DataSet = qOwnerCmbList
    Left = 584
    Top = 56
  end
  object qObjectCmbList: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT guid, name'
      'FROM m_object'
      'ORDER BY name')
    Left = 672
    Top = 8
    object WideStringField4: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object WideStringField5: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsObjectCmbList: TUniDataSource
    DataSet = qObjectCmbList
    Left = 672
    Top = 56
  end
end
