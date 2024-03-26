object mSystem: TmSystem
  OnCreate = DataModuleCreate
  Height = 328
  Width = 388
  object conSystem: TFDConnection
    Params.Strings = (
      'Database=C:\Borgis\borgis.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object qryLogin: TFDQuery
    Active = True
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_users')
    Left = 128
    Top = 40
  end
  object qryUsers: TFDQuery
    Active = True
    Connection = conSystem
    SQL.Strings = (
      'SELECT '
      'ID, '
      'NAME AS '#39'NOME'#39
      'FROM TB_USERS'
      '')
    Left = 56
    Top = 104
  end
  object qryReports: TFDQuery
    Active = True
    Connection = conSystem
    SQL.Strings = (
      'SELECT '
      'R.ID, '
      'R.DESCRIPTION AS '#39'DESCRI'#199#195'O'#39','
      'RG.DESCRIPTION AS '#39'GRUPO'#39
      'FROM TB_REPORTS AS R'
      'LEFT JOIN TB_REPORTS_GROUP AS RG ON RG.ID = R.ID_GROUP')
    Left = 120
    Top = 104
    object qryReportsID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryReportsDESCRIÇÃO: TStringField
      FieldName = 'DESCRI'#199#195'O'
      Origin = 'DESCRIPTION'
      Size = 100
    end
    object qryReportsGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsUsers: TDataSource
    DataSet = qryUsers
    Left = 56
    Top = 168
  end
  object dsReports: TDataSource
    DataSet = qryReports
    Left = 120
    Top = 168
  end
end
