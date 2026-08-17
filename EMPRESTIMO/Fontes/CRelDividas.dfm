inherited cfgRelDividas: TcfgRelDividas
  Left = 41
  Top = 34
  Caption = 'Valores Devidos'
  ClientHeight = 400
  ClientWidth = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 639
    Height = 367
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
    object Label4: TLabel
      Left = 296
      Top = 279
      Width = 109
      Height = 13
      Caption = 'Situação do Titular'
      Color = clAppWorkSpace
      ParentColor = False
      Visible = False
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
      Top = 217
      Width = 289
      Height = 57
      TabOrder = 5
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object edtDataRef: TwwDBDateTimePicker
        Left = 16
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
      object rdgDevolucao: TRadioGroup
        Left = 126
        Top = 8
        Width = 151
        Height = 41
        Caption = ' Considera Devoluções '
        Color = clAppWorkSpace
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'Não')
        ParentColor = False
        TabOrder = 1
        Visible = False
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
    object chkItemAberto: TCheckBox
      Left = 328
      Top = 384
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos com itens em aberto'
      Color = clAppWorkSpace
      ParentColor = False
      TabOrder = 8
      Visible = False
    end
    object rdgOrdenar: TRadioGroup
      Left = 18
      Top = 248
      Width = 225
      Height = 105
      Caption = ' Ordenar por: '
      ItemIndex = 1
      Items.Strings = (
        'Nº do Contrato'
        'Nome do(a) Mutuário(a)'
        'Situação do(a) Titular'
        'Matrícula do(a) Titular')
      TabOrder = 11
    end
    object chkSaldoZERO: TCheckBox
      Left = 328
      Top = 424
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos SEM saldo devedor'
      Color = clAppWorkSpace
      ParentColor = False
      TabOrder = 10
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 258
      Top = 288
      Width = 353
      Height = 65
      TabOrder = 12
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
      Left = 296
      Top = 293
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
      Color = clAppWorkSpace
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 4
      Visible = False
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
      Top = 88
      Height = 145
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object chkSaldoDevedor: TCheckBox
      Left = 328
      Top = 404
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos COM saldo devedor'
      Color = clAppWorkSpace
      ParentColor = False
      TabOrder = 9
      Visible = False
    end
    object rdgQuitacao: TRadioGroup
      Left = 16
      Top = 360
      Width = 289
      Height = 73
      Color = clAppWorkSpace
      ItemIndex = 0
      Items.Strings = (
        'Considerar Quitações'
        'NÃO Considerar Quitações'
        'Considerar APENAS Quitações')
      ParentColor = False
      TabOrder = 6
      Visible = False
    end
    object chkValorDevido: TCheckBox
      Left = 328
      Top = 444
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos com valor devido'
      Checked = True
      Color = clAppWorkSpace
      ParentColor = False
      State = cbChecked
      TabOrder = 7
      Visible = False
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 113
      TabOrder = 13
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 639
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
      '      CON.IDCONTRATOEMPTMO,'
      '      CON.VLRCONTRATO,'
      '      PTI.NOME AS NOME_TITULAR,'
      '      PBF.NOME AS NOME_BENEF,'
      
        '      DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensioni' +
        'sta'#39') AS SIT_PART,'
      '      DEP.MATRICULA AS MATRICULA,'
      '      ELP.MATRICULA AS MATRICULA_TIT,'
      '      TCE.TCEDESCRICAO'
      '   FROM'
      '      PESSOA          PBF,'
      '      PESSOA          PTI,'
      '      CONTRATOEMPTMO  CON,'
      '      DEPENTIT        DEP,'
      '      ELEGPATRO       ELP,'
      '      PARTPREVPLAN    PPP,'
      '      TIPOCONTREMPTMO TCE,'
      '      TIPOEMPTMO      TEP,'
      '      VWMIGRACONTRATOEP MIG,'
      '      SITPART         SIT'
      '   WHERE'
      '          TEP.IDEMPRESAPROP      = 1'
      '      AND CON.FLGSITUACAO        <> '#39'C'#39
      '      AND PTI.IDPESSOA           = CON.IDPESSOA'
      '      AND PBF.IDPESSOA           = CON.IDBENEF'
      ''
      '      AND ELP.IDPESSJUR          = CON.IDPATRO'
      '      AND ELP.IDPESSOA           = CON.IDPESSOA'
      ''
      '      AND DEP.IDTITULAR          = CON.IDPESSOA'
      '      AND DEP.IDPESSOA           = CON.IDBENEF'
      ''
      '      AND PPP.IDPESSJUR          = CON.IDPATRO'
      '      AND PPP.IDPESSOA           = CON.IDPESSOA'
      '      AND PPP.FLGDESATIVADO      = 0'
      ''
      '      AND SIT.IDSITPART          = PPP.IDSITPART'
      ''
      '      AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'
      '      AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO'
      ''
      '      AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '      AND MIG.DATAMIGRA             = (SELECT MAX(DATAMIGRA)'
      '                                       FROM   VWMIGRACONTRATOEP'
      
        '                                       WHERE  IDCONTRATOEMPTMO =' +
        ' CON.IDCONTRATOEMPTMO'
      
        '                                       AND    DATAMIGRA <= TO_DA' +
        'TE('#39'30/06/2007'#39', '#39'DD/MM/YYYY'#39'))'
      '      AND CON.IDPATRO              IN (-1)'
      '      AND MIG.IDPLANOCONTATU       IN (-1)'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 128
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryContratoNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object qryContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
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
    Left = 176
    Top = 112
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
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'LR_DEV'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '      AND HME.HMEDATAPREVISTA    <= '#39'30/06/2007'#39
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '
      '   GROUP BY '
      '      CON.IDCONTRATOEMPTMO '
      ''
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcDevIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcDevVLR_DEV: TFloatField
      FieldName = 'VLR_DEV'
    end
  end
  object qryParcPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                DECODE(FLGABONADO, 1, NVL(HME.HM' +
        'EVLRPREVISTO, 0),'
      
        '                                                      NVL(HME.HM' +
        'EVLREFETIVO, 0)))) AS VLR_PAG'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
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
      '          ) '
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '
      '   GROUP BY '
      '      CON.IDCONTRATOEMPTMO '
      '')
    ValidateWithMask = True
    Left = 232
    Top = 184
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
    object qryParcPagIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcPagVLR_PAG: TFloatField
      FieldName = 'VLR_PAG'
    end
  end
end
