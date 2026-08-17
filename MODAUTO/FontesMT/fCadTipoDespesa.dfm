inherited frmCadTipoDespesa: TfrmCadTipoDespesa
  Left = 343
  Top = 186
  HelpContext = 4170033
  Caption = 'Tipo de Despesa Realizada em Destacamentos'
  ClientHeight = 340
  ClientWidth = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 254
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object lblDescricao: TLabel
      Left = 16
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblTarifa: TLabel
      Left = 15
      Top = 199
      Width = 105
      Height = 13
      Caption = 'Baseada na Tarifa'
      Visible = False
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      Color = clGray
      DataField = 'IDDSTTIPODESPESA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescricao: TwwDBEdit
      Left = 15
      Top = 67
      Width = 395
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTarifa: TwwDBLookupCombo
      Left = 15
      Top = 213
      Width = 395
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Nome da Tarifa'#9'F')
      DataField = 'IDDSTTARIFA'
      DataSource = ds
      LookupTable = CdsTarifa
      LookupField = 'IDDSTTARIFA'
      DropDownWidth = 314
      TabOrder = 2
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbrgTipo: TDBRadioGroup
      Left = 15
      Top = 100
      Width = 395
      Height = 37
      Caption = 'Despesa Informada em'
      Columns = 2
      DataField = 'INDVALORQUANT'
      DataSource = ds
      Items.Strings = (
        'Valor'
        'Quantidade')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgTipoChange
    end
    object dbrgFlgDiaria: TDBRadioGroup
      Left = 15
      Top = 149
      Width = 395
      Height = 37
      Caption = 'Despesa Corresponde a Acerto Automático de Diárias ?'
      Columns = 2
      DataField = 'FLGDIARIA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgTipoChange
    end
  end
  inherited Dock972: TDock97
    Width = 421
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 249
      DockPos = 515
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4170033
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      DockPos = 346
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 527
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 366
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 527
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 465
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 338
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Despesa'
    Colunas.Strings = (
      'DESCRICAO'
      'IDDSTTIPODESPESA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DSTTIPODESPESA')
    CamposChave.Strings = (
      'IDDSTTIPODESPESA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '20')
    Left = 273
    Top = 2
  end
  object CdsTarifa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 201
  end
  object CdsDstDespesaDiaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 57
  end
end
