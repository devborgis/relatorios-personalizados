unit uListaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, dmSystem, uUtils, uCadUser;

type
  TfrmListaUsuario = class(TForm)
    pnlCrud: TPanel;
    btnCriar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    edtBuscaUsuario: TEdit;
    dbgListaUsuario: TDBGrid;
    pnlFundo: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);

  private
    { Private declarations }
    procedure AutoSizeDBGridColumns(Grid: TDBGrid);
  public
    { Public declarations }
  end;

var
  frmListaUsuario: TfrmListaUsuario;

implementation

{$R *.dfm}


{----------------------------------------
cadastrar e/ou alterar um usuario
-----------------------------------------}
procedure TfrmListaUsuario.btnCriarClick(Sender: TObject);
begin
  frmCadUser                          := TfrmCadUser.Create(Self);
  frmCadUser.btnUsuPermissao.visible  := False;
  frmCadUser.Caption                  := 'Cadastro de usuário - NOVO';
  frmCadUser.ShowModal;
end;

procedure TfrmListaUsuario.btnEditarClick(Sender: TObject);
begin
  frmCadUser                          := TfrmCadUser.Create(Self);
  frmCadUser.btnUsuPermissao.visible  := True;
  frmCadUser.Caption                  := 'Cadastro de usuário - ALTERANDO';
  frmCadUser.PreencheUsuario(dbgListaUsuario.DataSource.DataSet.FieldByName('ID').AsInteger);
  frmCadUser.ShowModal;
end;

{-----------------------------------------
excluindo um usuario metodo na classe utils
------------------------------------------}

procedure TfrmListaUsuario.btnExcluirClick(Sender: TObject);
var
  id: Integer;
begin
  id := dbgListaUsuario.DataSource.DataSet.FieldByName('ID').AsInteger;
  // Confirmação antes de excluir
    {if MessageDlg('Tem certeza que deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        // Exclui o registro
        Util.excUsuario(id);
        dbgListaUsuario.DataSource.DataSet.Refresh;
      except
        on E: Exception do
          ShowMessage('Erro ao excluir o registro: ' + E.Message);
      end;
    end; }
end;

{----------------------------------------------------------
carregando os dados para listagem de ususarios
-----------------------------------------------------------}

procedure TfrmListaUsuario.FormShow(Sender: TObject);
begin
  dbgListaUsuario.DataSource.DataSet.Active := False;
  dbgListaUsuario.DataSource.DataSet.Active := True;
  AutoSizeDBGridColumns(dbgListaUsuario);
end;


procedure TfrmListaUsuario.AutoSizeDBGridColumns(Grid: TDBGrid);
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
