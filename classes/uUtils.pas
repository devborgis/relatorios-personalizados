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
    function vldLogin(login, senha: String): Boolean;
    procedure excRelatorio(idRel: Integer);
    procedure excUsuario(idUsu: Integer);
  end;

var
  Util: TuUtils;

implementation

{ TuUtils}

uses dmIntegracao, dmFastReport, dmSystem;


{******************************************
Função para validar o login (somente tela de login)
porém penso em utilizar essa função para uma especie
de logoff dentro da ferramenta, podendo trocar de
usuario sem ter que fechar e abrir o sistema
*******************************************}
procedure TuUtils.excRelatorio(idRel: Integer);
begin
  try
    with mSystem.qryExcluirRel do
    begin
      Close;
      ParamByName('ID_REL').AsInteger := idRel;
      ExecSQL;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o relatório: ' + E.Message);
  end;
end;

procedure TuUtils.excUsuario(idUsu: Integer);
begin
  try
    with mSystem.qryExcluirUsuario do
    begin
      Close;
      ParamByName('ID_USU').AsInteger := idUsu;
      ExecSQL;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o usuário: ' + E.Message);
  end;
end;

function TuUtils.vldLogin(login: string; senha: string): Boolean;
begin
  Result := False;
  try
    with mSystem.qryLogin do
    begin
      Close;
      ParamByName('login').AsString := login;
      ParamByName('senha').AsString := senha;
      Open;
      if not IsEmpty then // Verifica se a consulta retornou algum registro
      begin
        if FieldByName('STATUS').AsInteger = 1 then // Verifica se o usuário está ativo
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

end.
