inherited cfgRelResumoContratoCaixa: TcfgRelResumoContratoCaixa
  Left = 88
  Top = -2
  Caption = 'Resumo de Contratos (visão Caixa)'
  ClientHeight = 441
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 622
    Height = 408
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object chkEmAberto: TCheckBox
      Left = 24
      Top = 264
      Width = 281
      Height = 17
      Caption = 'Exibir apenas contratos com valor devido'
      TabOrder = 6
    end
    object Panel1: TPanel
      Left = 320
      Top = 200
      Width = 289
      Height = 57
      TabOrder = 4
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 135
        Height = 13
        Caption = 'Mês/ano de Referência'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 184
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
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
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 328
      Width = 353
      Height = 65
      TabOrder = 11
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 38
        Width = 87
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 1
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 2
      end
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 64
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
      LookupField = 'IDTIPOEMPTMO'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    object DBcboTipoContr: TwwDBLookupCombo
      Left = 320
      Top = 64
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoContr
      LookupField = 'IDTIPOCONTREMPTMO'
      DropDownWidth = 8
      Enabled = False
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited edtNome: TEdit
        Width = 353
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 177
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 153
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object chkDivergente: TCheckBox
      Left = 16
      Top = 396
      Width = 281
      Height = 17
      Caption = 'Exibir apenas Contratos "divergentes"'
      Color = clAppWorkSpace
      ParentColor = False
      TabOrder = 5
      Visible = False
    end
    object chkApropriado: TCheckBox
      Left = 24
      Top = 284
      Width = 313
      Height = 17
      Caption = 'Considerar apenas itens apropriados, se abonados'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
    end
    object chkAbonoContab: TCheckBox
      Left = 352
      Top = 264
      Width = 289
      Height = 17
      Caption = 'Considerar apenas abonos contabilizados'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    object chkRenovacao: TCheckBox
      Left = 352
      Top = 284
      Width = 289
      Height = 17
      Caption = 'NÃO Considerar quitações por renovação'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 9
    end
    object chkSintetico: TCheckBox
      Left = 24
      Top = 356
      Width = 129
      Height = 17
      Caption = 'Relatório sintético'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 87
      Height = 123
      TabOrder = 12
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 105
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 450
      DockPos = 522
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 278
      DockPos = 350
    end
  end
  object qryRelatorio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   PPP.INSCRICAONUMERO,'
      '   MUT.NOME,'
      ''
      '   NVL(SALDO_ANT.DEVE, 0)                 AS SALDO_ANT,'
      '   NVL(PARCELAS.HMEVLRPREVISTO, 0)        AS PARCELAS,'
      '   NVL(ENCARGOS.HMEVLRPREVISTO, 0)        AS ENCARGOS,'
      '   NVL(REC_PARC.HMEVLRPREVISTO, 0)        AS REC_PARC,'
      '   NVL(REC_ENC.HMEVLRPREVISTO, 0)         AS REC_ENC,'
      '   NVL(REC_AMORT.HMEVLRPREVISTO, 0)       AS REC_AMORT,'
      '   NVL(REC_QUIT.HMEVLRPREVISTO, 0)        AS REC_QUIT,'
      '   NVL(AMORT.HMEVLRPREVISTO, 0)           AS AMORTIZACAO,'
      '   NVL(QUITACAO.HMEVLRPREVISTO, 0)        AS QUITACAO,'
      '   NVL(ABONADO.HMEVLRPREVISTO, 0)         AS ABONADO,'
      '   NVL(QUITADO.HMEVLRPREVISTO, 0)         AS QUITADO,'
      '   NVL(SALDO_DEV.DEVE, 0)                 AS SALDO_DEV,'
      ''
      '   ('
      '     TRUNC(NVL(SALDO_ANT.DEVE, 0), 2)'
      '   + TRUNC(NVL(PARCELAS.HMEVLRPREVISTO, 0), 2)'
      '   + TRUNC(NVL(ENCARGOS.HMEVLRPREVISTO, 0), 2)'
      '   + TRUNC(NVL(AMORT.HMEVLRPREVISTO, 0), 2)'
      '   + TRUNC(NVL(QUITACAO.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(REC_PARC.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(REC_ENC.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(REC_AMORT.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(REC_QUIT.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(ABONADO.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(QUITADO.HMEVLRPREVISTO, 0), 2)'
      '   - TRUNC(NVL(SALDO_DEV.DEVE, 0), 2)'
      '   ) AS DIFERENCA'
      ''
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   DEPENTIT        DEP,'
      '   PARTPREVPLAN    PPP,'
      '   TIPOEMPTMO      TEP,'
      '   TIPOCONTREMPTMO TCE,'
      '   PESSOA          MUT,'
      ''
      
        '-- SALDO ANTERIOR ----------------------------------------------' +
        '------------------------------'
      '   ('
      '   SELECT'
      '      C.IDCONTRATOEMPTMO,'
      
        '      (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEV' +
        'E,'
      
        '      DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_' +
        'PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT'
      '   FROM'
      '      CONTRATOEMPTMO C,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) A' +
        'S VLR_DEV'
      '      FROM'
      '         HISTMOVEMPTMO  HME,'
      '         CONTRATOEMPTMO CON'
      '      WHERE'
      '             CON.FLGSITUACAO        <> '#39'C'#39
      '         AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '         AND HME.HMESEQCOBRANCA     = 1'
      '         AND HME.HMEDATAPREVISTA    <=:PDATAANT'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) PAR_DEV,'
      '      ('
      '      SELECT'
      '         CON.IDCONTRATOEMPTMO,'
      '         SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                   DECODE(FLGABONADO, 1, NVL(HME' +
        '.HMEVLRPREVISTO, 0),'
      
        '                                                         NVL(HME' +
        '.HMEVLREFETIVO, 0)))) AS VLR_PAG'
      '      FROM'
      '         HISTMOVEMPTMO  HME,'
      '         CONTRATOEMPTMO CON'
      '      WHERE'
      '             CON.FLGSITUACAO        <> '#39'C'#39
      '         AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '         AND HME.HMEDATAPREVISTA    <=:PDATAANT'
      '         AND ('
      '             (HME.HMEDATAEFETIVA    <=:PDATAANT)'
      
        '             OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO' +
        ' <=:PDATAANT) )'
      
        '             OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO' +
        ' <=:PDATAANT) )'
      '             )'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) PAR_PAG'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)'
      '      AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)'
      '   ) SALDO_ANT,'
      
        '-- FIM SALDO ANTERIOR ------------------------------------------' +
        '------------------------------'
      ''
      ''
      
        '-- PARCELAS ----------------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(HMEVLRPREVISTO) AS HMEVLRPREVIST' +
        'O'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 1'
      '      AND HME.HMEPARCELA         > 0'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      ''
      '      AND HME.HMEDATAPREVISTA    BETWEEN :PDATAINI AND :PDATAATU'
      ''
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '  GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PARCELAS,'
      
        '-- FIM PARCELAS ------------------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- ENCARGOS ----------------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(HMEVLRPREVISTO) AS HMEVLRPREVIST' +
        'O'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 4'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      ''
      '      AND ('
      '          (NVL(HME.FLGABONADO, 0) = 0) OR'
      
        '          (:PAPROPRIADO           IS NULL OR (NVL(HME.FLGABONADO' +
        ', 0) = 1 AND HME.PLNCODIGO IS NOT NULL))'
      '          )'
      ''
      '      AND HME.HMEDATAPREVISTA    BETWEEN :PDATAINI AND :PDATAATU'
      ''
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '  GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) ENCARGOS,'
      
        '-- FIM ENCARGOS ------------------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- AMORTIZAÇÃO -------------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(HMEVLRPREVISTO) AS HMEVLRPREVIST' +
        'O'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 2'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      ''
      '      AND HME.HMEDATAPREVISTA    BETWEEN :PDATAINI AND :PDATAATU'
      ''
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '  GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) AMORT,'
      
        '-- FIM AMORTIZAÇÃO ---------------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- QUITAÇÂO ----------------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(HMEVLRPREVISTO) AS HMEVLRPREVIST' +
        'O'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 3'
      '      AND (:PRENOVACAO           IS NULL OR HME.HMEORIGEM <> 0)'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      ''
      '      AND HME.HMEDATAPREVISTA    BETWEEN :PDATAINI AND :PDATAATU'
      ''
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '  GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) QUITACAO,'
      
        '-- FIM QUITAÇÃO ------------------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- PARCELAS RECEBIDAS ------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 1'
      '      AND HME.HMEPARCELA         > 0'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEDATAEFETIVA     BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) REC_PARC,'
      
        '-- FIM PARCELAS RECEBIDAS --------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- ENCARGOS RECEBIDOS ------------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 4'
      ''
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      ''
      '      AND HME.HMEDATAEFETIVA     BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) REC_ENC,'
      
        '-- FIM ENCARGOS RECEBIDOS --------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- AMORTIZAÇÕES RECEBIDAS --------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 2'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEDATAEFETIVA     BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) REC_AMORT,'
      
        '-- FIM AMORTIZAÇÕES RECEBIDAS ----------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- QUITAÇÕES RECEBIDAS -----------------------------------------' +
        '----------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 3'
      '      AND (:PRENOVACAO           IS NULL OR HME.HMEORIGEM <> 0)'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEDATAEFETIVA     BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) REC_QUIT,'
      
        '-- FIM QUITAÇÕES RECEBIDAS -------------------------------------' +
        '----------------------'
      ''
      ''
      
        '-- ITENS ABONADOS ----------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      SUM(DECODE(NVL(FLGABONADO, 0), 0, 0, NVL(HME.HMEVLRPREVIST' +
        'O, 0))) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND NVL(HME.FLGABONADO, 0) = 1'
      
        '      AND (:PABONOCONTAB         IS NULL OR HME.PLNCODIGOESTORNO' +
        ' IS NOT NULL)'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEDATAQUITABONO   BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) ABONADO,'
      
        '-- FIM ITENS ABONADOS ------------------------------------------' +
        '------------------------------------'
      ''
      ''
      
        '-- ITENS QUITADOS ----------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      SUM(DECODE(NVL(FLGQUITADO, 0), 0, 0, NVL(HME.HMEVLRPREVIST' +
        'O, 0))) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND NVL(HME.FLGQUITADO, 0) = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEDATAQUITABONO   BETWEEN :PDATAINI AND :PDATAATU'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) QUITADO,'
      
        '-- FIM ITENS QUITADOS ------------------------------------------' +
        '------------------------------------'
      ''
      ''
      
        '-- SALDO ATUAL -------------------------------------------------' +
        '---------------------------'
      '   ('
      '   SELECT'
      '      C.IDCONTRATOEMPTMO,'
      
        '      (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEV' +
        'E,'
      
        '      DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(PAR_' +
        'PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT'
      '   FROM'
      '      CONTRATOEMPTMO C,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) A' +
        'S VLR_DEV'
      '      FROM'
      '         HISTMOVEMPTMO  HME,'
      '         CONTRATOEMPTMO CON'
      '      WHERE'
      '             CON.FLGSITUACAO        <> '#39'C'#39
      '         AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '         AND HME.HMESEQCOBRANCA     = 1'
      '         AND HME.HMEDATAPREVISTA    <=:PDATAATU'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) PAR_DEV,'
      '      ('
      '      SELECT'
      '         CON.IDCONTRATOEMPTMO,'
      
        '         SUM(DECODE(HME.FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0' +
        '),'
      
        '                                       DECODE(FLGABONADO, 1, NVL' +
        '(HME.HMEVLRPREVISTO, 0),'
      
        '                                                             NVL' +
        '(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG'
      '      FROM'
      '         HISTMOVEMPTMO  HME,'
      '         CONTRATOEMPTMO CON'
      '      WHERE'
      '             CON.FLGSITUACAO        <> '#39'C'#39
      '         AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '         AND HME.HMEDATAPREVISTA    <=:PDATAATU'
      '         AND ('
      '             (HME.HMEDATAEFETIVA    <=:PDATAATU)'
      
        '             OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO' +
        ' <=:PDATAATU) )'
      
        '             OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO' +
        ' <=:PDATAATU) )'
      '             )'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) PAR_PAG'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)'
      '      AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)'
      '      ) SALDO_DEV'
      
        '-- FIM SALDO ATUAL ---------------------------------------------' +
        '---------------------------'
      ''
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP     =:PIDEMPRESAPROP'
      '   AND CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      ''
      '   AND CON.IDCONTRATOEMPTMO  = SALDO_ANT.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = SALDO_DEV.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = PARCELAS.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = ENCARGOS.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = AMORT.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = QUITACAO.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = REC_PARC.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = REC_ENC.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = REC_AMORT.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = REC_QUIT.IDCONTRATOEMPTMO(+)'
      ''
      '   AND CON.IDCONTRATOEMPTMO  = ABONADO.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = QUITADO.IDCONTRATOEMPTMO(+)'
      ''
      '   AND CON.IDBENEF           = DEP.IDPESSOA'
      '   AND CON.IDPESSOA          = DEP.IDTITULAR'
      ''
      '   AND CON.IDPESSOA          = PPP.IDPESSOA'
      '   AND PPP.FLGDESATIVADO     = 0'
      ''
      '   AND CON.IDBENEF           = MUT.IDPESSOA'
      ''
      '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 336
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPRIADO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONOCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryRelatorioDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryRelatorioTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryRelatorioIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryRelatorioMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRelatorioINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryRelatorioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRelatorioSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qryRelatorioPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryRelatorioENCARGOS: TFloatField
      FieldName = 'ENCARGOS'
    end
    object qryRelatorioREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryRelatorioREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryRelatorioREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryRelatorioREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryRelatorioAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryRelatorioQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryRelatorioABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryRelatorioQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryRelatorioSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryRelatorioDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
  end
  object qryContratos: TwwQuery
    BeforeOpen = qryContratosBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CON.IDCONTRATOEMPTMO,'
      '  TEP.DESCTIPOEMPTMO,'
      '  TCE.TCEDESCRICAO'
      ''
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       CON.FLGSITUACAO        <> '#39'C'#39
      '   AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO'
      '   AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'
      ''
      'ORDER BY'
      '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO, CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 152
    Top = 384
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryContratosDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContratosTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
  object qryLookTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      '   TEP.IDTIPOEMPTMO,'
      '   TEP.DESCTIPOEMPTMO'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       ( TEP.IDEMPRESAPROP    =:PIDEMPRESAPROP )'
      '   AND ( TCE.IDTIPOEMPTMO     = TEP.IDTIPOEMPTMO )'
      ''
      'ORDER BY'
      '   TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 56
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryLookTipoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryLookTipoContrIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDTIPOEMPTMO'
    end
    object qryLookTipoContrDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PPC.NOME AS NOMEPLANO,'
      '   PTR.NOME AS NOMEPATRO,'
      ''
      '   (PPC.NOME || '#39' - '#39' || PTR.NOME) AS NOMEPLANOPATRO,'
      '   PPP.INSCRICAONUMERO,'
      ''
      '   TCE.TCEDESCRICAO,'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   MUT.NOME,'
      ''
      '   CON.TXJUROS,'
      '   CON.VLRCONTRATO,'
      '   CON.DATACREDITO,'
      '   CON.NUMPARCELAS,'
      ''
      
        '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'PENSIONISTA' +
        #39') AS SIT_PART'
      ''
      'FROM'
      '   PESSOA            MUT,'
      '   PESSOA            PTR,'
      '   DEPENTIT          DEP,'
      '   PARTPREVPLAN      PPP,'
      '   SITPART           SIT,'
      '   TIPOCONTREMPTMO   TCE,'
      '   TIPOEMPTMO        TEP,'
      '   VWMIGRACONTRATOEP MIG,'
      '   PLANPREVCONTABIL  PPC,'
      '   CONTRATOEMPTMO    CON'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.IDPATRO               =:PIDPATRO'
      ''
      '   AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND MIG.DATAMIGRA             = (select max(DATAMIGRA)'
      '                                    from   VWMIGRACONTRATOEP'
      
        '                                    where  IDCONTRATOEMPTMO = CO' +
        'N.IDCONTRATOEMPTMO'
      
        '                                    and    DATAMIGRA <= :PHMEDAT' +
        'AFIM)'
      '   AND MIG.IDPLANOCONTATU        =:IDPLANOPREV'
      ''
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
      '   AND PPP.FLGDESATIVADO         = 0'
      '   AND TCE.IDTIPOCONTREMPTMO     =:PIDTIPOCONTREMPTMO'
      ''
      
        '   AND (:PIDTIPOCONTRFILTRO      IS NULL OR TCE.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTRFILTRO)'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR CON.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO)'
      ''
      
        '   AND (:PIDSITPART              IS NULL OR SIT.IDSITPART =:PIDS' +
        'ITPART)'
      ''
      '   AND'
      '   EXISTS ('
      '          SELECT 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      
        '                 HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI ' +
        'AND :PHMEDATAFIM'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      '          )'
      ''
      ''
      '   AND PPC.IDPLANOPREV           = MIG.IDPLANOCONTATU'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      '   AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   DECODE(NVL(:PORDEM, 0), 0, CON.IDCONTRATOEMPTMO),'
      '   DECODE(NVL(:PORDEM, 0), 1, MUT.NOME),'
      '   DECODE(NVL(:PORDEM, 0), 2, DEP.MATRICULA),'
      '   CON.IDCONTRATOEMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDSITPART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDSITPART'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end>
    object qryContratoNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryContratoNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratoNOMEPLANOPATRO: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
  end
  object qryMovimentoNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      ''
      '   AND HME.HMETIPOMOV            =:PHMETIPOMOV'
      ''
      '   AND HME.HMESEQCOBRANCA        = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND HME.HMEDATAPREVISTA      >=:PDATAINI'
      '   AND HME.HMEDATAPREVISTA      <=:PDATAFIM'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 168
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object qryMovimentoNormalHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'HMEVLRPREVISTO,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      
        '           DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO *' +
        ' (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMETIPOMOV         = 3'
      '           AND HME.HMEORIGEM          <> 8'
      '           AND ITC.ITCTRATASALDODEV   <> 0'
      '           AND HME.HMEDATAPREVISTA    >=:PDATAINI'
      '           AND HME.HMEDATAPREVISTA    <=:PDATAFIM'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
  end
  object qryQuitacaoMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'HMEVLRPREVISTO,'
      
        '        NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUM         ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A,                                      ' +
        '                                     '
      
        '        (                                                       ' +
        '                                     '
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,                               '
      
        '           TC.IDTIPOCONTREMPTMO,                                ' +
        '                                     '
      ''
      
        '           DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO *' +
        ' (-1)), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO '
      ''
      
        '        FROM                                                    ' +
        '                                     '
      
        '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                 ' +
        '                                     '
      
        '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC               ' +
        '                                     '
      
        '        WHERE                                                   ' +
        '                                     '
      
        '               HME.HMETIPOMOV         = 3                       ' +
        '                                     '
      
        '           AND HME.HMEORIGEM          = 8                       ' +
        '                                     '
      
        '           AND ITC.ITCTRATASALDODEV   <> 0                      ' +
        '                                     '
      '           AND C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMEDATAPREVISTA    >=:PDATAINI'
      '           AND HME.HMEDATAPREVISTA    <=:PDATAFIM'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      
        '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO      ' +
        '                                     '
      
        '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO    ' +
        '                                     '
      
        '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO   ' +
        '                                     '
      
        '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO        ' +
        '                                     '
      
        '        ) CON                                                   ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacaoMorteIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacaoMorteHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoMorteTOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
    end
  end
  object qryItensAbonados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS AB' +
        'ONADO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_ABONADO'
      '   FROM'
      '      ('
      '      SELECT '
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO, '
      '         TC.IDTIPOCONTREMPTMO, '
      
        '         DECODE(NVL(FLGABONADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO' +
        ', 0)) AS HMEVLREFETIVO '
      '      FROM '
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '         AND ((:PABONOCONTAB IS NULL) OR (:PABONOCONTAB = 1 AND ' +
        'HME.PLNCODIGOESTORNO   IS NOT NULL))'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      
        '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNAD' +
        'O = 0) )'
      '         AND NVL(HME.FLGABONADO, 0) = 1'
      
        '         AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :PH' +
        'MEDATAFIM'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '
      '      ) CON'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONOCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONOCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryItensAbonadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensAbonadosABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryItensAbonadosTOT_ABONADO: TFloatField
      FieldName = 'TOT_ABONADO'
    end
  end
  object qryItensQuitados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS QU' +
        'ITADO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_QUITADO'
      '   FROM '
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO,'
      
        '         DECODE(NVL(FLGQUITADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO' +
        ', 0)) AS HMEVLREFETIVO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      
        '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNAD' +
        'O = 0) )'
      '         AND NVL(HME.FLGQUITADO, 0) = 1'
      
        '         AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :PH' +
        'MEDATAFIM'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '
      '      ) CON '
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryItensQuitadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensQuitadosQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryItensQuitadosTOT_QUITADO: TFloatField
      FieldName = 'TOT_QUITADO'
    end
  end
  object qryParcRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_P' +
        'ARC,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryParcRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcRecREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryParcRecTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
  object qryAmoRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_A' +
        'MORT,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 2'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 130
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryAmoRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAmoRecREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryAmoRecTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
  end
  object qryQuiRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_Q' +
        'UIT,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMEORIGEM         <> 0'
      '      AND HMETIPOMOV             = 3'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuiRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuiRecREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryQuiRecTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
  end
  object qryEncRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_E' +
        'NC,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 4'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 98
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryEncRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryEncRecREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryEncRecTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
  end
  object qryAjusteRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_A' +
        'JUSTE,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 8'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryAjusteRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAjusteRecREC_AJUSTE: TFloatField
      FieldName = 'REC_AJUSTE'
    end
    object qryAjusteRecTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
end
