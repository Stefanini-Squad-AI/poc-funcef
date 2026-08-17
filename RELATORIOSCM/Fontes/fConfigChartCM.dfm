inherited frmConfigChartCM: TfrmConfigChartCM
  Left = 343
  Top = 183
  Caption = 'Configura Gráficos'
  ClientHeight = 412
  ClientWidth = 671
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 671
    Height = 373
    object Grafico: TDBChart
      Left = 5
      Top = 5
      Width = 661
      Height = 363
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -16
      Title.Font.Name = 'Arial'
      Title.Font.Style = []
      Title.Text.Strings = (
        'Modelo do Gráfico')
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 671
    inherited tb97Fundo: TToolbar97
      Left = 501
      DockPos = 501
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 93
      DockPos = 93
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 163
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Editar'
        TabOrder = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888887000788888880080990BB08000088809990BBB0888888099990BBBB
          088887999990BBBBB78880999990BBBBB08880999990000000888099990A0CCC
          C088879990AAA0CCC78888090AAAAA0C08888880AAAAAAA0888880880AAAAA08
          8000888887000788888888888888888888888888888888888888}
        Spacing = 2
      end
    end
  end
  object SqlGrafico: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 293
    Top = 125
  end
end
