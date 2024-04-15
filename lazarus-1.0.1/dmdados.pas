{*****************************************************************************
 * Nome do Arquivo: dmdados.pas
 * Descrição: DataModule para controle de conexão e sql's
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


unit dmDados;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, SdfData, SQLDB, IBConnection, Controls, Graphics, Dialogs, ZConnection, ZDataset, IniFiles;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    dsClientes: TDataSource;
    dsRelRastreioConta: TDataSource;
    qryClientes: TZQuery;
    qryClientesID: TStringField;
    qryClientesNOME: TStringField;
    qryParcelaOriginalAGENCIA: TStringField;
    qryParcelaOriginalBANCO: TStringField;
    qryParcelaOriginalCANCELADA: TSmallintField;
    qryParcelaOriginalCHEQUE: TStringField;
    qryParcelaOriginalCODIGO_BANCO: TLongintField;
    qryParcelaOriginalCOD_CLIENTE: TStringField;
    qryParcelaOriginalCOMP: TStringField;
    qryParcelaOriginalCONTA: TStringField;
    qryParcelaOriginalCONTA_BANCARIA_ID: TLongintField;
    qryParcelaOriginalCTO_CUSTO: TStringField;
    qryParcelaOriginalDOCUMENTO: TStringField;
    qryParcelaOriginalDUPLICATA_DESCONTO: TFloatField;
    qryParcelaOriginalDUPLICATA_DESCONTO_DATA: TDateField;
    qryParcelaOriginalEMISSAO: TDateField;
    qryParcelaOriginalESPECIE: TStringField;
    qryParcelaOriginalHISTORICO: TStringField;
    qryParcelaOriginalID: TLongintField;
    qryParcelaOriginalID_DEVOLUCAO_FINANCEIRO: TLongintField;
    qryParcelaOriginalID_DOCUMENTO: TLongintField;
    qryParcelaOriginalID_EXTRATO_CREDITO: TLongintField;
    qryParcelaOriginalID_MOVIMENTACAO_CARTAO: TLongintField;
    qryParcelaOriginalNOM_CLIENTE: TStringField;
    qryParcelaOriginalNOSSO_NUM: TStringField;
    qryParcelaOriginalNOVO_DOC: TStringField;
    qryParcelaOriginalNRO_PDV: TStringField;
    qryParcelaOriginalNUM_CONTA: TStringField;
    qryParcelaOriginalNUM_PARCELA: TSmallintField;
    qryParcelaOriginalOBSERVACOES: TMemoField;
    qryParcelaOriginalPERC_TAXA: TFloatField;
    qryParcelaOriginalPERC_TAXA_ANTECIPACAO: TFloatField;
    qryParcelaOriginalPORTADOR: TStringField;
    qryParcelaOriginalRECEBIMENTO: TDateField;
    qryParcelaOriginalTIPO_DOC: TStringField;
    qryParcelaOriginalVALOR_DES: TFloatField;
    qryParcelaOriginalVALOR_DUP: TFloatField;
    qryParcelaOriginalVALOR_JUR: TFloatField;
    qryParcelaOriginalVALOR_REC: TFloatField;
    qryParcelaOriginalVALOR_REC_CREDITO: TFloatField;
    qryParcelaOriginalVALOR_TAXA: TFloatField;
    qryParcelaOriginalVALOR_TAXA_OPERACAO: TFloatField;
    qryParcelaOriginalVENCIMENTO: TDateField;
    qryParcelaOriginalVENDAS_ID: TLongintField;
    qryRelRastreioConta: TZQuery;
    qryRelRastreioContaDOC_ORGINAL: TStringField;
    qryRelRastreioContaDOC_RESTANTE: TStringField;
    qryRelRastreioContaDT_EMISSAO_ORIGINAL: TDateField;
    qryRelRastreioContaDT_EMISSAO_RESTANTE: TDateField;
    qryRelRastreioContaHIS_ORIGINAL: TStringField;
    qryRelRastreioContaHIS_RESTANTE: TStringField;
    qryRelRastreioContaID_VENDA_ORIGINAL: TLongintField;
    qryRelRastreioContaJUROS_ORIGNAL: TFloatField;
    qryRelRastreioContaJUROS_RESTANTE: TFloatField;
    qryRelRastreioContaNOME_CLIENTE: TStringField;
    qryRelRastreioContaRECEBIDO_ORIGINAL: TFloatField;
    qryRelRastreioContaRECEBIDO_RESTANTE: TFloatField;
    qryRelRastreioContaRECEBIMENTO_ORIGINAL: TDateField;
    qryRelRastreioContaRECEBIMENTO_RESTANTE: TDateField;
    qryRelRastreioContaVALOR_ORIGINAL: TFloatField;
    qryRelRastreioContaVALOR_RESTANTE: TFloatField;
    qryRelRastreioContaVENCIMENTO_ORIGINAL: TDateField;
    qryRelRastreioContaVENCIMENTO_RESTANTE: TDateField;
    SQLConnection: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FExeCaminho: String;

  public
    procedure ConfiguraConexao;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
     FExeCaminho := ExtractFilePath(ParamStr(0));
end;

procedure TDataModule1.ConfiguraConexao;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := FExeCaminho + 'config.ini';
  Ini := TIniFile.Create(IniFile);

  try
    SQLConnection.Database := Ini.ReadString('CONEXAO', 'BANCO', '');
    SQLConnection.LibraryLocation := Ini.ReadString('CONEXAO', 'DLL', '');
    SQLConnection.Port := StrToInt(Ini.ReadString('CONEXAO', 'PORTA', '0'));
    SQLConnection.HostName := Ini.ReadString('CONEXAO', 'HOST', '');
    SQLConnection.User := Ini.ReadString('CONEXAO', 'USUARIO', '');
    SQLConnection.Password := Ini.ReadString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;

end.

