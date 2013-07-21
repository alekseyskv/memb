object connectDm: TconnectDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 364
  Width = 548
  object dbServer: TUniConnection
    DataTypeMap = <>
    ProviderName = 'SQLite'
    Port = 3306
    Database = 
      'c:\Documents and Settings\ScvortsovAV\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\RAD Studio\P' +
      'rojects\Member\bin\member.db'
    SpecificOptions.Strings = (
      'MySQL.Charset=cp1251'
      'SQLite.UseUnicode=True')
    LoginPrompt = False
    Left = 44
    Top = 12
  end
  object SQLServerUniProvider: TSQLServerUniProvider
    Left = 48
    Top = 72
  end
end
