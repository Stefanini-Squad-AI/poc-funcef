inherited frmSelFolUp: TfrmSelFolUp
  Left = 98
  Top = 118
  HelpContext = 1100018
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
        Width = 613
        Height = 368
        inherited dbgdFollowUp: TwwDBGrid
          Width = 613
          Height = 368
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
