object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es do arquivo INI'
  ClientHeight = 278
  ClientWidth = 393
  Color = clInactiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  StyleElements = []
  OnShow = FormShow
  TextHeight = 13
  object Label3: TLabel
    Left = 31
    Top = 100
    Width = 18
    Height = 17
    Caption = 'Dll:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 31
    Top = 60
    Width = 98
    Height = 17
    Caption = 'Banco de dados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object Label1: TLabel
    Left = 31
    Top = 40
    Width = 236
    Height = 17
    Caption = 'Configurar banco de dados integra'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Label4: TLabel
    Left = 31
    Top = 140
    Width = 30
    Height = 17
    Caption = 'Host:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object Label5: TLabel
    Left = 192
    Top = 140
    Width = 34
    Height = 17
    Caption = 'Porta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object Label6: TLabel
    Left = 192
    Top = 180
    Width = 38
    Height = 17
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object btnTestaIntegracao: TJvTransparentButton
    Left = 31
    Top = 232
    Width = 144
    Height = 22
    Cursor = crHandPoint
    ParentCustomHint = False
    StyleElements = []
    AutoGray = False
    Caption = 'TESTAR'
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = 51914
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Segoe UI'
    HotTrackFont.Style = [fsBold, fsUnderline]
    FrameStyle = fsNone
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = btnTestaIntegracaoClick
    KeepMouseLeavePressed = True
  end
  object btnSaveConf: TJvTransparentButton
    Left = 192
    Top = 232
    Width = 144
    Height = 22
    Cursor = crHandPoint
    ParentCustomHint = False
    StyleElements = []
    AutoGray = False
    Caption = 'SALVAR'
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = 1031936
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Segoe UI'
    HotTrackFont.Style = [fsBold, fsUnderline]
    FrameStyle = fsNone
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = btnSaveConfClick
    KeepMouseLeavePressed = True
  end
  object btnExitConf: TJvTransparentButton
    Left = 337
    Top = 8
    Width = 48
    Height = 22
    Cursor = crHandPoint
    ParentCustomHint = False
    StyleElements = []
    AutoGray = False
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = 82648
    HotTrackFont.Height = -13
    HotTrackFont.Name = 'Segoe UI'
    HotTrackFont.Style = [fsBold, fsUnderline]
    FrameStyle = fsNone
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = btnExitConfClick
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000130B0000130B000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF690000FF160000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF160000FF6900000000000000000000
      0000000000000000000000000000000000000000FF6A0000FFFF0000FFD30000
      FF16000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF160000FFD30000FFFF0000FF6A000000000000
      0000000000000000000000000000000000000000FF150000FFD20000FFFF0000
      FFD70000FF180000000000000000000000000000000000000000000000000000
      0000000000000000FF150000FFD20000FFFF0000FFD70000FF19000000000000
      000000000000000000000000000000000000000000000000FF150000FFD20000
      FFFF0000FFD70000FF1800000000000000000000000000000000000000000000
      00000000FF150000FFD20000FFFF0000FFD70000FF1900000000000000000000
      00000000000000000000000000000000000000000000000000000000FF150000
      FFD20000FFFF0000FFD70000FF18000000000000000000000000000000000000
      FF150000FFD20000FFFF0000FFD70000FF190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF150000FFD20000FFFF0000FFD70000FF1800000000000000000000FF150000
      FFD20000FFFF0000FFD70000FF19000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF150000FFD20000FFFF0000FFD70000FF180000FF150000FFD20000
      FFFF0000FFD70000FF1900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF160000FFD30000FFFF0000FFD30000FFD30000FFFF0000
      FFD30000FF160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF150000FFD20000FFFF0000FFFF0000FFD70000
      FF19000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF150000FFD20000FFFF0000FFFF0000FFD70000
      FF18000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF160000FFD30000FFFF0000FFD30000FFD30000FFFF0000
      FFD30000FF160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF150000FFD20000FFFF0000FFD70000FF190000FF150000FFD20000
      FFFF0000FFD70000FF1800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF150000FFD20000FFFF0000FFD70000FF1900000000000000000000FF150000
      FFD20000FFFF0000FFD70000FF18000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF150000
      FFD20000FFFF0000FFD70000FF19000000000000000000000000000000000000
      FF150000FFD20000FFFF0000FFD70000FF180000000000000000000000000000
      000000000000000000000000000000000000000000000000FF150000FFD20000
      FFFF0000FFD70000FF1900000000000000000000000000000000000000000000
      00000000FF150000FFD20000FFFF0000FFD70000FF1800000000000000000000
      0000000000000000000000000000000000000000FF150000FFD20000FFFF0000
      FFD70000FF190000000000000000000000000000000000000000000000000000
      0000000000000000FF150000FFD20000FFFF0000FFD70000FF18000000000000
      0000000000000000000000000000000000000000FF6A0000FFFF0000FFD30000
      FF16000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF160000FFD30000FFFF0000FF6A000000000000
      000000000000000000000000000000000000000000000000FF690000FF160000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF160000FF6900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    KeepMouseLeavePressed = True
  end
  object dlgDatabase: TJvTransparentButton
    Left = 342
    Top = 78
    Width = 27
    Height = 22
    Cursor = crHandPoint
    ParentCustomHint = False
    StyleElements = []
    AutoGray = False
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = 82648
    HotTrackFont.Height = -13
    HotTrackFont.Name = 'Segoe UI'
    HotTrackFont.Style = [fsBold, fsUnderline]
    FrameStyle = fsNone
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = dlgDatabaseClick
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000B7110000B711000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040BFFF043CB7F4783CB7F5C33CB7F5CC3CB7F5CC3CB7
      F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7
      F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5C33CB7F47840BF
      FF0400000000000000003BB1F4793AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0
      F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0
      F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF39B0
      F478000000000000000038AAF5C338AAF5FF38AAF5D639AAF59939AAF59939AA
      F59939AAF59939AAF59939AAF59939AAF59939AAF59939AAF59939AAF59939AA
      F59939AAF59939AAF59939AAF59939AAF59939AAF59938AAF5D638AAF5FF38AA
      F5C3000000000000000036A3F4CC36A3F4FF35A3F39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000035A3F39936A3F4FF36A3
      F4CC0000000000000000359CF4CC349CF4FF349DF39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000349DF399349CF4FF359C
      F4CC00000000000000003295F4CC3295F4FF3294F39900000000000000000000
      00000000000000000000000000000000000000000000000000003295F57B3295
      F4F13394F564000000000000000000000000000000003294F3993295F4FF3295
      F4CC0000000000000000308FF4CC308FF4FF308FF39900000000000000000000
      0000000000000000000000000000000000000000000000000000308FF4B4308F
      F4FF308FF4FE2F90F567000000000000000000000000308FF399308FF4FF308F
      F4CC00000000000000002E88F4CC2E88F4FF2F89F3990000000000FFFF012E87
      F4752F89F3992F89F3992F89F3992F89F3992F89F3992F89F3992E89F4B72E88
      F4FF2E88F4FF2E88F4FE2E87F56400000000000000002F89F3992E88F4FF2E88
      F4CC00000000000000002C81F3CC2C81F3FF2B80F399000000002B82F5352C81
      F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81
      F3FF2C81F3FF2C81F3FF2C81F3F000000000000000002B80F3992C81F3FF2C81
      F3CC00000000000000002B7BF3CC2A7BF3FF2A7BF399000000001C71FF092A7C
      F3A92B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2A7BF3D62A7B
      F3FF2A7BF3FF2A7BF3FF2B7AF39000000000000000002A7BF3992A7BF3FF2B7B
      F3CC00000000000000002874F3CC2874F3FF2875F39900000000000000000000
      00000000000000000000000000000000000000000000000000002874F2A02874
      F3FF2874F3FF2975F3970000FF0100000000000000002875F3992874F3FF2874
      F3CC0000000000000000266DF3CC266DF3FF266CF39900000000000000000000
      0000000000000000000000000000000000000000000000000000266DF49F266D
      F3FF256DF3960000FF01000000000000000000000000266CF399266DF3FF266D
      F3CC00000000000000002467F3CC2466F3FF2566F39900000000000000000000
      00000000000000000000000000000000000000000000000000004080FF042267
      F12500000000000000000000000000000000000000002566F3992466F3FF2467
      F3CC00000000000000002260F3CC2260F3FF2161F39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002161F3992260F3FF2260
      F3CC00000000000000002159F3CC2059F2FF2059F2C2215AF366215AF366215A
      F366215AF366215AF366215AF366215AF366215AF366215AF366215AF366215A
      F366215AF366215AF366215AF366215AF366215AF3662059F2C22059F2FF2059
      F2C800000000000000001E53F3CC1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52
      F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52
      F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E51
      F39000000000000000001C4CF3CC1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4C
      F2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4C
      F2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2F61C4CF2AC2050
      EF1000000000000000001A45F3CC1A45F2FF1B44F29900000000000000000000
      0000000000000000000000000000000000001B45F2721A45F2FF1A45F2FF1945
      F28D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000183FF3CC183EF2FF173EF29900000000000000000000
      0000000000000000000000000000183FF135183EF2F9183EF2FF183EF2CA2B2B
      FF06000000000000000000000000000000000000000000000000000000000000
      000000000000000000001637F1C31637F1FF1537F1D61637F2991637F2991637
      F2991637F2991637F2991637F2991537F1E21637F1FF1737F1EE193AEF1F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001330F0791431F1FF1431F1FF1431F1FF1431F1FF1431
      F1FF1431F1FF1431F1FF1431F1FF1431F1FF1431F1FD1330F24F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000040FF04132AF079122AF1C3122BF1CC122BF1CC122B
      F1CC122BF1CC122BF1CC122BF1CC122AF1B51129F14B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    KeepMouseLeavePressed = True
  end
  object dlgDll: TJvTransparentButton
    Left = 342
    Top = 116
    Width = 27
    Height = 22
    Cursor = crHandPoint
    ParentCustomHint = False
    StyleElements = []
    AutoGray = False
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = 82648
    HotTrackFont.Height = -13
    HotTrackFont.Name = 'Segoe UI'
    HotTrackFont.Style = [fsBold, fsUnderline]
    FrameStyle = fsNone
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = dlgDllClick
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000B7110000B711000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040BFFF043CB7F4783CB7F5C33CB7F5CC3CB7F5CC3CB7
      F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7
      F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5CC3CB7F5C33CB7F47840BF
      FF0400000000000000003BB1F4793AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0
      F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0
      F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF3AB0F5FF39B0
      F478000000000000000038AAF5C338AAF5FF38AAF5D639AAF59939AAF59939AA
      F59939AAF59939AAF59939AAF59939AAF59939AAF59939AAF59939AAF59939AA
      F59939AAF59939AAF59939AAF59939AAF59939AAF59938AAF5D638AAF5FF38AA
      F5C3000000000000000036A3F4CC36A3F4FF35A3F39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000035A3F39936A3F4FF36A3
      F4CC0000000000000000359CF4CC349CF4FF349DF39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000349DF399349CF4FF359C
      F4CC00000000000000003295F4CC3295F4FF3294F39900000000000000000000
      00000000000000000000000000000000000000000000000000003295F57B3295
      F4F13394F564000000000000000000000000000000003294F3993295F4FF3295
      F4CC0000000000000000308FF4CC308FF4FF308FF39900000000000000000000
      0000000000000000000000000000000000000000000000000000308FF4B4308F
      F4FF308FF4FE2F90F567000000000000000000000000308FF399308FF4FF308F
      F4CC00000000000000002E88F4CC2E88F4FF2F89F3990000000000FFFF012E87
      F4752F89F3992F89F3992F89F3992F89F3992F89F3992F89F3992E89F4B72E88
      F4FF2E88F4FF2E88F4FE2E87F56400000000000000002F89F3992E88F4FF2E88
      F4CC00000000000000002C81F3CC2C81F3FF2B80F399000000002B82F5352C81
      F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81F3FF2C81
      F3FF2C81F3FF2C81F3FF2C81F3F000000000000000002B80F3992C81F3FF2C81
      F3CC00000000000000002B7BF3CC2A7BF3FF2A7BF399000000001C71FF092A7C
      F3A92B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2B7BF3CC2A7BF3D62A7B
      F3FF2A7BF3FF2A7BF3FF2B7AF39000000000000000002A7BF3992A7BF3FF2B7B
      F3CC00000000000000002874F3CC2874F3FF2875F39900000000000000000000
      00000000000000000000000000000000000000000000000000002874F2A02874
      F3FF2874F3FF2975F3970000FF0100000000000000002875F3992874F3FF2874
      F3CC0000000000000000266DF3CC266DF3FF266CF39900000000000000000000
      0000000000000000000000000000000000000000000000000000266DF49F266D
      F3FF256DF3960000FF01000000000000000000000000266CF399266DF3FF266D
      F3CC00000000000000002467F3CC2466F3FF2566F39900000000000000000000
      00000000000000000000000000000000000000000000000000004080FF042267
      F12500000000000000000000000000000000000000002566F3992466F3FF2467
      F3CC00000000000000002260F3CC2260F3FF2161F39900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002161F3992260F3FF2260
      F3CC00000000000000002159F3CC2059F2FF2059F2C2215AF366215AF366215A
      F366215AF366215AF366215AF366215AF366215AF366215AF366215AF366215A
      F366215AF366215AF366215AF366215AF366215AF3662059F2C22059F2FF2059
      F2C800000000000000001E53F3CC1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52
      F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52
      F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E52F2FF1E51
      F39000000000000000001C4CF3CC1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4C
      F2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4C
      F2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2FF1C4CF2F61C4CF2AC2050
      EF1000000000000000001A45F3CC1A45F2FF1B44F29900000000000000000000
      0000000000000000000000000000000000001B45F2721A45F2FF1A45F2FF1945
      F28D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000183FF3CC183EF2FF173EF29900000000000000000000
      0000000000000000000000000000183FF135183EF2F9183EF2FF183EF2CA2B2B
      FF06000000000000000000000000000000000000000000000000000000000000
      000000000000000000001637F1C31637F1FF1537F1D61637F2991637F2991637
      F2991637F2991637F2991637F2991537F1E21637F1FF1737F1EE193AEF1F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001330F0791431F1FF1431F1FF1431F1FF1431F1FF1431
      F1FF1431F1FF1431F1FF1431F1FF1431F1FF1431F1FD1330F24F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000040FF04132AF079122AF1C3122BF1CC122BF1CC122B
      F1CC122BF1CC122BF1CC122BF1CC122AF1B51129F14B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    KeepMouseLeavePressed = True
  end
  object Label7: TLabel
    Left = 31
    Top = 180
    Width = 45
    Height = 17
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object edtDll: TEdit
    Left = 31
    Top = 116
    Width = 305
    Height = 21
    TabOrder = 0
    StyleElements = []
    OnKeyPress = edtDllKeyPress
  end
  object edtBancoDeDados: TEdit
    Left = 31
    Top = 79
    Width = 305
    Height = 21
    TabOrder = 1
    StyleElements = []
    OnKeyPress = edtBancoDeDadosKeyPress
  end
  object edtHost: TEdit
    Left = 31
    Top = 156
    Width = 144
    Height = 21
    TabOrder = 2
    StyleElements = []
    OnKeyPress = edtHostKeyPress
  end
  object edtPort: TEdit
    Left = 192
    Top = 156
    Width = 144
    Height = 21
    TabOrder = 3
    StyleElements = []
    OnKeyPress = edtPortKeyPress
  end
  object edtPassword: TEdit
    Left = 192
    Top = 196
    Width = 144
    Height = 21
    TabOrder = 4
    StyleElements = []
  end
  object edtUser: TEdit
    Left = 31
    Top = 196
    Width = 144
    Height = 21
    TabOrder = 5
    StyleElements = []
    OnKeyPress = edtUserKeyPress
  end
  object odlgDatabase: TOpenDialog
    Left = 288
    Top = 8
  end
  object odlgDll: TOpenDialog
    Left = 224
    Top = 8
  end
end