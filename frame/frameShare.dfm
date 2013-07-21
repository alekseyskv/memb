object shareFrame: TshareFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object pnlList: TPanel
    Left = 0
    Top = 28
    Width = 451
    Height = 276
    Align = alClient
    BorderWidth = 2
    Caption = ' '
    TabOrder = 4
    object dbgList: TcxGrid
      Left = 3
      Top = 3
      Width = 445
      Height = 270
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object dbgListView: TcxGridDBTableView
        DataController.DataSource = dataDm.dsShare
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
        object dbgListViewguid: TcxGridDBColumn
          DataBinding.FieldName = 'guid'
          Visible = False
          VisibleForCustomization = False
          Width = 51
        end
        object dbgListViewobject_guid: TcxGridDBColumn
          DataBinding.FieldName = 'object_guid'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'guid'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = dataDm.dsObjectCmbList
          Width = 64
        end
        object dbgListViewowner_guid: TcxGridDBColumn
          DataBinding.FieldName = 'owner_guid'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'guid'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = dataDm.dsOwnerCmbList
          Width = 54
        end
        object dbgListViewstart_date: TcxGridDBColumn
          DataBinding.FieldName = 'start_date'
          Width = 21
        end
        object dbgListViewfinish_date: TcxGridDBColumn
          DataBinding.FieldName = 'finish_date'
          Width = 68
        end
        object dbgListViewshare: TcxGridDBColumn
          DataBinding.FieldName = 'share'
          Width = 44
        end
        object dbgListViewarea: TcxGridDBColumn
          DataBinding.FieldName = 'area'
          Width = 52
        end
        object dbgListViewshare_area: TcxGridDBColumn
          DataBinding.FieldName = 'share_area'
          Width = 89
        end
      end
      object dbgListLevel: TcxGridLevel
        GridView = dbgListView
      end
    end
  end
  object aclObjects: TActionList
    Left = 68
    Top = 196
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = PEvents
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = PEvents
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = PEvents
    end
  end
  object bmnObjects: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 136
    Top = 196
    DockControlHeights = (
      0
      0
      28
      0)
    object bmnObjectsBar: TdxBar
      Caption = #1054#1073#1098#1077#1082#1090#1099
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 691
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniAdd'
        end
        item
          Visible = True
          ItemName = 'mniEdit'
        end
        item
          Visible = True
          ItemName = 'mniDel'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object mniAdd: TdxBarButton
      Action = actAdd
      Category = 0
    end
    object mniEdit: TdxBarButton
      Action = actEdit
      Category = 0
    end
    object mniDel: TdxBarButton
      Action = actDel
      Category = 0
    end
  end
  object dsList: TDataSource
    DataSet = qList
    Left = 132
    Top = 116
  end
  object qList: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select s.GUID, s.ObjId, s.OwnerId, s.DateBeg, s.DateEnd, s.Share' +
        ','
      
        '  b.Name ObjName, w.Name OwnerName, Func_Area_Get(s.ObjId, null)' +
        ' Area,'
      '  s.Share * Func_Area_Get(s.ObjId, null) / 100 ShareArea'
      'from TABLE_SHARE s'
      '     inner join TABLE_OBJECT b on (s.ObjId = b.GUID)'
      '     inner join TABLE_OWNER w on (s.OwnerId = w.GUID)'
      'order by b.Name, w.Name')
    Left = 132
    Top = 68
  end
end
