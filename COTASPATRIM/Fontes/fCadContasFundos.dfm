inherited frmCadContasFundos: TfrmCadContasFundos
  Left = 304
  Top = 261
  Caption = 'Cadastro de Contas / Fundos '
  ClientHeight = 284
  ClientWidth = 575
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 575
    Height = 198
    inherited dbGrd: TwwDBGrid [0]
      Width = 573
      Height = 196
      Selected.Strings = (
        'NOME'#9'38'#9'Conta / Fundo'
        'NOME_1'#9'37'#9'Ativo')
    end
    inherited pnlControles: TPanel [1]
      Width = 573
      Height = 196
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbEdtNome
      end
      object Label3: TLabel
        Left = 16
        Top = 139
        Width = 30
        Height = 13
        Caption = 'Ativo'
        FocusControl = dbEdtNome
      end
      object lblDescricao: TLabel
        Left = 16
        Top = 53
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbEdtNome: TDBEdit
        Left = 16
        Top = 24
        Width = 545
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object cmlkpAtivo: TCMDBLookupCombo
        Left = 16
        Top = 155
        Width = 545
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome do Ativo'#9'F')
        DataField = 'IDCPATIVO'
        DataSource = ds
        LookupTable = CdsAtivo
        LookupField = 'IDCPATIVO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbmemDescricao: TDBMemo
        Left = 16
        Top = 69
        Width = 545
        Height = 60
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 575
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 575
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 65527
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 296
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 388
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Conta / Fundos'
    Colunas.Strings = (
      'CPCONTA.NOME'
      'CPCONTA.DESCRICAO'
      'CPCONTA.IDCPATIVO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      ''
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CPCONTA')
    CamposChave.Strings = (
      'CPCONTA.IDCPCONTA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    Left = 256
    Top = 7
  end
  object CdsAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 167
  end
end
