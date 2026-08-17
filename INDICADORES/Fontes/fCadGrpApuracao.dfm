inherited frmCadGrpApuracao: TfrmCadGrpApuracao
  Left = 218
  Top = 170
  Caption = 'Cadastro de Grupo de Apuração'
  ClientHeight = 263
  ClientWidth = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 177
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 87
      Top = 80
      Width = 305
      Height = 73
      Caption = 'Tipo de Grupo'
      Columns = 2
      Items.Strings = (
        'Centro de Custo'
        'Função / Cargo'
        'Grupo de Abono'
        'Outros')
      TabOrder = 0
    end
    object wwDBEdit1: TwwDBEdit
      Left = 24
      Top = 40
      Width = 433
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 480
  end
  inherited Dock971: TDock97
    Top = 224
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 310
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 143
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 215
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 80
    Top = 215
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 304
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Active = True
    ProviderName = 'DataSetProvider1'
    Left = 396
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
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
