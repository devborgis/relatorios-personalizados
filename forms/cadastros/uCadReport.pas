unit uCadReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvButton,
  JvTransparentButton, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, dmFastReport, dmSystem, uCadGroupReport,
  Data.DB, Datasnap.DBClient, Vcl.Buttons, uUtils;

type
  TfrmCadReport = class(TForm)
    edtIdReport: TEdit;
    edtNameReport: TEdit;
    cbbGroupReport: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    dlgNewFr3: TOpenDialog;
    Label3: TLabel;
    edtPathReport: TEdit;
    cbbSubGrupoReport: TDBLookupComboBox;
    Label4: TLabel;
    btnSalvar: TSpeedButton;
    btnFr3: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnBuscaFr3: TSpeedButton;
    memoDescricao: TMemo;
    Label5: TLabel;
    procedure edtNameReportKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnEdtReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscaFr3Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FAcao: Integer;
  public
    { Public declarations }
    property Acao: Integer read FAcao write FAcao;
  end;

var
  frmCadReport: TfrmCadReport;

implementation

{$R *.dfm}

{--------------------------------------
salvar um relatorio
---------------------------------------}

procedure TfrmCadReport.btnSalvarClick(Sender: TObject);
var
  sTipoOperacao, sErro: String;
begin
  if edtIdReport.Text = '' then
    sTipoOperacao := 'INSERIR'
  else
    sTipoOperacao := 'ALTERAR';

  sErro := '';

  with mSystem.Relatorios do
    begin

      Nome := edtNameReport.Text;
      Descricao := memoDescricao.Text;

      if not VarIsNull(cbbGroupReport.KeyValue) then
        Grupo := cbbGroupReport.KeyValue
      else
        Grupo := -1;

      if not VarIsNull(cbbGroupReport.KeyValue) then
        Grupo := cbbGroupReport.KeyValue
      else
        Grupo := -1;

      Fr3 := edtPathReport.Text;

      if inserir_alterar( sTipoOperacao, sErro ) then
        begin
          Util.CriarMensagem('OK', 'SUCESSO',
                            'INCLUIR/ALTERAR RELATÓRIO', 'CADASTRO CONFIRMADO NO BANCO DE DADOS',
                            'INFO');
          Close;
      end else
        begin
          Util.CriarMensagem('OK', 'ERROR',
                          'INCLUIR/ALTERAR RELATÓRIO', 'NÃO FOI POSSIVEL CONCLUIR A OPERAÇÃO, CAUSA:' + sErro,
                          'ERROR');

          edtNameReport.SetFocus;
      end;
    end;

    mSystem.qryRelLista.Refresh;

end;

{-------------------------------
fechando/cancelando alterações no relatorio
--------------------------------}

procedure TfrmCadReport.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

{--------------------------------------
botão para editar o relatorio do caminho
---------------------------------------}

procedure TfrmCadReport.btnEdtReportClick(Sender: TObject);
var
  ReportPath: string;
begin
  ReportPath := edtPathReport.Text;

  if ReportPath = '' then
  begin
    mFastReport.frxReport1.DesignReport();
  end
  else
  begin
    if FileExists(ReportPath) then
    begin
      try
        mFastReport.frxReport1.LoadFromFile(ReportPath);
        mFastReport.frxReport1.DesignReport(true);
      except
        on E: Exception do
          ShowMessage('Erro ao carregar o relatório: ' + E.Message);
      end;
    end
    else
    begin
      ShowMessage('O caminho do FR3 não existe. Verifique o caminho e tente novamente.');
    end;
  end;
end;

{----------------------------------------------------
botão para buscar o arquivo fr3 do relatorio
-----------------------------------------------------}
procedure TfrmCadReport.btnBuscaFr3Click(Sender: TObject);
begin
  dlgNewFr3.Filter := 'Arquivos FastReport (*.fr3)|*.fr3|Todos os arquivos (*.*)|*.*';

  if dlgNewFr3.Execute then
  begin
    edtPathReport.Text := dlgNewFr3.FileName;
  end;
end;


{---------------------------------------------
Fechando o fomrulario e liberando da memoria para proxima criação
----------------------------------------------}
procedure TfrmCadReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{-----------------------------------------------
tratativa do show do formulario
------------------------------------------------}
procedure TfrmCadReport.FormShow(Sender: TObject);
begin
  edtNameReport.SetFocus;
end;

{---------------------------------------------
setando o foco conforme a tecla #13 - enter
----------------------------------------------}

procedure TfrmCadReport.edtNameReportKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    memoDescricao.SetFocus;
end;

end.
