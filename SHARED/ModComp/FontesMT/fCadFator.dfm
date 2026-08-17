inherited frmCadFator: TfrmCadFator
  Left = 108
  Top = 126
  Caption = 'Cadastro dos Fatores de Avaliação'
  ClientHeight = 369
  ClientWidth = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 283
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 94
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 17
      Top = 153
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = dbedDescr
    end
    object Label6: TLabel
      Left = 17
      Top = 56
      Width = 190
      Height = 13
      Caption = 'Grupo de Fatores a que Pertence'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 26
      Width = 64
      Height = 21
      DataField = 'IDFATORAVAL'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 94
      Top = 26
      Width = 488
      Height = 21
      DataField = 'DESCRFATORAVAL'
      DataSource = ds
      TabOrder = 1
    end
    object dbmemOBS: TDBMemo
      Left = 17
      Top = 168
      Width = 565
      Height = 103
      DataField = 'OBSFATORAVAL'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 2
      WantTabs = True
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 17
      Top = 70
      Width = 565
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
      DataField = 'IDGRUPOFATORAVAL'
      DataSource = ds
      LookupTable = CdsGrupoFatorAval
      LookupField = 'IDGRUPOFATORAVAL'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
    end
    object dbrgAplicabilidade: TDBRadioGroup
      Left = 17
      Top = 101
      Width = 565
      Height = 41
      Caption = 'Aplicabilidade'
      Columns = 3
      DataField = 'INDFATORAVAL'
      DataSource = ds
      Items.Strings = (
        'Avaliações de Desempenho'
        'Avaliações de Cargos'
        'Ambas as Avaliações')
      TabOrder = 4
      Values.Strings = (
        '1'
        '2'
        '0')
    end
  end
  inherited Dock972: TDock97
    Width = 598
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 598
    inherited tb97Fundo: TToolbar97
      Left = 428
      DockPos = 436
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 261
      DockPos = 269
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 381
    Top = 15
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 382
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fator de Avaliação'
    Colunas.Strings = (
      'IDFATORAVAL'
      'DESCRFATORAVAL'
      
        'DECODE(INDFATORAVAL, 1,'#39'Aval. Desempenho'#39', 2, '#39'Aval. Cargos'#39', '#39'D' +
        'esempenho/Cargos'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Aplicabilidade')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'FATORAVAL')
    CamposChave.Strings = (
      'IDFATORAVAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '30')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
  object CdsGrupoFatorAval: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsGrupoFatorAvalIndexDESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsGrupoFatorAvalIndexDESCRICAO'
    Params = <>
    StoreDefs = True
    Left = 482
    Top = 1
  end
end
