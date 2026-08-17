inherited cfgRelDividasTipoContrato: TcfgRelDividasTipoContrato
  Left = 113
  Top = 112
  Caption = 'Valores Devidos por Tipo de Contrato'
  ClientHeight = 386
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 353
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
    object Label4: TLabel
      Left = 16
      Top = 223
      Width = 109
      Height = 13
      Caption = 'Situação do Titular'
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
      DropDownWidth = 8
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
    object Panel1: TPanel
      Left = 320
      Top = 168
      Width = 289
      Height = 49
      TabOrder = 3
      object Label3: TLabel
        Left = 24
        Top = 20
        Width = 128
        Height = 13
        Caption = 'Data de Referência:   '
      end
      object edtDataRef: TwwDBDateTimePicker
        Left = 152
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
    object chkParcelasAberto: TCheckBox
      Left = 328
      Top = 228
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos com Itens em aberto'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object rdgOrdenar: TRadioGroup
      Left = 224
      Top = 344
      Width = 217
      Height = 65
      Caption = ' Ordenar por: '
      Color = clGray
      ItemIndex = 0
      Items.Strings = (
        'Nº do Contrato'
        'Nome do(a) Beneficiário(a)'
        'Situação do(a) Titular'
        'Matrícula do(a) Titular')
      ParentColor = False
      TabOrder = 7
      Visible = False
    end
    object chkSaldoZERO: TCheckBox
      Left = 328
      Top = 248
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos SEM saldo devedor'
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 272
      Width = 353
      Height = 65
      TabOrder = 8
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
    object DBcboSitPart: TwwDBLookupCombo
      Left = 16
      Top = 237
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookSitPart
      LookupField = 'IDSITPART'
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 48
      Height = 177
      TabOrder = 2
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
    object rdgQuitacao: TRadioGroup
      Left = 16
      Top = 264
      Width = 225
      Height = 73
      ItemIndex = 0
      Items.Strings = (
        'Considerar Quitações'
        'NÃO Considerar Quitações'
        'Considerar APENAS Quitações')
      TabOrder = 9
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 47
      Height = 113
      TabOrder = 10
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '     CON.IDCONTRATOEMPTMO,'
      '     CON.IDTIPOCONTREMPTMO,'
      '     MUT.NOME AS NOME_BENEF,'
      '     PTI.NOME AS NOME_TITULAR,'
      
        '     DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA) AS M' +
        'ATRICULA,'
      '     TCE.TCEDESCRICAO,'
      
        '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensionis' +
        'ta'#39') AS SIT_PART,'
      '     CON.VLRCONTRATO'
      '   FROM'
      '      PESSOA            MUT,'
      '      PESSOA            PTI,'
      '      CONTRATOEMPTMO    CON,'
      '      DEPENTIT          DEP,'
      '      ELEGPATRO         ELP,'
      '      TIPOCONTREMPTMO   TCE,'
      '      SITPART           SIT,'
      '      PARTPREVPLAN      PPP,'
      '      TIPOEMPTMO        TEP,'
      '      VWMIGRACONTRATOEP MIG'
      '   WHERE'
      '          TEP.IDEMPRESAPROP     = 1'
      '      AND CON.FLGSITUACAO       <> '#39'C'#39
      '      AND CON.IDBENEF           = MUT.IDPESSOA'
      '      AND CON.IDPESSOA          = ELP.IDPESSOA'
      '      AND CON.IDPATRO           = ELP.IDPESSJUR'
      '      AND PTI.IDPESSOA          = ELP.IDPESSOA'
      '      AND CON.IDBENEF           = DEP.IDPESSOA'
      '      AND CON.IDPESSOA          = DEP.IDTITULAR'
      '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'
      '      AND PPP.IDSITPART         = SIT.IDSITPART'
      '      AND CON.IDPESSOA          = PPP.IDPESSOA'
      '      AND CON.IDPATRO           = PPP.IDPESSJUR'
      '      AND PPP.FLGDESATIVADO     = 0'
      '      AND MIG.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'
      '      AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)'
      '                                   FROM   VWMIGRACONTRATOEP'
      
        '                                   WHERE  IDCONTRATOEMPTMO = CON' +
        '.IDCONTRATOEMPTMO'
      
        '                                   AND    DATAMIGRA <= TO_DATE('#39 +
        '30/06/2007'#39', '#39'DD/MM/YYYY'#39'))'
      '   ORDER BY'
      
        '       DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA), C' +
        'ON.IDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 128
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratoNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object qryContratoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
  end
  object qrySaldoDev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.' +
        'HMENUMPARCELAS'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             CON.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '         AND ITC.ITCTRATASALDODEV    <> 0'
      
        '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )'
      '         AND ( HME.HMEDATAATUALIZA    <='
      '               ('
      '               SELECT'
      
        '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, :PDATA, M' +
        'AX(H.HMEDATAATUALIZA))'
      '               FROM'
      '                  HISTMOVEMPTMO   H,'
      '                  CONTRATOEMPTMO  C,'
      '                  ITEMXTIPOCONTR  IT'
      '               WHERE'
      
        '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPT' +
        'MO'
      '                  AND H.HMEDATAATUALIZA    <= :PDATA'
      '                  AND IT.ITCTRATASALDODEV  <> 0'
      '                  AND HME.HMEANOCOMPETENCIA = :PANO'
      '                  AND HME.HMEMESCOMPETENCIA = :PMES'
      
        '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNAD' +
        'O IS NULL )'
      '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'
      
        '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPT' +
        'MO'
      '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '               )'
      '             )'
      
        '         AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000' +
        #39')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39')))) ) ' +
        '<= :PANOMES'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) MAX'
      '   WHERE'
      '          ( CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
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
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoDevIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qrySaldoDevHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoDevHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoDevHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoDevHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryParcDev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '      AND HME.HMEDATAPREVISTA    <= '#39'30/06/2007'#39
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcDevVLR_DEV: TFloatField
      FieldName = 'VLR_DEV'
    end
  end
  object qryParcPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                DECODE(FLGABONADO, 1, NVL(HME.HM' +
        'EVLRPREVISTO, 0),'
      
        '                                                      NVL(HME.HM' +
        'EVLREFETIVO, 0)))) AS VLR_PAG'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '      AND HME.HMEDATAPREVISTA    <= :PDATA'
      '      AND ('
      '          (HME.HMEDATAEFETIVA    <= :PDATA)'
      
        '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= :P' +
        'DATA) )'
      
        '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= :P' +
        'DATA) )'
      '          )'
      '')
    ValidateWithMask = True
    Left = 232
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end>
    object qryParcPagVLR_PAG: TFloatField
      FieldName = 'VLR_PAG'
    end
  end
  object qryParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT '
      '        SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_DEVIDO'
      '      FROM'
      '         HISTMOVEMPTMO HME'
      '      WHERE'
      '             HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '         AND HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      
        '         AND HMEDATAPREVISTA        <= TO_DATE('#39'30/06/2007'#39', '#39'DD' +
        '/MM/YYYY'#39')'
      
        '         AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFET' +
        'IVA > TO_DATE('#39'30/06/2007'#39', '#39'DD/MM/YYYY'#39')) )'
      
        '         AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFET' +
        'IVA > TO_DATE('#39'30/06/2007'#39', '#39'DD/MM/YYYY'#39')) )'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      
        '         AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = ' +
        '0) OR ((HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' +
        #39'30/06/2007'#39', '#39'DD/MM/YYYY'#39'))) )'
      
        '         AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = ' +
        '0) OR ((HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' +
        #39'30/06/2007'#39', '#39'DD/MM/YYYY'#39'))) )'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelaVALOR_DEVIDO: TFloatField
      FieldName = 'VALOR_DEVIDO'
    end
  end
end
