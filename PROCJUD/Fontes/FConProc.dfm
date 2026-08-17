inherited frmConProc: TfrmConProc
  Left = 148
  Top = 150
  Caption = 'Consulta Geral de Processos'
  ClientHeight = 377
  ClientWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 338
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 608
    object bbtnDetalhe: TBitBtn
      Left = 5
      Top = 2
      Width = 80
      Height = 33
      Hint = 'Ver Todos os Dados do Processo Apontado'
      Cancel = True
      Caption = '&Detalhes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = bbtnDetalheClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  object pnSelecao: TPanel [2]
    Left = 0
    Top = 0
    Width = 608
    Height = 338
    Align = alClient
    TabOrder = 2
    object pnResult: TPanel
      Left = 1
      Top = 1
      Width = 606
      Height = 336
      Align = alClient
      TabOrder = 0
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 604
        Height = 334
        Selected.Strings = (
          'NOME'#9'35'#9'Contra-Parte'
          'NOMEVARA'#9'40'#9'Nome da Vara'
          'NUMVARAJUSTICA'#9'10'#9'Vara Nº'
          'PROCJCJNUM'#9'15'#9'Num.Proc. na Vara'
          'DATANOTIF'#9'10'#9'Data Notif.'
          'DATAEFETENC'#9'11'#9'Data Encerram.'
          'CUSTOPROC'#9'10'#9'Custo'
          'FLGSITPROC'#9'10'#9'Encerrado?'
          'NUMPROCTRAB'#9'12'#9'Num.Interno')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = frmSelConProc.ds
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
end
