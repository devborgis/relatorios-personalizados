object frmCadGroupReport: TfrmCadGroupReport
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o de grupos - CADASTRAR'
  ClientHeight = 156
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object edtIdGroup: TEdit
    Left = 8
    Top = 49
    Width = 89
    Height = 25
    ParentCustomHint = False
    Alignment = taCenter
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    Color = 16769505
    Ctl3D = True
    DoubleBuffered = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Text = 'NOVO'
    StyleElements = []
  end
  object edtNameGroup: TEdit
    Left = 103
    Top = 49
    Width = 338
    Height = 25
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 115
    Width = 454
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitLeft = 176
    ExplicitTop = 64
    ExplicitWidth = 185
    object btnSaveCad: TJvTransparentButton
      Left = 368
      Top = 0
      Width = 86
      Height = 41
      Cursor = crHandPoint
      ParentCustomHint = False
      StyleElements = []
      Align = alRight
      AutoGray = False
      Caption = 'SALVAR  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      HotTrack = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = 4227072
      HotTrackFont.Height = -12
      HotTrackFont.Name = 'Segoe UI'
      HotTrackFont.Style = [fsBold, fsUnderline]
      FrameStyle = fsNone
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TextAlign = ttaRight
      Transparent = False
      OnClick = btnSaveCadClick
      Glyph.Data = {
        42100000424D4210000000000000420000002800000020000000200000000100
        20000300000000100000130B0000130B000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000004C0000
        00BD000000F3000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000F3000000BD0000004B0000000000000000000000000000
        0000000000000000000000000000000000000000000000000085000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF0000008400000000000000000000
        0000000000000000000000000000000000000000004D000000FF000000F90000
        0071000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF00000071000000F9000000FF0000004B000000000000
        000000000000000000000000000000000000000000BE000000FF000000780000
        0000000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF0000000000000078000000FF000000BD000000000000
        000000000000000000000000000000000000000000F3000000FF000000190000
        0000000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF000000000000001B000000FF000000F1000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF0000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF0000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000FF000000FF0000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000F8000000FF0000000E000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000F000000FF000000F70000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000CF000000FF0000005A000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        005C000000FF000000CD0000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000069000000FF000000EE0000005B0000000E00000000000000000000
        000000000000000000000000000000000000000000000000000E0000005C0000
        00EF000000FF000000660000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000002000000A9000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000A8000000020000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000200000069000000D0000000F8000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000F8000000CF0000
        006800000002000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000000000003A000000CE000000FB0000
        00FF000000FF000000FF000000FF000000FB000000CD00000038000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000032000000FA000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FA000000300000
        000000000000000000000000000000000000000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000B6000000FF00000090000000080000
        00000000000000000000000000000000000900000091000000FF000000B90000
        00000000000000000000000000000000001F000000FF000000FF000000000000
        000000000000000000000000000000000000000000FF000000FF000000000000
        0000000000000000000000000000000000EC000000FF00000012000000000000
        00000000000000000000000000000000000000000012000000FF000000F40000
        0000000000000000000000000034000000E6000000FF000000C9000000000000
        000000000000000000000000000000000000000000F4000000FF000000180000
        0000000000000000000000000000000000FF000000FF00000000000000000000
        00000000000000000000000000000000000000000000000000FF000000FF0000
        00000000000000000047000000F2000000FF000000BD00000010000000000000
        000000000000000000000000000000000000000000BE000000FF000000770000
        0000000000000000000000000000000000FF000000FF00000000000000000000
        00000000000000000000000000000000000000000000000000FF000000FF0000
        00000000006E000000FC000000FF0000009E0000000500000000000000000000
        0000000000000000000000000000000000000000004E000000FF000000F90000
        0077000000190000000000000000000000FF000000FF00000000000000000000
        00000000000000000000000000000000000000000000000000FF000000FF0000
        0090000000FF000000FE0000007C000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000086000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000F80000005B00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000004D0000
        00BE000000F4000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00E20000003E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
    end
  end
end
