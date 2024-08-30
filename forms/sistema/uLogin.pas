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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

// conectando ao banco de dados da aplica��o
// habilitando o key preview assim o fomrulario consegue trabalhar com a��s como "ESC" para sair
procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
  mSystem.conSystem.Connected := True;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      btnExit.Click; // Fechar o formul�rio ao pressionar Esc
  end;
end;

// criando formulario e abrindo configura��es
procedure TfrmLogin.btnConfigClick(Sender: TObject);
begin
  if not Assigned(frmConfig) then
    frmConfig := TfrmConfig.Create(Self);
  frmConfig.Show;
end;

{***************************************************
Verificando se tem permiss�o de login usando a fun��o da
unit utils, se for libera o sistema se n�o barra
***************************************************}
procedure TfrmLogin.btnEnterClick(Sender: TObject);
begin
  if Util.vldLogin(edtLogin.Text, edtPassword.Text) then
    begin
      try
        frmSystem := TfrmSystem.Create(self);
        frmSystem.ShowModal;
        frmLogin.Close;
      except
        on E: Exception do
        ShowMessage('Erro ao abrir o sistema: ' + #13#10 + #13#10 + E.Message);
      end;
    end else
      begin
        ShowMessage('Usu�rio e/ou senha incorretos, usu�rio n�o tem permiss�o para acessar o sistema.');
        edtPassword.Text := '';
        edtLogin.SetFocus;
      end;
end;

//Fechando a tela de login
procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

// Mostrar ou cultar a senha
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
