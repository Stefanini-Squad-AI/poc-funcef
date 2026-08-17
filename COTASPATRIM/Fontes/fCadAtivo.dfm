inherited frmCadAtivo: TfrmCadAtivo
  Left = 265
  Top = 225
  Caption = 'Cadastro de Ativos'
  ClientHeight = 330
  ClientWidth = 755
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 244
    inherited dbGrd: TwwDBGrid [0]
      Width = 753
      Height = 242
      Selected.Strings = (
        'NOME'#9'32'#9'Nome'
        'NOMEPLANOPREV'#9'22'#9'Plano Previdenciário'
        'NOMEPATRO'#9'22'#9'Patrocinadora'
        'NOMEREGRA'#9'22'#9'Nome da Regra')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      OnTitleButtonClick = dbGrdTitleButtonClick
    end
    inherited pnlControles: TPanel [1]
      Width = 753
      Height = 242
      object lblDescricao: TLabel
        Left = 16
        Top = 56
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lblNome: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNome
      end
      object lblPrevidenciario: TLabel
        Left = 16
        Top = 142
        Width = 168
        Height = 13
        Caption = 'Plano Previdenciário Contábil'
      end
      object lblPatrocinadora: TLabel
        Left = 386
        Top = 139
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblRCalculo: TLabel
        Left = 16
        Top = 187
        Width = 99
        Height = 13
        Caption = 'Regra de Cálculo'
      end
      object dbNome: TDBEdit
        Left = 16
        Top = 24
        Width = 720
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object dblkcmbPlanoPrevidenciarioContabil: TwwDBLookupCombo
        Left = 16
        Top = 158
        Width = 350
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = cdsPrevi
        LookupField = 'IDPLANOPREV'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dblkcmbPatrocinadora: TwwDBLookupCombo
        Left = 386
        Top = 156
        Width = 350
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        DataField = 'IDPATRO'
        DataSource = ds
        LookupTable = cdsPatro
        LookupField = 'IDPATRO'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dblkcmbRegraCalculo: TwwDBLookupCombo
        Left = 16
        Top = 202
        Width = 720
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'50'#9'Nome da regra'#9'F')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = cdsRegra
        LookupField = 'IDREGRA'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dbmemDescricao: TDBMemo
        Left = 16
        Top = 72
        Width = 720
        Height = 60
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 755
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 291
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
    Top = 65519
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    AfterConfirma = nil
    Left = 400
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 316
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CPATIVO.IDCPATIVO')
    TipodeDado.Strings = (
      'N')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CPATIVO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '10')
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'REFER'
    Left = 448
    Top = 7
  end
  object cdsPrevi: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 324
    Top = 159
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 308
    Top = 215
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 289
    Top = 264
  end
end
