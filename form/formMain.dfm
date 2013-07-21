object mainFrm: TmainFrm
  Left = 0
  Top = 0
  Caption = #1056#1077#1077#1089#1090#1088' '#1095#1083#1077#1085#1086#1074' '#1058#1057#1046
  ClientHeight = 670
  ClientWidth = 1186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pclMain: TcxPageControl
    Left = 0
    Top = 75
    Width = 1186
    Height = 575
    Align = alClient
    TabOrder = 4
    Properties.ActivePage = tshShares
    ClientRectBottom = 571
    ClientRectLeft = 2
    ClientRectRight = 1182
    ClientRectTop = 22
    object tshObjects: TcxTabSheet
      Caption = #1054#1073#1098#1077#1082#1090#1099
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tshOwners: TcxTabSheet
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tshShares: TcxTabSheet
      Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100#1102
      ImageIndex = 2
    end
  end
  object sbrMain: TdxStatusBar
    Left = 0
    Top = 650
    Width = 1186
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object aclMain: TActionList
    Left = 360
    Top = 220
    object actCORExit: TAction
      Caption = #1042#1099#1093#1086#1076
      OnExecute = PEvents
    end
    object actVIWObjects: TAction
      Caption = #1054#1073#1098#1077#1082#1090#1099
      Checked = True
      GroupIndex = 1
      OnExecute = PEvents
    end
    object actVIWOwners: TAction
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080
      GroupIndex = 1
      OnExecute = PEvents
    end
    object actVIWShares: TAction
      Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100#1102
      GroupIndex = 1
      OnExecute = PEvents
    end
    object actLIBHouses: TAction
      Caption = #1044#1086#1084#1072'...'
      OnExecute = PEvents
    end
  end
  object brmMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'File'
      'View'
      'Library')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 412
    Top = 220
    DockControlHeights = (
      0
      0
      75
      0)
    object brmMainMenu: TdxBar
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 751
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniCORFile'
        end
        item
          Visible = True
          ItemName = 'mniCORView'
        end
        item
          Visible = True
          ItemName = 'mniLIBLibrary'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object brmControls: TdxBar
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 47
      DockingStyle = dsTop
      FloatLeft = 751
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniVIWObjects'
        end
        item
          Visible = True
          ItemName = 'mniVIWOwners'
        end
        item
          Visible = True
          ItemName = 'mniVIWShares'
        end>
      OneOnRow = True
      Row = 2
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object brmHouse: TdxBar
      Caption = #1044#1086#1084
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 23
      DockingStyle = dsTop
      FloatLeft = 751
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniDateOper'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 525
          Visible = True
          ItemName = 'buildingCmb'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object mniCORFile: TdxBarSubItem
      Caption = #1060#1072#1081#1083
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniCORExit'
        end>
    end
    object mniCORExit: TdxBarButton
      Action = actCORExit
      Category = 1
    end
    object buildingCmb: TdxBarCombo
      Align = iaClient
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1086#1084
      Category = 1
      Hint = #1058#1077#1082#1091#1097#1080#1081' '#1076#1086#1084
      Visible = ivAlways
      OnChange = PEvents
      ShowCaption = True
      Width = 500
      ShowEditor = False
      DropDownCount = 20
      ItemIndex = -1
    end
    object mniDateOper: TdxBarDateCombo
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1076#1072#1090#1072
      Category = 1
      Hint = #1058#1077#1082#1091#1097#1072#1103' '#1076#1072#1090#1072
      Visible = ivAlways
      OnChange = PEvents
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 120
      ShowEditor = False
    end
    object mniCORView: TdxBarSubItem
      Caption = #1042#1080#1076
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniVIWObjects'
        end
        item
          Visible = True
          ItemName = 'mniVIWOwners'
        end
        item
          Visible = True
          ItemName = 'mniVIWShares'
        end>
    end
    object mniVIWObjects: TdxBarButton
      Action = actVIWObjects
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object mniVIWOwners: TdxBarButton
      Action = actVIWOwners
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object mniVIWShares: TdxBarButton
      Action = actVIWShares
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object mniLIBLibrary: TdxBarSubItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mniLIBHouses'
        end>
    end
    object mniLIBHouses: TdxBarButton
      Action = actLIBHouses
      Category = 3
    end
  end
  object qHouses: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    SQL.Strings = (
      'SELECT guid, name, is_active'
      'FROM m_building'
      'WHERE is_active <> :IsActive'
      'ORDER BY name')
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'IsActive'
        Value = False
      end>
    object qHousesguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qHousesname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qHousesis_active: TBooleanField
      FieldName = 'is_active'
    end
  end
end
