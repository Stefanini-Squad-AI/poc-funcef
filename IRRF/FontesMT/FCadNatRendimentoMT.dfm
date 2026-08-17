inherited frmCadNatRendimentoMT: TfrmCadNatRendimentoMT
  Left = 203
  Top = 138
  HelpContext = 240021
  Caption = 'Natureza de Rendimentos'
  ClientHeight = 491
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 405
    object lblCodigo: TLabel
      Left = 21
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 21
      Top = 42
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TwwDBEdit
      Left = 21
      Top = 20
      Width = 61
      Height = 21
      DataField = 'CODNATUREZA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedHistorico: TwwDBEdit
      Left = 21
      Top = 57
      Width = 503
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object gbDarf: TGroupBox
      Left = 21
      Top = 87
      Width = 503
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Dados para o Darf '
      TabOrder = 2
      object Label2: TLabel
        Left = 24
        Top = 75
        Width = 116
        Height = 13
        Caption = 'Tipo de Desembolso'
      end
      object Label3: TLabel
        Left = 24
        Top = 120
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object rgTributo: TLabel
        Left = 26
        Top = 165
        Width = 97
        Height = 13
        Caption = 'Grupo de Tributo'
      end
      object Label4: TLabel
        Left = 160
        Top = 166
        Width = 78
        Height = 13
        Caption = 'Periodicidade'
      end
      object Bevel1: TBevel
        Left = 25
        Top = 216
        Width = 396
        Height = 85
      end
      object lblVariacao: TLabel
        Left = 288
        Top = 264
        Width = 51
        Height = 13
        Caption = 'Variação'
        Visible = False
      end
      object cmfcFornDarf: TCMProcuraSubTipo
        Left = 24
        Top = 19
        Width = 452
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Fornecedor '
        TabOrder = 0
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stFornecedor
        FiltraSubTipo = True
      end
      object dblcTipoDesemb: TwwDBLookupCombo
        Left = 24
        Top = 89
        Width = 452
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Tipo de Desembolso'
          'CODTIPRECDES'#9'15'#9'Código')
        DataField = 'CODTIPRECDES'
        DataSource = ds
        LookupTable = cdsTipoDesembolso
        LookupField = 'CODTIPRECDES'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcFormaPG: TwwDBLookupCombo
        Left = 24
        Top = 134
        Width = 452
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Forma de Pagamento'#9'F')
        DataField = 'CODFORMA'
        DataSource = ds
        LookupTable = cdsFormaPagamento
        LookupField = 'CODFORMA'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cbTributo: TComboBox
        Left = 25
        Top = 181
        Width = 118
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemHeight = 13
        MaxLength = 4
        TabOrder = 3
        Items.Strings = (
          'IRPJ'
          'IRRF'
          'IPI'
          'IOF'
          'CSLL'
          'PIS/PASEP'
          'COFINS'
          'CPMF'
          'CIDE'
          'RET/PATRIMONIO DE AFETAÇÃO'
          'CSRF'
          'COSIRF')
      end
      object cbPeriodicidade: TComboBox
        Left = 159
        Top = 181
        Width = 130
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        MaxLength = 4
        TabOrder = 4
        Items.Strings = (
          'D - Diário'
          'S - Semanal'
          'X - Decendial'
          'Q - Quinzenal'
          'M - Mensal'
          'T - Trimestral'
          'A - Anual')
      end
      object dbcResid: TDBCheckBox
        Left = 41
        Top = 222
        Width = 328
        Height = 17
        Caption = 'Este código será usado para Residentes no exterior'
        DataField = 'FLGRESIDEXTERIOR'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcDepositoJud: TDBCheckBox
        Left = 41
        Top = 241
        Width = 312
        Height = 17
        Caption = 'Este código será usado para Depósito Judicial'
        DataField = 'FLGDEPOSITOJUDIC'
        DataSource = ds
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcDIRF: TDBCheckBox
        Left = 41
        Top = 260
        Width = 209
        Height = 17
        Caption = 'Este código será usado na DIRF'
        DataField = 'FLGUSADONADIRF'
        DataSource = ds
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcDCTF: TDBCheckBox
        Left = 41
        Top = 279
        Width = 209
        Height = 17
        Caption = 'Este código será usado na DCTF'
        DataField = 'FLGUSADONADCTF'
        DataSource = ds
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcDCTFClick
      end
      object dbedtVariacao: TwwDBEdit
        Left = 288
        Top = 277
        Width = 65
        Height = 21
        DataField = 'VARIACAO'
        DataSource = ds
        TabOrder = 9
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 532
  end
  inherited Dock971: TDock97
    Top = 452
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 360
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 240019
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 367
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NATURENDIMENTO.CODNATUREZA'
      'NATURENDIMENTO.DESCRICAO'
      'NATURENDIMENTO.RECPAG'
      'NATURENDIMENTO.GRUPOTRIBUTO'
      'NATURENDIMENTO.PERIODICIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Natureza'
      'Descrição'
      'RecPag'
      'Grupo de Tributo'
      'Periodicidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NATURENDIMENTO')
    CamposChave.Strings = (
      'NATURENDIMENTO.CODNATUREZA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '4'
      '60'
      '1'
      '2'
      '1')
    Left = 432
    Top = 15
  end
  object cdsTipoDesembolso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 372
    Top = 207
  end
  object cdsFormaPagamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 260
    Top = 247
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 476
    Top = 71
  end
end
