{*****************************************************************************
 * Nome do Arquivo: uUtils.pas
 * Descrição: Unit para controle de funções procedures repetitivas da aplicação
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

unit uUtils;

interface

Uses System.SysUtils, System.Classes, IniFiles, Vcl.Dialogs;

type
  TuUtils = Class
  private
    //
  public
    procedure testes;
    function vldLogin(login, password: String): Boolean;
    function getPathConf: String;
    function getPathDbIntegracao: String;
    function getPathDllFirebird: String;
  end;

var
  Util: TuUtils;

implementation

{ TuUtils}

uses dmIntegracao, dmFastReport, dmSystem;

procedure TuUtils.testes;
begin
  ShowMessage('Aqui tem uma show message');
end;

{******************************************
Função para validar o login (somente tela de login)
porém penso em utilizar essa função para uma especie
de logoff dentro da ferramenta, podendo trocar de
usuario sem ter que fechar e abrir o sistema
*******************************************}
function TuUtils.vldLogin(login: string; password: string): Boolean;
begin
  Result := False;
  try
    with mSystem.qryLogin do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_USERS WHERE LOGIN = :login AND PASSWORD = :password');
      ParamByName('login').AsString := login;
      ParamByName('password').AsString := password;
      Open;
      if not IsEmpty then // Verifica se a consulta retornou algum registro
      begin
        if FieldByName('STATUS').AsString <> '0' then // Verifica se o usuário está ativo
        begin
          Result := True;
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao verificar credenciais: ' + #13#10 + #13#10 + E.Message);
  end;
end;

{*************************************
Functions para obter os caminhos padrões
para a aplicação como dll e outros arquivos
**************************************}
function TuUtils.getPathConf: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI';
end;

function TuUtils.getPathDbIntegracao: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'integracao.FDB';
end;

function TuUtils.getPathDllFirebird: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'gds32.dll';
end;

end.
