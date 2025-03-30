object frmCarregando: TfrmCarregando
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmCarregando'
  ClientHeight = 271
  ClientWidth = 491
  Color = 2099712
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 88
    Width = 395
    Height = 25
    Caption = 'Carregando par'#226'metros do sistema, aguarde...'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbStatus: TLabel
    Left = 208
    Top = 167
    Width = 59
    Height = 13
    Caption = 'carregando'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 234
    Width = 475
    Height = 29
    Alignment = taCenter
    Caption = 
      'Gostou do nosso projeto? Contribua no GitHub ou nos apoie compra' +
      'ndo um caf'#233'! Sua ajuda '#233' fundamental para continuarmos melhorand' +
      'o. Visite nossa p'#225'gina para saber mais.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object ProgressBar1: TProgressBar
    Left = 48
    Top = 136
    Width = 395
    Height = 25
    TabOrder = 0
  end
  object Timer1: TTimer
    Left = 32
    Top = 24
  end
end
