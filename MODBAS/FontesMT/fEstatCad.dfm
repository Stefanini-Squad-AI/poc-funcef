inherited frmEstatCad: TfrmEstatCad
  HelpContext = 690020
  Caption = 'Estatísticas do Quadro de Pessoal'
  Constraints.MinHeight = 392
  Constraints.MinWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited pgctrlPrincipal: TPageControl [0]
      end
      inherited pnResult: TPanel [1]
        object Chart1: TChartfx
          Left = 1
          Top = 1
          Width = 602
          Height = 321
          Align = alClient
          TabOrder = 0
          ControlData = {
            383E00002D2100006000000000000105550200FFFFFFFF380032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            200800006000000010F6FFFFFF000000000000000000000000BC020000020000
            000000000005417269616C080000000800000008000000080000000800000008
            0000000000000000000000000000000000000000000000000000000000000000
            0000001C0000000000600054206300E830630068316300E0F2620000000000DC
            D86C0018000000000060006F00000000000000FC4767000C0060009471620010
            0000000000600053000000CCF66200444E660008000000000060006F00000000
            00000000000000000000000000F03F0200040000000000000000000000000000
            0059400000000000000000000000000000000000000000}
        end
      end
    end
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
