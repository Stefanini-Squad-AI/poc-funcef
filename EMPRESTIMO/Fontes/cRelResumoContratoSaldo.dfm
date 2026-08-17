inherited cfgRelResumoContratoSaldo: TcfgRelResumoContratoSaldo
  Left = 116
  Top = 116
  Caption = 'Resumo de Contratos - visão Saldo'
  ClientHeight = 409
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 376
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
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    object DBcboTipoContrato: TwwDBLookupCombo
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
      TabOrder = 1
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
      TabOrder = 4
      inherited edtNome: TEdit
        Width = 353
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
        OnClick = molContratoEmptmobtnLimpaContratoClick
      end
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 177
      TabOrder = 5
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
    object Panel1: TPanel
      Left = 320
      Top = 200
      Width = 289
      Height = 57
      TabOrder = 2
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
    object chkDivergente: TCheckBox
      Left = 24
      Top = 264
      Width = 281
      Height = 17
      Caption = 'Exibir apenas Contratos "divergentes"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 294
      Width = 353
      Height = 65
      TabOrder = 3
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
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
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 105
      TabOrder = 7
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 89
      end
    end
    object rdgOrdenar: TRadioGroup
      Left = 16
      Top = 295
      Width = 225
      Height = 65
      Caption = ' Ordenar por: '
      ItemIndex = 1
      Items.Strings = (
        'Nº do Contrato'
        'Nome do(a) Mutuário(a)'
        'Matrícula')
      TabOrder = 8
    end
    object chkSintetico: TCheckBox
      Left = 328
      Top = 264
      Width = 281
      Height = 17
      Caption = 'Relatório Sintético'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 376
    Width = 624
    inherited tb97Fundo: TToolbar97
      Left = 452
      DockPos = 522
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 280
      DockPos = 350
    end
  end
  object qryRelatorio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      ''
      '   CON.NOME,'
      '   CON.MATRICULA,'
      '   CON.INSCRICAONUMERO,'
      '   CON.DESCTIPOEMPTMO,'
      '   CON.TCEDESCRICAO,'
      '   CON.SITDESCRICAO,'
      ''
      '   NVL(SALDOANT.SALDODEV, 0)           AS SALDODEV,'
      '   NVL(CONCESSOES.HMEVLRPREVISTO, 0)   AS CONCESSOES,'
      '   NVL(PARCELAS.HMEVLRPREVISTO, 0)     AS PARCELAS,'
      '   NVL(AMORT.HMEVLRPREVISTO, 0)        AS AMORTIZACAO,'
      '   NVL(QUITACAO.HMEVLRPREVISTO, 0)     AS QUITACAO,'
      '   NVL(QUITMORT.HMEVLRPREVISTO, 0)     AS QUIT_MORT,'
      '   NVL(SALDOATU.SALDODEV, 0)           AS SALDOATU,'
      ''
      '   ('
      '   TRUNC(NVL(SALDOANT.SALDODEV, 0), 2) +'
      '   TRUNC(NVL(CONCESSOES.HMEVLRPREVISTO, 0), 2) +'
      '   TRUNC(NVL(PARCELAS.HMEVLRPREVISTO, 0), 2) +'
      '   TRUNC(NVL(AMORT.HMEVLRPREVISTO, 0), 2) +'
      '   TRUNC(NVL(QUITACAO.HMEVLRPREVISTO, 0), 2) +'
      '   TRUNC(NVL(QUITMORT.HMEVLRPREVISTO, 0), 2) -'
      '   TRUNC(NVL(SALDOATU.SALDODEV, 0), 2)'
      '   ) AS DIFERENCA'
      ''
      'FROM'
      '  VWCONTRATOEP CON,'
      ''
      
        '-- SALDO ANTERIOR ----------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      '     C.IDCONTRATOEMPTMO, NVL(H.HMESALDODEV, 0) AS SALDODEV'
      '  FROM'
      '     HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '     ('
      '     SELECT'
      
        '        CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVE' +
        'MPTMO'
      '     FROM'
      '        HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '        ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '     WHERE'
      '            CON.FLGSITUACAO          <> '#39'C'#39
      '        AND ITC.ITCTRATASALDODEV     <> 0'
      '        AND CON.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '        AND ( HME.HMEDATAATUALIZA    ='
      '              ('
      '              SELECT'
      '                 MAX(H.HMEDATAATUALIZA)'
      '              FROM'
      '                 HISTMOVEMPTMO   H,'
      '                 CONTRATOEMPTMO  C,'
      '                 ITEMXTIPOCONTR  IT'
      '              WHERE'
      
        '                     C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTM' +
        'O'
      '                 AND H.HMEDATAATUALIZA    <=:PHMEDATAANT'
      '                 AND IT.ITCTRATASALDODEV  <> 0'
      '                 AND H.HMEANOCOMPETENCIA   =:PHMEANOANT'
      '                 AND H.HMEMESCOMPETENCIA   =:PHMEMESANT'
      
        '                 AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO' +
        ' IS NULL )'
      '                 AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'
      
        '                 AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTM' +
        'O'
      '                 AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '              )'
      '            )'
      
        '        AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO I' +
        'S NULL) )'
      '        AND HME.HMEANOCOMPETENCIA    =:PHMEANOANT'
      '        AND HME.HMEMESCOMPETENCIA    =:PHMEMESANT'
      '        AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '        AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '        AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '        AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '        AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '        AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '        AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '     GROUP BY'
      '        CON.IDCONTRATOEMPTMO'
      '     ) M'
      '  WHERE'
      '         C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND M.IDHISTMOVEMPTMO            = H.IDHISTMOVEMPTMO'
      '     AND M.IDCONTRATOEMPTMO           = H.IDCONTRATOEMPTMO'
      '     AND H.IDCONTRATOEMPTMO           = C.IDCONTRATOEMPTMO'
      '  ) SALDOANT,'
      
        '-- FIM SALDO ANTERIOR ------------------------------------------' +
        '------------------------'
      ''
      
        '-- CONCESSOES --------------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      '     C.IDCONTRATOEMPTMO,'
      
        '     SUM(DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (' +
        '-1)),'
      
        '                                      2, HME.HMEVLRPREVISTO, 0) ' +
        ') AS HMEVLRPREVISTO'
      '  FROM'
      '     HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '     ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '  WHERE'
      '         ITC.ITCTRATASALDODEV         <> 0'
      '     AND C.FLGSITUACAO                <> '#39'C'#39
      '     AND C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND HME.HMETIPOMOV               = 0'
      '     AND HME.HMEORIGEM                = 0'
      '     AND HME.HMEPARCELA               = 0'
      
        '     AND ( (HME.FLGESTORNADO          = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '     AND HME.HMEANOCOMPETENCIA        =:PHMEANOATU'
      '     AND HME.HMEMESCOMPETENCIA        =:PHMEMESATU'
      '     AND HME.IDCONTRATOEMPTMO         = C.IDCONTRATOEMPTMO'
      '     AND C.IDTIPOCONTREMPTMO          = TC.IDTIPOCONTREMPTMO'
      '     AND TC.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '     AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO'
      '  GROUP BY'
      '     C.IDCONTRATOEMPTMO'
      '  ) CONCESSOES,'
      
        '-- FIM CONCESSÕES ----------------------------------------------' +
        '------------------------'
      ''
      ''
      
        '-- PARCELAS ----------------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      
        '     C.IDCONTRATOEMPTMO,                                        ' +
        '                           '
      
        '     SUM(DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (' +
        '-1)),                      '
      
        '                                      2, HME.HMEVLRPREVISTO, 0) ' +
        ') AS HMEVLRPREVISTO        '
      
        '  FROM                                                          ' +
        '                           '
      
        '     HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                       ' +
        '                           '
      
        '     ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC                     ' +
        '                           '
      
        '  WHERE                                                         ' +
        '                           '
      
        '         ITC.ITCTRATASALDODEV         <> 0                      ' +
        '                           '
      
        '     AND C.FLGSITUACAO                <> '#39'C'#39'                    ' +
        '                         '
      '     AND C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND HME.HMETIPOMOV               IN (1, 8) '
      '     AND HME.HMEORIGEM                = 1'
      
        '     AND ( (HME.FLGESTORNADO          = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '     AND HME.HMEANOCOMPETENCIA        =:PHMEANOATU'
      '     AND HME.HMEMESCOMPETENCIA        =:PHMEMESATU'
      '     AND HME.IDCONTRATOEMPTMO         = C.IDCONTRATOEMPTMO'
      '     AND C.IDTIPOCONTREMPTMO          = TC.IDTIPOCONTREMPTMO'
      '     AND TC.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '     AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO'
      '  GROUP BY'
      '     C.IDCONTRATOEMPTMO'
      '  ) PARCELAS,'
      
        '-- FIM PARCELAS ------------------------------------------------' +
        '------------------------'
      ''
      ''
      
        '-- AMORTIZAÇÃO -------------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      '     C.IDCONTRATOEMPTMO,'
      
        '     SUM(DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (' +
        '-1)),'
      
        '                                      2, HME.HMEVLRPREVISTO, 0) ' +
        ') AS HMEVLRPREVISTO'
      '  FROM'
      '     HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '     ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '  WHERE'
      '         ITC.ITCTRATASALDODEV         <> 0'
      '     AND C.FLGSITUACAO                <> '#39'C'#39
      '     AND C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND HME.HMETIPOMOV               = 2'
      '     AND HME.HMEORIGEM                = 2'
      
        '     AND ( (HME.FLGESTORNADO          = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '     AND HME.HMEANOCOMPETENCIA        =:PHMEANOATU'
      '     AND HME.HMEMESCOMPETENCIA        =:PHMEMESATU'
      '     AND HME.IDCONTRATOEMPTMO         = C.IDCONTRATOEMPTMO'
      '     AND C.IDTIPOCONTREMPTMO          = TC.IDTIPOCONTREMPTMO'
      '     AND TC.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '     AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO'
      '  GROUP BY'
      '     C.IDCONTRATOEMPTMO'
      '  ) AMORT,'
      
        '-- FIM AMORTIZAÇÃO ---------------------------------------------' +
        '------------------------'
      ''
      ''
      
        '-- QUITAÇÂO ----------------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      '     C.IDCONTRATOEMPTMO,'
      
        '     SUM(DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (' +
        '-1)),'
      
        '                                      2, HME.HMEVLRPREVISTO, 0) ' +
        ') AS HMEVLRPREVISTO'
      '  FROM'
      '     HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '     ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '  WHERE'
      '         ITC.ITCTRATASALDODEV         <> 0'
      '     AND C.FLGSITUACAO                <> '#39'C'#39
      '     AND C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      
        '     AND HME.HMETIPOMOV               = 3                       ' +
        '                           '
      
        '     AND HME.HMEORIGEM                <> 8                      ' +
        '                           '
      
        '     AND ( (HME.FLGESTORNADO          = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                 '
      '     AND HME.HMEANOCOMPETENCIA        =:PHMEANOATU             '
      
        '     AND HME.HMEMESCOMPETENCIA        =:PHMEMESATU              ' +
        '    '
      
        '     AND HME.IDCONTRATOEMPTMO         = C.IDCONTRATOEMPTMO      ' +
        '                           '
      
        '     AND C.IDTIPOCONTREMPTMO          = TC.IDTIPOCONTREMPTMO    ' +
        '                           '
      
        '     AND TC.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO   ' +
        '                           '
      
        '     AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO        ' +
        '                           '
      '  GROUP BY'
      
        '     C.IDCONTRATOEMPTMO                                         ' +
        '                           '
      
        '   ) QUITACAO,                                                  ' +
        '                           '
      
        '-- FIM QUITAÇÃO ------------------------------------------------' +
        '------------------------   '
      ''
      ''
      
        '-- QUITAÇÃO POR MORTE ------------------------------------------' +
        '------------------------   '
      
        '  (                                                             ' +
        '                           '
      
        '  SELECT                                                        ' +
        '                           '
      
        '     C.IDCONTRATOEMPTMO,                                        ' +
        '                           '
      
        '     SUM(DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (' +
        '-1)),                      '
      
        '                                      2, HME.HMEVLRPREVISTO, 0) ' +
        ') AS HMEVLRPREVISTO        '
      
        '  FROM                                                          ' +
        '                           '
      
        '     HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                       ' +
        '                           '
      
        '     ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC                     ' +
        '                           '
      
        '  WHERE                                                         ' +
        '                           '
      
        '         ITC.ITCTRATASALDODEV         <> 0                      ' +
        '                           '
      
        '     AND C.FLGSITUACAO                <> '#39'C'#39'                    ' +
        '                         '
      '     AND C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND HME.HMETIPOMOV               = 3'
      '     AND HME.HMEORIGEM                = 8'
      
        '     AND ( (HME.FLGESTORNADO          = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '     AND HME.HMEANOCOMPETENCIA        =:PHMEANOATU'
      '     AND HME.HMEMESCOMPETENCIA        =:PHMEMESATU'
      '     AND HME.IDCONTRATOEMPTMO         = C.IDCONTRATOEMPTMO'
      '     AND C.IDTIPOCONTREMPTMO          = TC.IDTIPOCONTREMPTMO'
      '     AND TC.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '     AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO'
      '  GROUP BY'
      '     C.IDCONTRATOEMPTMO'
      '   ) QUITMORT,'
      
        '-- FIM QUITAÇÃO POR MORTE --------------------------------------' +
        '------------------------'
      ''
      
        '-- SALDO ATUAL -------------------------------------------------' +
        '------------------------'
      '  ('
      '  SELECT'
      '     C.IDCONTRATOEMPTMO, NVL(H.HMESALDODEV, 0) AS SALDODEV'
      '  FROM'
      '     HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '     ('
      '     SELECT'
      
        '        CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVE' +
        'MPTMO'
      '     FROM'
      '        HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '        ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      
        '     WHERE                                                      ' +
        '                           '
      
        '            CON.FLGSITUACAO          <> '#39'C'#39'                     ' +
        '                         '
      '        AND ITC.ITCTRATASALDODEV     <> 0'
      '        AND CON.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '        AND ( HME.HMEDATAATUALIZA    ='
      '              ('
      '              SELECT'
      '                 MAX(H.HMEDATAATUALIZA)'
      '              FROM'
      '                 HISTMOVEMPTMO   H,'
      '                 CONTRATOEMPTMO  C,'
      '                 ITEMXTIPOCONTR  IT'
      '              WHERE'
      
        '                     C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTM' +
        'O'
      '                 AND H.HMEDATAATUALIZA    <=:PHMEDATAATU'
      '                 AND IT.ITCTRATASALDODEV  <> 0'
      '                 AND H.HMEANOCOMPETENCIA   =:PHMEANOATU'
      '                 AND H.HMEMESCOMPETENCIA   =:PHMEMESATU'
      
        '                 AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO' +
        ' IS NULL )'
      '                 AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'
      
        '                 AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTM' +
        'O'
      '                 AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '              )'
      '            )'
      
        '        AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO I' +
        'S NULL) )'
      '        AND HME.HMEANOCOMPETENCIA    =:PHMEANOATU'
      '        AND HME.HMEMESCOMPETENCIA    =:PHMEMESATU'
      '        AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '        AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '        AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '        AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '        AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '        AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '        AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '     GROUP BY'
      '        CON.IDCONTRATOEMPTMO'
      '     ) M'
      '  WHERE'
      '         C.IDCONTRATOEMPTMO           =:PIDCONTRATOEMPTMO'
      '     AND M.IDHISTMOVEMPTMO            = H.IDHISTMOVEMPTMO'
      '     AND M.IDCONTRATOEMPTMO           = H.IDCONTRATOEMPTMO'
      '     AND H.IDCONTRATOEMPTMO           = C.IDCONTRATOEMPTMO'
      '   ) SALDOATU'
      
        '-- FIM SALDO ATUAL ---------------------------------------------' +
        '------------------------'
      ''
      'WHERE'
      '      CON.IDEMPRESAPROP               =:PIDEMPRESAPROP'
      '  AND CON.IDCONTRATOEMPTMO            =:PIDCONTRATOEMPTMO'
      '/*'
      '  AND ('
      '      TRUNC(NVL(SALDOANT.SALDODEV, 0), 2) +'
      '      TRUNC(NVL(CONCESSOES.HMEVLRPREVISTO, 0), 2) +'
      '      TRUNC(NVL(PARCELAS.HMEVLRPREVISTO, 0), 2) +'
      '      TRUNC(NVL(AMORT.HMEVLRPREVISTO, 0), 2) +'
      '      TRUNC(NVL(QUITACAO.HMEVLRPREVISTO, 0), 2) +'
      '      TRUNC(NVL(QUITMORT.HMEVLRPREVISTO, 0), 2) -'
      '      TRUNC(NVL(SALDOATU.SALDODEV, 0), 2)'
      '      ) <> 0'
      '*/'
      '  AND CON.IDCONTRATOEMPTMO   = SALDOANT.IDCONTRATOEMPTMO'
      '  AND CON.IDCONTRATOEMPTMO   = CONCESSOES.IDCONTRATOEMPTMO(+)'
      '  AND CON.IDCONTRATOEMPTMO   = PARCELAS.IDCONTRATOEMPTMO(+)'
      '  AND CON.IDCONTRATOEMPTMO   = AMORT.IDCONTRATOEMPTMO(+)'
      '  AND CON.IDCONTRATOEMPTMO   = QUITACAO.IDCONTRATOEMPTMO(+)'
      '  AND CON.IDCONTRATOEMPTMO   = QUITMORT.IDCONTRATOEMPTMO(+)'
      '  AND CON.IDCONTRATOEMPTMO   = SALDOATU.IDCONTRATOEMPTMO(+)'
      ''
      'ORDER BY'
      '   CON.DESCTIPOEMPTMO, CON.TCEDESCRICAO, CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryRelatorioIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryRelatorioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRelatorioMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRelatorioINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryRelatorioDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryRelatorioTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryRelatorioSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Size = 50
    end
    object qryRelatorioSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryRelatorioCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryRelatorioPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryRelatorioAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryRelatorioQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryRelatorioQUIT_MORT: TFloatField
      FieldName = 'QUIT_MORT'
    end
    object qryRelatorioSALDOATU: TFloatField
      FieldName = 'SALDOATU'
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
    Left = 112
    Top = 192
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
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PPC.NOME AS NOMEPLANO,'
      '   PTR.NOME AS NOMEPATRO,'
      ''
      '   (PPC.NOME || '#39' - '#39' || PTR.NOME) AS NOMEPLANOPATRO,'
      ''
      '   TCE.TCEDESCRICAO,'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA, PPP.INSCRICAONUMERO,'
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
      '   AND PPP.INSCRICAODATA         = (select max(INSCRICAODATA)'
      '                                    from   PARTPREVPLAN'
      
        '                                    where  IDPESSOA = CON.IDPESS' +
        'OA'
      '                                    and    FLGDESATIVADO = 0)'
      ''
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
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
      '   AND PPC.IDPLANOPREV           = MIG.IDPLANOCONTATU'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      #9'AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   DECODE(NVL(:PORDEM, 0), 0, CON.IDCONTRATOEMPTMO),'
      '   DECODE(NVL(:PORDEM, 0), 1, MUT.NOME),'
      '   DECODE(NVL(:PORDEM, 0), 2, DEP.MATRICULA),'
      '   CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 56
    Top = 128
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
  object qryQuitacaoMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM             = 8'
      '--   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 224
    Top = 144
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
    object qryQuitacaoMorteHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoMorteVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryQuitacaoMorteVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM            <> 8'
      '--   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 224
    Top = 128
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
    object qryQuitacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryQuitacaoVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
  end
  object qryMovimentoNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOSUSPEMPTMO  TSE,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            =:PHMETIPOMOV'
      '--   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOP' +
        'ARC, 0) = 1)'
      '       )'
      '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 224
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
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryMovimentoNormalHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryMovimentoNormalVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryMovimentoNormalVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
  end
  object qryLookTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   TCE.IDPLANOPREV,'
      ''
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
    Top = 112
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
    object qryLookTipoContrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDPLANOPREV'
    end
  end
end
