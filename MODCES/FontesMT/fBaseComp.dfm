inherited frmBaseComp: TfrmBaseComp
  Left = 96
  Top = 152
  Caption = 'Base para o Comparativo de Impacto Salarial'
  Constraints.MinHeight = 399
  Constraints.MinWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited pgctrlPrincipal: TPageControl
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            Caption = 'Tipo de Contrato'
            inherited cbxCandidatos: TCheckBox
              Enabled = False
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
    end
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
