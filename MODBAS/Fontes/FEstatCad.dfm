inherited frmEstatCad: TfrmEstatCad
  Caption = 'Estatísticas do Quadro de Pessoal'
  Constraints.MinHeight = 392
  Constraints.MinWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxEstab: TGroupBox [3]
          end
          inherited gbxCargo: TGroupBox [4]
          end
          inherited gbxLotacao: TGroupBox [5]
          end
          inherited gbxSindi: TGroupBox [6]
          end
        end
      end
      inherited pnResult: TPanel [1]
        object Chart1: TChartfx
          Left = 1
          Top = 1
          Width = 602
          Height = 314
          Align = alClient
          TabOrder = 0
          ControlData = {
            383E0000742000006000000000000105550200FFFFFFFF380032002800280002
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
  inherited qryMotivo: TwwQuery
    Top = 301
  end
end
