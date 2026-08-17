inherited frmSelFolUp: TfrmSelFolUp
  Left = 139
  Top = 131
  HelpContext = 760024
  Caption = 'Seleçao para o FollowUp de Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Enabled = False
          ItemIndex = 0
        end
        inherited gbxDataEnc: TGroupBox
          Caption = 'Data de Agendamento'
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
