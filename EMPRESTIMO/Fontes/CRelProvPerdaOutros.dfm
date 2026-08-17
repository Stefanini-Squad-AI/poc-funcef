inherited cfgRelProvPerdaOutros: TcfgRelProvPerdaOutros
  Left = 200
  Top = 173
  Caption = 'Provisão para Perdas (sintético) - por Plano e Patrocinadora'
  ClientHeight = 443
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 410
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
      DropDownWidth = 8
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
    object Panel1: TPanel
      Left = 320
      Top = 208
      Width = 289
      Height = 49
      TabOrder = 5
      object Label3: TLabel
        Left = 40
        Top = 20
        Width = 110
        Height = 13
        Caption = 'Data Referência:   '
      end
      object edtDataRef: TwwDBDateTimePicker
        Left = 144
        Top = 16
        Width = 105
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
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      TabStop = True
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
    object rdgOrdenar: TRadioGroup
      Left = 16
      Top = 328
      Width = 225
      Height = 65
      Caption = ' Ordenar por: '
      ItemIndex = 1
      Items.Strings = (
        'Nº do Contrato'
        'Nome do(a) Mutuário(a)'
        'Matrícula')
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 328
      Width = 353
      Height = 65
      TabOrder = 7
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Width = 297
      Height = 169
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
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 113
      TabOrder = 4
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
    end
    object chkMesAnterior: TCheckBox
      Left = 328
      Top = 288
      Width = 281
      Height = 17
      Caption = 'Calcular valores para mês anterior (mais lento)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object rdgBaseCalculo: TRadioGroup
      Left = 16
      Top = 264
      Width = 289
      Height = 57
      Caption = ' Base para cálculo da Provisão: '
      ItemIndex = 0
      Items.Strings = (
        'Vencido + Vincendo'
        'Apenas Vencido')
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
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
      '   PLANPREVXCONTABIL PXC,'
      '   PLANPREVCONTABIL  PPC,'
      '   CONTRATOEMPTMO    CON'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.IDPATRO               =:PIDPATRO'
      '   AND PXC.IDPLANOPREV           =:IDPLANOPREV'
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
      '   AND PPP.FLGDESATIVADO         = 0'
      '   AND TCE.IDTIPOCONTREMPTMO     =:PIDTIPOCONTREMPTMO'
      ''
      
        '   AND (:PIDTIPOCONTRFILTRO      IS NULL OR TCE.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTRFILTRO)'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR CON.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO)'
      ''
      '   AND'
      '   ('
      '   EXISTS ('
      '          SELECT 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      
        '                 (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACA' +
        'DO = 1)'
      '             AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7)'
      '             AND HME.HMEDATAPREVISTA      <=:PHMEDATA'
      ''
      '             AND ('
      '                 (HME.HMEDATAEFETIVA       >:PHMEDATA) OR'
      
        '                 (:PANTERIOR               IS NOT NULL AND HME.H' +
        'MEDATAEFETIVA >:PHMEDATAANT)'
      '                 )'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      '          )'
      '   OR'
      '   EXISTS ('
      '          SELECT 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      
        '                 (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACA' +
        'DO = 1)'
      '             AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 6, 7)'
      '             AND HME.HMEDATAPREVISTA      <=:PHMEDATA'
      '             AND ('
      '                 HME.HMEDATAEFETIVA IS NULL OR'
      '                 HME.HMEVLREFETIVO IS NULL OR'
      '                 HME.FLGBAIXADO            = 0'
      '                 )'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      '          )'
      '   )'
      ''
      '   AND CON.IDPLANOORIGEM         = PXC.IDPLANPREVC'
      '   AND PXC.IDPLANOPREV           = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      #9'AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 48
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
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
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
  end
  object qryVlrDevido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      '   AND HME.HMESEQCOBRANCA        = 1'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEDATAPREVISTA     <=:PHMEDATAPREVISTA'
      ''
      
        '   AND (:PQUITACAO               IS NULL OR (:PQUITACAO IS NOT N' +
        'ULL     AND HME.HMETIPOMOV  = 3))'
      
        '   AND (:PNAOQUITACAO            IS NULL OR (:PNAOQUITACAO IS NO' +
        'T NULL  AND HME.HMETIPOMOV <> 3))'
      ''
      '--   AND ('
      '--       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '--       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO,' +
        ' 0) = 1)'
      '--       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 160
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end>
    object qryVlrDevidoVLR_DEV: TFloatField
      FieldName = 'VLR_DEV'
    end
  end
  object qryVlrPago: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                             DECODE(FLGABONADO, 1, NVL(HME.HMEVL' +
        'RPREVISTO, 0),'
      
        '                                                   NVL(HME.HMEVL' +
        'REFETIVO, 0)))) AS VLR_PAG'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND HME.HMEDATAPREVISTA     <=:PHMEDATAPREVISTA'
      ''
      '   AND ('
      '       (HME.HMEDATAEFETIVA    <=:PHMEDATAPREVISTA)'
      
        '    OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <=:PHMED' +
        'ATAPREVISTA) )'
      
        '    OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <=:PHMED' +
        'ATAPREVISTA) )'
      '       )'
      ''
      
        '   AND (:PQUITACAO               IS NULL OR (:PQUITACAO IS NOT N' +
        'ULL     AND HME.HMETIPOMOV  = 3))'
      
        '   AND (:PNAOQUITACAO            IS NULL OR (:PNAOQUITACAO IS NO' +
        'T NULL  AND HME.HMETIPOMOV <> 3))'
      ''
      '--   AND ('
      '--       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '--       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO,' +
        ' 0) = 1)'
      '--       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 160
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end>
    object qryVlrPagoVLR_PAG: TFloatField
      FieldName = 'VLR_PAG'
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
    Left = 48
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
  object qryQuantParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(DISTINCT(HME.HMEPARCELA)) AS QUANT_PARCELAS'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA'
      ''
      '   AND ('
      '       (HME.HMEDATAEFETIVA       >:PHMEDATAPREVISTA) OR'
      '       ('
      '       (HME.HMEDATAEFETIVA       IS NULL) AND'
      '       (NVL(HME.FLGQUITADO, 0)   = 0) AND'
      '       (NVL(HME.FLGABONADO, 0)   = 0)'
      '       ) OR'
      
        '       ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO >:PHMEDA' +
        'TAPREVISTA) ) OR'
      
        '       ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO >:PHMEDA' +
        'TAPREVISTA) )'
      '       )'
      ''
      
        '   AND (:PQUITACAO               IS NULL OR (:PQUITACAO IS NOT N' +
        'ULL     AND HME.HMETIPOMOV  = 3))'
      
        '   AND (:PNAOQUITACAO            IS NULL OR (:PNAOQUITACAO IS NO' +
        'T NULL  AND HME.HMETIPOMOV <> 3))'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 160
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end>
    object qryQuantParcelasQUANT_PARCELAS: TFloatField
      FieldName = 'QUANT_PARCELAS'
    end
  end
  object qryPrimeiraInadimplencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MIN(HME.HMEDATAPREVISTA) AS HMEDATAPREVISTA'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND HME.HMEDATAPREVISTA       IS NOT NULL'
      ''
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA'
      ''
      '   AND ('
      
        '       (HME.HMEDATAEFETIVA       IS NULL AND NVL(HME.FLGQUITADO,' +
        '0) = 0 AND NVL(HME.FLGABONADO,0) = 0)'
      '    OR ('
      '       (HME.HMEDATAEFETIVA       >:PHMEDATAPREVISTA)'
      
        '    OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO >:PHMEDA' +
        'TAPREVISTA) )'
      
        '    OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO >:PHMEDA' +
        'TAPREVISTA) )'
      '       )'
      '       )'
      ''
      
        '   AND (:PQUITACAO               IS NULL OR (:PQUITACAO IS NOT N' +
        'ULL     AND HME.HMETIPOMOV  = 3))'
      
        '   AND (:PNAOQUITACAO            IS NULL OR (:PNAOQUITACAO IS NO' +
        'T NULL  AND HME.HMETIPOMOV <> 3))'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)'
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOQUITACAO'
        ParamType = ptInput
      end>
    object qryPrimeiraInadimplenciaHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
  end
  object pplProvPerdaAnal: TppBDEPipeline
    DataSource = dsAnal
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplProvPerdaAnal'
    Left = 456
    Top = 136
    object pplProvPerdaAnalppField1: TppField
      FieldAlias = 'FAIXA'
      FieldName = 'FAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField2: TppField
      FieldAlias = 'PERCENT_FAIXA'
      FieldName = 'PERCENT_FAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField3: TppField
      FieldAlias = 'FAIXA_EXTENSO'
      FieldName = 'FAIXA_EXTENSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField4: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField5: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField6: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField7: TppField
      FieldAlias = 'PLANOPATRO'
      FieldName = 'PLANOPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField8: TppField
      FieldAlias = 'NOME_TITULAR'
      FieldName = 'NOME_TITULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField9: TppField
      FieldAlias = 'NOME_BENEF'
      FieldName = 'NOME_BENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField10: TppField
      FieldAlias = 'SIT_PART'
      FieldName = 'SIT_PART'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField11: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField12: TppField
      FieldAlias = 'MATRICULA_TIT'
      FieldName = 'MATRICULA_TIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField13: TppField
      FieldAlias = 'TXJUROS'
      FieldName = 'TXJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField14: TppField
      FieldAlias = 'VLRCONTRATO'
      FieldName = 'VLRCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField15: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField16: TppField
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField17: TppField
      FieldAlias = 'QUANT_PARCELAS'
      FieldName = 'QUANT_PARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField18: TppField
      FieldAlias = 'PRIMEIRA_DATA'
      FieldName = 'PRIMEIRA_DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField19: TppField
      FieldAlias = 'HMEDATAATUALIZA'
      FieldName = 'HMEDATAATUALIZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField20: TppField
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField21: TppField
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField22: TppField
      FieldAlias = 'HMENUMPARCELAS'
      FieldName = 'HMENUMPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField23: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField24: TppField
      FieldAlias = 'DEVE'
      FieldName = 'DEVE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField25: TppField
      FieldAlias = 'TOTAL_DEV'
      FieldName = 'TOTAL_DEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField26: TppField
      FieldAlias = 'PROV_ANT'
      FieldName = 'PROV_ANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField27: TppField
      FieldAlias = 'PROV_ATU'
      FieldName = 'PROV_ATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField28: TppField
      FieldAlias = 'PROV_DIF'
      FieldName = 'PROV_DIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaAnalppField29: TppField
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
  end
  object rptProvPerdaAnal: TppReport
    AutoStop = False
    DataPipeline = pplProvPerdaAnal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 
      'Empréstimo - Provisão para Perdas (analítico) - por Plano e Patr' +
      'ocinadora'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 136
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplProvPerdaAnal'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 43921
      mmPrintPosition = 0
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = rptProvPerdaAnal_memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39423
        mmWidth = 270669
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Provisão para Perdas (analítico) - por Plano e Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 36777
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object rptProvPerdaAnal_lblEmpresa: TppLabel
        UserName = 'rptProvPerdaAnal_lblEmpresa'
        AutoSize = False
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 36777
        mmTop = 794
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Data de Referência:    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 20638
        mmWidth = 29633
        BandType = 0
      end
      object rptProvPerdaAnal_lblDataRef: TppLabel
        UserName = 'rptProvPerdaAnal_lblDataRef'
        Caption = '31/01/2008'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30692
        mmTop = 20638
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 32015
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label203'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 32015
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = rptProvPerdaAnal_memPatro
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39423
        mmWidth = 270669
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptProvPerdaAnal_memPatro: TppRichText
        UserName = 'rptProvPerdaAnal_memPatro'
        Caption = 'rptProvPerdaAnal_memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 32015
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object rptProvPerdaAnal_memPlano: TppRichText
        UserName = 'rptProvPerdaAnal_memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 165629
        mmTop = 32015
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 27517
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 27517
        mmWidth = 21960
        BandType = 0
      end
      object rptProvPerdaAnal_lblTipoEmptmo: TppLabel
        UserName = 'rptProvPerdaAnal_lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 27517
        mmWidth = 102659
        BandType = 0
      end
      object rptProvPerdaAnal_lblTipoContr: TppLabel
        UserName = 'rptProvPerdaAnal_lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165629
        mmTop = 27517
        mmWidth = 105040
        BandType = 0
      end
      object rptProvPerdaAnal_lblBaseProvisao: TppLabel
        UserName = 'rptProvPerdaAnal_lblBaseProvisao'
        Caption = 'Provisão calculada sobre valor vencido + vincendo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 201613
        mmTop = 20638
        mmWidth = 69056
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplProvPerdaAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME_BENEF'
        DataPipeline = pplProvPerdaAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 794
        mmWidth = 52123
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MATRICULA'
        DataPipeline = pplProvPerdaAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMESALDODEV'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DEVE'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 149754
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOTAL_DEV'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 191030
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 110067
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'NUMPARCELAS'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DATACREDITO'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'PRIMEIRA_DATA'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object rptProvPerdaAnal_DBtxtPROV_ANT: TppDBText
        OnPrint = rptProvPerdaAnal_DBtxtPROV_ANTPrint
        UserName = 'rptProvPerdaAnal_DBtxtPROV_ANT'
        DataField = 'PROV_ANT'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 211138
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'PROV_ATU'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 231246
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText25: TppDBText
        OnPrint = ppDBText25Print
        UserName = 'DBText25'
        DataField = 'PROV_DIF'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 250296
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DIAS'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 794
        mmWidth = 6615
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 2117
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 244475
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 25400
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 1588
        mmTop = 3175
        mmWidth = 33602
        BandType = 7
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Pen.Width = 2
        mmHeight = 5556
        mmLeft = 128323
        mmTop = 3175
        mmWidth = 141023
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'HMESALDODEV'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 129646
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'DEVE'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 4233
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Contratos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 19050
        mmTop = 4233
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        DataField = 'TOTAL_DEV'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 187855
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        OnPrint = ppDBCalc31Print
        UserName = 'DBCalc202'
        DataField = 'PROV_ANT'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 207963
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc33'
        DataField = 'PROV_ATU'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 228071
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        OnPrint = ppDBCalc34Print
        UserName = 'DBCalc34'
        DataField = 'PROV_DIF'
        DataPipeline = pplProvPerdaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaAnal'
        mmHeight = 2910
        mmLeft = 248180
        mmTop = 4233
        mmWidth = 19315
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Total Geral: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 35719
        mmTop = 3969
        mmWidth = 90752
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = pplProvPerdaAnal
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaAnal'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'NOMEPLANO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5821
          mmLeft = 1588
          mmTop = 3175
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5556
          mmLeft = 128323
          mmTop = 3175
          mmWidth = 141023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'HMESALDODEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 129646
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'DEVE'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 149754
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Contratos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 4233
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'TOTAL_DEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 187855
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          OnPrint = ppDBCalc20Print
          UserName = 'DBCalc20'
          DataField = 'PROV_ANT'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 207963
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc29'
          DataField = 'PROV_ATU'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 228071
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc32: TppDBCalc
          OnPrint = ppDBCalc32Print
          UserName = 'DBCalc32'
          DataField = 'PROV_DIF'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'NOMEPLANO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 38365
          mmTop = 4233
          mmWidth = 88106
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = pplProvPerdaAnal
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaAnal'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'PLANOPATRO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 529
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PLANOPATRO'
      DataPipeline = pplProvPerdaAnal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaAnal'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'DBText102'
          AutoSize = True
          DataField = 'PLANOPATRO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 529
          mmTop = 529
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 20108
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5821
          mmLeft = 1588
          mmTop = 3175
          mmWidth = 33602
          BandType = 5
          GroupNo = 2
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5556
          mmLeft = 128323
          mmTop = 3175
          mmWidth = 141023
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMESALDODEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 129646
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'DEVE'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 149754
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTAL_DEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 187855
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object rptProvPerdaAnal_DBcalcPROV_ANT2: TppDBCalc
          OnPrint = rptProvPerdaAnal_DBcalcPROV_ANT2Print
          UserName = 'DBCalc201'
          DataField = 'PROV_ANT'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 207963
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'PROV_ATU'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 228071
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc11: TppDBCalc
          OnPrint = ppDBCalc11Print
          UserName = 'DBCalc11'
          DataField = 'PROV_DIF'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Contratos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 4233
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'NOMEPLANO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 38365
          mmTop = 2117
          mmWidth = 88106
          BandType = 5
          GroupNo = 2
        end
        object ppDBText26: TppDBText
          UserName = 'DBText103'
          DataField = 'NOMEPATRO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 38365
          mmTop = 5821
          mmWidth = 88106
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PERCENT_FAIXA'
      DataPipeline = pplProvPerdaAnal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaAnal'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 10583
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
        object ppDBText11: TppDBText
          UserName = 'DBText101'
          AutoSize = True
          DataField = 'FAIXA_EXTENSO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 1588
          mmTop = 529
          mmWidth = 23283
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Nº Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 3175
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 18521
          mmTop = 7144
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Mutuário(a)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 34396
          mmTop = 7144
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 139171
          mmTop = 7144
          mmWidth = 9790
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 142346
          mmTop = 3969
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Itens em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 157163
          mmTop = 3969
          mmWidth = 9790
          BandType = 3
          GroupNo = 2
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 159015
          mmTop = 7144
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 192617
          mmTop = 7144
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 110861
          mmTop = 7144
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 116681
          mmTop = 3969
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          Caption = 'Prazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 125413
          mmTop = 7144
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 98161
          mmTop = 7144
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label202'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 100013
          mmTop = 3969
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'Desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 171450
          mmTop = 7144
          mmWidth = 7408
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 201084
          mmTop = 3969
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object rptProvPerdaAnal_lblProvisaoAnt2: TppLabel
          OnPrint = rptProvPerdaAnal_lblProvisaoAnt2Print
          UserName = 'rptProvPerdaAnal_lblProvisaoAnt2'
          Caption = 'Mês Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 212461
          mmTop = 7144
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          OnPrint = ppLabel30Print
          UserName = 'Label30'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 256382
          mmTop = 7144
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Provisionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 233892
          mmTop = 7144
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object rptProvPerdaAnal_lblProvisaoAnt1: TppLabel
          OnPrint = rptProvPerdaAnal_lblProvisaoAnt1Print
          UserName = 'rptProvPerdaAnal_lblProvisaoAnt1'
          Caption = 'Provisão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 216959
          mmTop = 3969
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel48: TppLabel
          UserName = 'Label48'
          Caption = 'Valor a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239184
          mmTop = 3969
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
        object ppLabel2: TppLabel
          UserName = 'Label4'
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 183886
          mmTop = 7144
          mmWidth = 5292
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 20373
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 20373
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppShape10: TppShape
          UserName = 'Shape10'
          mmHeight = 5556
          mmLeft = 128323
          mmTop = 3175
          mmWidth = 141023
          BandType = 5
          GroupNo = 2
        end
        object ppShape9: TppShape
          UserName = 'Shape9'
          mmHeight = 5821
          mmLeft = 1588
          mmTop = 3175
          mmWidth = 33602
          BandType = 5
          GroupNo = 2
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Contratos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 4233
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 14288
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'HMESALDODEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 129646
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'DEVE'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 149754
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'TOTAL_DEV'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 187855
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object rptProvPerdaAnal_DBcalcPROV_ANT1: TppDBCalc
          OnPrint = rptProvPerdaAnal_DBcalcPROV_ANT1Print
          UserName = 'rptProvPerdaAnal_DBcalcPROV_ANT1'
          DataField = 'PROV_ANT'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 207963
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'PROV_ATU'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 228071
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc30: TppDBCalc
          OnPrint = ppDBCalc30Print
          UserName = 'DBCalc30'
          DataField = 'PROV_DIF'
          DataPipeline = pplProvPerdaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 2
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'FAIXA_EXTENSO'
          DataPipeline = pplProvPerdaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaAnal'
          mmHeight = 3440
          mmLeft = 38365
          mmTop = 4233
          mmWidth = 88106
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object rptProvPerdaSint: TppReport
    AutoStop = False
    DataPipeline = pplProvPerdaSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 
      'Empréstimo - Provisão para Perdas (sintético) - por Plano e Patr' +
      'ocinadora'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 360
    Top = 120
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplProvPerdaSint'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 44186
      mmPrintPosition = 0
      object ppMemo4: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = rptProvPerdaSint_memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39688
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Provisão para Perdas (sintético) - por Plano e Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
        BandType = 0
      end
      object rptProvPerdaSint_lblEmpresa: TppLabel
        UserName = 'rptProvPerdaSint_lblEmpresa'
        AutoSize = False
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 794
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Data de Referência:    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 20638
        mmWidth = 29633
        BandType = 0
      end
      object rptProvPerdaSint_lblDataRef: TppLabel
        UserName = 'rptDividas_lblDataRef'
        Caption = '31/01/2008'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30692
        mmTop = 20638
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 32279
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label203'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 105304
        mmTop = 32279
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo3: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = rptProvPerdaSint_memPatro
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39688
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptProvPerdaSint_memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 32279
        mmWidth = 65881
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object rptProvPerdaSint_memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 117740
        mmTop = 32279
        mmWidth = 65881
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 27517
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 94986
        mmTop = 27517
        mmWidth = 23019
        BandType = 0
      end
      object rptProvPerdaSint_lblTipoEmptmo: TppLabel
        UserName = 'rptProvPerdaSint_lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 27517
        mmWidth = 63500
        BandType = 0
      end
      object rptProvPerdaSint_lblTipoContr: TppLabel
        UserName = 'rptProvPerdaSint_lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 117740
        mmTop = 27517
        mmWidth = 65881
        BandType = 0
      end
      object rptProvPerdaSint_lblBaseProvisao: TppLabel
        UserName = 'rptProvPerdaSint_lblBaseProvisao'
        Caption = 'Provisão calculada sobre valor vencido + vincendo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 114565
        mmTop = 20638
        mmWidth = 69056
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape11: TppShape
        OnPrint = ppShape11Print
        UserName = 'Shape11'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppLine9: TppLine
        OnPrint = ppLine9Print
        UserName = 'Line9'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText5'
        DataField = 'HMESALDODEV'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 64558
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText23: TppDBText
        OnPrint = ppDBText23Print
        UserName = 'DBText6'
        DataField = 'PROV_DIF'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DEVE'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 84667
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TOTAL_DEV'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText20: TppDBText
        OnPrint = ppDBText20Print
        UserName = 'DBText20'
        DataField = 'PROV_ANT'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'PROV_ATU'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'FAIXA_EXTENSO'
        DataPipeline = pplProvPerdaSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 183542
        BandType = 8
      end
      object ppLabel39: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 2117
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 156634
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'Line11'
        Pen.Width = 2
        ParentHeight = True
        ParentWidth = True
        Weight = 1.5
        mmHeight = 19844
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 7
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 62971
        mmTop = 2910
        mmWidth = 120650
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'HMESALDODEV'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 64558
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc36'
        DataField = 'DEVE'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 84667
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc37: TppDBCalc
        UserName = 'DBCalc37'
        DataField = 'TOTAL_DEV'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 104775
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc38: TppDBCalc
        OnPrint = ppDBCalc38Print
        UserName = 'DBCalc38'
        DataField = 'PROV_CALC'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 124884
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc39: TppDBCalc
        UserName = 'DBCalc39'
        DataField = 'PROV_LANC'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 144992
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        OnPrint = ppDBCalc40Print
        UserName = 'DBCalc40'
        DataField = 'PROV_DIF'
        DataPipeline = pplProvPerdaSint
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplProvPerdaSint'
        mmHeight = 2910
        mmLeft = 165100
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 44715
        mmTop = 3704
        mmWidth = 18256
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = pplProvPerdaSint
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaSint'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = pplProvPerdaSint
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaSint'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PLANOPATRO'
      DataPipeline = pplProvPerdaSint
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaSint'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape18: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 2
        end
        object ppDBText31: TppDBText
          UserName = 'DBText9'
          DataField = 'PLANOPATRO'
          DataPipeline = pplProvPerdaSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 181505
          BandType = 3
          GroupNo = 2
        end
        object ppLabel50: TppLabel
          UserName = 'Label7'
          Caption = 'Vincendo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 70908
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel51: TppLabel
          UserName = 'Label3'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 75671
          mmTop = 7938
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel52: TppLabel
          UserName = 'Label8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 95779
          mmTop = 7938
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel53: TppLabel
          UserName = 'Label12'
          Caption = 'Vencido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 92340
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel54: TppLabel
          UserName = 'Label14'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 109273
          mmTop = 7673
          mmWidth = 12700
          BandType = 3
          GroupNo = 2
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = 'Faixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 10319
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object ppLabel41: TppLabel
          OnPrint = ppLabel41Print
          UserName = 'Label41'
          Caption = 'Mês Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 127265
          mmTop = 11113
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object ppLabel44: TppLabel
          OnPrint = ppLabel44Print
          UserName = 'Label44'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 171186
          mmTop = 11113
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel45: TppLabel
          OnPrint = ppLabel45Print
          UserName = 'Label45'
          Caption = 'Provisão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 131763
          mmTop = 7938
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel42: TppLabel
          UserName = 'Label42'
          Caption = 'Valor a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 153988
          mmTop = 7938
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'Provisionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 148696
          mmTop = 11113
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          Caption = 'Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 113771
          mmTop = 11113
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLine10: TppLine
          UserName = 'Line10'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 11642
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 5
          GroupNo = 2
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 11642
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 5
          GroupNo = 2
        end
        object ppShape12: TppShape
          UserName = 'Shape101'
          mmHeight = 5292
          mmLeft = 62971
          mmTop = 1588
          mmWidth = 120650
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'HMESALDODEV'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 64558
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'DEVE'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 84667
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'TOTAL_DEV'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 104775
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc24: TppDBCalc
          OnPrint = ppDBCalc24Print
          UserName = 'DBCalc24'
          DataField = 'PROV_ANT'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 124884
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'PROV_ATU'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 144992
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc26: TppDBCalc
          OnPrint = ppDBCalc26Print
          UserName = 'DBCalc26'
          DataField = 'PROV_DIF'
          DataPipeline = pplProvPerdaSint
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplProvPerdaSint'
          mmHeight = 2910
          mmLeft = 165100
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'FAIXA'
      DataPipeline = pplProvPerdaSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplProvPerdaSint'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplProvPerdaSint: TppBDEPipeline
    DataSource = dsSint
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lProvPerdaSint'
    Left = 456
    Top = 120
    object pplProvPerdaSintppField1: TppField
      FieldAlias = 'FAIXA'
      FieldName = 'FAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField2: TppField
      FieldAlias = 'PERCENT_FAIXA'
      FieldName = 'PERCENT_FAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField3: TppField
      FieldAlias = 'FAIXA_EXTENSO'
      FieldName = 'FAIXA_EXTENSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField4: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField5: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField6: TppField
      FieldAlias = 'PLANOPATRO'
      FieldName = 'PLANOPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField7: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField8: TppField
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField9: TppField
      FieldAlias = 'DEVE'
      FieldName = 'DEVE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField10: TppField
      FieldAlias = 'TOTAL_DEV'
      FieldName = 'TOTAL_DEV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField11: TppField
      FieldAlias = 'PROV_ANT'
      FieldName = 'PROV_ANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField12: TppField
      FieldAlias = 'PROV_ATU'
      FieldName = 'PROV_ATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplProvPerdaSintppField13: TppField
      FieldAlias = 'PROV_DIF'
      FieldName = 'PROV_DIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object cdsProvPerdaSint: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 208
    object cdsProvPerdaSintFAIXA: TStringField
      FieldName = 'FAIXA'
      FixedChar = True
      Size = 30
    end
    object cdsProvPerdaSintPERCENT_FAIXA: TFloatField
      FieldName = 'PERCENT_FAIXA'
    end
    object cdsProvPerdaSintFAIXA_EXTENSO: TStringField
      FieldName = 'FAIXA_EXTENSO'
      FixedChar = True
      Size = 38
    end
    object cdsProvPerdaSintNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaSintNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaSintPLANOPATRO: TStringField
      FieldName = 'PLANOPATRO'
      FixedChar = True
      Size = 120
    end
    object cdsProvPerdaSintTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaSintHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object cdsProvPerdaSintDEVE: TFloatField
      FieldName = 'DEVE'
    end
    object cdsProvPerdaSintTOTAL_DEV: TFloatField
      FieldName = 'TOTAL_DEV'
    end
    object cdsProvPerdaSintPROV_ANT: TFloatField
      FieldName = 'PROV_ANT'
    end
    object cdsProvPerdaSintPROV_ATU: TFloatField
      FieldName = 'PROV_ATU'
    end
    object cdsProvPerdaSintPROV_DIF: TFloatField
      FieldName = 'PROV_DIF'
    end
  end
  object cdsProvPerdaAnal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 192
    object cdsProvPerdaAnalFAIXA: TStringField
      FieldName = 'FAIXA'
      FixedChar = True
      Size = 30
    end
    object cdsProvPerdaAnalPERCENT_FAIXA: TFloatField
      FieldName = 'PERCENT_FAIXA'
    end
    object cdsProvPerdaAnalFAIXA_EXTENSO: TStringField
      FieldName = 'FAIXA_EXTENSO'
      FixedChar = True
      Size = 38
    end
    object cdsProvPerdaAnalIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object cdsProvPerdaAnalNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaAnalNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaAnalPLANOPATRO: TStringField
      FieldName = 'PLANOPATRO'
      FixedChar = True
      Size = 120
    end
    object cdsProvPerdaAnalNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      FixedChar = True
      Size = 39
    end
    object cdsProvPerdaAnalNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      FixedChar = True
      Size = 39
    end
    object cdsProvPerdaAnalSIT_PART: TStringField
      FieldName = 'SIT_PART'
      FixedChar = True
      Size = 38
    end
    object cdsProvPerdaAnalMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 9
    end
    object cdsProvPerdaAnalMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      FixedChar = True
      Size = 9
    end
    object cdsProvPerdaAnalTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object cdsProvPerdaAnalVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object cdsProvPerdaAnalDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object cdsProvPerdaAnalNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object cdsProvPerdaAnalQUANT_PARCELAS: TFloatField
      FieldName = 'QUANT_PARCELAS'
    end
    object cdsProvPerdaAnalPRIMEIRA_DATA: TDateTimeField
      FieldName = 'PRIMEIRA_DATA'
    end
    object cdsProvPerdaAnalHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object cdsProvPerdaAnalHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object cdsProvPerdaAnalHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object cdsProvPerdaAnalHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object cdsProvPerdaAnalTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object cdsProvPerdaAnalDEVE: TFloatField
      FieldName = 'DEVE'
    end
    object cdsProvPerdaAnalTOTAL_DEV: TFloatField
      FieldName = 'TOTAL_DEV'
    end
    object cdsProvPerdaAnalPROV_ANT: TFloatField
      FieldName = 'PROV_ANT'
    end
    object cdsProvPerdaAnalPROV_ATU: TFloatField
      FieldName = 'PROV_ATU'
    end
    object cdsProvPerdaAnalPROV_DIF: TFloatField
      FieldName = 'PROV_DIF'
    end
    object cdsProvPerdaAnalDIAS: TFloatField
      FieldName = 'DIAS'
    end
  end
  object sqlProvPerdaSint: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456789012345678901234567890'#39'                             ' +
        '  AS FAIXA,'
      
        '   100                                                          ' +
        '  AS PERCENT_FAIXA,'
      
        '   '#39'123456789012345678901234567890 - 100 %'#39'                     ' +
        '  AS FAIXA_EXTENSO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPATRO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        '123456789012345678901234567890123456789012345678901234567890'#39' AS' +
        ' PLANOPATRO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '   9999999999.99 AS HMESALDODEV,'
      '   9999999999.99 AS DEVE,'
      '   9999999999.99 AS TOTAL_DEV,'
      ''
      '   9999999999.99 AS PROV_ANT,'
      '   9999999999.99 AS PROV_ATU,'
      '   9999999999.99 AS PROV_DIF'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    ClientDataSet = cdsProvPerdaSint
    Left = 248
    Top = 208
  end
  object sqlProvPerdaAnal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456789012345678901234567890'#39'                             ' +
        '  AS FAIXA,'
      
        '   100                                                          ' +
        '  AS PERCENT_FAIXA,'
      
        '   '#39'123456789012345678901234567890 - 100 %'#39'                     ' +
        '  AS FAIXA_EXTENSO,'
      ''
      
        '   300000054321                                                 ' +
        '  AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOMEPATRO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        '123456789012345678901234567890123456789012345678901234567890'#39' AS' +
        ' PLANOPATRO,'
      ''
      
        '   '#39'MADALENA DAS NEVES FERREIRA DE SIQUEIRA'#39'                    ' +
        '  AS NOME_TITULAR,'
      
        '   '#39'HELENILDA CRISTINA FERREIRA DE SIQUEIRA'#39'                    ' +
        '  AS NOME_BENEF,'
      
        '   '#39'CANCELADO POR RESGATE DE CONTRIBUIÇÔES'#39'                     ' +
        '  AS SIT_PART,'
      
        '   '#39'9999999-9'#39'                                                  ' +
        '  AS MATRICULA,'
      
        '   '#39'9999999-9'#39'                                                  ' +
        '  AS MATRICULA_TIT,'
      ''
      
        '   10.71                                                        ' +
        '  AS TXJUROS,'
      
        '   99999.99                                                     ' +
        '  AS VLRCONTRATO,'
      
        '   TO_DATE('#39'31/12/2002'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '  AS DATACREDITO,'
      
        '   0                                                            ' +
        '  AS NUMPARCELAS,'
      ''
      
        '   0                                                            ' +
        '  AS DIAS,'
      ''
      
        '   0                                                            ' +
        '  AS QUANT_PARCELAS,'
      
        '   TO_DATE('#39'31/12/2002'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '  AS PRIMEIRA_DATA,'
      ''
      
        '   TO_DATE('#39'31/12/2002'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '  AS HMEDATAATUALIZA,'
      ''
      
        '   999999999.99                                                 ' +
        '  AS HMESALDODEV,'
      
        '   0                                                            ' +
        '  AS HMEPARCELA,'
      
        '   0                                                            ' +
        '  AS HMENUMPARCELAS,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      
        '   999999999.99                                                 ' +
        '  AS DEVE,'
      
        '   999999999.99                                                 ' +
        '  AS TOTAL_DEV,'
      ''
      
        '   9999999999.99                                                ' +
        '  AS PROV_ANT,'
      
        '   9999999999.99                                                ' +
        '  AS PROV_ATU,'
      
        '   9999999999.99                                                ' +
        '  AS PROV_DIF'
      ''
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    ClientDataSet = cdsProvPerdaAnal
    Left = 248
    Top = 192
  end
  object dsSint: TwwDataSource
    DataSet = cdsProvPerdaSint
    Left = 264
    Top = 136
  end
  object dsAnal: TwwDataSource
    DataSet = cdsProvPerdaAnal
    Left = 264
    Top = 120
  end
  object qryProvisaoLancada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(DECODE(HME.IDITEMEMPTMO, 56, NVL(HME.HMEVLRPREVISTO, 0), ' +
        '0)) AS PROVISAO,'
      
        '   SUM(DECODE(HME.IDITEMEMPTMO, 71, NVL(HME.HMEVLRPREVISTO, 0), ' +
        '0)) AS ESTORNO'
      'FROM'
      '   HISTMOVEMPTMO  HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            IN (3, 5)'
      '   AND HME.IDITEMEMPTMO          IN (56, 71)'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND HME.HMEDATAPREVISTA       IS NOT NULL'
      ''
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA')
    ValidateWithMask = True
    Left = 160
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryProvisaoLancadaPROVISAO: TFloatField
      FieldName = 'PROVISAO'
    end
    object qryProvisaoLancadaESTORNO: TFloatField
      FieldName = 'ESTORNO'
    end
  end
end
