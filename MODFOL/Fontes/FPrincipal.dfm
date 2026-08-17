inherited frmPrincipal: TfrmPrincipal
  Left = 335
  Top = 190
  Caption = 'Folha de Pagamento'
  ClientHeight = 395
  ClientWidth = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 689
    Height = 38
    inherited fcLabel2: TfcLabel
      Top = 6
    end
    inherited tb97Atalho: TToolbar97
      Left = 0
      DockPos = 0
      inherited sbtnHelp: TToolbarButton97
        Left = 64
        Width = 32
        Height = 32
      end
      inherited sbtnSair: TToolbarButton97
        Width = 32
        Height = 32
      end
      inherited sbtnFluxOper: TToolbarButton97
        Left = 143
        Width = 32
        Height = 32
      end
      inherited ToolBarsep973: TToolbarSep97
        Left = 96
        SizeHorz = 15
      end
      inherited sbtnMudaEmpresa: TToolbarButton97
        Left = 175
        Width = 32
        Height = 32
      end
      inherited sbtnListaMensagens: TToolbarButton97
        Left = 222
        Width = 32
        Height = 32
      end
      inherited sepCM2: TToolbarSep97
        Left = 207
        SizeHorz = 15
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 254
        Width = 32
        Height = 32
      end
      inherited btnExecEtapa: TToolbarButton97
        Left = 111
        Width = 32
        Height = 32
      end
      inherited SbtLogin_Padrao: TToolbarButton97
        Left = 32
        Width = 32
        Height = 32
      end
    end
    object Toolbar971: TToolbar97
      Left = 299
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 299
      DragHandleStyle = dhNone
      TabOrder = 1
      object tbarbtCadPessoal: TToolbarButton97
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Cadastro de Pessoal'
        Glyph.Data = {
          62040000424D6204000000000000420000002800000016000000180000000100
          1000030000002004000000000000000000000000000000000000007C0000E003
          00001F0000001863186318631863186318631863186318631863186318631863
          1863186318631863186318631863186318631863186318631863186318631863
          1863186318631863186318631863186318631863186318631863186318631863
          1863186300000000000018630000000000001863186318631863100018631000
          0000186318631863186318631863186318631000100010001000186318631863
          1863186318630040186300400000186318631863186318631863186318631000
          1000100010001863186318631863186318630040186300401863186318631863
          1863186318631863186310001000100010001863186318631863186318630040
          1863004018631863186318631863186318631863186310001000100010001863
          0000186318631863186300401863004018630040000018631863186318631863
          1863100010001000100018630000186318631863186300001042000018630040
          0000186318631863186318631863100010001000100018630000186318631863
          1042100010001000104200400000186318631863186300401863100010001000
          1000186300001863186300401042100010001000104200400000186318631863
          1863186310421000100010001000104200401042186310421F001F001F001F00
          0000000000001863186318631863100010421000100010001000104218631863
          186300001F001F0010001F000000186300401863186318631863100018631000
          10001000100010421000186318631F0010001F0010001F001000000018631863
          18631863186310001042100010001000100018631000186318631F0010001F00
          1F001F0010000000186318631863186318631000100010001863186310001000
          1000186318631F0010001F0000001F001F000000186318631863186318631000
          10001000FF7FFF7F100010001000186318631F001000000018631F001F001042
          18631863186318631863100010001000FF7FFF7F100010001000186318631F00
          1F00FF7F1F0000001F00186318631863186318631863100010001000FF7FFF7F
          100010001042186318631F001F00FF7F1F0000001F0018631863186318631863
          1863186318631863186318631863186318631863186318631863000000401863
          1863186318631863186318631863186318631863000000001863186318631863
          1863186310420040004000001042186318631863186318631863186318630000
          0040004000001863186318631863186318630000004000001863186318631863
          1863186318631863186300000000000000001863186318631863186318630000
          0000000018631863186318631863186318631863186318631042104218631863
          1863186318631863186310421042186318631863186318631863186318631863
          1863186318631863186318631863186318631863186318631863186318631863
          186318631863}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuPessoalClick
      end
      object tbarbtCadRubrica: TToolbarButton97
        Left = 32
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Cadastro de Rubricas Salariais'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0088888880FF08
          888888888FF78F7888888887000FF088888888887778F78888888870FFFF0888
          888888878FF87F8888F8880F00FF08888888887F778F7F888F788800880F0888
          80888877887F7F88F7888807880F0888038888788878788F78F8888870F07880
          3388888887F788F78F788888000788033388888877788F78F788888888888033
          388888888FF8F78F78888888008803338888888877FF78F78888888080803338
          8888888787F78F7888888808000333888888887F777FF7888888880000003888
          8888887777777F8888888888000008888888888877777FF88888888830000788
          888888887F7777FFF88888883380000088888888778777778888}
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuRubricasSalariaisClick
      end
      object tbarbtCadFormaCalc: TToolbarButton97
        Left = 64
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Cadastro de Formas de Cálculo'
        Glyph.Data = {
          EE050000424DEE05000000000000360400002800000011000000160000000100
          080000000000B801000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFC000000FCFC00000000000000000000000000FCFC00
          0000FC000606060606060606060606060600FC000000FC00FE00000600000600
          000600000600FC000000FC00FEFE0006FE0006FE0006FE000600FC000000FC00
          FE06060606060606060606060600FC000000FC00FE0000060000060000060000
          0600FC000000FC00FEFE0006FE0006FE0006FE000600FC000000FC00FE060606
          06060606060606060600FC000000FC00FE00000600000600000600000600FC00
          0000FC00FEFE0006FE0006FE0006FE000600FC000000FC00FE06060606060606
          060606060600FC000000FC00FE00000600000600000600000600FC000000FC00
          FEFE0006FE0006FE0006FE000600FC000000FC00FE0606060606060606060606
          0600FC000000FC00FE06060606060606060606060600FC000000FC00FE0007FF
          FFFFFFFFFFFFFF000600FC000000FC00FE00070707070707070707000600FC00
          0000FC00FE00000000000000000000000600FC000000FC00FEFEFEFEFEFEFEFE
          FEFEFEFE0600FC000000FCFC00000000000000000000000000FCFC000000FCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFC000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuCadFormaCalcClick
      end
      object tbarbtCadTabGener: TToolbarButton97
        Left = 96
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Cadastro de Tabelas Genéricas'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuCadTabGenericaClick
      end
    end
    object Toolbar972: TToolbar97
      Left = 431
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 431
      DragHandleStyle = dhNone
      TabOrder = 2
      object tbarbtLancRubPorPessoa: TToolbarButton97
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Lançamento de Rubricas por Pessoa'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          888880000000000000888888888888888888807707FFF7077088888888888888
          8888807707FCF70770888888888888888888807707FCF7077088888888888888
          8888807777F6F77770888888888888888888807777FCF7777088888888888888
          8888880000000000088888888888888888888888888888888888888888888888
          8888888888000888888888888888888888888888803B30888888888888888888
          8888888880B3B088888888888888888888888888803B3088888888888880FF08
          888888888800088888888887000FF08888888888888F888888888870FFFF0888
          8888888888F488888888880F00FF0888888888888F4CC88888888800880F0888
          80888888F4CCCC8888888807880F0888038888884CCCCCC88888888870F07880
          338888888F4CC8888888888800078803338888888F4CC8888888888888888033
          388888888F4CC88888888888008803338888F8F8FF4CC8888888888080803338
          8884848444CCC8888888880800033388888C8C8CCCCCC8888888880000003888
          888C8C8CCCCC8888888888880000088888888888888888888888888830000788
          8888888888888888888888883380000088888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuLancaRubPorPessoaClick
      end
      object tbarbtLancRubPorRubrica: TToolbarButton97
        Left = 32
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Lançamento de Rubricas por Rubrica'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          88888888880FF08888888888888888888888887000FF08888888888888888888
          8888870FFFF088888888888888888888888880F00FF088888888888888888888
          8888800880F0888808888888888888888888807880F088803888888888888888
          888888870F078803388888888888888888888880007880333888888888888888
          8888888888880333888888888888888888888880088033388888888888888888
          888888080803338888888888888888888888808000333888888888888880FF08
          888880000003888888888887000FF088888888800000888888888870FFFF0888
          88888883000078888888880F00FF0888888888833800000888888800880F0888
          888888888F88888888888807880F088808888888F48888888888888870F07880
          3888888F4CC888888888888800078803388888F4CCCC88888888888888888033
          3888884CCCCCC88888888888008803338888888F4CC888888888888080803338
          8888888F4CC8888888888808000333888888888F4CC888888888880000003888
          88F8F8FF4CC88888888888880000088884848444CCC888888888888830000788
          8C8C8CCCCCC8888888888888338000008C8C8CCCCC8888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuLancaRubPorRubricaClick
      end
    end
    object Toolbar973: TToolbar97
      Left = 499
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 499
      DragHandleStyle = dhNone
      TabOrder = 3
      object tbarbtGeracao: TToolbarButton97
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Geração da Folha'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          888880000000000000888888888888888888807707FFF7077088888888888888
          8888807707FCF70770888888888888888888807707FCF7077088888888888888
          8888807777F6F77770888888888888888888807777FCF7777088888888888888
          8888880000000000088888888888888888888888888888888888888888888888
          8888888888000888888888888888888888888888803B30888888888888888888
          8888888880B3B088888888888888888888888888803B30888888888888888888
          8888888888000888888888888888888888888888888F8888888888BB888B4B88
          8BB8888888F48888888888BBBB84CC8BBBB888888F4CC8888888888B84CCCCCC
          8B888888F4CCCC888888888B4C88C88C4B8888884CCCCCC888888888CC88C88C
          488888888F4CC888888888888888C88C488888888F4CC8888888888B8884CCCC
          8B8888888F4CC888888888BB84CCCC888BB8F8F8FF4CC8888888888B4C88C888
          8B84848444CCC888888888884C88C88C488C8C8CCCCCC8888888888B4C88C88C
          4B8C8C8CCCCC88888888888B8CCCCCC48B88888888888888888888BBBB8CC48B
          BBB8888888888888888888BB888BCB888BB88888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuFolhaClick
      end
      object tbarbtRescisao: TToolbarButton97
        Left = 32
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Rescisão'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888188888888888881F88888
          88888888881F8888888888888111F88888888888881F88888888888881111F88
          888888888188888888888888881111F88888888888888888888888888888111F
          888888881F8888888888888888888111FF888881F88888888888888888888881
          11F88811F88888888888888888888888111F111F888888888888888888888888
          811111F888888888888888888888888888111F88888888888888888888888888
          811111F8888888888888888888888888111B1118888888888888888888888811
          11BBB111F888888888888888888881111BBBBB111F8888888888888888881110
          BB00008811F88888888888888811111F008F0888811F88888888888811111FF8
          80F000088881888888888888111FF888808F8F08888888888888888888888888
          00F8F808888888888888888888888880000F8F80888888888888888888888880
          00F8F408888888888888888888888880000F8F00888888888888888888888880
          0000000088888888888888888888888800000008888888888888888888888888
          8000008888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuRescisaoClick
      end
    end
    object Toolbar974: TToolbar97
      Left = 567
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 567
      DragHandleStyle = dhNone
      TabOrder = 4
      object tbarbtConsHistRub: TToolbarButton97
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Consulta Histórico de Rubricas'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888880008888888888888888888
          8888888877FF0788888888888888888888888877FFFFF0888888888888888888
          888887FFFF77F0888888888888888888888887FF00F0FF088888888888888888
          88888800FFF0FF088888888888888888888800FFFFFF0FF08888888888888888
          88887FFFFFCF0FFF088888888888888888887FFCCCFFF0FFF088888888888888
          888887FFFFFCF0F77888888888888888888887FFCCCFFF088888888888888888
          8888887FFFFFCFF088888888888888888888887FFCCCFFFF0888888888888888
          88888887FFFFFF778888888888888888888888887FFF77888888888888888888
          888888888777888888888000000000000088888888F888888888807707FFF707
          708888888F4888888888807707FCF70770888888F4CC88888888807707FCF707
          7088888F4CCCC8888888807777F6F77770888884CCCCCC888888807777FCF777
          70888888F4CC8888888888000000000008888888F4CC88888888888888888888
          88888888F4CC88888888888888000888888F8F8FF4CC888888888888803B3088
          884848444CCC88888888888880B3B08888C8C8CCCCCC888888888888803B3088
          88C8C8CCCCC88888888888888800088888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuHistoricoClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 184
    Top = 92
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 375
    Width = 689
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '05/08/2024 13:43'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object UsuarioRH: TPanel [3]
    Left = 271
    Top = 42
    Width = 94
    Height = 22
    Caption = 'UsuarioRH'
    TabOrder = 3
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 141
  end
  inherited mnu: TMainMenu
    Left = 18
    Top = 40
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        inherited MnuConfigRelatCM: TMenuItem
          Caption = '&Relatórios'
        end
      end
      inherited mnuUtilitario: TMenuItem
        object mnuLine1: TMenuItem
          Caption = '-'
        end
        object mnuLayoutdeArquivosTXT: TMenuItem
          Caption = '&Layout de Arquivos TXT'
          HelpContext = 210001
          OnClick = mnuLayoutdeArquivosTXTClick
        end
        object mnuImportacaodeArquivosTXT: TMenuItem
          Caption = '&Importação de Arquivos TXT'
          HelpContext = 210002
          OnClick = mnuImportacaodeArquivosTXTClick
        end
        object mnuLine2: TMenuItem
          Caption = '-'
        end
        object mnuAcertodaQuantidadedeDependentes: TMenuItem
          Caption = '&Acerto da Quantidade de Dependentes'
          HelpContext = 210003
          OnClick = mnuAcertodaQuantidadedeDependentesClick
        end
        object mnuEliminaLancamentosProcessados: TMenuItem
          Caption = '&Eliminação de Lançamentos'
          HelpContext = 210004
          OnClick = mnuEliminaLancamentosProcessadosClick
        end
        object mnuImportacaodeDados: TMenuItem
          Caption = 'Importação Direta de &Dados'
          HelpContext = 210005
          OnClick = mnuImportacaodeDadosClick
        end
        object mnuLine3: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuVerifDadosRelatoriosMeiosMag: TMenuItem
          Caption = 'Verificação de Dados dos Relatórios e Meios &Magnéticos'
          Visible = False
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      Caption = 'Cadastros'
      HelpContext = 210006
      object mnuPessoal: TMenuItem
        Caption = '&Pessoal'
        HelpContext = 210007
        OnClick = mnuPessoalClick
      end
      object mnuBeneficioPeriodo: TMenuItem
        Caption = 'Benefício por Periodo'
        OnClick = mnuBeneficioPeriodoClick
      end
      object mnuCadHstAltCad: TMenuItem
        Caption = 'Histórico de &Alterações Cadastrais'
        HelpContext = 210008
        OnClick = mnuCadHstAltCadClick
      end
      object mnuDependentes: TMenuItem
        Caption = '&Dependentes'
        HelpContext = 210009
        OnClick = mnuDependentesClick
      end
      object mnuFavorecido: TMenuItem
        Caption = 'F&avorecidos'
        HelpContext = 210010
        OnClick = mnuFavorecidoClick
      end
      object mnuTransfSub: TMenuItem
        Caption = 'Transferência de Subordinação'
        OnClick = mnuTransfSubClick
      end
      object mnuAtualizacaoDeFotos: TMenuItem
        Caption = 'Atualização de fotos'
        OnClick = mnuAtualizacaoDeFotosClick
      end
      object mnuCentroCusto: TMenuItem
        Caption = 'Centro de Custo'
        OnClick = mnuCentroCustoClick
      end
      object mnuLine4: TMenuItem
        Caption = '-'
      end
      object mnuSituacaoFuncional: TMenuItem
        Caption = 'Situações &Funcionais'
        HelpContext = 210011
        OnClick = mnuSituacaoFuncionalClick
      end
      object mnuCargoseAfins: TMenuItem
        Caption = '&Cargos e Afins'
        HelpContext = 210012
        object mnuCargos: TMenuItem
          Caption = '&Cargos'
          HelpContext = 210013
          OnClick = mnuCargosClick
        end
        object mnuCBO: TMenuItem
          Caption = 'C&BO (Cod. Bras. de Ocupações)'
          HelpContext = 210014
          OnClick = mnuCBOClick
        end
        object mnuProfissoes: TMenuItem
          Caption = '&Profissões'
          HelpContext = 210015
          OnClick = mnuProfissoesClick
        end
        object mnuTipodeTrabalhador: TMenuItem
          Caption = '&Tipos de Trabalhador (Min. Trabalho)'
          HelpContext = 210016
          OnClick = mnuTipodeTrabalhadorClick
        end
        object mnuCadFaixasSalariais: TMenuItem
          Caption = '&Faixas Salariais'
          HelpContext = 210017
          OnClick = mnuCadFaixasSalariaisClick
        end
      end
      object mnuGrausdeInstrucao: TMenuItem
        Caption = '&Graus de Instrução'
        HelpContext = 210018
        OnClick = mnuGrausdeInstrucaoClick
      end
      object mnuLine5: TMenuItem
        Caption = '-'
      end
      object mnuEstabelecimentos: TMenuItem
        Caption = '&Estabelecimentos'
        HelpContext = 210019
        OnClick = mnuEstabelecimentosClick
      end
      object mnuSindicatos: TMenuItem
        Caption = '&Sindicatos'
        HelpContext = 210020
        OnClick = mnuSindicatosClick
      end
      object mnuLine6: TMenuItem
        Caption = '-'
      end
      object mnuMotivo: TMenuItem
        Caption = '&Motivos e Ações'
        HelpContext = 210021
        OnClick = mnuMotivoClick
      end
      object mnuRubricasSalariais: TMenuItem
        Caption = '&Rubricas Salariais'
        HelpContext = 210022
        OnClick = mnuRubricasSalariaisClick
      end
      object mnuRubriPlanSaudeOdonto: TMenuItem
        Caption = 'Rubricas dos Planos de Saúde / Odontológico'
        OnClick = mnuRubriPlanSaudeOdontoClick
      end
      object mnuRubricasporEmpresa: TMenuItem
        Caption = 'R&ubricas por Empresa'
        HelpContext = 210023
        OnClick = mnuRubricasporEmpresaClick
      end
      object mnuRubricasPadraoCLT: TMenuItem
        Caption = 'Rubricas Padrão C&LT'
        HelpContext = 210024
        OnClick = mnuRubricasPadraoCLTClick
      end
      object mnuIntegracaoContab: TMenuItem
        Caption = '&Integração Contábil'
        HelpContext = 210025
        OnClick = mnuIntegracaoContabClick
      end
      object mnuLine7: TMenuItem
        Caption = '-'
      end
      object mnuHorariosdeTrabalho: TMenuItem
        Caption = '&Horários de Trabalho'
        HelpContext = 210026
        object mnuTabelaHorarios: TMenuItem
          Caption = 'Tabela de &Horários'
          HelpContext = 210027
          OnClick = mnuTabelaHorariosClick
        end
        object mnuTurnosporDia: TMenuItem
          Caption = '&Turnos por Dia'
          HelpContext = 210028
          OnClick = mnuTurnosporDiaClick
        end
        object mnuAssociaHorarios: TMenuItem
          Caption = '&Associa Horários com Turnos'
          HelpContext = 210029
          OnClick = mnuAssociaHorariosClick
        end
      end
      object mnuValeTransporte2: TMenuItem
        Caption = '&Vale Transporte'
        HelpContext = 210030
        object mnuEmpresasdeTranporte: TMenuItem
          Caption = '&Empresas de Transporte'
          HelpContext = 210031
          OnClick = mnuEmpresasdeTranporteClick
        end
        object mnuLinhasdeTransporte: TMenuItem
          Caption = '&Linhas de Transporte'
          HelpContext = 210032
          OnClick = mnuLinhasdeTransporteClick
        end
        object mnuLinhasporPessoa: TMenuItem
          Caption = 'Linhas por &Pessoa'
          HelpContext = 210033
          OnClick = mnuLinhasporPessoaClick
        end
        object mnuDiasExtrasporPessoa: TMenuItem
          Caption = '&Dias Extras por Pessoa'
          HelpContext = 210034
          OnClick = mnuDiasExtrasporPessoaClick
        end
      end
      object mnuTabelasAuxiliares: TMenuItem
        Caption = '&Tabelas Auxiliares'
        HelpContext = 210035
        object mnuClassNacionalAtividadesEconomicasCNAE: TMenuItem
          Caption = '&Class. Nacional de Atividades Econômicas (CNAE)'
          HelpContext = 210036
          OnClick = mnuClassNacionalAtividadesEconomicasCNAEClick
        end
        object mnuTabelasDARF: TMenuItem
          Caption = 'Contribuições &DARF'
          HelpContext = 210037
          OnClick = mnuTabelasDARFClick
        end
        object mnuTabelasFPAS: TMenuItem
          Caption = '&Fundo Prev. e de Assist. Social (FPAS)'
          HelpContext = 210038
          OnClick = mnuTabelasFPASClick
        end
        object mnuSegurodeAcidentesdoTrabalho: TMenuItem
          Caption = '&Seguro de Acidentes do Trabalho'
          HelpContext = 210039
          OnClick = mnuSegurodeAcidentesdoTrabalhoClick
        end
        object mnuMovimentoContratualCAGED: TMenuItem
          Caption = '&Movimento Contratual CAGED'
          HelpContext = 210040
          OnClick = mnuMovimentoContratualCAGEDClick
        end
        object mnuDocumentosOficiais: TMenuItem
          Caption = 'Documentos &Oficiais'
          HelpContext = 210041
          OnClick = mnuDocumentosOficiaisClick
        end
        object PortadorFormaporBanco1: TMenuItem
          Caption = 'Portador Forma por &Banco'
          HelpContext = 210042
          OnClick = PortadorFormaporBanco1Click
        end
        object mnuTabelasFGTS: TMenuItem
          Caption = 'Tabelas F&GTS'
          HelpContext = 210043
          object mnuDepositosGRE: TMenuItem
            Caption = '&Depósitos GRE'
            HelpContext = 210044
            OnClick = mnuDepositosGREClick
          end
          object mnuCategoriadeEmpregado: TMenuItem
            Caption = '&Categoria de Empregado'
            HelpContext = 210045
            OnClick = mnuCategoriadeEmpregadoClick
          end
          object mnuFormasdeRescisao: TMenuItem
            Caption = 'Formas de &Rescisão'
            HelpContext = 210046
            OnClick = mnuFormasdeRescisaoClick
          end
          object mnuSituacoesdeRisco: TMenuItem
            Caption = '&Situações de Risco'
            HelpContext = 210047
            OnClick = mnuSituacoesdeRiscoClick
          end
        end
        object mnuTabelasRAIS: TMenuItem
          Caption = 'Tabelas &RAIS'
          HelpContext = 210048
          object mnuNaturezaEmpresarial: TMenuItem
            Caption = '&Natureza Empresarial'
            HelpContext = 210049
            OnClick = mnuNaturezaEmpresarialClick
          end
          object mnuVinculoEmpregaticio: TMenuItem
            Caption = '&Vínculo Empregatício'
            HelpContext = 210050
            OnClick = mnuVinculoEmpregaticioClick
          end
          object mnuSitAfastRAIS: TMenuItem
            Caption = '&Situações de Afastamento'
            HelpContext = 210051
            OnClick = mnuSitAfastRAISClick
          end
        end
        object TabelasREGRA1: TMenuItem
          Caption = 'Tabelas RE&GRA / Forma de Cálculo'
          HelpContext = 210052
          object mnuCadFormaCalc: TMenuItem
            Caption = '&Forma de Cálculo'
            HelpContext = 210053
            OnClick = mnuCadFormaCalcClick
          end
          object mnuCadDicDados: TMenuItem
            Caption = '&Dicionário de Dados'
            HelpContext = 210054
            OnClick = mnuCadDicDadosClick
          end
          object mnuCadTabGenerica: TMenuItem
            Caption = 'Tabela &Genérica'
            HelpContext = 210055
            OnClick = mnuCadTabGenericaClick
          end
          object mnuCadTabLonga: TMenuItem
            Caption = 'Tabela &Longa'
            HelpContext = 210056
            OnClick = mnuCadTabLongaClick
          end
          object mnuCadTipRegraFormCalc: TMenuItem
            Caption = '&Tipos de Regra / Forma de Cálculo'
            HelpContext = 210057
            OnClick = mnuCadTipRegraFormCalcClick
          end
        end
      end
      object mnuListaRecebedores: TMenuItem
        Caption = 'Lista de Recebedores'
        OnClick = mnuListaRecebedoresClick
      end
      object mnuCadastroParamETL: TMenuItem
        Caption = 'Parâmetros ETL'
        OnClick = mnuCadastroParamETLClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 210058
      object mnuLancaRubricasSalariais: TMenuItem
        Caption = '&Lançamento de Rubricas Salariais'
        HelpContext = 210059
        object mnuLancaRubPorPessoa: TMenuItem
          Caption = 'Por &Pessoa'
          HelpContext = 210060
          OnClick = mnuLancaRubPorPessoaClick
        end
        object mnuLancaRubPorRubrica: TMenuItem
          Caption = 'Por &Rubrica'
          HelpContext = 210061
          OnClick = mnuLancaRubPorRubricaClick
        end
      end
      object mnuLancaHistRubrica: TMenuItem
        Caption = 'L&ançamento de Histórico de Rubricas'
        HelpContext = 210062
        OnClick = mnuLancaHistRubricaClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object HorasExtraseAtrasos: TMenuItem
        Caption = '&Horas Extras e Atrasos'
        HelpContext = 210063
        OnClick = HorasExtraseAtrasosClick
      end
      object mnuHorasTrabOutroCC: TMenuItem
        Caption = 'Horas &Trabalhadas em Outro Setor'
        HelpContext = 210201
        OnClick = mnuHorasTrabOutroCCClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuReajuste: TMenuItem
        Caption = 'Reajuste &Salarial'
        HelpContext = 210064
        OnClick = mnuReajusteClick
      end
      object mnuRegistroAlteracaoFuncional: TMenuItem
        Caption = 'Registro de &Alteração Funcional'
        HelpContext = 210065
        OnClick = mnuRegistroAlteracaoFuncionalClick
      end
      object mnuRegistrodeAlteraoSituacaoFuncional: TMenuItem
        Caption = 'Reg&istro de Alteração da Situação Funcional'
        HelpContext = 210066
        OnClick = mnuRegistrodeAlteraoSituacaoFuncionalClick
      end
      object mnuRegistrodeEstabilidadeFuncional: TMenuItem
        Caption = 'Registro de &Estabilidade Funcional'
        OnClick = mnuRegistrodeEstabilidadeFuncionalClick
      end
      object RemuneraoOutroEmpregador1: TMenuItem
        Caption = 'Remuneração - Outro Empregador'
        OnClick = RemuneraoOutroEmpregador1Click
      end
      object mnuLine8: TMenuItem
        Caption = '-'
      end
      object mnuFolha: TMenuItem
        Caption = '&Geração da Folha'
        HelpContext = 210067
        OnClick = mnuFolhaClick
      end
      object mnuContabilizacaodaFolha: TMenuItem
        Caption = 'Contabili&zação / Contas a Pagar da Folha'
        HelpContext = 210068
        OnClick = mnuContabilizacaodaFolhaClick
      end
      object mnuManutDoc: TMenuItem
        Caption = '&Manutenção de Documentos (AP)'
        HelpContext = 210069
        OnClick = mnuManutDocClick
      end
      object mnuIntegraContribPrev: TMenuItem
        Caption = 'Cálculo / Integração Contribuição Previdenciária'
        OnClick = mnuIntegraContribPrevClick
      end
      object mnuLine9: TMenuItem
        Caption = '-'
      end
      object mnuFerias: TMenuItem
        Caption = '&Férias'
        HelpContext = 210070
        OnClick = mnuFeriasClick
      end
      object mnuProgramacaoAntec13: TMenuItem
        Caption = '&Programação da Antecipação do 13º'
        HelpContext = 210071
        OnClick = mnuProgramacaoAntec13Click
      end
      object mnuRescisao: TMenuItem
        Caption = '&Rescisão'
        HelpContext = 210072
        OnClick = mnuRescisaoClick
      end
      object mnuRegAvisoPrev: TMenuItem
        Caption = 'Registro de Aviso Prévio'
        Visible = False
        OnClick = mnuRegAvisoPrevClick
      end
      object mnuLine10: TMenuItem
        Caption = '-'
      end
      object mnuCartaseComunicados: TMenuItem
        Caption = '&Cartas ou Comunicados'
        HelpContext = 210073
        OnClick = mnuCartaseComunicadosClick
      end
      object mnuAdvertnciaouSuspenso1: TMenuItem
        Caption = 'Advertência, Suspensão ou Apuração de Responsabilidade'
        OnClick = mnuAdvertnciaouSuspenso1Click
      end
      object mnuRegistrodeMrito1: TMenuItem
        Caption = 'Registro de Mérito'
        OnClick = mnuRegistrodeMrito1Click
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object mnuRelatoriosEspeciais: TMenuItem [1]
        Caption = 'Relatórios Es&peciais'
        HelpContext = 210202
        object mnuDemonstrativodePagamentoEspecial: TMenuItem
          Caption = '&Demonstrativo de Pagamento'
          HelpContext = 210203
          OnClick = mnuDemonstrativodePagamentoEspecialClick
        end
        object mnuSeguroDesemprego1: TMenuItem
          Caption = '&Seguro Desemprego'
          HelpContext = 210204
          OnClick = mnuSeguroDesemprego1Click
        end
        object mnuCalcMargemConsig: TMenuItem
          Caption = 'Cálculo da Margem Consignável - 30%'
          OnClick = mnuCalcMargemConsigClick
        end
        object mnuFichaReg: TMenuItem
          Caption = 'Ficha de Registro de Empregados'
          HelpContext = 210205
          OnClick = mnuFichaRegClick
        end
        object mnuLine13: TMenuItem
          Caption = '-'
        end
        object mnuRelatSubstEvent1: TMenuItem
          Caption = 'Relatório de Substituição Eventual'
          OnClick = mnuRelatSubstEvent1Click
        end
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = 'Geral de Pessoa'
        Visible = True
      end
      object GeraldeEndereos1: TMenuItem [6]
        Caption = 'Geral de Endereços'
        OnClick = GeraldeEndereos1Click
      end
      object GrficosEspeciais1: TMenuItem
        Caption = 'Gráficos &Especiais'
        HelpContext = 210078
        object mnuEstatisticasdoQuadro: TMenuItem
          Caption = '&Estatísticas do Quadro de Pessoal'
          HelpContext = 210079
          OnClick = mnuEstatisticasdoQuadroClick
        end
        object mnuEvolucaodaFolha: TMenuItem
          Caption = 'Evolução da &Folha'
          HelpContext = 210080
          OnClick = mnuEvolucaodaFolhaClick
        end
      end
      object mnuLine11: TMenuItem
        Caption = '-'
      end
      object mnuBrowsePessoal: TMenuItem
        Caption = '&Browse do Cadastro de Pessoal'
        HelpContext = 210081
        OnClick = mnuBrowsePessoalClick
      end
      object mnuHistorico: TMenuItem
        Caption = '&Histórico de Rubricas'
        HelpContext = 210082
        OnClick = mnuHistoricoClick
      end
      object mnuEvolucaoFuncional: TMenuItem
        Caption = 'Histórico da E&volução Funcional'
        HelpContext = 210083
        OnClick = mnuEvolucaoFuncionalClick
      end
      object mnuHistoricodaSituacaoFuncional: TMenuItem
        Caption = 'Histórico da &Situação Funcional'
        HelpContext = 210084
        OnClick = mnuHistoricodaSituacaoFuncionalClick
      end
    end
    object mnuMMagnetico: TMenuItem [4]
      Caption = '&Meios Magnéticos'
      HelpContext = 210085
      object mnuGFIP: TMenuItem
        Caption = '&GFIP'
        HelpContext = 210086
        OnClick = mnuGFIPClick
      end
      object mnuGRRF: TMenuItem
        Caption = 'GRRF'
        HelpContext = 210206
        OnClick = mnuGRRFClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuValeTranspMag: TMenuItem
        Caption = '&Vale Transporte'
        HelpContext = 210087
        OnClick = mnuValeTranspMagClick
      end
      object mnuCAGED: TMenuItem
        Caption = '&CAGED'
        HelpContext = 210088
        OnClick = mnuCAGEDClick
      end
      object mnuRAISMag: TMenuItem
        Caption = '&RAIS'
        HelpContext = 210089
        OnClick = mnuRAISMagClick
      end
      object mnuArquivodePagamento: TMenuItem
        Caption = '&Arquivo de Pagamento'
        HelpContext = 210090
        OnClick = mnuArquivodePagamentoClick
      end
      object mnuLine12: TMenuItem
        Caption = '-'
      end
      object mnuTicket1: TMenuItem
        Caption = '&Ticket'
        OnClick = mnuTicket1Click
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 206
    Top = 42
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 88
  end
  inherited AclPadrao: TActionList
    Left = 16
    Top = 136
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 16
    Top = 184
  end
  inherited CorreioCM: TCorreioCM
    Left = 88
    Top = 185
  end
end
