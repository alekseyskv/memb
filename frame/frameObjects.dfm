object objectsFrame: TobjectsFrame
  Left = 0
  Top = 0
  Width = 663
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
        PopupMenu = ObjectsPopupMenu
        OnDblClick = PEvents
        OnCellDblClick = dbgListViewCellDblClick
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
          Caption = #1054#1073#1098#1077#1082#1090
          DataBinding.FieldName = 'name'
          Width = 176
        end
        object dbgListViewstart_date: TcxGridDBColumn
          Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
          DataBinding.FieldName = 'start_date'
          Width = 121
        end
        object dbgListViewfinish_date: TcxGridDBColumn
          Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
          DataBinding.FieldName = 'finish_date'
          Width = 127
        end
        object dbgListViewarea: TcxGridDBColumn
          Caption = #1055#1083#1086#1097#1072#1076#1100
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
    Width = 162
    Height = 276
    Align = alClient
    BorderWidth = 2
    Caption = ' '
    TabOrder = 5
    ExplicitWidth = 502
    object dbgData: TcxGrid
      Left = 3
      Top = 3
      Width = 156
      Height = 270
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      ExplicitWidth = 496
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
          Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
          DataBinding.FieldName = 'start_date'
          Width = 117
        end
        object dbgDataViewfinish_date: TcxGridDBColumn
          Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
          DataBinding.FieldName = 'finish_date'
          Width = 129
        end
        object dbgDataViewshare: TcxGridDBColumn
          Caption = '%'
          DataBinding.FieldName = 'share'
          Width = 60
        end
        object dbgDataViewowner_name: TcxGridDBColumn
          Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
          DataBinding.FieldName = 'owner_name'
          Width = 155
        end
        object dbgDataViewshare_area: TcxGridDBColumn
          Caption = #1055#1083#1086#1097#1072#1076#1100
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
    ImageOptions.Images = mainFrm.greyImgList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 72
    Top = 76
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
      PaintStyle = psCaptionGlyph
    end
    object mniEdit: TdxBarButton
      Action = actEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object mniDel: TdxBarButton
      Action = actDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object aclObject: TActionList
    Images = mainFrm.greyImgList
    Left = 68
    Top = 180
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = PEvents
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = PEvents
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 15
      OnExecute = PEvents
    end
  end
  object ObjectsPopupMenu: TPopupMenu
    Images = mainFrm.greyImgList
    Left = 72
    Top = 128
    object N1: TMenuItem
      Action = actAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
    end
    object N2: TMenuItem
      Action = actEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
    end
    object N3: TMenuItem
      Action = actDel
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
    end
  end
end
