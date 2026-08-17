inherited frmSelEstProc: TfrmSelEstProc
  Left = 89
  Top = 118
  HelpContext = 1100023
  Caption = 'Estatística da Quantidade e Custo dos Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
  end
  inherited pnlFundo: TPanel [1]
    inherited pnResult: TPanel
      inline frameGraficoProcesso: TframeGraficoProcesso
        Left = 1
        Top = 1
        Width = 613
        Height = 356
        inherited pgctrlGrafico: TPageControl
          Width = 613
          Height = 356
          inherited tbshQuant: TTabSheet
            inherited Chart1: TChartfx
              Width = 605
              Height = 328
              ControlData = {
                F23B00008E2300006000000000000102550200FFFFFFFF320032002800280002
                00000000000000080001000000000000000000000000000000020000FFFF00C0
                C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
                2008000060080000000800000008000000080000000800000008000000080000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000F0
                3F02000400000000000000000000000000000059400000000000000000000000
                000000000000000000}
            end
          end
          inherited tbshCusto: TTabSheet
            inherited Chart2: TChartfx
              Width = 605
              Height = 328
              ControlData = {
                873E0000E62100006000000000000102552200FFFFFFFF320032002800280002
                00000000000000080001000000000000000000000000000000020000FFFF00C0
                C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
                2008000060080000000800000008000000080000000800000008000000080000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000F0
                3F02000400000000000000000000000000000059400000000000000000000000
                000000000000000000}
            end
          end
        end
      end
    end
    inherited pgctrlPrincipal: TPageControl
      inherited tbshGeral: TTabSheet
        inherited gbxTipEncer: TGroupBox
          TabOrder = 4
        end
        inherited rgParte: TRadioGroup
          TabOrder = 12
        end
        inherited gbxSalario: TGroupBox
          TabOrder = 14
        end
        inherited rgTipoProc: TRadioGroup
          Top = 160
          Height = 40
        end
        object rgDataEncer: TRadioGroup [11]
          Left = 256
          Top = 118
          Width = 344
          Height = 40
          Caption = 'Processos Encerrados Considera-se Data de'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Notificação'
            'Encerramento')
          TabOrder = 2
        end
        inherited gbxTipoProc: TGroupBox
          Top = 202
          Height = 124
          inherited lstTipoProc: TListBox
            Height = 69
          end
        end
        inherited rgTipoAcao: TRadioGroup
          Top = 160
          Height = 40
          TabOrder = 3
        end
        inherited gbxTipoAcao: TGroupBox
          Top = 202
          Height = 124
          inherited lstTipoAcao: TListBox
            Height = 69
          end
        end
      end
    end
  end
end
