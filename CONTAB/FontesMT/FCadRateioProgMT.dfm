inherited frmCadRateioProgMT: TfrmCadRateioProgMT
  Left = 87
  Top = 130
  HelpContext = 10131
  Caption = 'Cadastro do Rateio por Programa'
  ClientHeight = 432
  ClientWidth = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 649
    Height = 346
    inherited pnlMestre: TPanel
      Width = 647
      Height = 80
      object lblPrePronta: TLabel
        Left = 7
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Planilha'
      end
      object Label4: TLabel
        Left = 344
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Fase'
      end
      object edDescAutomatico: TDBEdit
        Left = 7
        Top = 32
        Width = 322
        Height = 21
        DataField = 'PANDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object dbckInativo: TDBCheckBox
        Left = 7
        Top = 60
        Width = 65
        Height = 17
        Caption = 'Inativo'
        DataField = 'PANINATIVO'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object grpContaperc: TDBRadioGroup
        Left = 435
        Top = 12
        Width = 94
        Height = 49
        DataField = 'PANCONTAPERC'
        DataSource = ds
        Items.Strings = (
          'Conta'
          'Percentual')
        TabOrder = 1
        Values.Strings = (
          'C'
          'P')
      end
      object dbgrDiaPer: TDBRadioGroup
        Left = 527
        Top = 12
        Width = 114
        Height = 49
        DataField = 'FLGPERIODOGERA'
        DataSource = ds
        Items.Strings = (
          'Todo &Período'
          'Todo &Dia')
        TabOrder = 3
        Values.Strings = (
          'P'
          'D')
      end
      object dbchkIntegraPlanilha: TDBCheckBox
        Left = 239
        Top = 60
        Width = 194
        Height = 17
        Caption = 'Integra planilha manualmente'
        DataField = 'FLGINTEGRAPLAN'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object edFase: TDBEdit
        Left = 344
        Top = 32
        Width = 83
        Height = 21
        DataField = 'PANFASE'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 81
      Width = 647
      Height = 264
      inherited pgctrlDetalhe: TPageControl
        Width = 549
        Height = 205
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 541
            Height = 177
            Selected.Strings = (
              'PANCONTABASE'#9'12'#9'Origem'
              'PLACONTA'#9'13'#9'Destino'
              'PANPERC'#9'10'#9'Percentual'
              'CODEXTERNO'#9'11'#9'Centro Custos'
              'PLANPREVCONTABIL'#9'25'#9'Plano'
              'PATRO'#9'27'#9'Patrocinadora')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 541
            Height = 177
            object Label1: TLabel
              Left = 3
              Top = 96
              Width = 95
              Height = 13
              Caption = 'Histórico Padrão'
            end
            object lblPercentual: TLabel
              Left = 4
              Top = 134
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblPPPCentroCusto: TLabel
              Left = 327
              Top = 96
              Width = 98
              Height = 13
              Caption = 'Centro de Custos'
            end
            object Label10: TLabel
              Left = 117
              Top = 96
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rgTipoConta: TRadioGroup
              Left = 3
              Top = 9
              Width = 106
              Height = 80
              Caption = ' Tipo de Conta '
              ItemIndex = 0
              Items.Strings = (
                '&Origem'
                '&Destino')
              TabOrder = 0
              OnClick = rgTipoContaClick
            end
            object cmccContaOrigem: TCMProcuraMaskContabil
              Left = 116
              Top = 9
              Width = 201
              Height = 81
              Caption = ' Conta Origem '
              TabOrder = 1
              OnExit = cmccContaOrigemExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PANCONTABASE'
              Mensagens.EmBranco = 'Conta de Origem não pode estar em branco'
              Mensagens.NaoExiste = 'Conta de Origem não existe'
              Mensagens.Sintetica = 'Conta de Origem não pode ser sintética'
              Mensagens.Analitica = 'Conta de Origem não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scSoAtiva
            end
            object cmccContaDestino: TCMProcuraMaskContabil
              Left = 323
              Top = 9
              Width = 201
              Height = 81
              Caption = ' Conta Destino '
              TabOrder = 2
              OnExit = cmccContaDestinoExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta de Destino não pode estar em branco'
              Mensagens.NaoExiste = 'Conta de Destino não existe'
              Mensagens.Sintetica = 'Conta de Destino não pode ser sintética'
              Mensagens.Analitica = 'Conta de Destino não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scSoAtiva
            end
            object dblcHistPadrao: TCMDBLookupCombo
              Left = 3
              Top = 110
              Width = 104
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
            object dbrePerc: TDBRealEdit
              Left = 3
              Top = 147
              Width = 103
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '66,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PANPERC'
              DataSource = dsDet
            end
            object pnlPlanoPatroC: TPanel
              Left = 112
              Top = 131
              Width = 415
              Height = 40
              BevelOuter = bvNone
              TabOrder = 7
              object lblPlanoPrevC: TLabel
                Left = 6
                Top = 3
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPatroC: TLabel
                Left = 213
                Top = 3
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 4
                Top = 16
                Width = 201
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
                Left = 213
                Top = 16
                Width = 199
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
            object dblkCCusto: TwwDBLookupCombo
              Left = 327
              Top = 110
              Width = 199
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              DropDownWidth = 350
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkTipoOper: TwwDBLookupCombo
              Left = 116
              Top = 110
              Width = 200
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = dsDet
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 639
      end
      inherited Dock974: TDock97
        Left = 553
        Height = 205
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
    Width = 649
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 649
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
    Left = 65530
    Top = 65527
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 390
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 336
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 444
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
      'PREPLANILHA.PANIDENTIFICACAO = '#39'G'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 272
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 568
    Top = 10
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsPreDetalhe
    Left = 614
    Top = 10
  end
  object CdsPreDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 498
    Top = 9
  end
  object CdsHistoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 151
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 152
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 152
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 152
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 282
    Top = 152
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   D.PANCODIGO, D.PANNUMLANC, D.PLANO, D.PANCONTABASE, D.IDPESSO' +
        'A, D.PLACONTA,'
      
        '   D.IDUSUARIOINCLUSAO, D.PANPERC, D.IDPATRO, D.IDPLANOPREV, D.H' +
        'ITCODHIST,'
      '   D.CODCENTROCUSTO, D.TIPCODIGO,'
      '   CC.CODEXTERNO, PC.NOME PLANPREVCONTABIL, PE.NOME PATRO'
      'FROM'
      
        '    PREDETALHE D, CENTCUST CC, PLANPREVCONTABIL PC, PATRO PA, PE' +
        'SSOA PE'
      'WHERE (D.IDEMPRESA = CC.IDEMPRESA (+))'
      '  AND (D.CODCENTROCUSTO = CC.CODCENTROCUSTO (+))'
      '  AND (D.IDPLANOPREV = PC.IDPLANOPREV (+))'
      '  AND (D.IDPATRO = PA.IDPESSOA (+))'
      '  AND (PA.IDPESSOA = PE.IDPESSOA)'
      '  AND ( PLACONTA IS NOT NULL )'
      ' '
      ' ')
    Left = 494
    Top = 282
  end
end
