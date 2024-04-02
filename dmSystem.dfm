object mSystem: TmSystem
  Height = 265
  Width = 484
  object conSystem: TFDConnection
    Params.Strings = (
      'Database=C:\Borgis\borgis.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object qryLogin: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_users')
    Left = 128
    Top = 40
  end
  object qryUsers: TFDQuery
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
  object qryCadUser: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_users')
    Left = 192
    Top = 40
  end
  object qryUserPermission: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_user_permission '
      'where ID_USER = :id_login')
    Left = 288
    Top = 40
    ParamData = <
      item
        Name = 'ID_LOGIN'
        ParamType = ptInput
      end>
  end
  object qryCadPermission: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_user_permission '
      'where ID_USER = :id_sel')
    Left = 288
    Top = 104
    ParamData = <
      item
        Name = 'ID_SEL'
        ParamType = ptInput
      end>
  end
end
