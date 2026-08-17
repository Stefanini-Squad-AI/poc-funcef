object frmFrameConsultaHistorico: TfrmFrameConsultaHistorico
  Left = 0
  Top = 0
  Width = 789
  Height = 377
  TabOrder = 0
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 377
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 81
      Width = 789
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object PnlValores: TPanel
      Left = 0
      Top = 347
      Width = 789
      Height = 30
      Align = alBottom
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LblProventos: TLabel
        Left = 68
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Proventos'
      end
      object LblDescontos: TLabel
        Left = 279
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Descontos'
      end
      object LblValLiquido: TLabel
        Left = 502
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Valor Líquido '
      end
      object pnlProventos: TPanel
        Left = 135
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlDescontos: TPanel
        Left = 354
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnlLiquido: TPanel
        Left = 590
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 84
      Width = 789
      Height = 263
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = '&Rubricas'
        object dbgDetalhe: TwwDBGrid
          Left = 0
          Top = 0
          Width = 781
          Height = 235
          Selected.Strings = (
            'MES'#9'8'#9'Mês Ref.'
            'ORDEM'#9'6'#9'Ordem'
            'CODRUBRICA'#9'7'#9'Cod.~Rubrica~Interno'
            'CODRUBRICAEXT'#9'7'#9'Cod.~Rubrica~Externo'
            'RUBRICA'#9'49'#9'Descrição'
            'VALORPROVENTO'#9'9'#9'Proventos'
            'VALORDESCONTO'#9'10'#9'Descontos'
            'INFORMATIVO'#9'10'#9'Informativo'
            'CODIRRFDARF'#9'4'#9'Darf'
            'FLGIRRF'#9'2'#9'IR'
            'FLGSALFAM'#9'7'#9'Sal.~Fam.'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRubricasDetalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dados do &Pagamento'
        ImageIndex = 1
        object wwDBGrid1: TwwDBGrid
          Left = 373
          Top = 57
          Width = 407
          Height = 111
          Selected.Strings = (
            'NOME'#9'33'#9'Descrição'
            'FATOR'#9'14'#9'Fator')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsFator
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object PnlDetalhes: TPanel
          Left = 0
          Top = 0
          Width = 371
          Height = 169
          BevelInner = bvLowered
          TabOrder = 1
          object LblDataNasc: TLabel
            Left = 7
            Top = 17
            Width = 51
            Height = 13
            Caption = 'Data Nasc'
          end
          object LblNumDep: TLabel
            Left = 156
            Top = 17
            Width = 66
            Height = 13
            Caption = 'Nº Dep. IRRF'
          end
          object LblBanco: TLabel
            Left = 7
            Top = 76
            Width = 31
            Height = 13
            Caption = 'Banco'
          end
          object LblAgencia: TLabel
            Left = 66
            Top = 76
            Width = 39
            Height = 13
            Caption = 'Agência'
          end
          object LblContaCorrente: TLabel
            Left = 127
            Top = 76
            Width = 71
            Height = 13
            Caption = 'Conta Corrente'
          end
          object LblArqTxt: TLabel
            Left = 243
            Top = 76
            Width = 62
            Height = 13
            Caption = 'Arquivo texto'
          end
          object LblPortForma: TLabel
            Left = 7
            Top = 143
            Width = 72
            Height = 13
            Caption = 'Portador Forma'
          end
          object LblSitucao: TLabel
            Left = 43
            Top = 119
            Width = 42
            Height = 13
            Caption = 'Situação'
          end
          object lblVersaoEstorno: TLabel
            Left = 5
            Top = 143
            Width = 76
            Height = 13
            Caption = 'Pago na Versão'
            Visible = False
          end
          object lblDtInicio: TLabel
            Left = 7
            Top = 38
            Width = 53
            Height = 13
            Caption = 'Data Início'
          end
          object lblDtFinal: TLabel
            Left = 121
            Top = 38
            Width = 42
            Height = 13
            Caption = 'Data Fim'
          end
          object dbedPortForma: TwwDBEdit
            Left = 100
            Top = 139
            Width = 266
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRICAO'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedVersaoEstorno: TwwDBEdit
            Left = 100
            Top = 139
            Width = 61
            Height = 21
            Color = clInfoBk
            DataField = 'IDVERSAOPAGTO'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
          end
          object dbedSituacao: TwwDBEdit
            Left = 100
            Top = 115
            Width = 266
            Height = 21
            Color = clInfoBk
            DataField = 'SITUACAO'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDataNasc: TwwDBEdit
            Left = 67
            Top = 13
            Width = 85
            Height = 21
            Color = clInfoBk
            DataField = 'DATANASC'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedNumDepIR: TwwDBEdit
            Left = 228
            Top = 13
            Width = 28
            Height = 21
            Color = clInfoBk
            DataField = 'NUMDEPIRRF'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbchIsentoIR: TDBCheckBox
            Left = 263
            Top = 15
            Width = 103
            Height = 17
            Caption = 'Isento de IRRF'
            DataField = 'FLGISENTOIRRF'
            DataSource = dsPrevia
            ReadOnly = True
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedBanco: TwwDBEdit
            Left = 7
            Top = 89
            Width = 46
            Height = 21
            Color = clInfoBk
            DataField = 'NUMBANCO'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedAgencia: TwwDBEdit
            Left = 66
            Top = 89
            Width = 46
            Height = 21
            Color = clInfoBk
            DataField = 'NUMAGENCIA'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedContaCorrente: TwwDBEdit
            Left = 127
            Top = 89
            Width = 102
            Height = 21
            Color = clInfoBk
            DataField = 'CONTACORRENTE'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedNomeArqTxt: TwwDBEdit
            Left = 243
            Top = 89
            Width = 123
            Height = 21
            Color = clInfoBk
            DataField = 'NOMETXT'
            DataSource = dsPrevia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edtDtInicio: TEdit
            Left = 7
            Top = 50
            Width = 85
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object edtDtFinal: TEdit
            Left = 121
            Top = 50
            Width = 85
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object chkBenefProvisorio: TDBCheckBox
            Left = 229
            Top = 52
            Width = 136
            Height = 17
            Caption = 'Benef. Provisório'
            TabOrder = 12
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object PnlSRB: TPanel
          Left = 372
          Top = 0
          Width = 408
          Height = 55
          BevelInner = bvLowered
          TabOrder = 2
          object pnlMostraSRB: TPanel
            Left = 2
            Top = 2
            Width = 404
            Height = 51
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lblValorSRB: TLabel
              Left = 21
              Top = 10
              Width = 49
              Height = 13
              Caption = 'Valor SRB'
            end
            object lblValorINSS: TLabel
              Left = 157
              Top = 10
              Width = 52
              Height = 13
              Caption = 'Valor INSS'
            end
            object lblSuplementacao: TLabel
              Left = 288
              Top = 10
              Width = 62
              Height = 13
              Caption = 'Valor Integral'
            end
            object pnlValorSRB: TPanel
              Left = 19
              Top = 25
              Width = 107
              Height = 21
              Alignment = taRightJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Caption = '0,00 '
              Color = clAqua
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object pnlValorINSS: TPanel
              Left = 155
              Top = 25
              Width = 107
              Height = 21
              Alignment = taRightJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Caption = '0,00 '
              Color = clAqua
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object pnlValorSupl: TPanel
              Left = 286
              Top = 25
              Width = 107
              Height = 21
              Alignment = taRightJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Caption = '0,00 '
              Color = clAqua
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
    end
    object PnlHistorico: TPanel
      Left = 0
      Top = 0
      Width = 789
      Height = 81
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object dbgHistorico: TwwDBGrid
        Left = 2
        Top = 2
        Width = 490
        Height = 77
        Selected.Strings = (
          'IDHSTFOLHABENEF'#9'6'#9'Versão'
          'MESCOBRANCA'#9'7'#9'Mês'
          'DATAPAGAMENTO'#9'10'#9'Dt. Pagto.'
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSelecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DBGridRecebedor: TwwDBGrid
        Left = 492
        Top = 2
        Width = 295
        Height = 77
        Selected.Strings = (
          'BENEFICIARIO'#9'45'#9'Recebedor'#9'F')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = DBGridRecebedorRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alRight
        DataSource = dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnColEnter = DBGridRecebedorColEnter
        OnColExit = DBGridRecebedorColExit
        IndicatorColor = icBlack
      end
    end
  end
  object qryPrevia: TwwQuery
    AfterOpen = qryPreviaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJR.NOME AS PATROCINADORA,'
      '  TIT.NOME AS TITULAR,'
      '  ELG.MATRICULA,'
      '  BEN.NOME AS BENEFICIARIO,'
      '  PLP.NOME AS PLANO,'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(HST.FLGESTORNO,'
      '           Null, '#39'PAGAMENTO NORMAL'#39','
      '           0,    '#39'PAGAMENTO NORMAL'#39','
      '           1,    '#39'PAGAMENTO PENDENTE'#39','
      '           2,    '#39'PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'#39','
      
        '           3,    '#39'PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO P' +
        'ARA CAP)'#39','
      '           9,    '#39'PAGAMENTO INDEVIDO ESTORNADO'#39') AS SITUACAO,'
      '  HST.IDVERSAOPAGTO,'
      
        '  SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),7,4)||SUBSTR(TO' +
        '_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),3,3) AS DATAPAGAMENTO,'
      '  NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF,'
      
        '  NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIR' +
        'RF,'
      '  PSF.DATANASC,'
      '  HST.IDRESPONSAVEL,'
      '  HST.MESCOBRANCA,'
      '  HST.IDPESSJUR,'
      '  HST.NUMBANCO,'
      '  HST.NUMAGENCIA,'
      '  HST.CONTACORRENTE,'
      '  HFCAP.NOMETXT,'
      '  PTF.DESCRICAO'
      'FROM'
      '  HISTRUBSAL HST,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO ELG,'
      '  PESSOAFISICA PSF,'
      '  PESSOA TIT,'
      '  PESSOA BEN,'
      '  PLANPREV PLP,'
      '  PESSOA PJR,'
      '  HSTFOLHABENEFCAP HFCAP,'
      '  PORTADORFORMA PTF'
      ''
      'WHERE'
      '  (HST.IDHSTFOLHABENEF = :IDFOLHA)                 AND'
      '  (HST.IDTITULAR       = :IDTITULAR)               AND'
      '  (HST.IDHSTFOLHABENEF = HFCAP.IDHSTFOLHABENEF(+)) AND'
      '  (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+))    AND'
      '  (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+))      AND'
      '  (PPP.IDPESSJUR       = HST.IDPATRO)              AND'
      '  (PJR.IDPESSOA        = HST.IDPATRO)              AND'
      '  (PPP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
      '  (PPP.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (TIT.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (BEN.IDPESSOA        = HST.IDRESPONSAVEL)        AND'
      '  (PLP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
      '  (ELG.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (PSF.IDPESSOA        = BEN.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 196
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object dsPrevia: TwwDataSource
    DataSet = qryPrevia
    Left = 226
    Top = 54
  end
  object dsRubricasDetalhe: TwwDataSource
    DataSet = qryRubricasDetalhe
    Left = 256
    Top = 54
  end
  object qryRubricasDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  HST.MES,'
      '  HST.IDPESSOA,'
      '  HST.VALORPROVENTO AS IDPROVENTO,'
      
        '  DECODE(PRD.FLGDESCONTO,0,HST.VALORPROVENTO,NULL) VALORPROVENTO' +
        ','
      
        '  DECODE(PRD.FLGDESCONTO,1,HST.VALORPROVENTO,NULL) VALORDESCONTO' +
        ','
      '  PRD.FLGDESCONTO,'
      '  HST.SEQRUBRICA AS ORDEM,'
      '  PRD.CODIRRFDARF,'
      '  HST.IDRUBRICA AS CODRUBRICA,'
      '  PRD.CODPROVDESC AS CODRUBRICAEXT,'
      '  PRD.DESCRPROVDESC AS RUBRICA ,'
      '  HST.FLGIRRF,'
      '  TO_CHAR(DECODE(PRD.FLGDESCONTO,1,NULL,2,'
      
        '                                DECODE(HST.VALORRECEBIDO-HST.VAL' +
        'ORPROVENTO,0,'
      
        '                                DECODE(HST.VALORINFO,0,NULL,HST.' +
        'VALORINFO||'#39' (I)'#39'),'
      
        '                                HST.VALORRECEBIDO-HST.VALORPROVE' +
        'NTO||'#39' (R)'#39'))) AS INFORMATIVO,'
      '  HST.FLGSALFAM'
      ''
      'FROM'
      '  HISTRUBSAL HST,'
      '  PROVDESC PRD'
      ''
      'WHERE'
      '  (HST.IDHSTFOLHABENEF = :IDFOLHA)      AND'
      '  (HST.IDTITULAR       = :IDTITULAR)    AND'
      '  (HST.IDPESSOA        = :IDPESSOA)     AND'
      '  (PRD.IDPROVENTO      = HST.IDRUBRICA) AND'
      '  (PRD.FLGESPECIAL    <> 2)'
      ''
      'ORDER BY'
      '  PRD.FLGDESCONTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'#,##0.00'#9'T'#9'T'
      'VALORDESCONTO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 286
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 167
    Top = 54
  end
  object dsFator: TDataSource
    DataSet = qryFator
    Left = 137
    Top = 38
  end
  object qryFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, FATOR'
      'FROM ('
      'SELECT BPV.NOMEVALORBASE1 AS NOME, BPP.VALORBASE1 AS FATOR'
      'FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B'
      'WHERE BPP.IDPESSOA = :PIDPESSOA'
      'AND BPP.IDPLANOPREV = BPV.IDPLANOPREV'
      'AND BPP.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND BPV.FLGREFERENCIA = 0'
      'AND B.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND B.TIPOBENEFICIO <> 99'
      'UNION'
      'SELECT BPV.NOMEVALORBASE2 AS NOME, BPP.VALORBASE2 AS FATOR'
      'FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B'
      'WHERE BPP.IDPESSOA = :PIDPESSOA'
      'AND BPP.IDPLANOPREV = BPV.IDPLANOPREV'
      'AND BPP.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND BPV.FLGREFERENCIA = 0'
      'AND B.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND B.TIPOBENEFICIO <> 99'
      'UNION'
      'SELECT BPV.NOMEVALORBASE3 AS NOME, BPP.VALORBASE3 AS FATOR'
      'FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B'
      'WHERE BPP.IDPESSOA = :PIDPESSOA'
      'AND BPP.IDPLANOPREV = BPV.IDPLANOPREV'
      'AND BPP.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND BPV.FLGREFERENCIA = 0'
      'AND B.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND B.TIPOBENEFICIO <> 99'
      'UNION'
      'SELECT DISTINCT '#39'% RATEIO'#39' AS NOME, BFC.PERCENTUAL AS FATOR'
      
        'FROM HSTBENEFBFCIARIO H, BENEFPLANPREV BPV, BFCIARIOTITPLAN BFC,' +
        ' BENEFICIO B'
      'WHERE H.IDTITULAR = :PIDTITULAR'
      'AND H.IDPESSOA = :PIDPESSOA'
      'AND H.IDHSTFOLHABENEF = :IDFOLHA'
      'AND H.IDPESSOA <> H.IDTITULAR'
      'AND H.IDPLANOPREV = BPV.IDPLANOPREV'
      'AND H.IDBENEFICIO = BPV.IDBENEFICIO'
      'AND BPV.FLGREFERENCIA = 0'
      'AND H.IDPLANOPREV = BFC.IDPLANOPREV'
      'AND H.IDPESSJUR = BFC.IDPESSJUR'
      'AND H.IDBENEFICIO = BFC.IDBENEFICIO'
      'AND H.IDPESSOA = BFC.IDPESSOA'
      'AND H.IDTITULAR = BFC.IDTITULAR'
      'AND H.SEQPROPOSTA = BFC.SEQPROPOSTA'
      'AND B.IDBENEFICIO = H.IDBENEFICIO'
      'AND B.TIPOBENEFICIO <> 99'
      ') G'
      'WHERE NOME IS NOT NULL AND FATOR > 0'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 109
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end>
  end
  object dsSelecao: TwwDataSource
    DataSet = qrySelecao
    Left = 42
    Top = 38
  end
  object qrySelecao: TwwQuery
    AfterScroll = qrySelecaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT HIS.HISTORICO, HST.MESCOBRANCA, HST.IDHSTFOLHABE' +
        'NEF,'
      '       HST.DATAPAGAMENTO'
      'FROM HISTRUBSAL HST, HSTFOLHABENEF HIS'
      'WHERE HST.IDTITULAR = :TITULAR'
      'AND HST.IDMODULO = 18'
      'AND HIS.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF'
      
        'ORDER BY HST.DATAPAGAMENTO DESC, HST.MESCOBRANCA DESC, HST.IDHST' +
        'FOLHABENEF DESC'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 79
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptInput
        Value = '11'
      end>
    object qrySelecaoIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão'
      DisplayWidth = 6
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.HISTORICO'
    end
    object qrySelecaoMESCOBRANCA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 7
    end
    object qrySelecaoDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto.'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
      Origin = 'BASEDADOS.HISTRUBSAL.DATAPAGAMENTO'
    end
    object qrySelecaoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
  end
end
