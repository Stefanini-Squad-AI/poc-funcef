inherited FrmConsCarteiraFundos: TFrmConsCarteiraFundos
  Left = 206
  Top = 203
  HelpContext = 790502
  Caption = 'Consulta de Dados'
  ClientHeight = 536
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 47
    Width = 792
    Height = 450
    inherited bvlSepTit: TBevel
      Width = 790
    end
    inherited pnlTitulo: TPanel
      Width = 790
      inherited lbNomDescricao: TfcLabel
        Width = 386
        Caption = 'Carteiras dos Fundos de Investimento'
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 45
      Width = 790
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 17
        Top = 6
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label4: TLabel
        Left = 415
        Top = 6
        Width = 134
        Height = 13
        Caption = 'Fundo de Investimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 137
        Top = 7
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dData: TCMDateTimePicker
        Left = 17
        Top = 21
        Width = 113
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
        OnExit = dDataExit
      end
      object DbLkCFundoInvest: TwwDBLookupCombo
        Left = 415
        Top = 21
        Width = 362
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
        LookupTable = QryFundoInvestOperacao
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLkCFundoInvestCloseUp
        OnExit = DbLkCFundoInvestExit
      end
      object DbLkCPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 137
        Top = 21
        Width = 272
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Plano / Patrocinadora'#9'F')
        LookupTable = QryPatroPlanPrevContab
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLkCPlanPrevCtbPatrCloseUp
        OnExit = DbLkCPlanPrevCtbPatrExit
      end
    end
    object PgCCarteiras: TPageControl
      Left = 1
      Top = 126
      Width = 790
      Height = 323
      ActivePage = TbOutrasContas
      Align = alClient
      TabOrder = 2
      object TbOutrasContas: TTabSheet
        Caption = 'Outras Contas'
        ImageIndex = 6
        object dbgOutrasContas: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimentos'
            'DESCOUTRASCONTAS'#9'44'#9'Contas'
            'VLRCONTAS'#9'20'#9'Valor das Contas')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsOutrasContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbOperCompr: TTabSheet
        Caption = 'Oper. Compromissadas'
        object dbgOperCompr: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'20'#9'Fundo de Investimento'
            'DESCCONTRAPARTE'#9'20'#9'Contraparte'
            'LASTRO'#9'10'#9'Lastro'
            'DATAEMISSAO'#9'14'#9'Data de Emissão~do Lastro'
            'DATAVENCIMENTO'#9'14'#9'Data de~Vencimento'
            'STAATIVPASS'#9'7'#9'Ativo /~Passivo'
            'QUANTIDADE'#9'18'#9'Quantidade'
            'TAXA'#9'10'#9'Taxa'
            'INDEXADOR'#9'10'#9'Indexador'
            'PUCOMPRA'#9'15'#9'Pu de Compra'
            'PUVENCIMENTO'#9'15'#9'Pu de Vencimento'
            'VLRFINANCEIRO'#9'18'#9'Financeiro'
            'DESCCTRPAROPER'#9'20'#9'Contraparte da~Operação'
            'INDEXADORCTRPAR'#9'10'#9'Indexador da~Operação'
            'PERCTRPAROPER'#9'10'#9'% do Indexador~da Operação'
            'TAXACTRPAROPER'#9'10'#9'Cupon/Taxa~da Operação'
            'DATARELOPER'#9'10'#9'Realização~da operação'
            'DATAREVEROPER'#9'10'#9'Reversão da~Operação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsOperCompr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbTitPrivados: TTabSheet
        Caption = 'Tit. Privados'
        ImageIndex = 1
        object dbgTitPrivados: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'20'#9'Fundo de Investimento'#9'F'
            'DESCCONTRAPARTE'#9'20'#9'Contraparte'#9'F'
            'CODIGO'#9'15'#9'Código'#9'F'
            'STAATIVPASS'#9'7'#9'Ativo/~Passivo'#9'F'
            'DATACOMPRA'#9'10'#9'Data da~Compra'#9'F'
            'DATAVENCIMENTO'#9'10'#9'Data de~Vencimento'#9'F'
            'VLRPRINCIPAL'#9'18'#9'Principal'#9'F'
            'INDEXADOR'#9'10'#9'Indexador'#9'F'
            'TAXA'#9'7'#9'Taxa~(a.a.)'#9'F'
            'VLRFINANCEIRO'#9'18'#9'Financeiro'#9'F'
            'CUPOMTAXA'#9'10'#9'Cupom/Taxa~(a.a.)'#9'F'
            'CODSNDDEBENTURE'#9'10'#9'Código SND'#9'F'
            'QTDDEBENTURES'#9'18'#9'Quantidade~de Debentures'#9'F'
            'STAGARANTIA'#9'10'#9'Depósito em~Garantia S/N'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsTitPrivados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbTitPublicos: TTabSheet
        Caption = 'Tit. Públicos'
        ImageIndex = 2
        object dbgTitPublicos: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'20'#9'Fundo de Investimento'#9'F'
            'DESCCONTRAPARTE'#9'20'#9'Contraparte'#9'F'
            'CODIGO'#9'15'#9'Código'#9'F'
            'STAATIVPASS'#9'7'#9'Ativo/~Passivo'#9'F'
            'DATAEMISSAO'#9'10'#9'Data da~Emissão'#9'F'
            'DATAVENCIMENTO'#9'10'#9'Data de~Vencimento'#9'F'
            'QUANTIDADE'#9'18'#9'Quantidade'#9'F'
            'TAXA'#9'10'#9'Taxa %'#9'F'
            'INDEXADOR'#9'10'#9'Indexador'#9'F'
            'PUCOMPRA'#9'15'#9'Pu de Compra'#9'F'
            'PUVENCIMENTO'#9'15'#9'Pu de Vencimento'#9'F'
            'VLRFINANCEIRO'#9'18'#9'Financeiro'#9'F'
            'DATACOMPRA'#9'10'#9'Data da~Compra'#9'F'
            'STAGARANTIA'#9'10'#9'Depósito em~Garantia S/N'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsTitPublicos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbBolsaBmf: TTabSheet
        Caption = 'Bolsas (BM&F- BOVESPA)'
        ImageIndex = 3
        object dbgBolsaBMF: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'24'#9'Fundo de Investimento'
            'DESCINVESTIMENTO'#9'20'#9'Investimento'
            'STAATIVPASS'#9'7'#9'Ativo/~Passivo'
            'QUANTIDADE'#9'18'#9'Quantidade'
            'VLRAJUSTE'#9'15'#9'Ajuste'
            'VLRFINANCEIRO'#9'18'#9'Financeiro')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsBolsaBmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbSwap: TTabSheet
        Caption = 'Swap'
        ImageIndex = 4
        object dbgSwap: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'20'#9'Fundo de Investimento'
            'DESCCONTRAPARTE'#9'20'#9'Contraparte'
            'CODIGO'#9'15'#9'Código'
            'DATACOMPRA'#9'10'#9'Data da~Compra'
            'DATAVENCIMENTO'#9'10'#9'Data do~Vencimento'
            'VLRPRINCIPAL'#9'18'#9'Principal'
            'INDEXADORPASS'#9'10'#9'Indexador'
            'TAXAPASSIVO'#9'7'#9'Passivo~Taxa'
            'VLRFINANCPASS'#9'18'#9'Financeiro'
            'INDEXADORATIVO'#9'10'#9'Indexador'
            'TAXAATIVO'#9'7'#9'Ativo~Taxa'
            'VLRFINANCATIVO'#9'18'#9'Financeiro'
            'TAXAPASSIVOPRE'#9'10'#9'Passivo Taxa~Pré (a.a.)'
            'TAXAATIVOPRE'#9'10'#9'Ativo Taxa~Pré (a.a.)'
            'EMISSOR'#9'20'#9'Emissor'
            'STAGARANTIA'#9'1'#9'Depósito em~Garantia S/N')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsSwap
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
      object TbDespCorret: TTabSheet
        Caption = 'Despesas c/ Corretagem'
        ImageIndex = 5
        object dbgDespCorret: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 295
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'20'#9'Fundo de Investimento'
            'DESCCORRETORA'#9'20'#9'Corretora'
            'TIPOCORRETORA'#9'20'#9'Tipo de Corretora'
            'CNPJCORRETORA'#9'18'#9'CNPJ da Corretora'
            'NUMOPERACAO'#9'10'#9'Número de~Operações'
            'VLRTABBOVESPA'#9'10'#9'BOVESPA~Valores de~Tabela'
            'VLRDEVBOVESPA'#9'10'#9'BOVESPA~Devolução'
            'VLREFEPGBOVESPA'#9'17'#9'BOVESPA~Valor Efetivamente~Pago'
            'VLRTABBMF'#9'10'#9'BM&F~Valores de~Tabela'
            'VLRDEVBMF'#9'10'#9'BM&F~Devolução'
            'VLREFEPGBMF'#9'17'#9'BM&F~Valor Efetivamente~Pago'
            'VLRTABBOLSA'#9'10'#9'BOLSA~Valores de~Tabela'
            'VLRDEVBOLSA'#9'10'#9'BOLSA~Devolução'
            'VLREFEPGBOLSA'#9'17'#9'BOLSA~Valor Efetivamente~Pago')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DsDespCorret
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
    end
    object pnlProgresso: TPanel
      Left = 1
      Top = 101
      Width = 790
      Height = 25
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object gauProgresso: TGauge
        Left = 2
        Top = 2
        Width = 786
        Height = 21
        Align = alClient
        BackColor = clNavy
        BorderStyle = bsNone
        Color = clNavy
        ForeColor = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxValue = 8
        ParentColor = False
        ParentFont = False
        Progress = 0
        ShowText = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 719
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 283
      DockPos = 382
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 249
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object btImprimir: TBitBtn
        Left = 252
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object bbtnExcluir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Excluir'
        TabOrder = 3
        OnClick = bbtnExcluirClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFD
          FD0000FF00FDFDFDFDFDFDFDFDFDFDFDFDA4A4FFA4FDFDFDFDFDFDFDFDFDFD00
          00FFFFFF00FDFDFDFDFDFDFDFDFDFDA4A4FFFFFFA4FDFDFDFDFDFDFDFD0000FF
          FFFFFFFFFF00FDFDFDFDFDFDFDA4A4FFFFFFFFFFFFA4FDFDFDFDFDFDFDA4FFFF
          FFFFFFFCFF00FDFDFDFDFDFDFDA4FFFFFFFFFFA4FFA4FDFDFDFDFDFD01010101
          01FCFCFFFFFF00FDFDFDFDFDA4A4A4A4A4A4A4FFFFFFA4FDFDFDFD01F9F9F9F9
          F901FFFFFCFF00FDFDFDFDA40707070707A4FFFFA4FFA4FDFDFDF9F9F9F9F9F9
          F9F901FCFFFFFF00FDFD0707070707070707A4A4FFFFFFA4FDFDF9F9FDFFF9FF
          FFF901FFFFFCFFFF00FD0707FDFF07FFFF07A4FFFFA4FFFFA4FDF9F9F9FDFFFF
          F9F901FCFCFFFFFFFF00070707FDFFFF0707A4A4A4FFFFFFFFA4F9F9F9FFFFFD
          F9F901FFFFFFFFA4A4FD070707FFFFFD0707A4FFFFFFFFA4A4FDF9F9FDFFF9FF
          FFF901FFFFA4A4FDFDFD0707FDFF07FFFF07A4FFFFA4A4FDFDFDFDF9F9F9F9F9
          F901A4A4A4FDFDFDFDFDFD070707070707A4A4A4A4FDFDFDFDFDFDFDF9F9F9F9
          F9FDFDFDFDFDFDFDFDFDFDFD0707070707FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        NumGlyphs = 2
      end
    end
  end
  object Dock972: TDock97 [2]
    Left = 0
    Top = 0
    Width = 792
    Height = 47
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
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object sbtnProcurar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 742
    Top = 53
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 678
    Top = 4
  end
  object QryFundoInvestOperacao: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  FUN.IDFUNDOINVEST, FUN.DESCFUNDOINVEST,'
      '  FUN.IDCARTEIRAINVEST, FUN.IDTIPOFUNDOINVEST'
      'FROM'
      ' (SELECT'
      
        '     HISTFUNDOINVEST.IDFUNDOINVEST, HISTFUNDOINVEST.DESCFUNDOINV' +
        'EST,'
      
        '     HISTFUNDOINVEST.IDCARTEIRAINVEST, HISTFUNDOINVEST.IDTIPOFUN' +
        'DOINVEST'
      
        '  FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENC' +
        'IA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT FND.IDFUNDOINVEST || TO_CHAR(MAX(FND.DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST FND, TIPOFUNDOINVEST TFI'
      '           WHERE'
      '                 (TFI.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  (((:DATAOPERACAO IS NOT NULL) AND (FND.DTAVIGE' +
        'NCIA < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')+1)) OR'
      '                    (:DATAOPERACAO IS NULL))'
      '             AND (FND.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      '           GROUP BY FND.IDFUNDOINVEST))) FUN'
      'ORDER BY FUN.DESCFUNDOINVEST'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 567
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end>
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object ImlPadrao: TImageList
    Left = 740
    Top = 3
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
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
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VWPLANPREVCTBPATR.* FROM VWPLANPREVCTBPATR')
    ValidateWithMask = True
    Left = 409
    Top = 6
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
  object updOperCompr: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOOPERCOMPR'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCCONTRAPARTE = :DESCCONTRAPARTE,'
      '  LASTRO = :LASTRO,'
      '  DATAOPER = :DATAOPER,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  STAATIVPASS = :STAATIVPASS,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  TAXA = :TAXA,'
      '  INDEXADOR = :INDEXADOR,'
      '  PUCOMPRA = :PUCOMPRA,'
      '  PUVENCIMENTO = :PUVENCIMENTO,'
      '  VLRFINANCEIRO = :VLRFINANCEIRO,'
      '  DESCCTRPAROPER = :DESCCTRPAROPER,'
      '  INDEXADORCTRPAR = :INDEXADORCTRPAR,'
      '  PERCTRPAROPER = :PERCTRPAROPER,'
      '  TAXACTRPAROPER = :TAXACTRPAROPER,'
      '  DATARELOPER = :DATARELOPER,'
      '  DATAREVEROPER = :DATAREVEROPER'
      'where'
      '  IDFDOOPERCOMPR = :OLD_IDFDOOPERCOMPR')
    InsertSQL.Strings = (
      'insert into FDOOPERCOMPR'
      '  (IDFDOOPERCOMPR, DESCFUNDOINVEST, DESCCONTRAPARTE, LASTRO, '
      'DATAOPER, '
      '   DATAEMISSAO, DATAVENCIMENTO, STAATIVPASS, QUANTIDADE, TAXA, '
      'INDEXADOR, '
      '   PUCOMPRA, PUVENCIMENTO, VLRFINANCEIRO, DESCCTRPAROPER, '
      'INDEXADORCTRPAR, '
      '   PERCTRPAROPER, TAXACTRPAROPER, DATARELOPER, DATAREVEROPER)'
      'values'
      
        '  (:IDFDOOPERCOMPR, :DESCFUNDOINVEST, :DESCCONTRAPARTE, :LASTRO,' +
        ' '
      ':DATAOPER, '
      
        '   :DATAEMISSAO, :DATAVENCIMENTO, :STAATIVPASS, :QUANTIDADE, :TA' +
        'XA, '
      ':INDEXADOR, '
      '   :PUCOMPRA, :PUVENCIMENTO, :VLRFINANCEIRO, :DESCCTRPAROPER, '
      ':INDEXADORCTRPAR, '
      '   :PERCTRPAROPER, :TAXACTRPAROPER, :DATARELOPER, '
      ':DATAREVEROPER)')
    DeleteSQL.Strings = (
      'delete from FDOOPERCOMPR'
      'where'
      '  IDFDOOPERCOMPR = :OLD_IDFDOOPERCOMPR')
    Left = 92
    Top = 376
  end
  object QryTitPrivados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOTITPRIVADOS, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIG' +
        'O, DATAOPER, STAATIVPASS, DATACOMPRA,'
      
        '       DATAVENCIMENTO, VLRPRINCIPAL, INDEXADOR, TAXA, VLRFINANCE' +
        'IRO, CUPOMTAXA,'
      '       CODSNDDEBENTURE, QTDDEBENTURES, STAGARANTIA'
      'FROM   FDOTITPRIVADOS TP,'
      
        '      (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE  TP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       TP.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '      (TP.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '        (:IDFUNDOINVEST IS NULL) )             AND'
      '       FI.IDFUNDOINVEST     = TP.IDFUNDOINVEST'
      ''
      ''
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
      ' ')
    UpdateObject = updTitPrivados
    ValidateWithMask = True
    Left = 182
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryTitPrivadosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 20
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryTitPrivadosDESCCONTRAPARTE: TStringField
      DisplayLabel = 'Contraparte'
      DisplayWidth = 20
      FieldName = 'DESCCONTRAPARTE'
      Size = 60
    end
    object QryTitPrivadosCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
    end
    object QryTitPrivadosSTAATIVPASS: TStringField
      DisplayLabel = 'Ativo/~Passivo'
      DisplayWidth = 7
      FieldName = 'STAATIVPASS'
      FixedChar = True
      Size = 1
    end
    object QryTitPrivadosDATACOMPRA: TDateTimeField
      DisplayLabel = 'Data da~Compra'
      DisplayWidth = 10
      FieldName = 'DATACOMPRA'
    end
    object QryTitPrivadosDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data de~Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object QryTitPrivadosVLRPRINCIPAL: TFloatField
      DisplayLabel = 'Principal'
      DisplayWidth = 18
      FieldName = 'VLRPRINCIPAL'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryTitPrivadosINDEXADOR: TStringField
      DisplayLabel = 'Indexador'
      DisplayWidth = 10
      FieldName = 'INDEXADOR'
    end
    object QryTitPrivadosTAXA: TFloatField
      DisplayLabel = 'Taxa~(a.a.)'
      DisplayWidth = 7
      FieldName = 'TAXA'
      DisplayFormat = '###,###0.00'
    end
    object QryTitPrivadosVLRFINANCEIRO: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCEIRO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryTitPrivadosCUPOMTAXA: TFloatField
      DisplayLabel = 'Cupom/Taxa~(a.a.)'
      DisplayWidth = 10
      FieldName = 'CUPOMTAXA'
      DisplayFormat = '###,###0.00'
    end
    object QryTitPrivadosCODSNDDEBENTURE: TStringField
      DisplayLabel = 'Código SND'
      DisplayWidth = 10
      FieldName = 'CODSNDDEBENTURE'
      Size = 30
    end
    object QryTitPrivadosQTDDEBENTURES: TFloatField
      DisplayLabel = 'Quantidade~de Debentures'
      DisplayWidth = 18
      FieldName = 'QTDDEBENTURES'
      DisplayFormat = '###,###,###,###'
    end
    object QryTitPrivadosSTAGARANTIA: TStringField
      DisplayLabel = 'Depósito em~Garantia S/N'
      DisplayWidth = 10
      FieldName = 'STAGARANTIA'
      FixedChar = True
      Size = 1
    end
    object QryTitPrivadosIDFDOTITPRIVADOS: TFloatField
      FieldName = 'IDFDOTITPRIVADOS'
      Visible = False
    end
    object QryTitPrivadosDATAOPER: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAOPER'
      Visible = False
    end
  end
  object DsTitPrivados: TwwDataSource
    AutoEdit = False
    DataSet = QryTitPrivados
    Left = 182
    Top = 319
  end
  object updTitPrivados: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOTITPRIVADOS'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCCONTRAPARTE = :DESCCONTRAPARTE,'
      '  CODIGO = :CODIGO,'
      '  DATAOPER = :DATAOPER,'
      '  STAATIVPASS = :STAATIVPASS,'
      '  DATACOMPRA = :DATACOMPRA,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRPRINCIPAL = :VLRPRINCIPAL,'
      '  INDEXADOR = :INDEXADOR,'
      '  TAXA = :TAXA,'
      '  VLRFINANCEIRO = :VLRFINANCEIRO,'
      '  CUPOMTAXA = :CUPOMTAXA,'
      '  CODSNDDEBENTURE = :CODSNDDEBENTURE,'
      '  QTDDEBENTURES = :QTDDEBENTURES,'
      '  STAGARANTIA = :STAGARANTIA'
      'where'
      '  IDFDOTITPRIVADOS = :OLD_IDFDOTITPRIVADOS')
    InsertSQL.Strings = (
      'insert into FDOTITPRIVADOS'
      '  (IDFDOTITPRIVADOS, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIGO, '
      'DATAOPER, '
      '   STAATIVPASS, DATACOMPRA, DATAVENCIMENTO, VLRPRINCIPAL, '
      'INDEXADOR, TAXA, '
      '   VLRFINANCEIRO, CUPOMTAXA, CODSNDDEBENTURE, QTDDEBENTURES, '
      'STAGARANTIA)'
      'values'
      
        '  (:IDFDOTITPRIVADOS, :DESCFUNDOINVEST, :DESCCONTRAPARTE, :CODIG' +
        'O, '
      ':DATAOPER, '
      '   :STAATIVPASS, :DATACOMPRA, :DATAVENCIMENTO, :VLRPRINCIPAL, '
      ':INDEXADOR, '
      '   :TAXA, :VLRFINANCEIRO, :CUPOMTAXA, :CODSNDDEBENTURE, '
      ':QTDDEBENTURES, '
      '   :STAGARANTIA)')
    DeleteSQL.Strings = (
      'delete from FDOTITPRIVADOS'
      'where'
      '  IDFDOTITPRIVADOS = :OLD_IDFDOTITPRIVADOS')
    Left = 181
    Top = 376
  end
  object QryTitPublicos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOTITPUBLICOS, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIG' +
        'O, DATAOPER, STAATIVPASS, DATAEMISSAO,'
      
        '       DATAVENCIMENTO, QUANTIDADE, TAXA, INDEXADOR, PUCOMPRA, PU' +
        'VENCIMENTO, VLRFINANCEIRO,'
      '       DATACOMPRA, STAGARANTIA'
      'FROM   FDOTITPUBLICOS TP,'
      
        '      (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      ''
      'WHERE  TP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       TP.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '      (TP.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '        (:IDFUNDOINVEST IS NULL) )             AND'
      '       FI.IDFUNDOINVEST     = TP.IDFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updTitPublicos
    ValidateWithMask = True
    Left = 262
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryTitPublicosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 20
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryTitPublicosDESCCONTRAPARTE: TStringField
      DisplayLabel = 'Contraparte'
      DisplayWidth = 20
      FieldName = 'DESCCONTRAPARTE'
      Size = 60
    end
    object QryTitPublicosCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
    end
    object QryTitPublicosSTAATIVPASS: TStringField
      DisplayLabel = 'Ativo/~Passivo'
      DisplayWidth = 7
      FieldName = 'STAATIVPASS'
      FixedChar = True
      Size = 1
    end
    object QryTitPublicosDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data da~Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
    end
    object QryTitPublicosDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data de~Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object QryTitPublicosQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 18
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###'
    end
    object QryTitPublicosTAXA: TFloatField
      DisplayLabel = 'Taxa %'
      DisplayWidth = 10
      FieldName = 'TAXA'
      DisplayFormat = '###,###0.00'
    end
    object QryTitPublicosINDEXADOR: TStringField
      DisplayLabel = 'Indexador'
      DisplayWidth = 10
      FieldName = 'INDEXADOR'
    end
    object QryTitPublicosPUCOMPRA: TFloatField
      DisplayLabel = 'Pu de Compra'
      DisplayWidth = 15
      FieldName = 'PUCOMPRA'
      DisplayFormat = '###,###0.00'
    end
    object QryTitPublicosPUVENCIMENTO: TFloatField
      DisplayLabel = 'Pu de Vencimento'
      DisplayWidth = 15
      FieldName = 'PUVENCIMENTO'
      DisplayFormat = '###,###0.00'
    end
    object QryTitPublicosVLRFINANCEIRO: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCEIRO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryTitPublicosDATACOMPRA: TDateTimeField
      DisplayLabel = 'Data da~Compra'
      DisplayWidth = 10
      FieldName = 'DATACOMPRA'
    end
    object QryTitPublicosSTAGARANTIA: TStringField
      DisplayLabel = 'Depósito em~Garantia S/N'
      DisplayWidth = 10
      FieldName = 'STAGARANTIA'
      FixedChar = True
      Size = 1
    end
    object QryTitPublicosIDFDOTITPUBLICOS: TFloatField
      FieldName = 'IDFDOTITPUBLICOS'
      Visible = False
    end
    object QryTitPublicosDATAOPER: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAOPER'
      Visible = False
    end
  end
  object DsTitPublicos: TwwDataSource
    AutoEdit = False
    DataSet = QryTitPublicos
    Left = 262
    Top = 319
  end
  object updTitPublicos: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOTITPUBLICOS'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCCONTRAPARTE = :DESCCONTRAPARTE,'
      '  CODIGO = :CODIGO,'
      '  DATAOPER = :DATAOPER,'
      '  STAATIVPASS = :STAATIVPASS,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  TAXA = :TAXA,'
      '  INDEXADOR = :INDEXADOR,'
      '  PUCOMPRA = :PUCOMPRA,'
      '  PUVENCIMENTO = :PUVENCIMENTO,'
      '  VLRFINANCEIRO = :VLRFINANCEIRO,'
      '  DATACOMPRA = :DATACOMPRA,'
      '  STAGARANTIA = :STAGARANTIA'
      'where'
      '  IDFDOTITPUBLICOS = :OLD_IDFDOTITPUBLICOS')
    InsertSQL.Strings = (
      'insert into FDOTITPUBLICOS'
      '  (IDFDOTITPUBLICOS, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIGO, '
      'DATAOPER, '
      '   STAATIVPASS, DATAEMISSAO, DATAVENCIMENTO, QUANTIDADE, TAXA, '
      'INDEXADOR, '
      '   PUCOMPRA, PUVENCIMENTO, VLRFINANCEIRO, DATACOMPRA, '
      'STAGARANTIA)'
      'values'
      
        '  (:IDFDOTITPUBLICOS, :DESCFUNDOINVEST, :DESCCONTRAPARTE, :CODIG' +
        'O, '
      ':DATAOPER, '
      
        '   :STAATIVPASS, :DATAEMISSAO, :DATAVENCIMENTO, :QUANTIDADE, :TA' +
        'XA, '
      ':INDEXADOR, '
      '   :PUCOMPRA, :PUVENCIMENTO, :VLRFINANCEIRO, :DATACOMPRA, '
      ':STAGARANTIA)')
    DeleteSQL.Strings = (
      'delete from FDOTITPUBLICOS'
      'where'
      '  IDFDOTITPUBLICOS = :OLD_IDFDOTITPUBLICOS')
    Left = 261
    Top = 376
  end
  object QryBolsaBmf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOCARTACOES, DESCFUNDOINVEST, DESCINVESTIMENTO, DATAMO' +
        'V, QUANTIDADE, VLRAJUSTE, VLRFINANCEIRO,'
      '       STAATIVPASS'
      'FROM   FDOCARTACOES FC, INVESTIMENTO IV,'
      
        '      (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE  FC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       FC.DATAMOV           = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '      (FC.IDFUNDOINVEST     = :IDFUNDOINVEST))   OR'
      '        (:IDFUNDOINVEST IS NULL) )               AND'
      '       FI.IDFUNDOINVEST     = FC.IDFUNDOINVEST   AND'
      '       IV.IDINVESTIMENTO(+) = FC.IDINVESTIMENTO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBolsaBmf
    ValidateWithMask = True
    Left = 334
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryBolsaBmfDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 24
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryBolsaBmfDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 20
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBolsaBmfSTAATIVPASS: TStringField
      DisplayLabel = 'Ativo/~Passivo'
      DisplayWidth = 7
      FieldName = 'STAATIVPASS'
      FixedChar = True
      Size = 1
    end
    object QryBolsaBmfQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 18
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###'
    end
    object QryBolsaBmfVLRAJUSTE: TFloatField
      DisplayLabel = 'Ajuste'
      DisplayWidth = 15
      FieldName = 'VLRAJUSTE'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryBolsaBmfVLRFINANCEIRO: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCEIRO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryBolsaBmfIDFDOCARTACOES: TFloatField
      FieldName = 'IDFDOCARTACOES'
      Visible = False
    end
    object QryBolsaBmfDATAMOV: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMOV'
      Visible = False
    end
  end
  object DsBolsaBmf: TwwDataSource
    AutoEdit = False
    DataSet = QryBolsaBmf
    Left = 334
    Top = 319
  end
  object updBolsaBmf: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOCARTACOES'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  DATAMOV = :DATAMOV,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLRAJUSTE = :VLRAJUSTE,'
      '  VLRFINANCEIRO = :VLRFINANCEIRO,'
      '  STAATIVPASS = :STAATIVPASS'
      'where'
      '  IDFDOCARTACOES = :OLD_IDFDOCARTACOES')
    InsertSQL.Strings = (
      'insert into FDOCARTACOES'
      '  (IDFDOCARTACOES, DESCFUNDOINVEST, DESCINVESTIMENTO, DATAMOV, '
      'QUANTIDADE, '
      '   VLRAJUSTE, VLRFINANCEIRO, STAATIVPASS)'
      'values'
      
        '  (:IDFDOCARTACOES, :DESCFUNDOINVEST, :DESCINVESTIMENTO, :DATAMO' +
        'V, '
      ':QUANTIDADE, '
      '   :VLRAJUSTE, :VLRFINANCEIRO, :STAATIVPASS)')
    DeleteSQL.Strings = (
      'delete from FDOCARTACOES'
      'where'
      '  IDFDOCARTACOES = :OLD_IDFDOCARTACOES')
    Left = 334
    Top = 376
  end
  object QrySwap: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOSWAP, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIGO, DATA' +
        'OPER, DATACOMPRA, DATAVENCIMENTO,'
      
        '       VLRPRINCIPAL, INDEXADORPASS, TAXAPASSIVO, VLRFINANCPASS, ' +
        'INDEXADORATIVO, TAXAATIVO,'
      
        '       VLRFINANCATIVO, TAXAPASSIVOPRE, TAXAATIVOPRE, EMISSOR, ST' +
        'AGARANTIA'
      'FROM   FDOSWAP FS,'
      
        '      (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE  FS.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       FS.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '      (FS.IDFUNDOINVEST     =:IDFUNDOINVEST))    OR'
      '        (:IDFUNDOINVEST IS NULL) )               AND'
      '       FI.IDFUNDOINVEST     = FS.IDFUNDOINVEST'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSwap
    ValidateWithMask = True
    Left = 398
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QrySwapDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 20
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySwapDESCCONTRAPARTE: TStringField
      DisplayLabel = 'Contraparte'
      DisplayWidth = 20
      FieldName = 'DESCCONTRAPARTE'
      Size = 60
    end
    object QrySwapCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODIGO'
    end
    object QrySwapDATACOMPRA: TDateTimeField
      DisplayLabel = 'Data da~Compra'
      DisplayWidth = 10
      FieldName = 'DATACOMPRA'
    end
    object QrySwapDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data do~Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object QrySwapVLRPRINCIPAL: TFloatField
      DisplayLabel = 'Principal'
      DisplayWidth = 18
      FieldName = 'VLRPRINCIPAL'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QrySwapINDEXADORPASS: TStringField
      DisplayLabel = 'Indexador'
      DisplayWidth = 10
      FieldName = 'INDEXADORPASS'
    end
    object QrySwapTAXAPASSIVO: TFloatField
      DisplayLabel = 'Passivo~Taxa'
      DisplayWidth = 7
      FieldName = 'TAXAPASSIVO'
      DisplayFormat = '###,###0.00'
    end
    object QrySwapVLRFINANCPASS: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCPASS'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QrySwapINDEXADORATIVO: TStringField
      DisplayLabel = 'Indexador'
      DisplayWidth = 10
      FieldName = 'INDEXADORATIVO'
    end
    object QrySwapTAXAATIVO: TFloatField
      DisplayLabel = 'Ativo~Taxa'
      DisplayWidth = 7
      FieldName = 'TAXAATIVO'
      DisplayFormat = '###,###0.00'
    end
    object QrySwapVLRFINANCATIVO: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCATIVO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QrySwapTAXAPASSIVOPRE: TFloatField
      DisplayLabel = 'Passivo Taxa~Pré (a.a.)'
      DisplayWidth = 10
      FieldName = 'TAXAPASSIVOPRE'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QrySwapTAXAATIVOPRE: TFloatField
      DisplayLabel = 'Ativo Taxa~Pré (a.a.)'
      DisplayWidth = 10
      FieldName = 'TAXAATIVOPRE'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QrySwapEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 20
      FieldName = 'EMISSOR'
      Size = 30
    end
    object QrySwapSTAGARANTIA: TStringField
      DisplayLabel = 'Depósito em~Garantia S/N'
      DisplayWidth = 1
      FieldName = 'STAGARANTIA'
      FixedChar = True
      Size = 1
    end
    object QrySwapIDFDOSWAP: TFloatField
      FieldName = 'IDFDOSWAP'
      Visible = False
    end
    object QrySwapDATAOPER: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAOPER'
      Visible = False
    end
  end
  object DsSwap: TwwDataSource
    AutoEdit = False
    DataSet = QrySwap
    Left = 398
    Top = 319
  end
  object updSwap: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOSWAP'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCCONTRAPARTE = :DESCCONTRAPARTE,'
      '  CODIGO = :CODIGO,'
      '  DATAOPER = :DATAOPER,'
      '  DATACOMPRA = :DATACOMPRA,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRPRINCIPAL = :VLRPRINCIPAL,'
      '  INDEXADORPASS = :INDEXADORPASS,'
      '  TAXAPASSIVO = :TAXAPASSIVO,'
      '  VLRFINANCPASS = :VLRFINANCPASS,'
      '  INDEXADORATIVO = :INDEXADORATIVO,'
      '  TAXAATIVO = :TAXAATIVO,'
      '  VLRFINANCATIVO = :VLRFINANCATIVO,'
      '  TAXAPASSIVOPRE = :TAXAPASSIVOPRE,'
      '  TAXAATIVOPRE = :TAXAATIVOPRE,'
      '  EMISSOR = :EMISSOR,'
      '  STAGARANTIA = :STAGARANTIA'
      'where'
      '  IDFDOSWAP = :OLD_IDFDOSWAP')
    InsertSQL.Strings = (
      'insert into FDOSWAP'
      '  (IDFDOSWAP, DESCFUNDOINVEST, DESCCONTRAPARTE, CODIGO, '
      'DATAOPER, DATACOMPRA, '
      '   DATAVENCIMENTO, VLRPRINCIPAL, INDEXADORPASS, TAXAPASSIVO, '
      'VLRFINANCPASS, '
      '   INDEXADORATIVO, TAXAATIVO, VLRFINANCATIVO, TAXAPASSIVOPRE, '
      'TAXAATIVOPRE, '
      '   EMISSOR, STAGARANTIA)'
      'values'
      '  (:IDFDOSWAP, :DESCFUNDOINVEST, :DESCCONTRAPARTE, :CODIGO, '
      ':DATAOPER, '
      '   :DATACOMPRA, :DATAVENCIMENTO, :VLRPRINCIPAL, :INDEXADORPASS, '
      ':TAXAPASSIVO, '
      
        '   :VLRFINANCPASS, :INDEXADORATIVO, :TAXAATIVO, :VLRFINANCATIVO,' +
        ' '
      ':TAXAPASSIVOPRE, '
      '   :TAXAATIVOPRE, :EMISSOR, :STAGARANTIA)')
    DeleteSQL.Strings = (
      'delete from FDOSWAP'
      'where'
      '  IDFDOSWAP = :OLD_IDFDOSWAP')
    Left = 400
    Top = 376
  end
  object QryDespCorret: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDODESPCORRET, DESCFUNDOINVEST, DESCCORRETORA, TIPOCORR' +
        'ETORA, CNPJCORRETORA, NUMOPERACAO,'
      
        '       VLRTABBOVESPA, VLRDEVBOVESPA, VLREFEPGBOVESPA, VLRTABBMF,' +
        ' VLRDEVBMF, VLREFEPGBMF,'
      '       VLRTABBOLSA, VLRDEVBOLSA, VLREFEPGBOLSA'
      'FROM   FDODESPCORRET FD,'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE  FD.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       FD.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)        AND'
      '      (FD.IDFUNDOINVEST  = :IDFUNDOINVEST)) OR'
      '        (:IDFUNDOINVEST IS NULL) )          AND'
      '       FI.IDFUNDOINVEST  = FD.IDFUNDOINVEST'
      ' '
      ' '
      ' ')
    UpdateObject = updDespCorret
    ValidateWithMask = True
    Left = 470
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryDespCorretDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 20
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryDespCorretDESCCORRETORA: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 20
      FieldName = 'DESCCORRETORA'
      Size = 60
    end
    object QryDespCorretTIPOCORRETORA: TStringField
      DisplayLabel = 'Tipo de Corretora'
      DisplayWidth = 20
      FieldName = 'TIPOCORRETORA'
    end
    object QryDespCorretCNPJCORRETORA: TStringField
      DisplayLabel = 'CNPJ da Corretora'
      DisplayWidth = 18
      FieldName = 'CNPJCORRETORA'
      Size = 18
    end
    object QryDespCorretNUMOPERACAO: TFloatField
      DisplayLabel = 'Número de~Operações'
      DisplayWidth = 10
      FieldName = 'NUMOPERACAO'
    end
    object QryDespCorretVLRTABBOVESPA: TFloatField
      DisplayLabel = 'BOVESPA~Valores de~Tabela'
      DisplayWidth = 10
      FieldName = 'VLRTABBOVESPA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLRDEVBOVESPA: TFloatField
      DisplayLabel = 'BOVESPA~Devolução'
      DisplayWidth = 10
      FieldName = 'VLRDEVBOVESPA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLREFEPGBOVESPA: TFloatField
      DisplayLabel = 'BOVESPA~Valor Efetivamente~Pago'
      DisplayWidth = 17
      FieldName = 'VLREFEPGBOVESPA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLRTABBMF: TFloatField
      DisplayLabel = 'BM&F~Valores de~Tabela'
      DisplayWidth = 10
      FieldName = 'VLRTABBMF'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLRDEVBMF: TFloatField
      DisplayLabel = 'BM&F~Devolução'
      DisplayWidth = 10
      FieldName = 'VLRDEVBMF'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLREFEPGBMF: TFloatField
      DisplayLabel = 'BM&F~Valor Efetivamente~Pago'
      DisplayWidth = 17
      FieldName = 'VLREFEPGBMF'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLRTABBOLSA: TFloatField
      DisplayLabel = 'BOLSA~Valores de~Tabela'
      DisplayWidth = 10
      FieldName = 'VLRTABBOLSA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLRDEVBOLSA: TFloatField
      DisplayLabel = 'BOLSA~Devolução'
      DisplayWidth = 10
      FieldName = 'VLRDEVBOLSA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretVLREFEPGBOLSA: TFloatField
      DisplayLabel = 'BOLSA~Valor Efetivamente~Pago'
      DisplayWidth = 17
      FieldName = 'VLREFEPGBOLSA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespCorretIDFDODESPCORRET: TFloatField
      FieldName = 'IDFDODESPCORRET'
      Visible = False
    end
  end
  object DsDespCorret: TwwDataSource
    AutoEdit = False
    DataSet = QryDespCorret
    Left = 470
    Top = 319
  end
  object updDespCorret: TUpdateSQL
    ModifySQL.Strings = (
      'update FDODESPCORRET'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCCORRETORA = :DESCCORRETORA,'
      '  TIPOCORRETORA = :TIPOCORRETORA,'
      '  CNPJCORRETORA = :CNPJCORRETORA,'
      '  NUMOPERACAO = :NUMOPERACAO,'
      '  VLRTABBOVESPA = :VLRTABBOVESPA,'
      '  VLRDEVBOVESPA = :VLRDEVBOVESPA,'
      '  VLREFEPGBOVESPA = :VLREFEPGBOVESPA,'
      '  VLRTABBMF = :VLRTABBMF,'
      '  VLRDEVBMF = :VLRDEVBMF,'
      '  VLREFEPGBMF = :VLREFEPGBMF,'
      '  VLRTABBOLSA = :VLRTABBOLSA,'
      '  VLRDEVBOLSA = :VLRDEVBOLSA,'
      '  VLREFEPGBOLSA = :VLREFEPGBOLSA'
      'where'
      '  IDFDODESPCORRET = :OLD_IDFDODESPCORRET')
    InsertSQL.Strings = (
      'insert into FDODESPCORRET'
      '  (IDFDODESPCORRET, DESCFUNDOINVEST, DESCCORRETORA, '
      'TIPOCORRETORA, CNPJCORRETORA, '
      '   NUMOPERACAO, VLRTABBOVESPA, VLRDEVBOVESPA, VLREFEPGBOVESPA, '
      'VLRTABBMF, '
      '   VLRDEVBMF, VLREFEPGBMF, VLRTABBOLSA, VLRDEVBOLSA, '
      'VLREFEPGBOLSA)'
      'values'
      '  (:IDFDODESPCORRET, :DESCFUNDOINVEST, :DESCCORRETORA, '
      ':TIPOCORRETORA, '
      
        '   :CNPJCORRETORA, :NUMOPERACAO, :VLRTABBOVESPA, :VLRDEVBOVESPA,' +
        ' '
      ':VLREFEPGBOVESPA, '
      '   :VLRTABBMF, :VLRDEVBMF, :VLREFEPGBMF, :VLRTABBOLSA, '
      ':VLRDEVBOLSA, :VLREFEPGBOLSA)')
    DeleteSQL.Strings = (
      'delete from FDODESPCORRET'
      'where'
      '  IDFDODESPCORRET = :OLD_IDFDODESPCORRET')
    Left = 472
    Top = 376
  end
  object QryOutrasContas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOOUTRASCONTAS, DESCFUNDOINVEST, DESCOUTRASCONTAS, VLR' +
        'CONTAS'
      'FROM   FDOOUTRASCONTAS FC,'
      
        '      (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE  FC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       FC.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)            AND'
      '      (FC.IDFUNDOINVEST     = :IDFUNDOINVEST))  OR'
      '        (:IDFUNDOINVEST IS NULL) )              AND'
      '       FI.IDFUNDOINVEST     = FC.IDFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updOutrasContas
    ValidateWithMask = True
    Left = 553
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryOutrasContasDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryOutrasContasDESCOUTRASCONTAS: TStringField
      DisplayLabel = 'Contas'
      DisplayWidth = 44
      FieldName = 'DESCOUTRASCONTAS'
      Size = 60
    end
    object QryOutrasContasVLRCONTAS: TFloatField
      DisplayLabel = 'Valor das Contas'
      DisplayWidth = 20
      FieldName = 'VLRCONTAS'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryOutrasContasIDFDOOUTRASCONTAS: TFloatField
      FieldName = 'IDFDOOUTRASCONTAS'
      Visible = False
    end
  end
  object DsOutrasContas: TwwDataSource
    AutoEdit = False
    DataSet = QryOutrasContas
    Left = 553
    Top = 319
  end
  object updOutrasContas: TUpdateSQL
    ModifySQL.Strings = (
      'update FDOOUTRASCONTAS'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  DESCOUTRASCONTAS = :DESCOUTRASCONTAS,'
      '  VLRCONTAS = :VLRCONTAS'
      'where'
      '  IDFDOOUTRASCONTAS = :OLD_IDFDOOUTRASCONTAS')
    InsertSQL.Strings = (
      'insert into FDOOUTRASCONTAS'
      '  (IDFDOOUTRASCONTAS, DESCFUNDOINVEST, DESCOUTRASCONTAS, '
      'VLRCONTAS)'
      'values'
      '  (:IDFDOOUTRASCONTAS, :DESCFUNDOINVEST, :DESCOUTRASCONTAS, '
      ':VLRCONTAS)')
    DeleteSQL.Strings = (
      'delete from FDOOUTRASCONTAS'
      'where'
      '  IDFDOOUTRASCONTAS = :OLD_IDFDOOUTRASCONTAS')
    Left = 555
    Top = 376
  end
  object QryOperCompr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFDOOPERCOMPR, DESCFUNDOINVEST, DESCCONTRAPARTE, LASTRO,' +
        ' DATAOPER, DATAEMISSAO, DATAVENCIMENTO,'
      
        '       STAATIVPASS, QUANTIDADE, TAXA, INDEXADOR, PUCOMPRA, PUVEN' +
        'CIMENTO, VLRFINANCEIRO,'
      
        '       DESCCTRPAROPER, INDEXADORCTRPAR, PERCTRPAROPER, TAXACTRPA' +
        'ROPER, DATARELOPER, DATAREVEROPER'
      'FROM   FDOOPERCOMPR OC,'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      
        '           WHERE (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FI'
      'WHERE'
      '       OC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          AND'
      '       OC.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)                      AND'
      '      (OC.IDFUNDOINVEST     = :IDFUNDOINVEST))            OR'
      '        (:IDFUNDOINVEST IS NULL) )                        AND'
      '       FI.IDFUNDOINVEST     = OC.IDFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updOperCompr
    ValidateWithMask = True
    Left = 97
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryOperComprDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 20
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryOperComprDESCCONTRAPARTE: TStringField
      DisplayLabel = 'Contraparte'
      DisplayWidth = 20
      FieldName = 'DESCCONTRAPARTE'
      Size = 60
    end
    object QryOperComprLASTRO: TStringField
      DisplayLabel = 'Lastro'
      DisplayWidth = 10
      FieldName = 'LASTRO'
    end
    object QryOperComprDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data de Emissão~do Lastro'
      DisplayWidth = 14
      FieldName = 'DATAEMISSAO'
    end
    object QryOperComprDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data de~Vencimento'
      DisplayWidth = 14
      FieldName = 'DATAVENCIMENTO'
    end
    object QryOperComprSTAATIVPASS: TStringField
      DisplayLabel = 'Ativo /~Passivo'
      DisplayWidth = 7
      FieldName = 'STAATIVPASS'
      FixedChar = True
      Size = 1
    end
    object QryOperComprQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 18
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###'
    end
    object QryOperComprTAXA: TFloatField
      DisplayLabel = 'Taxa'
      DisplayWidth = 10
      FieldName = 'TAXA'
      DisplayFormat = '###,###0.00'
    end
    object QryOperComprINDEXADOR: TStringField
      DisplayLabel = 'Indexador'
      DisplayWidth = 10
      FieldName = 'INDEXADOR'
    end
    object QryOperComprPUCOMPRA: TFloatField
      DisplayLabel = 'Pu de Compra'
      DisplayWidth = 15
      FieldName = 'PUCOMPRA'
      DisplayFormat = '###,###0.00'
    end
    object QryOperComprPUVENCIMENTO: TFloatField
      DisplayLabel = 'Pu de Vencimento'
      DisplayWidth = 15
      FieldName = 'PUVENCIMENTO'
      DisplayFormat = '###,###0.00'
    end
    object QryOperComprVLRFINANCEIRO: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRFINANCEIRO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryOperComprDESCCTRPAROPER: TStringField
      DisplayLabel = 'Contraparte da~Operação'
      DisplayWidth = 20
      FieldName = 'DESCCTRPAROPER'
      Size = 60
    end
    object QryOperComprINDEXADORCTRPAR: TStringField
      DisplayLabel = 'Indexador da~Operação'
      DisplayWidth = 10
      FieldName = 'INDEXADORCTRPAR'
    end
    object QryOperComprPERCTRPAROPER: TFloatField
      DisplayLabel = '% do Indexador~da Operação'
      DisplayWidth = 10
      FieldName = 'PERCTRPAROPER'
      DisplayFormat = '###,###0.00'
    end
    object QryOperComprTAXACTRPAROPER: TFloatField
      DisplayLabel = 'Cupon/Taxa~da Operação'
      DisplayWidth = 10
      FieldName = 'TAXACTRPAROPER'
      DisplayFormat = '###,###0.00'
    end
    object QryOperComprDATARELOPER: TDateTimeField
      DisplayLabel = 'Realização~da operação'
      DisplayWidth = 10
      FieldName = 'DATARELOPER'
    end
    object QryOperComprDATAREVEROPER: TDateTimeField
      DisplayLabel = 'Reversão da~Operação'
      DisplayWidth = 10
      FieldName = 'DATAREVEROPER'
    end
    object QryOperComprIDFDOOPERCOMPR: TFloatField
      FieldName = 'IDFDOOPERCOMPR'
      Visible = False
    end
    object QryOperComprDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
      Visible = False
    end
  end
  object DsOperCompr: TwwDataSource
    AutoEdit = False
    DataSet = QryOperCompr
    Left = 97
    Top = 316
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'MOVIMENTO.DATA'
      'HISTFUNDOINVEST.DESCFUNDOINVEST'
      'MOVIMENTO.TIPOMOV'
      'PLANO.PLANPRVCONTABPATRO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data'
      'Fundo de Investimento'
      'Tipo de Movimento'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      
        '(SELECT FDOCARTACOES.IDFUNDOINVEST, '#39'Bolsas (BM&F e BOVESPA)'#39' AS' +
        ' TIPOMOV, FDOCARTACOES.IDPLANPREVCTBPATR, FDOCARTACOES.DATAMOV A' +
        'S DATA FROM FDOCARTACOES GROUP BY FDOCARTACOES.IDFUNDOINVEST, FD' +
        'OCARTACOES.IDPLANPREVCTBPATR, FDOCARTACOES.DATAMOV UNION SELECT ' +
        '   FDOOUTRASCONTAS.IDFUNDOINVEST, '#39'Outras Contas'#39' AS TIPOMOV,   ' +
        ' FDOOUTRASCONTAS.IDPLANPREVCTBPATR,    FDOOUTRASCONTAS.DATAOPER ' +
        'AS DATA FROM FDOOUTRASCONTAS GROUP BY FDOOUTRASCONTAS.IDFUNDOINV' +
        'EST, FDOOUTRASCONTAS.IDPLANPREVCTBPATR, FDOOUTRASCONTAS.DATAOPER' +
        ' UNION SELECT    FDOOPERCOMPR.IDFUNDOINVEST, '#39'Operações Compromi' +
        'ssadas'#39' AS TIPOMOV,    FDOOPERCOMPR.IDPLANPREVCTBPATR,    FDOOPE' +
        'RCOMPR.DATAOPER AS DATA FROM FDOOPERCOMPR GROUP BY FDOOPERCOMPR.' +
        'IDFUNDOINVEST, FDOOPERCOMPR.IDPLANPREVCTBPATR, FDOOPERCOMPR.DATA' +
        'OPER UNION SELECT    FDOTITPRIVADOS.IDFUNDOINVEST, '#39'Títulos Priv' +
        'ados'#39' AS TIPOMOV, FDOTITPRIVADOS.IDPLANPREVCTBPATR,    FDOTITPRI' +
        'VADOS.DATAOPER AS DATA FROM FDOTITPRIVADOS GROUP BY FDOTITPRIVAD' +
        'OS.IDFUNDOINVEST, FDOTITPRIVADOS.IDPLANPREVCTBPATR, FDOTITPRIVAD' +
        'OS.DATAOPER UNION SELECT     FDOTITPUBLICOS.IDFUNDOINVEST, '#39'Títu' +
        'los Públicos'#39' AS TIPOMOV, FDOTITPUBLICOS.IDPLANPREVCTBPATR,     ' +
        'FDOTITPUBLICOS.DATAOPER AS DATA FROM FDOTITPUBLICOS GROUP BY FDO' +
        'TITPUBLICOS.IDFUNDOINVEST, FDOTITPUBLICOS.IDPLANPREVCTBPATR, FDO' +
        'TITPUBLICOS.DATAOPER UNION SELECT     FDOSWAP.IDFUNDOINVEST, '#39'SW' +
        'AP'#39' AS TIPOMOV, FDOSWAP.IDPLANPREVCTBPATR,     FDOSWAP.DATAOPER ' +
        'AS DATA FROM FDOSWAP GROUP BY FDOSWAP.IDFUNDOINVEST, FDOSWAP.IDP' +
        'LANPREVCTBPATR, FDOSWAP.DATAOPER UNION SELECT    FDODESPCORRET.I' +
        'DFUNDOINVEST, '#39'Despesas com Corretagem'#39' AS TIPOMOV, FDODESPCORRE' +
        'T.IDPLANPREVCTBPATR,    FDODESPCORRET.DATAOPER AS DATA FROM FDOD' +
        'ESPCORRET GROUP BY FDODESPCORRET.IDFUNDOINVEST, FDODESPCORRET.ID' +
        'PLANPREVCTBPATR, FDODESPCORRET.DATAOPER) MOVIMENTO'
      'VWPLANPREVCTBPATR PLANO'
      'HISTFUNDOINVEST')
    CamposChave.Strings = (
      'HISTFUNDOINVEST.IDFUNDOINVEST'
      'MOVIMENTO.IDPLANPREVCTBPATR'
      'MOVIMENTO.DATA')
    Filtro.Strings = (
      'PLANO.IDPLANPREVCTBPATR = MOVIMENTO.IDPLANPREVCTBPATR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '25'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 112
    Top = 3
  end
end
