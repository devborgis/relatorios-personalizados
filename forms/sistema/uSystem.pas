{*****************************************************************************
 * Nome do Arquivo: uSystem.pas
 * Descri��o: Tela pricipal do sistema
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

unit uSystem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, dmIntegracao, dmSystem,
  JvExControls, JvButton, JvTransparentButton, uCadUser, uCadReport, uUtils,
  Data.DB;

type
  TfrmSystem = class(TForm)
    pnlFundoSystem: TPanel;
    pnlTituloSystem: TPanel;
    pnlFooterSystem: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pgcSystem: TPageControl;
    tsReports: TTabSheet;
    tsUsers: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    dbgUsers: TDBGrid;
    dbgReports: TDBGrid;
    edtFilterDescReport: TEdit;
    btnExitSystem: TJvTransparentButton;
    btnHome: TJvTransparentButton;
    btnShowUsers: TJvTransparentButton;
    btnShowReports: TJvTransparentButton;
    tsMenu: TTabSheet;
    imgMenu: TImage;
    edtFilterNameUser: TEdit;
    btnEdtReport: TJvTransparentButton;
    btnPrintReport: TJvTransparentButton;
    btnDeleteReport: TJvTransparentButton;
    btnAddReport: TJvTransparentButton;
    btnEdtUser: TJvTransparentButton;
    btnCreateUser: TJvTransparentButton;
    btnDeleteUser: TJvTransparentButton;
    procedure btnExitSystemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowReportsClick(Sender: TObject);
    procedure btnShowUsersClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnCreateUserClick(Sender: TObject);
    procedure btnEdtUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure edtFilterNameUserChange(Sender: TObject);
    procedure edtFilterDescReportChange(Sender: TObject);
    procedure btnAddReportClick(Sender: TObject);
    procedure btnEdtReportClick(Sender: TObject);
    procedure btnDeleteReportClick(Sender: TObject);
    procedure btnPrintReportClick(Sender: TObject);
    procedure dbgReportsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSystem: TfrmSystem;

implementation

uses
  StrUtils,
  Math;

{$R *.dfm}
// adicionar relatorio
procedure TfrmSystem.btnAddReportClick(Sender: TObject);

begin

  frmCadReport := TfrmCadReport.Create(Self);
  frmCadReport.caption := 'Manuten��o de Relat�rios - INCLUIR';
  frmCadReport.edtIdReport.Text := 'NOVO';
  frmCadReport.edtNameReport.Clear;
  frmCadReport.edtPathReport.Clear;
  frmCadReport.cbbGroupReport.KeyValue := -1;
  frmCadReport.showmodal;
end;
// adicionar usuario
procedure TfrmSystem.btnCreateUserClick(Sender: TObject);
begin
  frmCadUser := TfrmCadUser.Create(Self);
  frmCadUser.Caption := 'Manuten��o de usu�rios - INCLUIR';
  frmCadUser.edtIdUser.Text := 'NOVO';
  frmCadUser.lbInfo.Visible := True;
  frmCadUser.GroupBox1.Visible := False;
  frmCadUser.GroupBox2.Visible := False;
  frmCadUser.ShowModal;
end;
// excluir relatorio - procedure na classe utils
procedure TfrmSystem.btnDeleteReportClick(Sender: TObject);
begin
  if MessageDlg('Essa a��o � irreversivel deseja continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Util.excRelatorio(dbgReports.DataSource.DataSet.FieldByName('ID').AsInteger);
      dbgReports.DataSource.DataSet.Refresh;
    end else
      begin
        exit;
      end;
end;
// excluir usuario - procedure na classe utils
procedure TfrmSystem.btnDeleteUserClick(Sender: TObject);
begin
    if MessageDlg('Essa a��o � irreversivel deseja continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Util.excUsuario(dbgUsers.DataSource.DataSet.FieldByName('ID').AsInteger);
      dbgUsers.DataSource.DataSet.Refresh;
    end else
      begin
        exit;
      end;
end;
// editar relatorio
procedure TfrmSystem.btnEdtReportClick(Sender: TObject);
var IdSelect:Integer;
begin

  IdSelect := dbgReports.DataSource.DataSet.FieldByName('ID').AsInteger;
  frmCadReport := TfrmCadReport.Create(Self);
  frmCadReport.caption := 'Manuten��o de Relat�rios - ALTERAR';
  frmCadReport.btnEdtReport.Visible := True;
  frmCadReport.PreencheDadosReport(IdSelect);
  frmCadReport.showmodal;
end;
// editar usuario
procedure TfrmSystem.btnEdtUserClick(Sender: TObject);
var IdSelect: Integer;
begin
  IdSelect := dbgUsers.DataSource.DataSet.FieldByName('ID').AsInteger;
  frmCadUser := TfrmCadUser.Create(Self);
  frmCadUser.Caption := 'Manuten��o de usu�rios - ALTERAR';
  frmCadUser.PreencheDadosUser(IdSelect);
  frmCadUser.lbInfo.Visible := false;
  frmCadUser.GroupBox1.Visible := True;
  frmCadUser.GroupBox2.Visible := True;
  frmCadUser.ShowModal;
end;
// sair do sistema
procedure TfrmSystem.btnExitSystemClick(Sender: TObject);
begin

  if MessageDlg('Tem certeza que deseja sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Application.Terminate;
  end else
  begin
    Exit;
  end;
end;
// Show do formulario o codigo ajusta a imagem no centro e esconde os titulos das paginas
procedure TfrmSystem.FormShow(Sender: TObject);
var pages: Integer;
begin

  imgMenu.top := (self.Height div 2) - (imgMenu.height div 2);
  imgMenu.left := (self.Width div 2) - (imgMenu.width div 2);

  for pages := 0 to pgcSystem.PageCount - 1 do
    begin
      pgcSystem.pages[pages].TabVisible := False;
    end;
  pgcSystem.ActivePage := pgcSystem.Pages[2];
end;

// codigo reposnsavel por trocar de pagina j� que n�o tem os titulos no pagecontrol
procedure TfrmSystem.btnShowUsersClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 1;
  edtFilterDescReport.Clear;
end;
// o sql de relatorios tr�s uma coluna errada quando dou um refreesh isso ser� resolvido
procedure TfrmSystem.dbgReportsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (dbgReports.Columns.Count > 3) then
    dbgReports.Columns[3].Visible := False;
end;
// filtrando rapidamente um relatorio
procedure TfrmSystem.edtFilterDescReportChange(Sender: TObject);
begin
  if Trim(edtFilterDescReport.Text) = '' then
  begin
    mSystem.qryRelLista.Filtered := False;
  end
  else
  begin
    mSystem.qryRelLista.Filter := 'NOME LIKE ' + QuotedStr('%' + edtFilterDescReport.Text + '%');
    mSystem.qryRelLista.Filtered := True;
  end;
end;
// filtrando rapidamente um usuario
procedure TfrmSystem.edtFilterNameUserChange(Sender: TObject);
begin
  if Trim(edtFilterNameUser.Text) = '' then
  begin
    mSystem.qryUsuLista.Filtered := False;
  end
  else
  begin
    mSystem.qryUsuLista.Filter := 'Nome LIKE ' + QuotedStr('%' + edtFilterNameUser.Text + '%');
    mSystem.qryUsuLista.Filtered := True;
  end;
end;
// voltando para tela principal
procedure TfrmSystem.btnHomeClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 2;
  edtFilterDescReport.Clear;
  edtFilterNameUser.Clear;
end;
// imprimir um relatorio esse codigo � temporario com o novo banco de dados vou salvar o fr3 em um blob
procedure TfrmSystem.btnPrintReportClick(Sender: TObject);
var
  PathReport: WideString;
begin
  {// Obtenha o caminho do relat�rio do campo PATH_REPORT do dataset do DBGReports
  PathReport := dbgReports.DataSource.DataSet.FieldByName('PATH_REPORT').AsString;

  // Verifica se o arquivo do caminho do relat�rio existe
  if FileExists(PathReport) then
  begin
    // Se o arquivo existir, carrega o relat�rio, prepara e mostra o relat�rio
    mFastReport.frxReport1.LoadFromFile(PathReport);
    //mFastReport.frxReport1.PrepareReport();
    mFastReport.frxReport1.ShowReport();
  end
  else
  begin
    // Se o arquivo n�o existir, exibe uma mensagem de erro
    ShowMessage('Erro ao carregar o relat�rio. Verifique o caminho do arquivo FR3: ' + PathReport);
  end;}
end;
// assim que abro a visualiza��o defino que a coluna errada n�o deve aparecer isso ser� mudado
procedure TfrmSystem.btnShowReportsClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 0;
  edtFilterNameUser.Clear;
  if (dbgReports.Columns.Count > 3) then
    dbgReports.Columns[3].Visible := False;
end;

end.
