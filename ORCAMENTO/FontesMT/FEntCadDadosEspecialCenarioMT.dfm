inherited frmEntCadDadosEspecialCenarioMT: TfrmEntCadDadosEspecialCenarioMT
  Left = 80
  Top = 43
  HelpContext = 520010
  Caption = 'Entrada de Dados Especial por Cenário'
  ClientHeight = 473
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    Height = 434
    object lblExercicio: TLabel
      Left = 30
      Top = 47
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblPeriodo: TLabel
      Left = 136
      Top = 47
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object lblCriterio: TLabel
      Left = 30
      Top = 170
      Width = 100
      Height = 13
      Caption = 'Critério de Rateio'
    end
    object Label21: TLabel
      Left = 30
      Top = 87
      Width = 105
      Height = 13
      Caption = 'Plano de Trabalho'
    end
    object lblValBase: TLabel
      Left = 252
      Top = 170
      Width = 100
      Height = 13
      Caption = 'Valor para Rateio'
    end
    object Label1: TLabel
      Left = 30
      Top = 221
      Width = 63
      Height = 13
      Caption = 'Acumulado'
    end
    object lblCenario: TLabel
      Left = 30
      Top = 7
      Width = 44
      Height = 13
      Caption = 'Cenário'
    end
    object dbgrdSaldo: TwwDBGrid
      Left = 1
      Top = 277
      Width = 598
      Height = 156
      TabStop = False
      Selected.Strings = (
        'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
        'NOME'#9'30'#9'Nome do Centro de Custo'#9'F'
        'VLRRATEIOORI'#9'17'#9'Valor Rateio Inicial'#9'F'
        'VLRORCADO'#9'17'#9'Valor Orçado'#9'F'
        'IDCONTAORCAMEN'#9'20'#9'Conta Orçamentária'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsSaldo
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 8
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdSaldoCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdSaldoTopRowChanged
    end
    object redValorBase: TRealEdit
      Tag = 888
      Left = 252
      Top = 186
      Width = 160
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object dblcPlanoTrabalho: TwwDBLookupCombo
      Tag = 888
      Left = 30
      Top = 103
      Width = 285
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Descrição'#9'F'
        'IDPLANOTRABALHO'#9'5'#9'Código'#9'F'
        'NOMECR'#9'15'#9'Centro de Responsabilidade'#9'F'
        'NOMEUN'#9'12'#9'Nome da Atividade/Projeto'#9'F')
      LookupTable = cdsPlanoTrabalho
      LookupField = 'IDPLANOTRABALHO'
      Options = [loColLines]
      Style = csDropDownList
      DropDownCount = 5
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcPlanoTrabalhoCloseUp
    end
    object pnlPlanoPatroP: TPanel
      Left = 19
      Top = 126
      Width = 562
      Height = 44
      BevelOuter = bvNone
      TabOrder = 4
      object Label22: TLabel
        Left = 11
        Top = 3
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label23: TLabel
        Left = 292
        Top = 3
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dblcPlanoParamConta: TwwDBLookupCombo
        Tag = 888
        Left = 11
        Top = 18
        Width = 259
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        LookupTable = cdsPlanoPrevConta
        LookupField = 'IDPLANOPREV'
        Options = [loColLines]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcPlanoParamContaCloseUp
      end
      object dblcPatroParamConta: TwwDBLookupCombo
        Tag = 888
        Left = 292
        Top = 18
        Width = 259
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        LookupTable = cdsPatroConta
        LookupField = 'IDPESSOA'
        Options = [loColLines]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcPatroParamContaCloseUp
      end
    end
    object BtCalc: TBitBtn
      Tag = 888
      Left = 434
      Top = 172
      Width = 136
      Height = 29
      Caption = '&Calcular'
      TabOrder = 6
      OnClick = BtCalcClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object dblcExercicio: TwwDBLookupCombo
      Tag = 888
      Left = 30
      Top = 61
      Width = 84
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'7'#9'Exercício'#9'F')
      LookupTable = cdsExercicio
      LookupField = 'EXERCICIO'
      Options = [loColLines]
      Style = csDropDownList
      DropDownCount = 5
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcExercicioCloseUp
    end
    object dblcPeriodo: TwwDBLookupCombo
      Tag = 888
      Left = 136
      Top = 61
      Width = 179
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'15'#9'Período'#9'F'
        'PERIODO'#9'5'#9'Número'#9'F')
      LookupTable = cdsPeriodo
      LookupField = 'PERIODO'
      Options = [loColLines]
      Style = csDropDownList
      DropDownCount = 5
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcPeriodoCloseUp
    end
    object pnlValores: TPanel
      Left = 1
      Top = 244
      Width = 598
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 9
      object dblblNomeCentroCusto: TDBText
        Left = 188
        Top = 8
        Width = 199
        Height = 17
        Color = clCaptionText
        DataField = 'NOME'
        DataSource = dsSaldo
        ParentColor = False
      end
      object dblblCodCentroCusto: TDBText
        Left = 25
        Top = 8
        Width = 141
        Height = 17
        Color = clCaptionText
        DataField = 'CODCENTROCUSTO'
        DataSource = dsSaldo
        ParentColor = False
      end
      object dbreValorCentCust: TDBRealEdit
        Left = 409
        Top = 6
        Width = 156
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        OnEnter = dbreValorCentCustEnter
        OnExit = dbreValorCentCustExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRORCADO'
        DataSource = dsSaldo
      end
    end
    object sttAcumuladoOri: TStaticText
      Left = 100
      Top = 217
      Width = 141
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'sttAcumuladoOri'
      TabOrder = 10
    end
    object sttAcumulado: TStaticText
      Left = 252
      Top = 217
      Width = 160
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'sttAcumulado'
      TabOrder = 11
    end
    object bbtnZerar: TBitBtn
      Tag = 888
      Left = 434
      Top = 206
      Width = 136
      Height = 29
      Caption = 'Zerar Valor Orçado'
      TabOrder = 7
      OnClick = bbtnZerarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object dblcCenario: TCMDBLookupCombo
      Tag = 888
      Left = 30
      Top = 23
      Width = 539
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMECENARIO'#9'60'#9'Nome do Cenário')
      LookupTable = cdsCenario
      LookupField = 'IDCENARIOORCAMEN'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeGrupo: TCMProcuraMask
      Tag = 888
      Left = 335
      Top = 49
      Width = 233
      Height = 77
      Caption = ' Grupo '
      TabOrder = 12
      OnExit = dbeGrupoExit
      MostraMensagens = True
      MostraDescricao = True
      Mensagens.EmBranco = 'Grupo não pode estar em branco'
      Mensagens.NaoExiste = 'Grupo não existe'
      Mensagens.Sintetica = 'Grupo não pode ser sintético'
      Mensagens.Analitica = 'Grupo não pode ser analítico'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      MontaSelect = MontaSelectGrupo
      LookupQuery = cdsGrupo
      LookupSQLParams = sqlGrupo
      LookupParam = 'CODGRUPOORC'
      LookupChave = 'CODGRUPOORC'
      LookupTipo = 'FLGANALSINT'
      LookupDescricao = 'NOMEGRUPOORCAMEN'
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520075
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 135
      DockPos = 135
      inherited bbtnConfirmar: TBitBtn
        Tag = 888
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  object dblcCriterio1: TDBLookupComboBox [2]
    Left = 30
    Top = 186
    Width = 200
    Height = 21
    KeyField = 'IDCRITERIORATORC'
    ListField = 'DESCRICAO'
    ListSource = dtsCriterio
    TabOrder = 2
    OnCloseUp = dblcCriterio1CloseUp
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 253
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsSaldo: TwwDataSource
    AutoEdit = False
    DataSet = cdsSaldo
    Left = 187
    Top = 226
  end
  object sqlSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.CODCENTROCUSTO,   CC.NOME,          C.FLGSINALCONTA,'
      '  C.IDCONTAORCAMEN,   C.IDPLANOORCAMEN, C.NOMECONTAORCAMEN,'
      
        '  V.IDCRITERIORATORC, 0 AS VALORCC,     NVL( SUM( V.VLRORCCENARI' +
        'O ), 0 ) AS VLRORCADO,'
      
        '  NVL( SUM( V.VLRRATEIOORI ), 0 ) AS VLRRATEIOORI, 0 AS FATORRAT' +
        'EIO'
      'FROM'
      '  CONTASORCAMEN C, CENTCUST CC, VALORESCENARIO V'
      'WHERE'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  (C.IDPESSOA = :IDPESSOA) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      '  ( C.CODCENTROCUSTO = CC.CODCENTROCUSTO )      AND'
      '  ( C.IDEMPRESA = CC.IDEMPRESA )                AND'
      '  ( C.TIPOCALCORCADO = '#39'V'#39' )                    AND'
      '  ( CC.ATIVO = '#39'S'#39' )                            AND'
      '  ( V.IDPESSOA        (+) = C.IDPESSOA )        AND'
      '  ( V.IDCONTAORCAMEN  (+) = C.IDCONTAORCAMEN )  AND'
      '  ( V.IDPLANOORCAMEN  (+) = C.IDPLANOORCAMEN )  AND'
      '  ( V.EXERCICIO       (+) = :EXERCICIO )        AND'
      '  ( V.IDCENARIOORCAMEN(+) = :IDCENARIOORCAMEN ) AND'
      '  :PERIODO'
      'GROUP BY'
      '  C.CODCENTROCUSTO, CC.NOME, C.FLGSINALCONTA, C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN, C.NOMECONTAORCAMEN, V.IDCRITERIORATORC'
      'ORDER BY'
      '  C.CODCENTROCUSTO'
      ' '
      ' ')
    OnFormartParam = sqlSaldoFormartParam
    ClientDataSet = cdsSaldo
    Left = 113
    Top = 271
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforeEdit = cdsSaldoBeforeEdit
    AfterPost = cdsSaldoAfterPost
    Left = 145
    Top = 271
    object cdsSaldoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object cdsSaldoNOME: TStringField
      DisplayLabel = 'Nome do Centro de Custo'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object cdsSaldoVLRRATEIOORI: TCurrencyField
      DisplayLabel = 'Valor Rateio Inicial'
      DisplayWidth = 17
      FieldName = 'VLRRATEIOORI'
    end
    object cdsSaldoVLRORCADO: TCurrencyField
      DisplayLabel = 'Valor Orçado'
      DisplayWidth = 17
      FieldName = 'VLRORCADO'
    end
    object cdsSaldoIDCONTAORCAMEN: TStringField
      DisplayLabel = 'Conta Orçamentária'
      DisplayWidth = 20
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
    object cdsSaldoNOMECONTAORCAMEN: TStringField
      FieldName = 'NOMECONTAORCAMEN'
      Visible = False
      Size = 100
    end
    object cdsSaldoIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
      Visible = False
    end
    object cdsSaldoFLGSINALCONTA: TStringField
      FieldName = 'FLGSINALCONTA'
      Visible = False
      Size = 1
    end
    object cdsSaldoFATORRATEIO: TFloatField
      FieldName = 'FATORRATEIO'
      Visible = False
    end
    object cdsSaldoVALORCC: TCurrencyField
      FieldName = 'VALORCC'
      Visible = False
    end
    object cdsSaldoIDCRITERIORATORC: TFloatField
      FieldName = 'IDCRITERIORATORC'
    end
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PO.PERIODO,'
      '  PO.DATAINIPERIODO,'
      '  PO.DATAFIMPERIODO,'
      '  PO.NOMEPERIODO'
      'FROM'
      '  PERIODOORCAMEN PO'
      'WHERE'
      '  ( PO.IDPESSOA         = :IDPESSOA )    AND'
      '  ( PO.EXERCICIO        = :IDEXERCICIO ) AND'
      '  ( ( PO.FLGBLOQUEADO = '#39'N'#39' ) OR ( PO.FLGBLOQUEADO IS NULL ) )'
      'UNION'
      'SELECT DISTINCT'
      '  0 as PERIODO,'
      '  SYSDATE AS DATAINIPERIODO,'
      '  SYSDATE AS DATAFIMPERIODO,'
      '  '#39'Anual'#39' As NOMEPERIODO'
      'FROM'
      '  PERIODOORCAMEN P1'
      'WHERE'
      '  ( P1.IDPESSOA = :IDPESSOA)    AND'
      '  ( P1.EXERCICIO = :EXERCICIO ) AND'
      '  ( ( P1.FLGBLOQUEADO = '#39'N'#39' ) OR ( P1.FLGBLOQUEADO IS NULL ) )'
      'ORDER BY'
      '  PERIODO'
      ' ')
    ClientDataSet = cdsPeriodo
    Left = 113
    Top = 303
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 145
    Top = 303
  end
  object sqlValorCCustAux: TCMSqlParams
    ClientDataSet = cdsValorCCustAux
    Left = 113
    Top = 335
  end
  object cdsValorCCustAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 145
    Top = 335
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC, FL' +
        'GSINALGRUPO'
      'FROM'
      '  GRUPOORCAMEN'
      'WHERE'
      '  (RTRIM(CODGRUPOORC) = :CODGRUPOORC)  AND'
      '  (IDPLANOORCAMEN = :iPlanoOrc)'
      '')
    ClientDataSet = cdsGrupo
    Left = 393
    Top = 95
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 425
    Top = 95
  end
  object sqlCompOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DISTINCT CC.PLACONTA'
      'FROM'
      '  CONTASORCAMEN C, COMPCONTASORCAMEN CC'
      'WHERE'
      
        '  (CC.PLACONTA IS NOT NULL) AND (C.IDCONTAORCAMEN = CC.IDCONTAOR' +
        'CAMEN) AND'
      '  (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      '')
    OnFormartParam = sqlCompOrcamenFormartParam
    ClientDataSet = cdsCompOrcamen
    Left = 113
    Top = 399
  end
  object cdsCompOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 145
    Top = 399
  end
  object sqlValorCentCust: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SUM(VLRCRIRATORC) AS VLRCRIRATORC'
      'FROM'
      '  VALORCRIRATORC'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND(EXERCICIO = :EXERCICIO) AND :PERIOD' +
        'O AND'
      
        '  (CODCENTROCUSTO = :CODCENTROCUSTO) AND (IDEMPRESA = :IDEMPRESA' +
        ') AND'
      '  (IDCRITERIORATORC = :IDCRITERIORATORC)'
      '')
    OnFormartParam = sqlValorCentCustFormartParam
    ClientDataSet = cdsValorCentCust
    Left = 246
    Top = 271
  end
  object cdsValorCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 278
    Top = 271
  end
  object sqlPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DISTINCT O.DESCRICAO, O.IDPLANOTRABALHO, O.UNIDNEGOC, U.NOME A' +
        'S NOMEUN,'
      '  CR.NOME AS NOMECR'
      'FROM'
      
        '  PLANOTRABALHOORC O, PESSOAXCRESP C, CENTRESPON CR, UNIDNEGOCIO' +
        ' U'
      'WHERE'
      
        '  (O.CODCENTRORESPON = C.CODCENTRORESPON ) AND (O.IDPESSOA = C.I' +
        'DPESSOA) AND'
      
        '  (C.IDPESSOAACESSO = :IDUSUARIO) AND (C.IDPESSOA = :IDPESSOA) A' +
        'ND'
      
        '  (CR.CODCENTRORESPON = O.CODCENTRORESPON) AND (CR.IDPESSOA = O.' +
        'IDPESSOA) AND'
      '  (U.UNIDNEGOC = O.UNIDNEGOC) AND (U.IDPESSOA = O.IDPESSOA) and'
      
        '  (:DATA >= To_Date('#39'01/'#39'||O.PERIODOINI||'#39'/'#39'||O.EXERCICIOINI,'#39'DD' +
        '/MM/YYYY'#39')) and'
      
        '  (:DATA <= To_Date('#39'01/'#39'||O.PERIODOFIM||'#39'/'#39'||O.EXERCICIOFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      'ORDER BY'
      '  O.DESCRICAO'
      ''
      '')
    ClientDataSet = cdsPlanoTrabalho
    Left = 246
    Top = 303
  end
  object cdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 278
    Top = 303
  end
  object sqlCriterio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCRITERIORATORC, C.DESCRICAO, C.TIPORATEIO, C.IDDATAVIEW, C' +
        '.PERNUMERO,'
      '  C.PEREXERCICIO, P.PERDATINI, P.PERDATFIM'
      'FROM'
      '  CRITERIORATORC C, PERIODO P'
      'WHERE'
      
        '  (C.IDPESSOA = :IDPESSOA) AND (C.PERNUMERO = P.PERNUMERO(+)) AN' +
        'D'
      
        '  (C.PEREXERCICIO = P.PEREXERCICIO(+)) AND (C.IDPESSOA = P.IDPES' +
        'SOA(+))'
      'ORDER BY'
      '  C.DESCRICAO'
      '')
    ClientDataSet = cdsCriterio
    Left = 246
    Top = 335
  end
  object cdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 278
    Top = 335
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  ABS(SUM(PLSCREDITOCOR - PLSDEBITOCORRENTE)) AS SALDOCONTAB'
      'FROM'
      '  PLANOSALDO'
      'WHERE'
      
        '  (PERNUMERO = :PERNUMERO) AND (PEREXERCICIO = :PEREXERCICIO) AN' +
        'D'
      '  (IDPESSOA = :IDPESSOA) AND :PLACONTA'
      '')
    OnFormartParam = sqlSaldoContabilFormartParam
    ClientDataSet = cdsSaldoContabil
    Left = 246
    Top = 367
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 278
    Top = 367
  end
  object sqlPatroConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  P.NOME, PT.IDPESSOA'
      'FROM'
      '  PESSOA P, PATRO PT'
      'WHERE'
      '  (P.IDPESSOA = PT.IDPESSOA)   '
      '')
    ClientDataSet = cdsPatroConta
    Left = 246
    Top = 399
  end
  object cdsPatroConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 278
    Top = 399
  end
  object sqlDataView: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NAME, IDDATAVIEW, CLASSNAME, ORIGEMCMDV, TEMPLATE, DESCRIPTION'
      'FROM'
      '  DATAVIEW'
      'WHERE'
      '  (IDDATAVIEW = :IDDATAVIEW) AND (ORIGEMCMDV = '#39'0'#39')'
      '')
    ClientDataSet = cdsDataView
    Left = 367
    Top = 303
  end
  object cdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 399
    Top = 303
  end
  object sqlPlanoPrevConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      'FROM'
      '  PLANPREVCONTABIL'
      'ORDER BY'
      '  NOME'
      '')
    ClientDataSet = cdsPlanoPrevConta
    Left = 367
    Top = 335
  end
  object cdsPlanoPrevConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 399
    Top = 335
  end
  object sqlExercicio: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  EXERCICIO'
      'FROM'
      '  PERIODOORCAMEN PO'
      'WHERE'
      '  ( PO.IDPESSOA         = :IDPESSOA )     AND'
      '  ( ( PO.FLGBLOQUEADO = '#39'N'#39' ) OR ( PO.FLGBLOQUEADO IS NULL ) )'
      'ORDER BY'
      '  EXERCICIO'
      '')
    ClientDataSet = cdsExercicio
    Left = 367
    Top = 367
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 399
    Top = 367
  end
  object sqlContaSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDVALORESCENARIO'
      'FROM'
      '  VALORESCENARIO'
      'WHERE'
      '  ( IDPESSOA         = :IDPESSOA )         AND'
      '  ( IDPLANOORCAMEN   = :IDPLANOORCAMEN )   AND'
      '  ( IDCENARIOORCAMEN = :IDCENARIOORCAMEN ) AND'
      '  ( IDCONTAORCAMEN   = :IDCONTAORCAMEN )   AND'
      '  ( EXERCICIO        = :EXERCICIO )        AND'
      '  ( PERIODO          = :PERIODO )')
    ClientDataSet = cdsContaSaldo
    Left = 367
    Top = 399
  end
  object cdsContaSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 399
    Top = 399
  end
  object MontaSelectGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.FLGANALSINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'A/S')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.IDGRUPOORCAMEN')
    Filtro.Strings = (
      'FLGANALSINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 529
    Top = 22
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCENARIOORCAMEN, NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN'
      'ORDER BY'
      '  NOMECENARIO')
    ClientDataSet = cdsCenario
    Left = 368
    Top = 271
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 399
    Top = 271
  end
  object dtsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 460
    Top = 94
  end
  object dtsCriterio: TDataSource
    DataSet = cdsCriterio
    Left = 312
    Top = 336
  end
end
