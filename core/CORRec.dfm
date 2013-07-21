object frmCORRec: TfrmCORRec
  Left = 456
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Record'
  ClientHeight = 155
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 136
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 0
    OnClick = PEvents
  end
  object btnCancel: TBitBtn
    Left = 216
    Top = 108
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = PEvents
  end
  object sbrRec: TdxStatusBar
    Left = 0
    Top = 142
    Width = 297
    Height = 13
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Creation time:'
        Width = 130
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Record ident:'
        Width = 130
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    SizeGrip = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object qRec: TUniQuery
    DataTypeMap = <>
    Connection = connectDm.dbServer
    AfterInsert = qRecAfterInsert
    Left = 8
    Top = 8
  end
  object dsRec: TUniDataSource
    DataSet = qRec
    Left = 48
    Top = 8
  end
end
