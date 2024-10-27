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
    procedure cadRelatorio(nom, des, cam: String; idGrp, idSGrp: Integer);
    procedure cadUsuario(nom, log, sen: String; sta: Integer);
    procedure attRelatorio(nom, des, cam: String; idRel, idGrp, idSGrp: Integer);
    procedure attUsuario(nom, log, sen: String; sta, idUsu: Integer);
    procedure listaRelatorios;
  end;

var
  Util: TuUtils;

implementation

{ TuUtils}

uses dmIntegracao, dmFastReport, dmSystem;


{----------------------------------------------------------------------
atualizar relatorio
-----------------------------------------------------------------------}
procedure TuUtils.attRelatorio(nom, des, cam: String; idRel, idGrp,
  idSGrp: Integer);
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TB_RELATORIO SET NOME = :nom, DESCRICAO = :des, FR3 = :cam, ID_GRUPO = :id_grp, ID_SUB_GRUPO = :id_sgrp WHERE ID = :id_rel;');
        ParamByName('nom').AsString := nom;
        ParamByName('des').AsString := des;
        ParamByName('cam').AsString := cam;
        ParamByName('id_rel').AsInteger := idRel;

        if idGrp = 0 then
          ParamByName('id_grp').Clear
        else
          ParamByName('id_grp').AsInteger := idGrp;
        if idSGrp = 0 then
          ParamByName('id_sgrp').Clear
        else
          ParamByName('id_sgrp').AsInteger := idSGrp;
        ExecSQL;
      end;

      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao atualizar relat�rio: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
end;

{-----------------------------------------------------------------
atualizar usuario
------------------------------------------------------------------}

procedure TuUtils.attUsuario(nom, log, sen: String; sta, idUsu: Integer);
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TB_USUARIO SET NOME = :nom, LOGIN = :log, SENHA = :sen, STATUS = :sta WHERE ID = :ID_USU;');
        ParamByName('nom').AsString := nom;
        ParamByName('log').AsString := log;
        ParamByName('sen').AsString := sen;
        ParamByName('sta').AsInteger := sta;
        ParamByName('ID_USU').AsInteger := idUsu;
        if sta = 0 then
          ParamByName('sta').Clear
        else
          ParamByName('sta').AsInteger := sta;

        ExecSQL;
      end;

      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao atulizar usuario: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
end;

{-------------------------------------------------------------
cadastrar um relatorio
--------------------------------------------------------------}

procedure TuUtils.cadRelatorio(nom, des, cam: String; idGrp, idSGrp: Integer);
var
  idRel: Integer;
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_RELATORIO (NOME, DESCRICAO, FR3, ID_GRUPO, ID_SUB_GRUPO) VALUES (:nom, :des, :cam, :id_grp, :id_sgrp);');
        ParamByName('nom').AsString := nom;
        ParamByName('des').AsString := des;
        ParamByName('cam').AsString := cam;
        if idGrp = 0 then
          ParamByName('id_grp').Clear
        else
          ParamByName('id_grp').AsInteger := idGrp;
        if idSGrp = 0 then
          ParamByName('id_sgrp').Clear
        else
          ParamByName('id_sgrp').AsInteger := idSGrp;

        ParamByName('nom').DataType := ftword;
        ParamByName('des').DataType := ftString;
        ParamByName('cam').DataType := ftString;
        ParamByName('id_grp').DataType := ftInteger;
        ParamByName('id_sgrp').DataType := ftInteger;

        ExecSQL;

        SQL.Clear;
        SQL.Add('SELECT last_insert_rowid() AS ID_RELATORIO;');
        Open;
      end;

      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_USU_PERMISSAO (ID_USUARIO, ID_RELATORIO, VISUALIZAR) ');
        SQL.Add('SELECT ID_USUARIO, :id_rel, 1 FROM TB_USUARIO;');
        ParamByName('id_rel').AsInteger := idRel;
        ExecSQL;
      end;

      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao criar o relat�rio: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
end;

{-------------------------------------------------------------
cadastrar um usuario
--------------------------------------------------------------}
procedure TuUtils.cadUsuario(nom, log, sen: String; sta: Integer);
var
  idUsu: Integer;
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_USUARIO (NOME, LOGIN, SENHA, STATUS) VALUES (:nom, :log, :sen, :sta);');
        ParamByName('nom').AsString := nom;
        ParamByName('log').AsString := log;
        ParamByName('sen').AsString := sen;
        ParamByName('sta').AsInteger := sta;
        ExecSQL;

        SQL.Clear;
        SQL.Add('SELECT last_insert_rowid() AS ID_USUARIO;');
        Open;
        idUsu := FieldByName('ID_USUARIO').AsInteger;
      end;

      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_USU_PERMISSAO (ID_USUARIO, ID_FORM, VISUALIZAR, INCLUIR, EDITAR, EXCLUIR) ');
        SQL.Add('SELECT :id_usu, ID, 1, 1, 1, 1 FROM TB_FORMULARIO;');
        SQL.Add('INSERT INTO TB_USU_PERMISSAO (ID_USUARIO, ID_RELATORIO, VISUALIZAR) ');
        SQL.Add('SELECT :id_usu, ID, 1 FROM TB_RELATORIO;');
        ParamByName('id_usu').AsInteger := idUsu;
        ExecSQL;
      end;

      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao criar usuario: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
end;

{-------------------------------------------------------------
excluir um relatorio
--------------------------------------------------------------}

procedure TuUtils.excRelatorio(idRel: Integer);
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TB_USU_PERMISSAO WHERE ID_RELATORIO = :ID_REL ;');
        SQL.Add('DELETE FROM TB_RELATORIO WHERE ID = :ID_REL ;');
        ParamByName('ID_REL').AsInteger := idRel;
        ExecSQL;
      end;
      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao excluir o relat�rio: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
end;

{-------------------------------------------------------------
excluir um relatorio
--------------------------------------------------------------}

procedure TuUtils.excUsuario(idUsu: Integer);
begin
  try
    mSystem.FDTransaction1.StartTransaction;
    try
      with mSystem.qryCRUD do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TB_USU_PERMISSAO WHERE ID_USU = :ID_USU ;');
        SQL.Add('DELETE FROM TB_USUARIO WHERE ID = :ID_USU ;');
        ParamByName('ID_REL').AsInteger := idUsu;
        ExecSQL;
      end;
      mSystem.FDTransaction1.Commit;
    except
      on E: Exception do
      begin
        mSystem.FDTransaction1.Rollback;
        ShowMessage('Erro ao excluir o usu�rio: ' + E.Message);
      end;
    end;
  finally
    mSystem.qryCRUD.Close;
  end;
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
