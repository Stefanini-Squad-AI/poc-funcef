inherited frmExecValorAtualizadoArquivo: TfrmExecValorAtualizadoArquivo
  Left = 122
  Top = 173
  Caption = 'Geração de Arquivo de Inadimplentes'
  ClientHeight = 386
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 353
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label3: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label4: TLabel
      Left = 16
      Top = 298
      Width = 188
      Height = 13
      Caption = 'Caminho para criação do arquivo'
    end
    object DBgrdHistMovVirtual: TwwDBGrid
      Left = 24
      Top = 239
      Width = 265
      Height = 49
      Selected.Strings = (
        'IDCONTRATOEMPTMO'#9'10'#9'Contrato'#9'F'
        'HMEPARCELA'#9'4'#9'Parc'#9'F'
        'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
        'EVENTO'#9'18'#9'Evento'#9'F'
        'IteDescricao'#9'27'#9'Item'#9'F'
        'ANOMES'#9'8'#9'Compet.'#9'F'
        'HMEDATAPREVISTA'#9'11'#9'Data Vencto.'#9'F'
        'HMEVLRPREVISTO'#9'12'#9'Valor Previsto'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dtsHistMovVirtual
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 6
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      Visible = False
      IndicatorColor = icBlack
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited edtNome: TEdit
        Width = 369
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
    end
    object Panel2: TPanel
      Left = 352
      Top = 237
      Width = 257
      Height = 53
      TabOrder = 5
      object Label2: TLabel
        Left = 16
        Top = 21
        Width = 133
        Height = 13
        Caption = 'Atualizar valores até:   '
      end
      object edtDataVencto: TwwDBDateTimePicker
        Left = 144
        Top = 17
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
      LookupTable = dtmLookEmptmo.qryLookTipoContrato
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Width = 305
      Height = 145
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 121
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
      Height = 145
      TabOrder = 4
      inherited Label6: TLabel
        Width = 119
      end
      inherited lstPlano: TCheckListBox
        Height = 121
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
    object pnlPasta: TPanel
      Left = 16
      Top = 312
      Width = 568
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'C:\'
      Color = clCaptionText
      TabOrder = 7
      object lblDiretorio: TLabel
        Left = 588
        Top = 22
        Width = 19
        Height = 13
        Caption = 'C:\'
        Visible = False
      end
    end
    object btnEscolheDir: TBitBtn
      Left = 583
      Top = 311
      Width = 27
      Height = 24
      Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnEscolheDirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
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
      '   HME.HMEPARCELA,'
      '   HME.HMEPARCELAALT,'
      '   HME.HMENUMPARCELAS,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      
        '   HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRA' +
        'NCA,'
      '   HME.HMERECPAG,'
      ''
      
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
      '   AND PPP.FLGDESATIVADO       = 0'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      '   AND ( CON.IDPATRO           = PPP.IDPESSJUR )'
      '   AND ( CON.IDPESSOA          = PPP.IDPESSOA )'
      '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )'
      '   AND ( PPP.IDSITPART         = STP.IDSITPART )'
      '   AND ( CON.IDBENEF           = PES.IDPESSOA )'
      '   AND ( CON.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO )'
      '   AND ( HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.HMEPARCELA')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 88
    Top = 152
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
      '   '#39'123456789012345'#39' AS MATRICULA,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS LOGRADOURO,'
      '   '#39'12345678'#39' AS NUMERO,'
      '   '#39'12345678901234567890'#39' AS COMPL,'
      ''
      '   '#39'12343567890123435678'#39' AS SITUACAO_CONTRATO,'
      ''
      '   '#39'12345678901234567890'#39' AS BAIRRO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS CIDADE,'
      '   '#39'12'#39' AS UF,'
      '   '#39'12345678'#39' AS CEP,'
      ''
      ''
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS SITPA' +
        'RT,'
      ''
      '   '#39'12345678901'#39' AS CPF,'
      ''
      '   HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.IDITEMEMPTMO,'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEDATAPREVISTA, HME.HMEVLRPREVISTO,'
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMESEQCOBRANCA, HME.HMESALDODEV, HME.HMETXJUROS'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '   1 = 2')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 192
    Top = 148
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
    object qryHistMovVirtualMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 15
    end
    object qryHistMovVirtualNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qryHistMovVirtualLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      FixedChar = True
      Size = 60
    end
    object qryHistMovVirtualNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 8
    end
    object qryHistMovVirtualCOMPL: TStringField
      FieldName = 'COMPL'
      FixedChar = True
    end
    object qryHistMovVirtualSITUACAO_CONTRATO: TStringField
      FieldName = 'SITUACAO_CONTRATO'
      FixedChar = True
    end
    object qryHistMovVirtualBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
    end
    object qryHistMovVirtualCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 60
    end
    object qryHistMovVirtualCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object qryHistMovVirtualSITPART: TStringField
      FieldName = 'SITPART'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 11
    end
    object qryHistMovVirtualUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
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
    Left = 192
    Top = 164
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
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
      
        '  CON.MOECODIGO        , CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUS' +
        'P, CON.DATAFIMSUSP,'
      '  CON.ANOSUSPENSAO     , CON.MESSUSPENSAO    ,'
      '  TSE.TSEDESCRICAO,'
      ''
      '  MOE.MOESIGLA,'
      ''
      '  TO_DATE('#39'01/01/1980'#39', '#39'dd/mm/yyyy'#39') AS DATAINSC,'
      ''
      
        '  EDP.LOGRADOURO, EDP.NUMERO, EDP.COMPLEMENTO, EDP.BAIRRO, EDP.C' +
        'EP,'
      '  CID.NOME AS CIDADE, CID.UF,'
      ''
      '  MUT.NUMDOCUMENTO'
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
      '   ENDPESS         EDP,'
      '   CIDADES         CID,'
      '   MOEDA           MOE'
      ''
      'WHERE'
      '       CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      ''
      '   AND CON.IDPATRO           = PPP.IDPESSJUR'
      '   AND CON.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND PPP.FLGDESATIVADO     = 0'
      '   AND CON.IDPESSOA          = ELP.IDPESSOA'
      '   AND CON.IDPATRO           = ELP.IDPESSJUR'
      '   AND CON.IDBENEF           = MUT.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND MUT.IDPESSOA          = EDP.IDPESSOA(+)'
      '   AND MUT.IDENDRESIDENCIAL  = EDP.IDENDERECO(+)'
      '   AND EDP.IDCIDADES         = CID.IDCIDADES(+)'
      '   AND CON.MOECODIGO         = MOE.MOECODIGO(+)')
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
    object qryMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
  end
  object dlgCaminho: TProcuraDirDlg
    Caption = 'Seleção de Caminho'
    Directory = 
      '  '#39'Houve ERRO na Quitação ou Envio para a Folha!'#39' + #13 +'#13#10'     ' +
      '                 '#39'O processo será interrompido.'#39', '#39'Empréstimo'#39', ' +
      'mtError, [mbOk], 0);'#13#10'               Repaint;'#13#10'               Ex' +
      'it;'#13#10'            end'#13#10'            else'#13#10'            begin'#13#10'     ' +
      '    '
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 489
    Top = 298
  end
end
