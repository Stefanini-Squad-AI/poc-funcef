inherited cfgRelDividasIndexador: TcfgRelDividasIndexador
  Left = 122
  Top = 149
  Caption = 'Valores Devidos por Indexador'
  ClientHeight = 338
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 305
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
    object GroupBox1: TGroupBox
      Left = 256
      Top = 224
      Width = 353
      Height = 65
      TabOrder = 4
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
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 47
      Height = 113
      TabOrder = 5
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
    end
  end
  inherited Dock971: TDock97
    Top = 305
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
      '      CON.IDCONTRATOEMPTMO,'
      '      CON.VLRCONTRATO,'
      '      TEP.IDTIPOEMPTMO, TEP.DESCTIPOEMPTMO,'
      '      CON.MOECODIGO,'
      '      MOE.MOESIGLA, MOE.MOEDESC'
      '   FROM'
      '      MOEDA         MOE,'
      '      CONTRATOEMPTMO  CON,'
      '      TIPOCONTREMPTMO TCE,'
      '      TIPOEMPTMO      TEP,'
      '      VWMIGRACONTRATOEP MIG'
      '   WHERE'
      '          TEP.IDEMPRESAPROP      = 1'
      '      AND CON.FLGSITUACAO        <> '#39'C'#39
      '      AND CON.MOECODIGO          = MOE.MOECODIGO'
      '      AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'
      '      AND TEP.IDTIPOEMPTMO       = TCE.IDTIPOEMPTMO'
      '      AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '      AND MIG.DATAMIGRA             = (SELECT MAX(DATAMIGRA)'
      '                                       FROM   VWMIGRACONTRATOEP'
      
        '                                       WHERE  IDCONTRATOEMPTMO =' +
        ' CON.IDCONTRATOEMPTMO'
      
        '                                       AND    DATAMIGRA <= TO_DA' +
        'TE('#39'31/05/2007'#39', '#39'DD/MM/YYYY'#39'))'
      '   ORDER BY'
      '      TEP.DESCTIPOEMPTMO, MOE.MOESIGLA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 128
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratoMOEDESC: TStringField
      FieldName = 'MOEDESC'
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
    Left = 160
    Top = 88
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
    Left = 216
    Top = 96
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
    Left = 216
    Top = 160
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
