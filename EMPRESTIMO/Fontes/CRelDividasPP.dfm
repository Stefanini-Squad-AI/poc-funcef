inherited cfgRelDividasPP: TcfgRelDividasPP
  Left = 61
  Top = 84
  Caption = 'Valores Devidos - por Plano e Patrocinadora'
  ClientHeight = 468
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 435
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
      Top = 231
      Width = 109
      Height = 13
      Caption = 'Situação do Titular'
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
    object Panel1: TPanel
      Left = 320
      Top = 208
      Width = 289
      Height = 57
      TabOrder = 6
      object Label3: TLabel
        Left = 8
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object edtDataRef: TwwDBDateTimePicker
        Left = 8
        Top = 24
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
      object rdgDevolucao: TRadioGroup
        Left = 131
        Top = 8
        Width = 153
        Height = 41
        Caption = ' Considera Devoluções '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 1
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
    object chkParcelasAberto: TCheckBox
      Left = 328
      Top = 280
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos com itens em aberto'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object rdgOrdenar: TRadioGroup
      Left = 16
      Top = 352
      Width = 225
      Height = 65
      Caption = ' Ordenar por: '
      ItemIndex = 1
      Items.Strings = (
        'Nº do Contrato'
        'Nome do(a) Mutuário(a)'
        'Matrícula')
      TabOrder = 11
    end
    object chkSaldoZERO: TCheckBox
      Left = 328
      Top = 328
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos SEM saldo devedor'
      TabOrder = 10
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 352
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
      Left = 16
      Top = 245
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Width = 297
      Height = 137
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
    object chkSaldoDevedor: TCheckBox
      Left = 328
      Top = 304
      Width = 289
      Height = 17
      Caption = 'Exibir apenas Contratos COM saldo devedor'
      TabOrder = 9
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
    object rdgQuitacao: TRadioGroup
      Left = 16
      Top = 272
      Width = 289
      Height = 73
      ItemIndex = 0
      Items.Strings = (
        'Considerar Quitações'
        'NÃO Considerar Quitações'
        'Considerar APENAS Quitações')
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 435
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
      '   VWMIGRACONTRATOEP MIG,'
      '   PLANPREVCONTABIL  PPC,'
      '   CONTRATOEMPTMO    CON'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.IDPATRO               =:PIDPATRO'
      ''
      '   AND MIG.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND MIG.DATAMIGRA             = (SELECT MAX(DATAMIGRA)'
      '                                    FROM   VWMIGRACONTRATOEP'
      
        '                                    WHERE  IDCONTRATOEMPTMO = CO' +
        'N.IDCONTRATOEMPTMO'
      
        '                                    AND    DATAMIGRA <= :PHMEDAT' +
        'A)'
      '   AND MIG.IDPLANOCONTATU        =:IDPLANOPREV'
      ''
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
      '   AND PPP.FLGDESATIVADO         = 0'
      '   AND TCE.IDTIPOCONTREMPTMO     =:PIDTIPOCONTREMPTMO'
      ''
      
        '   AND (:PIDTIPOCONTRFILTRO      IS NULL OR TCE.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTRFILTRO)'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR CON.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO)'
      ''
      
        '   AND (:PIDSITPART              IS NULL OR SIT.IDSITPART =:PIDS' +
        'ITPART)'
      ''
      '   AND'
      '   EXISTS ('
      '          SELECT 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      '                 HME.HMEDATAPREVISTA      <=:PHMEDATA'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      '          )'
      '   AND'
      '   ('
      '   EXISTS ('
      '          SELECT 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      '                 HME.HMEDATAPREVISTA       >:PHMEDATA'
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
      '             AND HME.HMEDATAEFETIVA        >:PHMEDATA'
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
      '   AND MIG.IDPLANOCONTATU        = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      '   AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   DECODE(NVL(:PORDEM, 0), 0, CON.IDCONTRATOEMPTMO),'
      '   DECODE(NVL(:PORDEM, 0), 1, MUT.NOME),'
      '   DECODE(NVL(:PORDEM, 0), 2, DEP.MATRICULA),'
      '   CON.IDCONTRATOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
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
        DataType = ftDate
        Name = 'PHMEDATA'
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
        DataType = ftInteger
        Name = 'PIDSITPART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDSITPART'
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
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
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
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 176
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
      '   AND HME.HMESEQCOBRANCA        = 1'
      
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
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0)  = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1)'
      '       )'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 176
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
    Left = 56
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
    Left = 176
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
      '       (HME.HMEDATAEFETIVA       IS NULL )'
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
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)')
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
end
