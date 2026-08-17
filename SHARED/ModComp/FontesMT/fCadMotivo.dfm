inherited frmCadMotivo: TfrmCadMotivo
  Left = 337
  Top = 175
  Caption = 'Cadastro de Motivos e Ações'
  ClientHeight = 408
  ClientWidth = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 454
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
      Left = 259
      Top = 51
      Width = 184
      Height = 161
    end
    object Label3: TLabel
      Left = 270
      Top = 55
      Width = 73
      Height = 13
      Caption = 'Código RAIS'
      FocusControl = dbedCodRais
    end
    object Label4: TLabel
      Left = 270
      Top = 93
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
    object Label6: TLabel
      Left = 270
      Top = 171
      Width = 86
      Height = 13
      Caption = 'Código eSocial'
      FocusControl = dbedESocial
    end
    object Label7: TLabel
      Left = 270
      Top = 131
      Width = 86
      Height = 13
      Caption = 'Tabela eSocial'
      FocusControl = dbedESocial
    end
    object Label8: TLabel
      Left = 35
      Top = 173
      Width = 190
      Height = 13
      Caption = 'de avos para Férias e 13º Salário'
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
      Width = 234
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
      OnChange = dbrgGrupoChange
      OnClick = dbrgGrupoClick
    end
    object dbedCodRais: TDBEdit
      Left = 270
      Top = 70
      Width = 162
      Height = 21
      DataField = 'MOTIVORAIS'
      DataSource = ds
      TabOrder = 3
    end
    object dbedCodFgts: TDBEdit
      Left = 270
      Top = 108
      Width = 162
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
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
    object dbcbxFlgAbateAvos: TDBCheckBox
      Left = 15
      Top = 157
      Width = 229
      Height = 17
      Caption = 'Se afastamento, abate na contagem '
      DataField = 'FLGABATEAVOS'
      DataSource = ds
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbedESocial: TDBEdit
      Left = 270
      Top = 186
      Width = 162
      Height = 21
      DataField = 'CODIGOESOCIAL'
      DataSource = ds
      Enabled = False
      MaxLength = 2
      TabOrder = 5
    end
    object cbTabESocial: TwwDBComboBox
      Left = 270
      Top = 147
      Width = 162
      Height = 21
      ShowButton = True
      Style = csDropDownList
      MapList = True
      AllowClearKey = False
      DataField = 'TABELAESOCIAL'
      DataSource = ds
      DropDownCount = 8
      Enabled = False
      ItemHeight = 0
      Items.Strings = (
        'AFASTAMENTO'#9'18'
        'DESLIGAMENTO'#9'19')
      Sorted = False
      TabOrder = 6
      UnboundDataType = wwDefault
    end
  end
  inherited Dock972: TDock97
    Width = 454
  end
  inherited Dock971: TDock97
    Top = 369
    Width = 454
    inherited tb97Fundo: TToolbar97
      Left = 282
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 113
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
      'MOTIVO.MOTIVOFGTS'
      'MOTIVO.CODIGOESOCIAL'
      'MOTIVO.TABELAESOCIAL')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Código RAIS'
      'Código FGTS'
      'Código eSocial'
      'Tabela eSocial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO'
      'MOTIVO.IDMODULO')
    Filtro.Strings = (
      'IDMODULO = 21')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '55'
      '4'
      '4'
      '1'
      '6')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 408
    Top = 65529
  end
end
