program rlsBorgis;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uListaRelatorios, uRelRastreioContas, zcomponent, sdflaz,
  uConfig, uFiltroRelPRestante, dmDados
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Borgis - Relatórios Personalizados';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDatamodule1, Datamodule1);
  Application.CreateForm(TfrmListaRelatorios, frmListaRelatorios);
  Application.CreateForm(TfrmRelatorio1, frmRelatorio1);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmFiltrosRelParRestante, frmFiltrosRelParRestante);
  //Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

