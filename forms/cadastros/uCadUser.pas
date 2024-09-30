unit uCadUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  JvExControls, JvButton, JvTransparentButton, Data.DB, Vcl.Grids, Vcl.DBGrids, dmSystem,
  System.ImageList, Vcl.ImgList, JvExComCtrls, JvDBTreeView, Vcl.Buttons, uUtils;

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
    tbsDados: TTabSheet;
    pnlButtons: TPanel;
    pnlFooter: TPanel;
    cbbStatus: TComboBox;
    btnShowPassword: TJvTransparentButton;
    ImageList1: TImageList;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnUsuPermissao: TSpeedButton;
    btnUsuDados: TSpeedButton;
    cbbAdmin: TComboBox;
    tbsPermissoes: TTabSheet;
    dbgUsuPermissao: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure edtNameUserKeyPress(Sender: TObject; var Key: Char);
    procedure edtLoginUserKeyPress(Sender: TObject; var Key: Char);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnUsuDadosClick(Sender: TObject);
    procedure btnUsuPermissaoClick(Sender: TObject);
    procedure dbgUsuPermissaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgUsuPermissaoDblClick(Sender: TObject);
    procedure dbgUsuPermissaoCellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure AutoSizeDBGridColumns(Grid: TDBGrid);
    procedure PreencheUsuario(Id:Integer);
  end;

var
  frmCadUser: TfrmCadUser;

implementation

uses StrUtils,
  Math;

{$R *.dfm}

{-----------------------------------------
Botão para cancelar cadatro
------------------------------------------}
procedure TfrmCadUser.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

{-----------------------------------------
Salvar e atualizar cadastro
------------------------------------------}
procedure TfrmCadUser.btnSalvarClick(Sender: TObject);
begin
  // Se o ID já estiver preenchido atualizar se não cadastrar
  if edtIdUser.Text <> '' then
    begin
      // Nome, Login, Senha, Status e ID do usuario alterado;

      Util.attUsuario(edtNameUser.Text,
                      edtLoginUser.Text,
                      edtPasswordUser.Text,
                      cbbStatus.ItemIndex,
                      StrToInt(edtIdUser.Text)
                      );
    end;

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

procedure TfrmCadUser.btnUsuDadosClick(Sender: TObject);
begin
  pgcCadUser.ActivePageIndex := 0;
end;

procedure TfrmCadUser.btnUsuPermissaoClick(Sender: TObject);
begin
  pgcCadUser.ActivePageIndex := 1;
end;

procedure TfrmCadUser.dbgUsuPermissaoCellClick(Column: TColumn);
var
  Sender: TObject;
begin
 //
end;

procedure TfrmCadUser.dbgUsuPermissaoDblClick(Sender: TObject);
begin
  {// Verifica se o dataset está vazio
  if (Sender as TDBGrid).DataSource.Dataset.IsEmpty then
    Exit;
  // Coloca o dataset no modo de edição
  (Sender as TDBGrid).DataSource.Dataset.Edit;
  // Alterna o valor do campo EXCLUIR
  (Sender as TDBGrid).DataSource.Dataset.FieldByName('EXCLUIR').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('EXCLUIR').AsInteger = 1, 0, 1);
  // Alterna o valor do campo EDITAR
  (Sender as TDBGrid).DataSource.Dataset.FieldByName('EDITAR').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('EDITAR').AsInteger = 1, 0, 1);
  // Alterna o valor do campo INCLUIR
  (Sender as TDBGrid).DataSource.Dataset.FieldByName('INCLUIR').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('INCLUIR').AsInteger = 1, 0, 1);
  // Alterna o valor do campo VISUALIZAR
  (Sender as TDBGrid).DataSource.Dataset.FieldByName('VISUALIZAR').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('VISUALIZAR').AsInteger = 1, 0, 1);
  // Salva as alterações
  (Sender as TDBGrid).DataSource.Dataset.Post;}

  // Verifica se o dataset está ativo e atualizado
 with (Sender as TDBGrid).DataSource.Dataset do
begin
  if IsEmpty then Exit;
  Edit;

  FieldByName('EXCLUIR').AsInteger := IfThen(FieldByName('EXCLUIR').AsInteger = 1, 0, 1);
  FieldByName('EDITAR').AsInteger := IfThen(FieldByName('EDITAR').AsInteger = 1, 0, 1);
  FieldByName('INCLUIR').AsInteger := IfThen(FieldByName('INCLUIR').AsInteger = 1, 0, 1);
  FieldByName('VISUALIZAR').AsInteger := IfThen(FieldByName('VISUALIZAR').AsInteger = 1, 0, 1);

  Post;  // Primeiro salva no DataSet
  //ApplyUpdates(0);  // Agora aplica as mudanças no banco de dados
  end;
end;

procedure TfrmCadUser.dbgUsuPermissaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  TDBGrid(Sender).Canvas.FillRect(Rect);
  // Verifica se a coluna é 'EXCLUIR', 'EDITAR', 'INCLUIR' ou 'VISUALIZAR'
  if (Column.FieldName = 'EXCLUIR') or
     (Column.FieldName = 'EDITAR') or
     (Column.FieldName = 'INCLUIR') or
     (Column.FieldName = 'VISUALIZAR') then
  begin
    // Define o valor do CheckBox baseado no valor do campo (1 ou 0)
    if Column.Field.AsInteger = 1 then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, -2, -2); { Ajusta o tamanho do CheckBox }
    // Desenha o CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end
  else
  begin
    // Para as demais colunas, o comportamento normal de desenho é mantido
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
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
  AutoSizeDBGridColumns(dbgUsuPermissao);

end;

procedure TfrmCadUser.PreencheUsuario(Id: Integer);
begin
  with dmSystem.mSystem.qryUsuCad do
    begin
      Close;
      ParamByName('ID').AsInteger := Id;
      Open;
      edtIdUser.Text := IntToStr(FieldByName('ID').AsInteger);
      edtNameUser.Text := FieldByName('NOME').AsString;
      edtLoginUser.Text := FieldByName('LOGIN').AsString;
      edtPasswordUser.Text := FieldByName('SENHA').AsString;
      cbbStatus.ItemIndex := FieldByName('STATUS').AsInteger;
      //cbbAdmin.ItemIndex := FieldByName('ADM').AsInteger;

    end;
end;

procedure TfrmCadUser.AutoSizeDBGridColumns(Grid: TDBGrid);
var
  Col, Row: Integer;
  MaxWidth, CellWidth: Integer;
  FieldText: string;
begin
  for Col := 0 to Grid.Columns.Count - 1 do
  begin
    MaxWidth := Grid.Canvas.TextWidth(Grid.Columns[Col].Title.Caption) + 10;
    Grid.DataSource.DataSet.First;
    for Row := 0 to Grid.DataSource.DataSet.RecordCount - 1 do
    begin
      FieldText := Grid.Columns[Col].Field.AsString;
      CellWidth := Grid.Canvas.TextWidth(FieldText) + 10;
      if CellWidth > MaxWidth then
        MaxWidth := CellWidth;
      Grid.DataSource.DataSet.Next;
    end;
    Grid.Columns[Col].Width := MaxWidth;
  end;
end;

end.
