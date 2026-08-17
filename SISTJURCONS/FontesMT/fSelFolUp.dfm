inherited frmSelFolUp: TfrmSelFolUp
  Left = 98
  Top = 118
  HelpContext = 7190026
  Caption = 'FollowUp de Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnResult: TPanel
      inline frameFollowUp: TframeFollowUp
        Left = 1
        Top = 1
        Width = 617
        Height = 360
        inherited dbgdFollowUp: TwwDBGrid
          Width = 617
          Height = 360
          TitleFont.Height = -9
          TitleFont.Style = [fsBold]
        end
      end
    end
    inherited pgctrlPrincipal: TPageControl
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Enabled = False
        end
        inherited gbxDataEnc: TGroupBox
          Caption = 'Data de Agendamento'
        end
      end
    end
  end
end
