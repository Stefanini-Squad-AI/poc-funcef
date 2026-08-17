inherited cfgRelItensEnviados: TcfgRelItensEnviados
  Left = 124
  Top = 63
  Caption = 'Itens Enviados'
  ClientHeight = 409
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 376
    object Label6: TLabel
      Left = 16
      Top = 90
      Width = 94
      Height = 13
      Caption = 'Patrocinadora(s)'
    end
    object Label7: TLabel
      Left = 320
      Top = 90
      Width = 47
      Height = 13
      Caption = 'Plano(s)'
    end
    object Label2: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited Label1: TLabel
        Left = 112
      end
      inherited edtNome: TEdit
        Left = 112
        Width = 441
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
      inherited edtIdContrato: TEdit
        Width = 105
      end
    end
    object lstPatro: TCheckListBox
      Left = 16
      Top = 104
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
      TabOrder = 1
    end
    object btnInvertePatro: TBitBtn
      Left = 264
      Top = 96
      Width = 20
      Height = 20
      Hint = 'Inverte a Seleção'
      TabOrder = 2
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
      Top = 96
      Width = 21
      Height = 20
      Hint = 'Seleciona Todos'
      TabOrder = 3
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
      Top = 104
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
      TabOrder = 4
    end
    object btnInvertePlano: TBitBtn
      Left = 567
      Top = 96
      Width = 21
      Height = 20
      Hint = 'Inverte a Seleção'
      TabOrder = 5
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
      Top = 96
      Width = 21
      Height = 20
      Hint = 'Seleciona Todos'
      TabOrder = 6
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
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object Panel1: TPanel
      Left = 320
      Top = 216
      Width = 289
      Height = 57
      TabOrder = 8
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
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 280
      Width = 209
      Height = 81
      Caption = ' Forma(s) de Envio '
      TabOrder = 9
      object chkFinanceiro: TCheckBox
        Left = 16
        Top = 16
        Width = 153
        Height = 17
        Caption = 'Financeiro (CaR)'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkFolhaPatro: TCheckBox
        Left = 16
        Top = 36
        Width = 153
        Height = 17
        Caption = 'Folha Patrocinadora'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkFolhaBenef: TCheckBox
        Left = 16
        Top = 56
        Width = 153
        Height = 17
        Caption = 'Folha de Benefícios'
        Checked = True
        State = cbChecked
        TabOrder = 2
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
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 280
      Width = 353
      Height = 65
      TabOrder = 11
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
        DropDownWidth = 8
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
  end
  inherited Dock971: TDock97
    Top = 376
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 281
      DockPos = 342
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
      '   TCEDESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '               HMETIPOMOV             = 3'
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 144
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
      end>
    object qryQuitMortVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryQuitMortTOTAL: TFloatField
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '               HMETIPOMOV             = 3'
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 224
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
      end>
    object qryQuitacoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryQuitacoesTOTAL: TFloatField
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '           HMETIPOMOV             = 2'
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      ''
      '')
    ValidateWithMask = True
    Left = 160
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
      end>
    object qryAmortizacoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryAmortizacoesTOTAL: TFloatField
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 160
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
      end>
    object qryEncargosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEncargosTOTAL: TFloatField
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             in (1, 6, 7)'
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 56
    Top = 160
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
      end>
    object qryParcelasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryParcelasTOTAL: TFloatField
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
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRQUITACAO      IS NULL'
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 112
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
      end>
    object qryConcessoesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConcessoesTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryParcelaAtr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS VALOR,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTAL'
      'FROM'
      '   TIPOCONTREMPTMO A, TIPOEMPTMO TE,'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          HMETIPOMOV             IN (1, 6, 7)'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOBRANCA     =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOBRANCA     =:PHMEMESCOMPETENCIA'
      
        '      AND (RTRIM(LTRIM(HME.HMEANOCOMPETENCIA)) || RTRIM(LTRIM(HM' +
        'E.HMEMESCOMPETENCIA))) < (RTRIM(LTRIM(HME.HMEANOCOBRANCA)) || RT' +
        'RIM(LTRIM(HME.HMEMESCOBRANCA)))'
      
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
      '    AND A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '    AND TE.IDTIPOEMPTMO     = A.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 56
    Top = 208
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
      end>
    object qryParcelaAtrVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryParcelaAtrTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
