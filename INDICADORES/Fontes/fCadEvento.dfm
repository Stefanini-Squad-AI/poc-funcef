inherited frmCadEvento: TfrmCadEvento
  Left = 253
  Top = 194
  Caption = 'Cadastro de Eventos'
  ClientHeight = 207
  ClientWidth = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 461
    Height = 121
    object Label1: TLabel
      Left = 58
      Top = 33
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 58
      Top = 50
      Width = 345
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 461
  end
  inherited Dock971: TDock97
    Top = 168
    Width = 461
    inherited tb97Fundo: TToolbar97
      Left = 291
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 124
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 159
  end
  inherited ds: TwwDataSource
    Left = 374
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 72
    Top = 159
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 320
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Active = True
    ProviderName = 'DataSetProvider1'
    Left = 412
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 264
    Top = 65535
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 408
    Top = 63
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                            '#39' AS DESCRICAO'
      'FROM DUAL')
    Left = 408
    Top = 79
  end
end
