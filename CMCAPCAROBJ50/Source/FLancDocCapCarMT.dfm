inherited frmLancDocCAPCAR: TfrmLancDocCAPCAR
  Left = 232
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Lançamento de Documentos'
  ClientHeight = 429
  ClientWidth = 764
  OnPaint = cbEnglobParcClick
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 764
    object LblEstorno: TLabel [0]
      Left = 311
      Top = 8
      Width = 133
      Height = 13
      Caption = 'Autorização do Estorno'
      Visible = False
    end
    object LblMesmaData: TLabel [1]
      Left = 311
      Top = 24
      Width = 251
      Height = 13
      Caption = 'Autorização de Lançamento na Mesma Data'
      Visible = False
    end
    object BtnStatus: TToolbarButton97 [2]
      Left = 556
      Top = 1
      Width = 215
      Height = 43
      AllowAllUp = True
      DropdownArrow = False
      Caption = 'Botão Pra Status do Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D660100000000000076000000280000000F0000001E0000000100
        040000000000F0000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
        11101111CCCC11111110111C4444CC111C1011C4111144C7CC1011C41111114C
        CC1011C4111111CCCC1011C411111CCCCC10111C411111111110111111111111
        111011111117711111101111100F0111111011100FFF01111110100FFFFFF011
        111017FFFFFCF011111017FFCCCFFF011110117FFFFFCF011110117FFCCCFFF0
        11101117FFFFFCFF01101117FFCCCFFFF01011117FFFFFF77110111117FFF771
        11101111117771111110111111111114C11011CCCCC111114C1011CCCC111111
        4C1011CCC41111114C1011CC7C4411114C1011C111CC4444C11011111111CCCC
        11101111111111111110}
      Images = ImlDocs
      Opaque = False
      ParentFont = False
      Spacing = 5
      WordWrap = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 244
      end
      inherited sbtnApagar: TToolbarButton97
        Width = 64
      end
      object sbtnEstornar: TToolbarButton97
        Left = 184
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Es&tornar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnEstornarClick
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 764
    Height = 343
    inherited pnlMestre: TPanel
      Width = 1014
      Height = 220
      Align = alNone
      TabOrder = 1
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 1
      Width = 762
      Height = 341
      TabOrder = 0
      Tabs.Strings = (
        'Dados Para o Lançamento'
        'Rateio'
        'Contabilização'
        'Lançamentos'
        'Alteradores'
        'Geral'
        'Contas Baixa')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        ''
        'GrdAlteradores'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 664
        Height = 282
        ActivePage = TbsDadosLanc
        HotTrack = True
        object TbsDadosLanc: TTabSheet [0]
          Caption = 'Dados Para o Lançamento'
          object PnlDados: TPanel
            Left = 0
            Top = 0
            Width = 656
            Height = 254
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel2: TBevel
              Left = 10
              Top = 233
              Width = 573
              Height = 41
              Shape = bsFrame
            end
            object lblHistorico: TLabel
              Left = 11
              Top = 140
              Width = 142
              Height = 13
              Caption = 'Histórico do Lançamento'
            end
            object Label10: TLabel
              Left = 60
              Top = 240
              Width = 190
              Height = 13
              Caption = 'Usuário que lançou o Documento'
            end
            object DBText3: TDBText
              Left = 60
              Top = 254
              Width = 201
              Height = 16
              DataField = 'NOMEUSUARIO'
              DataSource = ds
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 326
              Top = 254
              Width = 47
              Height = 15
              AutoSize = True
              DataField = 'NOMEMODULO'
              DataSource = ds
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblModulo: TLabel
              Left = 326
              Top = 240
              Width = 220
              Height = 13
              Caption = 'Sistema que originou este lançamento:'
            end
            object Image1: TImage
              Left = 19
              Top = 238
              Width = 32
              Height = 32
              AutoSize = True
              Picture.Data = {
                07544269746D6170B6040000424DB604000000000000B6000000280000002000
                000020000000010008000000000000040000C40E0000C40E0000200000002000
                0000FFFFFF0000FFFF0066CCFF0000CCFF00FF00FF00C0C0C000BBBBBB00AAAA
                AA0000999900888888008080800000808000800080007777770033666600FFFF
                0000C0C0C0008080000000770000FF0000008800000080000000770000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000100B15151515151515151515151515151515151515151515151515151515
                1510100B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
                1510100B05050505050505050505050505050505050505050505050505050505
                0B1010100B01010101010101010101010101010101010101010101010101010B
                10101010100B0101091717171717171717171717171717171717171701010B10
                1010101010100B010700000000000000000000000000000000000017010B1010
                101010101010100B07001300090609060000121200121200121200170B101010
                1010101010101010070000000000000000001212001212001212001710101010
                1010101010101010070013000D06090600001212001212001212001710101010
                1010101010101010070000000000000000001212001212001212001709101010
                101010101010101007001300090609000000000000121200121200170D091010
                10101010101010140700000000000000000000000012120012120017160D0910
                1010101010101613070013000D06090600000000001212000000001715140D09
                1010101010160E130700000000000000000000000000000000000017150E140D
                09101010140E0213070000000000000000000000000000000000001715030E16
                0D1010160E020A1307000000040604060406040604060406000000171503030E
                1410101402030A130700000000000000000000000000000000000017150A0303
                0E1010100803130A070707070707070707070707070707070707070911150309
                10101010100813051313131315150C040C0C0C0C0C1511051111111115150810
                101010101010130F1313131313150C040C0C0C0C0C15110F1111111111151010
                101010101010130F1313131315150C05040C040C0C15110F1111111115151010
                101010101010130F051313131315030C0C040C151503110F0511111111151010
                10101010101013050F050F0515150303030C1503030311050F050F0515111010
                1010101010101013130F1315150103030C0C0C1503030311110F111511101010
                101010101010101010131508030001030C040C15030303030B11151010101010
                101010101010101013131315080300010C050415030303081111111510101010
                1010101010101010130F131510080300080C0C0803030B10110F111510101010
                1010101010101010130F0F131010080300010303030B1010110F0F1510101010
                10101010101010100813130810101008030001030B1010100811110810101010
                101010101010101010101010101010100803030D101010101010101010101010
                10101010101010101010101010101010100B0810101010101010101010101010
                1010101010101010101010101010101010101010101010101010101010101010
                1010}
              Transparent = True
            end
            object dbeHistorico: TwwDBEdit
              Left = 12
              Top = 156
              Width = 571
              Height = 21
              DataField = 'HISTORICOCOMPL'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object gbDatas: TGroupBox
              Left = 596
              Top = 2
              Width = 135
              Height = 273
              Caption = ' Datas '
              TabOrder = 1
              object lblData: TLabel
                Left = 12
                Top = 65
                Width = 70
                Height = 13
                Caption = 'Lançamento'
              end
              object lblEmissao: TLabel
                Left = 12
                Top = 16
                Width = 47
                Height = 13
                Caption = 'Emissão'
              end
              object lblVencimento: TLabel
                Left = 12
                Top = 119
                Width = 67
                Height = 13
                Caption = 'Vencimento'
              end
              object lblProgramada: TLabel
                Left = 12
                Top = 170
                Width = 68
                Height = 13
                Caption = 'Programada'
              end
              object LblDIspFinanc: TLabel
                Left = 12
                Top = 222
                Width = 87
                Height = 13
                Caption = 'Disponibilidade'
                Visible = False
              end
              object dbeDataLanc: TCMDateTimePicker
                Left = 12
                Top = 81
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATALANCTO'
                DataSource = ds
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
              object dbeDataEmi: TCMDateTimePicker
                Left = 12
                Top = 31
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAEMISSAO'
                DataSource = ds
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
                OnExit = dbeDataEmiExit
              end
              object dbeDataVenc: TCMDateTimePicker
                Left = 12
                Top = 135
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAVENCTO'
                DataSource = ds
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
                TabOrder = 2
                OnExit = dbeDataVencExit
              end
              object dbeDataProgr: TCMDateTimePicker
                Left = 12
                Top = 186
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAPROGRAMADA'
                DataSource = ds
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
                TabOrder = 3
              end
              object dbeDataDisponib: TCMDateTimePicker
                Left = 12
                Top = 238
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATADISPONIB'
                DataSource = ds
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
                TabOrder = 4
                Visible = False
              end
            end
            object gbOutros: TGroupBox
              Left = 11
              Top = 181
              Width = 572
              Height = 50
              TabOrder = 3
              object PnlOpcao: TPanel
                Left = 1
                Top = 8
                Width = 569
                Height = 41
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 0
                Visible = False
              end
              object cbEnglobParc: TCheckBox
                Left = 8
                Top = 10
                Width = 297
                Height = 17
                Caption = 'Este documento será parcelado ou englobado'
                TabOrder = 2
                OnClick = cbEnglobParcClick
              end
              object cbLancaBaixa: TCheckBox
                Left = 8
                Top = 29
                Width = 297
                Height = 17
                Caption = 'Lança e Baixa este documento simultaneamente'
                TabOrder = 3
                OnClick = cbLancaBaixaClick
              end
              object cbIntegra: TCheckBox
                Left = 318
                Top = 9
                Width = 234
                Height = 17
                Caption = 'Não integrar com a contabilidade'
                TabOrder = 1
              end
              object DBCheckBox1: TDBCheckBox
                Left = 318
                Top = 29
                Width = 211
                Height = 17
                Caption = 'Conta de Investimento'
                DataField = 'FLGCONTAINVEST'
                DataSource = ds
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object PnlLancPrin: TPanel
              Left = 3
              Top = 0
              Width = 586
              Height = 137
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object Label7: TLabel
                Left = 438
                Top = 54
                Width = 77
                Height = 13
                Caption = 'Valor Líquido'
                Visible = False
              end
              object lblMoeda: TLabel
                Left = 10
                Top = 55
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object lblTipoDocum: TLabel
                Left = 8
                Top = 96
                Width = 112
                Height = 13
                Caption = 'Tipo de Documento'
              end
              object Bevel1: TBevel
                Left = 378
                Top = 7
                Width = 206
                Height = 44
                Shape = bsFrame
              end
              object lblValor: TLabel
                Left = 438
                Top = 54
                Width = 124
                Height = 13
                Caption = 'Valor Moeda Corrente'
              end
              object lblValorMoeda: TLabel
                Left = 277
                Top = 54
                Width = 107
                Height = 13
                Caption = 'Valor Outra Moeda'
              end
              object lblNumDoc: TLabel
                Left = 383
                Top = 9
                Width = 130
                Height = 13
                Caption = 'Número do Documento'
              end
              object lblBarra: TLabel
                Left = 542
                Top = 27
                Width = 7
                Height = 13
                Caption = '/'
              end
              object lblPortadorForma: TLabel
                Left = 239
                Top = 96
                Width = 175
                Height = 13
                Caption = 'Contas/Caixas x Forma de Pag'
              end
              object lblNumChBordero: TLabel
                Left = 470
                Top = 95
                Width = 90
                Height = 13
                Caption = 'No. Ch/Borderô'
              end
              object DbeNoDocumento: TwwDBEdit
                Left = 384
                Top = 23
                Width = 157
                Height = 21
                Hint = 
                  'Componente excluído em 18/07/2006 pendencia 22249 - andre tavare' +
                  's'
                DataField = 'NUMFATURA_1'
                DataSource = ds
                TabOrder = 2
                UnboundDataType = wwDefault
                Visible = False
                WantReturns = False
                WordWrap = False
                OnExit = DbeNoDocumentoExit
              end
              object CmpForCli: TCMProcuraForCli
                Left = 9
                Top = 1
                Width = 363
                Height = 49
                Caption = 'Favorecido'
                TabOrder = 0
                OnEnter = CmpForCliEnter
                OnExit = CmpForCliExit
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDFORCLI'
                Mensagens.EmBranco = 'não pode estar em branco'
                Mensagens.NaoExiste = 'não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                OnApertouBotao = CmpForCliApertouBotao
                ForCli = fcCliente
                MostraEndereco = False
                StatusForCli = fcAll
                MostraStatusCredito = False
              end
              object dbeCompl: TwwDBEdit
                Left = 551
                Top = 23
                Width = 25
                Height = 21
                DataField = 'COMPLDOCUMENTO'
                DataSource = ds
                TabOrder = 3
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbenNumDoc: TDBRealEdit
                Left = 384
                Top = 23
                Width = 157
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 1
                WordWrap = False
                IntDigits = 15
                DecDigits = 0
                NumberFormat = fFixed
                Signal = False
                DataField = 'NODOCUMENTO'
                DataSource = ds
              end
              object dblcMoeda: TwwDBLookupCombo
                Left = 10
                Top = 69
                Width = 255
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'10'#9'MOESIGLA')
                DataField = 'MOECODIGO'
                DataSource = ds
                LookupTable = CdsMoeda
                LookupField = 'MOECODIGO'
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnExit = dblcMoedaExit
              end
              object dbeValorMoeda: TDBRealEdit
                Left = 278
                Top = 69
                Width = 149
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 5
                WordWrap = False
                OnExit = dbeValorMoedaExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOROUTRAMOEDA'
                DataSource = ds
              end
              object dbeValorCorrente: TDBRealEdit
                Left = 438
                Top = 69
                Width = 144
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 6
                WordWrap = False
                OnChange = dbeValorCorrenteChange
                OnExit = dbeValorCorrenteExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOR'
                DataSource = ds
              end
              object dblcTipoDoc: TwwDBLookupCombo
                Left = 10
                Top = 110
                Width = 223
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição'
                  'DEBCRE'#9'1'#9'D/C'
                  'FLGDOCFISCAL'#9'1'#9'Doc. Fiscal'
                  'FLGGERANUMDOC'#9'1'#9'Gera Num Doc')
                DataField = 'CODTIPDOC'
                DataSource = ds
                LookupTable = CdsTipoDoc
                LookupField = 'CODTIPDOC'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                DropDownWidth = 650
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnChange = dblcTipoDocChange
                OnExit = dblcTipoDocExit
              end
              object dblcPortadorForma: TwwDBLookupCombo
                Left = 239
                Top = 110
                Width = 226
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'DESCRICAO')
                DataField = 'CODPORTFORMA'
                DataSource = ds
                LookupTable = CdsPortForma
                LookupField = 'CODPORTFORMA'
                Style = csDropDownList
                DropDownWidth = 450
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbenChBordero: TDBRealEdit
                Left = 470
                Top = 110
                Width = 112
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 9
                WordWrap = False
                IntDigits = 15
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'NumChqBordero'
                DataSource = ds
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 656
            Height = 254
            Selected.Strings = (
              'NOME'#9'10'#9'Atividade/Projeto'#9'F'
              'CODEXTERNOCR'#9'10'#9'Cod. Cent. Respon.'#9'F'
              'NOME_1'#9'10'#9'Cent. Respon.'#9'F'
              'DESCRICAO'#9'10'#9'Receb/Desemb'#9'F'
              'CODEXTERNOCC'#9'10'#9'Cód. Cent. de Custo'#9'F'
              'NOMECENTROCUSTO'#9'10'#9'Nome Cent. Custo'#9'F'
              'NUMRESERVA'#9'10'#9'Comp. Orcamen.'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'DESCPLANO'#9'50'#9'Plano'#9'F'
              'NOMEPATRO'#9'60'#9'Patrocinadora'#9'F'
              'DESCPROGRAMA'#9'60'#9'Programa'#9'F')
            KeyOptions = []
            ReadOnly = True
            TabOrder = 1
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 656
            Height = 254
            TabOrder = 0
            object PnlRateioGeral: TPanel
              Left = 0
              Top = 0
              Width = 656
              Height = 254
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object lblUnidNegoc: TLabel
                Left = 16
                Top = 10
                Width = 104
                Height = 13
                Caption = 'Atividade/Projeto:'
              end
              object lblCentroRespon: TLabel
                Left = 16
                Top = 55
                Width = 107
                Height = 13
                Caption = 'Centro de Respon.'
              end
              object lblTipoRD: TLabel
                Left = 16
                Top = 106
                Width = 116
                Height = 13
                Caption = 'Tipo de Desembolso'
              end
              object Label6: TLabel
                Left = 16
                Top = 160
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object lblMoedaDet: TLabel
                Left = 352
                Top = 58
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object lblValorOutDet: TLabel
                Left = 352
                Top = 98
                Width = 107
                Height = 13
                Caption = 'Valor Outra Moeda'
              end
              object lblValorDet: TLabel
                Left = 352
                Top = 138
                Width = 124
                Height = 13
                Caption = 'Valor Moeda Corrente'
              end
              object Label11: TLabel
                Left = 352
                Top = 218
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object Label12: TLabel
                Left = 352
                Top = 178
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object Label16: TLabel
                Left = 648
                Top = 178
                Width = 38
                Height = 13
                Caption = 'Imóvel'
                Enabled = False
                Visible = False
              end
              object dblcUnidNegoc: TwwDBLookupCombo
                Left = 16
                Top = 24
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'UNETIPO'#9'1'#9'T'
                  'UNECODIGO'#9'10'#9'Código')
                DataField = 'UNIDNEGOC'
                DataSource = dsDet
                LookupTable = CdsUnidNegoc
                LookupField = 'UNIDNEGOC'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcUnidNegocCloseUp
                OnExit = dblcUnidNegocExit
              end
              object dblcCentroRespon: TwwDBLookupCombo
                Left = 16
                Top = 69
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'ANALITICOSINTET'#9'1'#9'T'
                  'CODEXTERNO'#9'10'#9'Código'#9'F')
                DataField = 'CODCENTRORESPON'
                DataSource = dsDet
                LookupTable = CdsCentroRespon
                LookupField = 'CODCENTRORESPON'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcCentroResponCloseUp
                OnExit = dblcCentroResponExit
              end
              object dblcTipoRD: TwwDBLookupCombo
                Left = 16
                Top = 120
                Width = 278
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição'
                  'CODTIPRECDES'#9'15'#9'Código')
                DataField = 'CODTIPRECDES'
                DataSource = dsDet
                LookupTable = CdsTipoRD
                LookupField = 'CODTIPRECDES'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                Enabled = False
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcTipoRDCloseUp
                OnEnter = dblcTipoRDEnter
                OnExit = dblcTipoRDExit
              end
              object CmbCentCusto: TwwDBLookupCombo
                Left = 16
                Top = 174
                Width = 278
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'CODEXTERNO'#9'10'#9'Código'#9'F'
                  'STATUSGRUPOCDC'#9'1'#9'A/S')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsDet
                LookupTable = CdsCentroCusto
                LookupField = 'CODCENTROCUSTO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = CmbCentCustoCloseUp
                OnExit = CmbCentCustoExit
              end
              object GpDotOrc: TPanel
                Left = 344
                Top = 8
                Width = 161
                Height = 44
                BevelOuter = bvNone
                TabOrder = 0
                object SpeedButton1: TSpeedButton
                  Left = 130
                  Top = 15
                  Width = 24
                  Height = 23
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    0400000000008000000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                    77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
                    87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
                    FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
                    0E070F757770000000E070FFF707777777007700007777777777}
                  OnClick = SpeedButton1Click
                end
                object Label17: TLabel
                  Left = 8
                  Top = 2
                  Width = 94
                  Height = 13
                  Caption = 'Comp. Orçamen.'
                end
                object ReResOrc: TDBRealEdit
                  Left = 8
                  Top = 16
                  Width = 122
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 0
                  WordWrap = False
                  OnExit = ReResOrcExit
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = iNumber
                  Signal = False
                  DataField = 'NUMRESERVA'
                  DataSource = dsDet
                end
              end
              object PnlPrograma: TPanel
                Left = 8
                Top = 216
                Width = 297
                Height = 42
                BevelOuter = bvNone
                TabOrder = 10
                object Label13: TLabel
                  Left = 8
                  Top = 2
                  Width = 54
                  Height = 13
                  Caption = 'Programa'
                end
                object CmbPrograma: TCMDBLookupCombo
                  Left = 8
                  Top = 16
                  Width = 278
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROGRAMA'#9'60'#9'Descrição'
                    'CODPROGRAMA'#9'2'#9'Código')
                  DataField = 'IDPROGRAMA'
                  DataSource = dsDet
                  LookupTable = CdsProgramaPrev
                  LookupField = 'IDPROGRAMA'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = CmbProgramaCloseUp
                  OnExit = CmbProgramaExit
                end
              end
              object edMoedaDet: TEdit
                Left = 352
                Top = 72
                Width = 145
                Height = 21
                Enabled = False
                TabOrder = 3
                Text = 'edMoedaDet'
              end
              object dbeValorMoedaDet: TRealEdit
                Left = 352
                Top = 112
                Width = 145
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 4
                WordWrap = False
                OnExit = dbeValorMoedaDetExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
              object dbeValorDet: TRealEdit
                Left = 352
                Top = 152
                Width = 145
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                ParentShowHint = False
                ShowHint = False
                TabOrder = 6
                WordWrap = False
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
              object EdtImovel: TwwDBEdit
                Left = 648
                Top = 192
                Width = 121
                Height = 21
                DataField = 'NUMIMOVEL'
                DataSource = dsDet
                Enabled = False
                TabOrder = 9
                UnboundDataType = wwDefault
                Visible = False
                WantReturns = False
                WordWrap = False
              end
              object CmbPlano: TCMDBLookupCombo
                Left = 352
                Top = 232
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Plano Previdenciário')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 11
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = CmbPlanoCloseUp
                OnExit = CmbPlanoExit
              end
              object CmbPatro: TCMDBLookupCombo
                Left = 352
                Top = 192
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = dsDet
                LookupTable = CdsPatroPrev
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = CmbPatroCloseUp
                OnExit = CmbPatroExit
              end
            end
          end
        end
        object tbsContabil: TTabSheet
          Caption = 'Contabilização'
          object pnlContabil: TPanel
            Left = 0
            Top = 0
            Width = 653
            Height = 254
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
          end
          object dbgrdContabil: TwwDBGrid
            Left = 0
            Top = 0
            Width = 653
            Height = 254
            Selected.Strings = (
              'PLNDATDIA'#9'18'#9'Data Lançamento'
              'PLACONTA'#9'14'#9'Conta Contábil'
              'PLANOME'#9'27'#9'Nome da Conta Contábil'
              'LACDEBCRE'#9'3'#9'D/C'
              'LACVALOR'#9'10'#9'Valor'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'CODEXTERNO'#9'10'#9'Cód. do C. Custo'
              'NOME_1'#9'30'#9'Centro de Custo'
              'NOME'#9'25'#9'Atividade Projeto'
              'DESCPLANO'#9'30'#9'Plano'
              'NOMEPATRO'#9'30'#9'Patrocinadora'
              'SEGREGACRITER'#9'30'#9'Critério Segregação'
              'LACHIST1'#9'30'#9'Histórico 1'
              'LACHIST2'#9'10'#9'Histórico 2'
              'LACHIST3'#9'10'#9'Histórico 3')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContabil
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
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
        object tbsLancamento: TTabSheet
          Caption = 'Lançamentos'
          object dbgLancamentos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 653
            Height = 254
            Selected.Strings = (
              'NUMLANCTO'#9'10'#9'Lançamento'
              'OPERACAO'#9'2'#9'Operação'
              'DATALANCTO'#9'10'#9'Data Lançamento'
              'VALOR'#9'10'#9'Valor Moeda Corrente'
              'VALOROUTRAMOEDA'#9'10'#9'Valor Outra Moeda'
              'DEBCRE'#9'1'#9'D/C'
              'HISTORICOCOMPL'#9'60'#9'Histórico'
              'ESTORNO'#9'10'#9'Estorno'
              'CODLANCFINANC'#9'10'#9'Lançamento Financeiro'
              'CODPORTFORMA'#9'10'#9'Forma de Recto/Pagto'
              'NUMLOTE'#9'10'#9'Número do Lote'
              'PLNCODIGO'#9'10'#9'Código Contábil'
              'NUMCHQBORDERO'#9'15'#9'Cheque/Borderô'
              'DATACFLOAT'#9'10'#9'Data com Float'
              'CODALTERADOR'#9'10'#9'Alterador')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLancamento
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
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
        object TbsAlteradores: TTabSheet
          Caption = 'Alteradores'
          object GrdAlteradores: TwwDBGrid
            Left = 0
            Top = 0
            Width = 656
            Height = 254
            ControlType.Strings = (
              'CONTABILIZA;CheckBox;S;N'
              'FLGINCIDEIRRF;CheckBox;S;N')
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'
              'DATALANCTO'#9'18'#9'Dt. Lancto.'
              'VALOROUTRAMOEDA'#9'10'#9'Valor em Outra Moeda'
              'VALOR'#9'10'#9'Valor'
              'HISTORICOCOMPL'#9'60'#9'Histórico Complementar'
              'DEBCRE'#9'1'#9'D/C'
              'VLRLIQUIDO'#9'10'#9'Valor Líquido'
              'NOME'#9'25'#9'Nome'
              'CONTABILIZA'#9'1'#9'Contabiliza?'
              'FLGINCIDEIRRF'#9'1'#9'Incide IRRF?')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsAlteradores
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
            TabOrder = 1
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
          object PnlAlteradores: TPanel
            Left = 0
            Top = 0
            Width = 656
            Height = 254
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblAlterador: TLabel
              Left = 16
              Top = 18
              Width = 126
              Height = 13
              Caption = 'Alterador Selecionado'
            end
            object lblValOut: TLabel
              Left = 320
              Top = 18
              Width = 115
              Height = 13
              Caption = 'Valor (Outra Moeda)'
            end
            object Label1: TLabel
              Left = 472
              Top = 18
              Width = 132
              Height = 13
              Caption = 'Valor (Moeda Corrente)'
            end
            object Label2: TLabel
              Left = 176
              Top = 66
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object Label3: TLabel
              Left = 16
              Top = 66
              Width = 101
              Height = 13
              Caption = 'Data Lançamento'
            end
            object Label20: TLabel
              Left = 536
              Top = 50
              Width = 104
              Height = 13
              Caption = 'Atividade\Projeto:'
              Enabled = False
              Visible = False
            end
            object Label21: TLabel
              Left = 17
              Top = 174
              Width = 169
              Height = 13
              Caption = 'Observação sobre o alterador'
            end
            object EdtHist: TDBEdit
              Left = 176
              Top = 80
              Width = 451
              Height = 21
              DataField = 'HISTORICOCOMPL'
              DataSource = DsAlteradores
              TabOrder = 6
            end
            object DtLancto: TCMDateTimePicker
              Left = 16
              Top = 80
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALANCTO'
              DataSource = DsAlteradores
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
              TabOrder = 5
            end
            object DbROutraMoeda: TDBRealEdit
              Left = 320
              Top = 32
              Width = 142
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOROUTRAMOEDA'
              DataSource = DsAlteradores
            end
            object DbrValor: TDBRealEdit
              Left = 472
              Top = 32
              Width = 157
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = DbrValorExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = DsAlteradores
            end
            object dblkAlterador: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO'
                'ACRESDECRES'#9'1'#9'ACRESDECRES')
              DataField = 'CODALTERADOR'
              DataSource = DsAlteradores
              LookupTable = CdsAlt
              LookupField = 'CODALTERADOR'
              DropDownWidth = 400
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblkAlteradorChange
              OnExit = dblkAlteradorExit
            end
            object DbrValLiquido: TDBRealEdit
              Left = 496
              Top = 32
              Width = 130
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = DsAlteradores
            end
            object DclAtivProjeto: TwwDBLookupCombo
              Left = 536
              Top = 64
              Width = 166
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNETIPO'#9'1'#9'T'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = DsAlteradores
              LookupTable = CdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              Enabled = False
              TabOrder = 4
              Visible = False
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = DclAtivProjetoExit
            end
            object CkbContabiliza: TDBCheckBox
              Left = 24
              Top = 120
              Width = 353
              Height = 17
              Caption = 'Não Integrar Este lançamento com a Contabilidade'
              DataField = 'CONTABILIZA'
              DataSource = DsAlteradores
              TabOrder = 7
              ValueChecked = 'N'
              ValueUnchecked = 'S'
            end
            object mmObsAlt: TMemo
              Left = 16
              Top = 191
              Width = 633
              Height = 79
              Color = clScrollBar
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 8
            end
          end
        end
        object TbsGeral: TTabSheet
          Caption = 'Geral'
          object Label9: TLabel
            Left = 5
            Top = 136
            Width = 69
            Height = 13
            Caption = 'Observação'
          end
          object PnlGeral: TPanel
            Left = 0
            Top = 0
            Width = 297
            Height = 134
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 3
            object LblSubContaCli: TLabel
              Left = 5
              Top = 89
              Width = 103
              Height = 13
              Caption = 'Sub-Conta Cliente'
            end
            object LblFormaPag: TLabel
              Left = 5
              Top = 45
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object Label8: TLabel
              Left = 5
              Top = 4
              Width = 63
              Height = 13
              Caption = 'Referência'
            end
            object Dbereferencia: TwwDBEdit
              Left = 5
              Top = 19
              Width = 176
              Height = 21
              DataField = 'REFERENCIA'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DblCodForma: TwwDBLookupCombo
              Left = 5
              Top = 62
              Width = 286
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição')
              DataField = 'CODFORMA'
              DataSource = ds
              LookupTable = CdsFormaPag
              LookupField = 'CODFORMA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CmbSubConta: TwwDBLookupCombo
              Left = 5
              Top = 105
              Width = 286
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'40'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = ds
              LookupTable = CdsSubContaForCli
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object PnlAp: TPanel
              Left = 176
              Top = 8
              Width = 110
              Height = 35
              BevelOuter = bvNone
              TabOrder = 0
              object LblNumAp: TLabel
                Left = 6
                Top = -2
                Width = 35
                Height = 13
                Caption = 'Nº AP'
              end
              object BtnNumApgr: TSpeedButton
                Left = 82
                Top = 8
                Width = 25
                Height = 25
                Hint = 'Gera Nº Automático'
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888088888888888888800888888888888880B0888888888888880B088
                  8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
                  88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
                  8888888880FBFBF0888888888000000088888888888888888888}
                ParentShowHint = False
                ShowHint = True
                OnClick = BtnNumApgrClick
              end
              object EdtNumAp: TwwDBEdit
                Left = 5
                Top = 11
                Width = 77
                Height = 21
                DataField = 'NUMAPGR'
                DataSource = ds
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          object GpConta: TGroupBox
            Left = 302
            Top = 135
            Width = 389
            Height = 59
            Caption = 'Conta Bancária '
            Enabled = False
            TabOrder = 1
            object Label14: TLabel
              Left = 8
              Top = 15
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 183
              Top = 15
              Width = 52
              Height = 13
              Caption = 'Nº Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 91
              Top = 15
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 238
              Top = 15
              Width = 115
              Height = 13
              DataField = 'DESCTIPOCONTA'
              DataSource = ds
            end
            object BtnBuscaContaCor: TSpeedButton
              Left = 345
              Top = 27
              Width = 25
              Height = 25
              Hint = 'Altera Conta Bancária'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33033333333333333F7F3333333333333000333333333333F777333333333333
                000333333333333F777333333333333000333333333333F77733333333333300
                033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                333333773FF77333333333370007333333333333777333333333}
              NumGlyphs = 2
              OnClick = BtnBuscaContaCorClick
            end
            object DbEdtConta: TwwDBEdit
              Left = 180
              Top = 30
              Width = 163
              Height = 21
              DataField = 'CONTACORRENTE'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DbEdtBanco: TwwDBEdit
              Left = 8
              Top = 30
              Width = 58
              Height = 21
              DataField = 'NUMBANCO'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DbEdtAgencia: TwwDBEdit
              Left = 89
              Top = 30
              Width = 65
              Height = 21
              DataField = 'NUMAGENCIA'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object MemObs: TDBMemo
            Left = 5
            Top = 152
            Width = 286
            Height = 112
            DataField = 'OBS'
            DataSource = ds
            MaxLength = 1000
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object grBoxRAD: TGroupBox
            Left = 303
            Top = 200
            Width = 210
            Height = 61
            Caption = 'RAD'
            TabOrder = 2
            object dbtxtNumProc: TDBText
              Left = 105
              Top = 21
              Width = 80
              Height = 13
              AutoSize = True
              DataField = 'idprocesso'
              DataSource = DsRAD
            end
            object lblProcesso: TLabel
              Left = 7
              Top = 21
              Width = 93
              Height = 13
              Caption = 'Nº do Processo:'
            end
            object Label19: TLabel
              Left = 7
              Top = 37
              Width = 41
              Height = 13
              Caption = 'Status:'
            end
            object dbtxtStatusProc: TDBText
              Left = 53
              Top = 37
              Width = 91
              Height = 13
              AutoSize = True
              DataField = 'status'
              DataSource = DsRAD
            end
          end
          object GpBarras: TGroupBox
            Left = 301
            Top = 2
            Width = 389
            Height = 128
            Caption = ' Nº da '
            Enabled = False
            TabOrder = 0
            object Label5: TLabel
              Left = 8
              Top = 81
              Width = 86
              Height = 13
              Caption = 'Linha Digitável'
            end
            object Label4: TLabel
              Left = 8
              Top = 44
              Width = 98
              Height = 13
              Caption = 'Código de Barras'
            end
            object DbeBarras: TwwDBEdit
              Left = 8
              Top = 59
              Width = 372
              Height = 21
              DataField = 'NUMLEITCODBARRAS'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = DbeBarrasExit
            end
            object DbeLinhaDigit: TwwDBEdit
              Left = 8
              Top = 96
              Width = 373
              Height = 21
              DataField = 'NUMDIGCODBARRAS'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = DbeLinhaDigitExit
            end
            object RdFicha: TRadioButton
              Left = 8
              Top = 20
              Width = 161
              Height = 17
              Caption = '&Ficha de Compensação'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RdFichaClick
            end
            object RdArrecad: TRadioButton
              Left = 251
              Top = 20
              Width = 97
              Height = 17
              Caption = '&Arrecadação'
              TabOrder = 1
              OnClick = RdArrecadClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 519
            Top = 200
            Width = 173
            Height = 61
            Caption = 'Cotas'
            TabOrder = 5
            object Label22: TLabel
              Left = 7
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object dbQtdeCota: TDBEdit
              Left = 8
              Top = 32
              Width = 153
              Height = 21
              DataField = 'QTDECOTAS'
              DataSource = ds
              TabOrder = 0
              OnChange = dbQtdeCotaChange
            end
          end
        end
        object tbsContasBaixa: TTabSheet
          Caption = 'Contas Baixa'
          ImageIndex = 6
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 653
            Height = 254
            Selected.Strings = (
              'PATROCINADORA'#9'22'#9'Patrocinadora'
              'PLANPREVCONTABIL'#9'24'#9'Plano'
              'SEGREGACRITER'#9'25'#9'Critério Segregação'
              'PLACONTA'#9'18'#9'Conta'
              'VALOR'#9'10'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCCBaixasXDocum
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
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
      inherited Dock973: TDock97
        Width = 754
        object lblRateio: TLabel [0]
          Left = 288
          Top = 8
          Width = 118
          Height = 13
          Caption = 'Rateio Pré-definido: '
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 24
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 49
          end
        end
        object DBcboGrupoRateio: TwwDBLookupCombo
          Left = 410
          Top = 4
          Width = 247
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRRDESCRICAO'#9'60'#9'Grupo de Rateio'#9'F')
          LookupTable = cdsGrupoRateio
          LookupField = 'IDGRUPORATEIO'
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = DBcboGrupoRateioExit
        end
        object btnGrupoRateio: TBitBtn
          Left = 666
          Top = 2
          Width = 85
          Height = 25
          Caption = 'Ratear'
          TabOrder = 1
          OnClick = btnGrupoRateioClick
        end
      end
      inherited Dock974: TDock97
        Left = 668
        Height = 282
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Height = 26
          end
          inherited bbtnCancelarDet: TBitBtn
            Tag = 9999
            Top = 26
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 9999
            Top = 53
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 390
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 552
      inherited bbtnSair: TBitBtn
        Tag = 9999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 383
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Tag = 9999
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 9999
        Left = 81
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 988
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 21
    Top = 230
  end
  inherited ImlPadrao: TImageList
    Left = 931
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 693
    Top = 21
  end
  inherited Cds: TCMClientDataSet
    Tag = 1
    AfterOpen = CdsAfterOpen
    Left = 19
    Top = 174
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.NUMAPGR'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'round(LANCTODOCUM.VALOR,2)'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO'
      'RECBTOPAGTO.NUMCHQBORDERO'
      'PESSOA.NOME'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'DOCUMENTO.IDPROCESSO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'N'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Compl. Documento'
      'Nº Ap/Gr'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Tipo de Documento'
      'Forma de Pagamento/Cobrança'
      'Sistema de Origem'
      'Número do Cheque/Borderô'
      'Nome'
      'Usuário Inclusão'
      'Processo RAD')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'DOCUMENTO'
      'LANCTODOCUM'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'MODULO'
      'RECBTOPAGTO'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA          = DOCUMENTO.IDFORCLI'
      
        '(TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE) OR (DOCUMENTO.OPERAC' +
        'AO = '#39'15'#39')'
      'TIPODOCRECPAG.CODTIPDOC  = DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO     = DOCUMENTO.OPERACAO'
      'DOCUMENTO.CODPORTFORMA   = PORTADORFORMA.CODPORTFORMA(+)'
      'DOCUMENTO.IDMODULO       = MODULO.IDMODULO(+)'
      'DOCUMENTO.MOECODIGO      = MOEDA.MOECODIGO(+)'
      'LANCTODOCUM.CODDOCUMENTO = RECBTOPAGTO.CODDOCUMENTO(+)'
      'LANCTODOCUM.NUMLANCTO    = RECBTOPAGTO.NUMLANCTO(+)'
      'DOCUMENTO.IDUSUARIOINCLUSAO=USUARIOSISTEMA.IDUSUARIO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      '#,##0.00'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '15'
      '3'
      '10'
      '10'
      '10'
      '15'
      '40'
      '20'
      '20'
      '20'
      '10'
      '30'
      '20'
      '15'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 539
    Top = 68
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 653
    Top = 69
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 67
    Top = 230
  end
  object dsContabil: TwwDataSource
    AutoEdit = False
    DataSet = CdsContab
    Left = 178
    Top = 230
  end
  object dsLancamento: TwwDataSource
    AutoEdit = False
    DataSet = CdsLancamento
    OnDataChange = dsLancamentoDataChange
    Left = 123
    Top = 230
  end
  object ImlDocs: TImageList
    Height = 30
    Left = 923
    Top = 54
    Bitmap = {
      494C010104000900040010001E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005A0000000100200000000000005A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000084000000840000008400000084000000FF000000FF000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      0000000000000000000000000000000000008400000084000000FF0000008484
      8400FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      000000000000000000000000000000000000000000000000000084000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000000084000000000000008400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000008400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000084000000000000008400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      8400000084000000840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000084000000
      0000000084000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000084000000
      00000000840000000000000084000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000000000000000
      8400000084000000840000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00848484008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000084000000000000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84008484840000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000084848400FF00000084000000840000000000000000000000000000000000
      000084000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000FF0000008400000084000000840000008400
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000400000005A0000000100010000000000D00200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FF
      FFFFFFFFFFFFE03BFFFFFFFFFFFFCF03FFFFFFFFFFFFCFC3FFFFFFFFFFFFCFC3
      FFFFFFFFFFFFCF83FFBFFFF7FFFFE7FFF81FFFE3FF9FFFFFE01FFFD5FE1FFE7F
      C01FFFF5F81FF87FC00FFE75E00FE07FE007F863E00F803F8007E057C007803F
      800380158007801F800380230003C01FC00380172001C00FC00FC01F1000E007
      E007C00F0401E003E003E0072007F007F007E003801FF81FF81FF007C1FFFC7F
      FC7FF81FFFFFFFE7FFFFFC7FFFFFC1F3FFFFFFFFFFFFC3F3FFFFFFFFFFFFC3F3
      FFFFFFFFFFFFC0F3FFFFFFFFFFFFDC07FFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFF
      00000000000000000000000000000000000000000000}
  end
  object DsAlteradores: TwwDataSource
    AutoEdit = False
    DataSet = CdsAlteradores
    Left = 234
    Top = 230
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      
        '(RESERVAORCAMEN.VLRRESERVA - RESERVAORCAMEN.VLRCOMPROMISSO) AS V' +
        'ALOR'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA'
      'RESERVAORCAMEN.IDOPERACAO'
      'UNIDNEGOCIO.NOME'
      'CENTRESPON.NOME'
      'CENTCUST.NOME'
      'PROGRAMA.DESCPROGRAMA'
      'PESSOA.NOME'
      'PLANPREVCONTABIL.NOME')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nome da Conta'
      'Número da Conta'
      'Observação'
      'Operação'
      'Atividade / Projeto'
      'Centro de Responsabilidade'
      'Centro de Custo'
      'Programa'
      'Patrocinadora'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'CONTASORCAMEN'
      'PLANPREVCONTABIL'
      'CENTCUST'
      'PROGRAMA'
      'PATRO'
      'PESSOA'
      'UNIDNEGOCIO'
      'CENTRESPON')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.IDPLANOPREV'
      'CONTASORCAMEN.IDPATRO'
      'CONTASORCAMEN.UNIDNEGOC'
      'CONTASORCAMEN.CODCENTROCUSTO'
      'CONTASORCAMEN.CODCENTRORESPON'
      'CENTCUST.IDPROGRAMA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN'
      'PLANPREVCONTABIL.IDPLANOPREV(+) = CONTASORCAMEN.IDPLANOPREV'
      'CENTCUST.CODCENTROCUSTO(+)      = CONTASORCAMEN.CODCENTROCUSTO'
      'PROGRAMA.IDPROGRAMA(+)          = CENTCUST.IDPROGRAMA'
      'PATRO.IDPESSOA(+)               = CONTASORCAMEN.IDPATRO'
      'PATRO.IDPESSOA                  = PESSOA.IDPESSOA(+)'
      'UNIDNEGOCIO.UNIDNEGOC(+)        = CONTASORCAMEN.UNIDNEGOC'
      'CENTRESPON.CODCENTRORESPON(+)   = CONTASORCAMEN.CODCENTRORESPON')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '50'
      '20'
      '70'
      '10'
      '25'
      '30'
      '30'
      '30'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 595
    Top = 53
  end
  object SqlDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.CODDOCUMENTO,'
      '  D.CODPORTFORMA,'
      '  D.CODSUBCONTA,'
      '  D.IDPESSOA,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.MOECODIGO,'
      '  D.NUMSLIP,'
      '  D.EMISBLOQ,'
      '  D.CODCENTROCUSTO,'
      '  D.IDFORCLI,'
      '  D.IDMODULO,'
      '  D.CODTIPDOC,'
      '  D.RECPAG,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAEMISSAO,'
      '  D.DATAVENCTO,'
      '  D.DATAPROGRAMADA,'
      '  D.STATUS,'
      '  D.NUMFATURA,'
      '  D.OPERACAO,'
      '  D.NOSSONUMERO,'
      '  D.IDUSUARIOINCLUSAO,'
      '  L.NUMLANCTO,'
      '  L.CODALTERADOR,'
      '  L.PLNCODIGO,'
      '  L.DATALANCTO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.ESTORNO,'
      '  L.DEBCRE,'
      '  L.HISTORICOCOMPL,'
      '  R.CODLANCFINANC,'
      '  R.NUMLOTE,'
      '  R.NUMCHQBORDERO,'
      '  R.DATACFLOAT,'
      '  P.NOME,'
      '  D.CODFORMA,'
      '  D.NUMLEITCODBARRAS,'
      '  D.NUMDIGCODBARRAS,'
      '  L.NUMFATURA,'
      '  L.FLGTIPOFATURA,'
      '  M.NOMEMODULO,'
      '  L.VLRLIQUIDO,'
      '  D.UNIDNEGOC,'
      '  D.REFERENCIA,'
      '  D.OBS,'
      '  D.NUMAPGR,'
      '  D.NUMAPGR AS OLDAPGR,'
      '  US.NOMEUSUARIO,'
      '  D.IDCBANCARIA,'
      '  DECODE(C.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '  DECODE(C.TIPOCONTA, '#39'2'#39', '#39'Cartão Salário'#39','
      
        '  DECODE(C.TIPOCONTA, '#39'3'#39', '#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCON' +
        'TA,'
      '  C.CONTACORRENTE,'
      '  B.NUMBANCO,'
      '  A.NUMAGENCIA,'
      '  C.TIPOCONTA,'
      '  D.DATADISPONIB,'
      '  D.IDPROCESSO,'
      '  D.FLGCONTAINVEST,'
      '  D.FLGIMPORTADO,'
      '  L.PLNANTECIPA,'
      '  D.IDSEGREGACRITER,'
      '  D.QTDECOTAS'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  RECBTOPAGTO R,'
      '  PESSOA P,'
      '  MODULO M,'
      '  USUARIOSISTEMA US,'
      '  CONTABANCARIA C,'
      '  AGENCIABANCARIA A,'
      '  BANCO B'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.IDMODULO = M.IDMODULO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO) AND'
      '  (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      '  (R.NUMLANCTO(+) = L.NUMLANCTO) AND'
      '  (P.IDPESSOA = D.IDFORCLI) AND'
      '  (D.IDUSUARIOINCLUSAO = US.IDUSUARIO) AND'
      '  (C.IDAGENCIA = A.IDPESSOA(+))  AND'
      '  (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '  (D.IDCBANCARIA = C.IDCBANCARIA(+))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 19
    Top = 135
  end
  object SQLDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   R.RECPAG,'
      '   R.IDPESSOA,'
      '   R.IDRESERVAORCAMEN,'
      '   R.CODCENTRORESPON,'
      '   C.CODEXTERNO as CODEXTERNOCR,'
      '   R.UNIDNEGOC,'
      '   R.MOECODIGO,'
      '   R.VALOR,'
      '   R.VALOROUTRAMOEDA,'
      '   t.PLACONTACREDITO,'
      '   R.IDUSUARIOINCLUSAO,'
      '   U.NOME,'
      '   C.NOME,'
      '   R.CODCENTROCUSTO,'
      '   CC.CODEXTERNO as CODEXTERNOCC,'
      '   R.IDRATEIODOCUM,'
      '   T.DESCRICAO,'
      '   I.MOESIGLA,'
      '   CC.NOME AS NOMECENTROCUSTO,'
      '   R.PLANO,'
      '   R.IDPATRO,'
      '   R.IDPROGRAMA,'
      '   PROGRAMA.FLGTIPOPROGRAMA,'
      '   R.NUMIMOVEL,'
      '   PATRO.NOME AS NOMEPATRO,'
      '   PLANO.NOME AS DESCPLANO,'
      '   PROGRAMA.DESCPROGRAMA,'
      '   T.HITCODHIST,'
      '   R.IDPLANOPREV,'
      '   RESERVAORCAMEN.NUMRESERVA,'
      '   T.FLGOBRIGARESERVA,'
      '   RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '   R.VALOR AS VALORRESERVAOLD,'
      '   R.VLRRESORCAMEN,'
      '   -1 AS IDSEGREGACRITER,'
      
        '   '#39'                                                            ' +
        #39' AS DESCSEGREGACRITER,'
      '   0 AS CODSUBCONTA, 0 AS CODSUBCONTAPASS,'
      '   '#39'                  '#39' AS PLACONTA,'
      '   '#39'                  '#39' AS PLACONTAPASS,'
      '   '#39'                                        '#39' AS NOMECONTA,'
      '   '#39'                                        '#39' AS NOMECONTAPASS,'
      '   IDPLANOVIRTUAL,'
      '   IDSEGREGACONTR,'
      '   T.FLGOBRQTDECOTAS'
      'FROM'
      '   RATEIODOCUM R,'
      '   UNIDNEGOCIO U,'
      '   CENTRESPON C,'
      '   TIPORECEBDESEMB T,'
      '   MOEDA I,'
      '   CENTCUST CC,'
      '   PESSOA PATRO,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA, RESERVAORCAMEN'
      'WHERE'
      '   (R.CODDOCUMENTO =  :CODDOCUMENTO)AND'
      '   (T.CODTIPRECDES = R.CODTIPRECDES) AND'
      '   (T.RECPAG = R.RECPAG) AND'
      '   (T.IDPESSOA = R.IDPESSOA) AND'
      '   (U.UNIDNEGOC = R.UNIDNEGOC) AND'
      '   (U.IDPESSOA = R.IDPESSOA) AND'
      '   (I.MOECODIGO(+) = R.MOECODIGO) AND'
      '   (C.CODCENTRORESPON(+) = R.CODCENTRORESPON) AND'
      '   (CC.IDEMPRESA(+) = R.IDPESSOA) AND'
      '   (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'
      '   (C.IDPESSOA(+) = R.IDPESSOA) AND'
      '   (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV) AND'
      '   (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA) AND'
      '   (PATRO.IDPESSOA(+) = R.IDPATRO) AND'
      '   (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDet
    Left = 69
    Top = 103
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsDetAfterOpen
    AfterInsert = CdsDetAfterInsert
    AfterCancel = CdsDetAfterCancel
    Left = 64
    Top = 182
  end
  object SqlContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LC.PLACONTA,'
      '  LC.CODSUBCONTA,'
      '  LC.LACDEBCRE,'
      '  LC.LACVALOR,'
      '  LC.LACVALHIST,'
      '  LC.LACHIST1,'
      '  LC.LACHIST2,'
      '  LC.LACHIST3,'
      '  LC.PLNCODIGO,'
      '  LC.LACNUMLAN,'
      '  LC.HITCODHIST,'
      '  LC.IDPESSOA,'
      '  LC.IDEMPRESA,'
      '  LC.IDMODULO,'
      '  LC.UNIDNEGOC,'
      '  LC.IDUSUARIOINCLUSAO,'
      '  LC.PLANO,'
      '  LC.LACTIPO,'
      '  LC.LACNUMDOC,'
      '  LC.LACHIST4,'
      '  LC.LACHIST5,'
      '  LC.LACTIPCONVOFICIAL,'
      '  LC.LACVALOFICIAL,'
      '  LC.LACTIPCONVGER,'
      '  LC.LACVALGERENCIAL,'
      '  LC.LACTIPCONVGEREN1,'
      '  LC.LACVALGEREN1,'
      '  LC.LACTIPCONVGEREN2,'
      '  LC.LACVALGEREN2,'
      '  LC.LACATOUTMOEDA,'
      '  LC.LACORIGEMAPLIC,'
      '  LC.TIPCODIGO,'
      '  LC.IDELEMDEMONSTRAT,'
      '  LC.CODCENTROCUSTO,'
      '  CC.CODEXTERNO,'
      '  U.NOME,'
      '  CC.NOME as NOME_1,'
      '  CC.CODCENTROCUSTO as CODCENTROCUSTO_CC,'
      '  PC.PLANOME,'
      '  LC.IDPLANOPREV,'
      '  LC.IDPATRO,'
      '  PATRO.NOME AS NOMEPATRO,'
      '  PLANO.NOME AS DESCPLANO,'
      '  LC.IDSEGREGACRITER,'
      '  SG.DESCRICAO AS SEGREGACRITER,'
      '  '#39'              '#39'  As CODDOCUMENTO,'
      '  '#39'   '#39' AS COMPLDOCUMENTO,'
      
        '  '#39'                                                           '#39' ' +
        'AS RAZAOSOCIAL,'
      '  '#39'                           '#39' AS DSCLANCAMENTO,'
      '  '#39'          '#39' AS DATAVENCIMENTO,'
      
        '  '#39'                                                           '#39' ' +
        'AS HISTORICOCOMPL,'
      
        '  '#39'                                                           '#39' ' +
        'AS TIPODOCUMENTO,'
      '  P.PLNDATDIA'
      'FROM'
      '  PLANILHA P,'
      '  LANCAMENTO LC,'
      '  UNIDNEGOCIO U,'
      '  CENTCUST CC,'
      '  PLANOCONTA PC,'
      '  PESSOA PATRO,'
      '  PLANPREVCONTABIL PLANO,'
      '  SEGREGACRITER SG'
      'WHERE'
      
        ' ( (LC.PLNCODIGO = :PLNCODIGO) OR (LC.PLNCODIGO = :PLNANTECIPA) ' +
        ')AND'
      ' (P.PLNCODIGO = LC.PLNCODIGO) AND'
      ' (CC.IDEMPRESA(+) = LC.IDEMPRESA) AND'
      ' (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      ' (LC.IDPESSOA = U.IDPESSOA(+)) AND'
      ' (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      ' (PC.PLANO = LC.PLANO) AND'
      ' (PC.PLACONTA = LC.PLACONTA) AND'
      ' (PLANO.IDPLANOPREV(+) = LC.IDPLANOPREV) AND'
      ' (PATRO.IDPESSOA(+) = LC.IDPATRO) AND'
      ' (LC.IDSEGREGACRITER = SG.IDSEGREGACRITER(+))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = CdsContab
    Left = 187
    Top = 127
  end
  object CdsContab: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContabAfterOpen
    Left = 179
    Top = 182
    Data = {
      C60700009619E0BD010000001800000035000000000003000000C60708504C41
      434F4E544101004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020012000B434F44535542434F4E5441080004
      0000000000094C41434445424352450100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000100084C414356
      414C4F5208000400000000000A4C414356414C48495354080004000000000008
      4C414348495354310100490000000100055749445448020002002800084C4143
      48495354320100490000000100055749445448020002002800084C4143484953
      5433010049000000010005574944544802000200280009504C4E434F4449474F
      0800040000000000094C41434E554D4C414E08000400000000000A484954434F
      444849535401004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002000400084944504553534F41080004000000
      0000094944454D505245534108000400000000000849444D4F44554C4F080004
      000000000009554E49444E45474F430800040000000000114944555355415249
      4F494E434C5553414F080004000000000005504C414E4F080004000000000007
      4C41435449504F01004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000100094C41434E554D444F43010049
      0000000100055749445448020002000F00084C41434849535434010049000000
      0100055749445448020002002800084C41434849535435010049000000010005
      5749445448020002002800114C4143544950434F4E564F46494349414C010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000D4C414356414C4F46494349414C08000400000000000D
      4C4143544950434F4E5647455201004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000F4C414356414C
      474552454E4349414C0800040000000000104C4143544950434F4E5647455245
      4E3101004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020001000C4C414356414C474552454E310800040000
      000000104C4143544950434F4E56474552454E32010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0C4C414356414C474552454E3208000400000000000D4C414341544F55544D4F
      45444101004900000002000753554254595045020049000A0046697865644368
      6172000557494454480200020001000E4C41434F524947454D41504C49430100
      4900000002000753554254595045020049000A00466978656443686172000557
      4944544802000200010009544950434F4449474F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000200
      104944454C454D44454D4F4E535452415408000400000000000E434F4443454E
      54524F435553544F01004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A000A434F4445585445524E4F01
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000A00044E4F4D4501004900000001000557494454480200
      02001900064E4F4D455F310100490000000100055749445448020002001E0011
      434F4443454E54524F435553544F5F4343010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A0007504C
      414E4F4D4501004900000001000557494454480200020028000B4944504C414E
      4F505245560800040000000000074944504154524F0800040000000000094E4F
      4D45504154524F0100490000000100055749445448020002003C000944455343
      504C414E4F01004900000001000557494454480200020032000F494453454752
      45474143524954455208000400000000000D5345475245474143524954455201
      00490000000100055749445448020002003C000C434F44444F43554D454E544F
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000E000E434F4D504C444F43554D454E544F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020003000B52415A414F534F4349414C01004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002003B000D
      4453434C414E43414D454E544F01004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002001B000E444154415645
      4E43494D454E544F01004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A000E484953544F5249434F434F
      4D504C01004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002003B000D5449504F444F43554D454E544F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002003B0009504C4E44415444494108000800000000000100044C43
      49440400010009080000}
  end
  object SQLAlteradores: TCMSqlParams
    SQL.Strings = (
      'Select'
      '  A.DESCRICAO,'
      '  LC.DATALANCTO,'
      '  LC.VALOROUTRAMOEDA,'
      '  LC.VALOR,'
      '  LC.HISTORICOCOMPL,'
      '  LC.DEBCRE,'
      '  LC.VLRLIQUIDO,'
      '  LC.UNIDNEGOC,'
      '  LC.IDPESSOA,'
      '  U.NOME,'
      '  A.CODALTERADOR,'
      '  ('#39'S'#39') AS CONTABILIZA,'
      '  A.FLGINCIDEIRRF'
      'From'
      '  LANCTODOCUM LC,'
      '  TIPOALTERADOR A,'
      '  UNIDNEGOCIO U'
      'Where'
      '  LC.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  LC.CODALTERADOR = A.CODALTERADOR AND'
      '  LC.UNIDNEGOC = U.UNIDNEGOC(+)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAlteradores
    Left = 234
    Top = 135
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLancamentoAfterOpen
    AfterInsert = CdsAlteradoresAfterInsert
    AfterPost = CdsAlteradoresAfterPost
    Left = 234
    Top = 182
  end
  object SQLLancamento: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' L.CODDOCUMENTO,'
      ' L.NUMLANCTO,'
      ' L.CODALTERADOR,'
      ' L.PLNCODIGO,'
      ' L.DATALANCTO,'
      ' L.VALOR,'
      ' L.VALOROUTRAMOEDA,'
      ' L.DEBCRE,'
      ' L.OPERACAO,'
      ' L.HISTORICOCOMPL,'
      ' L.IDUSUARIOINCLUSAO,'
      ' L.ESTORNO,'
      ' R.CODDOCUMENTO,'
      ' R.NUMLANCTO,'
      ' R.IDUSUARIOINCLUSAO,'
      ' R.CODLANCFINANC,'
      ' R.CODPORTFORMA,'
      ' R.NUMLOTE,'
      ' R.NUMCHQBORDERO,'
      ' R.DATACFLOAT,'
      ' L.PLNANTECIPA'
      'FROM'
      ' LANCTODOCUM'
      ' L, RECBTOPAGTO R'
      'WHERE'
      ' (L.CODDOCUMENTO = :CODDOCUMENTO) AND'
      ' (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      ' (R.NUMLANCTO(+) = L.NUMLANCTO)'
      'ORDER BY'
      ' L.DATALANCTO'
      ' ')
    ClientDataSet = CdsLancamento
    Left = 123
    Top = 135
  end
  object CdsLancamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLancamentoAfterOpen
    Left = 123
    Top = 182
  end
  object SQLMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO,MOEDESC,MOESIGLA'
      'FROM'
      '   MOEDA'
      'WHERE'
      '   MOEINATIVO = '#39'A'#39
      ' ')
    ClientDataSet = CdsMoeda
    Left = 330
    Top = 135
  end
  object CdsMoeda: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 182
    Data = {
      BD0600009619E0BD0100000018000000030032000000030000007200094D4F45
      434F4449474F0800040000000000074D4F454445534301004900000001000557
      49445448020002001400084D4F455349474C4101004900000001000557494454
      48020002000A000100044C43494404000100090800000000000000000000F03F
      13556E69642E205265662E204D455452612D524A05544255524D000000000000
      000000401454782E20436F6E742E204573706563216669636105544254434500
      000000000000000840145465746F20646520436F6E747269627569E7E36F0854
      45544F494E535300000000000000002240134641542E20434F52524543414F20
      5245464552075442524546455200000000000000001840045265616C02522400
      00000000000000414012446F6C617220555320436F6D65726369616C06555324
      434F4D00000000000000002040124641542E20434F52524543414F20494E5353
      065442494E5353000000000000000024400E73616C6172696F206D696E696D6F
      0673616C6D696E00000000000000002640135465746F20436F6E747269622E20
      52656665720854455452454645520000000000000000144010436F7461732064
      65205265736572766107434F544152455300000000000000002840115265746F
      726E6F20476172616E7469646F08524554474552414E00000000000000002C40
      08476172616E74696108474152414E54494100000000000000002E4014566172
      696163616F2050617472696D6F6E69616C085641525041545249000000000000
      0000394004554649520455464952000000000000000037400B496E6469636520
      5A65726F07494E444943455A00000000000000003B4004494E504304494E5043
      00000000000000004040044E554C4F0654425A45524F00000000000000004240
      1149424F5645535041202D204D454E53414C0849424F56455350410000000000
      0000004440054947502D4D054947502D4D000000000000008045400843444220
      4242534106434442204242000000000000008047401449475044492028496E76
      657374696D656E746F2905494750444900000000000000004B400C53454C4943
      2D44494152494F0953454C49432D44494100000000000000804E400254520254
      5200000000000000405040044950435204495043520000000000000000514003
      42544E0342544E00000000000000005240145553202D20556E69646164652053
      65727669636F02555300000000000000805240125465746F20646520486F7261
      204578747261085445544F484F5241000000000000004053400F494E44494345
      20415455415249414C03415455000000000000000055400F5452204143554D20
      32394F55543939075452204143554D00000000000000C056400C434449202D20
      44494152494F074344492D444941000000000000000057400A4C465420444941
      52494F074C465420444941000000000000008059400E53616C6172696F204D69
      6E696D6F04532E4D2E00000000000000C05A4012432E4D2E2050415452494D2E
      20524546455208434D20524546455200000000000000405B40064947502D4449
      064947502D444900000000000000005C4013434654202D20412044494152494F
      204F56455207434654202D204100000000000000405C40125245444539392044
      494152494F204F56455208524544453939313100000000000000405E4011554E
      49442E205245462E20524546455220045552524500000000000000C05E401055
      4E49442E205245462E205246465341045552524600000000000000405F400F55
      4E49442E205245462E2043425455045552434200000000000000805F4010554E
      49442E205245462E20464C554D49045552464C00000000000000A06040145661
      72696163616F20506174722E2052464653410756505246465341000000000000
      00C0604012566172696163616F20506174722E43425455065650434254550000
      0000000000E0604013566172696163616F20506174722E464C554D4907565046
      4C554D490000000000000000614013566172696163616F20506174722E524546
      4552075650524546455200000000000000406140135265742E20476172616E20
      434420546F64617308524744454D414953000000000000008061401343742E20
      476172616E7469612044656D616973084354474152414E5400000000000000C0
      61400A434F54412052454645520A434F544120524546455200000000000000E0
      6140134947502D4D20496E76657374696D656E746F73044947504D0000000000
      00000062400E51554F544120434F4E544142494C0851554F544142494C000000
      000000004062400F4947502D4D2070726F6A657461646F094947504D2D50524F
      4A}
  end
  object CdsDadosConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 182
  end
  object SqlDadosConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PLANOME, PLASUBCONTA'
      'FROM'
      '   PLANOCONTA'
      'WHERE'
      '  RTRIM(PLACONTA) = RTRIM(:PLACONTA) AND'
      '  PLANO = :PLANO'
      ' ')
    ClientDataSet = CdsDadosConta
    Left = 378
    Top = 95
  end
  object SQLPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   NVL(ATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   NOME'
      ' '
      ' '
      ' ')
    ClientDataSet = CdsPlanoPrev
    Left = 588
    Top = 135
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 588
    Top = 182
  end
  object SQLProgramaPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPROGRAMA,'
      '   CODPROGRAMA,'
      '   DESCPROGRAMA,'
      '   FLGTIPOPROGRAMA'
      'FROM'
      '   PROGRAMA'
      'ORDER BY'
      '   DESCPROGRAMA'
      ''
      ' ')
    ClientDataSet = CdsProgramaPrev
    Left = 524
    Top = 135
  end
  object CdsProgramaPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 182
  end
  object SQLPatroPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PATRO.IDPESSOA,'
      '   PESSOA.NOME'
      'FROM'
      '   PESSOA,'
      '   PATRO'
      'WHERE'
      '   PESSOA.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.NOME'
      '')
    ClientDataSet = CdsPatroPrev
    Left = 548
    Top = 119
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 484
    Top = 182
  end
  object SQLTipoRD: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES,'
      '   RECPAG,'
      '   PLACONTACREDITO,'
      '   PLANO,'
      '   PLACONTA,'
      '   DESCRICAO,'
      '   ANASINT,'
      '   FLGOBRIGARESERVA,'
      '   FLGCALCULAIMPOSTO,'
      '   HITCODHIST'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   1=2'
      ''
      ''
      ' ')
    ClientDataSet = CdsTipoRD
    Left = 436
    Top = 95
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTipoRDAfterOpen
    Left = 388
    Top = 142
  end
  object CdsAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 282
    Top = 181
  end
  object SqlAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODALTERADOR,'
      '  DESCRICAO,'
      '  ACRESDECRES,'
      '  CONVERTE,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODCENTROCUSTO,'
      '  FLGINCIDEIRRF'
      'FROM'
      '  TIPOALTERADOR'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  DESCRICAO '
      ' ')
    ClientDataSet = CdsAlt
    Left = 282
    Top = 134
  end
  object CdsSubContaForCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 277
  end
  object SqlSubContaForCli: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODSUBCONTA,'
      '   NOMESUBCONTA'
      'FROM '
      '  SUBCONTA')
    ClientDataSet = CdsSubContaForCli
    Left = 330
    Top = 230
  end
  object SqlValida: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PLACONTA'
      'FROM'
      '  TIPORDXCCXCONTA'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND'
      '  IDEMPRESA = :IDEMPRESA AND'
      '  IDPROGRAMA = :IDPROGRAMA')
    ClientDataSet = CdsValida
    Left = 354
    Top = 246
  end
  object CdsValida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 253
  end
  object SqlSubConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODALTERADOR,'
      '  DESCRICAO,'
      '  ACRESDECRES,'
      '  CONVERTE,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODCENTROCUSTO'
      'FROM'
      '  TIPOALTERADOR'
      'WHERE'
      '  RECPAG = :RECPAG  AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  DESCRICAO ')
    ClientDataSet = CdsSubConta
    Left = 484
    Top = 230
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 484
    Top = 277
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CEN.CODEXTERNO,'
      '  CEN.CODCENTRORESPON,'
      '  CEN.NOME,'
      '  CEN.ANALITICOSINTET,'
      '  CEN.CODCENTROCUSTO'
      'FROM'
      '  CENTRESPON CEN,'
      '  PESSOAXCRESP PES'
      'WHERE'
      '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)'
      ' '
      ' ')
    ClientDataSet = CdsCentroRespon
    Left = 506
    Top = 262
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 442
    Top = 269
  end
  object SqlPortForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PF.CODPORTFORMA,'
      '  PF.CODCENTROCUSTO,'
      '  PF.PLANO,'
      '  NVL(PF.PLACONTA, PC.PLACONTA) AS PLACONTA,'
      '  PF.LANCAFINANC,'
      '  PF.DMAIS,'
      '  PF.DESCRICAO,'
      '  PF.CODARQUIVOREMESSA,'
      '  PF.CODFORMAPAGTO,'
      '  PF.CODTIPDOC,'
      '  PF.IDCONFIGBARRAS'
      'FROM  PORTADORFORMA PF, PORTADORCONTA PC'
      'WHERE  PF.IDPESSOA = :IDPESSOA AND'
      '       PF.RECPAG = :RECPAG AND'
      '       NVL( PF.FLGATIVO, '#39'S'#39') = '#39'S'#39' AND'
      '       PF.CODPORTADOR = PC.CODPORTADOR'
      'ORDER BY  DESCRICAO'
      ''
      ' ')
    ClientDataSet = CdsPortForma
    Left = 588
    Top = 230
  end
  object CdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 588
    Top = 277
  end
  object SqlCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  t.CODALTERADOR,'
      '  t.DESCRICAO,'
      '  t.ACRESDECRES,'
      '  t.CONVERTE,'
      '  t.PLANO,'
      '  t.PLACONTA,'
      '  t.CODCENTROCUSTO,'
      '  c.CODEXTERNO, c.nome'
      'FROM'
      '  TIPOALTERADOR t, centcust c'
      'WHERE'
      '  t.RECPAG = '#39'P'#39'  AND'
      '  t.IDPESSOA = 1'
      '  and t.codcentrocusto = c.codcentrocusto'
      'ORDER BY'
      '  c.CODEXTERNO'
      ''
      '')
    ClientDataSet = CdsCCusto
    Left = 532
    Top = 214
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 253
  end
  object SqlAuxTipoRD: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY'
      '   NOME'
      ' ')
    ClientDataSet = CdsAuxTipoRD
    Left = 636
    Top = 135
  end
  object CdsAuxTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 182
  end
  object SqlTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM'
      '('
      'SELECT'
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE,'
      '  FLGENGLOBAPARCELA,'
      '  NVL(FLGGERANUMDOC,'#39'N'#39') as FLGGERANUMDOC, '
      '  NVL(FLGDOCFISCAL, '#39'N'#39') as FLGDOCFISCAL'
      'FROM'
      '  TIPODOCRECPAG A'
      'WHERE'
      '  A.RECPAG = :RECPAG AND'
      '  NOT EXISTS'
      '      (SELECT'
      '         *'
      '       FROM'
      '         USUARIOXTPDOCTO B'
      '       WHERE'
      '          RECPAG = :RECPAG AND'
      '          B.IDUSUARIO = :IDUSUARIO)'
      'UNION'
      'SELECT'
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE,'
      '  FLGENGLOBAPARCELA,'
      '  NVL(FLGGERANUMDOC,'#39'N'#39') as FLGGERANUMDOC, '
      '  NVL(FLGDOCFISCAL, '#39'N'#39') as FLGDOCFISCAL'
      'FROM'
      '   TIPODOCRECPAG A'
      'WHERE'
      '   A.RECPAG = RECPAG AND'
      '   EXISTS'
      '      (SELECT'
      '          *'
      '       FROM'
      '          USUARIOXTPDOCTO B'
      '       WHERE'
      '           RECPAG = :RECPAG AND'
      '           A.CODTIPDOC = B.CODTIPDOC AND'
      '           B.IDUSUARIO = :IDUSUARIO)'
      ')'
      'ORDER BY DESCRICAO'
      ' '
      ' ')
    ClientDataSet = CdsTipoDoc
    Left = 636
    Top = 230
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 277
  end
  object SqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODEXTERNO,'
      '   CODCENTROCUSTO, '
      '   NOME,'
      '   STATUSGRUPOCDC, '
      '   IDPROGRAMA '
      'FROM '
      '   CENTCUST '
      'WHERE '
      '   1=2')
    ClientDataSet = CdsCentroCusto
    Left = 274
    Top = 230
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 277
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsUnidNegocAfterOpen
    Left = 303
    Top = 372
  end
  object SqlUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :IDPESSOA) '
      'AND UNETIPO = '#39'A'#39' '
      'AND ATIVO = '#39'S'#39
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ClientDataSet = CdsUnidNegoc
    Left = 215
    Top = 373
  end
  object SqlFormaPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODFORMA,'
      '   RECPAG,'
      '   DESCRICAO'
      'FROM '
      '   FORMARECPAG '
      'WHERE '
      '   (RECPAG = :RECPAG) AND'
      '   (IDPESSOA = :IDPESSOA)'
      ' ')
    ClientDataSet = CdsFormaPag
    Left = 588
    Top = 326
  end
  object CdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 588
    Top = 373
  end
  object SqlCliAdianto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.NODOCUMENTO,'
      '   D.DATAPROGRAMADA,'
      '   L.VALOR,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L'
      'WHERE'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (D.IDFORCLI = :IDFORCLI) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '   (D.RECPAG = :RECPAG) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      'UNION'
      'SELECT'
      '   D.NODOCUMENTO,'
      '   D.DATAPROGRAMADA,'
      '   L.VALOR,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   CLIENTEPESS C'
      'WHERE'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (C.IDTIPOCLIENTE = :IDTIPOCLIENTE) AND'
      '   (D.IDFORCLI = C.IDPESSOA) AND'
      '   (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '   (D.RECPAG = :RECPAG) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '')
    ClientDataSet = CdsForCliAdianto
    Left = 532
    Top = 326
  end
  object CdsForCliAdianto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 373
  end
  object SqlForneAdianto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.NODOCUMENTO,'
      '   D.DATAPROGRAMADA,'
      '   L.VALOR,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L'
      'WHERE'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (D.IDFORCLI = :IDFORCLI) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '   (D.RECPAG = :RECPAG) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      'UNION'
      'SELECT'
      '    D.NODOCUMENTO,'
      '    D.DATAPROGRAMADA,'
      '    L.VALOR,'
      '    D.OPERACAO'
      'FROM'
      '    DOCUMENTO D,'
      '    PESSOA P,'
      '    LANCTODOCUM L'
      'WHERE'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.IDPESSOA = :IDPESSOA) AND'
      '    (D.IDFORCLI IN'
      '        ('
      '           SELECT'
      '              IDPESSOA'
      '           FROM'
      '              FORNXRAMO'
      '           WHERE'
      '              IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR'
      '        )) AND'
      '     (D.IDFORCLI = P.IDPESSOA) AND'
      '     (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '     (D.RECPAG = :RECPAG) AND'
      '     ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      ''
      ' ')
    ClientDataSet = CdsForCliAdianto
    Left = 436
    Top = 326
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 373
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.NODOCUMENTO,'
      '   D.DATAPROGRAMADA,'
      '   L.VALOR,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L'
      'WHERE'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (D.IDFORCLI = :IDFORCLI) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '   (D.RECPAG = :RECPAG) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      'UNION'
      'SELECT'
      '   D.NODOCUMENTO,'
      '   D.DATAPROGRAMADA,'
      '   L.VALOR,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   CLIENTEPESS C'
      'WHERE'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (C.IDTIPOCLIENTE = :IDTIPOCLIENTE) AND'
      '   (D.IDFORCLI = C.IDPESSOA) AND'
      '   (D.OPERACAO IN ('#39'11'#39','#39'12'#39','#39'13'#39','#39'15'#39')) AND'
      '   (D.RECPAG = :RECPAG) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '')
    ClientDataSet = CdsAux
    Left = 436
    Top = 326
  end
  object sqlGrupoRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPORATEIO, IDMODULO, GRRDESCRICAO'
      'FROM'
      '   GRUPORATEIO'
      'WHERE'
      '   IDMODULO = 3'
      'ORDER BY'
      '   GRRDESCRICAO')
    ClientDataSet = cdsGrupoRateio
    Left = 120
    Top = 64
  end
  object cdsGrupoRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 68
    object CdsGRRDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Rateio'
      DisplayWidth = 60
      FieldName = 'GRRDESCRICAO'
      Size = 60
    end
    object CdsIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
      Visible = False
    end
    object CdsIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object cdsPadraoRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 56
  end
  object cdsVerificaRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 64
  end
  object sqlCCBaixasXDocum: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PT.NOME AS PATROCINADORA, PL.NOME AS PLANPREVCONTABIL, S.DESCR' +
        'ICAO AS SEGREGACRITER,'
      '  CC.PLACONTA, CC.VALOR,'
      
        '  CC.IDPATRO, CC.IDPLANOPREV, CC.IDSEGREGACRITER, CC.PLANO, CC.U' +
        'NIDNEGOC, CC.IDPESSOA'
      'FROM'
      '  CCBAIXASXDOCUM CC, PESSOA PT, PATRO PA, PLANPREVCONTABIL PL,'
      '  SEGREGACRITER S'
      'WHERE'
      '  CC.CODDOCUMENTO = :CODDOCUMENTO'
      '  AND ( CC.IDPATRO = PA.IDPESSOA )'
      '  AND ( PA.IDPESSOA = PT.IDPESSOA )'
      '  AND ( CC.IDPLANOPREV = PL.IDPLANOPREV )'
      '  AND ( CC.IDSEGREGACRITER = S.IDSEGREGACRITER(+) )'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsCCBaixasXDocum
    Left = 27
    Top = 279
  end
  object CdsCCBaixasXDocum: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAfterOpen
    Left = 144
    Top = 294
  end
  object dsCCBaixasXDocum: TwwDataSource
    AutoEdit = False
    DataSet = CdsCCBaixasXDocum
    Left = 29
    Top = 374
  end
  object SqlProcessoRad: TCMSqlParams
    SQL.Strings = (
      'select * '
      'from RADINSTPROCESSO '
      'where IDPROCESSO = :IDPROCESSO ')
    ClientDataSet = CdsProcessoRad
    Left = 691
    Top = 379
  end
  object CdsProcessoRad: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 379
  end
  object SqlRAD: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDPROCESSO, '
      
        '  DECODE(FLGOK, '#39'N'#39', '#39'PENDENTE'#39', '#39'S'#39', '#39'AUTORIZADO'#39', '#39'E'#39', '#39'EXCLUÍ' +
        'DO'#39', '#39'R'#39', '#39'RECUSADO'#39') AS STATUS '
      'FROM RADINSTPROCESSO '
      'WHERE IDPROCESSO = :idprocesso')
    ClientDataSet = cdsRAD
    Left = 696
    Top = 319
  end
  object cdsRAD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 730
    Top = 319
  end
  object DsRAD: TwwDataSource
    DataSet = cdsRAD
    Left = 712
    Top = 279
  end
  object sqlContaBancaria: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCBANCARIA'
      'FROM CONTABANCARIA'
      'WHERE IDPESSOA = :IDFORCLI AND'
      '      FLGCONTAPREF = 1'
      ' ')
    ClientDataSet = cdsContaBancaria
    Left = 169
    Top = 319
  end
  object cdsContaBancaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 73
    Top = 319
  end
end
