inherited FrmCadTiposAplicMT: TFrmCadTiposAplicMT
  Left = 187
  Top = 168
  HelpContext = 90036
  Caption = 'Cadastro de Tipos de Aplicação'
  ClientHeight = 442
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 356
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 133
      Height = 13
      Caption = 'Código Correspondente'
    end
    object lblDescricao: TLabel
      Left = 12
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeCodigoCorrespondente: TwwDBEdit
      Left = 12
      Top = 24
      Width = 316
      Height = 21
      DataField = 'CODCORRESP'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDescricao: TwwDBEdit
      Left = 12
      Top = 64
      Width = 316
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrTipoResgate: TDBRadioGroup
      Left = 9
      Top = 89
      Width = 128
      Height = 80
      Caption = 'Tipo de Resgate'
      DataField = 'TIPORESGATE'
      DataSource = ds
      Items.Strings = (
        '&Único'
        '&Múltiplos')
      TabOrder = 2
      Values.Strings = (
        'U'
        'M')
    end
    object dbrFixaVariavel: TDBRadioGroup
      Left = 144
      Top = 89
      Width = 185
      Height = 80
      Caption = 'Tipo de Aplicação'
      DataField = 'FIXAVARIAVEL'
      DataSource = ds
      Items.Strings = (
        'Renda &Fixa'
        'Renda &Variável')
      TabOrder = 3
      Values.Strings = (
        'F'
        'V')
    end
    object gbDadosBasicos: TGroupBox
      Left = 337
      Top = 11
      Width = 400
      Height = 158
      Caption = ' Integração com o Fluxo Orçado '
      TabOrder = 4
      object lblUnidNegoc: TLabel
        Left = 9
        Top = 21
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object lblTipoRD: TLabel
        Left = 9
        Top = 66
        Width = 122
        Height = 13
        Caption = 'Tipo de Recebimento'
      end
      object lblCentroRespon: TLabel
        Left = 204
        Top = 21
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lblCentCusto: TLabel
        Left = 204
        Top = 66
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object lblContaOrcRec: TLabel
        Left = 9
        Top = 110
        Width = 179
        Height = 13
        Caption = 'Conta Orçamentária de Receita'
      end
      object lblContaOrcCus: TLabel
        Left = 204
        Top = 109
        Width = 184
        Height = 13
        Caption = 'Conta Orçamentária de Despesa'
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 9
        Top = 37
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Nome'
          'UNECODIGO'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = cdsUnidNeg
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoRD: TwwDBLookupCombo
        Left = 9
        Top = 82
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        DataField = 'CODTIPRECDES'
        DataSource = ds
        LookupTable = cdsTipoRD
        LookupField = 'CODTIPRECDES'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 204
        Top = 37
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTRORESPON'#9'10'#9'Código')
        DataField = 'CODCENTRORESPON'
        DataSource = ds
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCentCusto: TwwDBLookupCombo
        Left = 204
        Top = 82
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTROCUSTO'#9'10'#9'Código')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = cdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcCentCustoChange
      end
      object cmpContaOrcRec: TCMProcura
        Left = 9
        Top = 125
        Width = 191
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDCONTAORCREC'
        LookupChave = 'IDCONTAORCAMEN'
        LookupDescricao = 'IDCONTAORCAMEN'
        MontaSelect = msContaOrcamen
        LookupTabela = 'CM.CONTASORCAMEN'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
      object cmpContaOrcCus: TCMProcura
        Left = 204
        Top = 125
        Width = 191
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDCONTAORCCUS'
        LookupChave = 'IDCONTAORCAMEN'
        LookupDescricao = 'IDCONTAORCAMEN'
        MontaSelect = msContaOrcamen
        LookupTabela = 'CM.CONTASORCAMEN'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
    object gbReaplicacao: TGroupBox
      Left = 12
      Top = 179
      Width = 725
      Height = 166
      Caption = ' Informações Padrões para Aplicação e Reaplicação '
      TabOrder = 5
      object lblMoedaCota: TLabel
        Left = 9
        Top = 23
        Width = 87
        Height = 13
        Caption = 'Moeda da Cota'
      end
      object lblTipoAplic: TLabel
        Left = 9
        Top = 71
        Width = 273
        Height = 13
        Caption = 'Reaplicação (Tipo) em outro Tipo de Aplicação '
      end
      object lblPrazoResg: TLabel
        Left = 9
        Top = 119
        Width = 84
        Height = 13
        Caption = 'Prazo Resgate'
      end
      object lblTxPrev: TLabel
        Left = 102
        Top = 119
        Width = 103
        Height = 13
        Caption = 'Tx. Juros Prevista'
      end
      object dblcMoeda: TCMDBLookupCombo
        Left = 9
        Top = 36
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Moeda'#9'F')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = cdsMoedas
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoAplic: TCMDBLookupCombo
        Left = 9
        Top = 86
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Tipo de Aplicação'#9'F')
        DataField = 'TIPOAPLICSUBST'
        DataSource = ds
        LookupTable = cdsTiposAplicAux
        LookupField = 'TIPOAPLICACAO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbrePrazoResgate: TDBRealEdit
        Left = 9
        Top = 134
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 3
        WordWrap = False
        IntDigits = 4
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PRAZORESGATEPREV'
        DataSource = ds
      end
      object dbreJurosPrev: TDBRealEdit
        Left = 102
        Top = 134
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 8
        NumberFormat = fNumber
        Signal = False
        DataField = 'TXJUROSPREV'
        DataSource = ds
      end
      object dbcbReaplica: TDBCheckBox
        Left = 231
        Top = 136
        Width = 74
        Height = 17
        Caption = 'Reaplica'
        DataField = 'FLGREAPLICA'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object gbDespesa: TGroupBox
        Left = 336
        Top = 19
        Width = 300
        Height = 86
        Caption = ' Percentual de Despesa '
        TabOrder = 2
        object lblPercCusto: TLabel
          Left = 18
          Top = 22
          Width = 73
          Height = 13
          Caption = 's/ Aplicação'
        end
        object lblDespRend: TLabel
          Left = 170
          Top = 22
          Width = 84
          Height = 13
          Caption = 's/ Rendimento'
        end
        object dbrePercCusto: TDBRealEdit
          Left = 18
          Top = 36
          Width = 103
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTO'
          DataSource = ds
        end
        object dbrePercDescRend: TDBRealEdit
          Left = 170
          Top = 36
          Width = 103
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTOREND'
          DataSource = ds
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90036
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 506
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 312
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 448
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 384
    Top = 8
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'dsp'
    Left = 272
    Top = 8
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAPLICACAO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Aplicação')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOAPLICACAO')
    CamposChave.Strings = (
      'TIPOAPLICACAO.TIPOAPLICACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 680
    Top = 8
  end
  object msContaOrcamen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conta Orçamentária'
      'Descrição'
      'Tipo Calc. Real.'
      'Tipo Calc. Orc.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 592
    Top = 8
  end
  object cdsMoedas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMoedas'
    Left = 256
    Top = 240
  end
  object cdsTiposAplicAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTiposAplic'
    Left = 256
    Top = 304
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 480
    Top = 80
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 656
    Top = 80
  end
  object cdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 480
    Top = 128
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 656
    Top = 128
  end
end
