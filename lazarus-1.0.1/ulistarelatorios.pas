{*****************************************************************************
 * Nome do Arquivo: uListaRelatorios.pas
 * Descrição: Listagem dos relatorios disponiveis
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

unit uListaRelatorios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, uRelRastreioContas, uConfig, dmDados, uFiltroRelPRestante,
  IniFiles;

type
  { TfrmListaRelatorios }

  TfrmListaRelatorios = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    trialLabel: TLabel;
    pnlTitulo: TPanel;
    pnlListaRelatorios: TPanel;
    SpeedButton1: TSpeedButton;
    btnConf: TSpeedButton;
    Timer1: TTimer;
    procedure btnConfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  end;


var
  frmListaRelatorios: TfrmListaRelatorios;

implementation

{$R *.lfm}


procedure TfrmListaRelatorios.SpeedButton1Click(Sender: TObject);
begin
  frmFiltrosRelParRestante.ShowModal;
end;

procedure TfrmListaRelatorios.btnConfClick(Sender: TObject);
begin
  frmConfig.ShowModal;
end;

procedure TfrmListaRelatorios.FormShow(Sender: TObject);
var
  IniFilePath, DatabasePath, DLLPath: string;
  Ini: TIniFile;
begin
  IniFilePath := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';
  DatabasePath := ExtractFilePath(ParamStr(0)) + 'BORGIS.FDB';
  DLLPath := ExtractFilePath(ParamStr(0)) + 'firebird.dll';

  if not FileExists(IniFilePath) then
  begin
    if MessageDlg('Arquivo INI não encontrado. Deseja criar com as configurações padrão?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Ini := TIniFile.Create(IniFilePath);
      try
        Ini.WriteString('CONEXAO', 'BANCO', DatabasePath);
        Ini.WriteString('CONEXAO', 'DLL', DLLPath);
          Ini.WriteString('CONEXAO', 'PORTA', '3050');
          Ini.WriteString('CONEXAO', 'HOST', '127.0.0.1');
          Ini.WriteString('CONEXAO', 'USUARIO', 'sysdba');
          Ini.WriteString('CONEXAO', 'SENHA', 'masterkey');

          ini.UpdateFile;



          DataModule1.ConfiguraConexao;

          try
            DataModule1.SQLConnection.Connected := True;
            DataModule1.SQLConnection.Connected := False;
          except
            on E: Exception do
              MessageDlg('Erro na conexão com o banco de dados: ' + E.Message, mtError, [mbOK], 0);
          end;
      finally
        ini.free;
      end;
    end
    else
    begin
      uConfig.frmConfig.ShowModal;
    end;
  end;

      DataModule1.ConfiguraConexao;

          try
            DataModule1.SQLConnection.Connected := True;
            DataModule1.SQLConnection.Connected := False;
          except
            on E: Exception do
              MessageDlg('Erro na conexão com o banco de dados: ' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;

end;

end.

