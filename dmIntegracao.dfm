object mIntegracao: TmIntegracao
  Height = 284
  Width = 365
  object conIntegracao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = 'masterkey'
    Protocol = 'firebird-2.0'
    LibraryLocation = 'C:\Program Files (x86)\Firebird\Firebird_2_0\bin\fbclient.dll'
    Left = 80
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 144
    Top = 80
  end
  object ZQuery1: TZQuery
    Connection = conIntegracao
    SQL.Strings = (
      'select * from receber')
    Params = <>
    Left = 144
    Top = 32
    object ZQuery1DOCUMENTO: TWideStringField
      FieldName = 'DOCUMENTO'
      Required = True
      Size = 14
    end
    object ZQuery1HISTORICO: TWideStringField
      FieldName = 'HISTORICO'
      Size = 35
    end
    object ZQuery1COD_CLIENTE: TWideStringField
      FieldName = 'COD_CLIENTE'
      Size = 6
    end
    object ZQuery1NOM_CLIENTE: TWideStringField
      FieldName = 'NOM_CLIENTE'
      Size = 60
    end
    object ZQuery1EMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object ZQuery1VENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object ZQuery1VALOR_DUP: TExtendedField
      FieldName = 'VALOR_DUP'
      Precision = 19
    end
    object ZQuery1RECEBIMENTO: TDateField
      FieldName = 'RECEBIMENTO'
    end
    object ZQuery1VALOR_REC: TExtendedField
      FieldName = 'VALOR_REC'
      Precision = 19
    end
    object ZQuery1VALOR_JUR: TExtendedField
      FieldName = 'VALOR_JUR'
      Precision = 19
    end
    object ZQuery1VALOR_DES: TExtendedField
      FieldName = 'VALOR_DES'
      Precision = 19
    end
    object ZQuery1ESPECIE: TWideStringField
      FieldName = 'ESPECIE'
      Size = 40
    end
    object ZQuery1CTO_CUSTO: TWideStringField
      FieldName = 'CTO_CUSTO'
      Size = 6
    end
    object ZQuery1PORTADOR: TWideStringField
      FieldName = 'PORTADOR'
      Size = 40
    end
    object ZQuery1TIPO_DOC: TWideStringField
      FieldName = 'TIPO_DOC'
    end
    object ZQuery1COMP: TWideStringField
      FieldName = 'COMP'
      Size = 3
    end
    object ZQuery1BANCO: TWideStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object ZQuery1AGENCIA: TWideStringField
      FieldName = 'AGENCIA'
      Size = 4
    end
    object ZQuery1CONTA: TWideStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object ZQuery1CHEQUE: TWideStringField
      FieldName = 'CHEQUE'
      Size = 6
    end
    object ZQuery1OBSERVACOES: TWideMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftWideMemo
    end
    object ZQuery1NOSSO_NUM: TWideStringField
      FieldName = 'NOSSO_NUM'
    end
    object ZQuery1CONTA_BANCARIA_ID: TIntegerField
      FieldName = 'CONTA_BANCARIA_ID'
    end
    object ZQuery1NOVO_DOC: TWideStringField
      FieldName = 'NOVO_DOC'
      Size = 14
    end
    object ZQuery1VENDAS_ID: TIntegerField
      FieldName = 'VENDAS_ID'
    end
    object ZQuery1ID_DEVOLUCAO_FINANCEIRO: TIntegerField
      FieldName = 'ID_DEVOLUCAO_FINANCEIRO'
    end
    object ZQuery1VALOR_REC_CREDITO: TExtendedField
      FieldName = 'VALOR_REC_CREDITO'
      Precision = 19
    end
    object ZQuery1NRO_PDV: TWideStringField
      FieldName = 'NRO_PDV'
    end
    object ZQuery1DUPLICATA_DESCONTO: TExtendedField
      FieldName = 'DUPLICATA_DESCONTO'
      Precision = 19
    end
    object ZQuery1DUPLICATA_DESCONTO_DATA: TDateField
      FieldName = 'DUPLICATA_DESCONTO_DATA'
    end
    object ZQuery1ID: TIntegerField
      FieldName = 'ID'
    end
    object ZQuery1ID_MOVIMENTACAO_CARTAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO_CARTAO'
    end
    object ZQuery1PERC_TAXA: TExtendedField
      FieldName = 'PERC_TAXA'
      Precision = 19
    end
    object ZQuery1PERC_TAXA_ANTECIPACAO: TExtendedField
      FieldName = 'PERC_TAXA_ANTECIPACAO'
      Precision = 19
    end
    object ZQuery1VALOR_TAXA: TExtendedField
      FieldName = 'VALOR_TAXA'
      Precision = 19
    end
    object ZQuery1VALOR_TAXA_OPERACAO: TExtendedField
      FieldName = 'VALOR_TAXA_OPERACAO'
      Precision = 19
    end
    object ZQuery1ID_EXTRATO_CREDITO: TIntegerField
      FieldName = 'ID_EXTRATO_CREDITO'
    end
    object ZQuery1ID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
    end
    object ZQuery1CODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
    end
  end
end
