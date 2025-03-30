unit uCarregando;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uUtils, uConf, uconfig,
  Vcl.ExtCtrls, dmSystem, dmIntegracao, uLogin, uSystem;

type
  TfrmCarregando = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    lbStatus: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  //
  public
    { Public declarations }
  end;

var
  frmCarregando: TfrmCarregando;

implementation

{$R *.dfm}

procedure TfrmCarregando.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCarregando.FormShow(Sender: TObject);
begin
  if not Conf.getConfExiste then
  begin
    MessageDlg('ARQUIVO DE CONFIGURAÇÃO DO SISTEMA NÃO EXISTE', mtError, [mbOK], 0);
    frmConfig := TfrmConfig.Create(Self);
    try
      frmConfig.ShowModal;
    finally
      //
    end;
  end
  else
  begin
    try
      frmLogin   := TfrmLogin.Create(Self);
      frmLogin.ShowModal;
    finally

    end;
  end;
end;


end.
