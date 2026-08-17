inherited frmSelEstProc: TfrmSelEstProc
  Left = 143
  Top = 133
  HelpContext = 1100023
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited gbxTipEncer: TGroupBox
          Top = 46
          Height = 80
          inherited cbxArquiv: TCheckBox
            Top = 24
          end
          inherited cbxAcordo: TCheckBox
            Top = 50
          end
          inherited cbxDesist: TCheckBox
            Top = 24
          end
          inherited cbxSent: TCheckBox
            Top = 50
          end
        end
        inherited gbxSalario: TGroupBox
          Top = 46
          Height = 45
        end
        inherited rgTipoAcao: TRadioGroup
          TabOrder = 14
        end
        object rgDataEncer: TRadioGroup
          Left = 315
          Top = 94
          Width = 276
          Height = 32
          Caption = 'Processos Encerrados Considera-se Data de'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Notificação'
            'Encerramento')
          TabOrder = 12
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
