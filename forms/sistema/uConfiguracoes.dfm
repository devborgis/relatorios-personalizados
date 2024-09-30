object frmConfiguracoes: TfrmConfiguracoes
  Left = 0
  Top = 0
  VertScrollBar.Color = clTeal
  VertScrollBar.ParentColor = False
  VertScrollBar.Smooth = True
  VertScrollBar.Size = 5
  VertScrollBar.Style = ssFlat
  VertScrollBar.Tracking = True
  Anchors = [akLeft, akTop, akBottom]
  BorderStyle = bsNone
  Caption = 'frmConfiguracoes'
  ClientHeight = 1065
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  StyleElements = []
  OnShow = FormShow
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 1065
    Align = alClient
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    StyleElements = []
    ExplicitWidth = 1381
    ExplicitHeight = 1221
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 1030
      Height = 1065
      HorzScrollBar.ParentColor = False
      HorzScrollBar.Style = ssFlat
      HorzScrollBar.Visible = False
      VertScrollBar.ButtonSize = 25
      VertScrollBar.Increment = 95
      VertScrollBar.ParentColor = False
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clSilver
      ParentColor = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 1381
      ExplicitHeight = 1221
      object Label1: TLabel
        Left = 336
        Top = 33
        Width = 123
        Height = 17
        Caption = 'Grupos de Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 336
        Top = 319
        Width = 146
        Height = 17
        Caption = 'SubGrupos de Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object Label3: TLabel
        Left = 336
        Top = 607
        Width = 171
        Height = 17
        Caption = 'Ultima Release da aplica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object memoReleaseApp: TMemo
        Left = 335
        Top = 630
        Width = 616
        Height = 339
        Color = 15461355
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Lines.Strings = (
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        StyleElements = []
      end
      object dbgGrupoRelatorio: TDBGrid
        Left = 335
        Top = 56
        Width = 616
        Height = 257
        Color = 15461355
        DataSource = mSystem.dsGruRelLista
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        StyleElements = []
        OnKeyDown = dbgGrupoRelatorioKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end>
      end
      object dbgSubGrupoRelatorio: TDBGrid
        Left = 336
        Top = 342
        Width = 615
        Height = 259
        Color = 15461355
        DataSource = mSystem.dsSubGrupRel
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        StyleElements = []
        OnKeyDown = dbgSubGrupoRelatorioKeyDown
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 25
    Top = 17
    Width = 232
    Height = 456
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    object btnNossoGitHub: TSpeedButton
      Left = 15
      Top = 23
      Width = 194
      Height = 51
      Caption = 'Acompanhe o Github'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        001800000082000000E900000068000000000000000000000000000000000000
        0000000000000000006B000000E9000000810000001700000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000001000000660000
        00F1000000FF000000FF00000085000000000000000000000000000000000000
        00000000000000000089000000FF000000FF000000F400000077000000030000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000C000000B7000000FF0000
        00FF000000FF000000FF00000084000000000000000000000000000000000000
        00000000000000000087000000FF000000FF000000FF000000FF000000B50000
        000C000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000010000000CD000000FF000000E70000
        00560000000D0000000900000011000000000000000000000000000000000000
        00000000000000000086000000FF000000FF000000FF000000FF000000FF0000
        00CB0000000F0000000000000000000000000000000000000000000000000000
        0000000000000000000000000004000000B9000000FF000000F6000000260000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000086000000FF000000FF000000FF000000FF000000FF0000
        00FF000000B70000000300000000000000000000000000000000000000000000
        000000000000000000000000007F000000FF000000FF00000095000000020000
        0084000000ED000000EA00000072000000000000000000000000000000000000
        0000000000000000009C000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF0000007D00000000000000000000000000000000000000000000
        00000000000000000024000000F7000000FF000000DF00000015000000790000
        00FF000000FF000000FF000000E2000000080000000000000000000000000000
        00000000000D000000E5000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000F600000021000000000000000000000000000000000000
        000000000000000000A0000000FF000000E30000001F0000006B000000FC0000
        00FF000000F8000000B6000000800000001F0000000000000000000000000000
        00000000002300000084000000BB000000FA000000FF000000FF000000FF0000
        00FF000000FF000000FF0000009C000000000000000000000000000000000000
        000000000013000000F6000000FF000000FF000000FB000000FF000000FF0000
        00A3000000170000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000001B000000A9000000FF000000FF0000
        00FF000000FF000000FF000000F5000000110000000000000000000000000000
        000000000061000000FF000000FF000000FF000000FF000000FF000000900000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000096000000FF0000
        00FF000000FF000000FF000000FF0000005F0000000000000000000000000000
        00000000009F000000FF000000FF000000FF000000FF000000DF000000070000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000008000000E10000
        00FF000000FF000000FF000000FF0000009C0000000000000000000000000000
        0000000000D3000000FF000000FF000000FF000000FF0000007C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000810000
        00FF000000FF000000FF000000FF000000D10000000000000000000000000000
        0000000000E8000000FF000000FF000000FF000000FF0000003C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000410000
        00FF000000FF000000FF000000FF000000E70000000000000000000000000000
        0000000000F9000000FF000000FF000000FF000000FF00000022000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000260000
        00FF000000FF000000FF000000FF000000F90000000000000000000000000000
        0000000000EA000000FF000000FF000000FF000000FF00000015000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000190000
        00FF000000FF000000FF000000FF000000E90000000000000000000000000000
        0000000000D1000000FF000000FF000000FF000000FF0000002D000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000320000
        00FF000000FF000000FF000000FF000000D00000000000000000000000000000
        0000000000B3000000FF000000FF000000FF000000FF00000074000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000790000
        00FF000000FF000000FF000000FF000000B10000000000000000000000000000
        00000000006D000000FF000000FF000000FF000000FF000000E5000000110000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000013000000E80000
        00FF000000FF000000FF000000FF0000006B0000000000000000000000000000
        000000000020000000FF000000FF000000FF000000FF000000FF0000006B0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000006E000000FF0000
        00FF000000FF000000FF000000FF0000001F0000000000000000000000000000
        000000000000000000C1000000FF000000FF000000FF000000FF000000430000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000047000000FF0000
        00FF000000FF000000FF000000BF000000000000000000000000000000000000
        0000000000000000003C000000FF000000FF000000FF000000FF000000460000
        0000000000000000000300000053000000380000000D00000000000000000000
        000E00000039000000520000000300000000000000000000004B000000FF0000
        00FF000000FF000000FF0000003A000000000000000000000000000000000000
        00000000000000000000000000B0000000FF000000FF000000FF0000007D0000
        000D00000053000000CE000000FF000000FF000000FF000000FA000000FB0000
        00FF000000FF000000FF000000CC000000510000000C00000081000000FF0000
        00FF000000FF000000AE00000000000000000000000000000000000000000000
        0000000000000000000000000013000000DE000000FF000000FF000000F90000
        00FC000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FC000000F9000000FF0000
        00FF000000DD0000001200000000000000000000000000000000000000000000
        00000000000000000000000000000000002F000000F2000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00F20000002D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000002D000000E1000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000E40000
        0032000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000001A000000BC0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000BA000000180000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        004B000000D2000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000D20000004900000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000002E0000007F000000BD000000D7000000F3000000F30000
        00D7000000BD0000007E0000002D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Margin = 10
      ParentFont = False
      StyleElements = [seBorder]
      OnClick = btnNossoGitHubClick
    end
    object btnNossoSite: TSpeedButton
      Left = 15
      Top = 72
      Width = 194
      Height = 51
      Caption = 'Visite nosso site'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000010000003A00000086000000190000004A000000F9000000F90000
        00E4000000BD0000008500000033000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000020000
        005F000000D4000000FF000000FF000000A000000000000000C0000000FF0000
        00FF000000FF000000FF000000FF000000D50000005500000001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000024000000C80000
        00FF000000FF000000FF000000FF000000FD0000003600000030000000FC0000
        00FF000000FF000000FF000000FF000000FF000000FF000000C50000001E0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000046000000F0000000FF0000
        00FF000000FF000000FF000000FF000000FF000000C6000000010000009A0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000ED0000
        0042000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000047000000F8000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF0000005C000000160000
        00F0000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00F6000000400000000000000000000000000000000000000000000000000000
        0000000000000000000000000025000000EF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000E40000000B0000
        0073000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000F10000002100000000000000000000000000000000000000000000
        00000000000000000002000000C6000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000820000
        0006000000D9000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000C400000002000000000000000000000000000000000000
        00000000000000000060000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000F60000
        00200000004D000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF0000005B000000000000000000000000000000000000
        000000000001000000D5000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000F5000000A400000079000000740000
        005B00000000000000B8000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000D1000000010000000000000000000000000000
        00000000003B000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000B1000000130000000100000024000000240000
        0001000000000000002A000000FB000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF0000003A0000000000000000000000000000
        000000000089000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000B30000000100000055000000E1000000FF000000FF0000
        00E1000000540000000000000093000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF0000007F0000000000000000000000000000
        0000000000BF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000EC0000001300000056000000FE000000FF000000FF000000FF0000
        00FF000000FE0000005400000014000000F6000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000BF0000000000000000000000000000
        0000000000E7000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF0000006B00000002000000E2000000FF000000FF000000FF000000FF0000
        00FF000000FF000000E100000001000000A5000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000DD0000000000000000000000000000
        0000000000F8000000FF000000FF000000FF000000FF000000FF000000FF0000
        00D50000000500000026000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF0000002400000078000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000F30000000000000000000000000000
        0000000000FA000000FF000000FF000000FF000000FF000000FF000000FF0000
        00430000000000000026000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF0000002500000076000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000F50000000000000000000000000000
        0000000000E6000000FF000000FF000000FF000000FF000000FF000000AF0000
        00000000005200000002000000E4000000FF000000FF000000FF000000FF0000
        00FF000000FF000000E200000002000000A6000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000DF0000000000000000000000000000
        0000000000C2000000FF000000FF000000FF000000FF000000F9000000250000
        0041000000F10000001200000059000000FF000000FF000000FF000000FF0000
        00FF000000FF000000570000001A000000F4000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000C10000000000000000000000000000
        00000000008C000000FF000000FF000000FF000000FF00000087000000030000
        00D1000000FF000000A50000000100000059000000E4000000FF000000FF0000
        00E30000005800000005000000B7000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000860000000000000000000000000000
        00000000003E000000FF000000FF000000FF000000E80000000E000000690000
        00FF000000FF000000FF000000A30000000E0000000200000027000000270000
        0002000000000000000E00000033000000330000003300000033000000330000
        0033000000330000003300000033000000130000000000000000000000000000
        000000000002000000DB000000FF000000FF0000005F00000012000000EC0000
        00FF000000FF000000FF000000FF000000EE000000980000006B000000660000
        0066000000660000006600000066000000660000006600000066000000660000
        006600000066000000660000004C000000000000000000000000000000000000
        00000000000000000063000000FF000000C90000000200000092000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF00000060000000000000000000000000000000000000
        00000000000000000002000000C40000003C0000002B000000FB000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000C800000003000000000000000000000000000000000000
        000000000000000000000000001000000000000000BB000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000F10000002900000000000000000000000000000000000000000000
        000000000000000000000000000000000020000000F9000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00F9000000490000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000004A000000F2000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000F20000
        0049000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000028000000CB0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000CB000000270000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000030000
        0064000000DB000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000DB0000006300000002000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000003E0000008C000000C4000000E6000000FE000000FD0000
        00E6000000C30000008B0000003E000000020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Margin = 10
      ParentFont = False
      StyleElements = [seBorder]
      OnClick = btnNossoSiteClick
    end
  end
end
