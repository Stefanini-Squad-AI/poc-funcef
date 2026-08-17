inherited FrmCadFuncaoOperacao: TFrmCadFuncaoOperacao
  Left = 306
  Top = 70
  Caption = 'Cadastro de Funções x Operações'
  ClientHeight = 591
  ClientWidth = 871
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 871
    Height = 505
    inherited pnlMestre: TPanel
      Left = 377
      Top = 61
      Width = 493
      Height = 443
      Align = alClient
      TabOrder = 1
      object lblFuncaoPai: TLabel
        Left = 25
        Top = 24
        Width = 65
        Height = 13
        Caption = 'Função Pai'
      end
      object lblNomeFuncao: TLabel
        Left = 25
        Top = 65
        Width = 43
        Height = 13
        Caption = 'Função'
      end
      object dblkpFuncaoPai: TCMDBLookupCombo
        Left = 25
        Top = 38
        Width = 441
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEFUNCAO'#9'30'#9'Função Pai'#9'F')
        DataField = 'IDFUNCAOPAI'
        DataSource = ds
        LookupTable = CdsFuncaoPai
        LookupField = 'IDFUNCAO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbedtFuncao: TwwDBEdit
        Left = 25
        Top = 79
        Width = 441
        Height = 21
        DataField = 'NOMEFUNCAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 377
      Top = 184
      Width = 494
      Height = 320
      Align = alNone
      TabOrder = 2
      Tabs.Strings = (
        'Form x Operação x Objeto')
      OnChange = nil
      OnChanging = nil
      inherited pgctrlDetalhe: TPageControl
        Width = 396
        Height = 261
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 388
            Height = 233
            Selected.Strings = (
              'NOMEFORM'#9'20'#9'Form'
              'NOMEOPERACAO'#9'30'#9'Operação'
              'NOMEOBJETO'#9'15'#9'Objeto')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 388
            Height = 233
            object lblForm: TLabel
              Left = 17
              Top = 24
              Width = 28
              Height = 13
              Caption = 'Form'
            end
            object lblOperacao: TLabel
              Left = 17
              Top = 76
              Width = 56
              Height = 13
              Caption = 'Operação'
            end
            object lblObjeto: TLabel
              Left = 17
              Top = 128
              Width = 38
              Height = 13
              Caption = 'Objeto'
            end
            object dblkpForm: TCMDBLookupCombo
              Left = 17
              Top = 38
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEFORM'#9'30'#9'Form'#9'F')
              DataField = 'IDFORM'
              DataSource = dsDet
              LookupTable = CdsForm
              LookupField = 'IDFORM'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkpOperacao: TCMDBLookupCombo
              Left = 17
              Top = 90
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOPERACAO'#9'30'#9'Operação'#9'F')
              DataField = 'IDOPERACAO'
              DataSource = dsDet
              LookupTable = CdsOperacao
              LookupField = 'IDOPERACAO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkpObjeto: TCMDBLookupCombo
              Left = 17
              Top = 142
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOBJETO'#9'30'#9'Objeto'#9'F')
              DataField = 'IDOBJETO'
              DataSource = dsDet
              LookupTable = CdsObjeto
              LookupField = 'IDOBJETO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 486
      end
      inherited Dock974: TDock97
        Left = 400
        Height = 261
      end
    end
    object pnlModulo: TPanel
      Left = 1
      Top = 1
      Width = 869
      Height = 60
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblModulo: TLabel
        Left = 26
        Top = 13
        Width = 42
        Height = 13
        Caption = 'Módulo'
      end
      object dblkpModulo: TCMDBLookupCombo
        Left = 26
        Top = 27
        Width = 816
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME_ID'#9'30'#9'Módulo - ID'#9'F')
        LookupTable = CdsModulo
        LookupField = 'IDMODULO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkpModuloCloseUp
      end
    end
    object pnlTreeView: TPanel
      Left = 1
      Top = 61
      Width = 376
      Height = 443
      Align = alLeft
      TabOrder = 3
      object tvFuncoes: TfcTreeView
        Left = 1
        Top = 1
        Width = 374
        Height = 441
        Align = alClient
        Indent = 19
        Items.StreamVersion = 1
        Items.Data = {00000000}
        TabOrder = 0
        OnChange = tvFuncoesChange
      end
    end
  end
  inherited Dock972: TDock97
    Width = 871
  end
  inherited Dock971: TDock97
    Top = 552
    Width = 871
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 324
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 438
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 323
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 388
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 438
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MODULO.NOMEMODULO'
      'FUNCAOPAI.NOMEFUNCAO'
      'FUNCAO.NOMEFUNCAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Módulo'
      'Função Pai'
      'Função')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCAO'
      'MODULO'
      'FUNCAO FUNCAOPAI')
    CamposChave.Strings = (
      'FUNCAO.IDFUNCAO'
      'MODULO.IDMODULO')
    Filtro.Strings = (
      'FUNCAO.IDMODULO = MODULO.IDMODULO'
      'FUNCAOPAI.IDFUNCAO = FUNCAO.IDFUNCAOPAI')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '25'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 262
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    ApplyDelete = CmeDetalheApplyDelete
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 387
    Top = 3
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 476
    Top = 16
  end
  object sqlAutorizaAtu: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   AUTORIZA.IDESPACESSO,'
      '   AUTORIZA.IDOPERFUNC,'
      '   AUTORIZA.IDPESSOA,'
      '   OPERFUNC.IDOPERACAO,'
      '   OPERFUNC.IDFUNCAO'
      'FROM'
      '   AUTORIZA, OPERFUNC'
      'WHERE'
      '   (OPERFUNC.IDMODULO = :IdModulo) AND'
      '   (AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC)  AND'
      '   (AUTORIZA.IDESPACESSO = :IdEspAcesso) AND'
      '   (AUTORIZA.IDPESSOA = :IdPessoa)'
      '')
    ClientDataSet = CdsAutorizaAtu
    Left = 322
    Top = 126
  end
  object CdsAutorizaAtu: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 114
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 65
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODULO, TRIM(NOMEMODULO) NOMEMODULO, '
      '       TRIM(NOMEMODULO) || '#39' - '#39' || IDMODULO NOME_ID'
      '  FROM MODULO'
      ' ORDER BY NOMEMODULO')
    ClientDataSet = CdsModulo
    Left = 86
    Top = 51
  end
  object CdsFuncaoPai: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 741
    Top = 135
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 477
    Top = 4
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 124
  end
  object CdsForm: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 343
  end
  object CdsOperacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 391
  end
  object CdsObjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 447
  end
end
