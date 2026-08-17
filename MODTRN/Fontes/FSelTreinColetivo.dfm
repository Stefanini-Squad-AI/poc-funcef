inherited frmSelTreinColetivo: TfrmSelTreinColetivo
  Caption = 'Selecionar Pessoas a Inscrever'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl
        inherited tsDadosFunc: TTabSheet
          inherited rgSequencia: TGroupBox
            Visible = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnOutraVez: TBitBtn
        ModalResult = 0
        Kind = bkCustom
      end
    end
  end
end
