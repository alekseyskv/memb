inherited editOwnerForm: TeditOwnerForm
  Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
  ClientHeight = 102
  ClientWidth = 317
  ExplicitWidth = 323
  ExplicitHeight = 134
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel [0]
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  inherited btnOk: TBitBtn
    Left = 152
    Top = 56
    ExplicitLeft = 152
    ExplicitTop = 56
  end
  inherited btnCancel: TBitBtn
    Left = 232
    Top = 56
    ExplicitLeft = 232
    ExplicitTop = 56
  end
  inherited sbrRec: TdxStatusBar
    Top = 89
    Width = 317
    ExplicitTop = 89
    ExplicitWidth = 317
  end
  object ownerNameTextEdt: TcxDBTextEdit [4]
    Left = 8
    Top = 27
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsRec
    TabOrder = 3
    Width = 299
  end
  inherited qRec: TUniQuery
    SQL.Strings = (
      'SELECT * '
      'FROM m_owner')
    object qRecguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qRecname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
  end
end
