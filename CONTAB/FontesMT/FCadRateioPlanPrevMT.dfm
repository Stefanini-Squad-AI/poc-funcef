inherited frmCadRateioPlanPrevMT: TfrmCadRateioPlanPrevMT
  Left = 41
  Top = 320
  Caption = 'Cadastro do Rateio por Plano e Patrocinadora'
  ClientHeight = 374
  ClientWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 288
    inherited pnlMestre: TPanel
      Width = 757
      Height = 68
      object lblPrePronta: TLabel
        Left = 7
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Planilha'
      end
      object edDescAutomatico: TDBEdit
        Left = 7
        Top = 32
        Width = 429
        Height = 21
        DataField = 'PANDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object dbckInativo: TDBCheckBox
        Left = 447
        Top = 36
        Width = 65
        Height = 17
        Caption = 'Inativo'
        DataField = 'PANINATIVO'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 69
      Width = 757
      Height = 218
      inherited pgctrlDetalhe: TPageControl
        Width = 659
        Height = 159
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 651
            Height = 131
            object Label1: TLabel
              Left = 344
              Top = 54
              Width = 95
              Height = 13
              Caption = 'Histórico Padrão'
            end
            object lblCentCust: TLabel
              Left = 8
              Top = 94
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblAtivProj: TLabel
              Left = 169
              Top = 94
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object dbrgTipoConta: TDBRadioGroup
              Left = 9
              Top = 2
              Width = 120
              Height = 87
              DataField = 'PANORIGEM'
              DataSource = dsDet
              Items.Strings = (
                '&Origem'
                '&Destino'
                '&Contra-Partida')
              TabOrder = 0
              Values.Strings = (
                'O'
                'D'
                'C')
              OnClick = dbrgTipoContaClick
            end
            object cmccConta: TCMProcuraMaskContabil
              Left = 138
              Top = 2
              Width = 201
              Height = 87
              Caption = ' Conta Base '
              TabOrder = 1
              OnExit = cmccContaExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PANCONTABASE'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scSoAtiva
            end
            object dbrgDebCre: TDBRadioGroup
              Left = 345
              Top = 2
              Width = 176
              Height = 47
              Caption = ' Tipo '
              Columns = 2
              DataField = 'PANTIPO'
              DataSource = dsDet
              Items.Strings = (
                '&Débito'
                '&Crédito')
              TabOrder = 2
              Values.Strings = (
                'D'
                'C')
              OnClick = dbrgDebCreClick
            end
            object dblcHistPadrao: TCMDBLookupCombo
              Left = 344
              Top = 68
              Width = 177
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HITCODHIST'#9'4'#9'Código'
                'HITDESCR1'#9'200'#9'Descrição')
              DataField = 'HITCODHIST'
              DataSource = dsDet
              LookupTable = CdsHistoPadrao
              LookupField = 'HITCODHIST'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentroCusto: TCMDBLookupCombo
              Left = 8
              Top = 108
              Width = 160
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcAtivProj: TCMDBLookupCombo
              Left = 169
              Top = 108
              Width = 160
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Nome'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = CdsAtivProj
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object pnlPlanoPatroC: TPanel
              Left = 330
              Top = 92
              Width = 322
              Height = 40
              BevelOuter = bvNone
              TabOrder = 6
              object lblPlanoPrevC: TLabel
                Left = 3
                Top = 2
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPatroC: TLabel
                Left = 159
                Top = 1
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 3
                Top = 15
                Width = 155
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroC: TwwDBLookupCombo
                Left = 159
                Top = 15
                Width = 155
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = dsDet
                LookupTable = CdsPatro
                LookupField = 'IDPESSOA'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 651
            Height = 131
            Selected.Strings = (
              'CONTABASE'#9'18'#9'Conta Base'#9'F'
              'CONTADESTINO'#9'18'#9'Conta Destino'#9'F'
              'CONTRAPARTIDA'#9'18'#9'Contra-Partida'#9'F'
              'PANTIPO'#9'1'#9'D/C'#9'F')
            UseTFields = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 749
      end
      inherited Dock974: TDock97
        Left = 663
        Height = 159
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Tag = 999
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 999
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 759
  end
  inherited Dock971: TDock97
    Top = 335
    Width = 759
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 407
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Top = 407
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 272
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PREPLANILHA.PANDESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PREPLANILHA')
    CamposChave.Strings = (
      'PREPLANILHA.PANCODIGO'
      'PREPLANILHA.PANIDENTIFICACAO')
    Filtro.Strings = (
      'PREPLANILHA.PANIDENTIFICACAO = '#39'T'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 424
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 156
    Top = 130
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsPreDetalhe
    Left = 222
    Top = 130
  end
  object CdsPreDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 128
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 296
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 296
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 287
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 295
  end
  object CdsHistoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 247
  end
end
