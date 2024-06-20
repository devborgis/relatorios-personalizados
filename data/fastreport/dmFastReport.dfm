object mFastReport: TmFastReport
  Height = 277
  Width = 743
  object frxIBXComponents1: TfrxIBXComponents
    DefaultDatabase = conFast
    Left = 120
    Top = 24
  end
  object conFast: TIBDatabase
    DatabaseName = 'localhost/3050:C:\Borgis\BORGIS.FDB'
    Params.Strings = (
      'password=masterkey'
      'user_name=sysdba'
      'lc_ctype=UNICODE_FSS')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 208
    Top = 24
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 276
    Top = 24
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'C:\Users\ADM\Downloads\report.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 45384.677512476850000000
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 32
    Top = 96
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 120
    Top = 96
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 32
    Top = 152
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 120
    Top = 152
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 624
    Top = 88
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 528
    Top = 88
  end
  object frxRichObject1: TfrxRichObject
    Left = 624
    Top = 24
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 528
    Top = 144
  end
  object frxGaugeObject1: TfrxGaugeObject
    Left = 400
    Top = 88
  end
  object frxReportTableObject1: TfrxReportTableObject
    Left = 624
    Top = 144
  end
  object frxMapObject1: TfrxMapObject
    Left = 528
    Top = 24
  end
  object frxReportCellularTextObject1: TfrxReportCellularTextObject
    Left = 400
    Top = 24
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 624
    Top = 200
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 400
    Top = 144
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 400
    Top = 200
  end
  object frxChartObject1: TfrxChartObject
    Left = 528
    Top = 200
  end
  object frxFDComponents1: TfrxFDComponents
    Left = 120
    Top = 208
  end
  object FDconFast: TFDConnection
    Left = 224
    Top = 208
  end
  object frxReport1: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45461.639418067130000000
    ReportOptions.LastChange = 45461.639418067130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
