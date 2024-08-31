unit uCadReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvButton,
  JvTransparentButton, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, dmFastReport, dmSystem, uCadGroupReport,
  Data.DB, Datasnap.DBClient;

type
  TfrmCadReport = class(TForm)
    edtIdReport: TEdit;
    edtNameReport: TEdit;
    cbbGroupReport: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAddGroupReport: TJvTransparentButton;
    Panel1: TPanel;
    bntSaveCad: TJvTransparentButton;
    btnCancCadReport: TJvTransparentButton;
    dlgNewFr3: TOpenDialog;
    Label3: TLabel;
    btnEdtReport: TJvTransparentButton;
    edtPathReport: TEdit;
    bntFileReport: TJvTransparentButton;
    cbbSubGrupoReport: TDBLookupComboBox;
    Label4: TLabel;
    procedure btnCancCadReportClick(Sender: TObject);
    procedure btnNewFr3Click(Sender: TObject);
    procedure bntSaveCadClick(Sender: TObject);
    procedure edtNameReportKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnAddGroupReportClick(Sender: TObject);
    procedure bntFileReportClick(Sender: TObject);
    procedure btnEdtReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreencheDadosReport(IdReport: Integer);
  end;

var
  frmCadReport: TfrmCadReport;

implementation

{$R *.dfm}

procedure TfrmCadReport.PreencheDadosReport(IdReport: Integer);
begin 
  {with mSystem.qryCadReport do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_REPORTS WHERE ID = :id_report');
      ParamByName('id_report').AsInteger := IdReport;
      Open;
      edtIdReport.text := FieldByName('ID').AsString;
      edtNameReport.Text := FieldByName('DESCRIPTION').AsString;
      cbbGroupReport.KeyValue :=  StrToInt(FieldByName('ID_GROUP').AsString);
      edtPathReport.Text := FieldByName('PATH_REPORT').AsString;
    end; }
end;

procedure TfrmCadReport.bntFileReportClick(Sender: TObject);
begin
  dlgNewFr3.Filter := 'Arquivos FastReport (*.fr3)|*.fr3|Todos os arquivos (*.*)|*.*';

  if dlgNewFr3.Execute then
  begin
    edtPathReport.Text := dlgNewFr3.FileName;
  end;
end;

procedure TfrmCadReport.bntSaveCadClick(Sender: TObject);
begin

  {try
    if edtIdReport.text <> 'NOVO' then
    begin
      with mSystem.qryCadReport do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE TB_REPORTS');
          SQL.Add('SET DESCRIPTION = :edt_name, ID_GROUP = :id_group, PATH_REPORT = :edt_report');
          SQL.Add('WHERE ID = :edt_id');

          ParamByName('edt_name').AsString := edtNameReport.Text;
          ParamByName('id_group').AsInteger := cbbGroupReport.KeyValue;
          ParamByName('edt_id').AsInteger := StrToInt(edtIdReport.Text);
          ParamByName('edt_report').AsString := edtPathReport.Text;

          ExecSQL;
        end;

        edtIdReport.Clear;
        edtNameReport.Clear;
        edtPathReport.Clear;

          with mSystem.qryReports do
            begin
              Close;
              Open;
            end;

          frmCadReport.Close;
    end else 
      begin

          with mSystem.qryCadReport do
          begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO TB_REPORTS (ID_GROUP, DESCRIPTION, PATH_REPORT) VALUES (:id_group, :edt_name, :fr3)');
            ParamByName('id_group').AsInteger := cbbGroupReport.KeyValue;
            ParamByName('edt_name').AsString := edtNameReport.text;
            ParamByName('fr3').AsString := edtPathReport.Text;
            ExecSQL;
          end;

          edtIdReport.Clear;
          edtNameReport.Clear;
          edtPathReport.Clear;

          with mSystem.qryReports do
            begin
              Close;
              Open;
            end;

          frmCadReport.Close;

      end;

  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar relatório: ' + E.Message);
  end; }

end;

procedure TfrmCadReport.btnAddGroupReportClick(Sender: TObject);
begin
  frmCadGroupReport.ShowModal;
end;

procedure TfrmCadReport.btnCancCadReportClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadReport.btnEdtReportClick(Sender: TObject);
var
  ReportPath: string;
begin
  ReportPath := edtPathReport.Text;

  if ReportPath = '' then
  begin
    mFastReport.frxReport1.DesignReport();
  end
  else
  begin
    if FileExists(ReportPath) then
    begin
      try
        mFastReport.frxReport1.LoadFromFile(ReportPath);
        mFastReport.frxReport1.DesignReport(true);
      except
        on E: Exception do
          ShowMessage('Erro ao carregar o relatório: ' + E.Message);
      end;
    end
    else
    begin
      ShowMessage('O caminho do FR3 não existe. Verifique o caminho e tente novamente.');
    end;
  end;
end;

procedure TfrmCadReport.btnNewFr3Click(Sender: TObject);
begin
  dlgNewFr3.Filter := 'Arquivos FastReport (*.fr3)|*.fr3|Todos os arquivos (*.*)|*.*';
  try
    if dlgNewFr3.Execute then
    begin
      mFastReport.frxReport1.LoadFromFile(dlgNewFr3.FileName);
      mFastReport.frxReport1.DesignReport();
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao buscar arquivo .FR3: ' + E.Message);
  end;
end;

procedure TfrmCadReport.edtNameReportKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cbbGroupReport.SetFocus
end;

procedure TfrmCadReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadReport.FormShow(Sender: TObject);
begin
  edtNameReport.SetFocus;
end;

end.
