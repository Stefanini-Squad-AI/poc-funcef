inherited frmSelRelProc2: TfrmSelRelProc2
  Caption = 'Seleção para o Relatório de Processos'
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited gbxTipEncer: TGroupBox
          inherited cbxArquiv: TCheckBox
            Height = 13
          end
          inherited cbxAcordo: TCheckBox
            Top = 32
            Height = 13
          end
          inherited cbxDesist: TCheckBox
            Height = 13
          end
          inherited cbxSent: TCheckBox
            Top = 32
            Height = 13
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
end
