inherited frmCadCampos: TfrmCadCampos
  Left = 105
  Top = 139
  Caption = 'Cadastro de Campos'
  ClientHeight = 356
  ClientWidth = 566
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 312
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Label4'
  end
  inherited pnlFundo: TPanel
    Width = 566
    Height = 270
    BorderWidth = 2
    object Label1: TLabel
      Left = 12
      Top = 9
      Width = 99
      Height = 13
      Caption = 'Código Resumido'
    end
    object Label3: TLabel
      Left = 119
      Top = 9
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 119
      Top = 48
      Width = 43
      Height = 13
      Caption = 'Apelido'
    end
    object Label8: TLabel
      Left = 119
      Top = 88
      Width = 93
      Height = 13
      Caption = 'Grupo de Dados'
    end
    object lblLocal: TLabel
      Left = 119
      Top = 128
      Width = 102
      Height = 13
      Caption = 'Arquivo de Dados'
    end
    object Label10: TLabel
      Left = 119
      Top = 168
      Width = 216
      Height = 13
      Caption = 'Nome do Campo no Arquivo de Dados'
    end
    object dbedIdCampo: TwwDBEdit
      Left = 12
      Top = 24
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IDCAMPO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescr: TwwDBEdit
      Left = 119
      Top = 24
      Width = 434
      Height = 21
      DataField = 'DESCRICAODOCAMPO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dedApelido: TwwDBEdit
      Left = 119
      Top = 62
      Width = 220
      Height = 21
      CharCase = ecUpperCase
      DataField = 'APELIDO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkpGrupo: TwwDBLookupCombo
      Left = 119
      Top = 102
      Width = 434
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Grupo de Arquivo')
      LookupTable = CdsGrupos
      LookupField = 'CODGRUPOARQUIVO'
      Style = csDropDownList
      Enabled = False
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblkpcmbArq: TwwDBLookupCombo
      Left = 119
      Top = 142
      Width = 434
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TABLENAME'#9'100'#9'Entidade')
      DataField = 'ENTIDADE'
      DataSource = ds
      LookupTable = CdsTabelas
      LookupField = 'TABLENAME'
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblkpcmbArqExit
    end
    object dblkpcmbCampo: TwwDBLookupCombo
      Left = 119
      Top = 182
      Width = 434
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FIELDNAME'#9'100'#9'Nome do Campo')
      DataField = 'NOMEDOCAMPO'
      DataSource = ds
      LookupTable = CdsCampoTabela
      LookupField = 'FIELDNAME'
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbchkCampoObrigatorio: TDBCheckBox
      Left = 119
      Top = 209
      Width = 83
      Height = 16
      Caption = 'Obrigatório'
      DataField = 'FLGOBRIGATORIO'
      DataSource = ds
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbchkCampoVirtual: TDBCheckBox
      Left = 119
      Top = 226
      Width = 59
      Height = 16
      Caption = 'Virtual'
      DataField = 'CAMPODOBANCO'
      DataSource = ds
      TabOrder = 7
      ValueChecked = '2'
      ValueUnchecked = '1'
    end
    object dbchkCampoChave: TDBCheckBox
      Left = 119
      Top = 243
      Width = 59
      Height = 16
      Caption = 'Chave'
      DataField = 'CHAVE'
      DataSource = ds
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbrdTipoDado: TDBRadioGroup
      Left = 272
      Top = 207
      Width = 281
      Height = 51
      Caption = 'Tipo de Dado'
      Columns = 3
      DataField = 'IDTIPODADO'
      DataSource = ds
      Items.Strings = (
        'Numérico'
        'Caracter'
        'Data')
      TabOrder = 9
      Values.Strings = (
        '1'
        '2'
        '3')
    end
  end
  inherited Dock972: TDock97
    Width = 566
  end
  inherited Dock971: TDock97
    Top = 317
    Width = 566
    inherited tb97Fundo: TToolbar97
      Left = 394
      DockPos = 406
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 225
      DockPos = 237
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 45
    Top = 239
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 45
    Top = 191
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 46
    Top = 89
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Campo'
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'GRPARQUIVO.DESCGRUPOARQUIVO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Resumido'
      'Descrição'
      'Grupo de Arquivo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD'
      'CMPBDGRP'
      'GRPARQUIVO')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBDGRP.CODGRUPOARQUIVO')
    Filtro.Strings = (
      'CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO'
      'CMPBDGRP.CODGRUPOARQUIVO = GRPARQUIVO.CODGRUPOARQUIVO'
      'CMPBD.CAMPODOBANCO > 0')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '40')
    Left = 45
    Top = 143
  end
  object CdsTabelas: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsTabelasIndex'
        CaseInsFields = 'TABLENAME'
        Fields = 'TABLENAME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsTabelasIndex'
    Params = <>
    StoreDefs = True
    Left = 516
    Top = 1
  end
  object CdsCampoTabela: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 1
  end
  object CdsGrupos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsGruposIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsGruposIndex'
    Params = <>
    StoreDefs = True
    Left = 362
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 1
  end
end
