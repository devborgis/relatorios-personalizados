program rlsBorgis;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uConfig in 'uConfig.pas' {frmConfig},
  uSystem in 'uSystem.pas' {frmSystem},
  dmIntegracao in 'dmIntegracao.pas' {mIntegracao: TDataModule},
  dmSystem in 'dmSystem.pas' {mSystem: TDataModule},
  uCadUser in 'uCadUser.pas' {frmCadUser},
  uCadReport in 'uCadReport.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmSystem, frmSystem);
  Application.CreateForm(TmIntegracao, mIntegracao);
  Application.CreateForm(TmSystem, mSystem);
  Application.CreateForm(TfrmCadUser, frmCadUser);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
