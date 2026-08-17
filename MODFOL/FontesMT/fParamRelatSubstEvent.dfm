inherited frmParamRelatSubstEvent: TfrmParamRelatSubstEvent
  Left = 153
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relatório de Substituição Eventual'
  ClientHeight = 310
  ClientWidth = 503
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 503
    Height = 271
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 13
      Top = 8
      Width = 230
      Height = 43
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 9
        Top = 14
        Width = 212
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = CdsEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxIntervRef: TGroupBox
      Left = 251
      Top = 8
      Width = 239
      Height = 43
      Caption = 'Período a considerar'
      TabOrder = 1
      object Label1: TLabel
        Left = 121
        Top = 18
        Width = 15
        Height = 13
        Caption = 'até'
      end
      object Label2: TLabel
        Left = 10
        Top = 18
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object dtedIni: TCMDateTimePicker
        Left = 30
        Top = 14
        Width = 87
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
      end
      object dtedFin: TCMDateTimePicker
        Left = 142
        Top = 14
        Width = 87
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
      end
    end
    object gbxFunc: TGroupBox
      Left = 13
      Top = 59
      Width = 477
      Height = 200
      Caption = 'Rubricas que compõem'
      TabOrder = 2
      object Label3: TLabel
        Left = 6
        Top = 156
        Width = 100
        Height = 13
        Caption = 'Procura por Rubricas'
      end
      object Paginas: TPageControl
        Left = 6
        Top = 15
        Width = 464
        Height = 139
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        OnChange = PaginasChange
        object tbshListaFunc: TTabSheet
          Caption = 'A quantidade'
          object chklstRubrica1: TColorCheckListBox
            Left = 2
            Top = 2
            Width = 313
            Height = 106
            OnClickCheck = chklstRubrica1ClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
        end
        object tbshFiltroFunc: TTabSheet
          Caption = 'O valor'
          object chklstRubrica2: TColorCheckListBox
            Left = 2
            Top = 2
            Width = 313
            Height = 105
            OnClickCheck = chklstRubrica1ClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
        end
      end
      object bbtnSelTodas: TBitBtn
        Left = 331
        Top = 41
        Width = 131
        Height = 25
        Caption = '   Seleciona Todas'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodasClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInverteSel: TBitBtn
        Left = 331
        Top = 67
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object edCodRubricas: TEdit
        Left = 6
        Top = 169
        Width = 352
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a procurar separados por vírgu' +
          'la'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object sbtnMarcarRub: TBitBtn
        Left = 367
        Top = 166
        Width = 103
        Height = 28
        Caption = '   &Marcar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = sbtnMarcarRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
          F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
          FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
          788877F77FF878F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 271
    Width = 503
    inherited tb97Fundo: TToolbar97
      Left = 230
      DockPos = 265
      inherited sep1: TToolbarSep97
        Left = 186
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 75
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 105
        ModalResult = 2
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 188
        TabOrder = 2
      end
      object rbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 75
        Height = 33
        Cancel = True
        Caption = ' &Imprimir'
        TabOrder = 0
        OnClick = rbtnImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 207
    Top = 160
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsgnPrincipal: TppDesigner
    Caption = 'Substituição Eventual'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = rpPrincipal
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 150
    Top = 160
  end
  object rpPrincipal: TppReport
    AutoStop = False
    DataPipeline = ppPrincipal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 92
    Top = 160
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPrincipal'
    object rpPrincipalHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppCalc3: TppCalc
        UserName = 'Calc1'
        AutoSize = False
        CalcType = ctPageSetDesc
        CustomType = dtString
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 244740
        mmTop = 4233
        mmWidth = 23283
        BandType = 0
      end
      object ppCalc4: TppCalc
        UserName = 'Calc2'
        AutoSize = False
        CalcType = ctDateTime
        CustomType = dtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 244740
        mmTop = 8731
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229394
        mmTop = 8731
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229394
        mmTop = 4233
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Substituição Eventual '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 106627
        mmTop = 8731
        mmWidth = 71173
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 3969
        mmTop = 29369
        mmWidth = 278607
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'FUNCEF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 106627
        mmTop = 1588
        mmWidth = 71173
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Empregado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 25665
        mmWidth = 49213
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 54240
        mmTop = 25665
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Lotação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 25665
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Período de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Substituído'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 25665
        mmWidth = 65881
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Substituição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120915
        mmTop = 25665
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Quantidade de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210609
        mmTop = 16669
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'dias de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210609
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Substituição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210609
        mmTop = 25665
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Motivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 25665
        mmWidth = 36248
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 270669
        mmTop = 25665
        mmWidth = 11906
        BandType = 0
      end
    end
    object rpPrincipalDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPREGADO'
        DataPipeline = ppPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrincipal'
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 1323
        mmWidth = 49213
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SUBSTITUIDO'
        DataPipeline = ppPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrincipal'
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 1323
        mmWidth = 65881
        BandType = 4
      end
      object ppDBRichText1: TppDBRichText
        UserName = 'DBRichText1'
        DataField = 'PERIODO'
        DataPipeline = ppPrincipal
        DataPipelineName = 'ppPrincipal'
        mmHeight = 7144
        mmLeft = 120915
        mmTop = 1323
        mmWidth = 21696
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppDBRichText2: TppDBRichText
        UserName = 'DBRichText2'
        DataField = 'CARGO'
        DataPipeline = ppPrincipal
        DataPipelineName = 'ppPrincipal'
        mmHeight = 7144
        mmLeft = 54240
        mmTop = 1323
        mmWidth = 32279
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppDBRichText3: TppDBRichText
        UserName = 'DBRichText3'
        DataField = 'LOTACAO'
        DataPipeline = ppPrincipal
        DataPipelineName = 'ppPrincipal'
        mmHeight = 7144
        mmLeft = 87577
        mmTop = 1323
        mmWidth = 32279
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'QUANT_DIAS'
        DataPipeline = ppPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrincipal'
        mmHeight = 3704
        mmLeft = 210609
        mmTop = 1323
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MOTIVO'
        DataPipeline = ppPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrincipal'
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 1323
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = ppPrincipal
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrincipal'
        mmHeight = 3704
        mmLeft = 270669
        mmTop = 1323
        mmWidth = 11906
        BandType = 4
      end
    end
    object rpPrincipalFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
    end
    object rpPrincipalSmryBnd: TppSummaryBand
      AfterPrint = rpPrincipalSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
  end
  object ppPrincipal: TppBDEPipeline
    DataSource = dsPrincipal
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'VarMensal1'
    Left = 39
    Top = 160
    object ppPrincipalppField1: TppField
      FieldAlias = 'INICIO'
      FieldName = 'INICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField2: TppField
      FieldAlias = 'FINAL'
      FieldName = 'FINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField4: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField5: TppField
      FieldAlias = 'LOTACAO'
      FieldName = 'LOTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField6: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField7: TppField
      FieldAlias = 'SUBSTITUIDO'
      FieldName = 'SUBSTITUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField8: TppField
      FieldAlias = 'QUANT_DIAS'
      FieldName = 'QUANT_DIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField9: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPrincipalppField10: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsPrincipal: TwwDataSource
    AutoEdit = False
    DataSet = CdsPrincipal
    Left = 259
    Top = 102
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 102
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 102
  end
  object CdsPrincipal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 102
  end
  object sqlPrincipal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SYSDATE AS INICIO,'
      '  SYSDATE+1 AS FINAL,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',40,'#39'1'#39') AS CARGO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS LOTACAO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS PERIODO,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS SUBSTITUIDO,'
      '  0 AS QUANT_DIAS,'
      '  LPAD('#39'1'#39',40,'#39'1'#39') AS MOTIVO,'
      '  0 AS VALOR'
      'FROM'
      '  DUAL'
      'WHERE'
      '  1 = 2')
    ClientDataSet = CdsPrincipal
    Left = 144
    Top = 102
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 160
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 269
    Top = 160
  end
end
