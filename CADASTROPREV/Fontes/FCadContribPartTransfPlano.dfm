inherited frmCadContribPartTransfPlano: TfrmCadContribPartTransfPlano
  BorderIcons = []
  Caption = 'Cadastro de Contribuições do Participante'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        inherited pnlContrib: TPanel
          inherited pnlControlesDet: TPanel
            inherited Panel4: TPanel
              inherited bbtnVoltarDet: TBitBtn
                OnClick = nil
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        OnClick = nil
      end
      inherited sbtnApagar: TToolbarButton97
        OnClick = nil
      end
    end
  end
  inherited MontaSelectPart: TMontaSelect
    Left = 208
    Top = 236
  end
end
