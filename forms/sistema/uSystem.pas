{*****************************************************************************
 * Nome do Arquivo: uSystem.pas
 * Descrição: Tela pricipal do sistema
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
  frmCadReport.caption := 'Manutenção de Relatórios - INCLUIR';
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
  frmCadUser.Caption := 'Manutenção de usuários - INCLUIR';
  frmCadUser.edtIdUser.Text := 'NOVO';
  frmCadUser.lbInfo.Visible := True;
  frmCadUser.GroupBox1.Visible := False;
  frmCadUser.GroupBox2.Visible := False;
  frmCadUser.ShowModal;
end;
// excluir relatorio - procedure na classe utils
procedure TfrmSystem.btnDeleteReportClick(Sender: TObject);
begin
  if MessageDlg('Essa ação é irreversivel deseja continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
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
    if MessageDlg('Essa ação é irreversivel deseja continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
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
  frmCadReport.caption := 'Manutenção de Relatórios - ALTERAR';
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
  frmCadUser.Caption := 'Manutenção de usuários - ALTERAR';
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

// codigo reposnsavel por trocar de pagina já que não tem os titulos no pagecontrol
procedure TfrmSystem.btnShowUsersClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 1;
  edtFilterDescReport.Clear;
end;
// o sql de relatorios trás uma coluna errada quando dou um refreesh isso será resolvido
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
// imprimir um relatorio esse codigo é temporario com o novo banco de dados vou salvar o fr3 em um blob
procedure TfrmSystem.btnPrintReportClick(Sender: TObject);
var
  PathReport: WideString;
begin
  {// Obtenha o caminho do relatório do campo PATH_REPORT do dataset do DBGReports
  PathReport := dbgReports.DataSource.DataSet.FieldByName('PATH_REPORT').AsString;

  // Verifica se o arquivo do caminho do relatório existe
  if FileExists(PathReport) then
  begin
    // Se o arquivo existir, carrega o relatório, prepara e mostra o relatório
    mFastReport.frxReport1.LoadFromFile(PathReport);
    //mFastReport.frxReport1.PrepareReport();
    mFastReport.frxReport1.ShowReport();
  end
  else
  begin
    // Se o arquivo não existir, exibe uma mensagem de erro
    ShowMessage('Erro ao carregar o relatório. Verifique o caminho do arquivo FR3: ' + PathReport);
  end;}
end;
// assim que abro a visualização defino que a coluna errada não deve aparecer isso será mudado
procedure TfrmSystem.btnShowReportsClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 0;
  edtFilterNameUser.Clear;
  if (dbgReports.Columns.Count > 3) then
    dbgReports.Columns[3].Visible := False;
end;

end.
