{*****************************************************************************
 * Nome do Arquivo: uLogin.pas
 * Descrição: Tela de login do sistema
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

unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ZAbstractConnection,
  ZConnection, frxDesgn, frxClass, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, uConfig, uSystem, dmIntegracao, dmSystem,
  Vcl.Imaging.jpeg, JvExControls, JvButton, JvTransparentButton, JvExStdCtrls,
  JvEdit, IniFiles, uUtils;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    edtLogin: TEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    Image1: TImage;
    Label3: TLabel;
    ImageList1: TImageList;
    btnConfig: TSpeedButton;
    Image2: TImage;
    btnEnter: TJvTransparentButton;
    btnExit: TJvTransparentButton;
    Label4: TLabel;
    btnShowPassword: TJvTransparentButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

{----------------------------------------------------------------
Create do fomrulario verificando e habilitando conexão etc
-----------------------------------------------------------------}
procedure TfrmLogin.FormCreate(Sender: TObject);
const
  MAX_RETRIES = 3;       // Número máximo de tentativas
var
  attempt: Integer;      // Tentativas
  dbFound: Boolean;      // Banco de dados está conectado?
  dbPath: String;        // Caminho padrão do banco de dados
  iniPath: String;       // Caminho do arquivo INI
begin
  attempt := 0;
  dbFound := False;
  dbPath  := ExtractFilePath(ParamStr(0)) + 'SYS.DB';
  iniPath  := ExtractFilePath(ParamStr(0)) + '.Integracao\CONFIG.INI';

  { Em caso de erro, a aplicação busca novamente o banco de dados por 3 vezes até fechar completamente }
  while (attempt < MAX_RETRIES) and (not dbFound) do
  begin
    Inc(attempt);

    // Verifica se o arquivo INI existe a cada tentativa
    if FileExists(iniPath) then
    begin
      mIntegracao.confFDIntegracao; // Chama a função de configuração se o arquivo INI existir
    end
    else
    begin
      ShowMessage('O arquivo de configuração CONFIG.INI não foi encontrado.');
      Break; // Sai do loop se o arquivo INI não existir
    end;

    try
      if FileExists(dbPath) then
      begin
        mSystem.conSystem.Params.Database := dbPath;
        mSystem.conSystem.Connected := True;
        dbFound := True; // Conexão bem-sucedida
      end
      else
      begin
        raise Exception.CreateFmt('Não foi possível localizar o banco de dados da aplicação. Tentativa %d de %d. Verifique se o arquivo "SYS.DB" está presente no diretório correto.',
          [attempt, MAX_RETRIES]);
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
        if attempt < MAX_RETRIES then
        begin
          ShowMessage('Tentando novamente...');
        end
        else
        begin
          ShowMessage('Todas as tentativas falharam. A aplicação será encerrada.');
          Application.Terminate; // Fecha a aplicação após todas as tentativas falharem
        end;
      end;
    end;
  end;
end;

{----------------------------------------------------------------
Ao pressionar tecla x a palicação faz algo
-----------------------------------------------------------------}
procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      btnExit.Click; // Fechar o formulário ao pressionar Esc
  end;
  if Key = VK_F1 then
    BEGIN
      btnEnter.Click; // ABRE O SISTEMA
  END;
end;

procedure TfrmLogin.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edtPassword.SetFocus; // MUDA O FOCO DO EDIT
end;

{------------------------------------------------------------------------
Configurações do banco de dados "Integração" o SYS.DB não é configurado pelo usuario
-------------------------------------------------------------------------}
procedure TfrmLogin.btnConfigClick(Sender: TObject);
begin
  frmConfig := TfrmConfig.Create(Self);
  try
    frmConfig.ShowModal;
  finally
    frmConfig.Free;
  end;
end;

{-----------------------------------------------------------
Validando Login e liberando usuario para utilizacao do sistema
------------------------------------------------------------}
procedure TfrmLogin.btnEnterClick(Sender: TObject);
begin
  if Util.vldLogin(edtLogin.Text, edtPassword.Text) then
    begin
      try
        frmSystem := TfrmSystem.Create(self);
        frmSystem.ShowModal;
        frmLogin.Hide;
      except
        on E: Exception do
        Util.CriarMensagem('OK', 'ERROR', 'ERRO AO ABRIR O SISTEMA', 'NÃO POSSIVEL ABRIR O SISTEMA VERIFIQUE:' + E.Message, 'ERROR');
      end;
    end else
      begin
        Util.CriarMensagem('OK', 'ATENÇÃO', 'ACESSO NEGADO', 'USUÁRIO E /OU SENHA INCORRETOS, USUÁRIO NÃO TEM PERMISSÃO PARA ACESSAR O SISTEMA:', 'DANGER');
        edtPassword.Text := '';
        edtLogin.SetFocus;
      end;
end;

{---------------------------------------------------
Finalizando a aplicação
----------------------------------------------------}
procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

{----------------------------------------------------
Ocultar e/ou mostrar a senha na tela de login
-----------------------------------------------------}
procedure TfrmLogin.btnShowPasswordClick(Sender: TObject);
begin
  if edtPassword.PasswordChar <> #0 then
  begin
    btnShowPassword.Images.ActiveIndex := 1;
    edtPassword.PasswordChar := #0;
  end
  else
  begin
    btnShowPassword.Images.ActiveIndex := 0;
    edtPassword.PasswordChar := '•';
  end;
end;

end.
