inherited frmImportaLancamentoMT: TfrmImportaLancamentoMT
  Left = 262
  Top = 152
  BorderStyle = bsSingle
  Caption = 'Importação de Lançamentos'
  ClientHeight = 467
  ClientWidth = 661
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 270
    Width = 661
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inherited pnlFundo: TPanel
    Width = 661
    Height = 270
    Align = alTop
    BevelOuter = bvRaised
    object PageControl: TPageControl
      Left = 2
      Top = 2
      Width = 657
      Height = 266
      ActivePage = tbsTabela
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      object tbArquivoTxt: TTabSheet
        Caption = 'Arquivo de texto'
        object Label2: TLabel
          Left = 40
          Top = 32
          Width = 145
          Height = 13
          Caption = 'Arquivo Para Importação:'
        end
        object Label1: TLabel
          Left = 40
          Top = 86
          Width = 307
          Height = 13
          Caption = 'Histórico Complementar do lançamento do Documento'
        end
        object spdSelec: TSpeedButton
          Left = 454
          Top = 38
          Width = 141
          Height = 31
          Caption = 'Selecionar Arquivo '
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888811888
            88888888888778F88888888888199188888888888878878F8888888881999918
            8888888887888878F888888819999991888888887FFF88F7F888888811199111
            88888888777F8777888888888819918888888888887F87F88888888888199188
            888888FFFF7F87FFFFF880000019910000888777777FF77777FF777777111177
            7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
            87707F777777777787F778888888888887707F888888888887F7788888888882
            87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
            8870878FFFFFFFFFFFF788777777777777788877777777777778}
          NumGlyphs = 2
          OnClick = spdSelecClick
        end
        object edNomeArqTxt: TEdit
          Left = 40
          Top = 45
          Width = 401
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdtHist: TEdit
          Left = 40
          Top = 103
          Width = 555
          Height = 21
          MaxLength = 40
          TabOrder = 1
          Text = 'Importacao via TXT'
        end
      end
      object tbsTabela: TTabSheet
        Caption = 'Base de dados'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 649
          Height = 107
          Align = alTop
          TabOrder = 0
          object Label3: TLabel
            Left = 366
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Inicial:'
          end
          object Label4: TLabel
            Left = 373
            Top = 44
            Width = 32
            Height = 13
            Caption = 'Final:'
          end
          object Label5: TLabel
            Left = 18
            Top = 61
            Width = 185
            Height = 13
            Caption = 'Descrição do lote de importação'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 410
            Top = 9
            Width = 98
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
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
          end
          object edtDataFinal: TCMDateTimePicker
            Left = 410
            Top = 36
            Width = 98
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
            TabOrder = 1
          end
          object btSelecionar: TBitBtn
            Left = 526
            Top = 8
            Width = 101
            Height = 50
            Caption = 'Selecionar'
            TabOrder = 2
            OnClick = btSelecionarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            Layout = blGlyphTop
            NumGlyphs = 2
          end
          object edtDescLote: TEdit
            Left = 18
            Top = 76
            Width = 609
            Height = 21
            MaxLength = 80
            TabOrder = 3
            Text = 'Importação via base de dados'
          end
          object rgTipoData: TRadioGroup
            Left = 18
            Top = 8
            Width = 305
            Height = 47
            Caption = 'Data de pesquisa:'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Validação'
              'Vencimento'
              'Programada')
            TabOrder = 4
          end
        end
        object Grid: TwwDBGrid
          Left = 0
          Top = 107
          Width = 649
          Height = 131
          ControlType.Strings = (
            'FLGCONTABILIZA;CheckBox;S;N')
          Selected.Strings = (
            'NODOCUMENTO'#9'13'#9'Documento'
            'COMPLDOCUMENTO'#9'5'#9'Compl.'
            'NOMEFORCLI'#9'40'#9'Fornecedor / Cliente'
            'DATAVENCTO'#9'13'#9'Data ~Vencimento'
            'DATAPROGRAMADA'#9'13'#9'Data~Programada'
            'DATAVALIDACAO'#9'18'#9'Data de~Validação'
            'STATUSEXTERNO'#9'8'#9'Chave~Usuário'
            'VLRRATEIO'#9'16'#9'Valor~Rateio'
            'VALOR'#9'16'#9'Valor~Documento'
            'FLGCONTABILIZA'#9'10'#9'Contabilizar'
            'NOMEPROGRAMA'#9'20'#9'Programa'
            'NOMEPLANO'#9'25'#9'Plano Previdenciário'
            'NOMEPATRO'#9'25'#9'Patrocinadora'
            'NOMEATV'#9'22'#9'Atividade/Projeto'
            'NOMECC'#9'25'#9'Centro de custo'
            'NOMECR'#9'25'#9'Centro de ~responsabilidade'
            'NOMETD'#9'15'#9'Tipo de ~documento'
            'NOMETRD'#9'31'#9'Tipo de recebimento/~desembolso')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnCalcCellColors = GridCalcCellColors
          OnTitleButtonClick = GridTitleButtonClick
          IndicatorColor = icBlack
          OnTopRowChanged = GridTopRowChanged
          OnUpdateFooter = GridUpdateFooter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 661
    inherited tb97Fundo: TToolbar97
      Left = 370
      DockPos = 370
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 185
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = 'C&onfirmar'
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
      end
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 273
    Width = 661
    Height = 155
    Align = alClient
    TabOrder = 2
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 659
      Height = 25
      Align = alTop
      Caption = 'Log de erros'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
    end
    object mmLogErros: TRichEdit
      Left = 1
      Top = 26
      Width = 659
      Height = 128
      Align = alClient
      PopupMenu = ppMenu
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65514
    Top = 65514
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object opdlgtxt: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Textos|*.txt'
    Left = 797
    Top = 58
  end
  object ppMenu: TPopupMenu
    Left = 928
    Top = 72
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirClick
    end
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAfterOpen
    Left = 798
    Top = 98
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 870
    Top = 90
  end
end
