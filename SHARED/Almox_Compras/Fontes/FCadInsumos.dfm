inherited frmCadInsumos: TfrmCadInsumos
  Caption = 'Cadastro de Insumos -'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsImposto
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
          end
          inherited pnlControlesDet: TPanel [1]
          end
        end
      end
    end
  end
  inherited qryTipoAgre: TwwQuery
    Left = 579
    Top = 389
  end
end
