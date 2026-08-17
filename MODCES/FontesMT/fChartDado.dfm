inherited frmChartDado: TfrmChartDado
  Left = 111
  Top = 128
  Caption = 'Dados de Pesquisa Salarial'
  ClientHeight = 373
  ClientWidth = 576
  Constraints.MinHeight = 400
  Constraints.MinWidth = 584
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 334
    BorderWidth = 2
    object Chart1: TChartfx
      Left = 4
      Top = 4
      Width = 568
      Height = 326
      Align = alClient
      TabOrder = 0
      ControlData = {
        B43A0000B12100006000000000000102550200FFFFFFFF380032002800280002
        00000000000000080001000000000000000000000000000000020000FFFF00C0
        C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
        2008000060080000000800000008000000080000000800000008000000080000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000F0
        3F02000400000000000000000000000000000059400000000000000000000000
        000000000000000000}
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 410
      DockPos = 410
    end
  end
  object CdsTendencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 490
    Top = 233
  end
end
