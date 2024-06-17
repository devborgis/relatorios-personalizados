{*****************************************************************************
 * Nome do Arquivo: uConfig.pas
 * Descrição: Tela de configuracao para conexao com o banco de dados
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

unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  JvExControls, JvSpeedButton, JvButton, JvTransparentButton, dmIntegracao, dmSystem, IniFiles,
  Vcl.DBCtrls;

type
  TfrmConfig = class(TForm)
    Label3: TLabel;
    edtDll: TEdit;
    edtBancoDeDados: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    edtHost: TEdit;
    Label5: TLabel;
    edtPort: TEdit;
    Label6: TLabel;
    edtPassword: TEdit;
    btnTestaIntegracao: TJvTransparentButton;
    btnSaveConf: TJvTransparentButton;
    odlgDatabase: TOpenDialog;
    odlgDll: TOpenDialog;
    dlgDatabase: TJvTransparentButton;
    dlgDll: TJvTransparentButton;
    Label7: TLabel;
    edtUser: TEdit;
    Label8: TLabel;
    dbCharset: TComboBox;
    pnlButtons: TPanel;
    JvTransparentButton1: TJvTransparentButton;
    JvTransparentButton2: TJvTransparentButton;
    btnExitConf: TJvTransparentButton;
    procedure btnExitConfClick(Sender: TObject);
    procedure dlgDatabaseClick(Sender: TObject);
    procedure dlgDllClick(Sender: TObject);
    procedure btnTestaIntegracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveConfClick(Sender: TObject);
    procedure edtBancoDeDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtDllKeyPress(Sender: TObject; var Key: Char);
    procedure edtHostKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
  private
    procedure WriteConf;
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

procedure TfrmConfig.WriteConf;
var
  Ini: TIniFile;
  IniPath: string;
begin
  try
    IniPath := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI';
    Ini := TIniFile.Create(IniPath);
    try

      if (edtBancoDeDados.Text <> '') and (edtDll.Text <> '') then
      begin
        Ini.WriteString('CONEXAO', 'DATABASE', edtBancoDeDados.Text);
        Ini.WriteString('CONEXAO', 'DLL', edtDll.Text);

        if edtPort.Text = '' then
          Ini.WriteString('CONEXAO', 'PORT', '3050')
        else
          Ini.WriteString('CONEXAO', 'PORT', edtPort.Text);

        if edtHost.Text = '' then
          Ini.WriteString('CONEXAO', 'HOST', '127.0.0.1')
        else
          Ini.WriteString('CONEXAO', 'HOST', edtHost.Text);

        if edtUser.Text = '' then
          Ini.WriteString('CONEXAO', 'USER', 'sysdba')
        else
          Ini.WriteString('CONEXAO', 'USER', edtUser.Text);

        if edtPassword.Text = '' then
          Ini.WriteString('CONEXAO', 'PASSWORD', 'masterkey')
        else
          Ini.WriteString('CONEXAO', 'PASSWORD', edtPassword.Text);

        if dbCharset.Text = '' then
          Ini.WriteString('FASTREPORT', 'CHARSET', 'WIN1252')
        else
          Ini.WriteString('FASTREPORT', 'CHARSET', dbCharset.Text);
      end
      else
      begin
        if edtBancoDeDados.Text = '' then
          ShowMessage('O Caminho do banco de dados não pode ser vazio. Verifique.');

        if edtDll.Text = '' then
          ShowMessage('O Caminho da DLL não pode ser vazio. Verifique.');
      end;
    finally
      Ini.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar o arquivo INI: ' + #13#10 + #13#10 + E.Message);
  end;
end;

procedure TfrmConfig.btnSaveConfClick(Sender: TObject);
begin
  WriteConf;
  mIntegracao.ConfConnection;
  mIntegracao.conIntegracao.Connected := True;
  Close;
end;

procedure TfrmConfig.btnTestaIntegracaoClick(Sender: TObject);
begin
  if edtBancoDeDados.Text = '' then
  begin
    ShowMessage('O Caminho do banco de dados não pode ser vazio, verifique');
    Exit;
  end
  else
    mIntegracao.conIntegracao.Database := edtBancoDeDados.Text;

  if edtDll.Text = '' then
  begin
    ShowMessage('O Caminho da DLL não pode ser vazio, Verifique');
    Exit;
  end
  else
    mIntegracao.conIntegracao.LibraryLocation := edtDll.Text;

  if edtHost.text = '' then
    edtHost.text := '127.0.0.1';
    mIntegracao.conIntegracao.HostName := edtHost.text;

  if edtPort.text = '' then
    edtPort.text := '3050';
    mIntegracao.conIntegracao.Port := StrToInt(edtPort.text);

  if edtUser.text = '' then
    edtUser.text := 'sysdba';
    mIntegracao.conIntegracao.User := edtUser.text;

  if edtPassword.text = '' then
    edtPassword.text := 'masterkey';
    mIntegracao.conIntegracao.Password := edtPassword.text;

    try
       mIntegracao.conIntegracao.Connected := True;
       mIntegracao.conIntegracao.Connected := False;
       ShowMessage('Conexão efetuada com sucesso !');
       btnSaveConf.Enabled := true;
    except
          on E: Exception do
          MessageDlg('Erro na conexão com o banco de dados: ' + E.Message, mtError, [mbOK], 0);
    end;

end;

procedure TfrmConfig.dlgDatabaseClick(Sender: TObject);
begin
  odlgDatabase.Filter := 'Arquivos Firebird (*.fdb)|*.fdb|Todos os arquivos (*.*)|*.*';

   try
    if odlgDatabase.Execute then
    begin
      edtBancoDeDados.Clear;
      edtBancoDeDados.Text := odlgDatabase.FileName;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao definir o caminho do banco de dados: ' + E.Message);
  end;

end;

procedure TfrmConfig.dlgDllClick(Sender: TObject);
begin
  odlgDll.Filter := 'Arquivos DLL (*.dll)|*.dll|Todos os arquivos (*.*)|*.*';

   try
    if odlgDll.Execute then
    begin
      edtDll.Clear;
      edtDll.Text := odlgDll.FileName;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao definir o caminho da DLL: ' + E.Message);
  end;
end;

procedure TfrmConfig.edtBancoDeDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
     edtDll.SetFocus;
     end;
end;

procedure TfrmConfig.edtDllKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
     edtHost.SetFocus;
     end;
end;

procedure TfrmConfig.edtHostKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
     edtPort.SetFocus;
     end;
end;

procedure TfrmConfig.edtPortKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
     edtUser.SetFocus;
     end;
end;

procedure TfrmConfig.edtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
     edtPassword.SetFocus;
     end;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + '\.integracao\config.ini';
  Ini := TIniFile.Create(IniFile);

  try
    edtBancoDeDados.text := Ini.ReadString('CONEXAO', 'DATABASE', '');
    edtDll.text := Ini.ReadString('CONEXAO', 'DLL', '');
    edtPort.text := Ini.ReadString('CONEXAO', 'PORT', '');
    edtHost.text := Ini.ReadString('CONEXAO', 'HOST', '');
    edtUser.text := Ini.ReadString('CONEXAO', 'USER', '');
    edtPassword.text := Ini.ReadString('CONEXAO', 'PASSWORD', '');
    dbCharset.text := Ini.ReadString('FASTREPORT', 'CHARSET', '');
  finally
    Ini.Free;
  end;
  edtBancoDeDados.SetFocus;
  btnSaveConf.Enabled := False;
end;

procedure TfrmConfig.btnExitConfClick(Sender: TObject);
begin
  Close;
end;

end.
