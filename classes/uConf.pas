{*****************************************************************************
 * Nome do Arquivo: uConf.pas
 * Descri��o: Unit para controle de fun��es procedures relacionadas ao arquivo conf.ini
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

unit uConf;

interface

Uses System.SysUtils, System.Classes, IniFiles, Vcl.Dialogs;

type
  TuConf = Class
  private
    //
  public
    {fun��es para ler o conf}
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
Fun��es para ler os valores do arquivo INI
************************************}

function TuConf.getConfExiste: Boolean;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI') then
    begin Result := False
      end else
        begin Result := True
    end;
end;

function TuConf.getCharset: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('FASTREPORT', 'CHARSET', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getIBX: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('FASTREPORT', 'IBX', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getPassWord: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'PASSWORD', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getPathDatabase: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'DATABASE', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getPathDll: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'DLL', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getProtocol: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'PROTOCOL', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getSRV: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'SRV', '');
  finally
    Ini.Free;
  end;
end;
function TuConf.getUser: String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Result := Ini.ReadString('CONEXAO', 'USER', '');
  finally
    Ini.Free;
  end;
end;

{***********************************
Procedures para definir os valores do arquivo INI
************************************}


{N�o existe mais conf padr�o uma vez que o sistema suporta mais de um SGBD

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
      MessageDlg('Erro ao gravar o arquivo CONF padr�o: ' + #13#10 + E.Message, mtError, [mbOK], 0);
  end;
end;}

procedure TuConf.setCharSet(CharSet: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('FASTREPORT', 'CHARSET', CharSet);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setIBX(IBX: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('FASTREPORT', 'IBX', IBX);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setPassWord(PassWord: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'PASSWORD', PassWord);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setPathDatabase(PathDatabase: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'DATABASE', PathDatabase);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setPathDll(PathDll: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'DLL', PathDll);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setProtocol(Protocol: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'PROTOCOL', Protocol);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setSRV(SRV: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'SRV', SRV);
  finally
    Ini.Free;
  end;
end;
procedure TuConf.setUser(User: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI');
  try
    Ini.WriteString('CONEXAO', 'USER', User);
  finally
    Ini.Free;
  end;
end;

end.
