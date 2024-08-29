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
    procedure FormShow(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnConfigClick(Sender: TObject);
begin
  if not Assigned(frmConfig) then
    frmConfig := TfrmConfig.Create(Self);
  frmConfig.Show;
end;

{***************************************************
Verificando se tem permissão de login usando a função da
unit utils, se for libera o sistema se não barra
***************************************************}
procedure TfrmLogin.btnEnterClick(Sender: TObject);
begin
  if Util.vldLogin(edtLogin.Text, edtPassword.Text) then
    begin
      try
        mSystem.conSystem.Connected := True;
        mSystem.qryUsers.Active := True;
        mSystem.qryReports.Active := True;
        mSystem.qryGroupsReport.Active := True;
        frmSystem.ShowModal;
        frmLogin.Close;
      except
        on E: Exception do
        ShowMessage('Erro ao abrir o sistema: ' + #13#10 + #13#10 + E.Message);
      end;
    end else
      begin
        ShowMessage('Usuário e/ou senha incorretos, ou o usuário não tem permissão para acessar o sistema.');
        edtPassword.Text := '';
        edtLogin.SetFocus;
      end;
end;

//Fechando a tela de login
procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  close;
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
    edtPassword.PasswordChar := '•';
  end;
end;

// Tratativas do OnShow da tela de login (assim que a tela é carregada)
procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    btnExit.Click; // Fechar o formulário ao pressionar Esc
  end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  IniPath, DatabasePath, DLLPath: string;
  Ini: TIniFile;
begin

  Util.testes;
  //Util.vldConfExiste;

  {IniPath := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI';
  DatabasePath := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'integracao.FDB';
  DLLPath := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'firebird.dll';

  dmSystem.mSystem.conSystem.Params.Database := ExtractFilePath(ParamStr(0)) + '.system\' + 'borgis.db';

  if not FileExists(IniPath) then
  begin
    if MessageDlg('Arquivo INI não encontrado. Deseja criar com as configurações padrão?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Ini := TIniFile.Create(IniPath);
      try
        Ini.ReadString('CONEXAO', 'DATABASE', DatabasePath);
        Ini.ReadString('CONEXAO', 'DLL', DLLPath);
        Ini.ReadString('CONEXAO', 'PORT', '3050');
        Ini.ReadString('CONEXAO', 'HOST', '127.0.0.1');
        Ini.ReadString('CONEXAO', 'USER', 'sysdba');
        Ini.ReadString('CONEXAO', 'PASSWORD', 'masterkey');
        Ini.ReadString('FASTREPORT', 'CHARSET', 'WIN1252');
        Ini.UpdateFile;

        mIntegracao.ConfConnection;

        try
          mIntegracao.conIntegracao.Connected := True;
          mIntegracao.conIntegracao.Connected := False;
        except
          on E: Exception do
            MessageDlg('Erro na conexão com o banco de dados: ' + E.Message, mtError, [mbOK], 0);
        end;
      finally
        Ini.Free;
      end;
    end
    else
    begin
      uConfig.frmConfig.ShowModal;
    end;
  end;

  mIntegracao.ConfConnection;

  try
    mIntegracao.conIntegracao.Connected := True;
    mIntegracao.conIntegracao.Connected := False;
  except
    on E: Exception do
      MessageDlg('Erro na conexão com o banco de dados: ' + #13#10 + E.Message, mtError, [mbOK], 0);
  end;}
end;

end.
