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

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, IniFiles, dmDados;

type

  { TfrmConfig }

  TfrmConfig = class(TForm)
    btnConecta: TSpeedButton;
    dlgDll: TOpenDialog;
    edtCaminhoBD: TEdit;
    edtDllFirebird: TEdit;
    edtHost: TEdit;
    edtPorta: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dlgBd: TOpenDialog;
    btnSalvaConfig: TSpeedButton;
    btnCancelaConfig: TSpeedButton;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btnCancelaConfigClick(Sender: TObject);
    procedure btnConectaClick(Sender: TObject);
    procedure btnSalvaConfigClick(Sender: TObject);
    procedure edtCaminhoBDKeyPress(Sender: TObject; var Key: char);
    procedure edtDllFirebirdKeyPress(Sender: TObject; var Key: char);
    procedure edtHostKeyPress(Sender: TObject; var Key: char);
    procedure edtPortaKeyPress(Sender: TObject; var Key: char);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure GravaConf;
  public

  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.lfm}

{ TfrmConfig }

procedure TfrmConfig.GravaConf;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';
  Ini := TIniFile.Create(IniFile);

  try
    if (edtCaminhoBD.Text <> '') and (edtDllFirebird.Text <> '') then
    begin
      Ini.WriteString('CONEXAO', 'BANCO', edtCaminhoBD.Text);
      Ini.WriteString('CONEXAO', 'DLL', edtDllFirebird.Text);

      if edtPorta.Text = '' then
        Ini.WriteString('CONEXAO', 'PORTA', '3050')
      else
        Ini.WriteString('CONEXAO', 'PORTA', edtPorta.Text);

      if edtHost.Text = '' then
        Ini.WriteString('CONEXAO', 'HOST', '127.0.0.1')
      else
        Ini.WriteString('CONEXAO', 'HOST', edtHost.Text);

      if edtUsuario.Text = '' then
        Ini.WriteString('CONEXAO', 'USUARIO', 'sysdba')
      else
        Ini.WriteString('CONEXAO', 'USUARIO', edtUsuario.Text);

      if edtSenha.Text = '' then
        Ini.WriteString('CONEXAO', 'SENHA', 'masterkey')
      else
        Ini.WriteString('CONEXAO', 'SENHA', edtSenha.Text);
    end
    else
    begin
      if edtCaminhoBD.Text = '' then
        ShowMessage('O Caminho do banco de dados não pode ser vazio. Verifique.');

      if edtDllFirebird.Text = '' then
        ShowMessage('O Caminho da DLL não pode ser vazio. Verifique.');
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar o arquivo de configuração: ' + E.Message);
  end;

  Ini.Free;
end;

procedure TfrmConfig.btnCancelaConfigClick(Sender: TObject);
begin
  frmConfig.Close;
end;

procedure TfrmConfig.btnConectaClick(Sender: TObject);
begin

  if edtCaminhoBD.Text = '' then
  begin
    ShowMessage('O Caminho do banco de dados não pode ser vazio, verifique');
    Exit;
  end
  else
    DataModule1.SQLConnection.Database := edtCaminhoBD.Text;

  if edtDllFirebird.Text = '' then
  begin
    ShowMessage('O Caminho da DLL do Firebird não pode ser vazio');
    Exit;
  end
  else
    DataModule1.SQLConnection.LibraryLocation := edtDllFirebird.Text;

  if edtHost.text = '' then
    edtHost.text := '127.0.0.1';
    DataModule1.SQLConnection.HostName := edtHost.text;

  if edtPorta.text = '' then
    edtPorta.text := '3050';
    DataModule1.SQLConnection.Port := StrToInt(edtPorta.text);

  if edtUsuario.text = '' then
    edtUsuario.text := 'sysdba';
    DataModule1.SQLConnection.User := edtUsuario.text;

  if edtSenha.text = '' then
    edtSenha.text := 'masterkey';
    DataModule1.SQLConnection.Password := edtSenha.text;

    try
       DataModule1.SQLConnection.Connected := True;
       DataModule1.SQLConnection.Connected := False;
       ShowMessage('Conexão efetuada com sucesso !');
       btnSalvaConfig.Enabled := true;
       btnSalvaConfig.Font.Style := btnSalvaConfig.Font.Style + [fsBold];
    except
          on E: Exception do
          MessageDlg('Erro na conexão com o banco de dados: ' + E.Message, mtError, [mbOK], 0);
    end;

end;

procedure TfrmConfig.btnSalvaConfigClick(Sender: TObject);
begin
  try
    GravaConf;
    DataModule1.ConfiguraConexao;
    frmConfig.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar as configurações: ' + E.Message);
  end;
end;

procedure TfrmConfig.edtCaminhoBDKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     begin
     edtDllFirebird.SetFocus;
     end;
end;

procedure TfrmConfig.edtDllFirebirdKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     begin
     edtHost.SetFocus;
     end;
end;

procedure TfrmConfig.edtHostKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     begin
     edtPorta.SetFocus;
     end;
end;

procedure TfrmConfig.edtPortaKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     begin
     edtUsuario.SetFocus;
     end;
end;


procedure TfrmConfig.edtUsuarioKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     begin
     edtSenha.SetFocus;
     end;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';
  Ini := TIniFile.Create(IniFile);

  try
    edtCaminhoBD.Text := Ini.ReadString('CONEXAO', 'BANCO', '');
    edtDllFirebird.Text := Ini.ReadString('CONEXAO', 'DLL', '');
    edtPorta.Text := Ini.ReadString('CONEXAO', 'PORTA', '');
    edtHost.Text := Ini.ReadString('CONEXAO', 'HOST', '');
    edtUsuario.Text := Ini.ReadString('CONEXAO', 'USUARIO', '');
    edtSenha.Text := Ini.ReadString('CONEXAO', 'SENHA', '');

  finally
    ini.free;
  end;

end;


procedure TfrmConfig.SpeedButton1Click(Sender: TObject);
begin

  dlgBd.Filter := 'Banco de dados (*.fdb)|*.fdb|Todos os arquivos (*.*)|*.*';

  if dlgBd.Execute then
     begin
       edtCaminhoBD.clear;
       edtCaminhoBD.text := dlgBd.FileName;
     end else
         begin
     //
     end;
end;

procedure TfrmConfig.SpeedButton2Click(Sender: TObject);
begin
  dlgDll.Filter := 'Dll (*.dll)|*.dll|Todos os arquivos (*.*)|*.*';

  if dlgDll.Execute then
     begin
       edtDllFirebird.clear;
       edtDllFirebird.text := dlgDll.FileName;
     end else
         begin
     //
     end;
end;

end.

