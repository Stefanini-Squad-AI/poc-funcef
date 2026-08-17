inherited cfgRelResumoCarteiraPlanoPatro: TcfgRelResumoCarteiraPlanoPatro
  Left = 315
  Top = 218
  Caption = 'Resumo da Carteira'
  ClientHeight = 349
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 622
    Height = 316
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label3: TLabel
      Left = 39
      Top = 263
      Width = 123
      Height = 13
      Caption = 'afetam saldo devedor'
      Enabled = False
      Visible = False
    end
    object Label6: TLabel
      Left = 16
      Top = 50
      Width = 94
      Height = 13
      Caption = 'Patrocinadora(s)'
    end
    object Label7: TLabel
      Left = 320
      Top = 50
      Width = 47
      Height = 13
      Caption = 'Plano(s)'
    end
    object Panel1: TPanel
      Left = 320
      Top = 177
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
      Top = 238
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
        DropDownWidth = 119
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
      Top = 24
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
      Top = 24
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
      LookupTable = dtmLookEmptmo.qryLookTipoContrato
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
    object chkItens: TCheckBox
      Left = 20
      Top = 248
      Width = 221
      Height = 17
      Caption = 'Levar em conta somente itens que '
      Enabled = False
      TabOrder = 2
      Visible = False
    end
    object lstPatro: TCheckListBox
      Left = 16
      Top = 64
      Width = 289
      Height = 169
      OnClickCheck = lstPatroClickCheck
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
    end
    object btnInvertePatro: TBitBtn
      Left = 264
      Top = 56
      Width = 20
      Height = 20
      Hint = 'Inverte a Seleção'
      TabOrder = 6
      OnClick = btnInvertePatroClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888488888888888888844888888888888444448888888888444444488
        1888884444444888118884448844888881188448884888888118844888888188
        8118844888881188111888448881111111888884881111111888888888811111
        8888888888881188888888888888818888888888888888888888}
    end
    object btnMarcaTodosPatro: TBitBtn
      Left = 284
      Top = 56
      Width = 21
      Height = 20
      Hint = 'Seleciona Todos'
      TabOrder = 7
      OnClick = btnMarcaTodosPatroClick
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
        0000888224888888000088222248888800008822822488880000882848224888
        0000888224822488000088222248228800008822822482880000882888224888
        0000888888822488000088888888228800008888888882880000}
    end
    object lstPlano: TCheckListBox
      Left = 320
      Top = 64
      Width = 289
      Height = 105
      OnClickCheck = lstPlanoClickCheck
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 8
    end
    object btnInvertePlano: TBitBtn
      Left = 567
      Top = 56
      Width = 21
      Height = 20
      Hint = 'Inverte a Seleção'
      TabOrder = 9
      OnClick = btnInvertePlanoClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888488888888888888844888888888888444448888888888444444488
        1888884444444888118884448844888881188448884888888118844888888188
        8118844888881188111888448881111111888884881111111888888888811111
        8888888888881188888888888888818888888888888888888888}
    end
    object btnMarcaTodosPlano: TBitBtn
      Left = 588
      Top = 56
      Width = 21
      Height = 20
      Hint = 'Seleciona Todos'
      TabOrder = 10
      OnClick = btnMarcaTodosPlanoClick
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
        0000888224888888000088222248888800008822822488880000882848224888
        0000888224822488000088222248228800008822822482880000882888224888
        0000888888822488000088888888228800008888888882880000}
    end
  end
  inherited Dock971: TDock97
    Top = 316
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCONTREMPTMO, TCEDESCRICAO'
      'FROM'
      '   TIPOCONTREMPTMO'
      'WHERE'
      '       ( IDTIPOEMPTMO =:PIDTIPOEMPTMO )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (IDTIPOCONTREMPTMO = :' +
        'PIDTIPOCONTREMPTMO) )'
      'ORDER BY'
      '   TCEDESCRICAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
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
      end>
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
  object qryTipoEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOEMPTMO, DESCTIPOEMPTMO'
      'FROM'
      '   TIPOEMPTMO'
      'WHERE'
      '       ( IDEMPRESAPROP =:PIDEMPRESAPROP )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (IDTIPOEMPTMO =:PIDTIPOEMPT' +
        'MO ) )'
      'ORDER BY'
      '   DESCTIPOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 72
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
      end>
    object qryTipoEmptmoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoEmptmoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
  end
  object qrySaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(SLD.HMESALDODEV), 0) AS VALOR,'
      '   NVL(COUNT(SLD.IDCONTRATOEMPTMO), 0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      TC.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO,'
      '      NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC,'
      '      PATRO PTR, PLANPREV PLP,'
      '      ('
      '      SELECT  /*+ INDEX(ITC) */'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             ( ITC.ITCTRATASALDODEV   <> 0 )'
      '         AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      
        '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE(:PDATASLDANT, '#39 +
        'DD/MM/YYYY'#39') )'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) M'
      '   WHERE'
      '          PTR.IDPESSOA         =:PIDPESSOA'
      '      AND PLP.IDPLANOPREV      =:PIDPLANOPREV'
      '      AND TC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '      AND M.IDHISTMOVEMPTMO    = H.IDHISTMOVEMPTMO'
      '      AND M.IDCONTRATOEMPTMO   = H.IDCONTRATOEMPTMO'
      '      AND M.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDPATRO            = PTR.IDPESSOA'
      '      AND C.IDPLANOPREV        = PLP.IDPLANOPREV'
      '      AND TC.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      TC.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO'
      '   ) SLD'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PDATASLDANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end>
    object qrySaldoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qrySaldoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TCE.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE,'
      '      PATRO PTR, PLANPREV PLP'
      '   WHERE'
      '          CON.IDCONTRQUITACAO    IS NULL'
      '      AND CON.FLGSITUACAO       <> '#39'C'#39
      '      AND HMETIPOMOV             = 0'
      '      AND HMEPARCELA             = 0'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      '      AND ITC.ITCSEQCALCULO      = ('
      
        '                                   SELECT /*+ INDEX(ITEMXTIPOCON' +
        'TR) */'
      
        '                                      MIN(ITCSEQCALCULO) AS ITCS' +
        'EQCALCULO'
      '                                   FROM'
      '                                      ITEMXTIPOCONTR'
      '                                   WHERE'
      '                                          ITCEVENTO = 0'
      
        '                                      AND IDTIPOCONTREMPTMO = TC' +
        '.IDTIPOCONTREMPTMO'
      '                                   )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      ''
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      ''
      ''
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ''
      ''
      '/*'
      ''
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS CO' +
        'NCESSOES,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALCONCESSOES'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRQUITACAO      IS NULL'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND HMETIPOMOV             = 0'
      '         AND HMEPARCELA             = 0'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      '         AND ITC.ITCSEQCALCULO      = ('
      
        '                                      SELECT /*+ INDEX(ITEMXTIPO' +
        'CONTR) */'
      
        '                                         MIN(ITCSEQCALCULO) AS I' +
        'TCSEQCALCULO'
      '                                      FROM'
      '                                         ITEMXTIPOCONTR'
      '                                      WHERE'
      '                                             ITCEVENTO = 0'
      
        '                                         AND IDTIPOCONTREMPTMO =' +
        ' TC.IDTIPOCONTREMPTMO'
      '                                      )'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) CONCESSOES,'
      ''
      '   */'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 168
    ParamData = <
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
        Name = 'PIDPESSOA'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryConcessoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConcessoesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryRenovacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRQUITACAO      IS NOT NULL'
      '      AND HMETIPOMOV             = 0'
      '      AND HMEPARCELA             = 0'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( (:PITCTRATASALDODEV IS NULL) OR (ITC.ITCTRATASALDODE' +
        'V <> 0) )'
      '      AND ITCSEQCALCULO =  ('
      '                           SELECT'
      
        '                              MIN(ITCSEQCALCULO) AS ITCSEQCALCUL' +
        'O'
      '                           FROM'
      '                              ITEMXTIPOCONTR'
      '                           WHERE'
      
        '                                  IDTIPOCONTREMPTMO = TC.IDTIPOC' +
        'ONTREMPTMO'
      '                              AND ITCEVENTO = 0'
      '                           )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 128
    Top = 152
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryRenovacoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryRenovacoesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             IN (1, 6, 7) '
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATAS' +
        'ALDODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 136
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryParcelasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryEncargos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             = 4'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATAS' +
        'ALDODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 128
    Top = 120
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryEncargosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEncargosTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryAmortizacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             = 2'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATAS' +
        'ALDODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ''
      '')
    ValidateWithMask = True
    Left = 128
    Top = 104
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryAmortizacoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryAmortizacoesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryQuitacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             = 3'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATAS' +
        'ALDODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 88
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryQuitacoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryQuitacoesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryQuitMort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             = 3'
      '      AND HMEORIGEM              = 8'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATAS' +
        'ALDODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'WHERE'
      '        TE.IDEMPRESAPROP    =:PIDEMPRESAPROP'
      '    AND TE.IDTIPOEMPTMO     =:PIDTIPOEMPTMO'
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 72
    ParamData = <
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
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryQuitMortVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryQuitMortTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
