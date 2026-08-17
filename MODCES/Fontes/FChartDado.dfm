inherited frmChartDado: TfrmChartDado
  Left = 188
  Top = 148
  Caption = 'Dados de Pesquisa Salarial'
  ClientHeight = 373
  ClientWidth = 576
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 334
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 410
      DockPos = 410
    end
  end
  object Chart1: TChartfx [2]
    Left = 0
    Top = 0
    Width = 576
    Height = 334
    Align = alClient
    TabOrder = 1
    ControlData = {
      883B0000852200006000000000000102550200FFFFFFFF380032002800280002
      00000000000000080001000000000000000000000000000000020000FFFF00C0
      C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
      2008000060080000000800000008000000080000000800000008000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000F0
      3F02000400000000000000000000000000000059400000000000000000000000
      000000000000000000}
  end
  object EditPesq: TEdit [3]
    Left = 117
    Top = 63
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EditPesq'
    Visible = False
  end
  object EditCargo: TEdit [4]
    Left = 117
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'EditCargo'
    Visible = False
  end
  object EditEntid: TEdit [5]
    Left = 117
    Top = 153
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'EditEntid'
    Visible = False
  end
  object edCodEntid: TEdit [6]
    Left = 117
    Top = 189
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'edCodEntid'
    Visible = False
  end
  object dsTend: TwwDataSource
    AutoEdit = False
    Left = 30
    Top = 66
  end
end
