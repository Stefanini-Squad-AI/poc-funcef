inherited frmCadTpPagtoBeneficioMT: TfrmCadTpPagtoBeneficioMT
  Left = 390
  Top = 294
  Caption = 'Cadastro de Forma de Pagamento'
  ClientHeight = 294
  ClientWidth = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 443
    Height = 208
    object Label2: TLabel
      Left = 7
      Top = 9
      Width = 199
      Height = 13
      Caption = 'Descrição da Forma de Pagamento'
      FocusControl = dbedNome
    end
    object lbPeriodicidade: TLabel
      Left = 7
      Top = 103
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
      Visible = False
    end
    object lblQtdeMeses: TLabel
      Left = 10
      Top = 153
      Width = 90
      Height = 13
      Caption = 'Qtde. de Meses'
      Visible = False
    end
    object dbedNome: TDBEdit
      Left = 7
      Top = 24
      Width = 334
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbrgrpTpPagto: TDBRadioGroup
      Left = 7
      Top = 55
      Width = 425
      Height = 41
      Caption = 'Tipo de Pagamento'
      Columns = 3
      DataField = 'FLGFREQUENCIA'
      DataSource = ds
      Items.Strings = (
        '&Unico'
        '&Indeterminado'
        '&Determinado')
      TabOrder = 1
      TabStop = True
      Values.Strings = (
        'U'
        'I'
        'D')
      OnChange = dbrgrpTpPagtoChange
    end
    object dblkcmbPeriodicidade: TwwDBLookupCombo
      Left = 7
      Top = 119
      Width = 334
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Periodicidade')
      DataField = 'IDTPPERIODICIDADE'
      DataSource = ds
      LookupTable = cdsTpPeriodicidade
      LookupField = 'IDTPPERIODICIDADE'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dbedQtdeMeses: TDBEdit
      Left = 10
      Top = 168
      Width = 121
      Height = 21
      DataField = 'QTDEMESES'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 443
  end
  inherited Dock971: TDock97
    Top = 255
    Width = 443
    inherited tb97Fundo: TToolbar97
      Left = 271
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 168
    Top = 223
  end
  inherited ds: TwwDataSource
    Left = 198
    Top = 223
  end
  inherited ImlPadrao: TImageList
    Left = 168
    Top = 191
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 261
    Top = 191
  end
  inherited Cds: TCMClientDataSet
    Left = 198
    Top = 191
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Pagamento'
    Colunas.Strings = (
      'NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Pagamento')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TPPAGTOBENEFICIO')
    CamposChave.Strings = (
      'IDTPPAGTOBENEFIC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 260
    Top = 223
  end
  object cdsTpPeriodicidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 230
    Top = 191
  end
  object dsTpPeriodicidade: TwwDataSource
    AutoEdit = False
    DataSet = cdsTpPeriodicidade
    Left = 230
    Top = 223
  end
end
