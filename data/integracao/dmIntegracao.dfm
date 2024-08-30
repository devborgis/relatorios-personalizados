object mIntegracao: TmIntegracao
  Height = 421
  Width = 781
  object DBIntegracao: TFDConnection
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object IBXIntegracao: TIBDatabase
    ServerType = 'IBServer'
    Left = 120
    Top = 24
  end
  object fReport: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45533.586333391210000000
    ReportOptions.LastChange = 45533.586333391210000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object fReportDesigner: TfrxDesigner
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
    Left = 280
    Top = 24
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 384
    Top = 24
  end
  object frxPPTXExport1: TfrxPPTXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 480
    Top = 24
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
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
    Left = 576
    Top = 24
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Outline = False
    Left = 480
    Top = 80
  end
  object frxPNGExport1: TfrxPNGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 576
    Top = 80
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
    Left = 384
    Top = 80
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 384
    Top = 136
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 480
    Top = 136
  end
  object frxRichObject1: TfrxRichObject
    Left = 576
    Top = 136
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 384
    Top = 192
  end
  object frxGaugeObject1: TfrxGaugeObject
    Left = 480
    Top = 192
  end
  object frxReportTableObject1: TfrxReportTableObject
    Left = 576
    Top = 192
  end
  object frxMapObject1: TfrxMapObject
    Left = 384
    Top = 248
  end
  object frxReportCellularTextObject1: TfrxReportCellularTextObject
    Left = 480
    Top = 248
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 576
    Top = 248
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 384
    Top = 304
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 480
    Top = 304
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 576
    Top = 304
  end
  object frxChartObject1: TfrxChartObject
    Left = 664
    Top = 192
  end
  object frxPDFObject1: TfrxPDFObject
    Left = 664
    Top = 136
  end
  object frxIBXComponents1: TfrxIBXComponents
    DefaultDatabase = IBXIntegracao
    Left = 664
    Top = 80
  end
  object frxFDComponents1: TfrxFDComponents
    DefaultDatabase = DBIntegracao
    Left = 664
    Top = 24
  end
end
