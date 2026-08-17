inherited FrmMTAtendPrePronta: TFrmMTAtendPrePronta
  Left = -1
  Top = 80
  Caption = 'Solicitação Pré-Pronta'
  ClientHeight = 411
  ClientWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 150
    Top = 321
    Width = 84
    Height = 13
    Caption = 'Nº de Pessoas'
  end
  object Label6: TLabel [1]
    Left = 318
    Top = 321
    Width = 84
    Height = 13
    Caption = 'Nº de Pessoas'
  end
  inherited pnlFundo: TPanel
    Width = 783
    Height = 371
    object Label3: TLabel
      Left = 240
      Top = 321
      Width = 84
      Height = 13
      Caption = 'Nº de Pessoas'
    end
    object Label5: TLabel
      Left = 386
      Top = 321
      Width = 86
      Height = 13
      Caption = 'Qtde. Sugerida'
    end
    object Label7: TLabel
      Left = 531
      Top = 321
      Width = 92
      Height = 13
      Caption = 'Qtde. Solicitada'
    end
    object Label8: TLabel
      Left = 678
      Top = 321
      Width = 31
      Height = 13
      Caption = 'Unid.'
    end
    object Label9: TLabel
      Left = 24
      Top = 321
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object grpArtigo: TGroupBox
      Left = 1
      Top = 1
      Width = 781
      Height = 112
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Requisição'
      end
      object lblCResp: TLabel
        Left = 392
        Top = 8
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lblAtiv: TLabel
        Left = 392
        Top = 48
        Width = 100
        Height = 13
        Caption = 'Atividade/Projeto'
      end
      object Label1: TLabel
        Left = 152
        Top = 56
        Width = 105
        Height = 13
        Caption = 'Data Necessidade'
      end
      object Label10: TLabel
        Left = 16
        Top = 56
        Width = 78
        Height = 13
        Caption = 'Data Emissão'
      end
      object pnlUm: TPanel
        Left = 664
        Top = 16
        Width = 96
        Height = 78
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 8
        Visible = False
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 96
          Height = 78
          Caption = 'Destino'
          TabOrder = 0
          object lblDestino: TLabel
            Left = 7
            Top = 35
            Width = 81
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object pnlAmbos: TPanel
        Left = 664
        Top = 16
        Width = 96
        Height = 78
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 7
        Visible = False
        object RgDestino: TRadioGroup
          Left = 0
          Top = 0
          Width = 96
          Height = 78
          Caption = 'Destino '
          ItemIndex = 0
          Items.Strings = (
            'Estoque'
            'Custo')
          TabOrder = 0
          OnClick = RgDestinoClick
        end
      end
      object edReq: TEdit
        Left = 16
        Top = 24
        Width = 329
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object btnProcurar: TBitBtn
        Left = 345
        Top = 23
        Width = 24
        Height = 22
        TabOrder = 1
        OnClick = btnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object dblcCentRespon: TwwDBLookupCombo
        Left = 392
        Top = 24
        Width = 260
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'CODCENTRORESPON'
        LookupTable = CdsCentRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAtividade: TwwDBLookupCombo
        Left = 392
        Top = 64
        Width = 260
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Nome')
        DataField = 'UNIDNEGOC'
        LookupTable = CdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loColLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object chkRepete: TCheckBox
        Left = 392
        Top = 88
        Width = 149
        Height = 17
        Caption = 'Repete Nº de Pessoas'
        TabOrder = 4
      end
      object edDataEmis: TCMDateTimePicker
        Left = 16
        Top = 72
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 5
      end
      object edDataNec: TCMDateTimePicker
        Left = 152
        Top = 72
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 6
      end
    end
    object edUnid: TDBEdit
      Left = 677
      Top = 336
      Width = 70
      Height = 21
      Color = clGray
      DataField = 'CODMEDIDA'
      DataSource = dsGrid
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edCodArt: TDBEdit
      Left = 23
      Top = 336
      Width = 173
      Height = 21
      Color = clGray
      DataField = 'CODARTIGO'
      DataSource = dsGrid
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edNPessoa: TDBRealEdit
      Left = 239
      Top = 336
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      OnEnter = edNPessoaEnter
      OnExit = edNPessoaExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'NPESSOAS'
      DataSource = dsGrid
    end
    object edQtdeSug: TDBRealEdit
      Left = 387
      Top = 336
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDESUG'
      DataSource = dsGrid
    end
    object edQtdeSoli: TDBRealEdit
      Left = 531
      Top = 336
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      OnExit = edQtdeSoliExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDESOLI'
      DataSource = dsGrid
    end
    object pgc: TPageControl
      Left = 1
      Top = 113
      Width = 781
      Height = 196
      ActivePage = tabDados
      Align = alTop
      TabOrder = 6
      object tabDados: TTabSheet
        Caption = 'Dados'
        object dbgrd: TwwDBGrid
          Left = 0
          Top = 0
          Width = 773
          Height = 168
          TabStop = False
          Selected.Strings = (
            'CODARTIGO'#9'14'#9'Código'
            'DESCRICAO'#9'50'#9'Descrição'
            'SALDOQTDE'#9'10'#9'Saldo'
            'CODMEDIDA'#9'5'#9'Unid.~Media'
            'QTDEPESSOA'#9'8'#9'Quant.~Pessoa'
            'NPESSOAS'#9'3'#9'Nº~Pessoas'
            'QTDESUG'#9'10'#9'Quant.~Sugerida'
            'QTDESOLI'#9'11'#9'Quantidade~Solicitada')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsGrid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnExit = dbgrdExit
          IndicatorColor = icBlack
        end
      end
      object TabOBS: TTabSheet
        Caption = 'Observação'
        object memSCI: TMemo
          Left = 0
          Top = 0
          Width = 765
          Height = 168
          Align = alClient
          MaxLength = 200
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 783
    Height = 40
    object lblAlmox: TLabel [0]
      Left = 8
      Top = 0
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    inherited tb97Fundo: TToolbar97
      Left = 611
      DockPos = 614
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 310
      DockPos = 313
      inherited ToolbarSep971: TToolbarSep97
        Left = 213
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 129
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 132
        Height = 34
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 216
        Height = 34
        OnClick = bbtnCancelarClick
      end
      object BtnSCI: TBitBtn
        Left = 0
        Top = 0
        Width = 129
        Height = 34
        Caption = '&Gerar S.C.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnSCIClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330FFFFF
          FFF03333337F3FFFF3F73333330F0000F0F03333337F777737373333330FFFFF
          FFF033FFFF7FFF33FFF77000000007F00000377777777FF777770BBBBBBBB0F0
          FF037777777777F7F3730B77777BB0F0F0337777777777F7F7330B7FFFFFB0F0
          0333777F333377F77F330B7FFFFFB0009333777F333377777FF30B7FFFFFB039
          9933777F333377F777FF0B7FFFFFB0999993777F33337777777F0B7FFFFFB999
          9999777F3333777777770B7FFFFFB0399933777FFFFF77F777F3070077007039
          99337777777777F777F30B770077B039993377FFFFFF77F777330BB7007BB999
          93337777FF777777733370000000073333333777777773333333}
        NumGlyphs = 2
      end
    end
    object edAlmoxa: TEdit
      Left = 7
      Top = 13
      Width = 282
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'EDALMOXA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 467
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsGrid: TwwDataSource
    AutoEdit = False
    DataSet = CdsDet
    Left = 494
    Top = 198
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SCPREPRONTA.DESCSCPREPRONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'SCPREPRONTA')
    CamposChave.Strings = (
      'SCPREPRONTA.IDSCPREPRONTA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 560
    Top = 150
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 449
    Top = 149
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 149
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 688
    Top = 152
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 689
    Top = 205
  end
  object cdsParamCompras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 637
    Top = 156
  end
end
