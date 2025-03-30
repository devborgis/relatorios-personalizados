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

Uses System.SysUtils, System.Classes, IniFiles, Vcl.Dialogs, Windows;

type
  TuUtils = Class
  private
    //
  public
    function vldLogin(login, senha: String): Boolean;
    procedure listaRelatorios;
    function CriarMensagem( Tipo, TituloJanela, TituloMensagem, Mensagem, Icone: String ): Boolean;
    function VerificaInstancia: Boolean;
  end;

var
  Util: TuUtils;

implementation

{ TuUtils}

uses dmIntegracao, dmFastReport, dmSystem, uMensagens;

{-------------------------------------------------------------
Mensagens personalizadas
--------------------------------------------------------------}

function TuUtils.CriarMensagem(Tipo, TituloJanela, TituloMensagem, Mensagem,
  Icone: String): Boolean;
begin
  Result := False;

  frmMensagens                  := TfrmMensagens.Create( nil );

  frmMensagens.sTipo            := Tipo;
  frmMensagens.sTituloJanela    := TituloJanela;
  frmMensagens.sTituloMensagem  := TituloMensagem;
  frmMensagens.sMensagem        := Mensagem;
  frmMensagens.sTipoIcone       := Icone;

  frmMensagens.ShowModal;

  Result := frmMensagens.bRespostaMSG;
end;

{-------------------------------------------------------------
listar relatorios
--------------------------------------------------------------}

procedure TuUtils.listaRelatorios;
begin
  with mSystem.qryRelLista do
  begin
    Close;
    ParamByName('USU_LOGADO').AsInteger := mSystem.qryLogin.FieldByName('ID').AsInteger;
    Open;
  end;
end;

{-------------------------------------------------------------
Bloquear mais de uma instancia aberta
--------------------------------------------------------------}

function TuUtils.VerificaInstancia: Boolean;
const
  MutexName = 'BORGIS-6EACD0BF-F3E0-44D9-91E7-47467B5A2B6A'; // GUID
var
  hMutex: THandle;
begin
  hMutex := CreateMutex(nil, True, PChar(MutexName));
  if hMutex = 0 then
    RaiseLastOSError;
  Result := GetLastError <> ERROR_ALREADY_EXISTS;
end;

{------------------------------------------------------------------
Validar o login do usuario
-------------------------------------------------------------------}
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
