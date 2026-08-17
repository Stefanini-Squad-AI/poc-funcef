inherited frmPagamentoPendente: TfrmPagamentoPendente
  Left = 151
  Top = 145
  HelpContext = 180011
  Caption = 'Processa Prévia de Pagamentos Pendentes'
  ClientHeight = 512
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 473
    object PageControlPag: TPageControl
      Left = 1
      Top = 107
      Width = 790
      Height = 365
      ActivePage = tbsOpcoes
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsOpcoes: TTabSheet
        Caption = 'Opções'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 239
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 0
            Top = 115
            Width = 3
            Height = 124
            Cursor = crHSplit
          end
          object Splitter2: TSplitter
            Left = 0
            Top = 77
            Width = 782
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object Panel3: TPanel
            Left = 3
            Top = 115
            Width = 779
            Height = 124
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 0
              Top = 0
              Width = 779
              Height = 20
              Align = alTop
              Alignment = taCenter
              Caption = 'Novos Pagamentos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbgrnovospagamentos: TwwDBGrid
              Left = 0
              Top = 20
              Width = 779
              Height = 104
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Contas/Caixa x Forma de Pagamento'#9'F'
                'MATRICULA'#9'11'#9'Matrícula'#9'F'
                'NOME'#9'30'#9'Recebedor'#9'F'
                'HISTORICO'#9'50'#9'Histórico da Versão'#9'F')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsNovoPagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              OnColExit = dbgrnovospagamentosColExit
              OnEnter = dbgrnovospagamentosEnter
              IndicatorColor = icBlack
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 782
            Height = 77
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label4: TLabel
              Left = 0
              Top = 0
              Width = 782
              Height = 20
              Align = alTop
              Alignment = taCenter
              Caption = 'Pagamentos Pendentes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbgrpagamentospendentes: TwwDBGrid
              Left = 0
              Top = 20
              Width = 782
              Height = 57
              Selected.Strings = (
                'MATRICULA'#9'13'#9'Matrícula'
                'NOME'#9'40'#9'Nome')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsPagtoPendente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              OnEnter = dbgrpagamentospendentesEnter
              IndicatorColor = icBlack
            end
          end
          object pnlControle: TPanel
            Left = 0
            Top = 80
            Width = 782
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object lblNovoContasCaixa: TLabel
              Left = 2
              Top = 6
              Width = 102
              Height = 26
              Caption = 'Novo Contas Caixa x Forma de Pagamento'
              WordWrap = True
            end
            object Label13: TLabel
              Left = 379
              Top = 13
              Width = 53
              Height = 13
              Caption = 'Recebedor'
            end
            object bbtnExcluiPagto: TfcShapeBtn
              Left = 748
              Top = 6
              Width = 28
              Height = 27
              Anchors = [akTop, akRight]
              Color = clBtnFace
              DitherColor = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
                3333333333777F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
                3333333777737777F333333099999990333333373F3333373333333309999903
                333333337F33337F33333333099999033333333373F333733333333330999033
                3333333337F337F3333333333099903333333333373F37333333333333090333
                33333333337F7F33333333333309033333333333337373333333333333303333
                333333333337F333333333333330333333333333333733333333}
              NumGlyphs = 2
              Options = [boFocusable]
              ParentClipping = True
              ParentFont = False
              RoundRectBias = 25
              ShadeStyle = fbsFlat
              TabOrder = 0
              TabStop = True
              TextOptions.Alignment = taCenter
              TextOptions.VAlignment = vaVCenter
              OnClick = bbtnExcluiPagtoClick
            end
            object bbtnIncluiNovoPagto: TfcShapeBtn
              Left = 716
              Top = 6
              Width = 28
              Height = 27
              Anchors = [akTop, akRight]
              Color = clBtnFace
              DitherColor = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
                333333333337F33333333333333033333333333333373F333333333333090333
                33333333337F7F33333333333309033333333333337373F33333333330999033
                3333333337F337F33333333330999033333333333733373F3333333309999903
                333333337F33337F33333333099999033333333373333373F333333099999990
                33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333300033333333333337773333333}
              NumGlyphs = 2
              Options = [boFocusable]
              ParentClipping = True
              ParentFont = False
              RoundRectBias = 25
              ShadeStyle = fbsFlat
              TabOrder = 1
              TabStop = True
              TextOptions.Alignment = taCenter
              TextOptions.VAlignment = vaVCenter
              OnClick = bbtnIncluiNovoPagtoClick
            end
            object dblkPortadorForma: TwwDBLookupCombo
              Left = 108
              Top = 9
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F'
                'CODPORTFORMA'#9'10'#9'Código'#9'F')
              LookupTable = qryPortadorForma
              LookupField = 'DESCRICAO'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              UseTFields = False
              AllowClearKey = False
              ShowMatchText = True
            end
            object cmbRecebedor: TwwDBLookupCombo
              Left = 438
              Top = 9
              Width = 272
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Favorecido'#9'F'
                'IDPESSOA'#9'10'#9'Identificador'#9'F')
              LookupTable = qryNovoRecebedor
              LookupField = 'NOME'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 239
          Width = 782
          Height = 98
          Align = alBottom
          TabOrder = 1
          object lblCAPParticip: TLabel
            Left = 1
            Top = 1
            Width = 780
            Height = 19
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = '  Rubricas do Pagamento selecionado'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object lblValorLiquido: TLabel
            Left = 1
            Top = 75
            Width = 780
            Height = 22
            Align = alBottom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor Líquido : R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object dbgrCAPParticip: TwwDBGrid
            Left = 1
            Top = 20
            Width = 780
            Height = 55
            Selected.Strings = (
              'MES'#9'7'#9'Mês Ref.'
              'CODIGO'#9'10'#9'Código'
              'RUBRICA'#9'67'#9'Descrição da Rubrica'
              'ESTADO'#9'6'#9'P/D/I'
              'VALOR'#9'10'#9'Valor')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = []
            Align = alClient
            DataSource = dsRubricasRecebedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        inline FrameProgresso: TfrmFrameProgresso
          Width = 782
          Height = 337
          Align = alClient
          PopupMenu = FrameProgresso.PopupMenu1
          inherited Panel1: TPanel
            Width = 782
            Height = 309
            inherited toolControles: TToolBar
              Width = 780
              inherited lblNomeLog: TLabel
                Width = 772
              end
            end
            inherited redResultado: TRichEdit
              Width = 780
              Height = 267
              Lines.Strings = ()
            end
          end
          inherited BarraProgresso: TProgressBar
            Top = 309
            Width = 782
          end
          inherited StatusBar1: TStatusBar
            Top = 318
            Width = 782
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object grpMesRef: TGroupBox
        Left = 0
        Top = 0
        Width = 157
        Height = 57
        Align = alLeft
        Caption = ' Mês e Ano de Pagamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 9
          Top = 22
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = cmbMesChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object spnedAno: TSpinEdit
          Left = 92
          Top = 22
          Width = 56
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
          OnChange = spnedAnoChange
        end
      end
      object StaticText1: TStaticText
        Left = 383
        Top = 77
        Width = 250
        Height = 27
        Caption = 'Informações para a Prévia'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox5: TGroupBox
        Left = 157
        Top = 0
        Width = 99
        Height = 57
        Align = alLeft
        Caption = 'Lote'
        TabOrder = 2
        object dblkLote: TwwDBLookupCombo
          Left = 6
          Top = 22
          Width = 87
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'IDLOTE'#9'10'#9'nº do Lote'#9'F'
            'HIFEN'#9'3'#9#9'F'
            'MESREFERENCIA'#9'7'#9'Mês de Referência'#9'F'
            'DESCRICAO'#9'200'#9'Descrição do Lote'#9'F')
          LookupTable = qryLotes
          LookupField = 'IDLOTE'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblkLoteCloseUp
        end
      end
      object GroupBox3: TGroupBox
        Left = 256
        Top = 0
        Width = 294
        Height = 57
        Align = alLeft
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object lbDescricao: TLabel
          Left = 8
          Top = 18
          Width = 279
          Height = 35
          AutoSize = False
          Caption = 'lbDescricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
      end
      object GroupBox2: TGroupBox
        Left = 550
        Top = 0
        Width = 125
        Height = 57
        Align = alLeft
        Caption = ' Previsão de Pagto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object lbDataFolha: TLabel
          Left = 19
          Top = 21
          Width = 102
          Height = 13
          AutoSize = False
          Caption = 'lbDataFolha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object fcsbbtnPrevia: TfcShapeBtn
        Left = 682
        Top = 10
        Width = 97
        Height = 38
        Caption = 'Processar'#13#10'Prévia'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Enabled = False
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
          44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
          00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
          33833F333383F33300003333AA463362A433333333383F333833F33300003333
          6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
          33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
          6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
          000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
          333383333333F3330000333333322AAA4333333333333833333F333300003333
          333322A4333333333333338333F333330000333333344A433333333333333338
          3F333333000033333336A24333333333333333833F333333000033333336AA43
          33333333333333833F3333330000333333336663333333333333333888333333
          0000}
        NumGlyphs = 2
        Offsets.TextX = 2
        Offsets.ImageDownX = 1
        Offsets.ImageDownY = 1
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 20
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        Spacing = 1
        TabOrder = 5
        TextOptions.Alignment = taCenter
        TextOptions.LineSpacing = 1
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 1
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbbtnPreviaClick
      end
      object grbTipodeBusca: TGroupBox
        Left = 0
        Top = 57
        Width = 790
        Height = 49
        Align = alBottom
        Caption = 'Tipo de Busca'
        TabOrder = 6
        object lbMatricula: TLabel
          Left = 408
          Top = 16
          Width = 353
          Height = 25
          AutoSize = False
          Caption = 'lbMatricula'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rdbBuscaTodos: TRadioButton
          Left = 13
          Top = 20
          Width = 132
          Height = 17
          Caption = 'Todos'
          TabOrder = 0
          OnClick = rdbBuscaTodosClick
        end
        object rdbIndividual: TRadioButton
          Left = 150
          Top = 20
          Width = 131
          Height = 17
          Caption = 'Individual'
          TabOrder = 1
          OnClick = rdbIndividualClick
        end
        object btnProcurar: TBitBtn
          Left = 301
          Top = 14
          Width = 92
          Height = 25
          Caption = 'Procurar'
          Enabled = False
          TabOrder = 2
          OnClick = btnProcurarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 584
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 415
      DockPos = 415
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 387
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryPagtoPendente: TwwQuery
    AfterScroll = qryPagtoPendenteAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT H.CODPORTFORMA, E.MATRICULA, H.MESCOBRANCA, H.ID' +
        'TITULAR,'
      
        #9'      H.IDRESPONSAVEL AS IDPESSOA, H.IDHSTFOLHABENEF as idrefer' +
        'encia, P.NOME'
      'FROM HISTRUBSAL H, ELEGPATRO E, PESSOA P'
      'WHERE H.FLGESTORNO = 1'
      'AND H.IDMODULO = 18'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND NOT EXISTS (SELECT 1'
      '                FROM LISTAFOLHABENEFDET L'
      '                WHERE L.IDLISTA = 0'
      '                AND L.IDREFERENCIA = H.IDHSTFOLHABENEF'
      '                AND L.IDTITULAR = H.IDTITULAR'
      '                AND L.IDREFERENCIA3 = H.IDRESPONSAVEL)'
      'AND E.IDPESSJUR = H.IDPATRO'
      'AND E.IDPESSOA = H.IDTITULAR'
      'AND P.IDPESSOA = H.IDRESPONSAVEL'
      'AND E.MATRICULA = '#39'1'#39
      'ORDER BY E.MATRICULA, P.NOME,H.IDHSTFOLHABENEF'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 221
    Top = 434
    object qryPagtoPendenteMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryPagtoPendenteNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object qryPagtoPendenteCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryPagtoPendenteMESCOBRANCA: TStringField
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object qryPagtoPendenteIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryPagtoPendenteIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPagtoPendenteIDREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREFERENCIA'
      Visible = False
    end
  end
  object dsPagtoPendente: TwwDataSource
    DataSet = qryPagtoPendente
    Left = 250
    Top = 442
  end
  object qryNovoPagto: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    Constrained = True
    RequestLive = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '  E.MATRICULA,'
      '  P.NOME,'
      '  HFB.HISTORICO,'
      '  L.IDTITULAR,'
      '  L.IDREFERENCIA3 AS IDPESSOA,'
      '  L.IDPESSOA AS IDNOVORECEBEDOR,'
      '  L.IDREFERENCIA,'
      '  PF.CODPORTFORMA,'
      '  PF.DESCRICAO'
      'FROM'
      '  LISTAFOLHABENEFDET L,'
      '  HSTFOLHABENEF HFB,'
      '  PESSOA P,'
      '  ELEGPATRO E,'
      '  PORTADORFORMA PF,'
      '  HISTRUBSAL H'
      'WHERE L.IDLISTA       = 0'
      '  AND L.IDPESSOA      = P.IDPESSOA'
      '  AND L.IDREFERENCIA  = HFB.IDHSTFOLHABENEF'
      '  AND E.IDPESSOA      = L.IDTITULAR'
      '  AND L.IDREFERENCIA2 = PF.CODPORTFORMA'
      '  AND H.IDHSTFOLHABENEF = HFB.IDHSTFOLHABENEF'
      '  AND H.IDTITULAR = L.IDTITULAR'
      '  AND H.IDPATRO = E.IDPESSJUR'
      '  AND H.IDRESPONSAVEL = L.IDREFERENCIA3'
      'ORDER BY'
      '  E.MATRICULA,'
      '  P.NOME,'
      '  L.IDREFERENCIA')
    UpdateObject = updNovoPagto
    ValidateWithMask = True
    Left = 152
    Top = 442
    object qryNovoPagtoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.ELEGPATRO.MATRICULA'
      Size = 13
    end
    object qryNovoPagtoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryNovoPagtoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryNovoPagtoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDTITULAR'
    end
    object qryNovoPagtoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDPESSOA'
    end
    object qryNovoPagtoIDREFERENCIA: TFloatField
      FieldName = 'IDREFERENCIA'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDREFERENCIA'
    end
    object qryNovoPagtoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
    end
    object qryNovoPagtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryNovoPagtoIDNOVORECEBEDOR: TFloatField
      FieldName = 'IDNOVORECEBEDOR'
    end
  end
  object dsNovoPagto: TwwDataSource
    DataSet = qryNovoPagto
    Left = 185
    Top = 442
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 119
    Top = 442
  end
  object dsRubricasRecebedor: TwwDataSource
    DataSet = qryRubricasRecebedor
    Left = 317
    Top = 443
  end
  object qryRubricaPagar: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      
        'SELECT H.MESCOBRANCA, H.MES, H.IDPATRO, H.IDHSTFOLHABENEF, H.FON' +
        'TEPAGADORA,'
      '       H.IDPLANOPREV, H.IDPESSOA, H.IDTITULAR, H.IDMOTIVO,'
      
        '       H.VALORPROVENTO, H.VALORINFO, NVL(H.FLGTIPODESC,'#39'T'#39') AS F' +
        'LGTIPODESC,'
      
        '       H.CODIRRFDARF, H.IDRESPONSAVEL, H.IDHSTFOLHABENEF, H.IDRU' +
        'BRICA,'
      '       PD.FLGESPECIAL, PD.FLGDESCONTO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.DESCRICAO, PD.DESCRPROV' +
        'DESC) AS DESCRICAO,'
      '       PR.DATANASC,'
      '       H.LOTEORIGINAL, NVL(PR.NUMDEPIRRF,0) AS NUMDEPIRRF,'
      '       NVL(PR.FLGISENTOIRRF,0) AS FLGISENTOIRRF,'
      '       H.CODPORTFORMA,'
      '       H.IDFAVORECIDO,'
      '       NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOCONTABIL'
      
        'FROM LISTAFOLHABENEFDET L, HISTRUBSAL H, PARAMAPREV PRM, PROVDES' +
        'C PD, PESSOAFISICA PR'
      'WHERE L.IDLISTA = 0'
      'AND L.IDTITULAR = :IDTITULAR'
      'AND L.IDPESSOA = :IDPESSOA'
      'AND H.IDTITULAR = L.IDTITULAR'
      'AND H.IDRESPONSAVEL = L.IDREFERENCIA3'
      'AND H.IDHSTFOLHABENEF = L.IDREFERENCIA'
      'AND PD.IDPROVENTO = H.IDRUBRICA'
      'AND PR.IDPESSOA = L.IDPESSOA'
      'AND H.FLGESTORNO = 1'
      'ORDER BY PD.FLGDESCONTO, H.IDHSTFOLHABENEF, H.SEQRUBRICA')
    ValidateWithMask = True
    Left = 57
    Top = 354
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRecebedores: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT IDTITULAR, IDPESSOA'
      'FROM LISTAFOLHABENEFDET'
      'WHERE IDLISTA = 0'
      'ORDER BY IDTITULAR, IDPESSOA')
    ValidateWithMask = True
    Left = 84
    Top = 442
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '  H.NUMEROPROCESSO,'
      '  H.IDBENEFICIO,'
      '  H.CODPORTFORMA,'
      '  B.DFLOATPAGTO'
      ''
      'FROM'
      '  HSTBENEFBFCIARIO H,'
      '  BENEFBFCIARIO B'
      ''
      'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '  AND H.IDPESSJUR       = :IDPESSJUR'
      '  AND H.IDPLANOPREV     = :IDPLANOPREV'
      '  AND H.IDTITULAR       = :IDTITULAR'
      '  AND B.NUMEROPROCESSO  = H.NUMEROPROCESSO'
      '  AND B.IDPESSJUR       = H.IDPESSJUR'
      '  AND B.IDPLANOPREV     = H.IDPLANOPREV'
      '  AND B.IDTITULAR       = H.IDTITULAR'
      '  AND B.IDPESSOA        = H.IDPESSOA')
    ValidateWithMask = True
    Left = 15
    Top = 442
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasRecebedor: TwwQuery
    AfterOpen = qryRubricasRecebedorAfterOpen
    DatabaseName = 'BaseDados'
    DataSource = dsPagtoPendente
    SQL.Strings = (
      'SELECT H.MES,'
      '       R.RECPAG,'
      '       R.CODTIPRECDES,'
      
        '       DECODE(PD.FLGDESCONTO,0,R.PLACONTAD,1,R.PLACONTAC,NULL) A' +
        'S PLACONTA,'
      '       R.CODSUBCONTA,'
      '       R.UNIDNEGOC,'
      
        '       DECODE(PD.FLGDESCONTO,0,R.CODCENTROCUSTOD,1,R.CODCENTROCU' +
        'STOC,NULL) AS CODCENTROCUSTO,'
      '       R.CODCENTRORESPON,'
      
        '       DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO,0,'#39'P'#39',1,'#39'D'#39 +
        ','#39'I'#39'),'#39'I'#39') AS ESTADO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, TO_CHAR(PD.IDPROVENTO), PD' +
        '.CODPROVDESC) AS CODIGO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.DESCRICAO, PD.DESCRPROV' +
        'DESC) AS RUBRICA,'
      '       H.VALORPROVENTO,'
      '       H.VALORPROVENTO AS VALOR'
      'FROM HISTRUBSAL H, PARAMAPREV PRM, PROVDESC PD, RUBRICAXPLANO R'
      'WHERE H.IDHSTFOLHABENEF = :IDREFERENCIA'
      'AND H.IDTITULAR = :IDTITULAR'
      'AND H.IDRESPONSAVEL = :IDPESSOA'
      'AND H.IDRUBRICA = PD.IDPROVENTO'
      'AND H.FLGESTORNO = 1'
      'AND R.IDPESSJUR(+) = H.IDPATRO'
      'AND R.IDPLANOPREV(+) = H.IDPLANOPREV'
      'AND R.IDRUBRICA(+) = H.IDRUBRICA'
      'ORDER BY H.SEQRUBRICA'
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
    Left = 288
    Top = 442
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryRubricasRecebedorMES: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 7
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryRubricasRecebedorCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Size = 40
    end
    object qryRubricasRecebedorRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 67
      FieldName = 'RUBRICA'
      Size = 130
    end
    object qryRubricasRecebedorESTADO: TStringField
      DisplayLabel = 'P/D/I'
      DisplayWidth = 6
      FieldName = 'ESTADO'
      Size = 1
    end
    object qryRubricasRecebedorVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
    end
    object qryRubricasRecebedorRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRubricasRecebedorCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryRubricasRecebedorPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Visible = False
      Size = 18
    end
    object qryRubricasRecebedorCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Visible = False
    end
    object qryRubricasRecebedorUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryRubricasRecebedorCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryRubricasRecebedorCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryRubricasRecebedorVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Visible = False
    end
  end
  object qryLotes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO, '
      ' '#39' - '#39' AS HIFEN'
      'FROM CTRLINTERFACE'
      ' WHERE '
      '(MESREFERENCIA = '#39'2002/06'#39') AND'
      '(TIPO = '#39'B'#39') AND'
      '(IDPESSOA IS NULL) AND'
      '(FLGIDATMP = 1) AND'
      '(FLGVOLTATMP = 0) AND'
      '(FLGTIPOFOLHA = 1) ')
    ValidateWithMask = True
    Left = 353
    Top = 443
  end
  object qryRubricaGravar: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'INSERT INTO PREVIA'
      
        '(NUMEROPROCESSO,    IDPESSJUR,          IDPATRO,           IDPLA' +
        'NOPREV,'
      
        ' IDTITULAR,         IDPESSOA,           IDRESPONSAVEL,     IDFAV' +
        'ORECIDO,'
      
        ' MES,               MESCOBRANCA,        IDBENEFICIO,       IDRUB' +
        'RICA,'
      ' IDLOTE,            FLGTIPODESC,        FLGDESCONTO,'
      
        ' IDMOTIVO,          SEQPROPOSTA,        SEQRUBRICA,        REFER' +
        'ENCIA,'
      
        ' VALORPROVENTO,     VALORCOTAS,         VALORINFO,         VALOR' +
        'RECEBIDO,'
      
        ' CODMOEDA,          IDREGRACALCULO,     CODIRRFDARF,       CODAL' +
        'TERADOR,'
      
        ' DATAPAGAMENTO,     FONTEPAGADORA,      FLGIRRF,           IDMOD' +
        'ULO,'
      
        ' FLGSRB,            FLGOK,              FLGCONCESSAO,      FLGIN' +
        'DIVIDUAL,'
      
        ' FLGCOMPOESALPART,  FLGCOMPOESALBENEF,  ORDEM,             FLGPA' +
        'GA,'
      
        ' IDEMPRESA,         RECPAG,             CODTIPRECDES,      CODCE' +
        'NTROCUSTO,'
      
        ' CODCENTRORESPON,   UNIDNEGOC,          PLANO,             PLACO' +
        'NTA,'
      
        ' CODPORTFORMA,      DFLOATPAGTO,        NUMPROCINSS,       FLGSA' +
        'LFAM,'
      
        ' FLGPROVISORIO,     IDVERSAOESTORNO,    IDPLANOORIGEM,     IDPLA' +
        'NOCONTABIL,'
      ' IDFAVDOC,          SEQDOCUMENTO,       IDRECEBEPGTO)'
      ' VALUES'
      
        '(:NUMEROPROCESSO,   :IDPESSJUR,         :IDPATRO,          :IDPL' +
        'ANOPREV,'
      
        ' :IDTITULAR,        :IDPESSOA,          :IDRESPONSAVEL,    :IDFA' +
        'VORECIDO,'
      
        ' :MES,              :MESCOBRANCA,       :IDBENEFICIO,      :IDRU' +
        'BRICA,'
      ' :IDLOTE,           :FLGTIPODESC,       :FLGDESCONTO,'
      
        ' :IDMOTIVO,         :SEQPROPOSTA,       :SEQRUBRICA,       :REFE' +
        'RENCIA,'
      
        ' :VALORPROVENTO,    :VALORCOTAS,        :VALORINFO,        :VALO' +
        'RRECEBIDO,'
      
        ' :CODMOEDA,         :IDREGRACALCULO,    :CODIRRFDARF,      :CODA' +
        'LTERADOR,'
      
        ' :DATAPAGAMENTO,    :FONTEPAGADORA,     :FLGIRRF,          :IDMO' +
        'DULO,'
      
        ' :FLGSRB,           :FLGOK,             :FLGCONCESSAO,     :FLGI' +
        'NDIVIDUAL,'
      
        ' :FLGCOMPOESALPART, :FLGCOMPOESALBENEF, :ORDEM,            :FLGP' +
        'AGA,'
      
        ' :IDEMPRESA,        :RECPAG,            :CODTIPRECDES,     :CODC' +
        'ENTROCUSTO,'
      
        ' :CODCENTRORESPON,  :UNIDNEGOC,         :PLANO,            :PLAC' +
        'ONTA,'
      
        ' :CODPORTFORMA,     :DFLOATPAGTO,       :NUMPROCINSS,      :FLGS' +
        'ALFAM,'
      
        ' :FLGPROVISORIO,    :IDVERSAOPAGTO,     :IDPLANOORIGEM,    :IDPL' +
        'ANOCONTABIL,'
      ' :IDFAVDOC,         :SEQDOCUMENTO,      :IDRECEBEPGTO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 267
    Top = 295
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORCOTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORINFO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORRECEBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMOEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIRRFDARF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGSRB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGOK'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCONCESSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGINDIVIDUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALPART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGPAGA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UNIDNEGOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DFLOATPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGSALFAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPROVISORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDVERSAOPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOCONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDFAVDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRECEBEPGTO'
        ParamType = ptUnknown
      end>
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      HISTORICO'
      'FROM'
      '      HSTFOLHABENEF'
      'WHERE'
      '     IDHSTFOLHABENEF = :IDVERSAO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 437
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDVERSAO'
        ParamType = ptUnknown
      end>
    object qryVersaoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'E.MATRICULA'
      'H.MESCOBRANCA'
      'H.IDHSTFOLHABENEF'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Mês Cobrança'
      'Nº Versão de Pagto.'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRUBSAL H'
      'ELEGPATRO E'
      'PESSOA P')
    CamposChave.Strings = (
      'E.MATRICULA'
      'H.MESCOBRANCA'
      'H.IDTITULAR'
      'H.IDRESPONSAVEL'
      'H.IDHSTFOLHABENEF'
      'P.NOME')
    Filtro.Strings = (
      'H.FLGESTORNO = 1'
      'H.IDMODULO = 18'
      'H.IDHSTFOLHABENEF IS NOT NULL'
      'E.IDPESSJUR = H.IDPATRO'
      'E.IDPESSOA = H.IDTITULAR'
      'P.IDPESSOA = H.IDRESPONSAVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '7'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 357
    Top = 30
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.DESCRICAO,'
      '  P.CODPORTFORMA'
      ''
      'FROM'
      '  PORTADORFORMA P'
      ''
      'WHERE P.RECPAG = '#39'P'#39
      ''
      'ORDER BY'
      '  P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 226
    Top = 103
  end
  object updNovoPagto: TUpdateSQL
    ModifySQL.Strings = (
      'update LISTAFOLHABENEFDET'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDREFERENCIA = :IDREFERENCIA,'
      '  IDLISTA = :IDLISTA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDREFERENCIA = :OLD_IDREFERENCIA and'
      '  IDLISTA = :OLD_IDLISTA')
    InsertSQL.Strings = (
      'insert into LISTAFOLHABENEFDET'
      '  (IDTITULAR, IDPESSOA, IDREFERENCIA, IDLISTA)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :IDREFERENCIA, :IDLISTA)')
    DeleteSQL.Strings = (
      'delete from LISTAFOLHABENEFDET'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDREFERENCIA = :OLD_IDREFERENCIA and'
      '  IDLISTA = :OLD_IDLISTA')
    Left = 177
    Top = 389
  end
  object qryBuscaPortador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(H.MESCOBRANCA), H.CODPORTFORMA'
      'FROM HISTRUBSAL H, ELEGPATRO E, PESSOA P'
      'WHERE H.FLGESTORNO = 1'
      'AND H.IDMODULO = 18'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND NOT EXISTS (SELECT 1'
      '                FROM LISTAFOLHABENEFDET L'
      '                WHERE L.IDLISTA = 0'
      '                AND L.IDREFERENCIA = H.IDHSTFOLHABENEF'
      '                AND L.IDTITULAR = H.IDTITULAR'
      '                AND L.IDPESSOA = H.IDRESPONSAVEL)'
      'AND E.IDPESSJUR = H.IDPATRO'
      'AND E.IDPESSOA  = H.IDTITULAR'
      'AND P.IDPESSOA  = H.IDRESPONSAVEL'
      'AND E.MATRICULA = :matricula'
      'AND ROWNUM      = 1'
      'GROUP BY CODPORTFORMA')
    ValidateWithMask = True
    Left = 353
    Top = 366
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'matricula'
        ParamType = ptUnknown
      end>
  end
  object qryNovoRecebedor: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  DP.IDPESSOA,'
      '  P.NOME, '
      '  DP.IDTITULAR'
      'FROM '
      '  DEPENTIT DP, '
      '  PESSOA P'
      'WHERE '
      '    DP.IDTITULAR = :PIDTITULAR'
      'AND P.IDPESSOA   = DP.IDPESSOA'
      'UNION'
      'SELECT'
      '  R.IDFAVORECIDO AS IDPESSOA,'
      '  P.NOME,'
      '  R.IDTITULAR'
      'FROM'
      '  RUBRICAINDIV R,'
      '  PESSOA P'
      'WHERE'
      '    R.IDTITULAR = :PIDTITULAR'
      'AND R.FLGTPRUBMANUT = 1'
      'AND R.IDFAVORECIDO = P.IDPESSOA'
      'AND R.RUBRICAPROVENTOPA IS NOT NULL'
      'ORDER BY NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 677
    Top = 262
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end>
  end
end
