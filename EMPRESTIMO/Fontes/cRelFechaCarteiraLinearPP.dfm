inherited cfgRelFechaCarteiraLinearPP: TcfgRelFechaCarteiraLinearPP
  Left = 51
  Top = 51
  Caption = 
    'Resumo da Carteira (visão Caixa - Linear) - Por Plano/Patrocinad' +
    'ora'
  ClientHeight = 428
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 395
    object Label1: TLabel
      Left = 16
      Top = 58
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 58
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label3: TLabel
      Left = 44
      Top = 320
      Width = 194
      Height = 13
      Caption = 'cobrança gerada ou recebimentos'
    end
    object Panel1: TPanel
      Left = 320
      Top = 224
      Width = 289
      Height = 57
      TabOrder = 3
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 136
        Height = 13
        Caption = 'Mês/Ano de Referência'
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
      Left = 280
      Top = 296
      Width = 329
      Height = 65
      TabOrder = 4
      object chkCorLinha: TCheckBox
        Left = 9
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 243
        Top = 38
        Width = 79
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
        Left = 9
        Top = 16
        Width = 184
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 72
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
      Top = 72
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
      Top = 16
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
      Top = 96
      Height = 193
      TabOrder = 5
      inherited Label6: TLabel
        Width = 94
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
    inline molListaPlano: TmolListaPlano
      Left = 312
      Top = 96
      Height = 121
      TabOrder = 6
      inherited Label6: TLabel
        Width = 47
      end
      inherited lstPlano: TCheckListBox
        Height = 105
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
    object chkImprimeCobranca: TCheckBox
      Left = 24
      Top = 304
      Width = 253
      Height = 17
      Caption = 'Imprime somente registros que tenham'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 395
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
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TEP.IDTIPOEMPTMO, TEP.DESCTIPOEMPTMO,'
      '   TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO'
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      'WHERE'
      '       TEP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      
        '   AND (:PIDTIPOEMPTMO        IS NULL OR TCE.IDTIPOEMPTMO      =' +
        ':PIDTIPOEMPTMO)'
      
        '   AND (:PIDTIPOCONTREMPTMO   IS NULL OR TCE.IDTIPOCONTREMPTMO =' +
        ':PIDTIPOCONTREMPTMO)'
      
        '   AND (TCE.IDPLANOPREV       IS NULL OR TCE.IDPLANOPREV       =' +
        ':PIDPLANOPREV)'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      'ORDER BY'
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(SLD.HMESALDODEV), 0) AS SALDODEV'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      '      TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,'
      '      NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '   FROM'
      '      TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             CON.FLGSITUACAO         <> '#39'C'#39
      '         AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '         AND CON.IDPATRO             =:PIDPATRO'
      '         AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '         AND TCE.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '         AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEM' +
        'PTMO =:PIDCONTRATOEMPTMO)'
      '         AND ( HME.HMEDATAATUALIZA    ='
      '               ('
      '               SELECT'
      '                  MAX(H.HMEDATAATUALIZA)'
      '               FROM'
      '                  HISTMOVEMPTMO   H,'
      '                  CONTRATOEMPTMO  C,'
      '                  ITEMXTIPOCONTR  IT'
      '               WHERE'
      
        '                      C.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMP' +
        'TMO'
      '                  AND H.HMEDATAATUALIZA     <=:PHMEDATAATUALIZA'
      
        '                  AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO' +
        ' = 1)'
      
        '                  AND H.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCI' +
        'A'
      
        '                  AND H.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCI' +
        'A'
      '                  AND NVL(H.FLGESTORNADO, 0) = 0'
      
        '                  AND H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTM' +
        'O'
      
        '                  AND C.IDTIPOCONTREMPTMO    = IT.IDTIPOCONTREMP' +
        'TMO'
      '                  AND H.IDITEMEMPTMO         = IT.IDITEMEMPTMO'
      '               )'
      '             )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '         AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '         AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '         AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '         AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '         AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '         AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) M'
      '   WHERE'
      '          C.IDPATRO            =:PIDPATRO'
      '      AND C.IDPLANOPREV        =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO  =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO  IS NULL OR C.IDCONTRATOEMPTMO =:P' +
        'IDCONTRATOEMPTMO)'
      '      AND M.IDHISTMOVEMPTMO    = H.IDHISTMOVEMPTMO'
      '      AND M.IDCONTRATOEMPTMO   = H.IDCONTRATOEMPTMO'
      '      AND H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO'
      '   GROUP BY'
      '      TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO'
      '   ) SLD'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 24
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
      end>
    object qrySaldoAntSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
  end
  object qryQuantSaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(CON.IDCONTRATOEMPTMO) AS TOTALSLDDEV'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMP' +
        'TMO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      ''
      '      AND CON.IDPATRO             =:PIDPATRO'
      '      AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '      AND TCE.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      ''
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT'
      '               MAX(H.HMEDATAATUALIZA)'
      '            FROM'
      '               HISTMOVEMPTMO   H,'
      '               CONTRATOEMPTMO  C,'
      '               ITEMXTIPOCONTR  IT'
      '            WHERE'
      '                   C.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '               AND H.HMEDATAATUALIZA     <=:PHMEDATAATUALIZA'
      
        '               AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = ' +
        '1)'
      '               AND H.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '               AND H.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '               AND NVL(H.FLGESTORNADO, 0) = 0'
      '               AND H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO'
      '               AND C.IDTIPOCONTREMPTMO    = IT.IDTIPOCONTREMPTMO'
      '               AND H.IDITEMEMPTMO         = IT.IDITEMEMPTMO'
      '            )'
      '          )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '      AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) MAX'
      'WHERE'
      '       CON.FLGSITUACAO        <> '#39'C'#39
      '   AND CON.IDPATRO             =:PIDPATRO'
      '   AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '   AND CON.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMESALDODEV         > 0'
      '   AND CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO    = MAX.IDCONTRATOEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO     = MAX.IDHISTMOVEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
      end>
    object qryQuantSaldoAntTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
  object qryConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS CONCESSOES'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      '      HME.HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                =:PIDPATRO'
      '      AND C.IDPLANOPREV            =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO      =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO      IS NULL OR C.IDCONTRATOEMPTMO' +
        ' =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO           <> '#39'C'#39
      '      AND HME.HMETIPOMOV           = 0'
      '      AND HME.HMEORIGEM            = 0'
      '      AND HME.HMEPARCELA           = 0'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '      AND HME.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO      = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 128
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryConcessoesCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
  end
  object qryQuantConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALCONCESSOES'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO           <> '#39'C'#39
      '   AND C.IDPATRO                =:PIDPATRO'
      '   AND C.IDPLANOPREV            =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO      =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO      IS NULL OR C.IDCONTRATOEMPTMO =:' +
        'PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV           = 0'
      '   AND HME.HMEORIGEM            = 0'
      '   AND HME.HMEPARCELA           = 0'
      '   AND HME.HMESEQCOBRANCA       = 1'
      '   AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO       = HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 128
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryQuantConcessoesTOTALCONCESSOES: TFloatField
      FieldName = 'TOTALCONCESSOES'
    end
  end
  object qrySaldoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(SLD.HMESALDODEV), 0) AS SALDODEV'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      '      TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,'
      '      NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '   FROM'
      '      TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             CON.FLGSITUACAO         <> '#39'C'#39
      '         AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '         AND CON.IDPATRO             =:PIDPATRO'
      '         AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '         AND TCE.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '         AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEM' +
        'PTMO =:PIDCONTRATOEMPTMO)'
      '         AND ( HME.HMEDATAATUALIZA    ='
      '               ('
      '               SELECT'
      '                  MAX(H.HMEDATAATUALIZA)'
      '               FROM'
      '                  HISTMOVEMPTMO   H,'
      '                  CONTRATOEMPTMO  C,'
      '                  ITEMXTIPOCONTR  IT'
      '               WHERE'
      
        '                      C.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMP' +
        'TMO'
      '                  AND H.HMEDATAATUALIZA     <=:PHMEDATAATUALIZA'
      
        '                  AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO' +
        ' = 1)'
      
        '                  AND H.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCI' +
        'A'
      
        '                  AND H.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCI' +
        'A'
      '                  AND NVL(H.FLGESTORNADO, 0) = 0'
      
        '                  AND H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTM' +
        'O'
      
        '                  AND C.IDTIPOCONTREMPTMO    = IT.IDTIPOCONTREMP' +
        'TMO'
      '                  AND H.IDITEMEMPTMO         = IT.IDITEMEMPTMO'
      '               )'
      '             )'
      '         AND NVL(HME.FLGESTORNADO, 0) = 0'
      '         AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '         AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '         AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '         AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '         AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '         AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '         AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) M'
      '   WHERE'
      '          C.IDPATRO            =:PIDPATRO'
      '      AND C.IDPLANOPREV        =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO  =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO  IS NULL OR C.IDCONTRATOEMPTMO =:P' +
        'IDCONTRATOEMPTMO)'
      '      AND M.IDHISTMOVEMPTMO    = H.IDHISTMOVEMPTMO'
      '      AND M.IDCONTRATOEMPTMO   = H.IDCONTRATOEMPTMO'
      '      AND H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO'
      '   GROUP BY'
      '      TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO'
      '   ) SLD'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 232
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
      end>
    object qrySaldoAtuSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
  end
  object qryQuantSaldoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(CON.IDCONTRATOEMPTMO) AS TOTALSLDDEV'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMP' +
        'TMO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '   WHERE'
      '          CON.FLGSITUACAO        <> '#39'C'#39
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      ''
      '      AND CON.IDPATRO             =:PIDPATRO'
      '      AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '      AND TCE.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      ''
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT'
      '               MAX(H.HMEDATAATUALIZA)'
      '            FROM'
      '               HISTMOVEMPTMO   H,'
      '               CONTRATOEMPTMO  C,'
      '               ITEMXTIPOCONTR  IT'
      '            WHERE'
      '                   C.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '               AND H.HMEDATAATUALIZA     <=:PHMEDATAATUALIZA'
      
        '               AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = ' +
        '1)'
      '               AND H.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '               AND H.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '               AND NVL(H.FLGESTORNADO, 0) = 0'
      '               AND H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO'
      '               AND C.IDTIPOCONTREMPTMO    = IT.IDTIPOCONTREMPTMO'
      '               AND H.IDITEMEMPTMO         = IT.IDITEMEMPTMO'
      '            )'
      '          )'
      '      AND NVL(HME.FLGESTORNADO, 0) = 0'
      '      AND HME.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '      AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) MAX'
      'WHERE'
      '       CON.FLGSITUACAO        <> '#39'C'#39
      '   AND CON.IDPATRO             =:PIDPATRO'
      '   AND CON.IDPLANOPREV         =:PIDPLANOPREV'
      '   AND CON.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO     IS NULL OR CON.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMESALDODEV         > 0'
      '   AND CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO    = MAX.IDCONTRATOEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO     = MAX.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 232
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
      end>
    object qryQuantSaldoAtuTOTALSLDDEV: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
  end
  object qryParcelas_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS_CR'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            IN (1, 8)'
      '      AND HME.HMEORIGEM             IN (1, 12)'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryParcelas_CRPARCELAS_CR: TFloatField
      FieldName = 'PARCELAS_CR'
    end
  end
  object qryQuantParcelas_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC_CR'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            IN (1, 8)'
      '   AND HME.HMEORIGEM             IN (1, 12)'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantParcelas_CRTOTALPARC_CR: TFloatField
      FieldName = 'TOTALPARC_CR'
    end
  end
  object qryParcelas_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS_FP'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            IN (1, 8)'
      '      AND HME.HMEORIGEM             IN (1, 12)'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryParcelas_FPPARCELAS_FP: TFloatField
      FieldName = 'PARCELAS_FP'
    end
  end
  object qryParcelas_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS_FB'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            IN (1, 8)'
      '      AND HME.HMEORIGEM             IN (1, 12)'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
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
    Left = 233
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryParcelas_FBPARCELAS_FB: TFloatField
      FieldName = 'PARCELAS_FB'
    end
  end
  object qryQuantParcelas_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC_FP'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            IN (1, 8)'
      '   AND HME.HMEORIGEM             IN (1, 12)'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'P'#39
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantParcelas_FPTOTALPARC_FP: TFloatField
      FieldName = 'TOTALPARC_FP'
    end
  end
  object qryQuantParcelas_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC_FB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            IN (1, 8)'
      '   AND HME.HMEORIGEM             IN (1, 12)'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'P'#39
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 233
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantParcelas_FBTOTALPARC_FB: TFloatField
      FieldName = 'TOTALPARC_FB'
    end
  end
  object qryEncargos_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_CR'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 4'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryEncargos_CRENCARGOS_CR: TFloatField
      FieldName = 'ENCARGOS_CR'
    end
  end
  object qryQuantEncargos_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALENC_CR'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 4'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryQuantEncargos_CRTOTALENC_CR: TFloatField
      FieldName = 'TOTALENC_CR'
    end
  end
  object qryEncargos_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_FP'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 4'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryEncargos_FPENCARGOS_FP: TFloatField
      FieldName = 'ENCARGOS_FP'
    end
  end
  object qryEncargos_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS_FB'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 4'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
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
    Left = 236
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryEncargos_FBENCARGOS_FB: TFloatField
      FieldName = 'ENCARGOS_FB'
    end
  end
  object qryQuantEncargos_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALENC_FP'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 4'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantEncargos_FPTOTALENC_FP: TFloatField
      FieldName = 'TOTALENC_FP'
    end
  end
  object qryAmort_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORT_CR'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 2'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryAmort_CRAMORT_CR: TFloatField
      FieldName = 'AMORT_CR'
    end
  end
  object qryQuantAmort_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMORT_CR'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 2'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantAmort_CRTOTALAMORT_CR: TFloatField
      FieldName = 'TOTALAMORT_CR'
    end
  end
  object qryAmort_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORT_FP'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 2'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
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
    Left = 127
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryAmort_FPAMORT_FP: TFloatField
      FieldName = 'AMORT_FP'
    end
  end
  object qryQuantAmort_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMORT_FP'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 2'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 127
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantAmort_FPTOTALAMORT_FP: TFloatField
      FieldName = 'TOTALAMORT_FP'
    end
  end
  object qryAmort_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORT_FB'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 2'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
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
    Left = 238
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryAmort_FBAMORT_FB: TFloatField
      FieldName = 'AMORT_FB'
    end
  end
  object qryQuantAmort_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMORT_FB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 2'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 239
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantAmort_FBTOTALAMORT_FB: TFloatField
      FieldName = 'TOTALAMORT_FB'
    end
  end
  object qryQuit_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_CR'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 3'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuit_CRQUIT_CR: TFloatField
      FieldName = 'QUIT_CR'
    end
  end
  object qryQuit_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_FP'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 3'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 122
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuit_FPQUIT_FP: TFloatField
      FieldName = 'QUIT_FP'
    end
  end
  object qryQuit_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_FB'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(HME.FLGBAIXADO,NULL,HME.HMEVLREFETIVO,HME.HMEVLRPRE' +
        'VISTO) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            = 3'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '      AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVI' +
        'ADO IS NULL))'
      
        '      AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HME' +
        'DATAEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NV' +
        'L(HME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
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
    Left = 234
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuit_FBQUIT_FB: TFloatField
      FieldName = 'QUIT_FB'
    end
  end
  object qryQuantQuit_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUIT_CR'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 382
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantQuit_CRTOTALQUIT_CR: TFloatField
      FieldName = 'TOTALQUIT_CR'
    end
  end
  object qryQuantQuit_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUIT_FP'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'P'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 123
    Top = 382
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantQuit_FPTOTALQUIT_FP: TFloatField
      FieldName = 'TOTALQUIT_FP'
    end
  end
  object qryQuantQuit_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUIT_FB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 235
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantQuit_FBTOTALQUIT_FB: TFloatField
      FieldName = 'TOTALQUIT_FB'
    end
  end
  object qryAbonados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ABON' +
        'ADOS,'
      '    NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_ABONADOS'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      '      HME.HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            IN (1,4)'
      '      AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '      AND HME.HMETIPOFOLHA          = '#39'B'#39
      '      AND HME.HMEDATAPREVISTA       >= :PDATAINI'
      '      AND HME.HMEDATAPREVISTA       <= :PDATAFIM'
      '      AND ('
      '          ( (HME.FLGABONADO = 1) AND'
      
        '            (HME.HMEDATAQUITABONO >= :PDATAINI AND HME.HMEDATAQU' +
        'ITABONO <= :PDATAFIM ) )'
      '          )'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 366
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryAbonadosIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryAbonadosABONADOS: TFloatField
      FieldName = 'ABONADOS'
    end
    object qryAbonadosTOT_ABONADOS: TFloatField
      FieldName = 'TOT_ABONADOS'
    end
  end
  object qryParcAtras_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PA' +
        'RC_ATRAS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC_ATRAS'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      '      HME.HMEVLREFETIVO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.FLGSITUACAO          <> '#39'C'#39
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      '   AND HME.HMETIPOMOV         = 1'
      '   AND HME.FLGBAIXADO         IS NULL'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      '   AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      '   AND HME.HMEDATAEFETIVA     >= :PDATAINI'
      '   AND HME.HMEDATAEFETIVA     <= :PDATAFIM'
      
        '   AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA,'#39'0000'#39')))) |' +
        '| (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39')))) ) < :PANOM' +
        'ES'
      '   AND ( HME.FLGABONADO IS NULL OR HME.FLGABONADO = 0 )'
      '   AND ( HME.FLGQUITADO IS NULL OR HME.FLGQUITADO = 0 )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 366
    Top = 177
    ParamData = <
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
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptUnknown
      end>
    object qryParcAtras_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcAtras_CRREC_PARC_ATRAS: TFloatField
      FieldName = 'REC_PARC_ATRAS'
    end
    object qryParcAtras_CRTOT_REC_PARC_ATRAS: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS'
    end
  end
  object qryParcAtras_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PA' +
        'RC_ATRAS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC_ATRAS'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      '      HME.HMEVLREFETIVO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.FLGSITUACAO          <> '#39'C'#39
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      '   AND HME.HMETIPOMOV         = 1'
      '   AND HME.FLGBAIXADO         IS NULL'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      '   AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '   AND HME.HMETIPOFOLHA       = '#39'P'#39
      '   AND HME.HMEDATAEFETIVA     >= :PDATAINI'
      '   AND HME.HMEDATAEFETIVA     <= :PDATAFIM'
      
        '   AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA,'#39'0000'#39')))) |' +
        '| (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39')))) ) < :PANOM' +
        'ES'
      '   AND ( HME.FLGABONADO IS NULL OR HME.FLGABONADO = 0 )'
      '   AND ( HME.FLGQUITADO IS NULL OR HME.FLGQUITADO = 0 )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 177
    ParamData = <
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
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptUnknown
      end>
    object qryParcAtras_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcAtras_FPREC_PARC_ATRAS: TFloatField
      FieldName = 'REC_PARC_ATRAS'
    end
    object qryParcAtras_FPTOT_REC_PARC_ATRAS: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS'
    end
  end
  object qryParcAtras_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_PA' +
        'RC_ATRAS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC_ATRAS'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      '      HME.HMEVLREFETIVO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.FLGSITUACAO          <> '#39'C'#39
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      '   AND HME.HMETIPOMOV         = 1'
      '   AND HME.FLGBAIXADO         IS NULL'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      '   AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '   AND HME.HMETIPOFOLHA       = '#39'B'#39
      '   AND HME.HMEDATAEFETIVA     >= :PDATAINI'
      '   AND HME.HMEDATAEFETIVA     <= :PDATAFIM'
      
        '   AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA,'#39'0000'#39')))) |' +
        '| (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39')))) ) < :PANOM' +
        'ES'
      '   AND ( HME.FLGABONADO IS NULL OR HME.FLGABONADO = 0 )'
      '   AND ( HME.FLGQUITADO IS NULL OR HME.FLGQUITADO = 0 )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 568
    Top = 177
    ParamData = <
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
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptUnknown
      end>
    object qryParcAtras_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcAtras_FBREC_PARC_ATRAS: TFloatField
      FieldName = 'REC_PARC_ATRAS'
    end
    object qryParcAtras_FBTOT_REC_PARC_ATRAS: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS'
    end
  end
  object qryQuantEncargos_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALENC_FB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 4'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND HME.HMETIPOFOLHA          = '#39'B'#39
      
        '   AND ((:PENVIADO = 1 AND HME.FLGENVIO IS NULL)   OR (:PENVIADO' +
        ' IS NULL))'
      
        '   AND ((:PBAIXADO = 1 AND HME.FLGBAIXADO IS NULL AND HME.HMEDAT' +
        'AEFETIVA IS NOT NULL AND HME.HMEVLREFETIVO IS NOT NULL AND NVL(H' +
        'ME.FLGABONADO,0) = 0) OR (:PBAIXADO IS NULL))'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 236
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PBAIXADO'
        ParamType = ptUnknown
      end>
    object qryQuantEncargos_FBTOTALENC_FB: TFloatField
      FieldName = 'TOTALENC_FB'
    end
  end
end
