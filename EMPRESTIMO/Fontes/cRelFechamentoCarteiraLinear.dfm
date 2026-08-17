inherited cfgRelFechamentoCarteiraLinear: TcfgRelFechamentoCarteiraLinear
  Left = 238
  Top = 118
  Caption = 'Resumo da Carteira (visão Caixa - Linear)'
  ClientHeight = 451
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 418
    object Label1: TLabel
      Left = 16
      Top = 58
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 58
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Panel1: TPanel
      Left = 320
      Top = 224
      Width = 289
      Height = 57
      TabOrder = 3
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 136
        Height = 13
        Caption = 'Mês/Ano de Referência'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 184
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
        Width = 145
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
      Left = 256
      Top = 336
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
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 72
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
    object DBcboTipoContr: TwwDBLookupCombo
      Left = 320
      Top = 72
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
      Top = 16
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 96
      Height = 193
      TabOrder = 5
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 169
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object chkApropriado: TCheckBox
      Left = 24
      Top = 292
      Width = 585
      Height = 17
      Caption = 'Considerar apenas itens apropriados, se abonados'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 6
    end
    object chkAbonoContab: TCheckBox
      Left = 24
      Top = 312
      Width = 289
      Height = 17
      Caption = 'Considerar apenas abonos contabilizados'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
    end
    object chkRenovacao: TCheckBox
      Left = 328
      Top = 312
      Width = 289
      Height = 17
      Caption = 'NÃO Considerar quitações por renovação'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 95
      Height = 123
      TabOrder = 9
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 105
      end
    end
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 451
      DockPos = 522
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 279
      DockPos = 350
    end
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '   1000000 AS SALDO_ANT,'
      '   1000000 AS TOTALSALDO_ANT,'
      ''
      '   1000000 AS PARCELAS_CR,'
      '   1000000 AS TOTALPARC_CR,'
      '   1000000 AS PARCELAS_FP,'
      '   1000000 AS TOTALPARC_FP,'
      '   1000000 AS PARCELAS_FB,'
      '   1000000 AS TOTALPARC_FB,'
      ''
      '   1000000 AS ENCARGOS_CR,'
      '   1000000 AS TOTALENC_CR,'
      '   1000000 AS ENCARGOS_FP,'
      '   1000000 AS TOTALENC_FP,'
      '   1000000 AS ENCARGOS_FB,'
      '   1000000 AS TOTALENC_FB,'
      ''
      '   1000000 AS AMORTIZACAO_CR,'
      '   1000000 AS TOTALAMO_CR,'
      '   1000000 AS AMORTIZACAO_FP,'
      '   1000000 AS TOTALAMO_FP,'
      '   1000000 AS AMORTIZACAO_FB,'
      '   1000000 AS TOTALAMO_FB,'
      ''
      '   1000000 AS QUITACAO_CR,'
      '   1000000 AS TOTALQUI_CR,'
      '   1000000 AS QUITACAO_FP,'
      '   1000000 AS TOTALQUI_FP,'
      '   1000000 AS QUITACAO_FB,'
      '   1000000 AS TOTALQUI_FB,'
      ''
      '   1000000 AS REC_PARC_CR,'
      '   1000000 AS TOT_REC_PARC_CR,'
      ''
      '   1000000 AS REC_PARC_FP,'
      '   1000000 AS TOT_REC_PARC_FP,'
      ''
      '   1000000 AS REC_PARC_FB,'
      '   1000000 AS TOT_REC_PARC_FB,'
      ''
      '   1000000 AS REC_ENC_CR,'
      '   1000000 AS TOT_REC_ENC_CR,'
      '   1000000 AS REC_ENC_FP,'
      '   1000000 AS TOT_REC_ENC_FP,'
      '   1000000 AS REC_ENC_FB,'
      '   1000000 AS TOT_REC_ENC_FB,'
      ''
      '   1000000 AS REC_AMORT_CR,'
      '   1000000 AS TOT_REC_AMORT_CR,'
      '   1000000 AS REC_AMORT_FP,'
      '   1000000 AS TOT_REC_AMORT_FP,'
      '   1000000 AS REC_AMORT_FB,'
      '   1000000 AS TOT_REC_AMORT_FB,'
      ''
      '   1000000 AS REC_QUIT_CR,'
      '   1000000 AS TOT_REC_QUIT_CR,'
      '   1000000 AS REC_QUIT_FP,'
      '   1000000 AS TOT_REC_QUIT_FP,'
      '   1000000 AS REC_QUIT_FB,'
      '   1000000 AS TOT_REC_QUIT_FB,'
      ''
      '   1000000 AS ABONADO,'
      '   1000000 AS TOT_ABONADO,'
      ''
      '   1000000 AS QUITADO,'
      '   1000000 AS TOT_QUITADO,'
      ''
      '   1000000 AS SALDO_DEV,'
      '   1000000 AS TOTALSALDO_DEV'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    ValidateWithMask = True
    Left = 136
    Top = 344
    object qryCalculoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryCalculoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryCalculoSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qryCalculoTOTALSALDO_ANT: TFloatField
      FieldName = 'TOTALSALDO_ANT'
    end
    object qryCalculoPARCELAS_CR: TFloatField
      FieldName = 'PARCELAS_CR'
    end
    object qryCalculoTOTALPARC_CR: TFloatField
      FieldName = 'TOTALPARC_CR'
    end
    object qryCalculoPARCELAS_FP: TFloatField
      FieldName = 'PARCELAS_FP'
    end
    object qryCalculoTOTALPARC_FP: TFloatField
      FieldName = 'TOTALPARC_FP'
    end
    object qryCalculoPARCELAS_FB: TFloatField
      FieldName = 'PARCELAS_FB'
    end
    object qryCalculoTOTALPARC_FB: TFloatField
      FieldName = 'TOTALPARC_FB'
    end
    object qryCalculoENCARGOS_CR: TFloatField
      FieldName = 'ENCARGOS_CR'
    end
    object qryCalculoTOTALENC_CR: TFloatField
      FieldName = 'TOTALENC_CR'
    end
    object qryCalculoENCARGOS_FP: TFloatField
      FieldName = 'ENCARGOS_FP'
    end
    object qryCalculoTOTALENC_FP: TFloatField
      FieldName = 'TOTALENC_FP'
    end
    object qryCalculoENCARGOS_FB: TFloatField
      FieldName = 'ENCARGOS_FB'
    end
    object qryCalculoTOTALENC_FB: TFloatField
      FieldName = 'TOTALENC_FB'
    end
    object qryCalculoAMORTIZACAO_CR: TFloatField
      FieldName = 'AMORTIZACAO_CR'
    end
    object qryCalculoTOTALAMO_CR: TFloatField
      FieldName = 'TOTALAMO_CR'
    end
    object qryCalculoAMORTIZACAO_FP: TFloatField
      FieldName = 'AMORTIZACAO_FP'
    end
    object qryCalculoTOTALAMO_FP: TFloatField
      FieldName = 'TOTALAMO_FP'
    end
    object qryCalculoAMORTIZACAO_FB: TFloatField
      FieldName = 'AMORTIZACAO_FB'
    end
    object qryCalculoTOTALAMO_FB: TFloatField
      FieldName = 'TOTALAMO_FB'
    end
    object qryCalculoQUITACAO_CR: TFloatField
      FieldName = 'QUITACAO_CR'
    end
    object qryCalculoTOTALQUI_CR: TFloatField
      FieldName = 'TOTALQUI_CR'
    end
    object qryCalculoQUITACAO_FP: TFloatField
      FieldName = 'QUITACAO_FP'
    end
    object qryCalculoTOTALQUI_FP: TFloatField
      FieldName = 'TOTALQUI_FP'
    end
    object qryCalculoQUITACAO_FB: TFloatField
      FieldName = 'QUITACAO_FB'
    end
    object qryCalculoTOTALQUI_FB: TFloatField
      FieldName = 'TOTALQUI_FB'
    end
    object qryCalculoREC_PARC_CR: TFloatField
      FieldName = 'REC_PARC_CR'
    end
    object qryCalculoTOT_REC_PARC_CR: TFloatField
      FieldName = 'TOT_REC_PARC_CR'
    end
    object qryCalculoREC_PARC_FP: TFloatField
      FieldName = 'REC_PARC_FP'
    end
    object qryCalculoTOT_REC_PARC_FP: TFloatField
      FieldName = 'TOT_REC_PARC_FP'
    end
    object qryCalculoREC_PARC_FB: TFloatField
      FieldName = 'REC_PARC_FB'
    end
    object qryCalculoTOT_REC_PARC_FB: TFloatField
      FieldName = 'TOT_REC_PARC_FB'
    end
    object qryCalculoREC_ENC_CR: TFloatField
      FieldName = 'REC_ENC_CR'
    end
    object qryCalculoTOT_REC_ENC_CR: TFloatField
      FieldName = 'TOT_REC_ENC_CR'
    end
    object qryCalculoREC_ENC_FP: TFloatField
      FieldName = 'REC_ENC_FP'
    end
    object qryCalculoTOT_REC_ENC_FP: TFloatField
      FieldName = 'TOT_REC_ENC_FP'
    end
    object qryCalculoREC_ENC_FB: TFloatField
      FieldName = 'REC_ENC_FB'
    end
    object qryCalculoTOT_REC_ENC_FB: TFloatField
      FieldName = 'TOT_REC_ENC_FB'
    end
    object qryCalculoREC_AMORT_CR: TFloatField
      FieldName = 'REC_AMORT_CR'
    end
    object qryCalculoTOT_REC_AMORT_CR: TFloatField
      FieldName = 'TOT_REC_AMORT_CR'
    end
    object qryCalculoREC_AMORT_FP: TFloatField
      FieldName = 'REC_AMORT_FP'
    end
    object qryCalculoTOT_REC_AMORT_FP: TFloatField
      FieldName = 'TOT_REC_AMORT_FP'
    end
    object qryCalculoREC_AMORT_FB: TFloatField
      FieldName = 'REC_AMORT_FB'
    end
    object qryCalculoTOT_REC_AMORT_FB: TFloatField
      FieldName = 'TOT_REC_AMORT_FB'
    end
    object qryCalculoREC_QUIT_CR: TFloatField
      FieldName = 'REC_QUIT_CR'
    end
    object qryCalculoTOT_REC_QUIT_CR: TFloatField
      FieldName = 'TOT_REC_QUIT_CR'
    end
    object qryCalculoREC_QUIT_FP: TFloatField
      FieldName = 'REC_QUIT_FP'
    end
    object qryCalculoTOT_REC_QUIT_FP: TFloatField
      FieldName = 'TOT_REC_QUIT_FP'
    end
    object qryCalculoREC_QUIT_FB: TFloatField
      FieldName = 'REC_QUIT_FB'
    end
    object qryCalculoTOT_REC_QUIT_FB: TFloatField
      FieldName = 'TOT_REC_QUIT_FB'
    end
    object qryCalculoABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryCalculoTOT_ABONADO: TFloatField
      FieldName = 'TOT_ABONADO'
    end
    object qryCalculoQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryCalculoTOT_QUITADO: TFloatField
      FieldName = 'TOT_QUITADO'
    end
    object qryCalculoSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryCalculoTOTALSALDO_DEV: TFloatField
      FieldName = 'TOTALSALDO_DEV'
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
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   PPP.INSCRICAONUMERO,'
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
      '   AND MIG.DATAMIGRA             = (select max(DATAMIGRA)'
      '                                    from   VWMIGRACONTRATOEP'
      
        '                                    where  IDCONTRATOEMPTMO = CO' +
        'N.IDCONTRATOEMPTMO'
      
        '                                    and    DATAMIGRA <= :PHMEDAT' +
        'AFIM)'
      '   AND MIG.IDPLANOCONTATU        =:IDPLANOPREV'
      ''
      '   AND PPP.INSCRICAODATA         = (select max(INSCRICAODATA)'
      '                                    from   PARTPREVPLAN'
      
        '                                    where  IDPESSOA = CON.IDPESS' +
        'OA'
      '                                    and    FLGDESATIVADO = 0)'
      ''
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
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
      
        '                 HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI ' +
        'AND :PHMEDATAFIM'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      '          )'
      ''
      '   AND PPC.IDPLANOPREV           = MIG.IDPLANOCONTATU'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      #9'AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '  TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 104
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
        Name = 'PHMEDATAFIM'
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
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
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
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
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
    Left = 32
    Top = 88
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
  object qrySaldoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(CON.DEVE) AS SALDO_DEV,'
      '      SUM(CON.QUANT) AS TOTALSALDO_DEV'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      '         C.IDCONTRATOEMPTMO, C.IDTIPOCONTREMPTMO,'
      
        '         (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS ' +
        'DEVE,'
      
        '         DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(P' +
        'AR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT'
      '      FROM'
      '         CONTRATOEMPTMO C,'
      '         ('
      '         SELECT'
      
        '            CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)' +
        ') AS VLR_DEV'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '         WHERE'
      '                CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEDATAPREVISTA    <= :PHMEDATAFIM'
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) PAR_DEV,'
      '         ('
      '         SELECT'
      '            CON.IDCONTRATOEMPTMO,'
      
        '            SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0)' +
        ','
      
        '                                      DECODE(FLGABONADO, 1, NVL(' +
        'HME.HMEVLRPREVISTO, 0),'
      
        '                                                            NVL(' +
        'HME.HMEVLREFETIVO, 0)))) AS VLR_PAG'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '         WHERE'
      '                CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '            AND HME.HMEDATAPREVISTA    <= :PHMEDATAFIM'
      '            AND ('
      '                (HME.HMEDATAEFETIVA    <= :PHMEDATAFIM)'
      
        '                OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITAB' +
        'ONO <= :PHMEDATAFIM) )'
      
        '                OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITAB' +
        'ONO <= :PHMEDATAFIM) )'
      '                )'
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) PAR_PAG'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)'
      '         AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)'
      '      ) CON'
      '   WHERE'
      '      CON.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 32
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoAtuIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qrySaldoAtuSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qrySaldoAtuTOTALSALDO_DEV: TFloatField
      FieldName = 'TOTALSALDO_DEV'
    end
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(CON.DEVE) AS SALDO_ANT,'
      '      SUM(CON.QUANT) AS TOTALSALDO_ANT'
      '   FROM'
      '      ('
      '      SELECT'
      '         C.IDCONTRATOEMPTMO, C.IDTIPOCONTREMPTMO,'
      
        '         (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS ' +
        'DEVE,'
      
        '         DECODE((ROUND(NVL(PAR_DEV.VLR_DEV, 0), 2) - ROUND(NVL(P' +
        'AR_PAG.VLR_PAG, 0), 2)), 0, 0, 1) AS QUANT'
      '      FROM'
      '         CONTRATOEMPTMO C,'
      '         ('
      '         SELECT'
      
        '            CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)' +
        ') AS VLR_DEV'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '         WHERE'
      '                CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEDATAPREVISTA    <= :PHMEDATAINI'
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) PAR_DEV,'
      '         ('
      '         SELECT'
      '            CON.IDCONTRATOEMPTMO,'
      
        '            SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0)' +
        ','
      
        '                                      DECODE(FLGABONADO, 1, NVL(' +
        'HME.HMEVLRPREVISTO, 0),'
      
        '                                                            NVL(' +
        'HME.HMEVLREFETIVO, 0)))) AS VLR_PAG'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '         WHERE'
      '                CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)'
      '            AND HME.HMEDATAPREVISTA    <= :PHMEDATAINI'
      '            AND ('
      '                (HME.HMEDATAEFETIVA    <= :PHMEDATAINI)'
      
        '                OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITAB' +
        'ONO <= :PHMEDATAINI) )'
      
        '                OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITAB' +
        'ONO <= :PHMEDATAINI) )'
      '                )'
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      '            AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) PAR_PAG'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)'
      '         AND C.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)'
      '      ) CON'
      '   WHERE'
      '      CON.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 32
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoAntIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qrySaldoAntSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qrySaldoAntTOTALSALDO_ANT: TFloatField
      FieldName = 'TOTALSALDO_ANT'
    end
  end
  object qryParcelas_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' PARCELAS,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 1'
      '            AND HME.HMEPARCELA         > 0'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryParcelas_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcelas_CRPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryParcelas_CRTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryParcelas_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' PARCELAS,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 1'
      '            AND HME.HMEPARCELA         > 0'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryParcelas_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcelas_FPPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryParcelas_FPTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryParcelas_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' PARCELAS,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 1'
      '            AND HME.HMEPARCELA         > 0'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryParcelas_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryParcelas_FBPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryParcelas_FBTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryEncargos_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' ENCARGOS_CR,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_CR'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND ((:PAPROPIADO = 0) OR'
      
        '                 ((NVL(HME.FLGABONADO, 0) = 0) OR (NVL(HME.FLGAB' +
        'ONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL))'
      '                )'
      '            AND HME.HMETIPOMOV         = 4'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPIADO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryEncargos_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryEncargos_CRENCARGOS_CR: TFloatField
      FieldName = 'ENCARGOS_CR'
    end
    object qryEncargos_CRTOTALENC_CR: TFloatField
      FieldName = 'TOTALENC_CR'
    end
  end
  object qryEncargos_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' ENCARGOS_FP,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_FP'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND ((:PAPROPIADO = 0) OR'
      
        '                 ((NVL(HME.FLGABONADO, 0) = 0) OR (NVL(HME.FLGAB' +
        'ONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL))'
      '                )'
      '            AND HME.HMETIPOMOV         = 4'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPIADO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryEncargos_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryEncargos_FPENCARGOS_FP: TFloatField
      FieldName = 'ENCARGOS_FP'
    end
    object qryEncargos_FPTOTALENC_FP: TFloatField
      FieldName = 'TOTALENC_FP'
    end
  end
  object qryEncargos_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' ENCARGOS_FB,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC_FB'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND ((:PAPROPIADO = 0) OR'
      
        '                 ((NVL(HME.FLGABONADO, 0) = 0) OR (NVL(HME.FLGAB' +
        'ONADO, 0) = 1 AND HME.PLNCODIGO IS NOT NULL))'
      '                )'
      '            AND HME.HMETIPOMOV         = 4'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPIADO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryEncargos_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryEncargos_FBENCARGOS_FB: TFloatField
      FieldName = 'ENCARGOS_FB'
    end
    object qryEncargos_FBTOTALENC_FB: TFloatField
      FieldName = 'TOTALENC_FB'
    end
  end
  object qryAmort_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      '         A.IDTIPOCONTREMPTMO,'
      '         NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_CR,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_CR'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 2'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryAmort_CRAMORTIZACAO_CR: TFloatField
      FieldName = 'AMORTIZACAO_CR'
    end
    object qryAmort_CRTOTALAMO_CR: TFloatField
      FieldName = 'TOTALAMO_CR'
    end
    object qryAmort_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryAmort_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      '         A.IDTIPOCONTREMPTMO,'
      '         NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_FP,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_FP'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 2'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryAmort_FPAMORTIZACAO_FP: TFloatField
      FieldName = 'AMORTIZACAO_FP'
    end
    object qryAmort_FPTOTALAMO_FP: TFloatField
      FieldName = 'TOTALAMO_FP'
    end
    object qryAmort_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryAmort_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      '         A.IDTIPOCONTREMPTMO,'
      '         NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO_FB,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO_FB'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRP' +
        'REVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 2'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO =' +
        ' 1 )'
      
        '            AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) )'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryAmort_FBAMORTIZACAO_FB: TFloatField
      FieldName = 'AMORTIZACAO_FB'
    end
    object qryAmort_FBTOTALAMO_FB: TFloatField
      FieldName = 'TOTALAMO_FB'
    end
    object qryAmort_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryQuitacao_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' QUITACAO_CR,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_CR'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '            AND HME.HMETIPOMOV         = 3'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacao_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacao_CRQUITACAO_CR: TFloatField
      FieldName = 'QUITACAO_CR'
    end
    object qryQuitacao_CRTOTALQUI_CR: TFloatField
      FieldName = 'TOTALQUI_CR'
    end
  end
  object qryQuitacao_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' QUITACAO_FP,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_FP'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '            AND HME.HMETIPOMOV         = 3'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacao_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacao_FPQUITACAO_FP: TFloatField
      FieldName = 'QUITACAO_FP'
    end
    object qryQuitacao_FPTOTALQUI_FP: TFloatField
      FieldName = 'TOTALQUI_FP'
    end
  end
  object qryQuitacao_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS' +
        ' QUITACAO_FB,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI_FB'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '            AND HME.HMETIPOMOV         = 3'
      '            AND HME.HMESEQCOBRANCA     = 1'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND ' +
        ':PHMEDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 278
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacao_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryQuitacao_FBQUITACAO_FB: TFloatField
      FieldName = 'QUITACAO_FB'
    end
    object qryQuitacao_FBTOTALQUI_FB: TFloatField
      FieldName = 'TOTALQUI_FB'
    end
  end
  object qryRecParc_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_PARC,                             '
      
        '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC     ' +
        '                                      '
      
        '      FROM                                                      ' +
        '                                      '
      
        '         TIPOCONTREMPTMO A,                                     ' +
        '                                      '
      
        '         (                                                      ' +
        '                                      '
      
        '         SELECT                                                 ' +
        '                                      '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,                               '
      '            TC.IDTIPOCONTREMPTMO,'
      
        '            NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO           ' +
        '                                      '
      '         FROM'
      
        '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                ' +
        '                                      '
      
        '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC              ' +
        '                                      '
      
        '         WHERE                                                  ' +
        '                                      '
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '            AND HME.HMETIPOMOV         = 1                      ' +
        '                                      '
      
        '            AND HME.FLGBAIXADO         IS NULL                  ' +
        '                                          '
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecParc_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecParc_CRREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryRecParc_CRTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
  object qryRecParc_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_PARC,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO,'
      '            NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 1'
      '            AND HME.FLGBAIXADO         IS NULL'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecParc_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecParc_FPREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryRecParc_FPTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
  object qryRecParc_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_PARC,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC'
      '      FROM'
      '         TIPOCONTREMPTMO A,'
      '         ('
      '         SELECT'
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,'
      '            TC.IDTIPOCONTREMPTMO,'
      '            NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '            AND HME.HMETIPOMOV         = 1'
      '            AND HME.FLGBAIXADO         IS NULL'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 228
    Top = 118
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecParc_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecParc_FBREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryRecParc_FBTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
  object qryRecEnc_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_ENC,                              '
      
        '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC      ' +
        '                                      '
      
        '      FROM                                                      ' +
        '                                      '
      
        '         TIPOCONTREMPTMO A,                                     ' +
        '                                      '
      
        '         (                                                      ' +
        '                                      '
      
        '         SELECT                                                 ' +
        '                                      '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,                               '
      
        '            TC.IDTIPOCONTREMPTMO,                               ' +
        '                                      '
      '            NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      
        '         FROM                                                   ' +
        '                                      '
      
        '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                ' +
        '                                      '
      
        '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC              ' +
        '                                      '
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '            AND HME.HMETIPOMOV         = 4                      ' +
        '                                      '
      
        '            AND HME.FLGBAIXADO         IS NULL                  ' +
        '                                          '
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      '            AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecEnc_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecEnc_CRREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryRecEnc_CRTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
  end
  object qryRecEnc_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_ENC,                              '
      
        '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC      ' +
        '                                      '
      
        '      FROM                                                      ' +
        '                                      '
      
        '         TIPOCONTREMPTMO A,                                     ' +
        '                                      '
      
        '         (                                                      ' +
        '                                      '
      
        '         SELECT                                                 ' +
        '                                      '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,                               '
      
        '            TC.IDTIPOCONTREMPTMO,                               ' +
        '                                      '
      '            NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      
        '         FROM                                                   ' +
        '                                      '
      
        '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                ' +
        '                                      '
      
        '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC              ' +
        '                                      '
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '            AND HME.HMETIPOMOV         = 4                      ' +
        '                                      '
      
        '            AND HME.FLGBAIXADO         IS NULL                  ' +
        '                                          '
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'P'#39
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecEnc_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecEnc_FPREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryRecEnc_FPTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
  end
  object qryRecEnc_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_ENC,                              '
      
        '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC      ' +
        '                                      '
      
        '      FROM                                                      ' +
        '                                      '
      
        '         TIPOCONTREMPTMO A,                                     ' +
        '                                      '
      
        '         (                                                      ' +
        '                                      '
      
        '         SELECT                                                 ' +
        '                                      '
      
        '            TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATO' +
        'EMPTMO,                               '
      
        '            TC.IDTIPOCONTREMPTMO,                               ' +
        '                                      '
      '            NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      
        '         FROM                                                   ' +
        '                                      '
      
        '            HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                ' +
        '                                      '
      
        '            ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC              ' +
        '                                      '
      '         WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '            AND HME.HMETIPOMOV         = 4                      ' +
        '                                      '
      
        '            AND HME.FLGBAIXADO         IS NULL                  ' +
        '                                          '
      
        '            AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO' +
        ' = 1) )'
      '            AND NVL(HME.FLGESTORNADO, 0) = 0'
      '            AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '            AND HME.HMETIPOFOLHA       = '#39'B'#39
      
        '            AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHM' +
        'EDATAFIM'
      '            AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '            AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '            AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '            AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         ) CON'
      '      WHERE'
      '         A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecEnc_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecEnc_FBREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryRecEnc_FBTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
  end
  object qryRecAmort_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '     SELECT                                                     ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS R' +
        'EC_AMORT,                            '
      
        '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT     ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A,                                      ' +
        '                                     '
      
        '        (                                                       ' +
        '                                     '
      
        '        SELECT                                                  ' +
        '                                     '
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,                               '
      
        '           TC.IDTIPOCONTREMPTMO,                                ' +
        '                                     '
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMETIPOMOV         = 2'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHME' +
        'DATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 224
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecAmort_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecAmort_CRREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryRecAmort_CRTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
  end
  object qryRecAmort_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS R' +
        'EC_AMORT,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMETIPOMOV         = 2'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '           AND HME.HMETIPOFOLHA       = '#39'P'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHME' +
        'DATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecAmort_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecAmort_FPREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryRecAmort_FPTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
  end
  object qryRecAmort_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS R' +
        'EC_AMORT,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND HME.HMETIPOMOV         = 2'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '           AND HME.HMETIPOFOLHA       = '#39'B'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA BETWEEN :PHMEDATAINI AND :PHME' +
        'DATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecAmort_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecAmort_FBREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryRecAmort_FBTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
  end
  object qryRecQuit_CR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_QUIT,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT'
      '      FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '           AND HME.HMEORIGEM         <> 0'
      '           AND HMETIPOMOV             = 3'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'C'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :P' +
        'HMEDATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecQuit_CRIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecQuit_CRREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryRecQuit_CRTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
  end
  object qryRecQuit_FP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_QUIT,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT'
      '      FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '           AND HME.HMEORIGEM         <> 0'
      '           AND HMETIPOMOV             = 3'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '           AND HME.HMETIPOFOLHA       = '#39'P'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :P' +
        'HMEDATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecQuit_FPIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecQuit_FPREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryRecQuit_FPTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
  end
  object qryRecQuit_FB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '      SELECT'
      
        '         A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS ' +
        'REC_QUIT,'
      '         NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT'
      '      FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      '           NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '                C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '           AND (:PRENOVA = 0 OR HME.HMEORIGEM         <> 0)'
      '           AND HME.HMEORIGEM         <> 0'
      '           AND HMETIPOMOV             = 3'
      '           AND HME.FLGBAIXADO         IS NULL'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      '           AND HME.HMEFORMACOBRANCA   = '#39'F'#39
      '           AND HME.HMETIPOFOLHA       = '#39'B'#39
      ''
      '           AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '           AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :P' +
        'HMEDATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryRecQuit_FBIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryRecQuit_FBREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryRecQuit_FBTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
  end
  object qryItensAbonados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS A' +
        'BONADO,'
      
        '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_ABONADO       ' +
        '                                     '
      
        '     FROM                                                       ' +
        '                                     '
      
        '        TIPOCONTREMPTMO A,                                      ' +
        '                                     '
      
        '        (                                                       ' +
        '                                     '
      
        '        SELECT                                                  ' +
        '                                     '
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,                               '
      
        '           TC.IDTIPOCONTREMPTMO,                                ' +
        '                                     '
      ''
      
        '           DECODE(NVL(FLGABONADO, 0), 0, 0, NVL(HME.HMEVLRPREVIS' +
        'TO, 0)) AS HMEVLREFETIVO             '
      ''
      
        '        FROM                                                    ' +
        '                                     '
      
        '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,                 ' +
        '                                     '
      
        '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC               ' +
        '                                     '
      
        '        WHERE                                                   ' +
        '                                     '
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      ''
      
        '             AND (:PABONOCONTAB = 0 OR HME.PLNCODIGOESTORNO   IS' +
        ' NOT NULL)'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )                               '
      
        '           AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )                           '
      ''
      '           AND NVL(HME.FLGABONADO, 0) = 1'
      ''
      
        '           AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :' +
        'PHMEDATAFIM'
      ''
      
        '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO      ' +
        '                                     '
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      
        '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO   ' +
        '                                     '
      
        '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO        ' +
        '                                     '
      
        '        ) CON                                                   ' +
        '                                     '
      
        '     WHERE                                                      ' +
        '                                     '
      
        '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO             ' +
        '                                  '
      
        '     GROUP BY                                                   ' +
        '                                     '
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONOCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryItensAbonadosIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryItensAbonadosABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryItensAbonadosTOT_ABONADO: TFloatField
      FieldName = 'TOT_ABONADO'
    end
  end
  object qryItensQuitados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT'
      
        '        A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS Q' +
        'UITADO,'
      '        NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_QUITADO'
      '     FROM'
      '        TIPOCONTREMPTMO A,'
      '        ('
      '        SELECT'
      
        '           TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOE' +
        'MPTMO,'
      '           TC.IDTIPOCONTREMPTMO,'
      ''
      
        '           DECODE(NVL(FLGQUITADO, 0), 0, 0, NVL(HME.HMEVLRPREVIS' +
        'TO, 0)) AS HMEVLREFETIVO'
      ''
      '        FROM'
      '           HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '        WHERE'
      '               C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '           AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO ' +
        '= 1) )'
      
        '           AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )'
      ''
      '           AND NVL(HME.FLGQUITADO, 0) = 1'
      ''
      
        '           AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :' +
        'PHMEDATAFIM'
      ''
      '           AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '           AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '           AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '           AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '        ) CON'
      '     WHERE'
      '        A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '     GROUP BY'
      '        A.IDTIPOCONTREMPTMO'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryItensQuitadosIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryItensQuitadosQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryItensQuitadosTOT_QUITADO: TFloatField
      FieldName = 'TOT_QUITADO'
    end
  end
end
