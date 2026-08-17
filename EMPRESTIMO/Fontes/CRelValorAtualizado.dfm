inherited cfgRelValorAtualizado: TcfgRelValorAtualizado
  Left = 420
  Top = 218
  HelpContext = 150114
  Caption = 'Demonstrativo de Valores em Aberto'
  ClientHeight = 268
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 707
    Height = 235
    object Label5: TLabel
      Left = 6
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Matrícula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 111
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Mutuário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 332
      Top = 144
      Width = 345
      Height = 65
      TabOrder = 0
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 38
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 252
        Top = 36
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
        Left = 16
        Top = 16
        Width = 312
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 420
      Top = 64
      Width = 257
      Height = 65
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 28
        Width = 133
        Height = 13
        Caption = 'Atualizar valores até:   '
      end
      object edtDataVencto: TwwDBDateTimePicker
        Left = 144
        Top = 24
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object chkCalcApenas: TCheckBox
      Left = 10
      Top = 215
      Width = 161
      Height = 17
      Caption = 'Apenas calcular parcela: '
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object edtMatricula: TEdit
      Left = 6
      Top = 22
      Width = 101
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtNome: TEdit
      Left = 110
      Top = 22
      Width = 503
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnBuscaPart: TBitBtn
      Left = 620
      Top = 22
      Width = 24
      Height = 22
      Hint = 'Busca um Participante'
      TabOrder = 5
      OnClick = molMutuariobtnBuscaPartClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object btnLimpaPart: TBitBtn
      Left = 644
      Top = 22
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Participante'
      TabOrder = 6
      OnClick = molMutuariobtnLimpaPartClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object gridContratos: TwwDBGrid
      Left = 8
      Top = 64
      Width = 302
      Height = 145
      Selected.Strings = (
        'SEL'#9'3'#9'Sel.'#9'F'
        'IDCONTRATOEMPTMO'#9'20'#9' Num. Contrato'#9'T'
        'TCEDESCRICAO'#9'30'#9' Modalidade'#9'T')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsContratos
      TabOrder = 7
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 235
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 150114
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   , HME.HMEDATAVENCTO,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        ','
      '   HME.HMETXJUROS       ,'
      ''
      ''
      
        '  decode(LEAD(HME.HMEPARCELA) OVER (ORDER BY HME.IDCONTRATOEMPTM' +
        'O '
      '                                  , HME.HMEPARCELA '
      '                                  , NVL(ITC.ITCORDEMEXTRATO, 0) '
      
        '                                  , DECODE(HME.HMETIPOMOV, 1, 1,' +
        ' 2, 2, 3, 3, 4, 5, 7, 4) ),null,HME.HMEPARCELA,'
      '                                  '
      '  LEAD(HME.HMEPARCELA) OVER (ORDER BY HME.IDCONTRATOEMPTMO '
      '                                  , HME.HMEPARCELA '
      '                                  , NVL(ITC.ITCORDEMEXTRATO, 0) '
      
        '                                  , DECODE(HME.HMETIPOMOV, 1, 1,' +
        ' 2, 2, 3, 3, 4, 5, 7, 4) ))                                '
      '                                  '
      '                                   AS PROXIMA_PARCELA, '
      ''
      '   HME.HMEPARCELA,'
      '   HME.HMEPARCELAALT,'
      '   HME.HMENUMPARCELAS,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      
        '   HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRA' +
        'NCA,'
      '   HME.HMERECPAG,'
      '   HME.FLGENTRADAMANUAL,'
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOMPETE' +
        'NCIA AS COMPETENCIA,'
      
        '   TO_CHAR(HME.HMEMESCOBRANCA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOBRANCA A' +
        'S COBRANCA,'
      ''
      '   CON.IDPATRO, CON.IDPLANOPREV,'
      ''
      '   ITE.ITEDESCRICAO,'
      '   PPP.IDSITPART,'
      '   STP.FLGINTERNO'
      ''
      'FROM'
      '   PESSOA          PES,'
      '   HISTMOVEMPTMO   HME,'
      '   PARTPREVPLAN    PPP,'
      '   CONTRATOEMPTMO  CON,'
      '   SITPART         STP,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      '   ITEMEMPTMO      ITE,'
      '   TIPOSUSPEMPTMO  TSE'
      ''
      'WHERE'
      '       ( HME.FLGDIVERGPEND = 1 )'
      
        '   AND ( (:PIDBENEF            IS NULL) OR (CON.IDBENEF         ' +
        '  =:PIDBENEF) )'
      
        '   AND ( (:PIDCONTRATOEMPTMO   IS NULL) OR (CON.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO) )'
      ''
      
        '   AND ( (:PIDTIPOEMPTMO       IS NULL) OR (TC.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO  IS NULL) OR (CON.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDPATRO            IS NULL) OR (CON.IDPATRO         ' +
        '  =:PIDPATRO) )'
      
        '   AND ( (:PIDPLANOPREV        IS NULL) OR (CON.IDPLANOPREV     ' +
        '  =:PIDPLANOPREV) )'
      
        '   AND ( (:PIDPLANOPREV        IS NULL) OR (CON.IDPLANOPREV     ' +
        '  =:PIDPLANOPREV) )'
      
        '   AND ( (:PHMEMESCOBRANCA     IS NULL) OR (HME.HMEMESCOBRANCA  ' +
        '  =:PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEANOCOBRANCA     IS NULL) OR (HME.HMEANOCOBRANCA  ' +
        '  =:PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOMPETENCIA  IS NULL) OR (HME.HMEMESCOMPETENCI' +
        'A =:PHMEMESCOMPETENCIA) )'
      
        '   AND ( (:PHMEANOCOMPETENCIA  IS NULL) OR (HME.HMEANOCOMPETENCI' +
        'A =:PHMEANOCOMPETENCIA) )'
      ''
      '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( HME.HMETIPOMOV        IN (1, 2, 3, 4, 7) )'
      '   AND ( CON.FLGSITUACAO       NOT IN ('#39'C'#39','#39'Q'#39') )'
      ''
      
        '   AND (PPP.FLGDESATIVADO = 0 OR (PPP.FLGDESATIVADO = 1 AND NOT ' +
        'EXISTS (SELECT 1 FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP' +
        'P.IDPESSOA  '
      
        '   AND PPP1.FLGDESATIVADO = 0) AND (PPP.IDSITPLANOPREV = 25 OR (' +
        'PPP.IDSITPLANOPREV <> 25                                        ' +
        '            '
      
        '   AND PPP.DATACANCELAMENTO = (SELECT MAX(PPP1.DATACANCELAMENTO)' +
        ' FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PPP.IDPESSOA)     ' +
        '            '
      
        '   AND NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP1 WHERE PPP1.ID' +
        'PESSOA = PPP.IDPESSOA AND PPP1.IDSITPLANOPREV = 25)))))  '
      ' '
      ''
      '   AND ( CON.IDPATRO           = PPP.IDPESSJUR )'
      '   AND ( CON.IDPESSOA          = PPP.IDPESSOA )'
      '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )'
      '   AND ( PPP.IDSITPART         = STP.IDSITPART )'
      '   AND ( CON.IDBENEF           = PES.IDPESSOA )'
      '   AND ( CON.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO )'
      '   AND ( HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO )'
      '   AND ( CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+) )'
      ''
      'ORDER BY'
      '   HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.HMEPARCELA'
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 92
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
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
        Name = 'PIDPATRO'
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
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 44
    end
    object qryHistMovCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 44
    end
    object qryHistMovIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryHistMovIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryHistMovIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryHistMovFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovPROXIMA_PARCELA: TFloatField
      FieldName = 'PROXIMA_PARCELA'
    end
    object qryHistMovFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
    end
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 192
    Top = 132
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      '   HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.IDITEMEMPTMO,'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEDATAPREVISTA, HME.HMEVLRPREVISTO,'
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMESEQCOBRANCA, HME.HMESALDODEV, HME.HMETXJUROS,'
      '   HME.HMECENTRALIZA, HME.FLGENTRADAMANUAL,HME.HMEDATAVENCTO,'
      '   0 as proxima_parcela,'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS TSEDE' +
        'SCRICAO,'
      '   '#39'00000 % (ao ano)'#39' AS TAXA,'
      '   '#39'0000'#39' AS PRAZO,'
      '   '#39'00/00/0000'#39' AS DATACREDITO,'
      '   '#39' 0123456789'#39' AS INDICE'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '   1 = 2'
      'order by'
      '  IDCONTRATOEMPTMO, --wo42910 leandro'
      '  HMEPARCELA,  --wo39105 leandro'
      
        '  DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4),  --wo429' +
        '10 leandro'
      '  proxima_parcela      --wo39105 leandro'
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
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 196
    Top = 90
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovVirtualHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovVirtualHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      Alignment = taCenter
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovVirtualHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovVirtualHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryHistMovVirtualHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovVirtualHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovVirtualPROXIMA_PARCELA: TFloatField
      FieldName = 'PROXIMA_PARCELA'
    end
    object qryHistMovVirtualTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualTAXA: TStringField
      FieldName = 'TAXA'
      FixedChar = True
      Size = 16
    end
    object qryHistMovVirtualPRAZO: TStringField
      FieldName = 'PRAZO'
      FixedChar = True
      Size = 4
    end
    object qryHistMovVirtualDATACREDITO: TStringField
      FieldName = 'DATACREDITO'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualINDICE: TStringField
      FieldName = 'INDICE'
      FixedChar = True
      Size = 11
    end
    object qryHistMovVirtualFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
    end
    object qryHistMovVirtualHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 194
    Top = 180
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(CON.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                         '#39'C'#39','#39'Cancelado'#39','
      '                         '#39'E'#39','#39'Encerrado'#39','
      '                         '#39'Q'#39','#39'Quitado'#39','
      '                         '#39'R'#39','#39'Refinanciado'#39','
      '                         '#39'S'#39','#39'Suspenso'#39','
      
        '                         '#39'K'#39','#39'Pendente de Quitação'#39') AS DESCSITC' +
        'ONTRATO,'
      ''
      '  SIT.IDSITPART,'
      '  SIT.DESCRICAO AS SITUACAO,'
      '  SIT.FLGINTERNO,'
      '  ELP.MATRICULA,'
      '  MUT.NOME      AS BENEFICIARIO,'
      ''
      '  TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      ''
      '  TEM.DESCTIPOEMPTMO,'
      ''
      
        '  CON.IDCONTRATOEMPTMO , CON.IDCONTRQUITACAO, CON.IDPESSOA      ' +
        ' , CON.IDBENEF     ,'
      
        '  CON.IDINSCRICAOEMPTMO, CON.IDPLANOPREV    , CON.IDPATRO       ' +
        ' , CON.IDVERBA     ,'
      
        '  CON.IDTIPOCONTREMPTMO, CON.IDCBANCARIADEB , CON.NUMPARCELAS   ' +
        ' , CON.IDCBANCARIA ,'
      
        '  CON.CODFORMAPAG      , CON.PORTFORMAPAG   , CON.PORTFORMAREC  ' +
        ' , CON.DATACANC    ,'
      
        '  CON.DATACREDITO      , CON.DATASITUACAO   , CON.DATAASSINATURA' +
        ' , CON.DATAPRIMPARC,'
      
        '  CON.VLRCONTRATO      , CON.VLRPARCELA     , CON.TXJUROS       ' +
        ' ,'
      
        '  CON.FLGSITUACAO      , CON.FLGFORMAREC    , CON.FLGFORMAPAG   ' +
        ' ,'
      
        '  CON.VLRSALBASE       , CON.VLRMARGEM      , CON.VLRMAXPERMIT  ' +
        ' , CON.IDPLANOORIGEM,'
      ''
      '  TO_DATE('#39'01/01/1980'#39', '#39'dd/mm/yyyy'#39') AS DATAINSC,'
      ''
      '  MOE.MOESIGLA,'
      ''
      
        '  CON.MOECODIGO        , CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUS' +
        'P, CON.DATAFIMSUSP,'
      '  CON.ANOSUSPENSAO     , CON.MESSUSPENSAO    ,'
      '  TSE.TSEDESCRICAO,'
      ' MUT.NUMDOCUMENTO, CON.FLGPERDAEFETIVA'
      ''
      'FROM'
      '   PESSOA          MUT,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM,'
      '   SITPART         SIT,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOSUSPEMPTMO  TSE,'
      '   MOEDA           MOE'
      ''
      'WHERE'
      '       CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      ''
      '   AND CON.IDPATRO           = PPP.IDPESSJUR'
      '   AND CON.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '  '
      
        'AND (PPP.IDPLANOPREV =                                          ' +
        '                        '
      
        '     (SELECT MAX(PPP2.IDPLANOPREV)                              ' +
        '                         '
      
        '         FROM PARTPREVPLAN PPP2                                 ' +
        '                         '
      
        '        WHERE PPP2.FLGDESATIVADO = 0                            ' +
        '                         '
      
        '          AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                  ' +
        '                         '
      
        '     (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                      ' +
        '                         '
      
        '      (SELECT 1                                                 ' +
        '                         '
      
        '          FROM PARTPREVPLAN PPP1                                ' +
        '                         '
      
        '         WHERE PPP1.IDPESSOA = PPP.IDPESSOA                     ' +
        '                         '
      
        '           AND PPP1.FLGDESATIVADO = 0) AND                      ' +
        '                         '
      
        '      (PPP.IDSITPLANOPREV = 25 OR                               ' +
        '                         '
      
        '      (PPP.IDPLANOPREV =                                        ' +
        '                         '
      
        '      (SELECT MAX(PPP1.IDPLANOPREV)                             ' +
        '                         '
      
        '            FROM PARTPREVPLAN PPP1                              ' +
        '                         '
      
        '           WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   ' +
        '                         '
      
        '             AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =    ' +
        '                         '
      
        '                 (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SY' +
        'SDATE))                  '
      
        '                    FROM PARTPREVPLAN PPP2                      ' +
        '                         '
      
        '                   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)         ' +
        '                         '
      
        '             AND NOT EXISTS (SELECT 1                           ' +
        '                         '
      
        '                   FROM PARTPREVPLAN PPP2                       ' +
        '                         '
      
        '                  WHERE PPP2.IDPESSOA = PPP1.IDPESSOA           ' +
        '                         '
      '                    AND PPP2.IDSITPLANOPREV = 25))))))'
      '  '
      '   AND CON.IDPESSOA          = ELP.IDPESSOA'
      '   AND CON.IDPATRO           = ELP.IDPESSJUR'
      '   AND CON.IDBENEF           = MUT.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND CON.MOECODIGO         = MOE.MOECODIGO(+)'
      ''
      '   '
      '   '
      '   '
      '                    '
      '   '
      '   '
      '   ')
    ValidateWithMask = True
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDContratoEmptmo'
        ParamType = ptInput
      end>
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
    end
    object qryVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
    end
    object qryVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
    end
    object qryIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
    object qryTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object fltfldFLGPERDAEFETIVA: TFloatField
      FieldName = 'FLGPERDAEFETIVA'
    end
  end
  object qryContratos_old: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.MATRICULA, C.IDCONTRATOEMPTMO, C.FLGSITUACAO'
      '  FROM DEPENTIT D, CONTRATOEMPTMO C'
      ' WHERE C.IDPESSOA = D.IDTITULAR'
      '   AND C.IDBENEF  = D.IDPESSOA'
      '   AND C.FLGSITUACAO NOT IN ('#39'C'#39','#39'Q'#39','#39'K'#39')'
      '   AND D.MATRICULA = :MATRICULA')
    ValidateWithMask = True
    Left = 48
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 306
    Top = 86
  end
  object montaSelectMutuario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'MUT.NOME'
      'DEP.MATRICULA AS MATRICULA'
      'PPP.INSCRICAONUMERO AS INSCRICAO_TIT'
      'MUT.NUMDOCUMENTO AS CPF'
      'TIT.NOME AS NOME_TIT'
      'TIT.NUMDOCUMENTO AS CPF_TIT'
      'SIP.DESCRICAO AS SIT_PART'
      'SPP.DESCRICAO AS SIT_PLANO'
      'PPA.NOME AS NOME_PATRO'
      'PLP.NOME AS NOME_PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula'
      'Inscrição Prev.'
      'C.P.F.'
      'Nome do Titular'
      'C.P.F. do Titular'
      'Situação na Fundação'
      'Situação no Plano'
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA         MUT'
      'PESSOA         TIT'
      'PESSOA         PPA'
      'CONTRATOEMPTMO CON'
      'DEPENTIT       DEP'
      'ELEGPATRO      ELP'
      '(SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1) PPP'
      'PLANPREV       PLP'
      'SITPART        SIP'
      'SITPLANOPREV   SPP')
    CamposChave.Strings = (
      'MUT.IDPESSOA'
      'TIT.IDPESSOA'
      'MUT.NOME'
      'DEP.MATRICULA'
      'ELP.MATRICULA'
      'PPP.INSCRICAONUMERO'
      'MUT.NUMDOCUMENTO'
      'TIT.NOME'
      'TIT.NUMDOCUMENTO')
    Filtro.Strings = (
      'CON.IDBENEF        = MUT.IDPESSOA'
      'CON.IDPESSOA       = TIT.IDPESSOA  '
      'CON.IDBENEF        = DEP.IDPESSOA  '
      'CON.IDPESSOA       = DEP.IDTITULAR  '
      'CON.IDPESSOA       = ELP.IDPESSOA  '
      'ELP.IDPESSOA       = TIT.IDPESSOA  '
      'ELP.IDPESSJUR      = PPA.IDPESSOA  '
      'ELP.IDPESSJUR      = PPP.IDPESSJUR  '
      'ELP.IDPESSOA       = PPP.IDPESSOA  '
      'ELP.IDPESSOA       = DEP.IDTITULAR  '
      'PPP.IDPLANOPREV    = PLP.IDPLANOPREV  '
      'PPP.IDSITPART      = SIP.IDSITPART'
      'PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV'
      
        '(PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV) FROM PARTPREVPL' +
        'AN PPP2 WHERE PPP2.FLGDESATIVADO = 0 AND PPP2.IDPESSOA = PPP.IDP' +
        'ESSOA) OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM P' +
        'ARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND PPP1.FLG' +
        'DESATIVADO = 0) AND (PPP.IDSITPLANOPREV = 25 OR (PPP.IDPLANOPREV' +
        ' = (SELECT MAX(PPP1.IDPLANOPREV) FROM PARTPREVPLAN PPP1 WHERE PP' +
        'P1.IDPESSOA = PPP.IDPESSOA AND NVL(PPP1.DATACANCELAMENTO, TRIM(S' +
        'YSDATE)) = (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE)' +
        ') FROM PARTPREVPLAN PPP2 WHERE PPP2.IDPESSOA = PPP1.IDPESSOA) AN' +
        'D NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP2 WHERE PPP2.IDPESSO' +
        'A = PPP1.IDPESSOA AND PPP2.IDSITPLANOPREV = 25))))))')
    Mascaras.Strings = (
      ''
      ''
      ''
      '999.999.999-99;0;'
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '38'
      '12'
      '13'
      '14'
      '35'
      '14'
      '40'
      '40'
      '35'
      '35')
    OperComparador.Strings = (
      '0'
      '1'
      '0'
      '0'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 416
    Top = 104
  end
  object qryContratos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT 0 SEL, D.MATRICULA, C.IDCONTRATOEMPTMO, C.FLGSITUACAO, TC' +
        '.TCEDESCRICAO, C.VLRCONTRATO'
      '  FROM DEPENTIT D'
      '       JOIN CONTRATOEMPTMO C ON C.IDPESSOA = D.IDTITULAR'
      '                             AND C.IDBENEF = D.IDPESSOA'
      
        '       JOIN TIPOCONTREMPTMO TC ON TC.IDTIPOCONTREMPTMO = C.IDTIP' +
        'OCONTREMPTMO'
      ' WHERE C.FLGSITUACAO NOT IN ('#39'C'#39','#39'Q'#39','#39'K'#39')'
      '   AND D.MATRICULA =  :MATRICULA')
    UpdateObject = updContratos
    ControlType.Strings = (
      'SEL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 274
    Top = 164
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
    object qryContratosSEL: TFloatField
      DisplayLabel = 'Sel.'
      DisplayWidth = 3
      FieldName = 'SEL'
    end
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = ' Num. Contrato'
      DisplayWidth = 20
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosTCEDESCRICAO: TStringField
      DisplayLabel = ' Modalidade'
      DisplayWidth = 30
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratosMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Visible = False
      Size = 15
    end
    object qryContratosFLGSITUACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSITUACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContratosVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
  end
  object dsContratos: TwwDataSource
    DataSet = qryContratos
    Left = 272
    Top = 144
  end
  object updContratos: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  SEL = :SEL'
      'where'
      '  SEL = :OLD_SEL and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 272
    Top = 131
  end
  object qryCalculos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 351
    Top = 88
  end
  object qryAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 399
    Top = 64
  end
end
