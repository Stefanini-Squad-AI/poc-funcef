inherited frmSelConProc: TfrmSelConProc
  Left = 91
  Top = 124
  HelpContext = 760023
  Caption = 'Consulta Geral de Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pgctrlPrincipal: TPageControl [0]
    end
    inherited pnResult: TPanel [1]
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 613
        Height = 368
        Selected.Strings = (
          'NOME'#9'35'#9'Contraparte'#9'F'
          'NUMPROCTRAB'#9'12'#9'Num.Interno'
          'CODIGOTRT'#9'6'#9'TRT'
          'JCJ'#9'10'#9'JCJ'
          'PROCJCJNUM'#9'15'#9'Num.Proc. na JCJ'
          'DATANOTIF'#9'10'#9'Data Notif.'
          'DATAEFETENC'#9'11'#9'Data Encerram.'
          'CUSTOPROC'#9'10'#9'Custo'
          'FLGSITPROC'#9'10'#9'Encerrado?')
        IniAttributes.Delimiter = ';;'
        TitleColor = clGray
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      DockPos = 628
    end
    inherited TB97oKCancelar: TToolbar97
      DockPos = 202
    end
    object Toolbar971Detalhe: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      Visible = False
      object bbtnDetalhe: TBitBtn
        Left = 0
        Top = 0
        Width = 106
        Height = 33
        Hint = 'Ver Todos os Dados do Processo Apontado'
        Cancel = True
        Caption = '  &Detalhes'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
  end
  object dsProcesso: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcesso
    Left = 308
    Top = 292
  end
end
