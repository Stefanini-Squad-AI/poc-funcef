inherited frmSelEstProc: TfrmSelEstProc
  Left = 134
  Top = 131
  HelpContext = 760031
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Height = 32
        end
        inherited gbxTipEncer: TGroupBox
          Top = 34
        end
        inherited gbxFaixaAju: TGroupBox
          TabOrder = 13
        end
        inherited gbxFaixaData: TGroupBox
          TabOrder = 5
        end
        inherited gbxDataEnc: TGroupBox
          TabOrder = 6
        end
        inherited gbxTempAdm: TGroupBox
          TabOrder = 7
        end
        inherited rgTipoProc: TRadioGroup
          TabOrder = 8
        end
        inherited gbxTipoProc: TGroupBox
          TabOrder = 9
        end
        inherited rgTipoAcao: TRadioGroup
          TabOrder = 12
        end
        inherited gbxTipoAcao: TGroupBox
          TabOrder = 11
        end
        object rgDataEncer: TRadioGroup
          Left = 4
          Top = 84
          Width = 276
          Height = 32
          Caption = 'Processos Encerrados Considera-se Data de'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Notificação'
            'Encerramento')
          TabOrder = 10
        end
      end
    end
  end
end
