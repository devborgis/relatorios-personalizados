{*****************************************************************************
 * Nome do Arquivo: uSystem.pas
 * Descri��o: Tela pricipal do sistema
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

unit uSystem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, frxDesgn, frxClass,
  frxADOComponents, dmIntegracao, dmSystem, frxDBSet, frxDBXComponents,
  Data.Win.ADODB, FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, frxDCtrl,
  JvExControls, JvButton, JvTransparentButton;

type
  TfrmSystem = class(TForm)
    pnlFundoSystem: TPanel;
    pnlTituloSystem: TPanel;
    pnlFooterSystem: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pgcSystem: TPageControl;
    tsReports: TTabSheet;
    tsUsers: TTabSheet;
    Panel2: TPanel;
    frxDesigner1: TfrxDesigner;
    Panel1: TPanel;
    dbgUsers: TDBGrid;
    dbgReports: TDBGrid;
    edtFilterDescReport: TEdit;
    frxReport1: TfrxReport;
    btnExitSystem: TJvTransparentButton;
    btnHome: TJvTransparentButton;
    btnShowUsers: TJvTransparentButton;
    btnShowReports: TJvTransparentButton;
    tsMenu: TTabSheet;
    imgMenu: TImage;
    edtFilterNameUser: TEdit;
    btnEdtReport: TJvTransparentButton;
    btnPrintReport: TJvTransparentButton;
    btnDeleteReport: TJvTransparentButton;
    btnAddReport: TJvTransparentButton;
    btnEdtUser: TJvTransparentButton;
    btnCreateUser: TJvTransparentButton;
    btnDeleteUser: TJvTransparentButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExitSystemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowReportsClick(Sender: TObject);
    procedure btnShowUsersClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSystem: TfrmSystem;

implementation

{$R *.dfm}

procedure TfrmSystem.btnExitSystemClick(Sender: TObject);
begin

  if MessageDlg('Tem certeza que deseja sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Close;
  end else
  begin
    Exit;
  end;
end;

procedure TfrmSystem.FormShow(Sender: TObject);
var pages: Integer;
begin

  imgMenu.top := (self.Height div 2) - (imgMenu.height div 2);
  imgMenu.left := (self.Width div 2) - (imgMenu.width div 2);

  for pages := 0 to pgcSystem.PageCount - 1 do
    begin
      pgcSystem.pages[pages].TabVisible := False;
    end;
  pgcSystem.ActivePage := pgcSystem.Pages[2];
end;

procedure TfrmSystem.btnShowUsersClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 1;
end;

procedure TfrmSystem.btnHomeClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 2;
end;

procedure TfrmSystem.btnShowReportsClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 0;
end;

procedure TfrmSystem.SpeedButton1Click(Sender: TObject);
begin
  frxReport1.DesignReport;
end;

end.
