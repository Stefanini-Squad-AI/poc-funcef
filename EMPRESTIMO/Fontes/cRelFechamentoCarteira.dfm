inherited cfgRelFechamentoCarteira: TcfgRelFechamentoCarteira
  Left = 115
  Top = 177
  Caption = 'Resumo da Carteira - Visão Saldo'
  ClientHeight = 396
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 363
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
    object Panel1: TPanel
      Left = 320
      Top = 216
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
      Top = 280
      Width = 353
      Height = 65
      TabOrder = 5
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
      Height = 193
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 169
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 87
      Height = 123
      TabOrder = 6
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 105
      end
    end
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 522
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 281
      DockPos = 350
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
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   PPP.INSCRICAONUMERO,'
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
      ''
      '   AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND MIG.DATAMIGRA             = (select max(DATAMIGRA)'
      '                                    from   VWMIGRACONTRATOEP'
      
        '                                    where  IDCONTRATOEMPTMO = CO' +
        'N.IDCONTRATOEMPTMO'
      
        '                                    and    DATAMIGRA <= :PHMEDAT' +
        'AFIM)'
      '   AND MIG.IDPATROATU            =:PIDPATRO'
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
      '   AND MIG.IDPATROATU            = PTR.IDPESSOA'
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
      '  TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
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
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
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
    Left = 32
    Top = 88
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
  object qrySaldoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SAL' +
        'DODEV,'
      
        '        NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV       ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A,                                      ' +
        '                                     '
      
        '        (                                                       ' +
        '                                     '
      
        '        SELECT                                                  ' +
        '                                     '
      
        '           TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,            ' +
        '                                     '
      
        '           NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV             ' +
        '                                     '
      
        '        FROM                                                    ' +
        '                                     '
      
        '           TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C' +
        ',                                    '
      
        '           (                                                    ' +
        '                                     '
      
        '           SELECT                                               ' +
        '                                     '
      
        '              CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHI' +
        'STMOVEMPTMO                          '
      
        '           FROM                                                 ' +
        '                                     '
      
        '              HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,            ' +
        '                                     '
      
        '              ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTM' +
        'O TCE                                '
      
        '           WHERE                                                ' +
        '                                     '
      
        '                  ITC.ITCTRATASALDODEV     <> 0                 ' +
        '                                     '
      '              AND CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '              AND ( HME.HMEDATAATUALIZA    =                    ' +
        '                                     '
      
        '                    (                                           ' +
        '                                     '
      
        '                    SELECT                                      ' +
        '                                     '
      
        '                       MAX(H.HMEDATAATUALIZA)                   ' +
        '                                     '
      
        '                    FROM                                        ' +
        '                                     '
      
        '                       HISTMOVEMPTMO   H,                       ' +
        '                                     '
      
        '                       CONTRATOEMPTMO  C,                       ' +
        '                                     '
      
        '                       ITEMXTIPOCONTR  IT                       ' +
        '                                     '
      
        '                    WHERE                                       ' +
        '                                     '
      
        '                           C.IDCONTRATOEMPTMO    = CON.IDCONTRAT' +
        'OEMPTMO                              '
      '                       AND H.HMEDATAATUALIZA    <= :PHMEDATAFIM'
      
        '                       AND IT.ITCTRATASALDODEV  <> 0            ' +
        '                                     '
      '                       AND HME.HMEANOCOMPETENCIA = :PANO'
      '                       AND HME.HMEMESCOMPETENCIA = :PMES'
      
        '                       AND ( H.FLGESTORNADO      = 0 OR H.FLGEST' +
        'ORNADO IS NULL )                     '
      
        '                       AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOE' +
        'MPTMO                                '
      
        '                       AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONT' +
        'REMPTMO                              '
      
        '                       AND H.IDITEMEMPTMO        = IT.IDITEMEMPT' +
        'MO                                   '
      
        '                    )                                           ' +
        '                                     '
      
        '                  )                                             ' +
        '                                     '
      
        '              AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTOR' +
        'NADO IS NULL) )                      '
      '              AND HME.HMEANOCOMPETENCIA    = :PANO'
      '              AND HME.HMEMESCOMPETENCIA    = :PMES'
      
        '              AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTM' +
        'O )                                  '
      
        '              AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPT' +
        'MO )                                 '
      
        '              AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPT' +
        'MO )                                 '
      
        '              AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPT' +
        'MO )                                 '
      
        '              AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) ' +
        '                                     '
      
        '              AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) ' +
        '                                     '
      
        '              AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) ' +
        '                                     '
      
        '           GROUP BY                                             ' +
        '                                     '
      
        '              CON.IDCONTRATOEMPTMO                              ' +
        '                                     '
      
        '           ) M                                                  ' +
        '                                     '
      
        '        WHERE                                                   ' +
        '                                     '
      
        '               M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO          ' +
        '                                       '
      '             AND C.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'
      
        '           AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO         ' +
        '                                      '
      
        '           AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO         ' +
        '                                      '
      
        '           AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO       ' +
        '                                     '
      
        '        GROUP BY                                                ' +
        '                                     '
      
        '              TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO          ' +
        '                                     '
      
        '        ) SLD                                                   ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO'
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 32
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoAtuIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qrySaldoAtuSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qrySaldoAtuTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SAL' +
        'DODEV,'
      '        NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      '           TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,'
      '           NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '        FROM'
      
        '           TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C' +
        ','
      '           ('
      '           SELECT'
      
        '              CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHI' +
        'STMOVEMPTMO'
      '           FROM'
      '              HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '              ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTM' +
        'O TCE'
      '           WHERE'
      '                  ITC.ITCTRATASALDODEV    <> 0'
      '              AND CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '              AND ( HME.HMEDATAATUALIZA    ='
      '                    ('
      '                    SELECT'
      '                       MAX(H.HMEDATAATUALIZA)'
      '                    FROM'
      '                       HISTMOVEMPTMO   H,'
      '                       CONTRATOEMPTMO  C,'
      '                       ITEMXTIPOCONTR  IT'
      '                    WHERE'
      
        '                           C.IDCONTRATOEMPTMO    = CON.IDCONTRAT' +
        'OEMPTMO'
      '                       AND H.HMEDATAATUALIZA    <= :PHMEDATAINI'
      '                       AND IT.ITCTRATASALDODEV  <> 0'
      '                       AND HME.HMEANOCOMPETENCIA = :PANO'
      '                       AND HME.HMEMESCOMPETENCIA = :PMES'
      
        '                       AND ( H.FLGESTORNADO      = 0 OR H.FLGEST' +
        'ORNADO IS NULL )'
      
        '                       AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOE' +
        'MPTMO'
      
        '                       AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONT' +
        'REMPTMO'
      
        '                       AND H.IDITEMEMPTMO        = IT.IDITEMEMPT' +
        'MO'
      '                    )'
      '                  )'
      
        '              AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTOR' +
        'NADO IS NULL) )'
      '              AND HME.HMEANOCOMPETENCIA    = :PANO'
      '              AND HME.HMEMESCOMPETENCIA    = :PMES'
      
        '              AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTM' +
        'O )'
      
        '              AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPT' +
        'MO )'
      
        '              AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPT' +
        'MO )'
      
        '              AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPT' +
        'MO )'
      '              AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '              AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '              AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '           GROUP BY'
      '              CON.IDCONTRATOEMPTMO'
      '           ) M'
      '        WHERE'
      '                 C.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'
      '           AND M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO'
      '           AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO'
      '           AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'
      '        GROUP BY'
      '              TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO'
      '        ) SLD'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO'
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 32
    Top = 152
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
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoAntIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qrySaldoAntSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qrySaldoAntTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
  object qryQuant_Ant: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        CON.IDTIPOCONTREMPTMO, COUNT(CON.IDCONTRATOEMPTMO) AS TO' +
        'TALSLDDEV'
      '     FROM'
      '        HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '        ('
      '        SELECT'
      
        '           CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTM' +
        'OVEMPTMO'
      '        FROM'
      
        '           HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,               ' +
        '                                     '
      
        '           ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO T' +
        'CE                                   '
      
        '        WHERE                                                   ' +
        '                                     '
      '               CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '           AND ITC.ITCTRATASALDODEV   <> 0                      ' +
        '                                     '
      
        '           AND ( HME.HMEDATAATUALIZA    =                       ' +
        '                                  '
      
        '                    (                                           ' +
        '                                     '
      
        '                    SELECT                                      ' +
        '                                     '
      
        '                       MAX(H.HMEDATAATUALIZA)                   ' +
        '                                     '
      
        '                    FROM                                        ' +
        '                                     '
      
        '                       HISTMOVEMPTMO   H,                       ' +
        '                                     '
      
        '                       CONTRATOEMPTMO  C,                       ' +
        '                                     '
      
        '                       ITEMXTIPOCONTR  IT                       ' +
        '                                     '
      
        '                    WHERE                                       ' +
        '                                     '
      
        '                           C.IDCONTRATOEMPTMO    = CON.IDCONTRAT' +
        'OEMPTMO                              '
      '                       AND H.HMEDATAATUALIZA    <= :PHMEDATAINI'
      '                       AND IT.ITCTRATASALDODEV  <> 0'
      '                       AND HME.HMEANOCOMPETENCIA = :PANO'
      '                       AND HME.HMEMESCOMPETENCIA = :PMES'
      
        '                       AND ( H.FLGESTORNADO      = 0 OR H.FLGEST' +
        'ORNADO IS NULL )                     '
      
        '                       AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOE' +
        'MPTMO                                '
      
        '                       AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONT' +
        'REMPTMO                              '
      
        '                       AND H.IDITEMEMPTMO        = IT.IDITEMEMPT' +
        'MO                                   '
      
        '                    )                                           ' +
        '                                     '
      
        '                  )                                             ' +
        '                                     '
      '           AND ( HME.HMEANOCOMPETENCIA  = :PANO)'
      '           AND ( HME.HMEMESCOMPETENCIA  = :PMES )'
      
        '           AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNAD' +
        'O IS NULL) )                         '
      '           AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      
        '           AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ' +
        ')                                    '
      
        '           AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ' +
        ')                                    '
      
        '           AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ' +
        ')'
      
        '           AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )    ' +
        '                                     '
      
        '           AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )    ' +
        '                                     '
      
        '           AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )    ' +
        '                                     '
      
        '        GROUP BY                                                ' +
        '                                     '
      
        '           CON.IDCONTRATOEMPTMO                                 ' +
        '                                     '
      
        '        ) MAX                                                   ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '               CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '        AND ( HME.HMESALDODEV        > 0 )                      ' +
        '                                     '
      
        '        AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )   ' +
        '                                     '
      
        '        AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )   ' +
        '                                     '
      
        '        AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )    ' +
        '                                     '
      '     GROUP BY'
      '        CON.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 208
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
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryQuant_AntIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuant_AntTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
  object qryConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'CONCESSOES,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALCONCESSOES'
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
      '               ITC.ITCTRATASALDODEV   <> 0'
      '           AND C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMETIPOMOV         = 0'
      '           AND HME.HMEORIGEM          = 0'
      '           AND HME.HMEPARCELA         = 0'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 168
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryConcessoesIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryConcessoesCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryConcessoesTOTALCONCESSOES: TFloatField
      FieldName = 'TOTALCONCESSOES'
    end
  end
  object qryQuant_Conc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(C.IDCONTRATOEMPTMO) AS TOTALCONCESSOES            ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            = 0                       ' +
        '                                     '
      
        '        AND HME.HMEORIGEM             = 0                       ' +
        '                                     '
      
        '        AND HME.HMEPARCELA            = 0                       ' +
        '                                     '
      
        '        AND HME.HMESEQCOBRANCA        = 1                       ' +
        '                                     '
      
        '        AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )                               '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO       = HME.IDCONTRATOEMPTMO     ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO                                     ' +
        '                                     '
      '')
    ValidateWithMask = True
    Left = 168
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_ConcIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryQuant_ConcTOTALCONCESSOES: TFloatField
      FieldName = 'TOTALCONCESSOES'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDCONTRATOEMPTMO'
    end
  end
  object qryQuant_QuitParc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(DISTINCT(C.IDCONTRATOEMPTMO)) AS TOTQUITPARC      ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        ITEMXTIPOCONTR  ITC,                                    ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            = 3                       ' +
        '                                     '
      
        '        AND ITC.ITCTRATASALDODEV      = 1                       ' +
        '                                     '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND NOT EXISTS                                          ' +
        '                                     '
      
        '          (                                                     ' +
        '                                     '
      
        '          SELECT                                                ' +
        '                                     '
      
        '             H1.IDCONTRATOEMPTMO                                ' +
        '                                     '
      
        '          FROM                                                  ' +
        '                                     '
      
        '             HISTMOVEMPTMO  H1,                                 ' +
        '                                     '
      
        '             CONTRATOEMPTMO C1                                  ' +
        '                                     '
      
        '          WHERE                                                 ' +
        '                                     '
      '                 C1.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'
      
        '             AND H1.HMETIPOMOV        = 1                       ' +
        '                                     '
      
        '             AND H1.HMEPARCELA        > 0                       ' +
        '                                     '
      
        '             AND H1.HMESEQCOBRANCA    = 1                       ' +
        '                                     '
      
        '             AND ( H1.FLGESTORNADO    = 0 OR H1.FLGESTORNADO IS ' +
        'NULL )                               '
      '             AND H1.HMEANOCOMPETENCIA = :PANO'
      '             AND H1.HMEMESCOMPETENCIA = :PMES'
      
        '             AND C1.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO      ' +
        '                                     '
      
        '             AND H1.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO      ' +
        '                                     '
      
        '          )                                                     ' +
        '                                     '
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND A.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO   ' +
        '                                     '
      
        '        AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO        ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO    ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 168
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_QuitParcIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuant_QuitParcTOTQUITPARC: TFloatField
      FieldName = 'TOTQUITPARC'
    end
  end
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'PARCELAS,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
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
      
        '               HME.HMETIPOMOV         IN (1, 8)                 ' +
        '                                     '
      
        '           AND HME.HMEORIGEM          IN (1, 12)                ' +
        '                                     '
      
        '           AND ITC.ITCTRATASALDODEV   <> 0                      ' +
        '                                     '
      '           AND C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      
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
      '')
    ValidateWithMask = True
    Left = 168
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryParcelasIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcelasPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryParcelasTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryQuant_Parc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC                  ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            IN (1, 8)                 ' +
        '                                     '
      
        '        AND HME.HMEORIGEM             IN (1, 12)                ' +
        '                                     '
      
        '        AND HME.HMEPARCELA            > 0                       ' +
        '                                     '
      
        '        AND HME.HMESEQCOBRANCA        = 1                       ' +
        '                                     '
      
        '        AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )                               '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO    ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO                                     ' +
        '                                     '
      '')
    ValidateWithMask = True
    Left = 168
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_ParcIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuant_ParcTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryEncerra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      '        A.IDTIPOCONTREMPTMO,'
      '        NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCERRADOS,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS QUANTENCERRA'
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
      
        '        FROM                                                    ' +
        '                                     '
      
        '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                 ' +
        '                                     '
      
        '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC               ' +
        '                                     '
      
        '        WHERE                                                   ' +
        '                                     '
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '           AND HME.HMETIPOMOV         = 1                       ' +
        '                                     '
      
        '           AND HME.HMEORIGEM          IN (1,12)                 ' +
        '                                     '
      
        '           AND ITC.ITCTRATASALDODEV   = 1                       ' +
        '                                     '
      
        '           AND HME.HMESALDODEV        = 0                       ' +
        '                                     '
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      
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
      '')
    ValidateWithMask = True
    Left = 264
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryEncerraIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryEncerraENCERRADOS: TFloatField
      FieldName = 'ENCERRADOS'
    end
    object qryEncerraQUANTENCERRA: TFloatField
      FieldName = 'QUANTENCERRA'
    end
  end
  object qryAmort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO,         ' +
        '                                     '
      
        '        NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO         ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A,                                      ' +
        '                                     '
      
        '        (                                                       ' +
        '                                     '
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
      '           AND HME.HMETIPOMOV         = 2'
      '           AND HME.HMEORIGEM          = 2'
      '           AND ITC.ITCTRATASALDODEV   <> 0'
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      
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
      '')
    ValidateWithMask = True
    Left = 264
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryAmortIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryAmortAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryAmortTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
    end
  end
  object qryQuant_Amort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMO                   ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            = 2                       ' +
        '                                     '
      
        '        AND HME.HMEORIGEM             = 2                       ' +
        '                                     '
      
        '        AND HME.HMESEQCOBRANCA        = 1                       ' +
        '                                     '
      
        '        AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )                               '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO    ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 264
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_AmortIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryQuant_AmortTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDCONTRATOEMPTMO'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'QUITACAO,'
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
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      
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
      '')
    ValidateWithMask = True
    Left = 368
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuitacaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacaoQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryQuitacaoTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
  end
  object qryQuant_Quit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUI                   ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        ITEMXTIPOCONTR  ITC,                                    ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            = 3                       ' +
        '                                     '
      
        '        AND HME.HMEORIGEM             <> 8                      ' +
        '                                     '
      
        '        AND ITC.ITCTRATASALDODEV      = 1                       ' +
        '                                     '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO    ' +
        '                                     '
      
        '        AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO        ' +
        '                                     '
      '        AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      '')
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
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_QuitIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryQuant_QuitTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDCONTRATOEMPTMO'
    end
  end
  object qryQuitMort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ' +
        'QUIT_MORT,                           '
      
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
      '           AND HME.HMEANOCOMPETENCIA  = :PANO'
      '           AND HME.HMEMESCOMPETENCIA  = :PMES'
      
        '           AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      
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
      '')
    ValidateWithMask = True
    Left = 480
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuitMortIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitMortQUIT_MORT: TFloatField
      FieldName = 'QUIT_MORT'
    end
    object qryQuitMortTOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
    end
  end
  object qryQuant_Mort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO,                                    ' +
        '                                     '
      
        '        COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUM                   ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        HISTMOVEMPTMO   HME,                                    ' +
        '                                     '
      
        '        CONTRATOEMPTMO  C,                                      ' +
        '                                     '
      
        '        ITEMXTIPOCONTR  ITC,                                    ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A                                       ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      '            C.IDCONTRATOEMPTMO        = :PIDCONTRATOEMPTMO'
      
        '        AND HME.HMETIPOMOV            = 3                       ' +
        '                                     '
      
        '        AND HME.HMEORIGEM             = 8                       ' +
        '                                     '
      
        '        AND ITC.ITCTRATASALDODEV      = 1                       ' +
        '                                     '
      
        '        AND ( (HME.FLGESTORNADO       = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )                           '
      '        AND HME.HMEANOCOMPETENCIA     = :PANO'
      '        AND HME.HMEMESCOMPETENCIA     = :PMES'
      
        '        AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO     ' +
        '                                     '
      
        '        AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO    ' +
        '                                     '
      
        '        AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO        ' +
        '                                     '
      
        '        AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO   ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO                                     ' +
        '                                     '
      '')
    ValidateWithMask = True
    Left = 480
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end>
    object qryQuant_MortIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryQuant_MortTOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
      Origin = 'BASEDADOS."CM.CONTRATOEMPTMO".IDCONTRATOEMPTMO'
    end
  end
  object qryQuant_Atu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        CON.IDTIPOCONTREMPTMO, COUNT(CON.IDCONTRATOEMPTMO) AS TO' +
        'TALSLDDEV'
      '     FROM'
      '        HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '        ('
      '        SELECT'
      
        '           CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTM' +
        'OVEMPTMO'
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '           ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO T' +
        'CE'
      '        WHERE'
      '               ITC.ITCTRATASALDODEV     <> 0'
      '           AND CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND ( HME.HMEDATAATUALIZA    ='
      '                 ('
      '                 SELECT'
      '                    MAX(H.HMEDATAATUALIZA)'
      '                 FROM'
      '                    HISTMOVEMPTMO   H,'
      '                    CONTRATOEMPTMO  C,'
      '                    ITEMXTIPOCONTR  IT'
      '                 WHERE'
      
        '                        C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEM' +
        'PTMO'
      '                    AND H.HMEDATAATUALIZA    <= :PHMEDATAFIM'
      '                    AND IT.ITCTRATASALDODEV  <> 0'
      '                    AND HME.HMEANOCOMPETENCIA = :PANO'
      '                    AND HME.HMEMESCOMPETENCIA = :PMES'
      
        '                    AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORN' +
        'ADO IS NULL )'
      
        '                    AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPT' +
        'MO'
      
        '                    AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREM' +
        'PTMO'
      '                    AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '                 )'
      '               )'
      '           AND ( HME.HMEANOCOMPETENCIA  = :PANO )'
      '           AND ( HME.HMEMESCOMPETENCIA  = :PMES )'
      
        '           AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNAD' +
        'O IS NULL) )'
      '           AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      
        '           AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ' +
        ')'
      
        '           AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ' +
        ')'
      
        '           AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ' +
        ')'
      '           AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '           AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '           AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '        GROUP BY'
      '           CON.IDCONTRATOEMPTMO'
      '        ) MAX'
      '     WHERE'
      '            CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '        AND ( HME.HMESALDODEV        > 0 )                      ' +
        '                                     '
      
        '        AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )   ' +
        '                                     '
      
        '        AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )   ' +
        '                                     '
      
        '        AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )    ' +
        '                                     '
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        CON.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryQuant_AtuIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuant_AtuTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
end
