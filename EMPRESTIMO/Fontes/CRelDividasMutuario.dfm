inherited cfgRelDividasMutuario: TcfgRelDividasMutuario
  Left = 111
  Top = 77
  Caption = 'Valores Devidos (Analítico)'
  ClientHeight = 424
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 391
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
      Left = 16
      Top = 263
      Width = 181
      Height = 13
      Caption = 'Situação do Participante Titular'
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 177
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
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 312
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
    object DBcboSitPart: TwwDBLookupCombo
      Left = 16
      Top = 277
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
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    inline molMutuario: TmolMutuario
      Left = 8
      Top = 8
      Width = 609
      inherited btnBuscaPart: TBitBtn
        Left = 552
        OnClick = molMutuariobtnBuscaPartClick
      end
      inherited btnLimpaPart: TBitBtn
        Left = 576
        OnClick = molMutuariobtnLimpaPartClick
      end
      inherited edtNome: TEdit
        Width = 353
      end
    end
    object Panel1: TPanel
      Left = 320
      Top = 208
      Width = 289
      Height = 49
      TabOrder = 4
      object Label3: TLabel
        Left = 32
        Top = 20
        Width = 128
        Height = 13
        Caption = 'Data de Referência:   '
      end
      object edtDataRef: TwwDBDateTimePicker
        Left = 160
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
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 113
      TabOrder = 7
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
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
    Left = 216
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
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '     CON.IDCONTRATOEMPTMO,'
      '     MUT.NOME,'
      
        '     DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA) AS M' +
        'ATRICULA,'
      '     TCE.TCEDESCRICAO,'
      
        '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensionis' +
        'ta'#39') AS SITDESCRICAO,'
      '     CON.VLRCONTRATO,'
      '     DECODE(CON.FLGSITUACAO,'
      '               '#39'A'#39', '#39'Ativo'#39','
      '               '#39'C'#39', '#39'Cancelado'#39','
      '               '#39'J'#39', '#39'Cobrança Jurídica'#39','
      '               '#39'E'#39', '#39'Encerrado'#39','
      '               '#39'Q'#39', '#39'Quitado'#39','
      '               '#39'R'#39', '#39'Refinanciado'#39','
      '               '#39'S'#39', '#39'Suspenso'#39','
      '               '#39'K'#39', '#39'Pendente de Quitação'#39') AS STATUSCONTR'
      '   FROM'
      '      PESSOA          MUT,'
      '      CONTRATOEMPTMO  CON,'
      '      DEPENTIT        DEP,'
      '      ELEGPATRO       ELP,'
      '      TIPOCONTREMPTMO TCE,'
      '      SITPART         SIT,'
      '      PARTPREVPLAN    PPP,'
      '      TIPOEMPTMO      TEP,'
      '      VWMIGRACONTRATOEP MIG'
      '   WHERE'
      '          TEP.IDEMPRESAPROP        = 1'
      '      AND CON.IDBENEF           = MUT.IDPESSOA'
      '      AND CON.IDPESSOA          = ELP.IDPESSOA'
      '      AND CON.IDPATRO           = ELP.IDPESSJUR'
      '      AND CON.IDBENEF           = DEP.IDPESSOA'
      '      AND CON.IDPESSOA          = DEP.IDTITULAR'
      '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'
      '      AND PPP.IDSITPART         = SIT.IDSITPART'
      '      AND CON.IDPESSOA          = PPP.IDPESSOA'
      '      AND CON.IDPATRO           = PPP.IDPESSJUR'
      '      AND PPP.FLGDESATIVADO     = 0'
      ''
      '     AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '     AND MIG.DATAMIGRA             = (SELECT MAX(DATAMIGRA)'
      '                                       FROM   VWMIGRACONTRATOEP'
      
        '                                       WHERE  IDCONTRATOEMPTMO =' +
        ' CON.IDCONTRATOEMPTMO'
      
        '                                       AND    DATAMIGRA <= TO_DA' +
        'TE('#39'31/05/2007'#39', '#39'DD/MM/YYYY'#39'))'
      ''
      '   ORDER BY'
      '      MUT.NOME, CON.IDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 128
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoNOME: TStringField
      FieldName = 'NOME'
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
    object qryContratoSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Size = 50
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratoSTATUSCONTR: TStringField
      FieldName = 'STATUSCONTR'
    end
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '     HME.HMEPARCELA,'
      
        '     TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39') || '#39'/'#39' || TO_CHAR(HME.H' +
        'MEANOCOMPETENCIA,'#39'0000'#39') AS COMPETENCIA,'
      '     HME.HMEVLRPREVISTO,'
      '     HME.HMESEQCOBRANCA,'
      '     ITE.ITEDESCRICAO'
      '   FROM'
      '     HISTMOVEMPTMO HME,'
      '     ITEMEMPTMO    ITE'
      ''
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV           <> 5'
      '      AND HME.HMEDATAPREVISTA      <= :PDATA'
      
        '      AND ( (HME.HMEDATAEFETIVA    IS NULL) OR (HME.HMEDATAEFETI' +
        'VA > :PDATA) )'
      
        '      AND ( (HME.HMEVLREFETIVO     IS NULL) OR (HME.HMEDATAEFETI' +
        'VA > :PDATA) )'
      ''
      
        '      AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO = 1' +
        ') )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      ''
      
        '      AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) ' +
        'OR'
      
        '            ((HME.FLGQUITADO IS NOT NULL) AND (HME.HMEDATAQUITAB' +
        'ONO > :PDATA)) )'
      
        '      AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) ' +
        'OR'
      
        '            ((HME.FLGABONADO IS NOT NULL) AND (HME.HMEDATAQUITAB' +
        'ONO > :PDATA)) )'
      ''
      '      AND ITE.IDITEMEMPTMO         = HME.IDITEMEMPTMO'
      ''
      '   ORDER BY'
      '      HME.HMEPARCELA,'
      '      HME.HMEMESCOMPETENCIA,'
      '      HME.HMEANOCOMPETENCIA,'
      '      HME.HMETIPOMOV,'
      '      HME.HMESEQCOBRANCA'
      '')
    ValidateWithMask = True
    Left = 176
    Top = 192
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
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end>
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 9
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
  end
end
