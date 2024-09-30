unit uConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, dmSystem, System.JSON, System.Net.HttpClient, System.Net.URLClient, System.Net.HttpClientComponent,
  Vcl.OleCtrls, SHDocVw, Vcl.Buttons, ShellAPI;

type
  TfrmConfiguracoes = class(TForm)
    pnlFundo: TPanel;
    dbgGrupoRelatorio: TDBGrid;
    dbgSubGrupoRelatorio: TDBGrid;
    memoReleaseApp: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnNossoSite: TSpeedButton;
    btnNossoGitHub: TSpeedButton;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnNossoSiteClick(Sender: TObject);
    procedure btnNossoGitHubClick(Sender: TObject);
    procedure dbgGrupoRelatorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgSubGrupoRelatorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure GetRelease;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

{ TfrmConfiguracoes }

{------------------------------------------------------
Bucando a ultima release do github e abrindo a listagem dos grupos e subgrupos
-------------------------------------------------------}

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
 GetRelease;
 mSystem.qrySubGrupRel.Open();
 mSystem.qryGruRelLista.Open();
end;

{-------------------------------------------------------
procedure para buscar a ultima release via api github
--------------------------------------------------------}

procedure TfrmConfiguracoes.GetRelease;
var
  HTTPClient: TNetHTTPClient;
  Response: IHTTPResponse;
  JSONObj: TJSONObject;
  ReleaseBody: string;
begin
  HTTPClient := TNetHTTPClient.Create(nil);
  try
    // Faz a requisição para obter os dados da última release
    Response := HTTPClient.Get('https://api.github.com/repos/devborgis/relatorios-personalizados/releases/latest');
    if Response.StatusCode = 200 then
    begin
      // Parse do JSON retornado
      JSONObj := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      try
        // Extrai o conteúdo da release (tag "body" do JSON)
        ReleaseBody := JSONObj.GetValue<string>('body');
        // Exibe o conteúdo no Memo (em Markdown, mas ainda não formatado)
        memoReleaseApp.Lines.Text := ReleaseBody;
      finally
        JSONObj.Free;
      end;
    end;
  finally
    HTTPClient.Free;
  end;
end;

{---------------------------------------------------------------------
ações dos botões para redirecionar ao github e ao site
----------------------------------------------------------------------}
procedure TfrmConfiguracoes.btnNossoGitHubClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://github.com/devborgis/relatorios-personalizados/releases', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmConfiguracoes.btnNossoSiteClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://borgis.com.br/', nil, nil, SW_SHOWNORMAL);
end;

{------------------------------------------------------------------------------
no delete do dbgrid confrimar a excusão do registro
-------------------------------------------------------------------------------}
procedure TfrmConfiguracoes.dbgGrupoRelatorioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    // Confirmação antes de excluir
    if MessageDlg('Tem certeza que deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        // Exclui o registro
        if not dbgGrupoRelatorio.DataSource.DataSet.IsEmpty then
        begin
          dbgGrupoRelatorio.DataSource.DataSet.Delete;
        end;
      except
        on E: Exception do
          ShowMessage('Erro ao excluir o registro: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmConfiguracoes.dbgSubGrupoRelatorioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    // Confirmação antes de excluir
    if MessageDlg('Tem certeza que deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        // Exclui o registro
        if not dbgSubGrupoRelatorio.DataSource.DataSet.IsEmpty then
        begin
          dbgSubGrupoRelatorio.DataSource.DataSet.Delete;
        end;
      except
        on E: Exception do
          ShowMessage('Erro ao excluir o registro: ' + E.Message);
      end;
    end;
  end;
end;

end.
