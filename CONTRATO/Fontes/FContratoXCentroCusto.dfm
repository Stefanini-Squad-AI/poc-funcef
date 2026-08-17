inherited frmContratoXCentroCusto: TfrmContratoXCentroCusto
  Left = 227
  Top = 164
  Caption = 'Contratos por CentroCusto'
  ClientHeight = 165
  ClientWidth = 438
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 438
    Height = 126
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 96
      Height = 13
      Caption = 'Centro de Custo:'
    end
    object CMDBLookupCombo1: TCMDBLookupCombo
      Left = 144
      Top = 48
      Width = 257
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = qryCentroCusto
      LookupField = 'NOME'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 126
    Width = 438
    inherited tb97Fundo: TToolbar97
      Left = 268
      DockPos = 268
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      DockPos = 100
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CE.NOME,R.CODCENTROCUSTO'
      'FROM'
      'RATEIOCENTROCUSTO R,'
      'CONTRATOCONTR C,'
      'CENTCUST CE'
      'WHERE'
      '(R.IDCONTRATO = C.IDCONTRATO)'
      'AND (CE.CODCENTROCUSTO = R.CODCENTROCUSTO)'
      'GROUP BY CE.NOME,R.CODCENTROCUSTO'
      '')
    ValidateWithMask = True
    Left = 149
    Top = 12
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'RATEIOCENTROCUSTO.CODCENTROCUSTO'
      Size = 10
    end
  end
end
5
    Width = 378
    inherited tb97Fundo: TToolbar97
      Left = 195
      DockPos = 195
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 27
      DockPos = 27
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 219
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
NTRATO'
      'where'
     
