inherited frmCadTipObjeto: TfrmCadTipObjeto
  Left = 153
  Top = 189
  Caption = 'Cadastro de Tipos de Objeto Reclamado em Processos'
  ClientHeight = 275
  ClientWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 463
  end
  inherited pnlFundo: TPanel [1]
    Width = 463
    Height = 189
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 86
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 16
      Top = 55
      Width = 100
      Height = 13
      Caption = 'Grupo de Objetos'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 27
      Width = 60
      Height = 21
      DataField = 'CODTIPOOBJETO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 86
      Top = 27
      Width = 360
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dblcGrpObjeto: TwwDBLookupCombo
      Left = 16
      Top = 70
      Width = 431
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'DESCRICAO')
      DataField = 'IDGRUPOOBJETO'
      DataSource = ds
      LookupTable = CdsGrpObjeto
      LookupField = 'IDGRUPOOBJETO'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbrgRubrica: TDBRadioGroup
      Left = 16
      Top = 95
      Width = 431
      Height = 34
      Caption = 'Objeto Relacionado a uma Rubrica de Folha?'
      Columns = 2
      DataField = 'FLGPROVDESC'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgRubricaChange
    end
    object gbxRubrica: TGroupBox
      Left = 16
      Top = 131
      Width = 431
      Height = 44
      Caption = 'Rubrica Relacionada'
      TabOrder = 4
      object dblcRubrica: TwwDBLookupCombo
        Left = 10
        Top = 15
        Width = 411
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRPROVDESC'#9'2'#9'DESCRPROVDESC'#9'F')
        DataField = 'IDPROVENTO'
        DataSource = ds
        LookupTable = CdsRubrica
        LookupField = 'IDPROVENTO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblcRubricaCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 463
    inherited tb97Fundo: TToolbar97
      Left = 291
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 122
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 418
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 174
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 418
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 353
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 146
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Objeto Reclamado'
    Colunas.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO'
      'TIPOOBJPROCTRAB.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOOBJPROCTRAB')
    CamposChave.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '100')
    ExibePergunta = False
    Left = 353
    Top = 1
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 216
    Top = 2
  end
  object CdsGrpObjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 282
    Top = 1
  end
end
