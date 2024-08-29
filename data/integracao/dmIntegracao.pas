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
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, frxDesgn, frxClass, IBX.IBDatabase,
  frxExportCSV, frxExportImage, frxExportHTML, frxExportPDF, frxExportPPTX,
  frxExportBaseDialog, frxExportXLSX, frxFDComponents, frxIBXComponents,
  frxPDFViewer, frxChart, frxDCtrl, frxDMPExport, frxGradient, frxChBox,
  frxCellularTextObject, frxMap, frxTableObject, frxGaugeView, frxCross,
  frxRich, frxOLE, frxBarcode, uConf, Dialogs;

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
  private
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
begin
  try

    ServerInfo := Conf.getSRV; // Exemplo: retorna "192.168.1.100/5432"

    // Separando o IP e a porta
    DelimiterPos := Pos('/', ServerInfo); // Encontrar a posi��o do delimitador '/'
    if DelimiterPos > 0 then
    begin
      ServerIP := Copy(ServerInfo, 1, DelimiterPos - 1); // Extrair o IP antes do '/'
      ServerPort := Copy(ServerInfo, DelimiterPos + 1, Length(ServerInfo) - DelimiterPos); // Extrair a porta ap�s o '/'
    end
    else
    begin
      ServerIP := ServerInfo; // Caso n�o haja porta, considere toda a string como IP
      ServerPort := ''; // Porta vazia ou padr�o dependendo do banco de dados
    end;

    if Conf.getProtocol = 'Firebird' then
    begin
      DBIntegracao.DriverName := 'FD';
      DBIntegracao.Params.Values['Database'] := ServerIP + '/' + ServerPort + ':' + Conf.getPathDatabase; // Formar a string de conex�o
      DBIntegracao.Params.Values['User_Name'] := Conf.getUser;
      DBIntegracao.Params.Values['Password'] := Conf.getPassWord;
      DBIntegracao.Params.Values['LibraryName'] := Conf.getPathDll;
      DBIntegracao.Params.Values['CharacterSet'] := Conf.getCharset;
      DBIntegracao.Connected := True;
    end
    else if Conf.getProtocol = 'Postgres' then
    begin
      DBIntegracao.DriverName := 'PG';
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
    end
    else if Conf.getProtocol = 'MySql' then
    begin
      DBIntegracao.DriverName := 'MySQL';
      DBIntegracao.Params.Values['Database'] := Conf.getPathDatabase;
      DBIntegracao.Params.Values['User_Name'] := Conf.getUser;
      DBIntegracao.Params.Values['Password'] := Conf.getPassWord;
      DBIntegracao.Params.Values['Server'] := ServerIP;
      DBIntegracao.Params.Values['CharacterSet'] := Conf.getCharset;
      if ServerPort <> '' then
        DBIntegracao.Params.Values['Port'] := ServerPort
      else
        DBIntegracao.Params.Values['Port'] := '3306'; // Porta padr�o do MySQL
      DBIntegracao.Params.Values['LibraryName'] := Conf.getPathDll;
      DBIntegracao.Connected := True;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao configurar a conex�o: ' + E.Message);
  end;
end;

end.
