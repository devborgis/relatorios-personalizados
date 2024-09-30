{*****************************************************************************
 * Nome do Arquivo: dmIntegracao.pas
 * Descri��o: Datamodule para controle do banco de dados de integra��o
 * Licen�a: Apache License, Version 2.0
 ******************************************************************************
 * Copyright (c) 2024 Vinicius Borges Gomes - Borgis & Co. Desenvolvimento
 ******************************************************************************
 * Informa��es de Licen�a:
 *
 * Este software � licenciado sob os termos da Licen�a Apache, Vers�o 2.0 (a "Licen�a");
 * Voc� n�o pode usar este arquivo, exceto em conformidade com a Licen�a.
 * Voc� pode obter uma c�pia da Licen�a em
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * A menos que exigido por lei aplic�vel ou acordado por escrito, software
 * distribu�do sob a Licen�a � distribu�do "COMO EST�", SEM GARANTIAS OU CONDI��ES DE QUALQUER TIPO,
 * expressa ou impl�cita.
 * Consulte a Licen�a para as permiss�es espec�ficas que regem o uso do software.
 * ****************************************************************************}

unit dmIntegracao;

interface

uses
  System.SysUtils, System.Classes, IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, frxDesgn, frxClass, IBX.IBDatabase,
  frxExportCSV, frxExportImage, frxExportHTML, frxExportPDF, frxExportPPTX,
  frxExportBaseDialog, frxExportXLSX, frxFDComponents, frxIBXComponents,
  frxPDFViewer, frxChart, frxDCtrl, frxDMPExport, frxGradient, frxChBox,
  frxCellularTextObject, frxMap, frxTableObject, frxGaugeView, frxCross,
  frxRich, frxOLE, frxBarcode, uConf, Dialogs, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FBDef, FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Phys.MySQL, FireDAC.Comp.UI, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Data.DB;

type
  TmIntegracao = class(TDataModule)
    DBIntegracao: TFDConnection;
    IBXIntegracao: TIBDatabase;
    fReport: TfrxReport;
    fReportDesigner: TfrxDesigner;
    frxXLSXExport1: TfrxXLSXExport;
    frxPPTXExport1: TfrxPPTXExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPNGExport1: TfrxPNGExport;
    frxCSVExport1: TfrxCSVExport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxRichObject1: TfrxRichObject;
    frxCrossObject1: TfrxCrossObject;
    frxGaugeObject1: TfrxGaugeObject;
    frxReportTableObject1: TfrxReportTableObject;
    frxMapObject1: TfrxMapObject;
    frxReportCellularTextObject1: TfrxReportCellularTextObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxGradientObject1: TfrxGradientObject;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxDialogControls1: TfrxDialogControls;
    frxChartObject1: TfrxChartObject;
    frxPDFObject1: TfrxPDFObject;
    frxIBXComponents1: TfrxIBXComponents;
    frxFDComponents1: TfrxFDComponents;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    FBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConfiguraFirebird(const ServerIP, ServerPort: string);
    procedure ConfiguraMySql(const ServerIP, ServerPort: string);
    procedure ConfiguraPostgres(const ServerIP, ServerPort: string);
    procedure ConfiguraIBX;
    { Private declarations }
  public
    procedure confFDIntegracao;
  end;

var
  mIntegracao: TmIntegracao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TmIntegracao }

procedure TmIntegracao.confFDIntegracao;
var
  ServerInfo, ServerIP, ServerPort: string;
  DelimiterPos: Integer;
  I: Integer;
  ParamStr: string;
begin

  DBIntegracao.Connected := False;
  try
    // Separar IP e Porta
    ServerInfo := Conf.getSRV;
    DelimiterPos := Pos('/', ServerInfo);
    if DelimiterPos > 0 then
    begin
      ServerIP := Copy(ServerInfo, 1, DelimiterPos - 1);
      ServerPort := Copy(ServerInfo, DelimiterPos + 1, Length(ServerInfo) - DelimiterPos);
    end
    else
    begin
      ServerIP := ServerInfo;
      ServerPort := '';
    end;

    // Configura��o de acordo com o protocolo
    if Conf.getProtocol = 'Firebird' then
      ConfiguraFirebird(ServerIP, ServerPort)
    else if Conf.getProtocol = 'Postgres' then
      ConfiguraPostgres(ServerIP, ServerPort)
    else if Conf.getProtocol = 'MySql' then
      ConfiguraMySql(ServerIP, ServerPort);

    if conf.getIBX = 'True' then
      begin
        ConfiguraIBX
      end;

  except
    on E: Exception do
      raise Exception.Create('Erro ao configurar a conex�o: ' + E.Message); // Repassa a exce��o
  end;

  ParamStr := '';
  for I := 0 to DBIntegracao.Params.Count - 1 do
  begin
    ParamStr := ParamStr + DBIntegracao.Params.Names[I] + '=' + DBIntegracao.Params.Values[DBIntegracao.Params.Names[I]] + sLineBreak;
  end;
  ShowMessage(ParamStr);
end;

procedure TmIntegracao.ConfiguraFirebird(const ServerIP, ServerPort: string);
begin
  try
    DBIntegracao.Params.DriverID := 'FB';
    DBIntegracao.Params.Values['Database'] := ServerIP + '/' + ServerPort + ':' + Conf.getPathDatabase;
    DBIntegracao.Params.Values['User_Name'] := Conf.getUser;
    DBIntegracao.Params.Values['Password'] := Conf.getPassWord;
    DBIntegracao.Params.Values['CharacterSet'] := Conf.getCharset;
    if ServerPort <> '' then
      DBIntegracao.Params.Values['Port'] := ServerPort
    else
      DBIntegracao.Params.Values['Port'] := '3050'; // Porta padr�o do Firebird
    FBDriverLink.VendorLib := Conf.getPathDll;
    DBIntegracao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Conex�o Firebird: ' + E.Message);
  end;
end;

procedure TmIntegracao.ConfiguraIBX;
var
  ParamsDB: TStringList;
begin
  IBXIntegracao.Connected := False;
  try
      IBXIntegracao.DatabaseName := Conf.getSRV + ':' + Conf.getPathDatabase;

      ParamsDB := TStringList.Create;
      try
        ParamsDB.Add('password=' + Conf.getPassWord);
        ParamsDB.Add('user_name=' + Conf.getUser);
        ParamsDB.Add('lc_ctype=' + Conf.getCharset);
        IBXIntegracao.Params := ParamsDB;
        IBXIntegracao.Connected := True;
      finally
        ParamsDB.Free;
      end;
  except
    on E: Exception do
      raise Exception.Create('Conex�o IBX: ' + E.Message);
  end;
end;

procedure TmIntegracao.ConfiguraPostgres(const ServerIP, ServerPort: string);
begin
  try
    DBIntegracao.Params.DriverID := 'PG';
    DBIntegracao.Params.Values['Database'] := Conf.getPathDatabase;
    DBIntegracao.Params.Values['User_Name'] := Conf.getUser;
    DBIntegracao.Params.Values['Password'] := Conf.getPassWord;
    DBIntegracao.Params.Values['Server'] := ServerIP;
    DBIntegracao.Params.Values['CharacterSet'] := Conf.getCharset;
    if ServerPort <> '' then
      DBIntegracao.Params.Values['Port'] := ServerPort
    else
      DBIntegracao.Params.Values['Port'] := '5432'; // Porta padr�o do PostgreSQL
    DBIntegracao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Conex�o Postgres: ' + E.Message);
  end;
end;

procedure TmIntegracao.DataModuleCreate(Sender: TObject);
begin
  {MySQLDriverLink.VendorLib := ExtractFilePath(ExtractFilePath(ParamStr(0)) + 'lib\LYBMYSQL.DLL');
    PGDriverLink.VendorHome   := ExtractFilePath(ExtractFilePath(ParamStr(0)));
      //PGDriverLink.VendorHome   := ExtractFilePath(ExtractFilePath(ParamStr(0)) + 'lib\libpq.dll');}
end;

procedure TmIntegracao.ConfiguraMySql(const ServerIP, ServerPort: string);
begin
  try
    DBIntegracao.Params.DriverID := 'MySQL';
    DBIntegracao.Params.Values['Database'] := Conf.getPathDatabase;
    DBIntegracao.Params.Values['User_Name'] := Conf.getUser;
    DBIntegracao.Params.Values['Password'] := Conf.getPassWord;
    DBIntegracao.Params.Values['Server'] := ServerIP;
    DBIntegracao.Params.Values['CharacterSet'] := Conf.getCharset;
    if ServerPort <> '' then
      DBIntegracao.Params.Values['Port'] := ServerPort
    else
      DBIntegracao.Params.Values['Port'] := '3306'; // Porta padr�o do MySQL
    MySQLDriverLink.VendorLib := Conf.getPathDll;
    DBIntegracao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Conex�o MySQL: ' + E.Message);
  end;
end;


end.
