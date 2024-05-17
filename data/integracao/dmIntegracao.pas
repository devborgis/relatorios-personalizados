{*****************************************************************************
 * Nome do Arquivo: dmIntegracao.pas
 * Descrição: Datamodule para controle do banco de dados de integração
 * Licença: Apache License, Version 2.0
 ******************************************************************************
 * Copyright (c) 2024 Vinicius Borges Gomes - Borgis & Co. Desenvolvimento
 ******************************************************************************
 * Informações de Licença:
 *
 * Este software é licenciado sob os termos da Licença Apache, Versão 2.0 (a "Licença");
 * Você não pode usar este arquivo, exceto em conformidade com a Licença.
 * Você pode obter uma cópia da Licença em
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * A menos que exigido por lei aplicável ou acordado por escrito, software
 * distribuído sob a Licença é distribuído "COMO ESTÁ", SEM GARANTIAS OU CONDIÇÕES DE QUALQUER TIPO,
 * expressa ou implícita.
 * Consulte a Licença para as permissões específicas que regem o uso do software.
 * ****************************************************************************}

unit dmIntegracao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, IniFiles;

type
  TmIntegracao = class(TDataModule)
    conIntegracao: TZConnection;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    ZQuery1DOCUMENTO: TWideStringField;
    ZQuery1HISTORICO: TWideStringField;
    ZQuery1COD_CLIENTE: TWideStringField;
    ZQuery1NOM_CLIENTE: TWideStringField;
    ZQuery1EMISSAO: TDateField;
    ZQuery1VENCIMENTO: TDateField;
    ZQuery1VALOR_DUP: TExtendedField;
    ZQuery1RECEBIMENTO: TDateField;
    ZQuery1VALOR_REC: TExtendedField;
    ZQuery1VALOR_JUR: TExtendedField;
    ZQuery1VALOR_DES: TExtendedField;
    ZQuery1ESPECIE: TWideStringField;
    ZQuery1CTO_CUSTO: TWideStringField;
    ZQuery1PORTADOR: TWideStringField;
    ZQuery1TIPO_DOC: TWideStringField;
    ZQuery1COMP: TWideStringField;
    ZQuery1BANCO: TWideStringField;
    ZQuery1AGENCIA: TWideStringField;
    ZQuery1CONTA: TWideStringField;
    ZQuery1CHEQUE: TWideStringField;
    ZQuery1OBSERVACOES: TWideMemoField;
    ZQuery1NOSSO_NUM: TWideStringField;
    ZQuery1CONTA_BANCARIA_ID: TIntegerField;
    ZQuery1NOVO_DOC: TWideStringField;
    ZQuery1VENDAS_ID: TIntegerField;
    ZQuery1ID_DEVOLUCAO_FINANCEIRO: TIntegerField;
    ZQuery1VALOR_REC_CREDITO: TExtendedField;
    ZQuery1NRO_PDV: TWideStringField;
    ZQuery1DUPLICATA_DESCONTO: TExtendedField;
    ZQuery1DUPLICATA_DESCONTO_DATA: TDateField;
    ZQuery1ID: TIntegerField;
    ZQuery1ID_MOVIMENTACAO_CARTAO: TIntegerField;
    ZQuery1PERC_TAXA: TExtendedField;
    ZQuery1PERC_TAXA_ANTECIPACAO: TExtendedField;
    ZQuery1VALOR_TAXA: TExtendedField;
    ZQuery1VALOR_TAXA_OPERACAO: TExtendedField;
    ZQuery1ID_EXTRATO_CREDITO: TIntegerField;
    ZQuery1ID_DOCUMENTO: TIntegerField;
    ZQuery1CODIGO_BANCO: TIntegerField;
  private
    { Private declarations }
  public
    procedure ConfConnection;
  end;

var
  mIntegracao: TmIntegracao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TmIntegracao.ConfConnection;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + '\.integracao\config.ini';
  Ini := TIniFile.Create(IniFile);

  try
    conIntegracao.Database := Ini.ReadString('CONEXAO', 'DATABASE', '');
    conIntegracao.LibraryLocation := Ini.ReadString('CONEXAO', 'DLL', '');
    conIntegracao.Port := StrToInt(Ini.ReadString('CONEXAO', 'PORT', '0'));
    conIntegracao.HostName := Ini.ReadString('CONEXAO', 'HOST', '');
    conIntegracao.User := Ini.ReadString('CONEXAO', 'USER', '');
    conIntegracao.Password := Ini.ReadString('CONEXAO', 'PASSWORD', '');
  finally
    Ini.Free;
  end;

end;

end.
