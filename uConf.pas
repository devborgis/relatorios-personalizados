{*****************************************************************************
 * Nome do Arquivo: uConf.pas
 * Descrição: Unit para controle de funções procedures relacionadas ao arquivo conf.ini
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

unit uConf;

interface

Uses System.SysUtils, System.Classes, IniFiles, Vcl.Dialogs;

type
  TuConf = Class
  private
    //
  public
    {funções para ler o conf}
    function getPathDatabase: String;
    function getPathDll: String;
    function getUser: String;
    function getPassWord: String;
    function getCharset: String;
    function getIBX: String;
    function getProtocol: String;
    function getSRV: String;
    function getConfExiste: Boolean;
    {procedures para definir o conf}
    procedure setDefaultConf;
    procedure setPathDatabase(PathDatabase: String);
    procedure setPathDll(PathDll: String);
    procedure setUser(User: String);
    procedure setPassWord(PassWord: String);
    procedure setCharSet(CharSet: String);
    procedure setIBX(IBX: String);
    procedure setProtocol(Protocol: String);
    procedure setSRV(SRV: String);
  end;

var
  Conf: TuConf; Ini: TIniFile;

implementation

{ TuConf }

{***********************************
Funções para ler os valores do arquivo INI
************************************}

function TuConf.getCharset: String;
begin
  Result := Ini.ReadString('FASTREPORT', 'CHARSET', '');
end;

function TuConf.getConfExiste: Boolean;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI') then
    begin Result := False
      end else
        begin Result := True
    end;
end;

function TuConf.getIBX: String;
begin
  Result := Ini.ReadString('FASTREPORT', 'IBX', '');
end;

function TuConf.getPassWord: String;
begin
  Result := Ini.ReadString('CONEXAO', 'PASSWORD', '');
end;

function TuConf.getPathDatabase: String;
begin
  Result := Ini.ReadString('CONEXAO', 'DATABASE', '');
end;

function TuConf.getPathDll: String;
begin
  Result := Ini.ReadString('CONEXAO', 'DLL', '');
end;

function TuConf.getProtocol: String;
begin
  Result := Ini.ReadString('CONEXAO', 'PROTOCOL', '');
end;

function TuConf.getSRV: String;
begin
  Result := Ini.ReadString('CONEXAO', 'SRV', '');
end;

function TuConf.getUser: String;
begin
  Result := Ini.ReadString('CONEXAO', 'USER', '');
end;

{***********************************
Procedures para definir os valores do arquivo INI
************************************}
procedure TuConf.setDefaultConf;
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
    try
      Ini.WriteString('CONEXAO', 'PROTOCOL', 'Firebird');
      Ini.WriteString('CONEXAO', 'SRV', '127.0.0.1/3050');
      Ini.WriteString('CONEXAO', 'DATABASE', ExtractFilePath(ParamStr(0)) + '.integracao\' + 'INTEGRACAO.FDB');
      Ini.WriteString('CONEXAO', 'DLL', ExtractFilePath(ParamStr(0)) + '.integracao\' + 'gds32.dll');
      Ini.WriteString('CONEXAO', 'USER', 'SYSDBA');
      Ini.WriteString('CONEXAO', 'PASSWORD', 'masterkey');
      Ini.WriteString('FASTREPORT', 'CHARSET', 'WIN1252');
      Ini.WriteString('FASTREPORT', 'IBX', 'True');
    finally
      Ini.Free;
    end;
  except
    on E: Exception do
      MessageDlg('Erro ao gravar o arquivo CONF padrão: ' + #13#10 + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TuConf.setCharSet(CharSet: String);
begin
  Ini.WriteString('FASTREPORT', 'CHARSET', CharSet)
end;

procedure TuConf.setIBX(IBX: String);
begin
  Ini.WriteString('FASTREPORT', 'IBX', IBX)
end;

procedure TuConf.setPassWord(PassWord: String);
begin
  Ini.WriteString('CONEXAO', 'PASSWORD', PassWord)
end;

procedure TuConf.setPathDatabase(PathDatabase: String);
begin
  Ini.WriteString('CONEXAO', 'DATABASE', PathDatabase)
end;

procedure TuConf.setPathDll(PathDll: String);
begin
  Ini.WriteString('CONEXAO', 'DLL', PathDll)
end;

procedure TuConf.setProtocol(Protocol: String);
begin
  Ini.WriteString('CONEXAO', 'PROTOCOL', Protocol)
end;

procedure TuConf.setSRV(SRV: String);
begin
  Ini.WriteString('CONEXAO', 'SRV', SRV)
end;

procedure TuConf.setUser(User: String);
begin
  Ini.WriteString('CONEXAO', 'USER', User)
end;

end.
