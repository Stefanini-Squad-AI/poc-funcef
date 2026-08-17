inherited frmCadastroGridMTImob: TfrmCadastroGridMTImob
  Left = 130
  Top = 183
  Caption = 'frmCadastroGridMTImob'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid
      TitleButtons = True
      OnCalcCellColors = dbGrdCalcCellColors
      OnTitleButtonClick = dbGrdTitleButtonClick
      OnDblClick = dbGrdDblClick
      OnTopRowChanged = dbGrdTopRowChanged
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 42
    Top = 65503
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 65528
    Top = 65503
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyInsert = CmeCadastroApplyInsert
    Left = 328
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 276
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 392
    Top = 65535
  end
end
