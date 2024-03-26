program rlsBorgis;

uses
  Vcl.Forms,
  uLogin in 'C:\Users\ADM\Documents\Embarcadero\Studio\Projects\uLogin.pas' {frmLogin},
  uConfig in 'C:\Users\ADM\Documents\Embarcadero\Studio\Projects\uConfig.pas' {frmConfig},
  uSystem in 'uSystem.pas' {frmSystem},
  dmIntegracao in 'dmIntegracao.pas' {mIntegracao: TDataModule},
  dmSystem in 'dmSystem.pas' {mSystem: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmSystem, frmSystem);
  Application.CreateForm(TmIntegracao, mIntegracao);
  Application.CreateForm(TmSystem, mSystem);
  Application.Run;
end.
