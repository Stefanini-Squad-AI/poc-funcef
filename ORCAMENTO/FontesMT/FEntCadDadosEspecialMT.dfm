inherited frmEntCadDadosEspecialMT: TfrmEntCadDadosEspecialMT
  Left = 316
  Top = 233
  Caption = 'Entrada de Dados Especial'
  ClientHeight = 436
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    Height = 397
    object lblExercicio: TLabel
      Left = 30
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblPeriodo: TLabel
      Left = 136
      Top = 9
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object lblCriterio: TLabel
      Left = 30
      Top = 132
      Width = 100
      Height = 13
      Caption = 'Critério de Rateio'
    end
    object Label21: TLabel
      Left = 30
      Top = 49
      Width = 105
      Height = 13
      Caption = 'Plano de Trabalho'
    end
    object lblValBase: TLabel
      Left = 252
      Top = 132
      Width = 100
      Height = 13
      Caption = 'Valor para Rateio'
    end
    object Label1: TLabel
      Left = 30
      Top = 183
      Width = 63
      Height = 13
      Caption = 'Acumulado'
    end
    object dbgrdSaldo: TwwDBGrid
      Left = 1
      Top = 240
      Width = 598
      Height = 156
      TabStop = False
      Selected.Strings = (
        'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
        'NOME'#9'30'#9'Nome do Centro de Custo'#9'F'
        'VLRRATEIOORI'#9'17'#9'Valor Rateio Inicial'#9'F'
        'VLRORCADO'#9'17'#9'Valor Orçado'#9'F'
        'IDCONTAORCAMEN'#9'17'#9'Conta Orçamentária'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsSaldo
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 7
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
      Top = 148
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
    object dblcCriterio: TCMDBLookupCombo
      Tag = 888
      Left = 30
      Top = 148
      Width = 200
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição'#9'F')
      LookupTable = cdsCriterio
      LookupField = 'IDCRITERIORATORC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCriterioCloseUp
    end
    object dblcPlanoTrabalho: TwwDBLookupCombo
      Tag = 888
      Left = 30
      Top = 65
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
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcPlanoTrabalhoCloseUp
    end
    object pnlPlanoPatroP: TPanel
      Left = 19
      Top = 88
      Width = 562
      Height = 44
      BevelOuter = bvNone
      TabOrder = 3
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
      Top = 134
      Width = 136
      Height = 29
      Caption = '&Calcular'
      TabOrder = 6
      OnClick = BtCalcClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777700000000000000766444444444444406E6666666666
        66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
        66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
        EE60766666666666666777777777777777777777777777777777}
    end
    object dblcExercicio: TwwDBLookupCombo
      Tag = 888
      Left = 30
      Top = 23
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
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcExercicioCloseUp
    end
    object dblcPeriodo: TwwDBLookupCombo
      Tag = 888
      Left = 136
      Top = 23
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
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcPeriodoCloseUp
    end
    object pnlValores: TPanel
      Left = 1
      Top = 207
      Width = 598
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
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
          '      0,00')
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
      Top = 179
      Width = 141
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'sttAcumuladoOri'
      TabOrder = 9
    end
    object sttAcumulado: TStaticText
      Left = 252
      Top = 179
      Width = 160
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'sttAcumulado'
      TabOrder = 10
    end
    object bbtnZerar: TBitBtn
      Tag = 888
      Left = 434
      Top = 168
      Width = 136
      Height = 29
      Caption = 'Zerar Valor Orçado'
      TabOrder = 11
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
    object dbeGrupo: TCMProcuraMask
      Tag = 888
      Left = 336
      Top = 12
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
    Top = 397
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520010
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
    Left = 195
    Top = 226
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforeEdit = cdsSaldoBeforeEdit
    AfterPost = cdsSaldoAfterPost
    Left = 152
    Top = 225
    object cdsSaldoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object cdsSaldoNOME: TStringField
      DisplayLabel = 'Nome do Centro de Custo'
      FieldName = 'NOME'
      Size = 30
    end
    object cdsSaldoVLRRATEIOORI: TCurrencyField
      DisplayLabel = 'Valor Rateio Inicial'
      FieldName = 'VLRRATEIOORI'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsSaldoVLRORCADO: TCurrencyField
      DisplayLabel = 'Valor Orçado'
      FieldName = 'VLRORCADO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsSaldoIDCONTAORCAMEN: TStringField
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
    object cdsSaldoNOMECONTAORCAMEN: TStringField
      FieldName = 'NOMECONTAORCAMEN'
      Size = 100
    end
    object cdsSaldoIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
    end
    object cdsSaldoFLGSINALCONTA: TStringField
      FieldName = 'FLGSINALCONTA'
      Size = 1
    end
    object cdsSaldoFATORRATEIO: TFloatField
      FieldName = 'FATORRATEIO'
    end
    object cdsSaldoVALORCC: TCurrencyField
      FieldName = 'VALORCC'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 256
  end
  object cdsValorCCustAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 288
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 448
    Top = 56
  end
  object cdsCompOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 352
  end
  object cdsValorCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 224
  end
  object cdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 264
  end
  object cdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 296
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 336
  end
  object cdsPatroConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 368
  end
  object cdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 440
    Top = 240
  end
  object cdsPlanoPrevConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 440
    Top = 280
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 320
  end
  object cdsContaSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 360
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
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 521
    Top = 54
  end
  object dtsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 481
    Top = 56
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC, FL' +
        'GSINALGRUPO'
      'FROM'
      '  GRUPOORCAMEN'
      'WHERE'
      '  (RTRIM(CODGRUPOORC) = :CODGRUPOORC) AND'
      '  (IDPLANOORCAMEN = :iPlanoOrc)'
      ''
      ' ')
    ClientDataSet = cdsGrupo
    Left = 414
    Top = 56
  end
end
