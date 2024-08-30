{*****************************************************************************
 * Nome do Arquivo: uUtils.pas
 * Descri��o: Unit para controle de fun��es procedures repetitivas da aplica��o
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
Fun��o para validar o login (somente tela de login)
por�m penso em utilizar essa fun��o para uma especie
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
      ShowMessage('Erro ao excluir o relat�rio: ' + E.Message);
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
      ShowMessage('Erro ao excluir o usu�rio: ' + E.Message);
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
        if FieldByName('STATUS').AsInteger = 1 then // Verifica se o usu�rio est� ativo
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
