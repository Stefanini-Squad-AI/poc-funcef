inherited cfgRelFechamentoCarteiraCaixa: TcfgRelFechamentoCarteiraCaixa
  Left = 74
  Top = 129
  Caption = 'Resumo da Carteira (visão Caixa)'
  ClientHeight = 440
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 622
    Height = 407
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
    object Panel1: TPanel
      Left = 320
      Top = 216
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 193
      TabOrder = 8
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
      Top = 284
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
      TabOrder = 4
    end
    object chkAbonoContab: TCheckBox
      Left = 24
      Top = 304
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
      TabOrder = 5
    end
    object chkRenovacao: TCheckBox
      Left = 328
      Top = 304
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
      TabOrder = 6
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 88
      Height = 119
      TabOrder = 9
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 99
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 450
      DockPos = 522
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 278
      DockPos = 350
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
    Left = 104
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
      '  TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 104
    Top = 176
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
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARC' +
        'ELAS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      C.IDTIPOCONTREMPTMO, C.IDCONTRATOEMPTMO, HME.HMEVLRPREVIST' +
        'O'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 1'
      '      AND HME.HMEPARCELA         > 0'
      '      AND HME.HMESEQCOBRANCA     = 1'
      '      AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 64
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
    object qryParcelasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcelasPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryParcelasTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
  end
  object qryEncargos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCA' +
        'RGOS,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC'
      'FROM'
      '   ('
      '   SELECT '
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND ('
      '           (:PAPROPRIADO IS NULL) OR (:PAPROPRIADO = 1 AND'
      '                                      ('
      
        '                                       (NVL(HME.FLGABONADO, 0) =' +
        ' 0) OR'
      
        '                                       (NVL(HME.FLGABONADO, 0) =' +
        ' 1 AND HME.PLNCODIGO IS NOT NULL)'
      '                                      )'
      '                                     )'
      '          )'
      '      AND HME.HMETIPOMOV         = 4'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPRIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAPROPRIADO'
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
    object qryEncargosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryEncargosENCARGOS: TFloatField
      FieldName = 'ENCARGOS'
    end
    object qryEncargosTOTALENC: TFloatField
      FieldName = 'TOTALENC'
    end
  end
  object qryAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO'
      'FROM'
      '   ('
      '   SELECT '
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 2'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 96
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
    object qryAmortizacaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAmortizacaoAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryAmortizacaoTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
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
    Left = 200
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
  object qryParcRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_P' +
        'ARC,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_PARC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '       C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 80
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
    object qryParcRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcRecREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryParcRecTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
  end
  object qryEncRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_E' +
        'NC,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_ENC'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 4'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 98
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
    object qryEncRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryEncRecREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryEncRecTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
  end
  object qryAmoRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_A' +
        'MORT,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_AMORT'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         = 2'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 114
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
    object qryAmoRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAmoRecREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryAmoRecTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
  end
  object qryQuiRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS REC_Q' +
        'UIT,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_REC_QUIT'
      'FROM'
      '   ('
      '   SELECT'
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO,'
      '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMEORIGEM         <> 0'
      '      AND HMETIPOMOV             = 3'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO =' +
        ' 0) )'
      
        '      AND HME.HMEDATAEFETIVA    BETWEEN :PHMEDATAINI AND :PHMEDA' +
        'TAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 136
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
    object qryQuiRecIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuiRecREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryQuiRecTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
  end
  object qryItensAbonados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS AB' +
        'ONADO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_ABONADO'
      '   FROM'
      '      ('
      '      SELECT '
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO, '
      '         TC.IDTIPOCONTREMPTMO, '
      
        '         DECODE(NVL(FLGABONADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO' +
        ', 0)) AS HMEVLREFETIVO '
      '      FROM '
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '         AND ((:PABONOCONTAB IS NULL) OR (:PABONOCONTAB = 1 AND ' +
        'HME.PLNCODIGOESTORNO   IS NOT NULL))'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      
        '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNAD' +
        'O = 0) )'
      '         AND NVL(HME.FLGABONADO, 0) = 1'
      
        '         AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :PH' +
        'MEDATAFIM'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '
      '      ) CON'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 144
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
    object qryItensAbonadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
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
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLREFETIVO), 0) AS QU' +
        'ITADO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOT_QUITADO'
      '   FROM '
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO,'
      
        '         DECODE(NVL(FLGQUITADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO' +
        ', 0)) AS HMEVLREFETIVO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )'
      
        '         AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNAD' +
        'O = 0) )'
      '         AND NVL(HME.FLGQUITADO, 0) = 1'
      
        '         AND HME.HMEDATAQUITABONO   BETWEEN :PHMEDATAINI AND :PH' +
        'MEDATAFIM'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO '
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO '
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO '
      '      ) CON '
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 120
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
    object qryItensQuitadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensQuitadosQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryItensQuitadosTOT_QUITADO: TFloatField
      FieldName = 'TOT_QUITADO'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT' +
        'ACAO,'
      '   NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI'
      'FROM'
      '   ('
      '   SELECT '
      
        '      TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO' +
        ','
      '      TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '   WHERE'
      '          C.IDCONTRATOEMPTMO     = :PIDCONTRATOEMPTMO'
      '      AND HME.HMEORIGEM         <> 0'
      '      AND HME.HMETIPOMOV         = 3'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      ''
      
        '      AND (:PCONSIDERARENOVA IS NULL OR (:PCONSIDERARENOVA = 1 A' +
        'ND HME.HMEORIGEM         <> 0))'
      ''
      '   ) CON'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 112
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
      end
      item
        DataType = ftInteger
        Name = 'PCONSIDERARENOVA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCONSIDERARENOVA'
        ParamType = ptInput
      end>
    object qryQuitacaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuitacaoQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryQuitacaoTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
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
    Left = 200
    Top = 192
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
end
