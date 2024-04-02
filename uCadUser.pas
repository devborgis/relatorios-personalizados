unit uCadUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  JvExControls, JvButton, JvTransparentButton, Data.DB, Vcl.Grids, Vcl.DBGrids, dmSystem;

type
  TfrmCadUser = class(TForm)
    edtIdUser: TEdit;
    edtNameUser: TEdit;
    edtLoginUser: TEdit;
    edtPasswordUser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pgcCadUser: TPageControl;
    TabSheet1: TTabSheet;
    pnlButtons: TPanel;
    btnDadosUser: TJvTransparentButton;
    GroupBox1: TGroupBox;
    ckAlterUser: TCheckBox;
    ckCreateUser: TCheckBox;
    ckDeleteUser: TCheckBox;
    GroupBox2: TGroupBox;
    ckReportAlter: TCheckBox;
    ckReportCreate: TCheckBox;
    ckReportDelete: TCheckBox;
    pnlFooter: TPanel;
    btnSaveCadUser: TJvTransparentButton;
    btnCancelCad: TJvTransparentButton;
    cbbStatus: TComboBox;
    lbInfo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnDadosUserClick(Sender: TObject);
    procedure btnPReportsClick(Sender: TObject);
    procedure btnCancelCadClick(Sender: TObject);
    procedure edtNameUserKeyPress(Sender: TObject; var Key: Char);
    procedure edtLoginUserKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveCadUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreencheDadosUser(ID: Integer);
  end;

var
  frmCadUser: TfrmCadUser;

implementation

uses StrUtils,
  Math;

{$R *.dfm}

{Bloco para preencher os campos do cadastro do usuarios quando o tipo for alterar}
procedure TfrmCadUser.PreencheDadosUser(ID: Integer);
begin

    with mSystem.qryCadUser do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tb_users WHERE id = :id_user');
      ParamByName('id_user').AsInteger := ID;
      Open;
      edtIdUser.text := FieldByName('ID').AsString;
      edtNameUser.Text := FieldByName('NAME').AsString;
      edtLoginUser.Text :=  FieldByName('LOGIN').AsString;
      edtPasswordUser.Text := FieldByName('PASSWORD').AsString;
      cbbStatus.ItemIndex := StrToInt(FieldByName('STATUS').AsString);
    end;

end;

procedure TfrmCadUser.btnCancelCadClick(Sender: TObject);
begin
  edtIdUser.Clear;
  edtNameUser.Clear;
  edtLoginUser.Clear;
  edtPasswordUser.Clear;
  ckAlterUser.Checked := False;
  ckCreateUser.Checked := False;
  ckDeleteUser.Checked := False;
  ckReportAlter.Checked := False;
  ckReportCreate.Checked := False;
  ckReportDelete.Checked := False;
  cbbStatus.ItemIndex := -1;
  Close;
end;

procedure TfrmCadUser.btnDadosUserClick(Sender: TObject);
begin
  pgcCadUser.ActivePage := pgcCadUser.Pages[0];
end;

procedure TfrmCadUser.btnPReportsClick(Sender: TObject);
begin
  pgcCadUser.ActivePage := pgcCadUser.Pages[1];
end;

procedure TfrmCadUser.btnSaveCadUserClick(Sender: TObject);
begin

  try
    if edtIdUser.text <> 'NOVO' then
    begin
       with mSystem.qryCadUser do
        begin
          SQL.Clear;
          SQL.Add('UPDATE TB_USERS');
          SQL.Add('SET NAME = :edt_name, LOGIN = :edt_login, PASSWORD = :edt_password, STATUS = :status');
          SQL.Add('WHERE ID = :edt_id;');
          SQL.Add('');
          SQL.Add('UPDATE TB_USER_PERMISSION');
          SQL.Add('SET `ALTER` = :ck_alter, `DELETE` = :ck_delete, `CREATE` = :ck_create');
          SQL.Add('WHERE DESC_PERMISSION = ''SystemUser'' AND ID_USER = :edt_id;');
          SQL.Add('');
          SQL.Add('UPDATE TB_USER_PERMISSION');
          SQL.Add('SET `ALTER` = :ck_alter_r, `DELETE` = :ck_delete_r, `CREATE` = :ck_create_r');
          SQL.Add('WHERE DESC_PERMISSION = ''SystemReport'' AND ID_USER = :edt_id;');

          ParamByName('edt_name').AsString := edtNameUser.Text;
          ParamByName('edt_login').AsString := edtLoginUser.Text;
          ParamByName('edt_password').AsString := edtPasswordUser.Text;
          ParamByName('status').AsInteger := cbbStatus.ItemIndex;
          ParamByName('edt_id').AsString := edtIdUser.Text;
          ParamByName('ck_alter').AsString := IfThen(ckAlterUser.Checked, 'S', 'N');
          ParamByName('ck_delete').AsString := IfThen(ckDeleteUser.Checked, 'S', 'N');
          ParamByName('ck_create').AsString := IfThen(ckCreateUser.Checked, 'S', 'N');
          ParamByName('ck_alter_r').AsString := IfThen(ckReportAlter.Checked, 'S', 'N');
          ParamByName('ck_delete_r').AsString := IfThen(ckReportDelete.Checked, 'S', 'N');
          ParamByName('ck_create_r').AsString := IfThen(ckReportCreate.Checked, 'S', 'N');

          ExecSQL;
        end;
          Close;
    end else
      begin
        with mSystem.qryCadUser do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO TB_USERS (STATUS, NAME, LOGIN, PASSWORD) VALUES (:status, :edt_name, :edt_login, :edt_password)');
          ParamByName('edt_name').AsString := edtNameUser.text;
          ParamByName('edt_login').AsString := edtLoginUser.text;
          ParamByName('edt_password').AsString := edtPasswordUser.text;
          ParamByName('status').AsInteger := cbbStatus.ItemIndex;
          ExecSQL;
        end;
      end;
  except
    on E: Exception do
      MessageDlg('Erro ao gravar registros no banco de dados: ' + #13#10 + E.Message, mtError, [mbOK], 0);
  end;

  edtIdUser.Clear;
  edtNameUser.Clear;
  edtLoginUser.Clear;
  edtPasswordUser.Clear;
  ckAlterUser.Checked := False;
  ckCreateUser.Checked := False;
  ckDeleteUser.Checked := False;
  ckReportAlter.Checked := False;
  ckReportCreate.Checked := False;
  ckReportDelete.Checked := False;
  cbbStatus.ItemIndex := -1;

  with mSystem.qryUsers do
    begin
      Close;
      Open;
    end;

end;

procedure TfrmCadUser.edtLoginUserKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
    edtPasswordUser.SetFocus;
  end;

  if Key = #32 then
  begin
    ShowMessage('O Campo Login não pode conter espaços, verifique !');
    Key := #0;
  end;

end;

procedure TfrmCadUser.edtNameUserKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edtLoginUser.SetFocus
end;

procedure TfrmCadUser.FormShow(Sender: TObject);
var
pages: integer;
begin
  for pages := 0 to pgcCadUser.PageCount - 1 do
    begin
      pgcCadUser.pages[pages].TabVisible := False;
    end;
  pgcCadUser.ActivePage := pgcCadUser.Pages[0];
  edtNameUser.SetFocus;
  cbbStatus.ItemIndex := 1;

  if edtIdUser.Text <> 'NOVO' then
  begin
    with mSystem.qryCadPermission do
    begin
      Close;
      ParamByName('id_sel').AsString := edtIdUser.Text;
      Open;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (FieldByName('ALTER').AsString = 'N' ) then
        ckAlterUser.Checked := False
      else
        ckAlterUser.Checked := True;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (FieldByName('CREATE').AsString = 'N' ) then
        ckCreateUser.Checked := False
      else
        ckCreateUser.Checked := True;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemUser') and (FieldByName('DELETE').AsString = 'N' ) then
        ckDeleteUser.Checked := False
      else
        ckDeleteUser.Checked := True;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (FieldByName('ALTER').AsString = 'N' ) then
        ckReportAlter.Checked := False
      else
        ckReportAlter.Checked := True;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (FieldByName('CREATE').AsString = 'N' ) then
        ckReportCreate.Checked := False
      else
        ckReportCreate.Checked := True;
      if (FieldByName('DESC_PERMISSION').AsString = 'SystemReport') and (FieldByName('DELETE').AsString = 'N' ) then
        ckReportDelete.Checked := False
      else
        ckReportDelete.Checked := True;

    end;
  end;


end;

end.
