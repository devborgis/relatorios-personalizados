program rlsBorgis;

uses
  Vcl.Forms,
  uLogin in 'forms\sistema\uLogin.pas' {frmLogin},
  uconfig in 'forms\sistema\uconfig.pas' {frmConfig},
  uSystem in 'forms\sistema\uSystem.pas' {frmSystem},
  dmIntegracao in 'data\integracao\dmIntegracao.pas' {mIntegracao: TDataModule},
  dmSystem in 'data\sistema\dmSystem.pas' {mSystem: TDataModule},
  uCadUser in 'forms\cadastros\uCadUser.pas' {frmCadUser},
  uCadReport in 'forms\cadastros\uCadReport.pas' {frmCadReport},
  dmFastReport in 'data\fastreport\dmFastReport.pas' {mFastReport: TDataModule},
  uCadGroupReport in 'forms\cadastros\uCadGroupReport.pas' {frmCadGroupReport},
  uUtils in 'classes\uUtils.pas',
  uConf in 'classes\uConf.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Borgis - Relatórios Personalizados';
  Application.CreateForm(TmSystem, mSystem);
  Application.CreateForm(TmIntegracao, mIntegracao);
  Application.CreateForm(TmFastReport, mFastReport);
  Application.CreateForm(TfrmLogin, frmLogin);
  {a aplicação não vai mais criar os formularios serao criados
  de acordo com o uso

  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmSystem, frmSystem);
  Application.CreateForm(TfrmCadUser, frmCadUser);
  Application.CreateForm(TfrmCadReport, frmCadReport);
  Application.CreateForm(TfrmCadGroupReport, frmCadGroupReport);}
  Application.Run;
end.
