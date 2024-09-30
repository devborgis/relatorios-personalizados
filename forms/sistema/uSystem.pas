{*****************************************************************************
 * Nome do Arquivo: uSystem.pas
 * Descrição: Tela pricipal do sistema
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

unit uSystem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, dmIntegracao, dmSystem,
  JvExControls, JvButton, JvTransparentButton, uCadUser, uCadReport, uUtils,
  Data.DB, JvSpeedButton, uConfiguracoes, uListaRelatorio, uListaUsuarios;

type
  TfrmSystem = class(TForm)
    pnlFundoSystem: TPanel;
    pnlMenuLateral: TPanel;
    pnlFooterSystem: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnSair: TSpeedButton;
    btnUsuarios: TSpeedButton;
    btnRelatorios: TSpeedButton;
    btnMenu: TSpeedButton;
    btnConfiguracao: TSpeedButton;
    pnlSuperior: TPanel;
    btnMinimiza: TSpeedButton;
    lbUsuLogado: TLabel;
    procedure btnMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnMinimizaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSystem: TfrmSystem;
  pExpandido: Boolean;

implementation

uses
  StrUtils,
  Math;

{$R *.dfm}
procedure TfrmSystem.btnConfiguracaoClick(Sender: TObject);
begin
  frmConfiguracoes            := TfrmConfiguracoes.Create(Self);
  frmConfiguracoes.Parent     := pnlFundoSystem;
  frmConfiguracoes.Align      := alClient;
  frmConfiguracoes.Show;
end;

procedure TfrmSystem.btnMenuClick(Sender: TObject);
begin
  if pExpandido then
    pnlMenuLateral.Width := 150
  else
    pnlMenuLateral.Width := 50;

  pExpandido := not pExpandido;

end;

procedure TfrmSystem.btnMinimizaClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmSystem.btnRelatoriosClick(Sender: TObject);
begin
  frmListaRelatorio            := TfrmListaRelatorio.Create(Self);
  frmListaRelatorio.Parent     := pnlFundoSystem;
  frmListaRelatorio.Align      := alClient;
  frmListaRelatorio.Show;
end;

procedure TfrmSystem.btnSairClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Application.Terminate;
  end else
  begin
    Exit;
  end;
end;

procedure TfrmSystem.btnUsuariosClick(Sender: TObject);
begin
  frmListaUsuario            := TfrmListaUsuario.Create(Self);
  frmListaUsuario.Parent     := pnlFundoSystem;
  frmListaUsuario.Align      := alClient;
  frmListaUsuario.Show;
end;

procedure TfrmSystem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  if MessageDlg('Tem certeza que deseja sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmSystem.FormShow(Sender: TObject);
begin
  pExpandido           := True;
  pnlMenuLateral.Width := 50;
  lbUsuLogado.Caption  := mSystem.dsUsuLogado.DataSet.FieldByName('NOME').AsString + ' - ' + DateToStr(Date);
end;

end.
