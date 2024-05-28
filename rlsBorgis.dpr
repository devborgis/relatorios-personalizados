program rlsBorgis;

uses
  Vcl.Forms,
  uLogin in 'forms\sistema\uLogin.pas' {frmLogin},
  uConfig in 'forms\sistema\uConfig.pas' {frmConfig},
  uSystem in 'forms\sistema\uSystem.pas' {frmSystem},
  dmIntegracao in 'data\integracao\dmIntegracao.pas' {mIntegracao: TDataModule},
  dmSystem in 'data\sistema\dmSystem.pas' {mSystem: TDataModule},
  uCadUser in 'forms\cadastros\uCadUser.pas' {frmCadUser},
  uCadReport in 'forms\cadastros\uCadReport.pas' {frmCadReport},
  dmFastReport in 'data\fastreport\dmFastReport.pas' {mFastReport: TDataModule},
  uCadGroupReport in 'forms\cadastros\uCadGroupReport.pas' {frmCadGroupReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Borgis - Relatórios Personalizados';
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmSystem, frmSystem);
  Application.CreateForm(TmIntegracao, mIntegracao);
  Application.CreateForm(TmSystem, mSystem);
  Application.CreateForm(TfrmCadUser, frmCadUser);
  Application.CreateForm(TfrmCadReport, frmCadReport);
  Application.CreateForm(TmFastReport, mFastReport);
  Application.CreateForm(TfrmCadGroupReport, frmCadGroupReport);
  Application.Run;
end.
