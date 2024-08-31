unit uCadUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  JvExControls, JvButton, JvTransparentButton, Data.DB, Vcl.Grids, Vcl.DBGrids, dmSystem,
  System.ImageList, Vcl.ImgList, JvExComCtrls, JvDBTreeView;

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
    btnShowPassword: TJvTransparentButton;
    ImageList1: TImageList;
    JvDBTreeView1: TJvDBTreeView;
    procedure FormShow(Sender: TObject);
    procedure btnDadosUserClick(Sender: TObject);
    procedure btnPReportsClick(Sender: TObject);
    procedure btnCancelCadClick(Sender: TObject);
    procedure edtNameUserKeyPress(Sender: TObject; var Key: Char);
    procedure edtLoginUserKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveCadUserClick(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  {with mSystem.qryCadUser do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('    U.*,');
    SQL.Add('    UPU.`ALTER` AS USU_ALTER,');
    SQL.Add('    UPU.`DELETE` AS USU_DELETE,');
    SQL.Add('    UPU.`CREATE` AS USU_CREATE,');
    SQL.Add('    UPR.`ALTER` AS REP_ALTER,');
    SQL.Add('    UPR.`DELETE` AS REP_DELETE,');
    SQL.Add('    UPR.`CREATE` AS REP_CREATE ');
    SQL.Add('FROM ');
    SQL.Add('    `tb_users` AS U ');
    SQL.Add('    LEFT JOIN `TB_USER_PERMISSION` AS UPU ON UPU.`ID_USER` = U.`ID` AND UPU.`DESC_PERMISSION` = ''SystemUser'' ');
    SQL.Add('    LEFT JOIN `TB_USER_PERMISSION` AS UPR ON UPR.`ID_USER` = U.`ID` AND UPR.`DESC_PERMISSION` = ''SystemReport'' ');
    SQL.Add('WHERE ');
    SQL.Add('    `id` = :id_user');

    ParamByName('id_user').AsInteger := ID;
    Open;

    // Verifica se o conjunto de dados não está vazio
    if not IsEmpty then
    begin
      edtIdUser.Text := FieldByName('ID').AsString;
      edtNameUser.Text := FieldByName('NAME').AsString;
      edtLoginUser.Text := FieldByName('LOGIN').AsString;
      edtPasswordUser.Text := FieldByName('PASSWORD').AsString;
      cbbStatus.ItemIndex := StrToIntDef(FieldByName('STATUS').AsString, -1);

      // Verificações de permissão para usuário
      ckAlterUser.Checked := FieldByName('USU_ALTER').AsString = 'S';
      ckDeleteUser.Checked := FieldByName('USU_DELETE').AsString = 'S';
      ckCreateUser.Checked := FieldByName('USU_CREATE').AsString = 'S';

      // Verificações de permissão para relatório
      ckReportAlter.Checked := FieldByName('REP_ALTER').AsString = 'S';
      ckReportDelete.Checked := FieldByName('REP_DELETE').AsString = 'S';
      ckReportCreate.Checked := FieldByName('REP_CREATE').AsString = 'S';
    end;
  end;}
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

  {try
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

    Close; }

end;

procedure TfrmCadUser.btnShowPasswordClick(Sender: TObject);
begin
  if edtPasswordUser.PasswordChar <> #0 then
  begin
    btnShowPassword.Images.ActiveIndex := 1;
    edtPasswordUser.PasswordChar := #0;
  end
  else
  begin
    btnShowPassword.Images.ActiveIndex := 0;
    edtPasswordUser.PasswordChar := '•';
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

procedure TfrmCadUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
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

end;

end.
