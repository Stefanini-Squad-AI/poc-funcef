inherited FrmCadAtivProdServMT: TFrmCadAtivProdServMT
  Left = 611
  Top = 122
  Caption = 'Código de Atividades, Produtos e Serviços sujeitos à Tributação'
  ClientHeight = 542
  ClientWidth = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 607
    Height = 456
    inherited pnlMestre: TPanel
      Width = 605
      Height = 224
      object Label2: TLabel
        Left = 15
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 15
        Top = 49
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 15
        Top = 176
        Width = 141
        Height = 13
        Caption = 'Natureza de Rendimento'
      end
      object Label8: TLabel
        Left = 15
        Top = 92
        Width = 79
        Height = 13
        Caption = 'Detalhamento'
      end
      object lkpNaturezaRendimento: TwwDBLookupCombo
        Left = 15
        Top = 194
        Width = 570
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCR'#9'80'#9'Natureza de Rendimento REINF')
        DataField = 'CODNATUREZAREINF'
        DataSource = ds
        LookupTable = cdsNaturezaRendimento
        LookupField = 'CODNATUREZAREINF'
        DropDownWidth = 400
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object edtCodigo: TwwDBEdit
        Left = 15
        Top = 23
        Width = 75
        Height = 21
        DataField = 'CODIGO'
        DataSource = ds
        MaxLength = 5
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtDescricao: TwwDBEdit
        Left = 15
        Top = 110
        Width = 570
        Height = 59
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = ds
        MaxLength = 1000
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = True
      end
      object edtNome: TwwDBEdit
        Left = 15
        Top = 65
        Width = 570
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        MaxLength = 80
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edtNomeExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 225
      Width = 605
      Height = 230
      Tabs.Strings = (
        'Retenções Tributárias')
      inherited pgctrlDetalhe: TPageControl
        Width = 507
        Height = 171
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 499
            Height = 143
            Selected.Strings = (
              'DESC_ALTERADOR'#9'41'#9'Alterador de retenção'
              'DESC_TIPOTIBUTO'#9'18'#9'Tipo de Tributo'
              'ALIQUOTA'#9'12'#9'Alíquota de Retenção'
              'DESC_PERTRIBUTO'#9'18'#9'Período de Tributo')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 499
            Height = 143
            object Label5: TLabel
              Left = 10
              Top = 95
              Width = 49
              Height = 13
              Caption = 'Alíquota'
            end
            object Label7: TLabel
              Left = 10
              Top = 9
              Width = 52
              Height = 13
              Caption = 'Alterador'
            end
            object lkpAlterador: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 481
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
              DataField = 'CODALTERADOR'
              DataSource = dsDet
              LookupTable = cdsAlterador
              LookupField = 'CODALTERADOR'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = lkpAlteradorChange
            end
            object rgTipoTributacao: TDBRadioGroup
              Left = 10
              Top = 55
              Width = 479
              Height = 36
              Caption = 'Tipo de Tributação'
              Columns = 5
              DataField = 'TIPOTRIBUTO'
              DataSource = dsDet
              Items.Strings = (
                '&IRRF'
                '&PIS'
                '&COFINS'
                'C&SLL'
                '&Agregado')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4')
              OnChange = rgTipoTributacaoChange
            end
            object edtAliquota: TDBRealEdit
              Left = 10
              Top = 110
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'ALIQUOTA'
              DataSource = dsDet
            end
            object rgPeriodoTributacao: TDBRadioGroup
              Left = 110
              Top = 95
              Width = 319
              Height = 36
              Caption = 'Período de retenção'
              Columns = 2
              DataField = 'PERTRIBUTO'
              DataSource = dsDet
              Items.Strings = (
                'No lançamento'
                'Na liquidação')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1')
              OnChange = rgPeriodoTributacaoChange
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 597
      end
      inherited Dock974: TDock97
        Left = 511
        Height = 171
      end
    end
  end
  inherited Dock972: TDock97
    Width = 607
  end
  inherited Dock971: TDock97
    Top = 503
    Width = 607
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 458
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
    Left = 334
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 496
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 256
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 300
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LISTA_SERVICOS.CODIGO'
      'LISTA_SERVICOS.NOME'
      'LISTA_SERVICOS.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'LISTA_SERVICOS')
    CamposChave.Strings = (
      'LISTA_SERVICOS.IDSERVICO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '8'
      '60'
      '100')
    Left = 538
    Top = 9
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    AfterConfirma = CmeDetalheAfterConfirma
    Left = 116
    Top = 295
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 206
    Top = 295
  end
  object cdsNaturezaRendimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 533
    Top = 227
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    Left = 161
    Top = 296
  end
  object cdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 334
  end
end
