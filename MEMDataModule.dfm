object dmMEM: TdmMEM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 326
  Width = 559
  object spMEMObjectSave: TUniStoredProc
    StoredProcName = 'proc_object_save'
    DataTypeMap = <>
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ATYPEID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANAME'
        ParamType = ptInput
        Size = 250
      end
      item
        DataType = ftDate
        Name = 'ADATEBEG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ADATEEND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ADESCR'
        ParamType = ptInput
        Size = 250
      end>
    CommandStoredProcName = 'proc_object_save'
  end
  object spMEMObjectDrop: TUniStoredProc
    StoredProcName = 'proc_object_drop'
    DataTypeMap = <>
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
        Size = 50
      end>
    CommandStoredProcName = 'proc_object_drop'
  end
  object spMEMOwnerSave: TUniStoredProc
    StoredProcName = 'proc_owner_save'
    DataTypeMap = <>
    Left = 160
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANAME'
        ParamType = ptInput
        Size = 250
      end>
    CommandStoredProcName = 'proc_owner_save'
  end
  object spMEMOwnerDrop: TUniStoredProc
    StoredProcName = 'proc_owner_drop'
    DataTypeMap = <>
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_owner_drop'
  end
  object spMEMAreaSave: TUniStoredProc
    StoredProcName = 'proc_area_save'
    DataTypeMap = <>
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AOBJID'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftDate
        Name = 'ADATEBEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AAREA'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_area_save'
  end
  object spMEMAreaDrop: TUniStoredProc
    StoredProcName = 'proc_area_drop'
    DataTypeMap = <>
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'AOBJID'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_area_drop'
  end
  object spMEMShareSave: TUniStoredProc
    StoredProcName = 'proc_share_save'
    DataTypeMap = <>
    Left = 160
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AOBJID'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftString
        Name = 'AOWNERID'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftDate
        Name = 'ADATEBEG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ADATEEND'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ASHARE'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_share_save'
  end
  object spMEMShareDrop: TUniStoredProc
    StoredProcName = 'proc_share_drop'
    DataTypeMap = <>
    Left = 160
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_share_drop'
  end
  object spOBJHouseSave: TUniStoredProc
    StoredProcName = 'proc_obj_house_save'
    DataTypeMap = <>
    Left = 260
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANAME'
        ParamType = ptInput
        Size = 250
      end
      item
        DataType = ftBoolean
        Name = 'AACTIVESIGN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AADDRESS'
        ParamType = ptInput
        Size = 250
      end
      item
        DataType = ftInteger
        Name = 'ATYPEID'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_obj_house_save'
  end
  object spOBJHouseDrop: TUniStoredProc
    StoredProcName = 'proc_obj_house_drop'
    DataTypeMap = <>
    Left = 260
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'AGUID'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'proc_obj_house_drop'
  end
end
