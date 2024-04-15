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
      'R.DESCRIPTION AS '#39'NOME'#39','
      'RG.DESCRIPTION AS '#39'GRUPO'#39','
      'R.PATH_REPORT'
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
    object qryReportsNOME: TStringField
      FieldName = 'NOME'
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
    object qryReportsPATH_REPORT: TStringField
      FieldName = 'PATH_REPORT'
      Origin = 'PATH_REPORT'
      Size = 260
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
      'SELECT '
      #9'U.*,'
      #9'UPU.`ALTER` AS USU_ALTER,'
      #9'UPU.`DELETE` AS USU_DELETE,'
      #9'UPU.`CREATE` AS USU_CREATE,'
      #9'UPR.`ALTER` AS REP_ALTER,'
      #9'UPR.`DELETE` AS REP_DELETE,'
      #9'UPR.`CREATE` AS REP_CREATE'
      'FROM tb_users as U '
      
        'LEFT JOIN TB_USER_PERMISSION AS UPU ON UPU.ID_USER = U.ID AND UP' +
        'U.DESC_PERMISSION = '#39'SystemUser'#39
      
        'LEFT JOIN TB_USER_PERMISSION AS UPR ON UPR.ID_USER = U.ID AND UP' +
        'R.DESC_PERMISSION = '#39'SystemReport'#39
      'WHERE id = :id_user')
    Left = 304
    Top = 40
    ParamData = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryUserPermission: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_user_permission '
      'where ID_USER = :id_login'
      'and DESC_PERMISSION = :p_type')
    Left = 216
    Top = 40
    ParamData = <
      item
        Name = 'ID_LOGIN'
        ParamType = ptInput
      end
      item
        Name = 'P_TYPE'
        ParamType = ptInput
      end>
  end
  object qryCadPermission: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_user_permission '
      'where ID_USER = :id_sel')
    Left = 304
    Top = 104
    ParamData = <
      item
        Name = 'ID_SEL'
        ParamType = ptInput
      end>
  end
  object qryCadReport: TFDQuery
    Connection = conSystem
    Left = 304
    Top = 168
  end
  object qryGroupsReport: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT * FROM TB_REPORTS_GROUP')
    Left = 216
    Top = 104
    object qryGroupsReportID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryGroupsReportDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 60
    end
  end
  object dsGroupsReport: TDataSource
    DataSet = qryGroupsReport
    Left = 216
    Top = 168
  end
  object qryCadGroupReport: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      '')
    Left = 384
    Top = 40
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 60
    end
  end
end
