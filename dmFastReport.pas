unit dmFastReport;

interface

uses
  System.SysUtils, System.Classes, frxExportCSV, frxExportDOCX, frxExportXLSX,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDesgn, Data.DB,
  IBX.IBDatabase, frxIBXComponents;

type
  TmFastReport = class(TDataModule)
    frxReport1: TfrxReport;
    frxIBXComponents1: TfrxIBXComponents;
    conFast: TIBDatabase;
    frxDesigner1: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxCSVExport1: TfrxCSVExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mFastReport: TmFastReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
