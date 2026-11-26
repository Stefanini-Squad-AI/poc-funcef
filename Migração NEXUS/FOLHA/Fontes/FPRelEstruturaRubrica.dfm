inherited frmPRelEstruturaRubrica: TfrmPRelEstruturaRubrica
  Left = 198
  Top = 192
  HelpContext = 180072
  Caption = 'Relatório de Estrutura Rubrica'
  ClientHeight = 177
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 138
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Estrutura Rubrica'
    end
    object dblkEstruturaRubrica: TwwDBLookupCombo
      Left = 25
      Top = 91
      Width = 474
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
      LookupTable = qryestruturaCalcula
      LookupField = 'IDESTRUTURA'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblkEstruturaRubricaChange
    end
    object rdoSelecaoEstrutura: TRadioGroup
      Left = 30
      Top = 14
      Width = 136
      Height = 57
      Caption = 'Seleção de Estrutura'
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Seleciona')
      TabOrder = 1
      OnClick = rdoSelecaoEstruturaClick
    end
  end
  inherited Dock971: TDock97
    Top = 138
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 91
  end
  object qryestruturaCalcula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM  ESTRUTURACALCULO')
    ValidateWithMask = True
    Left = 225
    object qryestruturaCalculaIDESTRUTURA: TFloatField
      FieldName = 'IDESTRUTURA'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDESTRUTURA'
    end
    object qryestruturaCalculaIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDREGRA'
    end
    object qryestruturaCalculaIDRUBRICAEXIBICAO: TFloatField
      FieldName = 'IDRUBRICAEXIBICAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDRUBRICAEXIBICAO'
    end
    object qryestruturaCalculaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.DESCRICAO'
      Size = 60
    end
    object qryestruturaCalculaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.TRGDTINCLUSAO'
    end
    object qryestruturaCalculaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryestruturaCalculaIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
      Origin = 'BASEDADOS.ESTRUTURACALCULO.IDFUNDACAO'
    end
  end
  object dsEstruturaCalculo: TwwDataSource
    DataSet = qryestruturaCalcula
    Left = 329
  end
end
