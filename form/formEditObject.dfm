inherited editObjectForm: TeditObjectForm
  Caption = #1054#1073#1098#1077#1082#1090
  ClientHeight = 414
  ClientWidth = 385
  ExplicitWidth = 391
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel [0]
    Left = 159
    Top = 8
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 170
    Width = 83
    Height = 13
    Caption = #1055#1083#1086#1097#1072#1076#1100', '#1082#1074'. '#1084'.'
  end
  object lblDateBeg: TLabel [2]
    Left = 8
    Top = 124
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object lblDateEnd: TLabel [3]
    Left = 293
    Top = 124
    Width = 83
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object lblObjectName: TLabel [4]
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
  end
  object lblDescr: TLabel [5]
    Left = 8
    Top = 54
    Width = 49
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  inherited btnOk: TBitBtn
    Left = 221
    Top = 368
    TabOrder = 1
    ExplicitLeft = 221
    ExplicitTop = 368
  end
  inherited btnCancel: TBitBtn
    Left = 302
    Top = 368
    TabOrder = 2
    ExplicitLeft = 302
    ExplicitTop = 368
  end
  inherited sbrRec: TdxStatusBar
    Top = 401
    Width = 385
    ExplicitTop = 401
    ExplicitWidth = 551
  end
  object dbgList: TcxGrid [9]
    Left = 8
    Top = 189
    Width = 368
    Height = 173
    TabOrder = 0
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    object dbgListView: TcxGridDBTableView
      OnDblClick = PEvents
      DataController.DataSource = dsAreas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object dbgListViewbegin_date: TcxGridDBColumn
        DataBinding.FieldName = 'begin_date'
      end
      object dbgListViewarea: TcxGridDBColumn
        DataBinding.FieldName = 'area'
      end
      object dbgListViewguid: TcxGridDBColumn
        DataBinding.FieldName = 'guid'
        Visible = False
        VisibleForCustomization = False
      end
      object dbgListViewobject_guid: TcxGridDBColumn
        DataBinding.FieldName = 'object_guid'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object dbgListLevel: TcxGridLevel
      GridView = dbgListView
    end
  end
  object objectTypeCmb: TcxDBLookupComboBox [10]
    Left = 8
    Top = 27
    DataBinding.DataField = 'type_id'
    DataBinding.DataSource = dsRec
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dataDm.dsObjectTypes
    TabOrder = 4
    Width = 145
  end
  object objectNameEdt: TcxDBTextEdit [11]
    Left = 159
    Top = 27
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsRec
    TabOrder = 5
    Width = 217
  end
  object startDateEdt: TcxDBDateEdit [12]
    Left = 8
    Top = 143
    DataBinding.DataField = 'start_date'
    DataBinding.DataSource = dsRec
    TabOrder = 6
    Width = 121
  end
  object finishDateEdt: TcxDBDateEdit [13]
    Left = 255
    Top = 143
    DataBinding.DataField = 'finish_date'
    DataBinding.DataSource = dsRec
    TabOrder = 7
    Width = 121
  end
  object objectDescriptionMemo: TcxDBMemo [14]
    Left = 8
    Top = 73
    DataBinding.DataField = 'description'
    DataBinding.DataSource = dsRec
    TabOrder = 8
    Height = 45
    Width = 368
  end
  inherited qRec: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM m_object')
    Left = 140
    Top = 128
    object qRecguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qRectype_id: TIntegerField
      FieldName = 'type_id'
    end
    object qRecname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qRecstart_date: TDateField
      FieldName = 'start_date'
    end
    object qRecfinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qRecdescription: TWideMemoField
      FieldName = 'description'
      BlobType = ftWideMemo
    end
    object qRecbuilding_guid: TWideStringField
      FieldName = 'building_guid'
      Size = 36
    end
  end
  inherited dsRec: TUniDataSource
    Left = 176
    Top = 128
  end
  object qAreas: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT *'
      'FROM m_area'
      'ORDER BY begin_date')
    MasterSource = dsRec
    MasterFields = 'guid'
    DetailFields = 'object_guid'
    Left = 28
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'guid'
      end>
    object qAreasbegin_date: TDateField
      FieldName = 'begin_date'
    end
    object qAreasarea: TFloatField
      FieldName = 'area'
    end
    object qAreasguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qAreasobject_guid: TWideStringField
      FieldName = 'object_guid'
      Size = 36
    end
  end
  object dsAreas: TUniDataSource
    DataSet = qAreas
    Left = 80
    Top = 344
  end
end
