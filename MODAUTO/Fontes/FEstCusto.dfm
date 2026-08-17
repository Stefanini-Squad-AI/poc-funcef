inherited frmEstCusto: TfrmEstCusto
  Left = 150
  Top = 119
  Caption = 'Estatística de Custos de RH'
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
          inherited gbxLotacao: TGroupBox [2]
          end
          inherited rgSelSindi: TRadioGroup [3]
          end
          inherited gbxEstab: TGroupBox [4]
          end
          inherited gbxCargo: TGroupBox [5]
          end
          inherited rgSelRamo: TRadioGroup [6]
          end
          inherited gbxSindi: TGroupBox [7]
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
            383E0000742000006000000000000102550200FFFFFFFF320032002800280002
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
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 452
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
      DockPos = 205
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  inherited tblProfis: TwwQuery
    Top = 284
  end
  inherited qryGrauInstr: TwwQuery
    Top = 285
  end
  inherited qryRamo: TwwQuery
    Top = 281
  end
  inherited qryMotivo: TwwQuery
    Top = 285
  end
  object qryCargo2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '
      '  TITULO, CODGRPFUNC '
      'FROM '
      '  CARGO '
      'WHERE  TITULO = :TITULO')
    ValidateWithMask = True
    Left = 493
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TITULO'
        ParamType = ptUnknown
      end>
  end
end
