inherited FrmImportaEmpAcoes: TFrmImportaEmpAcoes
  Left = 167
  Top = 136
  Caption = 'Importa Movimento dos Empréstimos de Ações'
  ClientHeight = 459
  ClientWidth = 896
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 420
    Width = 896
    object lblMensagem: TfcLabel [0]
      Left = 6
      Top = 8
      Width = 303
      Height = 22
      Align = alClient
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.LineSpacing = 1
      TextOptions.VAlignment = vaVCenter
    end
    inherited tb97Fundo: TToolbar97
      Left = 720
      DockPos = 872
      inherited sep1: TToolbarSep97
        Left = 169
      end
      inherited bbtnSair: TBitBtn
        Cursor = crHandPoint
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Width = 85
        Cursor = crHandPoint
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 548
      DockPos = 553
      inherited ToolbarSep971: TToolbarSep97
        Left = 84
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 84
        Cursor = crHandPoint
        Hint = 'Atualizar o Sistema de Empréstimo com o Movimento Importado'
        Caption = '&Atualizar'
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 87
        Cursor = crHandPoint
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
    object Toolbar971: TToolbar97
      Left = 379
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 384
      TabOrder = 2
      object ToolbarSep972: TToolbarSep97
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bBtnImportar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Hint = 'Importar o Movimento do Custodiante'
        Caption = '&Importar'
        Default = True
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bBtnImportarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
      object bbtExcluir: TBitBtn
        Left = 84
        Top = 0
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Hint = 'Excluir o Movimento importado e não transferido'
        Caption = '&Excluir'
        Default = True
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtExcluirClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
          0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000840000008400000084000000840000008400FF000000FF000000FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
          84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
          FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
          0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
          FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
          FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
          FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
          0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
          FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
          FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
          FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 896
    Height = 420
    inherited bvlSepTit: TBevel
      Width = 894
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 56
      Width = 195
      Height = 13
      Caption = 'Indique o caminho para o arquivo '
    end
    object SB1: TSpeedButton [2]
      Left = 528
      Top = 71
      Width = 22
      Height = 22
      Cursor = crHandPoint
      Hint = 'Buscar Arquivo '
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SB1Click
    end
    object Label2: TLabel [3]
      Left = 567
      Top = 56
      Width = 208
      Height = 13
      Caption = 'Data do último Movimento Importado'
    end
    object spbLocalizaUltMov: TSpeedButton [4]
      Left = 823
      Top = 70
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Localiza último Movimento '
      Glyph.Data = {
        9E050000424D9E05000000000000360400002800000013000000120000000100
        0800000000006801000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F60000F6
        F6F6F6F6F6F6F6F6F6F6F6F6FF00F6F600FF0100F6F6F6F6F6F6F6F6F6F6F6F6
        FF00F6F600F9FF0100F6F6F6F6F6F6F6F6F6F6F6FF00F6F6F600F9FF0000F6F6
        F6F6F6F6F6F6F6F6FF00F6F6F6F600F9FF00000000A4F6F6F6F6F6F6FF00F6F6
        F6F6F600F900FFFFFF00A4F6F6F6F6F6FF00F6F6A40000000007070707070000
        F6F6F6F6FF00F6F60000A4FB00FF07FF07FF00FB00F6F6F6FF00F6F600FF00A4
        0007FF07FF0700A400F6F6F6FF00F6F600FB00FBA40007FF0700A4FBA400F6F6
        FF00F6F600FFA400FBA4000000A4FBA4FB00F6F6FF00F6F600FBFF00A4FBA4FB
        A4FBA4FBA4FB00F6FF00F6F600FFFBFF000000A4FBA4FBA4FBA400F6FF00F6F6
        00FBFFFBFFFBFF00000000000000F6F6FF00F6F600FFFBFFFBFFFBFFFBFFFB00
        F6F6F6F6FF00F6F6A400000000000000000000A4F6F6F6F6FF00F6F6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6FF00F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
        FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = spbLocalizaUltMovClick
    end
    object Label3: TLabel [5]
      Left = 639
      Top = 398
      Width = 157
      Height = 13
      Caption = 'Data da última Atualização:'
    end
    inherited pnlTitulo: TPanel
      Width = 894
      inherited lbNomDescricao: TfcLabel
        Width = 480
        Caption = 'Importa Movimento dos Empréstimos de Ações'
      end
    end
    object edtArquivo: TEdit
      Left = 7
      Top = 72
      Width = 517
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PageControl: TPageControl
      Left = 8
      Top = 102
      Width = 876
      Height = 289
      ActivePage = TabSheet1
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Movimento Importado'
        object dbgImporta: TwwDBGrid
          Left = 0
          Top = 0
          Width = 868
          Height = 261
          Selected.Strings = (
            'DATAOPERACAO'#9'16'#9'Data Operação'#9'F'
            'DATAVENCOPER'#9'17'#9'Data Vencimento'#9'F'
            'DATAREVERSAO'#9'16'#9'Data Reversão'#9'F'
            'DESCINVESTIMENTO'#9'35'#9'Investimento'#9'F'
            'DESCCARTINVEST'#9'35'#9'Carteira'#9'F'
            'PLANPRVCONTABPATRO'#9'34'#9'Plano/Patro'#9'F'
            'SGLCORRETVALORES'#9'16'#9'Corretora'#9'F'
            'QTDOPERACAO'#9'13'#9'Qtd. Operação'#9'F'
            'PUOPERACAO'#9'14'#9'Preço'#9'F'
            'VLROPERACAO'#9'14'#9'Valor Operação'#9'F'
            'TAXAOPERACAO'#9'9'#9'Taxa'#9'F'
            'VLRRECEITABRUTA'#9'15'#9'Receita Bruta'#9'F'
            'VLRJUROS'#9'11'#9'Juros'#9'F'
            'NUMCONTRATOCUSTODIA'#9'15'#9'Nº Contrato'#9'F'
            'TIPOMOVIMENTO'#9'25'#9'Tipo Movimento'#9'F'
            'DESCOBSERVACAO'#9'255'#9'Observação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = Ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgImportaCalcCellColors
          OnDrawDataCell = dbgImportaDrawDataCell
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Resumo das inconsistências encontradas'
        ImageIndex = 1
        object mmErro: TMemo
          Left = 0
          Top = 0
          Width = 868
          Height = 261
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Ações marcadas para reprocessamento'
        ImageIndex = 2
        object mmInvest: TMemo
          Left = 0
          Top = 0
          Width = 868
          Height = 261
          Align = alClient
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object dtpUltMovImport: TCMDateTimePicker
      Left = 566
      Top = 72
      Width = 256
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = 16632264
      ButtonStyle = cbsCustom
      DateFormat = dfLong
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
    end
    object prbReproc: TProgressBar
      Left = 8
      Top = 394
      Width = 607
      Height = 21
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 4
    end
    object Button1: TButton
      Left = 866
      Top = 52
      Width = 23
      Height = 17
      Caption = '1'
      TabOrder = 5
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 866
      Top = 74
      Width = 23
      Height = 17
      Caption = '2'
      TabOrder = 6
      Visible = False
      OnClick = Button2Click
    end
    object DBEdit1: TDBEdit
      Left = 803
      Top = 394
      Width = 82
      Height = 21
      TabStop = False
      Color = 16632264
      DataField = 'ULTIMADATA'
      DataSource = dsDataUltimaAtualizacao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 439
    Top = 177
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object OpenDialog1: TOpenDialog
    Filter = 'texto|*.csv'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 441
    Top = 236
  end
  object Qry: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IMPORTA.IDOPEREMPACOESIMPORTA AS IDOPEREMPACOESIMPORTA,'
      '       IMPORTA.DATAOPERACAO AS DATAOPERACAO,'
      '       IMPORTA.DATAVENCOPER AS DATAVENCOPER,'
      '       IMPORTA.DATAREVERSAO AS DATAREVERSAO,'
      '       IMPORTA.IDCUSTODIANTE AS IDCUSTODIANTE,'
      '       IMPORTA.IDINVESTIMENTO AS IDINVESTIMENTO,'
      '       IMPORTA.IDCARTEIRAINVEST AS IDCARTEIRAINVEST,'
      '       IMPORTA.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR,'
      '       INVESTIMENTO.DESCINVESTIMENTO AS DESCINVESTIMENTO,'
      '       INVESTIMENTO.IDEMISSOR,'
      '       PLANO.PLANPRVCONTABPATRO AS PLANPRVCONTABPATRO,'
      '       CARTEIRA.DESCCARTINVEST AS DESCCARTINVEST,'
      '       CORRETOR.SGLCORRETVALORES AS SGLCORRETVALORES,'
      '       CUSTODIANTE.SGLCUSTODIANTE AS SGLCUSTODIANTE,'
      '       CASE'
      '         WHEN IMPORTA.FLGTIPOCONTA = 0 THEN'
      '          '#39'CC'#39
      '         WHEN IMPORTA.FLGTIPOCONTA = 1 THEN'
      '          '#39'CCI'#39
      '       END AS DESCTIPOCONTA,'
      '       IMPORTA.FLGTIPOCONTA AS FLGTIPOCONTA,'
      '       IMPORTA.PUOPERACAO AS PUOPERACAO,'
      '       IMPORTA.QTDOPERACAO AS QTDOPERACAO,'
      '       IMPORTA.TAXAOPERACAO AS TAXAOPERACAO,'
      '       IMPORTA.VLROPERACAO AS VLROPERACAO,'
      '       IMPORTA.VLRJUROS AS VLRJUROS,'
      '       IMPORTA.VLRRECEITABRUTA AS VLRRECEITABRUTA,'
      '       IMPORTA.NUMCONTRATOCUSTODIA AS NUMCONTRATOCUSTODIA,'
      '       CASE'
      '         WHEN IMPORTA.TIPOMOVIMENTO = 1 THEN'
      '          '#39'Concessão do Empréstimo'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 2 THEN'
      '          '#39'Reversão Parcial'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 3 THEN'
      '          '#39'Reversão Total'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 4 THEN'
      '          '#39'Renovação (Repactuação)'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 5 THEN'
      '          '#39'Juros Diários'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 6 THEN'
      '          '#39'Liquidação Financeira'#39
      '         WHEN IMPORTA.TIPOMOVIMENTO = 7 THEN'
      '          '#39'Inadimplência'#39
      '       END AS TIPOMOVIMENTO,'
      '       IMPORTA.TIPOMOVIMENTO AS IDTIPOMOVIMENTO,'
      '       IMPORTA.DESCOBSERVACAO AS DESCOBSERVACAO,'
      '       IMPORTA.IDCORRETVALORES AS IDCORRETVALORES,'
      '       IMPORTA.FLGSITUACAOIMPORT AS FLGSITUACAOIMPORT'
      '  FROM OPEREMPACOESIMPORTA IMPORTA,'
      '       INVESTIMENTO,'
      '       CARTEIRAINVEST CARTEIRA,'
      '       CORRETVALORES CORRETOR,'
      '       CUSTODIANTE,'
      '       (SELECT PA.IDPLANPREVCTBPATR,'
      
        '               (PL.NOME || '#39' - '#39' || PE.NOME) AS PLANPRVCONTABPAT' +
        'RO'
      
        '          FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTAB' +
        'IL PL'
      '         WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO,'
      ''
      '       (SELECT CASE WHEN :DATAOPERACAO = MAXDATA THEN '#39'S'#39
      '        ELSE '#39'N'#39
      
        '        END AS FLG FROM(SELECT MAX(DATAOPERACAO) AS MAXDATA FROM' +
        ' OPEREMPACOESIMPORTA'
      
        '                        WHERE FLGSITUACAOIMPORT <> 2)) ULTIMOVIM' +
        'ENTO'
      ''
      
        ' WHERE ((IMPORTA.DATAOPERACAO =:DATAOPERACAO) OR ((ULTIMOVIMENTO' +
        '.FLG = '#39'S'#39') AND (IMPORTA.DATAOPERACAO IS NULL)))'
      '   AND IMPORTA.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO(+)'
      '   AND IMPORTA.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR(+)'
      '   AND IMPORTA.IDCARTEIRAINVEST = CARTEIRA.IDCARTEIRAINVEST(+)'
      '   AND IMPORTA.IDCORRETVALORES = CORRETOR.IDCORRETVALORES(+)'
      '   AND IMPORTA.IDCUSTODIANTE = CUSTODIANTE.IDCUSTODIANTE(+)'
      ' ORDER BY IMPORTA.IDOPEREMPACOESIMPORTA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 212
    Top = 198
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
    object QryDATAOPERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object QryDATAREVERSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAREVERSAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object QryDATAVENCOPER: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object QryDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDESCOBSERVACAO: TStringField
      DisplayWidth = 255
      FieldName = 'DESCOBSERVACAO'
      Size = 255
    end
    object QryFLGSITUACAOIMPORT: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSITUACAOIMPORT'
    end
    object QryNUMCONTRATOCUSTODIA: TStringField
      DisplayWidth = 20
      FieldName = 'NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object QryPLANPRVCONTABPATRO: TStringField
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryPUOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PUOPERACAO'
      DisplayFormat = '###,##0.00000'
    end
    object QryQTDOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDOPERACAO'
    end
    object QrySGLCORRETVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object QrySGLCUSTODIANTE: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryTAXAOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'TAXAOPERACAO'
      DisplayFormat = '###,##0.00'
    end
    object QryTIPOMOVIMENTO: TStringField
      DisplayWidth = 23
      FieldName = 'TIPOMOVIMENTO'
      Size = 23
    end
    object QryVLRJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object QryVLROPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object QryVLRRECEITABRUTA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRECEITABRUTA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object QryIDOPEREMPACOESIMPORTA: TFloatField
      FieldName = 'IDOPEREMPACOESIMPORTA'
    end
    object QryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryIDTIPOMOVIMENTO: TStringField
      FieldName = 'IDTIPOMOVIMENTO'
      FixedChar = True
      Size = 1
    end
    object QryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object QryDESCTIPOCONTA: TStringField
      FieldName = 'DESCTIPOCONTA'
      Size = 3
    end
    object QryFLGTIPOCONTA: TFloatField
      FieldName = 'FLGTIPOCONTA'
    end
  end
  object Ds: TDataSource
    DataSet = Qry
    Left = 210
    Top = 262
  end
  object QryCarteira: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CARTEIRAINVEST.IDCARTEIRAINVEST, CARTEIRAINVEST.IDMERCADO'
      'FROM CARTEIRAINVEST'
      'WHERE CARTEIRAINVEST.IDCARTEIRAINVEST =:IDCARTEIRAINVEST')
    Left = 72
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    Left = 72
    Top = 196
  end
  object Query2: TQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM HISTEMPACOES'
      ''
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
    Left = 804
    Top = 184
    object Query2IDHISTEMPACOES: TFloatField
      FieldName = 'IDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDHISTEMPACOES'
    end
    object Query2IDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.HISTEMPACOES.IDEMPRESAPROP'
    end
    object Query2IDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDMODULO'
    end
    object Query2IDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTEMPACOES.IDPLANPREVCTBPATR'
    end
    object Query2PLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.HISTEMPACOES.PLANO'
    end
    object Query2PLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTEMPACOES.PLNCODIGO'
    end
    object Query2CODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.CODDOCUMENTO'
    end
    object Query2IDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCUSTODIANTE'
    end
    object Query2IDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCARTEIRAINVEST'
    end
    object Query2IDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDINVESTIMENTO'
    end
    object Query2IDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.HISTEMPACOES.IDTIPOINVEST'
    end
    object Query2IDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDTIPOOPERACAO'
    end
    object Query2IDOPEREMPACOES: TFloatField
      FieldName = 'IDOPEREMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDOPEREMPACOES'
    end
    object Query2DATAHISTEMPACOES: TDateTimeField
      FieldName = 'DATAHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.DATAHISTEMPACOES'
    end
    object Query2VLRHISTEMPACOES: TFloatField
      FieldName = 'VLRHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRHISTEMPACOES'
    end
    object Query2SLDHISTEMPACOES: TFloatField
      FieldName = 'SLDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDHISTEMPACOES'
    end
    object Query2QTDHISTEMPACOES: TFloatField
      FieldName = 'QTDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.QTDHISTEMPACOES'
    end
    object Query2NATURMOV: TStringField
      FieldName = 'NATURMOV'
      Origin = 'BASEDADOS.HISTEMPACOES.NATURMOV'
      FixedChar = True
      Size = 1
    end
    object Query2TRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HISTEMPACOES.TRGDTINCLUSAO'
    end
    object Query2TRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HISTEMPACOES.TRGUSERINCLUSAO'
      Size = 30
    end
    object Query2SLDQTDHISTEMPACOE: TFloatField
      FieldName = 'SLDQTDHISTEMPACOE'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDQTDHISTEMPACOE'
    end
    object Query2IDOPEREMPACOESAP: TFloatField
      FieldName = 'IDOPEREMPACOESAP'
      Origin = 'BASEDADOS.HISTEMPACOES.IDOPEREMPACOESAP'
    end
    object Query2FLGRECALC: TStringField
      FieldName = 'FLGRECALC'
      Origin = 'BASEDADOS.HISTEMPACOES.FLGRECALC'
      FixedChar = True
      Size = 1
    end
    object Query2VLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROS'
    end
    object Query2SLDJUROS: TFloatField
      FieldName = 'SLDJUROS'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDJUROS'
    end
    object Query2VLRFINAL: TFloatField
      FieldName = 'VLRFINAL'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRFINAL'
    end
    object Query2SLDFINAL: TFloatField
      FieldName = 'SLDFINAL'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDFINAL'
    end
    object Query2VLRPRINCIPAL: TFloatField
      FieldName = 'VLRPRINCIPAL'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRPRINCIPAL'
    end
    object Query2SLDPRINCIPAL: TFloatField
      FieldName = 'SLDPRINCIPAL'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDPRINCIPAL'
    end
    object Query2VLRJUROSEST: TFloatField
      FieldName = 'VLRJUROSEST'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROSEST'
    end
    object Query2NUMCONTRATOCUSTODIA: TStringField
      FieldName = 'NUMCONTRATOCUSTODIA'
      Origin = 'BASEDADOS.HISTEMPACOES.NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object Query2TIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.TIPOLANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object Query2IDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCORRETVALORES'
    end
    object Query2SLDJUROSIMPORTA: TFloatField
      FieldName = 'SLDJUROSIMPORTA'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDJUROSIMPORTA'
    end
    object Query2VLRJUROSIMPORTA: TFloatField
      FieldName = 'VLRJUROSIMPORTA'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROSIMPORTA'
    end
    object Query2IDCARTEIRACUSTODIANTE: TFloatField
      FieldName = 'IDCARTEIRACUSTODIANTE'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCARTEIRACUSTODIANTE'
    end
    object Query2TIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.TIPOMOVIMENTO'
      FixedChar = True
      Size = 1
    end
    object Query2VJUR: TFloatField
      FieldName = 'VJUR'
      Origin = 'BASEDADOS.HISTEMPACOES.VJUR'
    end
    object Query2SJUR: TFloatField
      FieldName = 'SJUR'
      Origin = 'BASEDADOS.HISTEMPACOES.SJUR'
    end
  end
  object Query3: TQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM HISTEMPACOES'
      '  '
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
      ' '
      ' '
      ' '
      ' ')
    Left = 804
    Top = 236
    object Query3IDHISTEMPACOES: TFloatField
      FieldName = 'IDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDHISTEMPACOES'
    end
    object Query3IDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.HISTEMPACOES.IDEMPRESAPROP'
    end
    object Query3IDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDMODULO'
    end
    object Query3IDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTEMPACOES.IDPLANPREVCTBPATR'
    end
    object Query3PLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.HISTEMPACOES.PLANO'
    end
    object Query3PLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTEMPACOES.PLNCODIGO'
    end
    object Query3CODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.CODDOCUMENTO'
    end
    object Query3IDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCUSTODIANTE'
    end
    object Query3IDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCARTEIRAINVEST'
    end
    object Query3IDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDINVESTIMENTO'
    end
    object Query3IDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.HISTEMPACOES.IDTIPOINVEST'
    end
    object Query3IDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.HISTEMPACOES.IDTIPOOPERACAO'
    end
    object Query3IDOPEREMPACOES: TFloatField
      FieldName = 'IDOPEREMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDOPEREMPACOES'
    end
    object Query3DATAHISTEMPACOES: TDateTimeField
      FieldName = 'DATAHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.DATAHISTEMPACOES'
    end
    object Query3VLRHISTEMPACOES: TFloatField
      FieldName = 'VLRHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRHISTEMPACOES'
    end
    object Query3SLDHISTEMPACOES: TFloatField
      FieldName = 'SLDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDHISTEMPACOES'
    end
    object Query3QTDHISTEMPACOES: TFloatField
      FieldName = 'QTDHISTEMPACOES'
      Origin = 'BASEDADOS.HISTEMPACOES.QTDHISTEMPACOES'
    end
    object Query3NATURMOV: TStringField
      FieldName = 'NATURMOV'
      Origin = 'BASEDADOS.HISTEMPACOES.NATURMOV'
      FixedChar = True
      Size = 1
    end
    object Query3TRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HISTEMPACOES.TRGDTINCLUSAO'
    end
    object Query3TRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HISTEMPACOES.TRGUSERINCLUSAO'
      Size = 30
    end
    object Query3SLDQTDHISTEMPACOE: TFloatField
      FieldName = 'SLDQTDHISTEMPACOE'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDQTDHISTEMPACOE'
    end
    object Query3IDOPEREMPACOESAP: TFloatField
      FieldName = 'IDOPEREMPACOESAP'
      Origin = 'BASEDADOS.HISTEMPACOES.IDOPEREMPACOESAP'
    end
    object Query3FLGRECALC: TStringField
      FieldName = 'FLGRECALC'
      Origin = 'BASEDADOS.HISTEMPACOES.FLGRECALC'
      FixedChar = True
      Size = 1
    end
    object Query3VLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROS'
    end
    object Query3SLDJUROS: TFloatField
      FieldName = 'SLDJUROS'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDJUROS'
    end
    object Query3VLRFINAL: TFloatField
      FieldName = 'VLRFINAL'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRFINAL'
    end
    object Query3SLDFINAL: TFloatField
      FieldName = 'SLDFINAL'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDFINAL'
    end
    object Query3VLRPRINCIPAL: TFloatField
      FieldName = 'VLRPRINCIPAL'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRPRINCIPAL'
    end
    object Query3SLDPRINCIPAL: TFloatField
      FieldName = 'SLDPRINCIPAL'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDPRINCIPAL'
    end
    object Query3VLRJUROSEST: TFloatField
      FieldName = 'VLRJUROSEST'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROSEST'
    end
    object Query3NUMCONTRATOCUSTODIA: TStringField
      FieldName = 'NUMCONTRATOCUSTODIA'
      Origin = 'BASEDADOS.HISTEMPACOES.NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object Query3TIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.TIPOLANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object Query3IDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCORRETVALORES'
    end
    object Query3SLDJUROSIMPORTA: TFloatField
      FieldName = 'SLDJUROSIMPORTA'
      Origin = 'BASEDADOS.HISTEMPACOES.SLDJUROSIMPORTA'
    end
    object Query3VLRJUROSIMPORTA: TFloatField
      FieldName = 'VLRJUROSIMPORTA'
      Origin = 'BASEDADOS.HISTEMPACOES.VLRJUROSIMPORTA'
    end
    object Query3IDCARTEIRACUSTODIANTE: TFloatField
      FieldName = 'IDCARTEIRACUSTODIANTE'
      Origin = 'BASEDADOS.HISTEMPACOES.IDCARTEIRACUSTODIANTE'
    end
    object Query3TIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Origin = 'BASEDADOS.HISTEMPACOES.TIPOMOVIMENTO'
      FixedChar = True
      Size = 1
    end
    object Query3VJUR: TFloatField
      FieldName = 'VJUR'
      Origin = 'BASEDADOS.HISTEMPACOES.VJUR'
    end
    object Query3SJUR: TFloatField
      FieldName = 'SJUR'
      Origin = 'BASEDADOS.HISTEMPACOES.SJUR'
    end
  end
  object Query4: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM HISTEMPACOES'
      '  '
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
      ' '
      ' '
      ' '
      ' ')
    Left = 796
    Top = 292
  end
  object Qry01: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'begin'
      'UPDATE HISTEMPACOES SET VLRJUROSIMPORTA = VLRJUROSIMPORTA * -1'
      
        'WHERE (TRUNC(TRGDTINCLUSAO) > '#39'29/12/2011'#39' AND TRGDTINCLUSAO < T' +
        'O_DATE('#39'02/02/2012 19:00:00'#39', '#39'DD/MM/YYYY HH24:MI:SS'#39') )'
      'AND TIPOLANCAMENTO = '#39'J'#39
      
        'AND NUMCONTRATOCUSTODIA NOT IN (SELECT H1.NUMCONTRATOCUSTODIA FR' +
        'OM HISTEMPACOES H1'
      
        'WHERE H1.DATAHISTEMPACOES = '#39'29/12/2011'#39' AND H1.TIPOLANCAMENTO =' +
        ' '#39'Z'#39');'
      'end;'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 732
    Top = 178
  end
  object qryAux2: TQuery
    DatabaseName = 'BaseDados'
    Left = 306
    Top = 222
  end
  object qryImp: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nvl(MAX(IDOPEREMPACOESIMPORTA),0) + 1 AS NUMSEQ'
      'FROM OPEREMPACOESIMPORTA')
    Left = 310
    Top = 316
    object qryImpNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
    end
  end
  object qryDataUltimaAtualizacao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAHISTEMPACOES) AS ULTIMADATA'
      'FROM HISTEMPACOES WHERE NUMCONTRATOCUSTODIA IS NOT NULL')
    Left = 460
    Top = 310
    object qryDataUltimaAtualizacaoULTIMADATA: TDateTimeField
      FieldName = 'ULTIMADATA'
      Origin = 'BASEDADOS.HISTEMPACOES.DATAHISTEMPACOES'
    end
  end
  object dsDataUltimaAtualizacao: TDataSource
    DataSet = qryDataUltimaAtualizacao
    Left = 458
    Top = 366
  end
end
