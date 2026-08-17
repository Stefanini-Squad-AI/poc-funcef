inherited frmBuscaContabilMT: TfrmBuscaContabilMT
  Left = 120
  Top = 196
  HelpContext = 520005
  Caption = 'Busca Dados Contábeis para Orçamento'
  ClientHeight = 400
  ClientWidth = 770
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 8
    Top = 318
    Width = 317
    Height = 13
    AutoSize = False
    Caption = 'lblLegenda'
    Visible = False
  end
  inherited pnlFundo: TPanel
    Width = 770
    Height = 361
    object lblExercicio: TLabel
      Left = 19
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblHoraIni: TLabel
      Left = 19
      Top = 275
      Width = 69
      Height = 13
      Caption = 'Hora Início:'
    end
    object lblHoraFim: TLabel
      Left = 19
      Top = 292
      Width = 55
      Height = 13
      Caption = 'Hora Fim:'
    end
    object spnedExercicio: TSpinEdit
      Left = 19
      Top = 26
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnExit = spnedExercicioExit
    end
    object pbAguarde: TProgressBar
      Left = 1
      Top = 339
      Width = 768
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 4
    end
    object gbPeriodo: TGroupBox
      Left = 19
      Top = 157
      Width = 310
      Height = 106
      Caption = 'Período'
      TabOrder = 2
      object lblDestino: TLabel
        Left = 11
        Top = 59
        Width = 28
        Height = 13
        Caption = 'Final'
      end
      object lblOrigem: TLabel
        Left = 11
        Top = 17
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object dblcPeriodoIni: TCMDBLookupCombo
        Left = 11
        Top = 32
        Width = 287
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'Nome'#9'F')
        LookupTable = cdsPeriodoIni
        LookupField = 'PERIODO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPeriodoFim: TCMDBLookupCombo
        Left = 11
        Top = 75
        Width = 287
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'Nome'#9'F')
        LookupTable = cdsPeriodoFim
        LookupField = 'PERIODO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object cbCenarios: TCheckBox
      Left = 110
      Top = 31
      Width = 156
      Height = 17
      Caption = 'Busca para os Cenários'
      TabOrder = 1
    end
    object pcSaldoAnterior: TPageControl
      Left = 19
      Top = 51
      Width = 732
      Height = 102
      ActivePage = tbsSaldoAnterior
      TabOrder = 5
      object tbsSaldoAnterior: TTabSheet
        Caption = 'Saldo Anterior'
        object Label3: TLabel
          Left = 12
          Top = 32
          Width = 83
          Height = 13
          Caption = 'Período Limite'
        end
        object Label1: TLabel
          Left = 320
          Top = 8
          Width = 145
          Height = 13
          Caption = 'Conta para Encerramento'
        end
        object cbBuscaSaldoAnterior: TCheckBox
          Left = 12
          Top = 8
          Width = 148
          Height = 17
          Caption = 'Busca Saldo Anterior'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object dblcPeriodoLimite: TCMDBLookupCombo
          Left = 12
          Top = 46
          Width = 287
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'66'#9'NOME'#9'F')
          LookupTable = cdsPeriodoLim
          LookupField = 'PERNUMERO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object edtCodigoConta: TEdit
          Left = 320
          Top = 22
          Width = 125
          Height = 21
          TabOrder = 2
          OnExit = edtCodigoContaExit
        end
        object bbtnBuscaConta: TBitBtn
          Left = 446
          Top = 22
          Width = 24
          Height = 21
          Hint = 'Procura a Conta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bbtnBuscaContaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object edtNomeConta: TEdit
          Left = 320
          Top = 46
          Width = 391
          Height = 21
          TabStop = False
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object tbsSaldoAnteriorEsp: TTabSheet
        Caption = 'SaldoAnterior - Transferência de Resultado'
        ImageIndex = 1
        object Label4: TLabel
          Left = 3
          Top = 8
          Width = 110
          Height = 13
          Caption = 'Transferir da Conta'
        end
        object Label6: TLabel
          Left = 371
          Top = 8
          Width = 121
          Height = 13
          Caption = 'Transferir para Conta'
        end
        object edtCodigoContaDe: TEdit
          Left = 3
          Top = 22
          Width = 125
          Height = 21
          TabOrder = 0
          OnExit = edtCodigoContaDeExit
        end
        object bbtnBuscaContaDe: TBitBtn
          Left = 128
          Top = 22
          Width = 24
          Height = 21
          Hint = 'Procura a Conta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnBuscaContaDeClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object edtNomeContaDe: TEdit
          Left = 3
          Top = 46
          Width = 349
          Height = 21
          TabStop = False
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtCodigoContaPara: TEdit
          Left = 371
          Top = 22
          Width = 125
          Height = 21
          TabOrder = 3
          OnExit = edtCodigoContaParaExit
        end
        object bbtnBuscaContaPara: TBitBtn
          Left = 496
          Top = 22
          Width = 24
          Height = 21
          Hint = 'Procura a Conta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnBuscaContaParaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object edtNomeContaPara: TEdit
          Left = 371
          Top = 46
          Width = 349
          Height = 21
          TabStop = False
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object edtLegenda: TEdit
      Left = 5
      Top = 311
      Width = 320
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      TabOrder = 6
      Text = 'edtLegenda'
      Visible = False
      OnChange = edtLegendaChange
    end
    object edtPosicao: TEdit
      Left = 324
      Top = 311
      Width = 67
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      TabOrder = 7
      Text = 'edtPosicao'
      Visible = False
      OnChange = edtPosicaoChange
    end
    object gbParametros: TGroupBox
      Left = 336
      Top = 155
      Width = 415
      Height = 157
      Caption = ' Parâmetros '
      TabOrder = 3
      object Label2: TLabel
        Left = 39
        Top = 17
        Width = 46
        Height = 13
        Caption = 'Posição'
      end
      object Label5: TLabel
        Left = 12
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label7: TLabel
        Left = 69
        Top = 32
        Width = 42
        Height = 13
        Caption = 'Dígitos'
      end
      object Label9: TLabel
        Left = 126
        Top = 32
        Width = 55
        Height = 13
        Caption = 'Conteúdo'
      end
      object sePosIni1: TwwDBSpinEdit
        Left = 12
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object sePosFim1: TwwDBSpinEdit
        Left = 69
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object edConteudo1: TEdit
        Left = 126
        Top = 46
        Width = 277
        Height = 21
        TabOrder = 2
      end
      object sePosIni2: TwwDBSpinEdit
        Left = 12
        Top = 74
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object sePosFim2: TwwDBSpinEdit
        Left = 69
        Top = 74
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 4
        UnboundDataType = wwDefault
      end
      object edConteudo2: TEdit
        Left = 126
        Top = 74
        Width = 277
        Height = 21
        TabOrder = 5
      end
      object sePosIni3: TwwDBSpinEdit
        Left = 12
        Top = 102
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 6
        UnboundDataType = wwDefault
      end
      object sePosFim3: TwwDBSpinEdit
        Left = 69
        Top = 102
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 7
        UnboundDataType = wwDefault
      end
      object edConteudo3: TEdit
        Left = 126
        Top = 102
        Width = 277
        Height = 21
        TabOrder = 8
      end
      object sePosIni4: TwwDBSpinEdit
        Left = 12
        Top = 129
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 9
        UnboundDataType = wwDefault
      end
      object sePosFim4: TwwDBSpinEdit
        Left = 69
        Top = 129
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 10
        UnboundDataType = wwDefault
      end
      object edConteudo4: TEdit
        Left = 126
        Top = 129
        Width = 277
        Height = 21
        TabOrder = 11
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 770
    inherited tb97Fundo: TToolbar97
      Left = 290
      DockPos = 290
      inherited sep1: TToolbarSep97
        Left = 241
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 324
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 243
        HelpContext = 520005
        TabOrder = 3
      end
      object bbtnEfetiva: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        TabOrder = 2
        OnClick = bbtnEfetivaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555205555
          5555500000005555522205555555500000005555522205555555500000005555
          22222055555550000000555222A220755555500000005522AA5A220555555000
          000052AA5555A20755555000000055555055A220555550000000555500055A20
          7555500000005550505055A207555000000055555050555A2055500000005555
          00055555A207500000005550505555555AAA0000000055505050555555555000
          0000555500055555555550000000555550555555555550000000555555555555
          555550000000}
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Parar'
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 240
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 139
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.CODGRUPOORC'
      'CONTASORCAMEN.CODCENTRORESPON'
      'PLANOORCAMENTARIO.NOMEPLANOORC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado'
      'Nome do Grupo Orçamentário'
      'Código do Grupo Orçamentário'
      'Código do C. Responsabilidade'
      'Plano Orçamentário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN'
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'CONTASORCAMEN.IDGRUPOORCAMEN = GRUPOORCAMEN.IDGRUPOORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN'
      
        '(GRUPOORCAMEN.FLGRESULTADO <> '#39'S'#39') OR (GRUPOORCAMEN.FLGRESULTADO' +
        ' IS NULL) '
      
        '((CONTASORCAMEN.FLGATIVA = '#39'A'#39') OR (CONTASORCAMEN.FLGATIVA IS NU' +
        'LL)) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '60'
      '1'
      '1'
      '60'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 589
    Top = 90
  end
  object sqlPeriodoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO, NOMEPER' +
        'IODO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE '
      '  (EXERCICIO =:EXERCICIO) AND (IDPESSOA =:PESSOA)'
      'ORDER BY'
      '  PERIODO'
      '')
    ClientDataSet = cdsPeriodoIni
    Left = 320
    Top = 8
  end
  object cdsPeriodoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 8
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 520
    Top = 16
  end
  object sqlParamOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCONTAORCRESULT, IDCONTAORCDE, IDCONTAORCPARA'
      'FROM'
      '  PARAMORCAMENTO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)'
      '')
    ClientDataSet = cdsParamOrc
    Left = 680
    Top = 8
  end
  object cdsParamOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 712
    Top = 8
  end
  object cdsComposicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 536
    Top = 197
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 536
    Top = 229
  end
  object sqlPlanoData: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PD.PLANO, PD.DATAINICIO, PD.DATAFIM, PD.PLANOANTERIOR, P.MASCA' +
        'RA'
      'FROM'
      '  PLANODATA PD, PLANO P'
      'WHERE'
      
        '  (:DATA BETWEEN PD.DATAINICIO AND PD.DATAFIM) AND (PD.IDPESSOA=' +
        ' :IDPESSOA) AND'
      '  (PD.PLANO = P.PLANO)'
      '')
    ClientDataSet = cdsPlanoData
    Left = 504
    Top = 261
  end
  object cdsPlanoData: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 536
    Top = 261
  end
  object sqlPeriodoLim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PERNUMERO, PERDATINI, PERDATFIM, PERNOME||'#39'/'#39'||PEREXERCICIO AS' +
        ' NOME,'
      '  PEREXERCICIO'
      'FROM'
      '  PERIODO'
      'WHERE'
      
        '  (PEREXERCICIO = :EXERCICIOANT) AND (IDPESSOA = :PESSOA) AND (P' +
        'ERBLOQUE = '#39'S'#39')'
      'ORDER BY'
      '  PEREXERCICIO, PERNUMERO'
      '')
    ClientDataSet = cdsPeriodoLim
    Left = 504
    Top = 293
  end
  object cdsPeriodoLim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 536
    Top = 293
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 173
  end
  object cdsContabilidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 672
    Top = 205
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 237
  end
  object sqlPeriodoFim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO, NOMEPER' +
        'IODO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (EXERCICIO = :EXERCICIO) AND (IDPESSOA = :PESSOA)'
      'ORDER BY'
      '  PERIODO'
      '')
    ClientDataSet = cdsPeriodoFim
    Left = 632
    Top = 269
  end
  object cdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 672
    Top = 269
  end
  object cdsContasOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 672
    Top = 301
  end
end
