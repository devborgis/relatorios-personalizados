{*****************************************************************************
 * Nome do Arquivo: dmSystem.pas
 * Descrição: DataModule para controle interno do sistema como versão, usuarios e armazenagem de relatorios
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

unit dmSystem;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TmSystem = class(TDataModule)
    conSystem: TFDConnection;
    qryLogin: TFDQuery;
    qryUsuLista: TFDQuery;
    qryRelLista: TFDQuery;
    dsUsuLista: TDataSource;
    dsRelLista: TDataSource;
    qryUsuPermissao: TFDQuery;
    qryGruRelLista: TFDQuery;
    dsGruRelLista: TDataSource;
    qryCRUD: TFDQuery;
    FDTransaction1: TFDTransaction;
    dsUsuPermissao: TDataSource;
    qrySubGrupRel: TFDQuery;
    dsSubGrupRel: TDataSource;
    dsUsuLogado: TDataSource;
    qryRelListaID: TFDAutoIncField;
    qryRelListaNOME: TStringField;
    qryRelListaDESCRICAO: TStringField;
    qryRelListaID_GRUPO: TIntegerField;
    qryRelListaID_SUB_GRUPO: TIntegerField;
    qryRelListaGRUPO: TStringField;
    qryRelListaSUBGRUPO: TStringField;
    qryUsuListaID: TFDAutoIncField;
    qryUsuListaSTATUS: TIntegerField;
    qryUsuListaNOME: TStringField;
    qryUsuListaLOGIN: TStringField;
    qryUsuListaSENHA: TStringField;
    qrySubGrupRelID: TFDAutoIncField;
    qrySubGrupRelDESCRICAO: TStringField;
    qryUsuPermissaoID: TFDAutoIncField;
    qryUsuPermissaoID_USU: TIntegerField;
    qryUsuPermissaoID_FORM: TIntegerField;
    qryUsuPermissaoID_RELATORIO: TIntegerField;
    qryUsuPermissaoVISUALIZAR: TIntegerField;
    qryUsuPermissaoINCLUIR: TIntegerField;
    qryUsuPermissaoEXCLUIR: TIntegerField;
    qryUsuPermissaoEDITAR: TIntegerField;
    qryGruRelListaID: TFDAutoIncField;
    qryGruRelListaDESCRICAO: TStringField;
    SQLiteDriverLink: TFDPhysSQLiteDriverLink;
    qryRelListaFR3: TStringField;
    qryUsuCadPermissao: TFDQuery;
    dsUsuCadPermissao: TDataSource;
    qryUsuCadPermissaoDESCRICAO: TStringField;
    qryUsuCadPermissaoVISUALIZAR: TIntegerField;
    qryUsuCadPermissaoEXCLUIR: TIntegerField;
    qryUsuCadPermissaoEDITAR: TIntegerField;
    qryUsuCadPermissaoINCLUIR: TIntegerField;
    qryUsuCad: TFDQuery;
    qryUsuCadID: TFDAutoIncField;
    qryUsuCadSTATUS: TIntegerField;
    qryUsuCadNOME: TStringField;
    qryUsuCadLOGIN: TStringField;
    qryUsuCadSENHA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mSystem: TmSystem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TmSystem.DataModuleCreate(Sender: TObject);
var CaminhoDB: String;
begin
  SQLiteDriverLink.VendorLib := ExtractFilePath(ExtractFilePath(ParamStr(0)) + 'lib\sqlite3.dll');
end;

end.
