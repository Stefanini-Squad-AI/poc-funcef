inherited FrmCadPlanPrevContabPatro: TFrmCadPlanPrevContabPatro
  Left = 325
  Top = 286
  Caption = 'Cadastro de Plano Previdenciários por Patrocinadora'
  ClientHeight = 307
  ClientWidth = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 543
    Height = 221
    inherited dbGrd: TwwDBGrid [0]
      Width = 541
      Height = 219
      Selected.Strings = (
        'NOMEPATRO'#9'35'#9'Patrocinadora'
        'NOMEPLANO'#9'35'#9'Plano')
      TitleButtons = True
      OnTitleButtonClick = dbGrdTitleButtonClick
    end
    inherited pnlControles: TPanel [1]
      Width = 541
      Height = 219
      object Label2: TLabel
        Left = 16
        Top = 80
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dbCboPlano: TwwDBLookupCombo
        Left = 16
        Top = 96
        Width = 465
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = CdsPlano
        LookupField = 'IDPLANOPREV'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object CmbPatro: TCMDBLookupCombo
        Left = 16
        Top = 32
        Width = 465
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        DataField = 'IDPATRO'
        DataSource = ds
        LookupTable = CdsPatro
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 543
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 268
    Width = 543
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 602
    Top = 71
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 600
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyDelete = CmeCadastroApplyDelete
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 404
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PPC.NOME'
      'PES.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Plano '
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREVCONTABPATRO PCP'
      'PLANPREVCONTABIL PPC'
      'PESSOA PES')
    CamposChave.Strings = (
      'PCP.IDPLANPREVCTBPATR')
    Filtro.Strings = (
      'PPC.IDPLANOPREV = PCP.IDPLANOPREV'
      'PES.IDPESSOA = PCP.IDPATRO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '60')
    Left = 464
    Top = 7
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 365
    Top = 140
    object CdsPlanoNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object CdsPlanoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 64
  end
end
