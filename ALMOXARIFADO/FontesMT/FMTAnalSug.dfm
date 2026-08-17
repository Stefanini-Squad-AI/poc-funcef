inherited FrmMTAnalSug: TFrmMTAnalSug
  Left = 5
  Top = 102
  Caption = 'Análise Sugerida'
  ClientHeight = 414
  ClientWidth = 773
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 773
    Height = 375
    object grpItem: TGroupBox
      Left = 1
      Top = 1
      Width = 771
      Height = 302
      Align = alTop
      Caption = 'Itens Analisados'
      TabOrder = 0
      TabStop = True
      object dbGrdItem: TwwDBGrid
        Left = 2
        Top = 15
        Width = 767
        Height = 285
        Selected.Strings = (
          'CODARTIGO'#9'10'#9'Artigo'#9'F'
          'DESCRICAO'#9'35'#9'Descrição'
          'TRMEDCALCULADO'#9'10'#9'Tempo~Ressuprimento~Calculado'
          'TRMEDINFORMADO'#9'10'#9'Tempo~Ressuprimento~Informado'
          'CONSMEDCALCULADO'#9'10'#9'Consumo~Médio~Calculado'
          'CONSMEDINFORMADO'#9'10'#9'Consumo~Médio~Informado'
          'PONTOREPCALCULADO'#9'10'#9'Ponto~Reposição~Calculado'
          'PONTOREPINFORMADO'#9'10'#9'Ponto~Reposição~Informado'
          'QTDEMINCALCULADA'#9'10'#9'Quantidade~Mínima~Calculada'
          'QTDEMININFORMADA'#9'10'#9'Quantidade~Mínima~Informada'
          'QTDESUGAUTO'#9'10'#9'Quantidade~Sugerida~Calculada'
          'QTDESUGCALCULADA'#9'10'#9'Quantidade~Sugerida~Informada'
          'QTDECOMPRAR'#9'10'#9'Qtde~a~Comprar'
          'PERIDOCOMPRA'#9'10'#9'Periodo~de~Compra'
          'SALDOESTOQUE'#9'10'#9'Saldo~em~Estoque')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 2
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = frmMTAnalEstoque.dsDet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        TitleLines = 3
        TitleButtons = False
        OnCalcCellColors = dbGrdItemCalcCellColors
        OnExit = dbGrdItemExit
        IndicatorColor = icBlack
      end
    end
    object gbInformados: TGroupBox
      Left = 1
      Top = 311
      Width = 771
      Height = 63
      Align = alBottom
      Caption = 'Parâmetros Informados'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 126
        Height = 13
        Caption = 'Tempo Ressuprimento'
        Color = clSilver
        ParentColor = False
      end
      object Label2: TLabel
        Left = 141
        Top = 15
        Width = 90
        Height = 13
        Caption = 'Consumo Médio'
      end
      object Label3: TLabel
        Left = 273
        Top = 15
        Width = 116
        Height = 13
        Caption = 'Ponto de Reposição'
      end
      object Label4: TLabel
        Left = 402
        Top = 15
        Width = 111
        Height = 13
        Caption = 'Quantidade Mínima'
      end
      object Label5: TLabel
        Left = 645
        Top = 15
        Width = 93
        Height = 13
        Caption = 'Qtde. a Comprar'
      end
      object Label6: TLabel
        Left = 534
        Top = 15
        Width = 92
        Height = 13
        Caption = 'Período Compra'
      end
      object dbreTRM: TDBRealEdit
        Left = 8
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        OnEnter = dbreTRMEnter
        OnExit = dbreTRMExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TRMEDINFORMADO'
        DataSource = frmMTAnalEstoque.dsDet
      end
      object BitBtn1: TBitBtn
        Left = 106
        Top = 30
        Width = 22
        Height = 23
        TabOrder = 1
        OnClick = BtTRMCheckClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object dbreCM: TDBRealEdit
        Left = 141
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        OnEnter = dbreCMEnter
        OnExit = dbreCMExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONSMEDINFORMADO'
        DataSource = frmMTAnalEstoque.dsDet
      end
      object BtConsMedCheck: TBitBtn
        Left = 239
        Top = 30
        Width = 22
        Height = 23
        TabOrder = 3
        OnClick = BtConsMedCheckClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object dbrePR: TDBRealEdit
        Left = 273
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        OnEnter = dbrePREnter
        OnExit = dbrePRExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PONTOREPINFORMADO'
        DataSource = frmMTAnalEstoque.dsDet
      end
      object BtPtoRedCheck: TBitBtn
        Left = 372
        Top = 30
        Width = 22
        Height = 23
        TabOrder = 5
        OnClick = BtPtoRedCheckClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object dbreQM: TDBRealEdit
        Left = 403
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 6
        WordWrap = False
        OnEnter = dbreQMEnter
        OnExit = dbreQMExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDEMININFORMADA'
        DataSource = frmMTAnalEstoque.dsDet
      end
      object BtQtdeMinCheck: TBitBtn
        Left = 502
        Top = 30
        Width = 22
        Height = 23
        TabOrder = 7
        OnClick = BtQtdeMinCheckClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object dbreQC: TDBRealEdit
        Left = 645
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 9
        WordWrap = False
        OnEnter = dbreQCEnter
        OnExit = dbreQCExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDECOMPRAR'
        DataSource = frmMTAnalEstoque.dsDet
      end
      object dbrePC: TDBRealEdit
        Left = 535
        Top = 30
        Width = 97
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 8
        WordWrap = False
        OnEnter = dbreQMEnter
        OnExit = dbreQMExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'PERIDOCOMPRA'
        DataSource = frmMTAnalEstoque.dsDet
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 773
    inherited tb97Fundo: TToolbar97
      Left = 603
      DockPos = 603
    end
    object btnAceita: TBitBtn
      Left = 31
      Top = 1
      Width = 129
      Height = 34
      Caption = '&Aceita Análise'
      TabOrder = 1
      OnClick = btnAceitaClick
      Glyph.Data = {
        A2010000424DA201000000000000760000002800000017000000190000000100
        0400000000002C01000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888808888888888888888888888808888888888888888888888808887
        7777777777777788888088000000000000000777788080B8B8B80FBFBFB8B000
        088080FBFFFF0BFBFBFB8B8B888088000000BFBFBFFFB8B8B880808B8B8B0BFB
        FBFBFBFBF88080BFBFFF0FFFFFFFBFBFB88088000000FBFFFFFBFFFBF88080B8
        B8BF0FF0FFFFFFBFF88080FBFFFB0B0FFBFBFBFBF88088000000BF0FBFFFFFFF
        F880808B8BFB00FBFBFBFBFBF88080BFBFFF00FFBFBF000008808800000000FB
        FBF0888888808888888880BFBF0888888880888888880BFBF088888888808888
        88880FBF088888888880888888880BF0888888888880888888880FB088888888
        8880888888888008888888888880888888888888888888888880888888888888
        888888888880}
    end
    object BtnRecusar: TBitBtn
      Left = 161
      Top = 1
      Width = 129
      Height = 34
      Caption = '&Recusar Análise'
      TabOrder = 2
      OnClick = BtnRecusarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object BtnSCI: TBitBtn
      Left = 291
      Top = 1
      Width = 129
      Height = 34
      Caption = '&Gerar S.C.I.'
      TabOrder = 3
      OnClick = BtnSCIClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330FFFFF
        FFF03333337F3FFFF3F73333330F0000F0F03333337F777737373333330FFFFF
        FFF033FFFF7FFF33FFF77000000007F00000377777777FF777770BBBBBBBB0F0
        FF037777777777F7F3730B77777BB0F0F0337777777777F7F7330B7FFFFFB0F0
        0333777F333377F77F330B7FFFFFB0009333777F333377777FF30B7FFFFFB039
        9933777F333377F777FF0B7FFFFFB0999993777F33337777777F0B7FFFFFB999
        9999777F3333777777770B7FFFFFB0399933777FFFFF77F777F3070077007039
        99337777777777F777F30B770077B039993377FFFFFF77F777330BB7007BB999
        93337777FF777777733370000000073333333777777773333333}
      NumGlyphs = 2
    end
  end
end
