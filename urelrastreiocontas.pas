unit uRelRastreioContas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  ZConnection, ZDataset, RLReport, RLPDFFilter, RLXLSFilter, RLXLSXFilter,
  RLHTMLFilter, RLPreviewForm, RLDraftFilter, RLRichFilter, dmDados;

type

  { TfrmRelatorio1 }

  TfrmRelatorio1 = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraftFilter1: TRLDraftFilter;
    RLGroup1: TRLGroup;
    RLHTMLFilter1: TRLHTMLFilter;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLReport1: TRLReport;
    RLRichFilter1: TRLRichFilter;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
  private

  public

  end;

var
  frmRelatorio1: TfrmRelatorio1;

implementation

{$R *.lfm}

{ TfrmRelatorio1 }



end.

