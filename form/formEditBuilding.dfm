inherited editBuildingForm: TeditBuildingForm
  Caption = #1044#1086#1084
  ClientHeight = 221
  ClientWidth = 317
  ExplicitWidth = 323
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel [0]
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object lblControlName: TLabel [1]
    Left = 8
    Top = 100
    Width = 81
    Height = 13
    Caption = #1058#1080#1087' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
  end
  object lblAddress: TLabel [2]
    Left = 8
    Top = 54
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  inherited btnOk: TBitBtn
    Left = 153
    Top = 173
    ExplicitLeft = 153
    ExplicitTop = 173
  end
  inherited btnCancel: TBitBtn
    Left = 234
    Top = 173
    ExplicitLeft = 234
    ExplicitTop = 173
  end
  inherited sbrRec: TdxStatusBar
    Top = 208
    Width = 317
    ExplicitTop = 208
    ExplicitWidth = 317
  end
  object typeDBCombo: TcxDBLookupComboBox [6]
    Left = 8
    Top = 119
    DataBinding.DataField = 'organization_id'
    DataBinding.DataSource = dsRec
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dataDm.dsOrganizations
    TabOrder = 3
    Width = 301
  end
  object nameDBEdit: TcxDBTextEdit [7]
    Left = 7
    Top = 27
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsRec
    TabOrder = 4
    Width = 302
  end
  object addressDBEdit: TcxDBTextEdit [8]
    Left = 8
    Top = 73
    DataBinding.DataField = 'address'
    DataBinding.DataSource = dsRec
    TabOrder = 5
    Width = 301
  end
  object isActiveDBCheck: TcxDBCheckBox [9]
    Left = 8
    Top = 146
    Caption = #1055#1086' '#1076#1086#1084#1091' '#1074#1077#1076#1077#1090#1089#1103' '#1091#1095#1077#1090
    DataBinding.DataField = 'is_active'
    DataBinding.DataSource = dsRec
    TabOrder = 6
    Width = 301
  end
  inherited qRec: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM m_building')
    Left = 12
    object qRecguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qRecname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qRecaddress: TWideStringField
      FieldName = 'address'
      Size = 255
    end
    object qRecis_active: TBooleanField
      FieldName = 'is_active'
    end
    object qRecorganization_id: TIntegerField
      FieldName = 'organization_id'
    end
  end
end
