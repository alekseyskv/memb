inherited editShareForm: TeditShareForm
  Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100#1102
  ClientHeight = 238
  ClientWidth = 273
  ExplicitWidth = 279
  ExplicitHeight = 270
  PixelsPerInch = 96
  TextHeight = 13
  object lblObjName: TLabel [0]
    Left = 8
    Top = 8
    Width = 39
    Height = 13
    Caption = #1054#1073#1098#1077#1082#1090
  end
  object lblOwnerName: TLabel [1]
    Left = 8
    Top = 54
    Width = 49
    Height = 13
    Caption = #1042#1083#1072#1076#1077#1083#1077#1094
  end
  object lblDateBeg: TLabel [2]
    Left = 8
    Top = 100
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object lblDateEnd: TLabel [3]
    Left = 182
    Top = 100
    Width = 83
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object lblShare: TLabel [4]
    Left = 8
    Top = 146
    Width = 44
    Height = 13
    Caption = #1044#1086#1083#1103', %'
  end
  inherited btnOk: TBitBtn
    Left = 109
    Top = 192
    ExplicitLeft = 109
    ExplicitTop = 192
  end
  inherited btnCancel: TBitBtn
    Left = 190
    Top = 192
    ExplicitLeft = 190
    ExplicitTop = 192
  end
  inherited sbrRec: TdxStatusBar
    Top = 225
    Width = 273
    ExplicitTop = 225
    ExplicitWidth = 273
  end
  object objectCmb: TcxDBLookupComboBox [8]
    Left = 8
    Top = 27
    DataBinding.DataField = 'object_guid'
    DataBinding.DataSource = dsRec
    Properties.KeyFieldNames = 'guid'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dataDm.dsObjectCmbList
    TabOrder = 3
    Width = 257
  end
  object ownerCmb: TcxDBLookupComboBox [9]
    Left = 8
    Top = 73
    DataBinding.DataField = 'owner_guid'
    DataBinding.DataSource = dsRec
    Properties.KeyFieldNames = 'guid'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dataDm.dsOwnerCmbList
    TabOrder = 4
    Width = 257
  end
  object startDateEdt: TcxDBDateEdit [10]
    Left = 8
    Top = 119
    DataBinding.DataField = 'start_date'
    DataBinding.DataSource = dsRec
    TabOrder = 5
    Width = 121
  end
  object finishDateEdt: TcxDBDateEdit [11]
    Left = 144
    Top = 119
    DataBinding.DataField = 'finish_date'
    DataBinding.DataSource = dsRec
    TabOrder = 6
    Width = 121
  end
  object shareCalcEdt: TcxDBCalcEdit [12]
    Left = 8
    Top = 165
    DataBinding.DataField = 'share'
    DataBinding.DataSource = dsRec
    TabOrder = 7
    Width = 257
  end
  inherited qRec: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM m_share')
    object qRecguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qRecobject_guid: TWideStringField
      FieldName = 'object_guid'
      Size = 36
    end
    object qRecowner_guid: TWideStringField
      FieldName = 'owner_guid'
      Size = 36
    end
    object qRecstart_date: TDateField
      FieldName = 'start_date'
    end
    object qRecfinish_date: TDateField
      FieldName = 'finish_date'
    end
    object qRecshare: TFloatField
      FieldName = 'share'
    end
  end
end
