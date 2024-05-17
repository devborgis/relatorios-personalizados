unit uCadGroupReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvButton,
  JvTransparentButton, Vcl.ExtCtrls, Vcl.StdCtrls, dmSystem;

type
  TfrmCadGroupReport = class(TForm)
    edtIdGroup: TEdit;
    edtNameGroup: TEdit;
    Panel1: TPanel;
    btnSaveCad: TJvTransparentButton;
    procedure btnSaveCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGroupReport: TfrmCadGroupReport;

implementation

{$R *.dfm}

procedure TfrmCadGroupReport.btnSaveCadClick(Sender: TObject);
begin
  try
    with mSystem.qryCadGroupReport do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TB_REPORTS_GROUP (DESCRIPTION) VALUES (:edt_name)');
      ParamByName('edt_name').AsString := edtNameGroup.Text;
      ExecSQL;
    end;

    with mSystem.qryGroupsReport do
    begin
      Close;
      Open;
    end;
    ShowMessage('Cadastro gravado com sucesso.');
    Close;
  except
    on E: Exception do
    begin

      ShowMessage('Erro ao gravar cadastro: ' + E.Message);
    end;
  end;
end;

end.
