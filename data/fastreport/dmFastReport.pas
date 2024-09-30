unit dmFastReport;

interface

uses
  System.SysUtils, System.Classes, frxExportCSV, frxExportDOCX, frxExportXLSX,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDesgn, Data.DB,
  IBX.IBDatabase, frxIBXComponents, frxGradient, frxChBox,
  frxCellularTextObject, frxMap, frxTableObject, frxGaugeView, frxCross,
  frxRich, frxOLE, frxBarcode, frxChart, frxDCtrl, frxFDComponents,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, uConf, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, vcl.Dialogs, dmIntegracao;

type
  TmFastReport = class(TDataModule)
    frxIBXComponents1: TfrxIBXComponents;
    IBXFast: TIBDatabase;
    frxDesigner1: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxDOCXExport1: TfrxDOCXExport;
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
    frxDialogControls1: TfrxDialogControls;
    frxChartObject1: TfrxChartObject;
    frxFDComponents1: TfrxFDComponents;
    FDCFast: TFDConnection;
    frxReport1: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure configuraFDC;
    procedure configuraIBX;
  end;

var
  mFastReport: TmFastReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TmFastReport.DataModuleCreate(Sender: TObject);
begin
  IBXComponents.Free;
end;

procedure TmFastReport.configuraIBX;
var
  ParamsDB: TStringList;
begin
  try
    if not Conf.getConfExiste then
    begin
      ShowMessage('Arquivo conf n�o encontrado para prosseguir com a configura��o do IBX');
      Exit;
    end;

    if Conf.getIBX = 'True' then
    begin

      IBXFast.DatabaseName := conf.getSRV + ':' + Conf.getPathDatabase;

      ParamsDB := TStringList.Create;
      try
        ParamsDB.Add('password=' + Conf.getPassWord);
        ParamsDB.Add('user_name=' + Conf.getUser);
        ParamsDB.Add('lc_ctype=' + Conf.getCharset);
        IBXFast.Params := ParamsDB;
        IBXFast.Connected := True;
      finally
        ParamsDB.Free;
      end;
    end
    else
    begin
      ShowMessage('Erro ao definir conex�o para componente IBX');
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao configurar a conex�o IBX: ' + E.Message);
  end;
end;

procedure TmFastReport.configuraFDC;
var
  ServerInfo, ServerIP, ServerPort: string;
  DelimiterPos: Integer;
begin
  try
    if not Conf.getConfExiste then
    begin
      ShowMessage('Arquivo conf n�o encontrado para prosseguir com a configura��o do FDC');
      Exit;
    end;

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
      FDCFast.DriverName := 'FD';
      FDCFast.Params.Values['Database'] := ServerIP + '/' + ServerPort + ':' + Conf.getPathDatabase; // Formar a string de conex�o
      FDCFast.Params.Values['User_Name'] := Conf.getUser;
      FDCFast.Params.Values['Password'] := Conf.getPassWord;
      FDCFast.Params.Values['LibraryName'] := Conf.getPathDll;
      FDCFast.Params.Values['CharacterSet'] := Conf.getCharset;
      FDCFast.Connected := True;
    end
    else if Conf.getProtocol = 'Postgres' then
    begin
      FDCFast.DriverName := 'PG';
      FDCFast.Params.Values['Database'] := Conf.getPathDatabase;
      FDCFast.Params.Values['User_Name'] := Conf.getUser;
      FDCFast.Params.Values['Password'] := Conf.getPassWord;
      FDCFast.Params.Values['Server'] := ServerIP;
      FDCFast.Params.Values['CharacterSet'] := Conf.getCharset;
      if ServerPort <> '' then
        FDCFast.Params.Values['Port'] := ServerPort
      else
        FDCFast.Params.Values['Port'] := '5432'; // Porta padr�o do PostgreSQL
        FDCFast.Connected := True;
    end
    else if Conf.getProtocol = 'MySql' then
    begin
      FDCFast.DriverName := 'MySQL';
      FDCFast.Params.Values['Database'] := Conf.getPathDatabase;
      FDCFast.Params.Values['User_Name'] := Conf.getUser;
      FDCFast.Params.Values['Password'] := Conf.getPassWord;
      FDCFast.Params.Values['Server'] := ServerIP;
      FDCFast.Params.Values['CharacterSet'] := Conf.getCharset;
      if ServerPort <> '' then
        FDCFast.Params.Values['Port'] := ServerPort
      else
        FDCFast.Params.Values['Port'] := '3306'; // Porta padr�o do MySQL
      FDCFast.Params.Values['LibraryName'] := Conf.getPathDll;
      FDCFast.Connected := True;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao configurar a conex�o: ' + E.Message);
  end;
end;


end.
