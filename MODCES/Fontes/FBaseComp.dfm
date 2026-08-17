inherited frmBaseComp: TfrmBaseComp
  Left = 127
  Top = 109
  Caption = 'Base para o Comparativo de Impacto Salarial'
  ClientHeight = 372
  Constraints.MinHeight = 399
  Constraints.MinWidth = 622
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 333
    inherited pnSelecao: TPanel
      Height = 325
      inherited pnResult: TPanel
        Height = 323
      end
      inherited PageControl1: TPageControl
        Height = 323
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            Caption = 'Tipo de Contrato'
            inherited cbxCandidatos: TCheckBox
              Enabled = False
              Visible = False
            end
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            Height = 295
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 333
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
end
