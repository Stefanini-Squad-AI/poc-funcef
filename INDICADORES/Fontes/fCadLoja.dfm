inherited frmCadLoja: TfrmCadLoja
  Left = 279
  Top = 148
  Caption = 'Cadastro de Lojas'
  ClientHeight = 265
  ClientWidth = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 179
    object Label2: TLabel
      Left = 24
      Top = 69
      Width = 25
      Height = 13
      Caption = 'Piso'
    end
    object Label3: TLabel
      Left = 172
      Top = 69
      Width = 46
      Height = 13
      Caption = 'Nr. Loja'
    end
    object Label4: TLabel
      Left = 320
      Top = 69
      Width = 24
      Height = 13
      Caption = 'ABL'
    end
    object wwDBEdit2: TwwDBEdit
      Left = 24
      Top = 85
      Width = 105
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit3: TwwDBEdit
      Left = 172
      Top = 85
      Width = 105
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit4: TwwDBEdit
      Left = 320
      Top = 85
      Width = 105
      Height = 21
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object RadioGroup1: TRadioGroup
      Left = 24
      Top = 124
      Width = 253
      Height = 38
      Caption = 'Situação'
      Columns = 2
      Items.Strings = (
        'Ativa'
        'Inativa')
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 459
  end
  inherited Dock971: TDock97
    Top = 226
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 289
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 122
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 223
  end
  inherited ds: TwwDataSource
    Left = 414
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 72
    Top = 223
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 312
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Active = True
    ProviderName = 'DataSetProvider1'
    Left = 372
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 248
    Top = 65535
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 376
    Top = 167
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                            '#39' AS DESCRICAO'
      'FROM DUAL')
    Left = 312
    Top = 167
  end
end
