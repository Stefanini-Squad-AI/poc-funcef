inherited frmCadContasMT: TfrmCadContasMT
  Left = 263
  Top = 88
  Caption = 'Cadastro de Contas '
  ClientHeight = 479
  ClientWidth = 634
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 393
    object Label1: TLabel [0]
      Left = 527
      Top = 56
      Width = 70
      Height = 13
      Caption = 'Remessa Nº'
      Enabled = False
      Visible = False
    end
    inherited pnlMestre: TPanel
      Width = 632
      TabOrder = 5
      object lblBanco: TLabel
        Left = 12
        Top = 15
        Width = 37
        Height = 13
        Caption = 'Banco'
      end
      object lblAgencia: TLabel
        Left = 219
        Top = 12
        Width = 47
        Height = 13
        Caption = 'Agência'
      end
      object lblConta: TLabel
        Left = 12
        Top = 56
        Width = 86
        Height = 13
        Caption = 'Conta Corrente'
      end
      object lblMoeda: TLabel
        Left = 423
        Top = 15
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object lblDescricao: TLabel
        Left = 219
        Top = 56
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 632
      Height = 293
      TabOrder = 6
      Tabs.Strings = (
        'Detalhe'
        'Planos')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 534
        Height = 234
        ActivePage = TabSheet1
        object TabSheet1: TTabSheet [0]
          Caption = 'Detalhe'
          ImageIndex = 1
          object lblCpmf: TLabel
            Left = 165
            Top = 5
            Width = 129
            Height = 13
            Caption = 'Nº de Dias Pag. CPMF'
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 5
            Top = 6
            Width = 143
            Height = 37
            Caption = ' Status  da conta  '
            Columns = 2
            DataField = 'FLGSTATUS'
            DataSource = ds
            Items.Strings = (
              'Ativa'
              'Inativa')
            TabOrder = 0
            Values.Strings = (
              'A'
              'I')
          end
          object dbSpDiasApura: TwwDBSpinEdit
            Left = 166
            Top = 20
            Width = 129
            Height = 21
            Hint = 'Nº de Dias para Pag. CPMF Após o Período de Recolhimento'
            Increment = 1
            DataField = 'NDIASAPURACPMF'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbckGeraFluxo: TDBCheckBox
            Left = 315
            Top = 8
            Width = 285
            Height = 17
            Caption = 'Gera lançamentos desta Conta no Fluxo Real'
            DataField = 'FLGGRAVAFLUXO'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 315
            Top = 29
            Width = 154
            Height = 17
            Caption = 'Conta de Investimento'
            DataField = 'FLGCONTAINVEST'
            DataSource = ds
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object gbIntContab: TGroupBox
            Left = 4
            Top = 73
            Width = 610
            Height = 133
            Caption = ' Preencher para Integraçao Contábil '
            TabOrder = 4
            object lblCentroCusto: TLabel
              Left = 314
              Top = 10
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label20: TLabel
              Left = 314
              Top = 48
              Width = 55
              Height = 13
              Caption = 'Subconta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblUnidNegoc: TLabel
              Left = 315
              Top = 88
              Width = 104
              Height = 13
              Caption = 'Atividade\Projeto:'
            end
            object CContabil: TCMProcuraMaskContabil
              Left = 8
              Top = 16
              Width = 289
              Height = 110
              Caption = ' Conta Contábil '
              TabOrder = 0
              OnExit = CContabilExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil não existe'
              Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 314
              Top = 25
              Width = 275
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descricao'#9'F'
                'CODEXTERNO'#9'1'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = ds
              LookupTable = Cdsccusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkSubconta: TwwDBLookupCombo
              Left = 314
              Top = 64
              Width = 275
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'30'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = ds
              LookupTable = CdsSubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 315
              Top = 104
              Width = 275
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'#9'No'
                'UNETIPO'#9'1'#9'T'#9'No'
                'UNECODIGO'#9'10'#9'Código'#9'No')
              DataField = 'UNIDNEGOC'
              DataSource = ds
              LookupTable = CdsUnidNegocS
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcUnidNegocExit
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 526
            Height = 206
            object Label2: TLabel
              Left = 8
              Top = 16
              Width = 172
              Height = 13
              Caption = 'Plano Previdenciário Contábil '
            end
            object dbnomeprev: TwwDBLookupCombo
              Left = 10
              Top = 30
              Width = 295
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = CdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcBancoCloseUp
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 526
            Height = 206
            Selected.Strings = (
              'NOME'#9'67'#9'Plano Previdenciário')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 624
      end
      inherited Dock974: TDock97
        Left = 538
        Height = 234
      end
    end
    object dbeDescricao: TwwDBEdit
      Left = 219
      Top = 71
      Width = 302
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbeDescricaoEnter
    end
    object dbeContaCorrente: TwwDBEdit
      Left = 12
      Top = 71
      Width = 201
      Height = 21
      DataField = 'NOCONTACORR'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 12
      Top = 28
      Width = 196
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      DataField = 'IDBANCO'
      DataSource = ds
      LookupTable = CdsBanco
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcBancoCloseUp
    end
    object dblcAgencia: TwwDBLookupCombo
      Left = 219
      Top = 26
      Width = 196
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'
        'NUMAGENCIA'#9'15'#9'Número da Agência')
      DataField = 'IDAGENCIA'
      DataSource = ds
      LookupTable = CdsAgencia
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcAgenciaCloseUp
      OnEnter = dblcAgenciaEnter
    end
    object dblcMoeda: TwwDBLookupCombo
      Left = 420
      Top = 28
      Width = 201
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'MOEDESC')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = CdsMoeda
      LookupField = 'MOECODIGO'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 634
    inherited Toolbar971: TToolbar97
      Left = 1
      DockPos = 1
    end
  end
  inherited Dock971: TDock97
    Top = 440
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 9999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 9999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 203
    Top = 227
  end
  inherited ds: TwwDataSource
    Left = 62
    Top = 229
  end
  inherited ImlPadrao: TImageList
    Left = 240
    Top = 31
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 420
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 20
    Top = 231
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PORTADORCONTA.DESCRICAO'
      'PORTADORCONTA.NOCONTACORR'
      'PBANCO.NOME'
      'PESSOA.NOME'
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição da Conta'
      'Número da Conta'
      'Banco'
      'Agência'
      'Moeda')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PORTADORCONTA'
      'PESSOA '
      'PESSOA PBANCO'
      'BANCO'
      'MOEDA')
    CamposChave.Strings = (
      'PORTADORCONTA.CODPORTADOR'
      'PORTADORCONTA.IDPESSOA')
    Filtro.Strings = (
      'PORTADORCONTA.IDAGENCIA=PESSOA.IDPESSOA(+)'
      'PORTADORCONTA.IDBANCO=BANCO.IDPESSOA(+)'
      'BANCO.IDPESSOA=PBANCO.IDPESSOA(+)'
      'PORTADORCONTA.MOECODIGO =MOEDA.MOECODIGO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10')
    Left = 532
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 372
    Top = 15
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 86
    Top = 279
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 412
    Top = 231
  end
  object CdsAgencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 340
    Top = 231
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 375
    Top = 231
  end
  object Cdsccusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 428
    Top = 287
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 460
    Top = 287
  end
  object CdsUnidNegocS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 532
    Top = 303
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 308
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 52
    Top = 279
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
    Top = 308
  end
  object cdsPortconta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 308
  end
end
