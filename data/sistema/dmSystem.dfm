object mSystem: TmSystem
  OnCreate = DataModuleCreate
  Height = 448
  Width = 1037
  object conSystem: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\rlsBorgis\Win32\Debug\SYS.DB'
      'MonitorBy=S'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
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
      'SELECT * FROM TB_USUARIO')
    Left = 248
    Top = 48
    object qryUsuListaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuListaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 150
    end
    object qryUsuListaSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryUsuListaLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 60
    end
    object qryUsuListaSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 60
    end
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
      Alignment = taCenter
      DisplayWidth = 3
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryRelListaNOME: TStringField
      DisplayWidth = 44
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 250
    end
    object qryRelListaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 250
    end
    object qryRelListaID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
    end
    object qryRelListaID_SUB_GRUPO: TIntegerField
      FieldName = 'ID_SUB_GRUPO'
      Origin = 'ID_SUB_GRUPO'
    end
    object qryRelListaGRUPO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 27
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelListaSUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 27
      FieldName = 'SUB GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelListaFR3: TStringField
      FieldName = 'FR3'
      Origin = 'FR3'
      Size = 250
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
      'SELECT * FROM TB_USU_PERMISSAO WHERE ID_USU = :ID')
    Left = 520
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryUsuPermissaoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuPermissaoID_USU: TIntegerField
      FieldName = 'ID_USU'
      Origin = 'ID_USU'
      Required = True
    end
    object qryUsuPermissaoID_FORM: TIntegerField
      FieldName = 'ID_FORM'
      Origin = 'ID_FORM'
    end
    object qryUsuPermissaoID_RELATORIO: TIntegerField
      FieldName = 'ID_RELATORIO'
      Origin = 'ID_RELATORIO'
    end
    object qryUsuPermissaoVISUALIZAR: TIntegerField
      FieldName = 'VISUALIZAR'
      Origin = 'VISUALIZAR'
      Required = True
    end
    object qryUsuPermissaoINCLUIR: TIntegerField
      FieldName = 'INCLUIR'
      Origin = 'INCLUIR'
      Required = True
    end
    object qryUsuPermissaoEXCLUIR: TIntegerField
      FieldName = 'EXCLUIR'
      Origin = 'EXCLUIR'
      Required = True
    end
    object qryUsuPermissaoEDITAR: TIntegerField
      FieldName = 'EDITAR'
      Origin = 'EDITAR'
      Required = True
    end
  end
  object qryGruRelLista: TFDQuery
    Connection = conSystem
    SQL.Strings = (
      'SELECT ID, DESCRICAO FROM TB_REL_GRUPO')
    Left = 424
    Top = 48
    object qryGruRelListaID: TFDAutoIncField
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGruRelListaDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      DisplayWidth = 82
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
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
      'SELECT ID, DESCRICAO FROM TB_REL_SUB_GRUPO')
    Left = 624
    Top = 48
    object qrySubGrupRelID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySubGrupRelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
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
  object SQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 200
  end
  object qryUsuCadPermissao: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = conSystem
    Transaction = FDTransaction1
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'SELECT '
      '    R.DESCRICAO AS DESCRICAO,'
      '    UP.VISUALIZAR,'
      '    UP.EXCLUIR,'
      '    UP.EDITAR,'
      '    UP.INCLUIR'
      'FROM TB_USU_PERMISSAO UP'
      'LEFT JOIN TB_RELATORIO R ON UP.ID_RELATORIO = R.ID'
      'WHERE UP.ID_RELATORIO IS NOT NULL'
      'AND UP.ID_USU = 1'
      ''
      'UNION '
      ''
      'SELECT '
      '    F.DESCRICAO AS DESCRICAO,'
      '    UP.VISUALIZAR,'
      '    UP.EXCLUIR,'
      '    UP.EDITAR,'
      '    UP.INCLUIR    '
      'FROM TB_USU_PERMISSAO UP'
      'LEFT JOIN TB_FORMULARIO F ON UP.ID_FORM = F.ID'
      'WHERE UP.ID_FORM IS NOT NULL'
      'AND UP.ID_USU = 1'
      ''
      '')
    Left = 704
    Top = 48
    object qryUsuCadPermissaoDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object qryUsuCadPermissaoVISUALIZAR: TIntegerField
      DisplayLabel = 'VIS'
      FieldName = 'VISUALIZAR'
      Required = True
    end
    object qryUsuCadPermissaoEXCLUIR: TIntegerField
      DisplayLabel = 'EXC'
      FieldName = 'EXCLUIR'
      Required = True
    end
    object qryUsuCadPermissaoEDITAR: TIntegerField
      DisplayLabel = 'EDT'
      FieldName = 'EDITAR'
      Required = True
    end
    object qryUsuCadPermissaoINCLUIR: TIntegerField
      DisplayLabel = 'INC'
      FieldName = 'INCLUIR'
      Required = True
    end
  end
  object dsUsuCadPermissao: TDataSource
    AutoEdit = False
    DataSet = qryUsuCadPermissao
    Left = 704
    Top = 112
  end
  object qryUsuCad: TFDQuery
    CachedUpdates = True
    Connection = conSystem
    SQL.Strings = (
      'select * from tb_usuariO where ID = :ID')
    Left = 792
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryUsuCadID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuCadSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryUsuCadNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 150
    end
    object qryUsuCadLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 60
    end
    object qryUsuCadSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 60
    end
  end
end
