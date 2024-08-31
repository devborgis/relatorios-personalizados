object mSystem: TmSystem
  Height = 448
  Width = 883
  object conSystem: TFDConnection
    Params.Strings = (
      'Database=C:\Borgis\SYS.db'
      'MonitorBy=S'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 56
    Top = 48
  end
  object qryLogin: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from TB_USUARIO where LOGIN = :login and SENHA = :senha')
    Left = 192
    Top = 48
    ParamData = <
      item
        Name = 'LOGIN'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
  object qryUsuLista: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT '
      'ID, '
      'NAME AS '#39'NOME'#39
      'FROM TB_USERS'
      '')
    Left = 248
    Top = 48
  end
  object qryRelLista: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT'
      #9'R.*,'
      #9'RG.DESCRICAO AS `GRUPO`,'
      #9'RSG.DESCRICAO AS `SUB GRUPO` '
      'FROM TB_RELATORIO R '
      'INNER JOIN TB_USU_PERMISSAO UP ON UP.ID_RELATORIO = R.ID '
      'LEFT JOIN TB_REL_GRUPO RG ON RG.ID = R.ID_GRUPO '
      'LEFT JOIN TB_REL_SUB_GRUPO RSG ON RSG.ID = R.ID_SUB_GRUPO '
      'WHERE UP.ID_USU = :USU_LOGADO'
      'AND UP.VISUALIZAR = 1')
    Left = 328
    Top = 48
    ParamData = <
      item
        Name = 'USU_LOGADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryRelListaID: TFDAutoIncField
      DisplayWidth = 3
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryRelListaNOME: TStringField
      DisplayWidth = 250
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 250
    end
    object qryRelListaDESCRICAO: TStringField
      DisplayWidth = 250
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 250
    end
    object qryRelListaID_GRUPO: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
    end
    object qryRelListaID_SUB_GRUPO: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_SUB_GRUPO'
      Origin = 'ID_SUB_GRUPO'
    end
    object qryRelListaFR3: TBlobField
      DisplayWidth = 10
      FieldName = 'FR3'
      Origin = 'FR3'
    end
    object qryRelListaGRUPO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelListaSUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'SUB GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsUsuLista: TDataSource
    DataSet = qryUsuLista
    Left = 248
    Top = 112
  end
  object dsRelLista: TDataSource
    DataSet = qryRelLista
    Left = 328
    Top = 112
  end
  object qryUsuPermissao: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_user_permission '
      'where ID_USER = :id_login'
      'and DESC_PERMISSION = :p_type')
    Left = 520
    Top = 48
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
  object qryGruRelLista: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT * FROM TB_REPORTS_GROUP')
    Left = 424
    Top = 48
    object qryGruRelListaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryGruRelListaDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 60
    end
  end
  object dsGruRelLista: TDataSource
    DataSet = qryGruRelLista
    Left = 424
    Top = 112
  end
  object qryCRUD: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'select * from TB_USUARIO where LOGIN = :login and SENHA = :senha')
    Left = 128
    Top = 112
    ParamData = <
      item
        Name = 'LOGIN'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
  object FDTransaction1: TFDTransaction
    Connection = conSystem
    Left = 56
    Top = 112
  end
  object dsUsuPermissao: TDataSource
    DataSet = qryUsuPermissao
    Left = 520
    Top = 112
  end
  object qrySubGrupRel: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT * FROM TB_REPORTS_GROUP')
    Left = 624
    Top = 48
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
  object dsSubGrupRel: TDataSource
    DataSet = qrySubGrupRel
    Left = 624
    Top = 112
  end
  object dsUsuLogado: TDataSource
    DataSet = qryLogin
    Left = 192
    Top = 112
  end
end
