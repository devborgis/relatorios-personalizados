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
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, frxDesgn, frxClass,
  frxADOComponents, dmIntegracao, dmSystem, frxDBSet, frxDBXComponents,
  Data.Win.ADODB, FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, frxDCtrl,
  JvExControls, JvButton, JvTransparentButton, uCadUser, frxIBXComponents,
  IBX.IBDatabase, IBX.IBCustomDataSet, IniFiles, dmFastReport;

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
    Panel1: TPanel;
    dbgUsers: TDBGrid;
    dbgReports: TDBGrid;
    edtFilterDescReport: TEdit;
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
    procedure btnCreateUserClick(Sender: TObject);
    procedure btnEdtUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure edtFilterNameUserChange(Sender: TObject);
    procedure edtFilterDescReportChange(Sender: TObject);
    procedure btnAddReportClick(Sender: TObject);
  private
    { Private declarations }
    procedure PermissionUser;
  public
    { Public declarations }
  end;

var
  frmSystem: TfrmSystem;

implementation

{$R *.dfm}

procedure TfrmSystem.PermissionUser;
var
canAlter, canCreate, canDelete: String;
begin
  with mSystem.qryUserPermission do
    begin
      Close;
      ParamByName('id_login').AsInteger := mSystem.qryLogin.FieldByName('id').AsInteger;
      Open;

      // Armazenando os valores das permissões
      canAlter := FieldByName('ALTER').AsString;
      canCreate := FieldByName('CREATE').AsString;
      canDelete := FieldByName('DELETE').AsString;

      // Verificações de permissão para usuários
      btnEdtUser.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (canAlter = 'N'));
      btnCreateUser.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (canCreate = 'N'));
      btnDeleteUser.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (canDelete = 'N'));

      // Verificações de permissão para relatórios
      btnEdtReport.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (canAlter = 'N'));
      btnAddReport.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (canCreate = 'N'));
      btnDeleteReport.Enabled := not ((FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (canDelete = 'N'));
    end;
end;

procedure TfrmSystem.btnAddReportClick(Sender: TObject);
var
  IniPath: string;
  Ini: TInifile;
  StringDB: String;
  ParamsDB: TStringList;
begin
  IniPath := ExtractFilePath(ParamStr(0)) + '.integracao\' + 'CONFIG.INI';

  ParamsDB := TStringList.Create;
  try
    Ini := TIniFile.Create(IniPath);
    try
      ParamsDB.Add('password=' + Ini.ReadString('CONEXAO', 'PASSWORD', ''));
      ParamsDB.Add('user_name=' + Ini.ReadString('CONEXAO', 'USER', ''));
      ParamsDB.Add('lc_ctype=UTF8');

      StringDB := Ini.ReadString('CONEXAO', 'HOST', '') + '/' +
                  Ini.ReadString('CONEXAO', 'PORT', '') + ':' +
                  Ini.ReadString('CONEXAO', 'DATABASE', '');

      mFastReport.conFast.Params := ParamsDB;

      mFastReport.conFast.DatabaseName := StringDB;
      mFastReport.conFast.Connected := True;

      mFastReport.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '.system\Rel.fr3');
      mFastReport.frxReport1.DesignReport();
    finally
      Ini.Free;
    end;
  finally
    ParamsDB.Free;
  end;
end;

procedure TfrmSystem.btnCreateUserClick(Sender: TObject);
begin
  frmCadUser.Caption := 'Manutenção de usuários - INCLUIR';
  frmCadUser.edtIdUser.Text := 'NOVO';
  frmCadUser.lbInfo.Visible := True;
  frmCadUser.GroupBox1.Visible := False;
  frmCadUser.GroupBox2.Visible := False;
  frmCadUser.ShowModal;
end;

procedure TfrmSystem.btnDeleteUserClick(Sender: TObject);
begin
    if MessageDlg('Essa ação é irreversivel deseja continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      with mSystem.qryCadUser do
        begin
          Close;
          SQL.Clear;
          SQL.Add('DELETE FROM tb_users WHERE ID = :id_user');
          ParamByName('id_user').AsInteger := dbgUsers.DataSource.DataSet.FieldByName('ID').AsInteger;
          Open;
        end;
    end else
      begin
        exit;
      end;
end;

procedure TfrmSystem.btnEdtUserClick(Sender: TObject);
var IdSelect: Integer;
begin

  IdSelect := dbgUsers.DataSource.DataSet.FieldByName('ID').AsInteger;

  frmCadUser.Caption := 'Manutenção de usuários - ALTERAR';
  frmCadUser.PreencheDadosUser(IdSelect);
  frmCadUser.lbInfo.Visible := false;
  frmCadUser.GroupBox1.Visible := True;
  frmCadUser.GroupBox2.Visible := True;
  frmCadUser.ShowModal;
end;

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
canAlter, canCreate, canDelete: String;
begin

  imgMenu.top := (self.Height div 2) - (imgMenu.height div 2);
  imgMenu.left := (self.Width div 2) - (imgMenu.width div 2);

  for pages := 0 to pgcSystem.PageCount - 1 do
    begin
      pgcSystem.pages[pages].TabVisible := False;
    end;
  pgcSystem.ActivePage := pgcSystem.Pages[2];
  PermissionUser;
end;

procedure TfrmSystem.btnShowUsersClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 1;
  edtFilterDescReport.Clear;
  PermissionUser;
end;

procedure TfrmSystem.edtFilterDescReportChange(Sender: TObject);
begin
  if Trim(edtFilterDescReport.Text) = '' then
  begin
    mSystem.qryReports.Filtered := False;
  end
  else
  begin
    mSystem.qryReports.Filter := 'Nome LIKE ' + QuotedStr('%' + edtFilterDescReport.Text + '%');
    mSystem.qryReports.Filtered := True;
  end;
end;

procedure TfrmSystem.edtFilterNameUserChange(Sender: TObject);
begin
  if Trim(edtFilterNameUser.Text) = '' then
  begin
    mSystem.qryUsers.Filtered := False;
  end
  else
  begin
    mSystem.qryUsers.Filter := 'Nome LIKE ' + QuotedStr('%' + edtFilterNameUser.Text + '%');
    mSystem.qryUsers.Filtered := True;
  end;
end;

procedure TfrmSystem.btnHomeClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 2;
  edtFilterDescReport.Clear;
  edtFilterNameUser.Clear;
end;

procedure TfrmSystem.btnShowReportsClick(Sender: TObject);
begin
  pgcSystem.ActivePageIndex := 0;
  edtFilterNameUser.Clear;
  PermissionUser;
end;

procedure TfrmSystem.SpeedButton1Click(Sender: TObject);
begin
 // frxReport1.DesignReport;
end;

end.
