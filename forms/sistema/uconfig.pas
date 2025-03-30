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
  Vcl.DBCtrls, uConf;

type
  TfrmConfig = class(TForm)
    Label3: TLabel;
    edtDll: TEdit;
    edtBancoDeDados: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtHost: TEdit;
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
    btnExitConf: TJvTransparentButton;
    Label1: TLabel;
    cbbProtocolo: TComboBox;
    Label9: TLabel;
    ckAtivaIBX: TCheckBox;
    procedure btnExitConfClick(Sender: TObject);
    procedure dlgDatabaseClick(Sender: TObject);
    procedure dlgDllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveConfClick(Sender: TObject);
    procedure edtBancoDeDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtDllKeyPress(Sender: TObject; var Key: Char);
    procedure edtHostKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
    procedure cbbProtocoloSelect(Sender: TObject);
  private
    procedure WriteConf;
    procedure confCamposIBX;
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation
uses Math;

{$R *.dfm}

{-----------------------------------------------------
Gravar valores do arquivo INI funções estão na uConf
------------------------------------------------------}

procedure TfrmConfig.WriteConf;
var StatusIBX: String;
begin
  if ckAtivaIBX.Checked then
    StatusIBX := 'True'
  else
    StatusIBX := 'False';

  try
    Conf.setPathDatabase(edtBancoDeDados.Text);
    Conf.setPathDll(edtDll.text);
    Conf.setProtocol(cbbProtocolo.text);
    Conf.setSRV(edtHost.Text);
    Conf.setUser(edtUser.Text);
    Conf.setPassWord(edtPassword.Text);
    Conf.setCharSet(dbCharset.Text);
    Conf.setIBX(StatusIBX);
  except
    on E: Exception do
      raise Exception.Create('Erro ao gravar o arquivo INI: ' + #13#10 + #13#10 + E.Message);
  end;
end;

{------------------------------------------------------------------
chamada da procedure para gravar os valor do INI
-------------------------------------------------------------------}

procedure TfrmConfig.btnSaveConfClick(Sender: TObject);
begin
  try
    WriteConf;
    mIntegracao.confFDIntegracao;
    ShowMessage('Configurado com sucesso!');
  except
    on E: Exception do
      raise Exception.Create('Erro ao salvar e testar configurações: ' + #13#10 + #13#10 + E.Message);
  end;
end;

{---------------------------------------------------------------------
bucando arquivos de banco de dados firebird é o FDB os demais compativeis funcionam por nome
----------------------------------------------------------------------}

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

{-------------------------------------------------------------------------
buscando arquivos DLL para confiugração da conexão
--------------------------------------------------------------------------}

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

{-------------------------------------------------
Show do fomruario carregando os dados para o usuario
--------------------------------------------------}

procedure TfrmConfig.FormShow(Sender: TObject);
begin

  try
    edtBancoDeDados.text := Conf.getPathDatabase;
    edtDll.text          := Conf.getPathDll;
    edtHost.text         := Conf.getSRV;
    edtUser.text         := conf.getUser;
    edtPassword.text     := conf.getPassWord;
    dbCharset.text       := conf.getCharset;
    cbbProtocolo.Text    := Conf.getProtocol;
    if Conf.getIBX = 'True' then
      ckAtivaIBX.Checked := True
    else
      ckAtivaIBX.Checked := False;
    if cbbProtocolo.Text = 'Firebird' then
   begin
     dbCharset.Items.Clear;
     dbCharset.Items.Add('WIN1252');
     dbCharset.Items.Add('UTF8');
     dbCharset.Items.Add('ASCII');
     dbCharset.Items.Add('BIG_5');
     dbCharset.Items.Add('UNICODE_FSS');
     ckAtivaIBX.Enabled := True;
   end else if cbbProtocolo.Text = 'Postgres' then
    begin
      dbCharset.Items.Clear;
      dbCharset.Items.Add('WIN1252');
      dbCharset.Items.Add('UTF8');
      dbCharset.Items.Add('SQL_ASCII');
      dbCharset.Items.Add('BIG_5');
      ckAtivaIBX.Enabled := False;
    end else if cbbProtocolo.Text = 'MySQL' then
      begin
        dbCharset.Items.Clear;
        dbCharset.Items.Add('utf8');
        dbCharset.Items.Add('ascii');
        dbCharset.Items.Add('big5');
        ckAtivaIBX.Enabled := False;
      end;
  finally
    Ini.Free;
  end;
  edtBancoDeDados.SetFocus;
end;

{-------------------------------------------------
chamada da procedure para configurar os charsets disponiveis
--------------------------------------------------}

procedure TfrmConfig.cbbProtocoloSelect(Sender: TObject);
begin
  confCamposIBX;
end;

{--------------------------------------------------
procedure para configurar os campos de charset com base no protocolo
---------------------------------------------------}
procedure TfrmConfig.confCamposIBX;
begin
  if cbbProtocolo.Text = 'Firebird' then
   begin
     dbCharset.Items.Clear;
     dbCharset.Items.Add('WIN1252');
     dbCharset.Items.Add('UTF8');
     dbCharset.Items.Add('ASCII');
     dbCharset.Items.Add('BIG_5');
     dbCharset.Items.Add('UNICODE_FSS');
     ckAtivaIBX.Enabled := True;
   end else if cbbProtocolo.Text = 'Postgres' then
    begin
      dbCharset.Items.Clear;
      dbCharset.Items.Add('WIN1252');
      dbCharset.Items.Add('UTF8');
      dbCharset.Items.Add('SQL_ASCII');
      dbCharset.Items.Add('BIG_5');
      ckAtivaIBX.Enabled := False;
    end else if cbbProtocolo.Text = 'MySQL' then
      begin
        dbCharset.Items.Clear;
        dbCharset.Items.Add('utf8');
        dbCharset.Items.Add('ascii');
        dbCharset.Items.Add('big5');
        ckAtivaIBX.Enabled := False;
      end;
end;

{-------------------------------------------------------
Saindo do form
--------------------------------------------------------}

procedure TfrmConfig.btnExitConfClick(Sender: TObject);
begin
  Close;
end;

{------------------------------------------------------------------------------
proximo foco com base no enter do usuario
-------------------------------------------------------------------------------}

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
     edtPassword.SetFocus;
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

end.
