inherited frmCadMotivo: TfrmCadMotivo
  Left = 170
  Top = 163
  Caption = 'Cadastro de Motivos e Ações'
  ClientHeight = 408
  ClientWidth = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 322
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 83
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Bevel1: TBevel
      Left = 312
      Top = 51
      Width = 132
      Height = 96
    end
    object Label3: TLabel
      Left = 336
      Top = 58
      Width = 73
      Height = 13
      Caption = 'Código RAIS'
      FocusControl = dbedCodRais
    end
    object Label4: TLabel
      Left = 336
      Top = 104
      Width = 76
      Height = 13
      Caption = 'Código FGTS'
      FocusControl = dbedCodFgts
    end
    object Label5: TLabel
      Left = 14
      Top = 203
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object dbedCodigo: TDBEdit
      Left = 15
      Top = 26
      Width = 58
      Height = 21
      DataField = 'IDMOTIVO'
      DataSource = ds
      MaxLength = 10
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 83
      Top = 26
      Width = 361
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgGrupo: TDBRadioGroup
      Left = 15
      Top = 51
      Width = 286
      Height = 96
      Caption = 'Grupo a Que Pertence'
      DataField = 'GRUPOMOTIVO'
      DataSource = ds
      Items.Strings = (
        'Tipo de Folha'
        'Desligamento/Afastamento'
        'Alteração Funcional'
        'Outro')
      TabOrder = 2
      Values.Strings = (
        'F'
        'D'
        'A'
        'O')
    end
    object dbedCodRais: TDBEdit
      Left = 336
      Top = 73
      Width = 84
      Height = 21
      DataField = 'MOTIVORAIS'
      DataSource = ds
      TabOrder = 3
    end
    object dbedCodFgts: TDBEdit
      Left = 336
      Top = 119
      Width = 84
      Height = 21
      DataField = 'MOTIVOFGTS'
      DataSource = ds
      TabOrder = 4
    end
    object dbedObs: TwwDBEdit
      Left = 14
      Top = 218
      Width = 429
      Height = 94
      AutoSize = False
      DataField = 'OBSERVACAO'
      DataSource = ds
      ShowVertScrollBar = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
    object dbcbxFlgAbateAvos: TDBCheckBox
      Left = 16
      Top = 168
      Width = 425
      Height = 17
      Caption = 
        'Se afastamento, abate na contagem de avos para Férias e 13º Salá' +
        'rio'
      DataField = 'FLGABATEAVOS'
      DataSource = ds
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited Dock972: TDock97
    Width = 459
  end
  inherited Dock971: TDock97
    Top = 369
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 287
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 118
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 292
    Top = 13
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 246
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 292
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 360
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    FieldDefs = <
      item
        Name = 'IDMOTIVO'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDMOVCONTRCAGED'
        DataType = ftFloat
      end
      item
        Name = 'MOTIVORAIS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'MOTIVOFGTS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 240
      end
      item
        Name = 'GRUPOMOTIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGTIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 218
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Motivo a Ação'
    Colunas.Strings = (
      'MOTIVO.IDMOTIVO'
      'MOTIVO.DESCRICAO'
      'MOTIVO.MOTIVORAIS'
      'MOTIVO.MOTIVOFGTS')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Código RAIS'
      'Código FGTS')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '55'
      '4'
      '4')
    ExibePergunta = False
    Left = 360
    Top = 1
  end
end
