inherited cfgRelItensEnvioSintCAPCAR: TcfgRelItensEnvioSintCAPCAR
  Left = 63
  Top = 35
  Caption = 'Valores Enviados/Recebidos (Financeiro) - sintético por Item'
  ClientHeight = 486
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 453
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
    object Label5: TLabel
      Left = 16
      Top = 336
      Width = 59
      Height = 13
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 75
      Top = 336
      Width = 495
      Height = 13
      Caption = 
        ': Se for utilizado o filtro por Data Efetiva, desconsiderar os d' +
        'ados exibidos nas colunas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 83
      Top = 352
      Width = 211
      Height = 13
      Caption = '"Quant." e "Vlr.Enviado" do relatório'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 240
      Top = 372
      Width = 369
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
        Width = 111
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
    object rdgPositivoNegativo: TRadioGroup
      Left = 16
      Top = 208
      Width = 289
      Height = 57
      Caption = ' Considerar Itens com valor negativo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 1
      Items.Strings = (
        'Como valores negativos'
        'Como valores positivos')
      ParentFont = False
      TabOrder = 4
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 121
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 97
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object Panel1: TPanel
      Left = 320
      Top = 192
      Width = 289
      Height = 73
      TabOrder = 5
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 116
        Height = 13
        Caption = 'Cobrança (mês/ano)'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1850
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
        Width = 153
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
      object chkFiltroCobranca: TCheckBox
        Left = 48
        Top = 48
        Width = 217
        Height = 17
        Caption = 'Utilizar filtro'
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 272
      Width = 289
      Height = 53
      Caption = ' Data de Vencimento entre: '
      TabOrder = 6
      object Label3: TLabel
        Left = 140
        Top = 25
        Width = 8
        Height = 13
        Caption = 'e'
      end
      object edtDataVenctoIni: TwwDBDateTimePicker
        Left = 24
        Top = 21
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
      object edtDataVenctoFim: TwwDBDateTimePicker
        Left = 168
        Top = 21
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
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 272
      Width = 289
      Height = 53
      Caption = ' Data Efetiva entre: '
      TabOrder = 7
      object Label4: TLabel
        Left = 138
        Top = 25
        Width = 8
        Height = 13
        Caption = 'e'
      end
      object edtDataEfetivaIni: TwwDBDateTimePicker
        Left = 24
        Top = 21
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
      object edtDataEfetivaFim: TwwDBDateTimePicker
        Left = 168
        Top = 21
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
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 99
      TabOrder = 9
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 81
      end
    end
  end
  inherited Dock971: TDock97
    Top = 453
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
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO,'
      '   ITE.IDITEMEMPTMO,'
      '   ITE.ITEDESCRICAO,'
      '   FCT.TIPO,'
      ''
      '   NVL(FCT.HMEVLRPREVISTO, 0) AS VLR_ENV,'
      '   NVL(FCT.HMEVLRPREVISTODOC, 0) AS VLR_DOC,'
      '   NVL(FCT.HMEVLREFETIVO, 0)  AS VLR_REC,'
      ''
      '   PES.NOME'
      ''
      'FROM'
      '   PESSOA            PES,'
      '   HISTMOVEMPTMO     HME,'
      '   CONTRATOEMPTMO    CON,'
      '   ITEMEMPTMO        ITE,'
      '   TIPOCONTREMPTMO   TCE,'
      '   TIPOEMPTMO        TEP,'
      ''
      '   ('
      '   SELECT'
      '      '#39'P'#39' AS TIPO,'
      '      IDHISTMOVEMPTMO,'
      ''
      '      DECODE(CODDOCUMENTO,'
      '             NULL, 0,'
      '             DECODE(FLGENVIO,'
      '                    NULL, DECODE(NVL(:PABS, 0),'
      '                                 1, ABS(NVL(HMEVLRPREVISTO, 0)),'
      '                                 NVL(HMEVLRPREVISTO, 0)),'
      '                    0)'
      '            ) AS HMEVLRPREVISTODOC,'
      ''
      '      DECODE(CODDOCUMENTO,'
      '             NULL, DECODE(FLGENVIO,'
      '                          NULL, DECODE(NVL(:PABS, 0),'
      
        '                                       1, ABS(NVL(HMEVLRPREVISTO' +
        ', 0)),'
      '                                       NVL(HMEVLRPREVISTO, 0)),'
      '                          0),'
      '             0) AS HMEVLRPREVISTO,'
      ''
      '      DECODE(NVL(:PABS, 0),'
      '             1, ABS(NVL(HMEVLREFETIVO, 0)),'
      '             NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      
        '          (:PIDCONTRATOEMPTMO IS NULL OR IDCONTRATOEMPTMO =:PIDC' +
        'ONTRATOEMPTMO)'
      ''
      '      AND ( (:PFILTROMES      IS NULL) OR ('
      
        '            (:PFILTROMES      IS NOT NULL) AND HMEANOCOBRANCA =:' +
        'PHMEANOCOBRANCA'
      
        '                                           AND HMEMESCOBRANCA =:' +
        'PHMEMESCOBRANCA ) )'
      '      AND ( (:PFILTRODATA     IS NULL) OR ('
      
        '            (:PFILTRODATA     IS NOT NULL) AND HMEDATAEFETIVA BE' +
        'TWEEN :PDATAINI AND :PDATAFIM ) )'
      ''
      '      AND HMEFORMACOBRANCA    = '#39'C'#39
      '      AND HMERECPAG           = '#39'P'#39
      '      AND (HMECENTRALIZA      = 1 OR HMEDESTACADO = 1)'
      '      AND ( (FLGESTORNADO     IS NULL) OR (FLGESTORNADO = 0) )'
      ''
      '   UNION'
      ''
      '   SELECT'
      '      '#39'R'#39' AS TIPO,'
      '      IDHISTMOVEMPTMO,'
      ''
      '      DECODE(CODDOCUMENTO,'
      '             NULL, 0,'
      '                   DECODE(FLGENVIO,'
      '                          NULL, DECODE(NVL(:PABS, 0),'
      
        '                                       1, ABS(NVL(HMEVLRPREVISTO' +
        ', 0)),'
      '                                          NVL(HMEVLRPREVISTO, 0)'
      '                                      ),'
      '                                0'
      '                         )'
      '            ) AS HMEVLRPREVISTODOC,'
      ''
      '      DECODE(CODDOCUMENTO,'
      '             NULL, DECODE(FLGENVIO,'
      '                          NULL, DECODE(NVL(:PABS, 0),'
      
        '                                       1, ABS(NVL(HMEVLRPREVISTO' +
        ', 0)),'
      '                                          NVL(HMEVLRPREVISTO, 0)'
      '                                      ),'
      '                                0'
      '                         ),'
      '                   0'
      '            ) AS HMEVLRPREVISTO,'
      ''
      '      DECODE(NVL(:PABS, 0),'
      '             1, ABS(NVL(HMEVLREFETIVO, 0)),'
      '             NVL(HMEVLREFETIVO, 0) ) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      
        '          (:PIDCONTRATOEMPTMO IS NULL OR IDCONTRATOEMPTMO =:PIDC' +
        'ONTRATOEMPTMO)'
      ''
      '      AND ( (:PFILTROMES      IS NULL) OR ('
      
        '            (:PFILTROMES      IS NOT NULL) AND HMEANOCOBRANCA =:' +
        'PHMEANOCOBRANCA'
      
        '                                           AND HMEMESCOBRANCA =:' +
        'PHMEMESCOBRANCA ) )'
      '      AND ( (:PFILTRODATA     IS NULL) OR ('
      
        '            (:PFILTRODATA     IS NOT NULL) AND HMEDATAEFETIVA BE' +
        'TWEEN :PDATAINI AND :PDATAFIM ) )'
      ''
      '      AND HMEFORMACOBRANCA    = '#39'C'#39
      '      AND HMERECPAG           = '#39'R'#39
      '      AND (HMECENTRALIZA      = 1 OR HMEDESTACADO = 1)'
      '      AND ( (FLGESTORNADO     IS NULL) OR (FLGESTORNADO = 0) )'
      '   ) FCT'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TEP.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TCE.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDCONTRATOEMPTMO  IS NULL) OR (CON.IDCONTRATOEMPTMO ' +
        '  =:PIDCONTRATOEMPTMO) )'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      '   AND TCE.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO'
      '   AND CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO'
      '   AND ITE.IDITEMEMPTMO       = HME.IDITEMEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO    = FCT.IDHISTMOVEMPTMO'
      '   AND PES.IDPESSOA           = CON.IDPATRO'
      ''
      'ORDER BY'
      
        '   TEP.DESCTIPOEMPTMO, PES.NOME, TCE.TCEDESCRICAO, ITE.IDITEMEMP' +
        'TMO'
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
        Value = '2003'
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
        Value = '03'
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
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
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryAuxDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryAuxTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryAuxIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryAuxITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryAuxTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryAuxVLR_DOC: TFloatField
      FieldName = 'VLR_DOC'
    end
    object qryAuxVLR_REC: TFloatField
      FieldName = 'VLR_REC'
    end
    object qryAuxNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAuxVLR_ENV: TFloatField
      FieldName = 'VLR_ENV'
    end
  end
end
