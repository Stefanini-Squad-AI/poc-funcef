inherited frmCadIndicador: TfrmCadIndicador
  Left = 239
  Top = 116
  Caption = 'Cadastro de Indicadores'
  ClientHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 279
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 24
      Top = 184
      Width = 111
      Height = 13
      Caption = 'Unidade de Medida'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 24
      Top = 32
      Width = 441
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 24
      Top = 64
      Width = 209
      Height = 79
      Caption = 'Tipo de Indicador'
      Items.Strings = (
        'Receita'
        'Despesa'
        'Desempenho')
      TabOrder = 1
      Values.Strings = (
        'R'
        'D'
        'E')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 256
      Top = 64
      Width = 209
      Height = 79
      Caption = 'Tipo de Dado'
      Items.Strings = (
        'Numérico'
        'Caracter'
        'Data')
      TabOrder = 2
      Values.Strings = (
        'R'
        'D'
        'E')
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 160
      Width = 209
      Height = 89
      Caption = 'Obriga Informações de'
      TabOrder = 3
      object DBCheckBox1: TDBCheckBox
        Left = 17
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Contrato'
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 17
        Top = 40
        Width = 136
        Height = 17
        Caption = 'Grupo de Apuração'
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 17
        Top = 60
        Width = 160
        Height = 17
        Caption = 'Sub-grupo de Apuração'
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object wwDBComboBox1: TwwDBComboBox
      Left = 24
      Top = 200
      Width = 137
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'R$'
        'M2'
        'M3'
        'KW'
        'KWh'
        'UN'
        'UFER')
      Sorted = False
      TabOrder = 4
      UnboundDataType = wwDefault
    end
  end
  inherited Dock971: TDock97
    Top = 326
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 34
    Top = 295
  end
  inherited ds: TwwDataSource
    Left = 132
    Top = 283
  end
  inherited ImlPadrao: TImageList
    Left = 34
    Top = 303
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 264
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Active = True
    ProviderName = 'DataSetProvider1'
    Left = 92
    Top = 311
  end
  inherited MontaSelect: TMontaSelect
    Left = 336
    Top = 65535
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 176
    Top = 175
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                            '#39' AS DESCRICAO'
      'FROM DUAL')
    Left = 176
    Top = 191
  end
end
