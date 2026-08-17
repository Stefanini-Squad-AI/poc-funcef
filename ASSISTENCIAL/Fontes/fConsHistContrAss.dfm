inherited frmConsultContr: TfrmConsultContr
  Left = 0
  Top = 30
  Caption = 'Consulta Geral de Cobranças'
  ClientHeight = 463
  ClientWidth = 792
  FormStyle = fsMDIChild
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape [0]
    Left = 8
    Top = 90
    Width = 16
    Height = 12
    Brush.Color = clOlive
  end
  object Label17: TLabel [1]
    Left = 36
    Top = 90
    Width = 145
    Height = 12
    AutoSize = False
    Caption = 'Divergente tratadas'
    WordWrap = True
  end
  object Splitter1: TSplitter [2]
    Left = 0
    Top = 225
    Width = 792
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  inherited tsetResult: TTabSet [3]
    Top = 394
    Width = 750
    Height = 30
    Align = alNone
  end
  inherited pnlFundo: TPanel [4]
    Top = 227
    Width = 792
    Height = 197
    inherited Panel3: TPanel
      Left = 707
      Top = -16
    end
  end
  inherited Dock971: TDock97 [5]
    Top = 424
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 580
      DockPos = 580
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 85
      DockPos = 85
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited pnlPesquisa: TPanel [6]
    Width = 792
    Height = 225
    inherited Panel4: TPanel
      Left = 451
      Top = 149
      Width = 334
      Height = 69
      ParentFont = False
      inherited bbtnConsultar: TButton
        Left = 73
        Top = 19
        Width = 121
        Height = 38
      end
      inherited anmLupa: TAnimate
        Left = 6
        Top = 10
        Width = 60
        AutoSize = False
      end
      object btnImprimir: TButton
        Left = 207
        Top = 19
        Width = 121
        Height = 38
        Caption = '&Imprimir'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnImprimirClick
      end
    end
    object grplegenda: TGroupBox
      Left = 603
      Top = 17
      Width = 182
      Height = 127
      Caption = '  Legendas  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Shape3: TShape
        Left = 8
        Top = 21
        Width = 16
        Height = 12
        Brush.Color = clWindow
      end
      object Label10: TLabel
        Left = 29
        Top = 20
        Width = 128
        Height = 13
        Caption = 'Calculadas e não enviadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Shape4: TShape
        Left = 8
        Top = 38
        Width = 16
        Height = 12
        Brush.Color = clTeal
      end
      object Label11: TLabel
        Left = 29
        Top = 37
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Enviadas e não recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Shape5: TShape
        Left = 8
        Top = 55
        Width = 16
        Height = 12
        Brush.Color = clGray
      end
      object Shape6: TShape
        Left = 8
        Top = 72
        Width = 16
        Height = 12
        Brush.Color = clMaroon
      end
      object Label14: TLabel
        Left = 29
        Top = 55
        Width = 142
        Height = 15
        AutoSize = False
        Caption = 'Recebidas sem divergências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label12: TLabel
        Left = 29
        Top = 72
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Divergente não tratadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Shape1: TShape
        Left = 8
        Top = 89
        Width = 16
        Height = 12
        Brush.Color = clOlive
      end
      object Label16: TLabel
        Left = 29
        Top = 89
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Divergente tratadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Shape7: TShape
        Left = 8
        Top = 106
        Width = 16
        Height = 12
        Brush.Color = clLime
      end
      object Label18: TLabel
        Left = 29
        Top = 106
        Width = 142
        Height = 18
        AutoSize = False
        Caption = 'Divergente Pagas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 446
      Height = 216
      ActivePage = tbhst
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object tbhst: TTabSheet
        Caption = 'Histórico'
        object rdgpagador: TRadioGroup
          Left = 6
          Top = 77
          Width = 195
          Height = 111
          Caption = 'Responsável pelo pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 2
          Items.Strings = (
            'Contribuinte'
            'Patrocinadora'
            'Ambos')
          ParentFont = False
          TabOrder = 0
        end
        object rddiverg: TRadioGroup
          Left = 206
          Top = 3
          Width = 211
          Height = 186
          Caption = 'Situação do Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 6
          Items.Strings = (
            'Calculadas e não enviadas'
            'Enviadas e não recebidas'
            'Recebidas sem divergências'
            'Divergente não tratada'
            'Divergências tratada'
            'Divergentes pagas'
            'Todas')
          ParentFont = False
          TabOrder = 1
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 4
          Width = 194
          Height = 67
          Caption = 'Mês de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object cmb1: TComboBox
            Left = 84
            Top = 26
            Width = 100
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              ''
              'JANEIRO'
              'FEVEREIRO'
              'MARÇO'
              'ABRIL'
              'MAIO'
              'JUNHO'
              'JULHO'
              'AGOSTO'
              'SETEMBRO'
              'OUTUBRO'
              'NOVEMBRO'
              'DEZEMBRO')
          end
          object spin1: TSpinEdit
            Left = 5
            Top = 26
            Width = 74
            Height = 22
            EditorEnabled = False
            MaxValue = 2100
            MinValue = 1997
            TabOrder = 0
            Value = 1997
          end
        end
      end
      object tbsFiltros: TTabSheet
        Caption = 'Filtros'
        ImageIndex = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 438
          Height = 188
          Align = alClient
          BevelInner = bvRaised
          TabOrder = 0
          object pnlPatro: TPanel
            Left = 2
            Top = 2
            Width = 434
            Height = 184
            Align = alClient
            TabOrder = 0
            object GroupBox2: TGroupBox
              Left = 1
              Top = 1
              Width = 432
              Height = 63
              Align = alTop
              Caption = 'Situação na Fundação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object cbSituacao: TComboBox
                Left = 11
                Top = 20
                Width = 145
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Text = 'cbSituacao'
                Items.Strings = (
                  ''
                  'Assistido'
                  'Ativo'
                  'Manutenido Total'
                  'Manutenido Parcial'
                  'Outros')
              end
            end
            object GroupBox4: TGroupBox
              Left = 1
              Top = 127
              Width = 432
              Height = 63
              Align = alTop
              Caption = 'Plano Assistencial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object dblkPlano: TwwDBLookupCombo
                Left = 10
                Top = 24
                Width = 399
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'40'#9'Descrição do Plano'#9'F')
                LookupTable = qryPlano
                LookupField = 'IDPLANASS'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object GroupBox1: TGroupBox
              Left = 1
              Top = 64
              Width = 432
              Height = 63
              Align = alTop
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object dblkPatro: TwwDBLookupCombo
                Left = 10
                Top = 24
                Width = 397
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Patrocinadora'#9'F')
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object pnlParticip: TPanel
            Left = 2
            Top = 2
            Width = 434
            Height = 184
            Align = alClient
            TabOrder = 1
            object Label1: TLabel
              Left = 4
              Top = 16
              Width = 123
              Height = 13
              Caption = 'Nome do Participante'
            end
            object Label2: TLabel
              Left = 4
              Top = 74
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label3: TLabel
              Left = 270
              Top = 74
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label6: TLabel
              Left = 6
              Top = 130
              Width = 104
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object Label5: TLabel
              Left = 270
              Top = 130
              Width = 71
              Height = 13
              Caption = 'Nº Inscrição'
            end
            object edtNomeParticip: TEdit
              Left = 4
              Top = 32
              Width = 303
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object btnLocalizar: TBitBtn
              Left = 308
              Top = 7
              Width = 123
              Height = 54
              Caption = 'Buscar Participante'
              TabOrder = 1
              OnClick = btnLocalizarClick
              Glyph.Data = {
                76020000424D7602000000000000760000002800000020000000200000000100
                0400000000000002000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770880880
                7777777770070077777777777088088077777777000000077777777770880880
                0070077708808807777777777088088000000077088088077777777770880880
                88088077088088077777777700888880080880770880880777777770B0888880
                B0088077088088077777770000003000000880770880880777777708808FFF80
                880880770880880777777708808FCF80880880770880880777777708808FCF80
                880880770880880777777708808FCF80880880700888880077777708808FCF80
                8808800B0888880B07777708808FCF80880880000003000000777708888F6F88
                8808808808FFF80880777708888FCF888800008808FCF8088077777000000000
                00FF808808FCF80880777777777708808FCF808808FCF8088077777777700080
                8FCF808808FCF808807777777703B3008FCF808808FCF80880777777770B3B00
                8FCF808888F6F888807777777703B3008FCF808888FCF8888077777777700088
                8F6F88000000000007777777777708888FCF8888077777777777777777777000
                0000000077000777777777777777777777777777703B30777777777777777777
                7000777770B3B077777777777777777703B30777703B30777777777777777777
                0B3B077777000777777777777777777703B30777777777777777777777777777
                7000777777777777777777777777777777777777777777777777}
              Layout = blGlyphTop
            end
            object edtNomePatro: TEdit
              Left = 4
              Top = 90
              Width = 257
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edtMatricula: TEdit
              Left = 270
              Top = 90
              Width = 160
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtNomePlanAss: TEdit
              Left = 5
              Top = 146
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object edtNumInscricao: TEdit
              Left = 270
              Top = 146
              Width = 160
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
        end
      end
    end
    object rgrFiltro: TRadioGroup
      Left = 451
      Top = 17
      Width = 149
      Height = 126
      Caption = '  Filtrar por...  '
      ItemIndex = 0
      Items.Strings = (
        'Pa&trocinadora'
        'Partici&pante')
      TabOrder = 3
      OnClick = rgrFiltroClick
    end
  end
  inherited grpResultado: TGroupBox
    Top = 227
    Width = 792
    Height = 197
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    inherited Panel1: TPanel
      Top = 18
      Width = 788
      Height = 177
      inherited dbgrdResultado: TwwDBGrid
        Width = 788
        Height = 144
        Selected.Strings = (
          'MESCOBRANCA'#9'12'#9'Mês Cobrança '
          'MES'#9'7'#9'Mês Ref. '
          'VALORESPERADO'#9'12'#9'Valor Esperado '
          'VLRALTERADOR'#9'12'#9'Valor do Alterador'
          'TOTALRECEBIDO'#9'12'#9'Total Recebido'
          'DATA'#9'12'#9'Data Recebtº'
          'STATUS'#9'13'#9'Status'
          'MATRICULA'#9'12'#9'Matrícula'
          'NOME'#9'30'#9'Nome do Titular'
          'SITUACAO'#9'35'#9'SITUACAO'
          'PATROCINADORA'#9'30'#9'Patrocinadora'
          'NOME_1'#9'30'#9'Dependente'
          'CONTRIB'#9'31'#9'Descrição da Cobrança'
          'DATAPREVISAO'#9'14'#9'Data de Previsão '
          'PLANASS'#9'25'#9'Plano Assistencial'
          'DESCRICAO_1'#9'25'#9'Forma de Pagamento'
          'NOMEREGRA'#9'25'#9'Nome da Regra'
          'DESCRICAO'#9'11'#9'Motivo')
        FixedCols = 2
        Font.Charset = ANSI_CHARSET
        ParentFont = False
        ReadOnly = True
        OnCalcCellColors = dbgrdResultadoCalcCellColors
      end
      object Panel2: TPanel
        Left = 0
        Top = 144
        Width = 788
        Height = 33
        Align = alBottom
        BevelInner = bvRaised
        TabOrder = 1
        object Label21: TLabel
          Left = 13
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Total do Envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 212
          Top = 9
          Width = 88
          Height = 13
          Caption = 'Total Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edTotEsperado: TEdit
          Left = 106
          Top = 6
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edTotRecebido: TEdit
          Left = 305
          Top = 6
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 139
    Top = 387
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qryhistcontr
    Left = 432
    Top = 352
  end
  object qryhistcontr: TwwQuery
    AfterOpen = qryhistcontrAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' DD.MATRICULA, CC.NOME, AA.MES, AA.MESCOBRANCA, AA.VALORESPERADO' +
        ','
      
        ' AA.VALORRECEBIDO, AA.DATA,PL.NOME PLANASS, PATRO.NOME AS PATROC' +
        'INADORA,'
      ' PV.NOME PLANPREV, P1.NOME, CTO.NOME CONTRIB, MT.DESCRICAO,'
      ' PT.DESCRICAO, REGRA.NOMEREGRA, AA.SITRECEBIMENTO SIT,'
      
        ' AA.DATAPREVISAO, ST.DESCRICAO AS SITUACAO, SPV.DESCRICAO SITPLA' +
        'NOPREV,'
      
        ' DECODE (AA.SITRECEBIMENTO,0,'#39'NÃO ENVIADA'#39',1,'#39'NÃO RECEBIDA'#39',2,'#39'R' +
        'ECEBIDA'#39','
      '         3,'#39'DIVERGENTE'#39',4,'#39'PAGAS EM ATRASO'#39','#39' '#39') AS STATUS,'
      
        ' DECODE(HA.FLGTIPO,'#39'A'#39', HA.VLRALTERADOR, -HA.VLRALTERADOR) VLRAL' +
        'TERADOR,'
      
        ' AA.VALORRECEBIDO+DECODE(HA.FLGTIPO,'#39'A'#39', HA.VLRALTERADOR, -HA.VL' +
        'RALTERADOR) AS TOTALRECEBIDO'
      ''
      'FROM'
      ' HSTCONTRIBASS AA, CONTASS BB, MOTIVO MT, CONTRIBASS CT,'
      
        ' PLANASS PL, PLANPREV PV, PESSOA P1, PESSOA CC, PESSOA PATRO, EL' +
        'EGPATRO DD,'
      ' PORTADORFORMA PT, CONTRIBUICAO CTO, REGRA,'
      ' PARTPREVPLAN PP, SITPART ST, SITPLANOPREV SPV,'
      ' HSTATRASOCONTASS HA'
      'WHERE  (AA.IDTITULAR   = DD.IDPESSOA)'
      'AND    (AA.CODPORTFORMA = PT.CODPORTFORMA(+))'
      'AND    (AA.IDPESSJUR   = DD.IDPESSJUR)'
      'AND    (AA.IDPESSJUR = PATRO.IDPESSOA)'
      'AND    (AA.IDPLANOPREV = BB.IDPLANOPREV)'
      'AND    (DD.IDPESSOA =  CC.IDPESSOA)'
      'AND    (CT.IDCONTASS =  BB.IDCONTASS)'
      'AND    (BB.IDTITULAR =  DD.IDPESSOA)'
      'AND    (AA.IDPLANASS = BB.IDPLANASS)'
      'AND    (BB.IDCONTASS = CT.IDCONTASS)'
      'AND    (AA.IDPESSJUR = BB.IDPESSJUR)'
      'AND    (AA.IDTITULAR = BB.IDTITULAR)'
      'AND    (AA.IDDEPENDENTE = BB.IDDEPENDENTE)'
      'AND    (PL.IDPLANASS = AA.IDPLANASS)'
      'AND    (PV.IDPLANOPREV = AA.IDPLANOPREV)'
      'AND    (P1.IDPESSOA =  AA.IDDEPENDENTE)'
      'AND    (CT.IDPLANASS =  AA.IDPLANASS)'
      'AND    (AA.IDMOTIVO =  MT.IDMOTIVO)'
      'AND    (CTO.IDCONTRIBUICAO = CT.IDCONTASS)'
      'AND    (AA.IDREGRA = REGRA.IDREGRA(+))'
      'AND    (AA.IDPESSJUR = PP.IDPESSJUR)'
      'AND    (AA.IDPLANOPREV = PP.IDPLANOPREV)'
      'AND    (AA.IDTITULAR = PP.IDPESSOA)'
      'AND    (PP.IDSITPART = ST.IDSITPART)'
      'AND    (PP.IDSITPLANOPREV = SPV.IDSITPLANOPREV)'
      ''
      'AND    (AA.SEQPROPOSTA    = HA.SEQPROPOSTA)'
      'AND    (AA.MES            = HA.MES)'
      'AND    (AA.IDMOTIVO       = HA.IDMOTIVO)'
      'AND    (AA.MESCOBRANCA    = HA.MESCOBRANCA)'
      'AND    (AA.IDPLANASS      = HA.IDPLANASS)'
      'AND    (AA.IDPLANOPREV    = HA.IDPLANOPREV)'
      'AND    (AA.IDPESSJUR      = HA.IDPESSJUR)'
      'AND    (AA.IDTITULAR      = HA.IDTITULAR)'
      'AND    (AA.IDDEPENDENTE   = HA.IDDEPENDENTE)'
      'AND    (AA.IDCONTASS      = HA.IDCONTASS)'
      ''
      ''
      ''
      ''
      ''
      '')
    PictureMasks.Strings = (
      
        'VALORESPERADO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]}'#9'T'#9'T'
      
        'VALORRECEBIDO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]}'#9'T'#9'T'
      
        'VLRALTERADOR'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      
        'TOTALRECEBIDO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 282
    Top = 328
    object qryhistcontrMESCOBRANCA: TStringField
      DisplayLabel = 'Mês Cobrança '
      DisplayWidth = 12
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object qryhistcontrMES: TStringField
      DisplayLabel = 'Mês Ref. '
      DisplayWidth = 7
      FieldName = 'MES'
      Size = 7
    end
    object qryhistcontrVALORESPERADO: TFloatField
      DisplayLabel = 'Valor Esperado '
      DisplayWidth = 12
      FieldName = 'VALORESPERADO'
    end
    object qryhistcontrVLRALTERADOR: TFloatField
      DisplayLabel = 'Valor do Alterador'
      DisplayWidth = 12
      FieldName = 'VLRALTERADOR'
    end
    object qryhistcontrTOTALRECEBIDO: TFloatField
      DisplayLabel = 'Total Recebido'
      DisplayWidth = 12
      FieldName = 'TOTALRECEBIDO'
    end
    object qryhistcontrDATA: TDateTimeField
      DisplayLabel = 'Data Recebtº'
      DisplayWidth = 12
      FieldName = 'DATA'
    end
    object qryhistcontrSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 13
      FieldName = 'STATUS'
      Size = 15
    end
    object qryhistcontrMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 12
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryhistcontrNOME: TStringField
      DisplayLabel = 'Nome do Titular'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object qryhistcontrSITUACAO: TStringField
      DisplayWidth = 35
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryhistcontrPATROCINADORA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryhistcontrNOME_1: TStringField
      DisplayLabel = 'Dependente'
      DisplayWidth = 30
      FieldName = 'NOME_1'
      Size = 60
    end
    object qryhistcontrCONTRIB: TStringField
      DisplayLabel = 'Descrição da Cobrança'
      DisplayWidth = 31
      FieldName = 'CONTRIB'
      Size = 60
    end
    object qryhistcontrDATAPREVISAO: TDateTimeField
      DisplayLabel = 'Data de Previsão '
      DisplayWidth = 14
      FieldName = 'DATAPREVISAO'
    end
    object qryhistcontrPLANASS: TStringField
      DisplayLabel = 'Plano Assistencial'
      DisplayWidth = 25
      FieldName = 'PLANASS'
      Size = 40
    end
    object qryhistcontrDESCRICAO_1: TStringField
      DisplayLabel = 'Forma de Pagamento'
      DisplayWidth = 25
      FieldName = 'DESCRICAO_1'
      Size = 50
    end
    object qryhistcontrNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 25
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryhistcontrDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 11
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryhistcontrVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido '
      DisplayWidth = 12
      FieldName = 'VALORRECEBIDO'
      Visible = False
    end
    object qryhistcontrSITPLANOPREV: TStringField
      DisplayLabel = 'Sit. Plano Prev.'
      DisplayWidth = 50
      FieldName = 'SITPLANOPREV'
      Visible = False
      Size = 50
    end
    object qryhistcontrPLANPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Visible = False
      Size = 50
    end
    object qryhistcontrSIT: TStringField
      FieldName = 'SIT'
      Visible = False
      Size = 1
    end
  end
  object qryTotais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(SUM(AA.VALORESPERADO),0) AS TOTESPERADO,'
      '       NVL(SUM(AA.VALORRECEBIDO),0) AS TOTRECEBIDO'
      
        'FROM   HSTCONTRIBASS AA, CONTASS BB ,MOTIVO MT, CONTRIBASS CT , ' +
        'PLANASS PL,'
      
        '       PLANPREV PV , PESSOA P1, PESSOA CC, ELEGPATRO DD , PORTAD' +
        'ORFORMA PT,'
      '       CONTRIBUICAO CTO , REGRA'
      'WHERE  (AA.IDTITULAR   = DD.IDPESSOA)'
      'AND    (AA.CODPORTFORMA = PT.CODPORTFORMA(+))'
      'AND    (AA.IDPESSJUR   = DD.IDPESSJUR)'
      'AND    (AA.IDPLANOPREV = BB.IDPLANOPREV)'
      'AND    (DD.IDPESSOA =  CC.IDPESSOA)'
      'AND    (CT.IDCONTASS =  BB.IDCONTASS)'
      'AND    (BB.IDTITULAR =  DD.IDPESSOA)'
      'AND    (AA.IDPLANASS = BB.IDPLANASS)'
      'AND    (BB.IDCONTASS = CT.IDCONTASS)'
      'AND    (AA.IDPESSJUR = BB.IDPESSJUR)'
      'AND    (AA.IDTITULAR = BB.IDTITULAR)'
      'AND    (AA.IDDEPENDENTE = BB.IDDEPENDENTE)'
      'AND    (PL.IDPLANASS = AA.IDPLANASS)'
      'AND    (PV.IDPLANOPREV = AA.IDPLANOPREV)'
      'AND    (P1.IDPESSOA =  AA.IDDEPENDENTE)'
      'AND    (CT.IDPLANASS =  AA.IDPLANASS)'
      'AND    (AA.IDMOTIVO =  MT.IDMOTIVO)'
      'AND    (CTO.IDCONTRIBUICAO = CT.IDCONTASS)'
      'AND    (AA.IDREGRA = REGRA.IDREGRA(+))')
    ValidateWithMask = True
    Left = 50
    Top = 317
    object qryTotaisTOTESPERADO: TFloatField
      FieldName = 'TOTESPERADO'
      currency = True
    end
    object qryTotaisTOTRECEBIDO: TFloatField
      FieldName = 'TOTRECEBIDO'
      currency = True
    end
  end
  object ppBDEPipeline: TppBDEPipeline
    DataSource = ds
    UserName = 'BDEPipeline'
    Left = 229
    Top = 265
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 101
    Top = 281
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabelTitulo: TppLabel
        UserName = 'LabelTitulo'
        Caption = 'Consulta do Histórico de Cobranças - Relatório para Verificação'
        Color = 15263976
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        mmHeight = 6615
        mmLeft = 2381
        mmTop = 1588
        mmWidth = 161132
        BandType = 0
      end
      object ppLabelTipo: TppLabel
        UserName = 'LabelTipo'
        AutoSize = False
        Caption = 'Mensalidades enviadas e não recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 5821
        mmLeft = 1852
        mmTop = 10848
        mmWidth = 118269
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALORESPERADO'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MES'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'STATUS'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 265
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        Color = 15329769
        DataField = 'MESCOBRANCA'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 265
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 265
        mmWidth = 50271
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SITUACAO'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 183357
        mmTop = 265
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CONTRIB'
        DataPipeline = ppBDEPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 3704
        mmLeft = 232040
        mmTop = 265
        mmWidth = 49477
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 529
        mmWidth = 103188
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 29633
        mmTop = 529
        mmWidth = 213519
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 244740
        mmTop = 529
        mmWidth = 30692
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBDEPipeline
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Mês Cobr.'
          Color = 15329769
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 6085
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 17992
          mmTop = 6085
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Valor Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 6085
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 59531
          mmTop = 6085
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Sit. Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 84931
          mmTop = 6085
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 112977
          mmTop = 6085
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Nome do Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 132292
          mmTop = 6085
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 183357
          mmTop = 6085
          mmWidth = 48154
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Tipo de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 232040
          mmTop = 6085
          mmWidth = 49742
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 185209
          mmTop = 794
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = ppBDEPipeline
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline'
          mmHeight = 3969
          mmLeft = 197644
          mmTop = 794
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppBDEPipeline
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline'
          mmHeight = 3969
          mmLeft = 223044
          mmTop = 794
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Quantidade : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'MATRICULA'
          DataPipeline = ppBDEPipeline
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppBDEPipeline'
          mmHeight = 3969
          mmLeft = 23548
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, NOME '
      'FROM PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 453
    Top = 281
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 661
    Top = 297
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 373
    Top = 281
  end
  object msParticip: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PE.NOME'
      'PL.NOME'
      'PN.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nº de Inscrição'
      'Participante'
      'Plano Previdenciário'
      'Plano Assistencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'PARTPREVPLAN PP'
      'PLANPREV PL'
      'PARTASS PA'
      'PLANASS PN'
      'ELEGPATRO EL'
      'PESSOA PJ')
    CamposChave.Strings = (
      'PA.IDPESSOA'
      'PA.IDPESSJUR'
      'PA.IDPLANOPREV'
      'PA.IDPLANASS'
      'PA.SEQPROPOSTA'
      'PE.NOME'
      'PJ.NOME'
      'EL.MATRICULA'
      'PL.NOME'
      'PP.INSCRICAONUMERO'
      'PN.NOME')
    Filtro.Strings = (
      'PA.IDPESSJUR = PP.IDPESSJUR'
      'PA.IDPLANOPREV = PP.IDPLANOPREV'
      'PA.IDPESSOA = PP.IDPESSOA'
      'PA.SEQPROPOSTA = PP.SEQPROPOSTA'
      'PA.IDPLANASS = PN.IDPLANASS'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PE.IDPESSOA = EL.IDPESSOA'
      'PJ.IDPESSOA = EL.IDPESSJUR'
      'PL.IDPLANOPREV = PA.IDPLANOPREV'
      'PA.IDPLANASS = PA.IDPLANASS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '60'
      '50'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 402
    Top = 38
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PV.INSCRICAONUMERO'
      'PE.NOME'
      'PE.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'Nome do Titular'
      'CGC/CNPJ')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PARTASS PT'
      'HSTCONTRIBASS HT'
      'PESSOA PE'
      'PESSOA PJ'
      'PARTPREVPLAN PV'
      'ELEGPATRO EL'
      'PLANASS PL'
      'SITPART ST')
    CamposChave.Strings = (
      'EL.MATRICULA'
      'PV.INSCRICAONUMERO'
      'PE.NOME'
      'PE.NUMDOCUMENTO')
    Filtro.Strings = (
      'PT.IDPESSOA = PV.IDPESSOA'
      'PT.IDPESSOA = EL.IDPESSOA'
      'PT.IDPESSJUR = EL.IDPESSJUR'
      'PT.IDPESSJUR = PJ.IDPESSOA'
      'PT.IDPESSOA = PE.IDPESSOA'
      'PV.IDPESSOA = EL.IDPESSOA'
      'PT.IDPLANASS = PL.IDPLANASS'
      'PT.IDPESSOA = HT.IDTITULAR'
      'PT.IDPLANASS = HT.IDPLANASS'
      'PT.IDPESSJUR = HT.IDPESSJUR'
      'PV.IDSITPART = ST.IDSITPART'
      'PV.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '11'
      '10'
      '35'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 672
    Top = 72
  end
end
