inherited frmChartOrca: TfrmChartOrca
  Left = 98
  Top = 99
  Caption = 'Orçamento do Custo de Pessoal'
  ClientHeight = 419
  ClientWidth = 603
  Constraints.MinHeight = 380
  Constraints.MinWidth = 420
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 380
    BorderWidth = 2
    object pgctrlGrafico: TPageControl
      Left = 4
      Top = 4
      Width = 595
      Height = 372
      ActivePage = tbshEvolucao
      Align = alClient
      TabOrder = 0
      object tbshEvolucao: TTabSheet
        Caption = 'Evolução'
        object Chart1: TChartfx
          Left = 0
          Top = 0
          Width = 587
          Height = 344
          Align = alClient
          TabOrder = 0
          ControlData = {
            AB3C00008E2300006000000000000102550200FFFFFFFF380032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            2008000060080000000800000008000000080000000800000008000000080000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000F0
            3F02000400000000000000000000000000000059400000000000000000000000
            000000000000000000}
        end
      end
      object tbshRateio: TTabSheet
        Caption = 'Rateio'
        ImageIndex = 1
        object Chart2: TChartfx
          Left = 0
          Top = 0
          Width = 587
          Height = 344
          Align = alClient
          TabOrder = 0
          ControlData = {
            AB3C00008E2300006000000000000102550200FFFFFFFF380032002800280002
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
    Top = 380
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 437
      DockPos = 445
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 363
  end
end
