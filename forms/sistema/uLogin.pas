{*****************************************************************************
 * Nome do Arquivo: uLogin.pas
 * Descri��o: Tela de login do sistema
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
Create do fomrulario verificando e habilitando conex�o etc
-----------------------------------------------------------------}
procedure TfrmLogin.FormCreate(Sender: TObject);
const
  MAX_RETRIES = 3;       // N�mero m�ximo de tentativas
var
  attempt: Integer;      // Tentativas
  dbFound: Boolean;      // Banco de dados est� conectado?
  dbPath: String;        // Caminho padr�o do banco de dados
  iniPath: String;       // Caminho do arquivo INI
begin
  attempt := 0;
  dbFound := False;
  dbPath  := ExtractFilePath(ParamStr(0)) + 'SYS.DB';
  iniPath  := ExtractFilePath(ParamStr(0)) + '.Integracao\CONFIG.INI';

  { Em caso de erro, a aplica��o busca novamente o banco de dados por 3 vezes at� fechar completamente }
  while (attempt < MAX_RETRIES) and (not dbFound) do
  begin
    Inc(attempt);

    // Verifica se o arquivo INI existe a cada tentativa
    if FileExists(iniPath) then
    begin
      mIntegracao.confFDIntegracao; // Chama a fun��o de configura��o se o arquivo INI existir
    end
    else
    begin
      ShowMessage('O arquivo de configura��o CONFIG.INI n�o foi encontrado.');
      Break; // Sai do loop se o arquivo INI n�o existir
    end;

    try
      if FileExists(dbPath) then
      begin
        mSystem.conSystem.Params.Database := dbPath;
        mSystem.conSystem.Connected := True;
        dbFound := True; // Conex�o bem-sucedida
      end
      else
      begin
        raise Exception.CreateFmt('N�o foi poss�vel localizar o banco de dados da aplica��o. Tentativa %d de %d. Verifique se o arquivo "SYS.DB" est� presente no diret�rio correto.',
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
          ShowMessage('Todas as tentativas falharam. A aplica��o ser� encerrada.');
          Application.Terminate; // Fecha a aplica��o ap�s todas as tentativas falharem
        end;
      end;
    end;
  end;
end;

{----------------------------------------------------------------
Ao pressionar tecla x a palica��o faz algo
-----------------------------------------------------------------}
procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      btnExit.Click; // Fechar o formul�rio ao pressionar Esc
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
Configura��es do banco de dados "Integra��o" o SYS.DB n�o � configurado pelo usuario
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
        Util.CriarMensagem('OK', 'ERROR', 'ERRO AO ABRIR O SISTEMA', 'N�O POSSIVEL ABRIR O SISTEMA VERIFIQUE:' + E.Message, 'ERROR');
      end;
    end else
      begin
        Util.CriarMensagem('OK', 'ATEN��O', 'ACESSO NEGADO', 'USU�RIO E /OU SENHA INCORRETOS, USU�RIO N�O TEM PERMISS�O PARA ACESSAR O SISTEMA:', 'DANGER');
        edtPassword.Text := '';
        edtLogin.SetFocus;
      end;
end;

{---------------------------------------------------
Finalizando a aplica��o
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
    edtPassword.PasswordChar := '�';
  end;
end;

end.
