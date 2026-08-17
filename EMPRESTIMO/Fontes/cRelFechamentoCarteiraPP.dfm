inherited cfgRelFechamentoCarteiraPP: TcfgRelFechamentoCarteiraPP
  Left = 89
  Top = 114
  Caption = 'Resumo da Carteira - por Plano e Patrocinadora'
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
      TabOrder = 5
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
      TabOrder = 6
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
        Width = 80
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
      Top = 88
      Height = 121
      TabOrder = 4
      inherited Label6: TLabel
        Width = 119
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
      '         AND ITC.ITCTRATASALDODEV    <> 0'
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
      '                  AND IT.ITCTRATASALDODEV   <> 0'
      
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
    Left = 640
    Top = 16
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
      '      AND ITC.ITCTRATASALDODEV   <> 0'
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
      '               AND IT.ITCTRATASALDODEV   <> 0'
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
    Left = 736
    Top = 16
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
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          ITC.ITCTRATASALDODEV    <> 0'
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
    Left = 640
    Top = 56
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
    Left = 736
    Top = 56
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
  object qryQuantQuitPar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(DISTINCT(C.IDCONTRATOEMPTMO)) AS TOTQUITPARC'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   ITEMXTIPOCONTR  ITC,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND ITC.ITCTRATASALDODEV      = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND NOT EXISTS'
      '     ('
      '     SELECT'
      '        H1.IDCONTRATOEMPTMO'
      '     FROM'
      '        HISTMOVEMPTMO  H1,'
      '        CONTRATOEMPTMO C1'
      '     WHERE'
      '            C1.FLGSITUACAO         <> '#39'C'#39
      '        AND C1.IDPATRO              =:PIDPATRO'
      '        AND C1.IDPLANOPREV          =:PIDPLANOPREV'
      '        AND C1.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      
        '        AND (:PIDCONTRATOEMPTMO     IS NULL OR C1.IDCONTRATOEMPT' +
        'MO =:PIDCONTRATOEMPTMO)'
      '        AND H1.HMETIPOMOV           = 1'
      '        AND H1.HMEPARCELA           > 0'
      '        AND H1.HMESEQCOBRANCA       = 1'
      '        AND NVL(H1.FLGESTORNADO, 0) = 0'
      '        AND H1.HMEANOCOMPETENCIA    =:PHMEANOCOMPETENCIA'
      '        AND H1.HMEMESCOMPETENCIA    =:PHMEMESCOMPETENCIA'
      '        AND C1.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO'
      '        AND H1.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO'
      '     )'
      '   AND A.IDTIPOCONTREMPTMO          = C.IDTIPOCONTREMPTMO'
      '   AND A.IDTIPOCONTREMPTMO          = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO             = ITC.IDITEMEMPTMO'
      '   AND C.IDCONTRATOEMPTMO           = HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 736
    Top = 96
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
    object qryQuantQuitParTOTQUITPARC: TFloatField
      FieldName = 'TOTQUITPARC'
    end
  end
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HME.HMETIPOMOV            IN (1, 8)'
      '      AND HME.HMEORIGEM             IN (1, 12)'
      '      AND ITC.ITCTRATASALDODEV     <> 0'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 136
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
    object qryParcelasPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
  end
  object qryQuantParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALPARC'
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
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 736
    Top = 136
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
    object qryQuantParcelasTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryEncerrados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCERRADOS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS QUANTENCERRA'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMETIPOMOV            = 1'
      '      AND HME.HMEORIGEM             IN (1,12)'
      '      AND ITC.ITCTRATASALDODEV      = 1'
      '      AND HME.HMESALDODEV           = 0'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 176
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
    object qryEncerradosENCERRADOS: TFloatField
      FieldName = 'ENCERRADOS'
    end
    object qryEncerradosQUANTENCERRA: TFloatField
      FieldName = 'QUANTENCERRA'
    end
  end
  object qryAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMETIPOMOV            = 2'
      '      AND HME.HMEORIGEM             = 2'
      '      AND ITC.ITCTRATASALDODEV     <> 0'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 216
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
    object qryAmortizacaoAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
  end
  object qryQuantAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALAMO'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO             <> '#39'C'#39
      ''
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      ''
      '   AND HME.HMETIPOMOV            = 2'
      '   AND HME.HMEORIGEM             = 2'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   A.IDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 736
    Top = 216
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
    object qryQuantAmortizacaoTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO'
      'FROM'
      
        '   TIPOCONTREMPTMO A,                                           ' +
        '                                 '
      
        '   (                                                            ' +
        '                                 '
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMETIPOMOV            = 3'
      '      AND HME.HMEORIGEM            <> 8'
      '      AND ITC.ITCTRATASALDODEV     <> 0'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 256
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
    object qryQuitacaoQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
  end
  object qryQuantQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUI'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   ITEMXTIPOCONTR  ITC,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO            <> '#39'C'#39
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM            <> 8'
      '   AND ITC.ITCTRATASALDODEV      = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 736
    Top = 256
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
    object qryQuantQuitacaoTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
  end
  object qryQuitMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_MORT'
      'FROM'
      '   TIPOCONTREMPTMO A,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      ''
      
        '      DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO * (-1)' +
        '), 2, HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO'
      ''
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.FLGSITUACAO            <> '#39'C'#39
      '      AND HME.HMETIPOMOV            = 3'
      '      AND HME.HMEORIGEM             = 8'
      '      AND ITC.ITCTRATASALDODEV     <> 0'
      '      AND C.IDPATRO                 =:PIDPATRO'
      '      AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '      AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO)'
      '      AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '      AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '      AND HME.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO       = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '   A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)')
    ValidateWithMask = True
    Left = 640
    Top = 296
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
    object qryQuitMorteQUIT_MORT: TFloatField
      FieldName = 'QUIT_MORT'
    end
  end
  object qryQuantQuitMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(C.IDCONTRATOEMPTMO) AS TOTALQUM'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  C,'
      '   ITEMXTIPOCONTR  ITC,'
      '   TIPOCONTREMPTMO A'
      'WHERE'
      '       C.FLGSITUACAO            <> '#39'C'#39
      ''
      '   AND C.IDPATRO                 =:PIDPATRO'
      '   AND C.IDPLANOPREV             =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO       =:PIDTIPOCONTREMPTMO'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR C.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO)'
      ''
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM             = 8'
      '   AND ITC.ITCTRATASALDODEV      = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEANOCOMPETENCIA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA     =:PHMEMESCOMPETENCIA'
      '   AND A.IDTIPOCONTREMPTMO       = C.IDTIPOCONTREMPTMO'
      '   AND C.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO       = ITC.IDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 736
    Top = 296
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
    object qryQuantQuitMorteTOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
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
      '         AND ITC.ITCTRATASALDODEV    <> 0'
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
      '                  AND IT.ITCTRATASALDODEV   <> 0'
      
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
    Left = 640
    Top = 336
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
      '      AND ITC.ITCTRATASALDODEV   <> 0'
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
      '               AND IT.ITCTRATASALDODEV   <> 0'
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
    Left = 736
    Top = 336
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
    Left = 32
    Top = 288
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
end
