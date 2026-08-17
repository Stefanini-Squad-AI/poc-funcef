inherited frmSelFolUp: TfrmSelFolUp
  Left = 86
  Top = 114
  HelpContext = 1110019
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
        Height = 356
        inherited dbgdFollowUp: TwwDBGrid
          Width = 613
          Height = 356
          Selected.Strings = (
            'NUMPROCTRAB'#9'7'#9'Processo'
            'DATAREALOCOR'#9'15'#9'Data Prevista (Real)'
            'NUMSEQ'#9'5'#9'Etapa'
            'DESCRICAO'#9'43'#9'Tipo de Etapa (Andamento)'
            'ASSUNTO'#9'40'#9'Assunto (Resumido)'
            'NOME'#9'60'#9'Reclamante')
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
