inherited frmIncRubrica: TfrmIncRubrica
  Left = 88
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Inclusão Coletiva de Benefício'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 353
      DockPos = 453
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 177
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 186
      DockPos = 206
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 275
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
