inherited frmCadReferenciaContr: TfrmCadReferenciaContr
  Left = 179
  Top = 203
  Caption = 'Cadastro de Referências Contratuais'
  ClientHeight = 195
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 109
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 117
      Height = 13
      Caption = 'Nome da Referência'
      FocusControl = dbeNomeReferencia
    end
    object dbeNomeReferencia: TDBEdit
      Left = 16
      Top = 48
      Width = 473
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 156
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 458
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 264
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 292
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Left = 336
    Top = 65535
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'select * from REFERENCIACONTR')
    ClientDataSet = Cds
    Left = 392
    Top = 56
  end
end
