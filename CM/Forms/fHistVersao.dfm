inherited frmHistVersao: TfrmHistVersao
  Left = 338
  Top = 173
  Caption = 'Histórico de Versões'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object grdHistVersao: TStringGrid
      Left = 1
      Top = 1
      Width = 586
      Height = 232
      Align = alClient
      ColCount = 7
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
      TabOrder = 0
      ColWidths = (
        64
        88
        64
        64
        64
        163
        91)
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
end
