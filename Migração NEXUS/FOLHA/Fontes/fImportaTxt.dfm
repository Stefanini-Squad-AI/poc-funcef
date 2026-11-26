inherited frmImportaTxt: TfrmImportaTxt
  Left = 258
  Top = 221
  HelpContext = 180043
  Caption = 'Importação de Convênios'
  ClientHeight = 450
  ClientWidth = 763
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 411
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 761
      Height = 409
      ActivePage = tbsImporta
      Align = alClient
      TabOrder = 0
      object tbsImporta: TTabSheet
        Caption = 'Importação'
        object pnlOpcoes: TPanel
          Left = 0
          Top = 0
          Width = 753
          Height = 62
          Align = alTop
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 163
            Height = 60
            Align = alLeft
            Caption = ' Cobrar em '
            TabOrder = 0
            object Label1: TLabel
              Left = 7
              Top = 12
              Width = 24
              Height = 13
              Caption = 'Mês'
            end
            object Label2: TLabel
              Left = 103
              Top = 11
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object cboxMes: TComboBox
              Left = 7
              Top = 25
              Width = 93
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              OnClick = cboxMesClick
              OnExit = cboxMesExit
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
            object EditAno: TEdit
              Left = 102
              Top = 25
              Width = 37
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = '1999'
              OnExit = EditAnoExit
            end
            object UpDown1: TUpDown
              Left = 139
              Top = 25
              Width = 16
              Height = 21
              Associate = EditAno
              Min = 1999
              Max = 4000
              Position = 1999
              TabOrder = 2
              Thousands = False
              Wrap = False
              OnClick = UpDown1Click
            end
          end
          object GroupBox2: TGroupBox
            Left = 306
            Top = 1
            Width = 436
            Height = 60
            Align = alLeft
            Caption = ' LayOut de Entrada de Dados do Arquivo TXT '
            TabOrder = 1
            object dblcmbLayout: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 420
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = qryLayoutDesconto
              LookupField = 'DESCRICAO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcmbLayoutChange
              OnCloseUp = dblcmbLayoutCloseUp
            end
          end
          object gbAbono: TGroupBox
            Left = 164
            Top = 1
            Width = 142
            Height = 60
            Align = alLeft
            TabOrder = 2
            object chkAbonoAnual: TCheckBox
              Left = 9
              Top = 15
              Width = 97
              Height = 17
              Caption = 'Abono Anual'
              TabOrder = 0
              OnClick = chkAbonoAnualClick
            end
            object cboxConfirma: TCheckBox
              Left = 9
              Top = 36
              Width = 123
              Height = 17
              Caption = 'Confirma no Final'
              TabOrder = 1
              OnClick = chkAbonoAnualClick
            end
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 62
          Width = 753
          Height = 156
          Align = alTop
          Caption = 'Panel2'
          TabOrder = 1
          object Panel3: TPanel
            Left = 1
            Top = 130
            Width = 751
            Height = 24
            Align = alTop
            Caption = 'Panel3'
            TabOrder = 1
            object cbxApaga: TCheckBox
              Left = 323
              Top = 4
              Width = 415
              Height = 17
              Caption = 
                'Apaga os Dados do  Lote Selecionado para reimportar no mesmo lot' +
                'e'
              TabOrder = 0
              OnClick = cbxApagaClick
            end
          end
          object GroupBox3: TGroupBox
            Left = 1
            Top = 1
            Width = 751
            Height = 129
            Align = alTop
            Caption = ' Selecione um Lote de uma importação anterior, caso exista '
            TabOrder = 0
            object cmbLote: TwwDBLookupCombo
              Left = 5
              Top = 14
              Width = 727
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Descrição'#9'F')
              LookupTable = qryCtrlInterface
              LookupField = 'IDLOTE'
              Enabled = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbLoteCloseUp
            end
            object wwDBGrid1: TwwDBGrid
              Left = 12
              Top = 40
              Width = 728
              Height = 87
              Selected.Strings = (
                'CODPROVDESC'#9'8'#9'Cód.Ext.'
                'IDPROVENTO'#9'10'#9'Cód.Int.'
                'QTD_TOTAL'#9'11'#9'Qtd Registros'
                'VALOR_TOTAL'#9'10'#9'Valor'
                'DESCRICAO'#9'56'#9'Descrição')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsEstatistica
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTrailingEllipsis, dgShowCellHint]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
              object wwDBGrid1IButton: TwwIButton
                Left = 0
                Top = 0
                Width = 13
                Height = 25
                AllowAllUp = True
              end
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 314
          Width = 753
          Height = 67
          Align = alBottom
          TabOrder = 3
          object BevelArqRej: TBevel
            Left = 230
            Top = 38
            Width = 428
            Height = 22
          end
          object Label9: TLabel
            Left = 8
            Top = 15
            Width = 218
            Height = 13
            Caption = 'Nome do Arquivo TXT a ser Importado'
          end
          object Label11: TLabel
            Left = 9
            Top = 41
            Width = 176
            Height = 13
            Caption = 'Nome do Arquivo de Rejeições'
          end
          object lbNomeArqRej: TLabel
            Left = 234
            Top = 42
            Width = 419
            Height = 13
            AutoSize = False
            Caption = 'C:\'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BevelArqImport: TBevel
            Left = 230
            Top = 11
            Width = 428
            Height = 22
          end
          object sbtnOrigem: TSpeedButton
            Left = 664
            Top = 8
            Width = 72
            Height = 26
            Caption = 'Origem'
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
              807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
              7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
              5555555777775555555555555555555555555555555555555555}
            OnClick = sbtnOrigemClick
          end
          object lbNomeArqImport: TLabel
            Left = 234
            Top = 16
            Width = 418
            Height = 13
            AutoSize = False
            Caption = 'C:\'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 218
          Width = 753
          Height = 86
          Align = alTop
          TabOrder = 2
          object rgDuplicados: TRadioGroup
            Left = 1
            Top = 1
            Width = 315
            Height = 84
            Align = alLeft
            Caption = 'Tratamento de registros duplicados'
            Items.Strings = (
              'Ignorar registro (Permanecerá o valor anterior)'
              'Alterar valor do registro'
              'Somar o valor atual ao valor anterior'
              'Aceitar os registros duplicados')
            TabOrder = 0
          end
          object GroupBox4: TGroupBox
            Left = 316
            Top = 1
            Width = 429
            Height = 84
            Align = alLeft
            TabOrder = 1
            object Label7: TLabel
              Left = 45
              Top = 12
              Width = 345
              Height = 28
              AutoSize = False
              BiDiMode = bdLeftToRight
              Caption = 
                'Marque esta opção para efetuar apenas importação para Ativos (ig' +
                'norar demitidos)'
              ParentBiDiMode = False
              WordWrap = True
            end
            object Label8: TLabel
              Left = 16
              Top = 45
              Width = 142
              Height = 29
              AutoSize = False
              BiDiMode = bdLeftToRight
              Caption = 'Situação dos Benefícios na Importação'
              ParentBiDiMode = False
              WordWrap = True
            end
            object cboxDemissao: TCheckBox
              Left = 20
              Top = 12
              Width = 17
              Height = 21
              TabOrder = 0
            end
            object cbboxAtivo: TComboBox
              Left = 167
              Top = 49
              Width = 247
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'Qualquer situação'
                'Apenas benefícios ativos'
                'Benefícios ativos ou retidos'
                'Benefícios ativos e preparados no mês')
            end
          end
        end
      end
      object tbsArquivo: TTabSheet
        Caption = 'Arquivo'
        ImageIndex = 2
        TabVisible = False
        object lblRegua: TLabel
          Left = 0
          Top = 0
          Width = 745
          Height = 14
          Align = alTop
          AutoSize = False
          Caption = 
            '123456789+123456789+123456789+123456789+123456789+123456789+1234' +
            '56789+123456789+123456789+123456789+123456789+123456789+12345678' +
            '9+123456789+123456789+123456789+123456789+123456789+'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 0
          Top = 14
          Width = 745
          Height = 3
          Align = alTop
          Shape = bsTopLine
          Style = bsRaised
        end
        object lblMensagemCritica: TLabel
          Left = 0
          Top = 355
          Width = 745
          Height = 18
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object mmArquivo: TMemo
          Left = 0
          Top = 17
          Width = 745
          Height = 321
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
        end
        object pbarCritica: TProgressBar
          Left = 0
          Top = 338
          Width = 745
          Height = 17
          Align = alBottom
          Min = 0
          Max = 100
          ParentShowHint = False
          Smooth = True
          Step = 1
          ShowHint = False
          TabOrder = 1
          Visible = False
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        object lbTotalReg: TLabel
          Left = 0
          Top = 345
          Width = 753
          Height = 18
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object memResult: TRichEdit
          Left = 0
          Top = 0
          Width = 681
          Height = 345
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          PlainText = True
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 681
          Top = 0
          Width = 72
          Height = 345
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object bbtnSalvar: TBitBtn
            Left = 0
            Top = 0
            Width = 72
            Height = 29
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
              7700333333337777777733333333008088003333333377F73377333333330088
              88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
              000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
              FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
              99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
              99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
              99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
              93337FFFF7737777733300000033333333337777773333333333}
            NumGlyphs = 2
          end
        end
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 363
          Width = 753
          Height = 18
          Align = alBottom
          Min = 0
          Max = 100
          ParentShowHint = False
          Smooth = True
          Step = 1
          ShowHint = False
          TabOrder = 2
          Visible = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 591
      DockPos = 786
    end
    inherited TB97oKCancelar: TToolbar97
      DockPos = 291
      inherited ToolbarSep971: TToolbarSep97
        Left = 316
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 149
        Width = 167
        Caption = 'Processar &Importação'
        Default = False
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 319
        Cancel = False
        Enabled = False
        Visible = False
      end
      object bbtnProcessaCritica: TBitBtn
        Left = 0
        Top = 0
        Width = 149
        Height = 33
        Caption = 'Processar C&rítica'
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnProcessaCriticaClick
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
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 20
    Top = 403
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object OpenDialog1: TOpenDialog
    Left = 133
    Top = 404
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    UpdateObject = updTmpDesc
    ValidateWithMask = True
    Left = 267
    Top = 126
  end
  object qryInscricao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.IDPESSJUR, P.IDPLANOPREV, P.INSCRICAONUMERO' +
        ', P.SEQPROPOSTA'
      'FROM PARTPREVPLAN P'
      'WHERE P.INSCRICAONUMERO = :INSCRICAO'
      'AND P.FLGDESATIVADO = 0'
      ''
      ' ')
    ValidateWithMask = True
    Left = 604
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INSCRICAO'
        ParamType = ptUnknown
      end>
  end
  object qryLayoutDesconto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDLAYOUT,'
      '      DESCRICAO,'
      '      COLCODIGO,'
      '      TAMCODIGO,'
      '      FLGMATRICULA,'
      '      COLCODFAVORECIDO,'
      '      TAMCODFAVORECIDO,'
      '      COLCODIGODEP,'
      '      TAMCODIGODEP,'
      '      NVL(FLGPOSSUIDEP,0) AS FLGPOSSUIDEP,'
      '      ULTIMPORT,'
      '      NVL(FLGTIPOCONVENIO,0) AS FLGTIPOCONVENIO,'
      '      FLGUSAHEADTRAI,'
      '      NVL(LINHASHEADER,0) AS LINHASHEADER,'
      '      NVL(LINHASTRAILLER,0) AS LINHASTRAILLER,'
      '      NVL(LIMITEMINIMO,0) AS LIMITEMINIMO,'
      '      NVL(LIMITEMAXIMO,0) AS LIMITEMAXIMO,'
      '      NVL(FLGIMPORTACAO,0) AS FLGIMPORTACAO,'
      '      NVL(FLGIGNORADEMITIDO,0) AS FLGIGNORADEMITIDO,'
      '      NVL(FLGTRATADUPL,0) AS FLGTRATADUPL,'
      '      NVL(FLGCOMBENEF,0) AS FLGCOMBFENEF,'
      '      NVL(FLGCHECARUBRICA,0) AS FLGCHECARUBRICA'
      'FROM LAYOUTDESCONTO'
      'WHERE FLGENTSAI = 0'
      'ORDER BY DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 613
    Top = 44
  end
  object qryFavorecidoXLayout: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'FAVORECIDOXLAYOUT'
      'WHERE'
      'IDLAYOUT = :IDLAYOUT')
    ValidateWithMask = True
    Left = 644
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
  end
  object qryLayoutXColunas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLAYOUT,'
      '       COLVALOR,'
      '       TAMVALOR,'
      '       NVL(IDRUBRICA,0) AS IDRUBRICA1,'
      '       IDRUBRICA,'
      '       NVL(IDFAVORECIDO,0) AS IDFAVORECIDO,'
      '       PLANO,'
      '       PLACONTAC,'
      '       PLACONTAD,'
      '       CODCENTRORESPON,'
      '       UNIDNEGOC,'
      '       IDEMPRESA,'
      '       CODCENTROCUSTO,'
      '       RECPAG,'
      '       CODTIPRECDES,'
      '       NUMDECIMAIS,'
      '       CARACDECIMAL,'
      '       IDRUBRICADEVOL,'
      '       NVL(COLPARCELAS,0) AS COLPARCELAS,'
      '       TAMPARCELAS,'
      '       COLOCORRENCIAS,'
      '       TAMOCORRENCIAS,'
      '       NVL(COLRUBRICA,0) AS COLRUBRICA,'
      '       TAMRUBRICA,'
      '       NVL(IDREGRA,0) AS IDREGRA,'
      '       COLVALINFO,'
      '       TAMVALINFO,'
      '       CARACNATUREZA,'
      '       COLNATUREZA,'
      '       COLOPERACAO,'
      '       COLCONTROLE,'
      '       TAMCONTROLE,'
      '       NVL(TO_NUMBER(COLMESREF),0) AS COLMESREF'
      'FROM LAYOUTXCOLUNAS'
      'WHERE IDLAYOUT = :IDLAYOUT')
    ValidateWithMask = True
    Left = 374
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
  end
  object updTmpDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  PLNCODIGOPREV = :PLNCODIGOPREV,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  RECPAG = :RECPAG,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  PLACONTAD = :PLACONTAD,'
      '  PLANO = :PLANO,'
      '  PLACONTAC = :PLACONTAC,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODDOCUMENTOPREV = :CODDOCUMENTOPREV,'
      '  FLGTIPODESC = :FLGTIPODESC,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  VALOR = :VALOR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDDESCONTO = :IDDESCONTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  NUMPRIORIDADE = :NUMPRIORIDADE,'
      '  ORDEM = :ORDEM,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  CODRETORNO = :CODRETORNO,'
      '  NUMDEPENDSEGURO = :NUMDEPENDSEGURO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  DATAREFERENCIA = :DATAREFERENCIA,'
      '  DESCRICAO = :DESCRICAO,'
      '  REFERENCIA = :REFERENCIA,'
      '  FLGFORNPAG = :FLGFORNPAG,'
      '  FLGFORNCOMISS = :FLGFORNCOMISS,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  CODDOCUMENTOEFET = :CODDOCUMENTOEFET,'
      '  PLNCODIGOEFET = :PLNCODIGOEFET,'
      '  SISTORIGEM = :SISTORIGEM,'
      '  FLGALTERADOR = :FLGALTERADOR,'
      '  PERIODO = :PERIODO,'
      '  EXERCICIO = :EXERCICIO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  DATACOBRANCA = :DATACOBRANCA,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDLOTE = :IDLOTE,'
      '  IDEMPCOBRANCA = :IDEMPCOBRANCA,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  SITENVIO = :SITENVIO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  FLGEXISTEHST = :FLGEXISTEHST,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  LOTEPREVIA = :LOTEPREVIA'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  FLGTIPODESC = :OLD_FLGTIPODESC and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  FLGDESCFOLHA = :OLD_FLGDESCFOLHA')
    InsertSQL.Strings = (
      'insert into TMPDESC'
      '  (MESREFERENCIA, CODALTERADOR, PLNCODIGOPREV, CODTIPRECDES, '
      'CODSUBCONTA, '
      
        '   RECPAG, IDEMPRESAPROP, CODTIPDOC, PLACONTAD, PLANO, PLACONTAC' +
        ', '
      'IDPESSOA, '
      '   CODDOCUMENTOPREV, FLGTIPODESC, CODPORTFORMA, VALOR, '
      'IDTITULAR, IDPLANASS, '
      '   IDDESCONTO, UNIDNEGOC, IDMOTIVO, CODCENTRORESPON, '
      'MESCOBRANCA, CODCENTROCUSTOD, '
      '   IDPESSJUR, IDPROVENTO, CODCENTROCUSTOC, IDPLANOPREV, '
      'IDEMPRESA, VALORRECEBIDO, '
      '   NUMPRIORIDADE, ORDEM, VALORBASE1, VALORBASE2, VALORBASE3, '
      'FLGDESCONTO, '
      '   CODRETORNO, NUMDEPENDSEGURO, CODPROVDESC, FLGDESCFOLHA, '
      'DATAREFERENCIA, '
      
        '   DESCRICAO, REFERENCIA, FLGFORNPAG, FLGFORNCOMISS, IDFUNDACAO,' +
        ' '
      'CODDOCUMENTOEFET, '
      '   PLNCODIGOEFET, SISTORIGEM, FLGALTERADOR, PERIODO, EXERCICIO, '
      'FLGATRASODEVOL, '
      '   DATACOBRANCA, NODOCUMENTO, COMPLDOCUMENTO, IDFAVORECIDO, '
      'IDLOTE, IDEMPCOBRANCA, '
      '   TIPCODIGO, SITENVIO, SEQPROPOSTA, FLGEXISTEHST, NUMLANCTO, '
      'LOTEPREVIA)'
      'values'
      
        '  (:MESREFERENCIA, :CODALTERADOR, :PLNCODIGOPREV, :CODTIPRECDES,' +
        ' '
      ':CODSUBCONTA, '
      '   :RECPAG, :IDEMPRESAPROP, :CODTIPDOC, :PLACONTAD, :PLANO, '
      ':PLACONTAC, '
      '   :IDPESSOA, :CODDOCUMENTOPREV, :FLGTIPODESC, :CODPORTFORMA, '
      ':VALOR, :IDTITULAR, '
      '   :IDPLANASS, :IDDESCONTO, :UNIDNEGOC, :IDMOTIVO, '
      ':CODCENTRORESPON, :MESCOBRANCA, '
      '   :CODCENTROCUSTOD, :IDPESSJUR, :IDPROVENTO, :CODCENTROCUSTOC, '
      ':IDPLANOPREV, '
      
        '   :IDEMPRESA, :VALORRECEBIDO, :NUMPRIORIDADE, :ORDEM, :VALORBAS' +
        'E1, '
      ':VALORBASE2, '
      '   :VALORBASE3, :FLGDESCONTO, :CODRETORNO, :NUMDEPENDSEGURO, '
      ':CODPROVDESC, '
      '   :FLGDESCFOLHA, :DATAREFERENCIA, :DESCRICAO, :REFERENCIA, '
      ':FLGFORNPAG, '
      '   :FLGFORNCOMISS, :IDFUNDACAO, :CODDOCUMENTOEFET, '
      ':PLNCODIGOEFET, :SISTORIGEM, '
      '   :FLGALTERADOR, :PERIODO, :EXERCICIO, :FLGATRASODEVOL, '
      ':DATACOBRANCA, '
      '   :NODOCUMENTO, :COMPLDOCUMENTO, :IDFAVORECIDO, :IDLOTE, '
      ':IDEMPCOBRANCA, '
      
        '   :TIPCODIGO, :SITENVIO, :SEQPROPOSTA, :FLGEXISTEHST, :NUMLANCT' +
        'O, '
      ':LOTEPREVIA)')
    DeleteSQL.Strings = (
      'delete from TMPDESC'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  FLGTIPODESC = :OLD_FLGTIPODESC and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  FLGDESCFOLHA = :OLD_FLGDESCFOLHA')
    Left = 331
    Top = 126
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar relatório do Envio de Benefícios'
    Left = 72
    Top = 404
  end
  object QryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      FLGDESCONTO'
      'FROM'
      '    PROVDESC'
      'WHERE'
      '     IDPROVENTO = :PROVENTO')
    ValidateWithMask = True
    Left = 237
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROVENTO'
        ParamType = ptUnknown
      end>
    object QryProvDescFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
      Origin = 'PROVDESC.FLGDESCONTO'
    end
  end
  object qryDepentIt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA'
      'FROM DEPENTIT'
      'WHERE IDTITULAR = :IDTITULAR'
      'AND NUMSEQUENCIA = :NUMSEQUENCIA')
    ValidateWithMask = True
    Left = 298
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMSEQUENCIA'
        ParamType = ptUnknown
      end>
  end
  object qryLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 30
    Top = 126
  end
  object qryAltLayDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Update'
      '      LAYOUTDESCONTO'
      'Set'
      '   ULTIMPORT = :NovoPeriodo'
      'Where'
      '     IDLAYOUT = :NumeroLayOut'
      '              ')
    ValidateWithMask = True
    Left = 670
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'NovoPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumeroLayOut'
        ParamType = ptUnknown
      end>
  end
  object qryMatric: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, P.IDPESS' +
        'JUR,'
      '       P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA'
      'FROM  ELEGPATRO E, PARTPREVPLAN P'
      'WHERE E.MATRICULA LIKE :MATRICULA'
      'AND P.IDPESSJUR = E.IDPESSJUR'
      'AND P.IDPESSOA = E.IDPESSOA'
      'AND P.FLGDESATIVADO = '#39'0'#39
      'UNION'
      'SELECT E.IDTITULAR, E.IDPESSOA, P.IDPESSJUR,'
      '       P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA'
      'FROM  DEPENTIT E, PARTPREVPLAN P'
      'WHERE E.MATRICULA LIKE :MATRICULA'
      'AND P.IDPESSOA = E.IDTITULAR'
      'AND P.FLGDESATIVADO = '#39'0'#39
      ' ')
    ValidateWithMask = True
    Left = 86
    Top = 181
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CTR.IDLOTE,'
      '      CTR.IDPESSOA,'
      '      CTR.MESREFERENCIA,'
      '      CTR.DESCRICAO,'
      '      LDE.FLGTIPOCONVENIO'
      'FROM TmpDESC TD,'
      '     CTRLINTERFACE CTR,'
      '     LAYOUTDESCONTO LDE'
      'WHERE'
      '     TD.IDLOTE = CTR.IDLOTE AND'
      '     CTR.IDREFERENCIA = 123 AND'
      '     CTR.MESREFERENCIA = '#39#39'  AND'
      '     TD.MESREFERENCIA = '#39#39' AND'
      '     LDE.IDLAYOUT = CTR.IDREFERENCIA'
      ''
      '')
    ValidateWithMask = True
    Left = 537
    Top = 126
  end
  object qryVerificaReg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOTAL'
      'FROM TMPDESC'
      'WHERE MESREFERENCIA = :PMESREFERENCIA'
      'AND IDTITULAR     = :PIDTITULAR'
      'AND IDPESSOA      = :PIDPESSOA '
      'AND IDPROVENTO    = :PIDPROVENTO'
      'AND IDLOTE        = :PIDLOTE'
      'AND IDPLANOPREV   = :PIDPLANOPREV'
      'AND IDPESSJUR     = :PIDPESSJUR'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 400
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PRV.FLGDESCONTO,'
      '      RXP.CODCENTRORESPON,'
      '      RXP.UNIDNEGOC,'
      '      RXP.CODTIPRECDES,'
      '      RXP.RECPAG,'
      '      RXP.PLACONTAD,'
      '      RXP.PLANO,'
      '      RXP.PLACONTAC,'
      '      PLP.NOME'
      'FROM'
      '    RUBRICAXPLANO RXP,'
      '    PLANPREV PLP,'
      '    PROVDESC PRV'
      'WHERE'
      '     RXP.IDPESSJUR = :IDPESSJUR'
      '     AND RXP.IDRUBRICA = :IDRUBRICA'
      '     AND RXP.IDPLANOPREV = :IDPLANOPREV'
      '     AND PLP.IDPLANOPREV = :IDPLANOPREV'
      '     AND PRV.IDPROVENTO = RXP.IDRUBRICA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 546
    Top = 173
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 37
    Top = 189
  end
  object qryRubricaIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM RUBRICAINDIV')
    ValidateWithMask = True
    Left = 126
    Top = 190
  end
  object updRubricaIndiv: TUpdateSQL
    Left = 461
    Top = 173
  end
  object qryRubExternaXInterna: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDPROVENTO,'
      '      DESCRICAO,'
      '      DESCRPROVDESC'
      'FROM'
      '    PROVDESC'
      'WHERE'
      '     IDPROVENTO = :IDPROVENTO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 356
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryRubInternaXExterna: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(CODPROVDESC,0) AS CODPROVDESC,'
      '       IDPROVENTO,'
      '       DESCRICAO,'
      '       DESCRPROVDESC'
      'FROM PROVDESC'
      'WHERE IDPROVENTO = :IDPROVENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRubricaIndiv
    ValidateWithMask = True
    Left = 180
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryEstatistica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TMP.IDPROVENTO, prv.codprovdesc, PRV.DESCRICAO, SUM(TMP.V' +
        'ALOR) AS VALOR_TOTAL, COUNT(*) AS QTD_TOTAL'
      'FROM TMPDESC TMP, PROVDESC PRV'
      'WHERE TMP.IDLOTE = 442'
      'AND TMP.IDPROVENTO = PRV.IDPROVENTO'
      'GROUP BY TMP.IDPROVENTO, prv.codprovdesc, PRV.DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 467
    Top = 126
  end
  object dsEstatistica: TDataSource
    DataSet = qryEstatistica
    Left = 601
    Top = 13
  end
  object qryRubExternaxInternaCont: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDPROVENTO,'
      '      DESCRICAO,'
      '      DESCRPROVDESC'
      'FROM'
      '    PROVDESC'
      'WHERE'
      '     CODPROVDESC = :CODPROVDESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 220
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end>
  end
  object qryaux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 277
    Top = 293
  end
  object qryDependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDTITULAR,IDPESSOA,IDPLANOPREV,IDPESSJUR'
      'FROM'
      '    VWPARTICIPDEPEN'
      'WHERE'
      '     MATRICULADEP  = :MATRICULA')
    ValidateWithMask = True
    Left = 177
    Top = 343
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
  end
  object qryrubricaxcontabancaria: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM RUBRICAXCONTABANCARIA'
      'WHERE IDPESSOA = :IDPESSOA'
      'AND IDRUBRICA = :IDRUBRICA'
      ' '
      ' ')
    Left = 426
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qrybuscacodprev: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select b.codprovdesc  from layoutxColunas a, provdesc b'
      '   where'
      '      a.idlayout = :idlayout'
      'and   b.idprovento = a.idrubrica')
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idlayout'
        ParamType = ptUnknown
      end>
    object qrybuscacodprevCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PROVDESC.CODPROVDESC'
      Size = 15
    end
  end
end
