object frmConsBloqDesbloqJudiciais: TfrmConsBloqDesbloqJudiciais
  Left = 178
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Movimento dos Bloqueios/Desbloqueios Judiciais'
  ClientHeight = 337
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDadosFiltro: TPanel
    Left = 617
    Top = 0
    Width = 296
    Height = 298
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 4
      Width = 143
      Height = 16
      Caption = 'Critérios de Filtragem:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 8
      Top = 37
      Width = 17
      Height = 16
      Hint = 'Marca/Desmarca o Critério desejado !'
      AutoSize = True
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076050000424D760500000000000036040000280000001100
        0000100000000100080000000000400100000000000000000000000100000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
        E00000400000004020000040400000406000004080000040A0000040C0000040
        E00000600000006020000060400000606000006080000060A0000060C0000060
        E00000800000008020000080400000806000008080000080A0000080C0000080
        E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
        E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
        E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
        E00040000000400020004000400040006000400080004000A0004000C0004000
        E00040200000402020004020400040206000402080004020A0004020C0004020
        E00040400000404020004040400040406000404080004040A0004040C0004040
        E00040600000406020004060400040606000406080004060A0004060C0004060
        E00040800000408020004080400040806000408080004080A0004080C0004080
        E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
        E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
        E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
        E00080000000800020008000400080006000800080008000A0008000C0008000
        E00080200000802020008020400080206000802080008020A0008020C0008020
        E00080400000804020008040400080406000804080008040A0008040C0008040
        E00080600000806020008060400080606000806080008060A0008060C0008060
        E00080800000808020008080400080806000808080008080A0008080C0008080
        E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
        E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
        E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
        E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
        E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
        E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
        E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
        E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
        E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
        E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
        A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF000303030303030003030303030303030303000000030303030300FB000303
        03030303030303000000030303030300FF000303030303030303030000000303
        03030300FB00000303030303030303000000030303030300FF00FF0000030303
        030303000000030303030300FB00FB00FB000303030303000000030303030000
        FF00FF00FF00030303030300000003030300FB00FBFFFBFFFB00030303030300
        000003030300FF00FFFBFFFBFF00030303030300000003030300FBFFFBFFFBFF
        FB0003030303030000000303030300FBFFFBFFFB000303030303030000000303
        0303000000000000000003030303030000000303030300FEFEFEFEFEFE000303
        0303030000000303030300000000000000000003030303000000030303030000
        0000000000FB0003030303000000030303030000000000000000000303030300
        0000}
      ShowHint = True
      Transparent = True
    end
    object pnlBanco: TPanel
      Left = 30
      Top = 177
      Width = 253
      Height = 49
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 4
        Width = 80
        Height = 13
        Caption = 'Banco/Conta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkpBancoFiltro: TDBLookupComboBox
        Left = 8
        Top = 20
        Width = 239
        Height = 21
        DropDownRows = 8
        KeyField = 'CODPORTADOR'
        ListField = 'DESCRICAO'
        ListSource = dsBancoFiltro
        TabOrder = 0
      end
    end
    object cb3: TCheckBox
      Left = 10
      Top = 194
      Width = 15
      Height = 17
      TabOrder = 1
      OnClick = cb3Click
    end
    object cb2: TCheckBox
      Left = 10
      Top = 140
      Width = 15
      Height = 17
      TabOrder = 2
      OnClick = cb2Click
    end
    object cb4: TCheckBox
      Left = 10
      Top = 250
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = cb4Click
    end
    object pnlDatas: TPanel
      Left = 30
      Top = 123
      Width = 253
      Height = 49
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 4
      object Label9: TLabel
        Left = 8
        Top = 3
        Width = 105
        Height = 13
        Caption = 'Data Lançamento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 123
        Top = 23
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbDtLancDe: TwwDBDateTimePicker
        Left = 8
        Top = 19
        Width = 110
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object dbDtLancAte: TwwDBDateTimePicker
        Left = 138
        Top = 19
        Width = 110
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
    end
    object pnlValor: TPanel
      Left = 30
      Top = 231
      Width = 253
      Height = 56
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 5
      object Label12: TLabel
        Left = 69
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Valor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rdbIgual: TRadioButton
        Left = 15
        Top = 3
        Width = 32
        Height = 17
        Caption = '='
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object rdbMenor: TRadioButton
        Left = 15
        Top = 20
        Width = 33
        Height = 17
        Caption = '<'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object rdbMaior: TRadioButton
        Left = 15
        Top = 37
        Width = 29
        Height = 15
        Caption = '>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edValorFiltro: TRealEdit
        Left = 68
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fFixed
        Signal = False
      end
    end
    object pnlBloqs: TPanel
      Left = 30
      Top = 30
      Width = 254
      Height = 88
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 6
      object RealEdit1: TRealEdit
        Left = 68
        Top = 21
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fFixed
        Signal = False
      end
      object rdgSitBloq: TRadioGroup
        Left = 12
        Top = 4
        Width = 213
        Height = 79
        Caption = 'Situação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Bloqueados'
          'Bloqueados/Desbloqueados'
          'Todos')
        ParentFont = False
        TabOrder = 1
      end
    end
    object cb1: TCheckBox
      Left = 10
      Top = 69
      Width = 17
      Height = 17
      TabOrder = 7
      OnClick = cb1Click
    end
  end
  object Dock971: TDock97
    Left = 0
    Top = 298
    Width = 913
    Height = 39
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BackgroundTransparent = True
    BoundLines = [blTop, blBottom]
    LimitToOneRow = True
    Position = dpBottom
    object btnImprimir: TSpeedButton
      Left = 628
      Top = 2
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Hint = 'Imprimir Movimento dos Bloqueios/Desbloqueios Judiciais'
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        B6030000424DB603000000000000360000002800000012000000100000000100
        1800000000008003000000000000000000000000000000000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3
        C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C60000C6C3C6C6C3C6C6C3C60000000000
        00000000000000000000000000000000000000000000000000000000C6C3C6C6
        C3C6C6C3C6C6C3C60000C6C3C6C6C3C600000084828484828484828484828484
        8284848284848284848284848284000000848284000000C6C3C6C6C3C6C6C3C6
        0000C6C3C6000000000000000000000000000000000000000000000000000000
        000000000000000000000000848284000000C6C3C6C6C3C60000C6C3C6000000
        8482848482848482848482848482848482848482848482848482848482848482
        84000000000000000000C6C3C6C6C3C60000C6C3C60000008482848482848482
        848482848482848482848482840000FF0000FF84828484828400000084828400
        0000C6C3C6C6C3C60000C6C3C600000000000000000000000000000000000000
        0000000000000000000000000000000000000000848284848284000000C6C3C6
        0000C6C3C6000000848284848284848284848284848284848284848284848284
        848284848284000000848284000000848284000000C6C3C60000C6C3C6C6C3C6
        0000000000000000000000000000000000000000000000000000000000008482
        84000000848284000000000000C6C3C60000C6C3C6C6C3C6C6C3C6000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000084828400000084
        8284000000C6C3C60000C6C3C6C6C3C6C6C3C6C6C3C6000000FFFFFF00000000
        0000000000000000000000FFFFFF000000000000000000000000C6C3C6C6C3C6
        0000C6C3C6C6C3C6C6C3C6C6C3C6000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000C6C3C6C6C3C6C6C3C6C6C3C60000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6000000FFFFFF000000000000000000000000000000FFFF
        FF000000C6C3C6C6C3C6C6C3C6C6C3C60000C6C3C6C6C3C6C6C3C6C6C3C6C6C3
        C6000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6
        C3C6C6C3C6C6C3C60000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C600000000
        0000000000000000000000000000000000000000000000C6C3C6C6C3C6C6C3C6
        0000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C60000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnImprimirClick
    end
    object tb97Fundo: TToolbar97
      Left = 788
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 788
      TabOrder = 1
      object bbtnSair: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnSairClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
          B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
          BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
          BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
          BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object TB97oKCancelar: TToolbar97
      Left = 412
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 412
      TabOrder = 0
      object bbtnFiltrar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Hint = 'Filtrar o Movimento antes da Impressão'
        Caption = '&Filtrar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnFiltrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 8
      end
      object bbtnDesfazer: TBitBtn
        Left = 81
        Top = 0
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Hint = 'Desfazer a Filtragem'
        Cancel = True
        Caption = 'Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnDesfazerClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object pnlBloqueio: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 298
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'pnlBloqueiosAbertos'
    TabOrder = 2
    object dbg: TwwDBGrid
      Left = 1
      Top = 1
      Width = 615
      Height = 296
      Selected.Strings = (
        'SITIMG'#9'2'#9'    '#9'F'
        'DATALANCTO'#9'12'#9'Dta.Lancto.'#9'F'
        'NOMEBANCO'#9'28'#9'Banco/Conta'#9'F'
        'VALORLANCTO'#9'14'#9'Valor'#9'F'
        'HISTORICO'#9'67'#9'Histórico'#9'F'
        'DATADISPONIB'#9'18'#9'Dt.Disponibilidade'#9'F'
        'IDMOVFINBLOQJUDICIAIS'#9'11'#9'Id. Bloqueio'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 8404992
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = 16634576
      DataSource = dsMovBloqJud
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnDrawDataCell = dbgDrawDataCell
      IndicatorColor = icBlack
      FooterColor = 8404992
      FooterHeight = 24
    end
    object stAviso: TStaticText
      Left = 61
      Top = 125
      Width = 488
      Height = 52
      Caption = 'Informe os Critérios >>'
      Color = 16634576
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object relMovBloqDesbloq: TppReport
    AutoStop = False
    DataPipeline = ppBDEMovBloqJud
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório do Movimento dos Bloqueios/Desbloqueios Judiciais'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BackgroundPrintSettings.Enabled = True
    DeviceType = 'Screen'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 331
    Top = 73
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEMovBloqJud'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório do Movimento dos Bloqueios/Desbloqueios Judiciais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5419
        mmLeft = 34396
        mmTop = 13229
        mmWidth = 136864
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppBDEEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEEmpresa'
        mmHeight = 16140
        mmLeft = 2117
        mmTop = 1852
        mmWidth = 16140
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMEEMPRESA'
        DataPipeline = ppBDEEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEEmpresa'
        mmHeight = 5821
        mmLeft = 25665
        mmTop = 1852
        mmWidth = 131234
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 168805
        mmTop = 24606
        mmWidth = 27517
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 153988
        mmTop = 24606
        mmWidth = 14023
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        mmHeight = 4498
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 794
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 180711
        mmTop = 794
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Banco/Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 24342
        mmTop = 794
        mmWidth = 17441
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Tp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 794
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 78581
        mmTop = 794
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATALANCTO'
        DataPipeline = ppBDEMovBloqJud
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEMovBloqJud'
        mmHeight = 2921
        mmLeft = 7673
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = ppBDEMovBloqJud
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovBloqJud'
        mmHeight = 2921
        mmLeft = 173832
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HISTORICO'
        DataPipeline = ppBDEMovBloqJud
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEMovBloqJud'
        mmHeight = 2921
        mmLeft = 78846
        mmTop = 529
        mmWidth = 92604
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText5'
        DataField = 'DSCSITBLOQDESBLOQ'
        DataPipeline = ppBDEMovBloqJud
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEMovBloqJud'
        mmHeight = 2921
        mmLeft = 529
        mmTop = 529
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        DataField = 'NOMEBANCO'
        DataPipeline = ppBDEMovBloqJud
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEMovBloqJud'
        mmHeight = 2921
        mmLeft = 24606
        mmTop = 529
        mmWidth = 51594
        BandType = 4
      end
      object sbrpRateios: TppSubReport
        UserName = 'ppBloqRateios'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = True
        DataPipelineName = 'ppBDERateios'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDERateios
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório do Movimento dos Bloqueios/Desbloqueios Judiciais'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 422
          Top = 168
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDERateios'
          object ppRateios: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText6: TppDBText
              UserName = 'DBText1'
              DataField = 'DSCPLANOPATRO'
              DataPipeline = ppBDERateios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsItalic]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDERateios'
              mmHeight = 2498
              mmLeft = 24606
              mmTop = 265
              mmWidth = 119856
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VLRRATEIO'
              DataPipeline = ppBDERateios
              DisplayFormat = '-###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsItalic]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDERateios'
              mmHeight = 2498
              mmLeft = 148961
              mmTop = 265
              mmWidth = 22754
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 
          'Relatório do Movimento dos Bloqueios/Desbloqueios Judiciais / CF' +
          'INAN'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 529
        mmTop = 1058
        mmWidth = 91144
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 181505
        mmTop = 1058
        mmWidth = 6085
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '/'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 188384
        mmTop = 1323
        mmWidth = 804
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 189971
        mmTop = 1058
        mmWidth = 6085
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDMOVFINBLOQJUDICIAISPAI'
      DataPipeline = ppBDEMovBloqJud
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEMovBloqJud'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape101'
          Brush.Color = clBtnFace
          ParentWidth = True
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 329
    Top = 13
  end
  object qryBancoFiltro: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT B.NUMBANCO, C.NOCONTACORR, C.DESCRICAO, C.CODPORTADOR'
      'FROM BANCO B, PORTADORCONTA C'
      'WHERE B.IDPESSOA = C.IDBANCO  AND'
      '     (C.FLGSTATUS = '#39'A'#39' OR C.FLGSTATUS is null)'
      'ORDER BY C.NOCONTACORR, C.CODPORTADOR, C.DESCRICAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 331
    Top = 130
    object StringField1: TStringField
      DisplayLabel = 'Nome do Banco/Conta Corrente'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORCONTA.DESCRICAO'
      Size = 50
    end
    object StringField2: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object StringField3: TStringField
      DisplayWidth = 15
      FieldName = 'NOCONTACORR'
      Origin = 'BASEDADOS.PORTADORCONTA.NOCONTACORR'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object FloatField1: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.PORTADORCONTA.CODPORTADOR'
      Visible = False
    end
  end
  object dsBancoFiltro: TwwDataSource
    DataSet = qryBancoFiltro
    Left = 329
    Top = 188
  end
  object qryAux1: TwwQuery
    ValidateWithMask = True
    Left = 466
    Top = 18
  end
  object qryMovBloqJud: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT M.*, DECODE(sitbloqdesbloq, 1, '#39'B'#39', '#39'D'#39') dscSitBloqDesbl' +
        'oq,'
      
        '        DECODE(M.TIPOLANCTO, '#39'E'#39', M.VALORLANCTO, '#39'S'#39', M.VALORLAN' +
        'CTO*-1) VALOR'
      '  FROM MOVFINBLOQJUDICIAIS M'
      
        'ORDER BY M.IDMOVFINBLOQJUDICIAISPAI, M.SITBLOQDESBLOQ DESC, M.DA' +
        'TALANCTO, M.CODPORTADOR'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 56
    object FloatField2: TFloatField
      FieldName = 'IDMOVFINBLOQJUDICIAIS'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.IDMOVFINBLOQJUDICIAIS'
    end
    object FloatField3: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.CODPORTADOR'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.DATALANCTO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATADISPONIB'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.DATADISPONIB'
    end
    object StringField4: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.NUMDOCUMENTO'
    end
    object StringField5: TStringField
      FieldName = 'TIPOLANCTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.TIPOLANCTO'
      FixedChar = True
      Size = 1
    end
    object FloatField4: TFloatField
      FieldName = 'VALORLANCTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.VALORLANCTO'
      DisplayFormat = '###,###,##0.00'
    end
    object StringField6: TStringField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.HISTORICO'
      Size = 80
    end
    object FloatField5: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.IDPLANPREVCTBPATR'
    end
    object StringField7: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object FloatField6: TFloatField
      FieldName = 'HISTPADFINAN'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.HISTPADFINAN'
    end
    object FloatField7: TFloatField
      FieldName = 'IDMOVFINBLOQJUDICIAISPAI'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.IDMOVFINBLOQJUDICIAISPAI'
    end
    object FloatField8: TFloatField
      FieldName = 'SITBLOQDESBLOQ'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.SITBLOQDESBLOQ'
    end
    object FloatField9: TFloatField
      FieldName = 'SITDESBLOQ'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.SITDESBLOQ'
    end
    object StringField9: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMEBANCO'
      LookupDataSet = qryLkpBanco
      LookupKeyFields = 'CODPORTADOR'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPORTADOR'
      Size = 50
      Lookup = True
    end
    object qryMovBloqJudSITIMG: TStringField
      FieldKind = fkCalculated
      FieldName = 'SITIMG'
      Size = 1
      Calculated = True
    end
    object qryMovBloqJudDSCSITBLOQDESBLOQ: TStringField
      FieldName = 'DSCSITBLOQDESBLOQ'
      Size = 1
    end
    object qryMovBloqJudVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsMovBloqJud: TDataSource
    DataSet = qryMovBloqJud
    Left = 52
    Top = 111
  end
  object qryLkpBanco: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT B.NUMBANCO, C.NOCONTACORR, C.DESCRICAO, C.CODPORTADOR'
      'FROM BANCO B, PORTADORCONTA C'
      'WHERE B.IDPESSOA = C.IDBANCO  AND'
      '     (C.FLGSTATUS = '#39'A'#39' OR C.FLGSTATUS is null)'
      'ORDER BY C.NOCONTACORR, C.CODPORTADOR, C.DESCRICAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 562
    Top = 134
    object qryLkpBancoDESCRICAO: TStringField
      DisplayLabel = 'Nome do Banco/Conta Corrente'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORCONTA.DESCRICAO'
      Size = 50
    end
    object qryLkpBancoNUMBANCO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryLkpBancoNOCONTACORR: TStringField
      DisplayWidth = 15
      FieldName = 'NOCONTACORR'
      Origin = 'BASEDADOS.PORTADORCONTA.NOCONTACORR'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryLkpBancoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.PORTADORCONTA.CODPORTADOR'
      Visible = False
    end
  end
  object dsLkpBanco: TwwDataSource
    DataSet = qryLkpBanco
    Left = 564
    Top = 196
  end
  object ImlPadrao: TImageList
    Left = 839
    Top = 65535
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFF83F00000000
      FFFFE00F00000000FFFFCC4700000000FFFF846300000000FFFFA07300000000
      E00731F900000000F00F38F900000000F81F3C7900000000FC3F3C3900000000
      FE7F3C1900000000FFFF9C0B00000000FFFF8C4300000000FFFFC46700000000
      FFFFE00F00000000FFFFF83F00000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP'
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 468
    Top = 77
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object dsEmpresa: TwwDataSource
    DataSet = qryEmpresa
    Left = 466
    Top = 135
  end
  object ppBDEEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'BDEEmpresa'
    Left = 468
    Top = 197
    object ppBDEEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEEmpresappField2: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDEEmpresappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBDEEmpresappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEEmpresappField5: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object ppBDEEmpresappField6: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object ppBDEMovBloqJud: TppBDEPipeline
    DataSource = dsMovBloqJud
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'BDEMovBloqJud'
    Left = 50
    Top = 173
    object ppBDEMovBloqJudppField1: TppField
      FieldAlias = 'IDMOVFINBLOQJUDICIAIS'
      FieldName = 'IDMOVFINBLOQJUDICIAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField2: TppField
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField3: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField4: TppField
      FieldAlias = 'DATADISPONIB'
      FieldName = 'DATADISPONIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField5: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField6: TppField
      FieldAlias = 'TIPOLANCTO'
      FieldName = 'TIPOLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField7: TppField
      FieldAlias = 'VALORLANCTO'
      FieldName = 'VALORLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField8: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField9: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField10: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField11: TppField
      FieldAlias = 'HISTPADFINAN'
      FieldName = 'HISTPADFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField12: TppField
      FieldAlias = 'IDMOVFINBLOQJUDICIAISPAI'
      FieldName = 'IDMOVFINBLOQJUDICIAISPAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField13: TppField
      FieldAlias = 'SITBLOQDESBLOQ'
      FieldName = 'SITBLOQDESBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField14: TppField
      FieldAlias = 'SITDESBLOQ'
      FieldName = 'SITDESBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField15: TppField
      FieldAlias = 'NOMEBANCO'
      FieldName = 'NOMEBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField16: TppField
      FieldAlias = 'SITIMG'
      FieldName = 'SITIMG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField17: TppField
      FieldAlias = 'DSCSITBLOQDESBLOQ'
      FieldName = 'DSCSITBLOQDESBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDEMovBloqJudppField18: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object qryRateios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM MOVBLOQJUDXPLANOPATRO M1'
      'ORDER BY M1.IDMOVFINBLOQJUDICIAIS,  M1.IDPLANPREVCTBPATR'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 146
    Top = 55
    object qryRateiosIDMOVFINBLOQJUDICIAIS: TFloatField
      FieldName = 'IDMOVFINBLOQJUDICIAIS'
      Origin = 'BASEDADOS.MOVBLOQJUDXPLANOPATRO.IDMOVFINBLOQJUDICIAIS'
    end
    object qryRateiosIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.MOVBLOQJUDXPLANOPATRO.IDPLANPREVCTBPATR'
    end
    object qryRateiosVLRRATEIO: TFloatField
      FieldName = 'VLRRATEIO'
      Origin = 'BASEDADOS.MOVBLOQJUDXPLANOPATRO.VLRRATEIO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryRateiosDSCPLANOPATRO: TStringField
      FieldKind = fkLookup
      FieldName = 'DSCPLANOPATRO'
      LookupDataSet = qryLkpPlanPrev
      LookupKeyFields = 'IDPLANPREVCTBPATR'
      LookupResultField = 'PLANPRVCONTABPATRO'
      KeyFields = 'IDPLANPREVCTBPATR'
      Size = 60
      Lookup = True
    end
  end
  object dsRateios: TDataSource
    DataSet = qryRateios
    Left = 147
    Top = 113
  end
  object ppBDERateios: TppBDEPipeline
    DataSource = dsRateios
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'BDERateios'
    Left = 147
    Top = 173
    MasterDataPipelineName = 'ppBDEMovBloqJud'
    object ppBDERateiosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOVFINBLOQJUDICIAIS'
      FieldName = 'IDMOVFINBLOQJUDICIAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDERateiosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDERateiosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRATEIO'
      FieldName = 'VLRRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDERateiosppField4: TppField
      FieldAlias = 'DSCPLANOPATRO'
      FieldName = 'DSCPLANOPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppBDERateiosppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'IDMOVFINBLOQJUDICIAIS'
      DetailFieldName = 'IDMOVFINBLOQJUDICIAIS'
      DetailSortOrder = soAscending
    end
  end
  object qryLkpPlanPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ' AND PL.ATIVO = '#39'S'#39
      'ORDER BY (PL.NOME ||'#39' - '#39'|| PE.NOME)')
    ValidateWithMask = True
    Left = 556
    Top = 19
    object qryLkpPlanPrevPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patro'
      DisplayWidth = 50
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryLkpPlanPrevIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryLkpPlanPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryLkpPlanPrevIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object dsLkpPlanPrev: TwwDataSource
    DataSet = qryLkpPlanPrev
    Left = 559
    Top = 78
  end
end
