object objectsFrame: TobjectsFrame
  Left = 0
  Top = 0
  Width = 1031
  Height = 304
  Align = alClient
  TabOrder = 0
  ExplicitWidth = 451
  object pnlList: TPanel
    Left = 0
    Top = 28
    Width = 501
    Height = 276
    Align = alLeft
    BorderWidth = 2
    Caption = ' '
    TabOrder = 0
    object dbgList: TcxGrid
      Left = 3
      Top = 3
      Width = 495
      Height = 270
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object dbgListView: TcxGridDBTableView
        OnDblClick = PEvents
        DataController.DataSource = dataDm.dsObjects
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
        object dbgListViewname: TcxGridDBColumn
          DataBinding.FieldName = 'name'
          Width = 176
        end
        object dbgListViewstart_date: TcxGridDBColumn
          DataBinding.FieldName = 'start_date'
          Width = 121
        end
        object dbgListViewfinish_date: TcxGridDBColumn
          DataBinding.FieldName = 'finish_date'
          Width = 127
        end
        object dbgListViewarea: TcxGridDBColumn
          DataBinding.FieldName = 'area'
          Width = 69
        end
      end
      object dbgListLevel: TcxGridLevel
        GridView = dbgListView
      end
    end
  end
  object pnlOwners: TPanel
    Left = 501
    Top = 28
    Width = 530
    Height = 276
    Align = alClient
    BorderWidth = 2
    Caption = ' '
    TabOrder = 5
    ExplicitWidth = 454
    object dbgData: TcxGrid
      Left = 3
      Top = 3
      Width = 524
      Height = 270
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      ExplicitWidth = 448
      object dbgDataView: TcxGridDBTableView
        OnDblClick = PEvents
        DataController.DataSource = dataDm.dsObjectOwners
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
        object dbgDataViewowner_guid: TcxGridDBColumn
          DataBinding.FieldName = 'owner_guid'
          Visible = False
          Width = 79
        end
        object dbgDataViewstart_date: TcxGridDBColumn
          DataBinding.FieldName = 'start_date'
          Width = 117
        end
        object dbgDataViewfinish_date: TcxGridDBColumn
          DataBinding.FieldName = 'finish_date'
          Width = 129
        end
        object dbgDataViewshare: TcxGridDBColumn
          DataBinding.FieldName = 'share'
          Width = 60
        end
        object dbgDataViewowner_name: TcxGridDBColumn
          DataBinding.FieldName = 'owner_name'
          Width = 155
        end
        object dbgDataViewshare_area: TcxGridDBColumn
          DataBinding.FieldName = 'share_area'
          Width = 61
        end
      end
      object dbgDataLevel: TcxGridLevel
        GridView = dbgDataView
      end
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
  object aclObject: TActionList
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
end
