unit dmFastReport;

interface

uses
  System.SysUtils, System.Classes, frxExportCSV, frxExportDOCX, frxExportXLSX,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDesgn, Data.DB,
  IBX.IBDatabase, frxIBXComponents, frxGradient, frxChBox,
  frxCellularTextObject, frxMap, frxTableObject, frxGaugeView, frxCross,
  frxRich, frxOLE, frxBarcode, frxChart, frxDCtrl, frxFDComponents,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TmFastReport = class(TDataModule)
    frxIBXComponents1: TfrxIBXComponents;
    conFast: TIBDatabase;
    frxDesigner1: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxCSVExport1: TfrxCSVExport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxRichObject1: TfrxRichObject;
    frxCrossObject1: TfrxCrossObject;
    frxGaugeObject1: TfrxGaugeObject;
    frxReportTableObject1: TfrxReportTableObject;
    frxMapObject1: TfrxMapObject;
    frxReportCellularTextObject1: TfrxReportCellularTextObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxGradientObject1: TfrxGradientObject;
    frxDialogControls1: TfrxDialogControls;
    frxChartObject1: TfrxChartObject;
    frxFDComponents1: TfrxFDComponents;
    FDconFast: TFDConnection;
    frxReport1: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
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

procedure TmFastReport.DataModuleCreate(Sender: TObject);
begin
  IBXComponents.Free;
end;

end.
