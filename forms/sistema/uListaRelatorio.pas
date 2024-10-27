unit uListaRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, dmSystem, Vcl.Buttons, Vcl.StdCtrls, uUtils, dmIntegracao, dmFastReport, uCadReport,
  classe_relatorios;

type
  TfrmListaRelatorio = class(TForm)
    pnlFundo: TPanel;
    pnlCrud: TPanel;
    dbgRelatorios: TDBGrid;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnImprimir: TSpeedButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AutoSizeDBGridColumns(Grid: TDBGrid);
  public
    { Public declarations }
  end;

var
  frmListaRelatorio: TfrmListaRelatorio;

implementation

{$R *.dfm}

procedure TfrmListaRelatorio.AutoSizeDBGridColumns(Grid: TDBGrid);
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

procedure TfrmListaRelatorio.FormShow(Sender: TObject);
begin
  Util.listaRelatorios;
  AutoSizeDBGridColumns(dbgRelatorios);
  {if dbgRelatorios.Columns.Count > 3 then
  begin
    dbgRelatorios.Columns[2].Visible := False;
    dbgRelatorios.Columns[3].Visible := False;
    dbgRelatorios.Columns[4].Visible := False;
    dbgRelatorios.Columns[5].Visible := False;
  end;}
end;

{---------------------------------------------------------------------
adiconando e alterando um relatorio
----------------------------------------------------------------------}

procedure TfrmListaRelatorio.btnNovoClick(Sender: TObject);
begin
  frmCadReport          := TfrmCadReport.Create(Self);
  frmCadReport.Caption  := 'Cadastro de relatório - NOVO';
  frmCadReport.Acao     := 0;
  frmCadReport.ShowModal;
end;

procedure TfrmListaRelatorio.btnAlterarClick(Sender: TObject);
begin
  frmCadReport          := TfrmCadReport.Create(Self);
  frmCadReport.Caption  := 'Cadastro de relatório - ALTERANDO';
  frmCadReport.Acao     := 1;
  frmCadReport.ShowModal;
end;


{--------------------------------------------------------------------
exclusão do relatório e atualização da listagem
---------------------------------------------------------------------}
procedure TfrmListaRelatorio.btnExcluirClick(Sender: TObject);
var
  id: Integer;
begin
  id := dbgRelatorios.DataSource.DataSet.FieldByName('ID').AsInteger;

  mSystem.Relatorios.deletar( id )

end;

end.
