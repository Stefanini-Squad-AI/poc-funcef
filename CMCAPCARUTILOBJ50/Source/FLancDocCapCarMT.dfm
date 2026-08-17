inherited frmLancDocCAPCAR: TfrmLancDocCAPCAR
  Left = 445
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Lançamento de Documentos'
  ClientHeight = 557
  ClientWidth = 944
  OnDestroy = FormDestroy
  OnPaint = cbEnglobParcClick
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 944
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
    Width = 944
    Height = 471
    inherited pnlMestre: TPanel
      Width = 1014
      Height = 220
      Align = alNone
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 1
      Width = 942
      Height = 469
      Tabs.Strings = (
        'Dados Para o Lançamento'
        'Rateio'
        'Contabilização'
        'Lançamentos'
        'Alteradores'
        'Geral'
        'Vinculação'
        'Nota Fiscal'
        'Informações Judiciais'
        'Contas Baixa')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        ''
        'GrdAlteradores'
        ''
        ''
        ''
        '')
      inherited Dock973: TDock97 [0]
        Width = 934
        object Bevel3: TBevel [0]
          Left = 533
          Top = 1
          Width = 2
          Height = 50
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 24
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 49
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 848
        Height = 410
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
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 844
        Height = 410
        ActivePage = TbsDadosLanc
        HotTrack = True
        object TbsDadosLanc: TTabSheet [0]
          Caption = 'Dados Para o Lançamento'
          object PnlDados: TPanel
            Left = 0
            Top = 0
            Width = 836
            Height = 382
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel2: TBevel
              Left = 13
              Top = 243
              Width = 572
              Height = 41
              Shape = bsFrame
            end
            object lblHistorico: TLabel
              Left = 13
              Top = 140
              Width = 142
              Height = 13
              Caption = 'Histórico do Lançamento'
            end
            object Label10: TLabel
              Left = 60
              Top = 247
              Width = 190
              Height = 13
              Caption = 'Usuário que lançou o Documento'
            end
            object DBText3: TDBText
              Left = 60
              Top = 264
              Width = 243
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
              Left = 328
              Top = 264
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
              Left = 328
              Top = 248
              Width = 220
              Height = 13
              Caption = 'Sistema que originou este lançamento:'
            end
            object Image1: TImage
              Left = 20
              Top = 237
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
            object btnInsereAlteradores: TToolbarButton97
              Left = 12
              Top = 287
              Width = 169
              Height = 29
              Caption = 'Inserir Alteradores ...'
              Enabled = False
              OnClick = btnInsereAlteradoresClick
            end
            object dbeHistorico: TwwDBEdit
              Left = 13
              Top = 156
              Width = 571
              Height = 21
              DataField = 'HISTORICOCOMPL'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object gbDatas: TGroupBox
              Left = 596
              Top = 1
              Width = 135
              Height = 283
              Caption = ' Datas '
              TabOrder = 0
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
                DisplayFormat = 'DD/MM/YYYY'
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
                DisplayFormat = 'DD/MM/YYYY'
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
                DisplayFormat = 'DD/MM/YYYY'
                OnChange = dbeDataVencChange
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
                DisplayFormat = 'DD/MM/YYYY'
                OnChange = dbeDataProgrChange
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
                DisplayFormat = 'DD/MM/YYYY'
                Visible = False
              end
            end
            object gbOutros: TGroupBox
              Left = 13
              Top = 181
              Width = 572
              Height = 64
              TabOrder = 1
              object PnlOpcao: TPanel
                Left = 2
                Top = 6
                Width = 566
                Height = 53
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 5
                Visible = False
              end
              object cbEnglobParc: TCheckBox
                Left = 8
                Top = 10
                Width = 297
                Height = 17
                Caption = 'Este documento será parcelado ou englobado'
                TabOrder = 0
                OnClick = cbEnglobParcClick
              end
              object cbLancaBaixa: TCheckBox
                Left = 8
                Top = 27
                Width = 297
                Height = 17
                Caption = 'Lança e Baixa este documento simultaneamente'
                TabOrder = 1
                OnClick = cbLancaBaixaClick
              end
              object cbIntegra: TCheckBox
                Left = 318
                Top = 9
                Width = 234
                Height = 17
                Caption = 'Não integrar com a contabilidade'
                TabOrder = 2
              end
              object DBCheckBox1: TDBCheckBox
                Left = 318
                Top = 26
                Width = 211
                Height = 17
                Caption = 'Conta de Investimento'
                DataField = 'FLGCONTAINVEST'
                DataSource = ds
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkFlgEspecial: TDBCheckBox
                Left = 318
                Top = 43
                Width = 212
                Height = 17
                Caption = 'Empresa em Situação Especial'
                DataField = 'FLGESPECIAL'
                DataSource = ds
                TabOrder = 4
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
            end
            object PnlLancPrin: TPanel
              Left = 3
              Top = 2
              Width = 586
              Height = 137
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 2
              object Label7: TLabel
                Left = 355
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
                Left = 10
                Top = 96
                Width = 112
                Height = 13
                Caption = 'Tipo de Documento'
              end
              object Bevel1: TBevel
                Left = 378
                Top = 6
                Width = 206
                Height = 44
                Shape = bsFrame
              end
              object lblValor: TLabel
                Left = 339
                Top = 54
                Width = 124
                Height = 13
                Caption = 'Valor Moeda Corrente'
              end
              object lblValorMoeda: TLabel
                Left = 223
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
                Left = 223
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
                TabOrder = 9
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
                OnChange = CmpForCliChange
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
                TabOrder = 2
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
                Width = 206
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'10'#9'MOESIGLA')
                DataField = 'MOECODIGO'
                DataSource = ds
                LookupTable = CdsMoeda
                LookupField = 'MOECODIGO'
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnExit = dblcMoedaExit
              end
              object dbeValorMoeda: TDBRealEdit
                Left = 223
                Top = 69
                Width = 108
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 4
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
                Left = 337
                Top = 69
                Width = 126
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 5
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
                Width = 206
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
                TabOrder = 6
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
                Left = 223
                Top = 110
                Width = 241
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
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbenChBordero: TDBRealEdit
                Left = 470
                Top = 112
                Width = 112
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 8
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
            Top = 58
            Width = 836
            Height = 324
            Selected.Strings = (
              'NOME'#9'10'#9'Atividade/Projeto'#9'F'
              'CODEXTERNOCR'#9'10'#9'Cod. Cent. Respon.'#9'F'
              'NOME_1'#9'10'#9'Cent. Respon.'#9'F'
              'DESCRICAO'#9'10'#9'Receb/Desemb'#9'F'
              'CODEXTERNOCC'#9'10'#9'Cód. Cent. de Custo'#9'F'
              'NOMECENTROCUSTO'#9'10'#9'Nome Cent. Custo'#9'F'
              'IDRESERVAORCAMEN'#9'10'#9'Comp. Orcamen.'#9'F'
              'SUBDESPESA'#9'40'#9'Sub-Despesa'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'DESCPLANO'#9'50'#9'Plano Financeiro'#9'F'
              'NOMEPATRO'#9'60'#9'Patrocinadora Financeiro'#9'F'
              'DESCPLANOORIGEM'#9'50'#9'Plano Origem'#9'F'
              'NOMEPATROORIGEM'#9'60'#9'Patrocinadora Origem'#9'F'
              'DESCPROGRAMA'#9'60'#9'Programa'#9'F')
            KeyOptions = []
            ReadOnly = True
          end
          object pnlrateio: TPanel [1]
            Left = 0
            Top = 0
            Width = 836
            Height = 58
            Align = alTop
            TabOrder = 2
            object Label26: TLabel
              Left = 171
              Top = 8
              Width = 79
              Height = 13
              Caption = 'Centro Resp.:'
            end
            object sbtnSelArquivo: TToolbarButton97
              Left = 728
              Top = 31
              Width = 30
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Flat = False
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
                840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
                FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
                FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
                FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
                8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
                0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
                FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
                FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              ImageIndex = 3
              Layout = blGlyphTop
              Spacing = 0
              OnClick = sbtnSelArquivoClick
            end
            object rbFDO: TRadioButton
              Left = 5
              Top = 6
              Width = 47
              Height = 17
              Caption = 'FDO'
              TabOrder = 0
              OnClick = rbFDOClick
            end
            object edNumFDO: TEdit
              Left = 52
              Top = 4
              Width = 106
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 1
              OnKeyPress = edNumFDOKeyPress
            end
            object dblkCResponsa: TwwDBLookupCombo
              Left = 248
              Top = 4
              Width = 198
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'ANALITICOSINTET'#9'1'#9'T'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTRORESPON'
              LookupTable = CdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              Enabled = False
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
            object rbRateioPre: TRadioButton
              Left = 464
              Top = 6
              Width = 132
              Height = 17
              Caption = 'Rateio Pré-definido:'
              TabOrder = 3
              OnClick = rbRateioPreClick
            end
            object DBcboGrupoRateio: TwwDBLookupCombo
              Left = 593
              Top = 4
              Width = 166
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'GRRDESCRICAO'#9'60'#9'Grupo de Rateio'#9'F')
              LookupTable = cdsGrupoRateio
              LookupField = 'IDGRUPORATEIO'
              DropDownWidth = 8
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = DBcboGrupoRateioExit
            end
            object edtArquivo: TEdit
              Left = 93
              Top = 34
              Width = 628
              Height = 21
              ReadOnly = True
              TabOrder = 5
            end
            object rbPLANILHA: TRadioButton
              Left = 5
              Top = 35
              Width = 85
              Height = 17
              Caption = 'PLANILHA'
              TabOrder = 6
              OnClick = rbPLANILHAClick
            end
            object btnGrupoRateio: TBitBtn
              Left = 762
              Top = 14
              Width = 100
              Height = 37
              Caption = 'Inserir Rateio'
              TabOrder = 7
              OnClick = btnGrupoRateioClick
            end
          end
          inherited pnlControlesDet: TPanel [2]
            Top = 58
            Width = 836
            Height = 324
            object PnlRateioGeral: TPanel
              Left = 0
              Top = 0
              Width = 836
              Height = 324
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object lblUnidNegoc: TLabel
                Left = 16
                Top = 8
                Width = 104
                Height = 13
                Caption = 'Atividade/Projeto:'
              end
              object lblCentroRespon: TLabel
                Left = 16
                Top = 47
                Width = 107
                Height = 13
                Caption = 'Centro de Respon.'
              end
              object lblTipoRD: TLabel
                Left = 16
                Top = 85
                Width = 116
                Height = 13
                Caption = 'Tipo de Desembolso'
              end
              object Label6: TLabel
                Left = 16
                Top = 123
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object lblMoedaDet: TLabel
                Left = 352
                Top = 8
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object lblValorOutDet: TLabel
                Left = 352
                Top = 47
                Width = 107
                Height = 13
                Caption = 'Valor Outra Moeda'
              end
              object lblValorDet: TLabel
                Left = 352
                Top = 85
                Width = 124
                Height = 13
                Caption = 'Valor Moeda Corrente'
              end
              object Label11: TLabel
                Left = 352
                Top = 162
                Width = 161
                Height = 13
                Caption = 'Plano Previdenciário Origem'
              end
              object Label12: TLabel
                Left = 352
                Top = 123
                Width = 123
                Height = 13
                Caption = 'Patrocinadora Origem'
              end
              object Label16: TLabel
                Left = 648
                Top = 176
                Width = 38
                Height = 13
                Caption = 'Imóvel'
                Enabled = False
                Visible = False
              end
              object lbl1: TLabel
                Left = 16
                Top = 200
                Width = 143
                Height = 13
                Caption = 'Patrocinadora Financeira'
              end
              object lbl2: TLabel
                Left = 352
                Top = 200
                Width = 181
                Height = 13
                Caption = 'Plano Previdenciário Financeiro'
              end
              object dbtxtNOMEPATRO: TDBText
                Left = 18
                Top = 216
                Width = 107
                Height = 13
                AutoSize = True
                DataField = 'NOMEPATRO'
                DataSource = dsDet
              end
              object dbtxtDESCPLANO: TDBText
                Left = 352
                Top = 216
                Width = 103
                Height = 13
                AutoSize = True
                DataField = 'DESCPLANO'
                DataSource = dsDet
              end
              object Label23: TLabel
                Left = 352
                Top = 231
                Width = 113
                Height = 13
                Caption = 'Sub-Despesa (FDO)'
              end
              object dblcUnidNegoc: TwwDBLookupCombo
                Left = 16
                Top = 22
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
                TabOrder = 0
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
                Top = 61
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
                TabOrder = 1
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
                Top = 99
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
                TabOrder = 2
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
                Top = 137
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
                TabOrder = 3
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
                Left = 512
                Top = 8
                Width = 161
                Height = 44
                BevelOuter = bvNone
                TabOrder = 6
                Visible = False
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
                Top = 158
                Width = 297
                Height = 41
                BevelOuter = bvNone
                TabOrder = 4
                object Label13: TLabel
                  Left = 8
                  Top = 2
                  Width = 54
                  Height = 13
                  Caption = 'Programa'
                end
                object CmbPrograma: TCMDBLookupCombo
                  Left = 8
                  Top = 18
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
                Top = 22
                Width = 145
                Height = 21
                Enabled = False
                TabOrder = 7
                Text = 'edMoedaDet'
              end
              object dbeValorMoedaDet: TRealEdit
                Left = 352
                Top = 61
                Width = 145
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 8
                WordWrap = False
                OnExit = dbeValorMoedaDetExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
              object dbeValorDet: TRealEdit
                Left = 352
                Top = 99
                Width = 145
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                ParentShowHint = False
                ShowHint = False
                TabOrder = 9
                WordWrap = False
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
              object EdtImovel: TwwDBEdit
                Left = 648
                Top = 190
                Width = 121
                Height = 21
                DataField = 'NUMIMOVEL'
                DataSource = dsDet
                Enabled = False
                TabOrder = 12
                UnboundDataType = wwDefault
                Visible = False
                WantReturns = False
                WordWrap = False
              end
              object CmbPlano: TCMDBLookupCombo
                Left = 352
                Top = 177
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Plano Previdenciário')
                DataField = 'IDPLANOORIGEM'
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
                Top = 137
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome')
                DataField = 'IDPATROORIGEM'
                DataSource = dsDet
                LookupTable = CdsPatroPrev
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 10
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = CmbPatroCloseUp
                OnExit = CmbPatroExit
              end
              object CboSubDespesa: TCMDBLookupCombo
                Left = 352
                Top = 247
                Width = 278
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCSUBDESPESA'#9'15'#9'Sub-Despesa'#9'F')
                DataField = 'IDDESPESAORC'
                DataSource = dsDet
                LookupTable = cdsSubDespesaRateio
                LookupField = 'IDDESPESAORC'
                Options = [loColLines, loRowLines, loTitles]
                Style = csDropDownList
                DropDownCount = 10
                DropDownWidth = 610
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
          object pnlResultado: TPanel
            Left = 0
            Top = 58
            Width = 836
            Height = 324
            Align = alClient
            TabOrder = 3
            object Panel2: TPanel
              Left = 128
              Top = 24
              Width = 185
              Height = 41
              Caption = 'Panel2'
              TabOrder = 0
            end
            object pnlMensagem: TPanel
              Left = 1
              Top = 1
              Width = 834
              Height = 322
              Align = alClient
              TabOrder = 1
              object memResultado: TMemo
                Left = 1
                Top = 1
                Width = 832
                Height = 128
                Align = alTop
                TabOrder = 0
              end
              object dbgrdRateio: TwwDBGrid
                Left = 1
                Top = 160
                Width = 832
                Height = 161
                ControlType.Strings = (
                  'FLGCENTRORESPON;CheckBox;S;N'
                  'FLGTIPODESEMBOLSO;CheckBox;S;N'
                  'FLGCENTROCUSTO;CheckBox;S;N')
                Selected.Strings = (
                  'UNIDNEGOCIO'#9'30'#9'Atividade'#9'F'
                  'CODCENTRORESPON'#9'10'#9'Cod. Cent. Respon.'#9'F'
                  'CENTRORESPON'#9'10'#9'Cent. Respon.'#9'F'
                  'TIPODESEMBOLSO'#9'10'#9'Receb/Desemb'#9'F'
                  'CODCENTROCUSTO'#9'10'#9'Cód. Cent. de Custo'#9'F'
                  'CENTROCUSTO'#9'10'#9'Nome Cent. Custo'#9'F'
                  'VALORFDO'#9'10'#9'Valor'#9'F'
                  'PATRO'#9'60'#9'Patrocinadora Financeiro'#9'F'
                  'PLANPREV'#9'50'#9'Plano Origem'#9'F'
                  'PATRO'#9'60'#9'Patrocinadora Origem'#9'F'
                  'DESCPROGRAMA'#9'60'#9'Programa'#9'F'
                  'IDRESERVAORCAMEN'#9'10'#9'Comp. Orcamen.'#9'F'
                  'SUBDESPESA'#9'40'#9'Sub-Despesa'#9'F'
                  'DESCPLANO'#9'50'#9'Plano Financeiro'#9'F'
                  'FLGCENTRORESPON'#9'1'#9'C.Responsab. OK ?'
                  'FLGTIPODESEMBOLSO'#9'1'#9'Tp.Desembolso OK ?'
                  'FLGCENTROCUSTO'#9'1'#9'C.Custo OK ?')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsPadraoRateio
                KeyOptions = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
              object pnlCorrecaoRateio: TPanel
                Left = 1
                Top = 160
                Width = 832
                Height = 161
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                Visible = False
                object Label27: TLabel
                  Left = 16
                  Top = 8
                  Width = 104
                  Height = 13
                  Caption = 'Atividade/Projeto:'
                end
                object Label33: TLabel
                  Left = 16
                  Top = 47
                  Width = 107
                  Height = 13
                  Caption = 'Centro de Respon.'
                end
                object Label34: TLabel
                  Left = 16
                  Top = 85
                  Width = 116
                  Height = 13
                  Caption = 'Tipo de Desembolso'
                end
                object Label35: TLabel
                  Left = 16
                  Top = 123
                  Width = 92
                  Height = 13
                  Caption = 'Centro de Custo'
                end
                object Label38: TLabel
                  Left = 352
                  Top = 45
                  Width = 124
                  Height = 13
                  Caption = 'Valor Moeda Corrente'
                end
                object Label39: TLabel
                  Left = 352
                  Top = 122
                  Width = 161
                  Height = 13
                  Caption = 'Plano Previdenciário Origem'
                end
                object Label40: TLabel
                  Left = 352
                  Top = 83
                  Width = 123
                  Height = 13
                  Caption = 'Patrocinadora Origem'
                end
                object dblcUnidNegPlanilha: TwwDBLookupCombo
                  Left = 16
                  Top = 22
                  Width = 278
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Descrição'
                    'UNETIPO'#9'1'#9'T'
                    'UNECODIGO'#9'10'#9'Código')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsUnidNegoc
                  LookupField = 'UNIDNEGOC'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblcUnidNegPlanilhaCloseUp
                  OnExit = dblcUnidNegPlanilhaExit
                end
                object dblcCentroRespPlanilha: TwwDBLookupCombo
                  Left = 16
                  Top = 61
                  Width = 278
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Descrição'
                    'ANALITICOSINTET'#9'1'#9'T'
                    'CODEXTERNO'#9'10'#9'Código'#9'F')
                  DataField = 'CODCENTRORESPON'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsCentroRespon
                  LookupField = 'CODCENTRORESPON'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblcCentroRespPlanilhaCloseUp
                  OnExit = dblcCentroRespPlanilhaExit
                end
                object dblcTipoRDPlanilha: TwwDBLookupCombo
                  Left = 16
                  Top = 99
                  Width = 278
                  Height = 21
                  DropDownAlignment = taRightJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'Descrição'
                    'CODTIPRECDES'#9'15'#9'Código')
                  DataField = 'CODTIPRECDES'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsTipoRD
                  LookupField = 'CODTIPRECDES'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  Enabled = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblcTipoRDPlanilhaCloseUp
                  OnExit = dblcTipoRDPlanilhaExit
                end
                object cmdCCustoPlanilha: TwwDBLookupCombo
                  Left = 16
                  Top = 137
                  Width = 278
                  Height = 21
                  DropDownAlignment = taRightJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Descrição'
                    'CODEXTERNO'#9'10'#9'Código'#9'F'
                    'STATUSGRUPOCDC'#9'1'#9'A/S')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsCentroCusto
                  LookupField = 'CODCENTROCUSTO'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = cmdCCustoPlanilhaCloseUp
                  OnExit = CmbCentCustoExit
                end
                object Panel4: TPanel
                  Left = 346
                  Top = 3
                  Width = 297
                  Height = 41
                  BevelOuter = bvNone
                  TabOrder = 4
                  object Label46: TLabel
                    Left = 8
                    Top = 2
                    Width = 54
                    Height = 13
                    Caption = 'Programa'
                  end
                  object cmdProgPlanilha: TCMDBLookupCombo
                    Left = 8
                    Top = 18
                    Width = 278
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCPROGRAMA'#9'60'#9'Descrição'
                      'CODPROGRAMA'#9'2'#9'Código')
                    DataField = 'IDPROGRAMA'
                    DataSource = dsPadraoRateio
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
                    OnCloseUp = cmdProgPlanilhaCloseUp
                    OnExit = cmdProgPlanilhaExit
                  end
                end
                object dbeValorPlanilha: TRealEdit
                  Left = 352
                  Top = 61
                  Width = 145
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 5
                  WordWrap = False
                  OnExit = dbeValorPlanilhaExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object cmdPlanoPlanilha: TCMDBLookupCombo
                  Left = 354
                  Top = 137
                  Width = 278
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Plano Previdenciário')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = cmdPlanoPlanilhaCloseUp
                  OnExit = cmdPlanoPlanilhaExit
                end
                object cmdPatroPlanilha: TCMDBLookupCombo
                  Left = 354
                  Top = 97
                  Width = 278
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Nome')
                  DataField = 'IDPATRO'
                  DataSource = dsPadraoRateio
                  LookupTable = CdsPatroPrev
                  LookupField = 'IDPESSOA'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = cmdPatroPlanilhaCloseUp
                  OnExit = CmbPatroExit
                end
                object Dock976: TDock97
                  Left = 742
                  Top = 0
                  Width = 90
                  Height = 161
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  object Toolbar973: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object bbtnOkPadrao: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 85
                      Height = 26
                      Caption = 'OK'
                      TabOrder = 0
                      OnClick = bbtnOkPadraoClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                        88888887788888778F88887222222222088888788888888878F887A228822222
                        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                    end
                    object bbtnCancelarPadrao: TBitBtn
                      Tag = 9999
                      Left = 0
                      Top = 26
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      TabOrder = 1
                      OnClick = bbtnCancelarPadraoClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                        88888887788888778F88887991919191088888788888888878F8879919191919
                        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                        190878F877787778887887917F919F71908887F88788878887F8879919191919
                        1088878F88888888878888799191919108888878FF88888F7888888779999977
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                      Spacing = -1
                    end
                    object bbtnVoltarPadrao: TBitBtn
                      Tag = 9999
                      Left = 0
                      Top = 53
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      TabOrder = 2
                      OnClick = bbtnVoltarPadraoClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000010000000000000000000
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
                    end
                  end
                end
              end
              object Dock975: TDock97
                Left = 1
                Top = 129
                Width = 832
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Bevel4: TBevel
                  Left = 533
                  Top = 1
                  Width = 2
                  Height = 50
                end
                object Label36: TLabel
                  Left = 89
                  Top = 9
                  Width = 146
                  Height = 13
                  Caption = 'Total Planilha de Rateio :'
                end
                object lblTotal: TLabel
                  Left = 237
                  Top = 10
                  Width = 8
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object sbtnAltPadrao: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 24
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnAltPadraoClick
                  end
                  object sbtnExcluiPadrao: TToolbarButton97
                    Left = 49
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnExcluiPadraoClick
                  end
                  object sbtnIncPadrao: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnIncPadraoClick
                  end
                end
              end
            end
          end
        end
        object tbsContabil: TTabSheet
          Caption = 'Contabilização'
          object pnlContabil: TPanel
            Left = 0
            Top = 0
            Width = 836
            Height = 382
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
          end
          object dbgrdContabil: TwwDBGrid
            Left = 0
            Top = 0
            Width = 836
            Height = 382
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
            Width = 839
            Height = 346
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
              'CODALTERADOR'#9'10'#9'Alterador'
              'NOME'#9'40'#9'Nome'#9'F'
              'TRGDTINCLUSAO'#9'18'#9'Data de Inclusão')
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
            Width = 836
            Height = 382
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
              'FLGINCIDEIRRF'#9'1'#9'Incide IRRF?'
              'TIPOSERVICO'#9'30'#9'Tipo de serviço associado'
              'VALORBASERETENCAO'#9'10'#9'Valor base de retenção'
              'NUMPROCESSO'#9'26'#9'Processo de não rentenção')
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
            Width = 836
            Height = 382
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblAlterador: TLabel
              Left = 15
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
              Left = 15
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
              Top = 137
              Width = 169
              Height = 13
              Caption = 'Observação sobre o alterador'
            end
            object Label24: TLabel
              Left = 15
              Top = 291
              Width = 165
              Height = 13
              Caption = 'Desembolso do Rateio (FDO)'
            end
            object lblTipoServico: TLabel
              Left = 15
              Top = 244
              Width = 91
              Height = 13
              Caption = 'Tipo de Serviço'
            end
            object lblProcessos: TLabel
              Left = 424
              Top = 244
              Width = 220
              Height = 13
              Caption = 'Processo de Suspensão de Tributação'
            end
            object lblValorBaseRetencao: TLabel
              Left = 272
              Top = 244
              Width = 121
              Height = 13
              Caption = 'Valor Base Retenção'
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
              Left = 15
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
              Left = 15
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
              Left = 15
              Top = 112
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
              Left = 15
              Top = 154
              Width = 633
              Height = 79
              Color = clScrollBar
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 8
            end
            object cboAlteradoresDescRateio: TwwDBLookupCombo
              Left = 15
              Top = 307
              Width = 632
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESC_RATEIO_ORCAMENTO'#9'15'#9'Rateio'#9'F')
              DataField = 'IDRATEIO_ORCAMENTO'
              DataSource = DsAlteradores
              LookupField = 'IDRATEIO_ORCAMENTO'
              DropDownWidth = 550
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbLkpCbTipoServico: TwwDBLookupCombo
              Left = 15
              Top = 259
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'70'#9'DESCRICAO'#9'F')
              DataField = 'IDTIPOSERVICO'
              DataSource = DsAlteradores
              LookupTable = cdsTipoServico
              LookupField = 'IDTIPOSERVICO'
              TabOrder = 9
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dbLkpCbTipoServicoCloseUp
            end
            object dbLkpCbProcCPRB: TwwDBLookupCombo
              Left = 424
              Top = 259
              Width = 220
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NUMERO'#9'30'#9'NUMERO'#9'F')
              DataField = 'IDPROCESSO'
              DataSource = DsAlteradores
              LookupTable = cdsProcessos
              LookupField = 'IDPROCESSO'
              TabOrder = 11
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dbLkpCbProcCPRBCloseUp
            end
            object edtValorBaseRetencao: TDBRealEdit
              Left = 272
              Top = 259
              Width = 142
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORBASERETENCAO'
              DataSource = DsAlteradores
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
              TabOrder = 0
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
              TabOrder = 1
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
            Left = 7
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
            Top = 4
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
          object gbBoleto: TGroupBox
            Left = 8
            Top = 267
            Width = 286
            Height = 59
            Caption = ' Boletos '
            TabOrder = 6
            Visible = False
            object Label25: TLabel
              Left = 9
              Top = 17
              Width = 83
              Height = 13
              Caption = 'Nosso Número'
            end
            object DbeNossoNo: TwwDBEdit
              Left = 9
              Top = 31
              Width = 169
              Height = 21
              Hint = 'Preencher sem o uso do hífen e dígito verificador'
              DataField = 'NOSSONUMERO'
              DataSource = ds
              MaxLength = 17
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = DbeBarrasExit
              OnKeyPress = DbeNossoNoKeyPress
            end
            object pnlSituacao: TPanel
              Left = 184
              Top = 22
              Width = 95
              Height = 30
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              Visible = False
              object btnBolSit: TToolbarButton97
                Left = 2
                Top = 4
                Width = 91
                Height = 24
                AllowAllUp = True
                GroupIndex = 1
                Caption = ' lblStatus'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                  33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                  8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                  F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                  F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                  0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                  B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                  B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                  333333333777733333333333FBFBFB3333333333333333333333}
                ImageIndex = 4
                Images = imgLista
                Opaque = False
                Spacing = 0
                OnClick = sbtnProcurarClick
              end
            end
          end
        end
        object tbsVinculacao: TTabSheet
          Caption = 'Vinculação'
          ImageIndex = 7
          object dbgVinculacao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 836
            Height = 382
            Selected.Strings = (
              'VINCULO'#9'6'#9'Vínculo'
              'NODOCUMENTO'#9'12'#9'Nº Documento'
              'NOME'#9'60'#9'Cliente/Fornecedor'
              'VALOR'#9'12'#9'Valor'
              'DATAVENCTO'#9'10'#9'Vencimento'
              'DATAEMISSAO'#9'10'#9'Emissao'
              'DATAPROGRAMADA'#9'11'#9'Dt.Programada'
              'OPERACAO'#9'7'#9'Status Doc.'
              'RECPAG'#9'15'#9'Pagar/Receber')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDocPai
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
        object tbsNotaFiscal: TTabSheet
          Caption = 'Nota Fiscal'
          ImageIndex = 8
          object Label28: TLabel
            Left = 8
            Top = 90
            Width = 98
            Height = 13
            Caption = 'Núm. Nota Fiscal'
          end
          object Label29: TLabel
            Left = 320
            Top = 90
            Width = 81
            Height = 13
            Caption = 'Núm. de Série'
          end
          object Label30: TLabel
            Left = 10
            Top = 134
            Width = 64
            Height = 13
            Caption = 'Valor Bruto'
          end
          object Label31: TLabel
            Left = 164
            Top = 134
            Width = 96
            Height = 13
            Caption = 'Data de Emissão'
          end
          object Label32: TLabel
            Left = 8
            Top = 233
            Width = 99
            Height = 13
            Caption = 'Dados Adicionais'
          end
          object lblAtivProdServ: TLabel
            Left = 8
            Top = 181
            Width = 241
            Height = 13
            Caption = 'Atividade, Produto ou Serviço relacionado'
          end
          object dbEdtNotaFiscal: TwwDBEdit
            Left = 8
            Top = 104
            Width = 269
            Height = 21
            DataField = 'NFSNUMERO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbEdtNumSerie: TwwDBEdit
            Left = 322
            Top = 104
            Width = 121
            Height = 21
            DataField = 'NFSSERIE'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDtpDataEmissao: TCMDateTimePicker
            Left = 164
            Top = 152
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'NFSDATAEMISSAO'
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
          end
          object dbMmDadosAdicoinaisNfs: TDBMemo
            Left = 8
            Top = 250
            Width = 589
            Height = 89
            DataField = 'NFSOBS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 3
            WantTabs = True
          end
          object edtValorBruto: TRealEdit
            Left = 8
            Top = 152
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cmProcListaServicos: TCMProcura
            Left = 8
            Top = 198
            Width = 593
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MostraMensagens = True
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            OnValidaDados = cmProcListaServicosValidaDados
            DataSource = ds
            DataField = 'NFSSERVICO'
            LookupChave = 'IDSERVICO'
            LookupDescricao = 'NOME'
            MontaSelect = msListaServico
            LookupTabela = 'LISTA_SERVICOS'
            DataBaseName = 'BASEDADOS'
            ReadOnly = True
          end
          object btnAddAlteradores: TBitBtn
            Left = 619
            Top = 198
            Width = 145
            Height = 27
            Caption = 'Adicionar tributação'
            TabOrder = 6
            Visible = False
            OnClick = btnAddAlteradoresClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
              333333333337FF3333333333330003333333333333777F333333333333080333
              3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
              33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
              B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
              BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
              B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
              3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
              333333333337F33333333333333B333333333333333733333333}
            NumGlyphs = 2
          end
          object rgTipoNF: TRadioGroup
            Left = 10
            Top = 12
            Width = 270
            Height = 38
            Caption = 'Tipo de Nota Fiscal'
            Columns = 2
            Items.Strings = (
              'Compra/Aquisição'
              'Serviço')
            TabOrder = 7
            OnClick = rgTipoNFClick
          end
          object dbchkFlgSimples: TDBCheckBox
            Left = 8
            Top = 61
            Width = 401
            Height = 17
            Caption = 'Empresa isenta de tributação ou optante pelo Simples Nacional'
            DataField = 'FLGSIMPLES'
            DataSource = ds
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object TbsInfoJudicial: TTabSheet
          Caption = 'Informações Judiciais'
          ImageIndex = 9
          object lblParteContraria: TLabel
            Left = 20
            Top = 100
            Width = 86
            Height = 13
            Caption = 'Parte Contrária'
          end
          object lblCodDossie: TLabel
            Left = 25
            Top = 10
            Width = 69
            Height = 13
            Caption = 'Cód. Dossiê'
          end
          object lblNumeroProcesso: TLabel
            Left = 149
            Top = 10
            Width = 165
            Height = 13
            Caption = 'Número do Processo Judicial'
          end
          object dbecontraParte: TwwDBEdit
            Left = 21
            Top = 115
            Width = 372
            Height = 21
            DataField = 'PARTECONTRARIA'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = DbeBarrasExit
          end
          object dbedtCodDossie: TwwDBEdit
            Left = 22
            Top = 24
            Width = 122
            Height = 21
            DataField = 'CODDOSSIE'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = DbeBarrasExit
          end
          object rgFuncef: TRadioGroup
            Left = 22
            Top = 51
            Width = 185
            Height = 38
            Caption = 'FUNCEF é Parte do Processo:'
            Columns = 2
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 2
            OnClick = rgFuncefClick
          end
          object edtNumeroProc: TMaskEdit
            Left = 148
            Top = 25
            Width = 178
            Height = 21
            EditMask = '9999999\-99\.9999\.9\.99\.9999;0'
            MaxLength = 25
            TabOrder = 3
          end
        end
        object tbsContasBaixa: TTabSheet
          Caption = 'Contas Baixa'
          ImageIndex = 6
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 836
            Height = 382
            Selected.Strings = (
              'PATROCINADORA'#9'60'#9'PATROCINADORA'
              'PLANPREVCONTABIL'#9'50'#9'PLANPREVCONTABIL'
              'SEGREGACRITER'#9'60'#9'SEGREGACRITER'
              'PLACONTA'#9'18'#9'PLACONTA'
              'VALOR'#9'10'#9'VALOR'
              'IDPATRO'#9'10'#9'IDPATRO'
              'IDPLANOPREV'#9'10'#9'IDPLANOPREV'
              'IDSEGREGACRITER'#9'10'#9'IDSEGREGACRITER'
              'PLANO'#9'10'#9'PLANO'
              'UNIDNEGOC'#9'10'#9'UNIDNEGOC'
              'IDPESSOA'#9'10'#9'IDPESSOA')
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
    end
  end
  inherited Dock971: TDock97
    Top = 518
    Width = 944
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
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'EditorCaption'
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
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.NUMAPGR'
      'DOCUMENTO.CODDOSSIE'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'round(LANCTODOCUM.VALOR,2)'
      'LANCTODOCUM.HISTORICOCOMPL'
      'DOCUMENTO.OBS'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO'
      'RECBTOPAGTO.NUMCHQBORDERO'
      'PESSOA.NOME'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'DOCUMENTO.IDPROCESSO'
      'DOCUMENTO.NUMPROCESSO'
      'DOCUMENTO.PARTEFUNCEF'
      'DOCUMENTO.PARTECONTRARIA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'N'
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
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF/CNPJ'
      'Razão Social'
      'Número do Documento'
      'Compl. Documento'
      'Nº Ap/Gr'
      'Cód. Dossiê'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Observação'
      'Tipo de Documento'
      'Forma de Pagamento/Cobrança'
      'Sistema de Origem'
      'Número do Cheque/Borderô'
      'Nome'
      'Usuário Inclusão'
      'Processo RAD'
      'Nº Processo'
      'Funcef é parte do Processo'
      'Parte Contraria')
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
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '20'
      '15'
      '3'
      '10'
      '10'
      '10'
      '10'
      '15'
      '40'
      '20'
      '50'
      '20'
      '20'
      '10'
      '30'
      '20'
      '15'
      '10'
      '20'
      '1'
      '40')
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
      '2'
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
    ApenasLetraENum.Strings = (
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 571
    Top = 68
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 653
    Top = 69
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnDataChange = dsDetDataChange
    Left = 75
    Top = 214
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
    Left = 139
    Top = 214
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
    Left = 372
    Top = 275
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
      '  --US.NOMEUSUARIO,'
      '  --'
      '  P2.RAZAOSOCIAL AS NOMEUSUARIO, -- Paulo Nobre - WO23322'
      '  --'
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
      '  D.QTDECOTAS,'
      '  D.FLGSIMPLES,'
      '  D.FLGESPECIAL,'
      '  D.NFSNUMERO,'
      '  D.NFSSERIE,'
      '  D.NFSDATAEMISSAO,'
      '  D.NFSOBS,'
      '  D.NFSSERVICO,  '
      '  D.CODDOSSIE,'
      '  D.NUMPROCESSO,'
      '  D.PARTEFUNCEF,'
      '  D.PARTECONTRARIA'
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
      '  , CM.LISTA_SERVICOS LS'
      ''
      '  ,  PESSOA P2  -- Paulo Nobre - WO23322'
      ''
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.IDMODULO = M.IDMODULO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO) AND'
      '  (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      '  (R.NUMLANCTO(+) = L.NUMLANCTO) AND'
      '  (P.IDPESSOA = D.IDFORCLI) AND'
      '  (D.IDUSUARIOINCLUSAO = US.IDUSUARIO(+)) AND --Leandro WO39837'
      '--'
      
        '  (US.IDUSUARIO = P2.IDPESSOA(+)) AND     -- Paulo Nobre - WO233' +
        '22 --Leandro WO39837'
      '--'
      '  (C.IDAGENCIA = A.IDPESSOA(+))  AND'
      '  (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '  (D.IDCBANCARIA = C.IDCBANCARIA(+)) AND '
      '  (D.NFSSERVICO = LS.IDSERVICO(+))'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 70
    Top = 430
  end
  object SQLDet: TCMSqlParams
    SQL.Strings = (
      'SELECT R.CODDOCUMENTO,'
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
        '    '#39' AS DESCSEGREGACRITER,'
      '       0 AS CODSUBCONTA,'
      '       0 AS CODSUBCONTAPASS,'
      '   '#39'                  '#39' AS PLACONTA,'
      '   '#39'                  '#39' AS PLACONTAPASS,'
      '   '#39'                                        '#39' AS NOMECONTA,'
      '   '#39'                                        '#39' AS NOMECONTAPASS,'
      '   IDPLANOVIRTUAL,'
      '   IDSEGREGACONTR,'
      '   T.FLGOBRQTDECOTAS,'
      '   R.IDPATROORIGEM,'
      '   R.IDPLANOORIGEM,'
      '   PATROORIGEM.NOME AS NOMEPATROORIGEM,'
      '   PATROORIGEM.NUMDOCUMENTO AS CNPJPATROORIGEM,'
      '   PLANOORIGEM.NOME AS DESCPLANOORIGEM,'
      '   NVL(R.IDDESPESAORC, -1) IDDESPESAORC,'
      '   D.SUBDESPESA,'
      '   0 as IDTIPORDXCCXCONTA,'
      '   0 as IDRATEIO_ORCAMENTO,'
      '   T.DESCRICAO AS DESC_RATEIO_ORCAMENTO,'
      '   0 as TipoDespesa,'
      '   '#39'          '#39' CentroCusto,'
      '   0 AS IDFORCLI,'
      '   SYSDATE DATAVENCTO,'
      '   0 AS PossuiGrupoOrcamen,'
      '   NVL(IDPROGRAMAORCAMEN,0) AS IDPROGRAMAORCAMEN,'
      '   SYSDATE DATALANCTO,'
      '   '#39' '#39' AS SERVICO'
      'FROM RATEIODOCUM R,'
      '   UNIDNEGOCIO U,'
      '   CENTRESPON C,'
      '   TIPORECEBDESEMB T,'
      '   MOEDA I,'
      '   CENTCUST CC,'
      '   PESSOA PATRO,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA,'
      '   RESERVAORCAMEN,'
      '   PESSOA PATROORIGEM,'
      '   PLANPREVCONTABIL PLANOORIGEM,'
      '   DESPESAORCAMENTARIA D'
      'WHERE'
      '   (R.CODDOCUMENTO =  :CODDOCUMENTO)AND'
      ' (T.CODTIPRECDES = R.CODTIPRECDES)'
      ' AND (T.RECPAG = R.RECPAG)'
      ' AND (T.IDPESSOA = R.IDPESSOA)'
      ' AND (U.UNIDNEGOC = R.UNIDNEGOC)'
      ' AND (U.IDPESSOA = R.IDPESSOA)'
      ' AND (I.MOECODIGO(+) = R.MOECODIGO)'
      ' AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)'
      ' AND (CC.IDEMPRESA(+) = R.IDPESSOA)'
      ' AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      ' AND (C.IDPESSOA(+) = R.IDPESSOA)'
      ' AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)'
      ' AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)'
      ' AND (PATRO.IDPESSOA(+) = R.IDPATRO)'
      ' AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      ' AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)'
      ' AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)'
      ' AND (R.IDDESPESAORC = D.IDDESPESAORC(+))')
    ClientDataSet = CdsDet
    Left = 140
    Top = 433
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
    Left = 203
    Top = 87
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContabAfterOpen
    Left = 179
    Top = 182
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
      '  LC.PLNCODIGO,   -- Edilaine - SOL 178962 / KTN 1659255'
      '  U.NOME,'
      '  A.CODALTERADOR,'
      '  ('#39'S'#39') AS CONTABILIZA,'
      '  A.FLGINCIDEIRRF,'
      '  LC.IDDESPESAORC,'
      '  0 AS IDRATEIO_ORCAMENTO,'
      '  A.FLGOBRIGARESERVA,'
      '  A.ACRESDECRES,'
      '  LC.IDRATEIODOCUM,'
      '  0 AS IDALTXCCXPRGXCONTA,'
      '  0 aS TipoDespesa,'
      '  '#39'          '#39' CentroCusto,'
      '  D.DATAVENCTO'
      ' , A.FLGLANCANFS'
      ' , A.FLGVALORBASE'
      ' , NVL(LC.VALORBASERETENCAO, 0) AS VALORBASERETENCAO'
      ' , LC.IDTIPOSERVICO'
      ' , T.DESCRICAO AS TIPOSERVICO'
      ' , LC.IDPROCESSO'
      ' , P.NUMERO AS NUMPROCESSO'
      ' , 0 AS TIPOLANCALT'
      'From'
      '  LANCTODOCUM LC,'
      '  TIPOALTERADOR A,'
      '  UNIDNEGOCIO U,'
      '  DOCUMENTO D,'
      '  TIPOSERVICO T,'
      '  PROCESSOS P'
      'Where'
      '  LC.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  LC.CODALTERADOR = A.CODALTERADOR AND'
      '  LC.CODDOCUMENTO = D.CODDOCUMENTO(+) AND    '
      '  LC.UNIDNEGOC = U.UNIDNEGOC(+) AND '
      '  LC.IDTIPOSERVICO = T.IDTIPOSERVICO (+) AND'
      '  LC.IDPROCESSO = P.IDPROCESSO (+)'
      ' ')
    ClientDataSet = CdsAlteradores
    Left = 448
    Top = 321
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLancamentoAfterOpen
    AfterInsert = CdsAlteradoresAfterInsert
    AfterPost = CdsAlteradoresAfterPost
    Left = 440
    Top = 271
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
      ' L.PLNANTECIPA,'
      ' P.NOME,'
      ' L.TRGDTINCLUSAO'
      'FROM'
      ' LANCTODOCUM L,'
      ' RECBTOPAGTO R,'
      ' PESSOA P'
      'WHERE'
      ' (L.CODDOCUMENTO = :CODDOCUMENTO) AND'
      ' (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      ' (R.NUMLANCTO(+) = L.NUMLANCTO) AND'
      ' (L.IDUSUARIOINCLUSAO = P.IDPESSOA(+))'
      'ORDER BY'
      ' L.DATALANCTO'
      ' ')
    ClientDataSet = CdsLancamento
    Left = 147
    Top = 1
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
    Left = 338
    Top = 87
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 182
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
      '   FLGTIPOPROGRAMA,'
      '   IDPROGRAMAORCAMEN'
      'FROM'
      '   PROGRAMA'
      'ORDER BY'
      '   DESCPROGRAMA')
    ClientDataSet = CdsProgramaPrev
    Left = 526
    Top = 135
  end
  object CdsProgramaPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 764
    Top = 134
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
    Left = 924
    Top = 121
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 558
    Top = 208
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
      '   HITCODHIST,'
      '   FLGDESEMBSERVICO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   1=2'
      ''
      ''
      ' ')
    ClientDataSet = CdsTipoRD
    Left = 436
    Top = 97
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTipoRDAfterOpen
    Left = 388
    Top = 144
  end
  object CdsAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 261
    Top = 289
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
      '  FLGINCIDEIRRF,'
      '  RECPAG,'
      '  IDPESSOA,'
      '  FLGOBRIGARESERVA,'
      '  FLGVALORBASE'
      'FROM'
      '  TIPOALTERADOR'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  DESCRICAO '
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAlt
    Left = 310
    Top = 288
  end
  object CdsSubContaForCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 197
  end
  object SqlSubContaForCli: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODSUBCONTA,'
      '   NOMESUBCONTA'
      'FROM '
      '  SUBCONTA')
    ClientDataSet = CdsSubContaForCli
    Left = 354
    Top = 206
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
    Left = 714
    Top = 262
  end
  object CdsValida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 730
    Top = 381
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
    Left = 540
    Top = 168
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 269
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
    Left = 580
    Top = 254
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 491
    Top = 220
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
    Left = 596
    Top = 224
  end
  object CdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 676
    Top = 365
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
    Left = 572
    Top = 158
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 780
    Top = 357
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
      '  /*Fernando Xavier SOL 160624 inicio*/'
      '  ,NVL(FLGCODDOCIGUALNODOC, '#39'N'#39') As FLGCODDOCIGUALNODOC'
      '  /*Fernando Xavier SOL 160624 Final*/'
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
      '  NVL(FLGGERANUMDOC,'#39'N'#39') as FLGGERANUMDOC,'
      '  NVL(FLGDOCFISCAL, '#39'N'#39') as FLGDOCFISCAL'
      '  /*Fernando Xaxvier SOL 160624 inicio*/'
      '  ,NVL(FLGCODDOCIGUALNODOC, '#39'N'#39') As FLGCODDOCIGUALNODOC'
      '  /*Fernando Xaxvier SOL 160624 inicio*/'
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
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsTipoDoc
    Left = 684
    Top = 230
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 628
    Top = 237
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
    Top = 232
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 270
    Top = 223
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsUnidNegocAfterOpen
    Left = 743
    Top = 204
  end
  object SqlUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :IDPESSOA) '
      'AND UNETIPO = '#39'A'#39' AND ATIVO = '#39'S'#39
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ClientDataSet = CdsUnidNegoc
    Left = 703
    Top = 149
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
    Left = 988
    Top = 174
  end
  object CdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 988
    Top = 221
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
    Left = 932
    Top = 174
  end
  object CdsForCliAdianto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 932
    Top = 221
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
    Left = 844
    Top = 270
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 836
    Top = 221
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
    Left = 836
    Top = 174
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
    Left = 98
    Top = 2
  end
  object cdsGrupoRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 194
    Top = 4
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
    Left = 120
    Top = 296
  end
  object cdsVerificaRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 40
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
    Left = 84
    Top = 137
  end
  object CdsCCBaixasXDocum: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAfterOpen
    Left = 200
    Top = 182
  end
  object dsCCBaixasXDocum: TwwDataSource
    AutoEdit = False
    DataSet = CdsCCBaixasXDocum
    Left = 933
    Top = 270
  end
  object SqlProcessoRad: TCMSqlParams
    SQL.Strings = (
      'select * '
      'from RADINSTPROCESSO '
      'where IDPROCESSO = :IDPROCESSO ')
    ClientDataSet = CdsProcessoRad
    Left = 1091
    Top = 227
  end
  object CdsProcessoRad: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1123
    Top = 227
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
    Left = 1096
    Top = 167
  end
  object cdsRAD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1130
    Top = 167
  end
  object DsRAD: TwwDataSource
    DataSet = cdsRAD
    Left = 768
    Top = 255
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
    Left = 769
    Top = 79
  end
  object cdsContaBancaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 199
  end
  object sqlDocPai: TCMSqlParams
    SQL.Strings = (
      'select dp.idDocumentoPai,'
      '       d.Nodocumento,'
      '       Decode(d.recpag,'#39'R'#39','#39'Receber'#39','#39'Pagar'#39') as RecPag,'
      '       p.Nome,'
      '       d.dataemissao,'
      '       d.datavencto,'
      '       d.dataprogramada,'
      '       Decode(d.Status,0,'#39'Aberto'#39','#39'Baixado'#39') as Operacao,'
      '       l.valor,'
      '       '#39'Pai'#39' as Vinculo'
      'from  documxdocum dp, documento d, pessoa p, lanctodocum l'
      'where dp.iddocumentopai = d.coddocumento'
      '  and l.operacao        = d.operacao'
      '  and l.coddocumento    = d.coddocumento'
      '  and d.idforcli        = p.idpessoa'
      '  and dp.iddocumento    = :CodDocumento'
      'Union'
      'select dp.idDocumentoPai,'
      '       d.Nodocumento,'
      '       Decode(d.recpag,'#39'R'#39','#39'Receber'#39','#39'Pagar'#39') as RecPag,'
      '       p.Nome,'
      '       d.dataemissao,'
      '       d.datavencto,'
      '       d.dataprogramada,'
      '       Decode(d.Status,0,'#39'Aberto'#39','#39'Baixado'#39') as Operacao,'
      '       l.valor,'
      '       '#39'Filho'#39' as Vinculo'
      'from documxdocum dp, documento d, pessoa p, lanctodocum l'
      'where dp.iddocumento    = d.coddocumento'
      '  and l.operacao        = d.operacao'
      '  and l.coddocumento    = d.coddocumento'
      '  and d.idforcli        = p.idpessoa'
      '  and dp.iddocumentoPai = :CodDocumento'
      ' ')
    ClientDataSet = cdsDocPai
    Left = 224
    Top = 434
  end
  object cdsDocPai: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDocPaiAfterOpen
    Left = 377
    Top = 239
    Data = {
      0B0100009619E0BD01000000180000000A0000000000030000000B010E494444
      4F43554D454E544F50414908000400000000000B4E4F444F43554D454E544F08
      0004000000000006524543504147010049000000010005574944544802000200
      0700044E4F4D450100490000000100055749445448020002003C000B44415441
      454D495353414F08000800000000000A4441544156454E43544F080008000000
      00000E4441544150524F4752414D4144410800080000000000084F5045524143
      414F01004900000001000557494454480200020007000556414C4F5208000400
      000000000756494E43554C4F0100490000000100055749445448020002000500
      0100044C4349440400010009040000}
  end
  object dsDocPai: TwwDataSource
    AutoEdit = False
    DataSet = cdsDocPai
    Left = 453
    Top = 230
  end
  object cdsSubDespesaRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 402
  end
  object cdsSubDespesaAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 402
  end
  object imgLista: TImageList
    Left = 809
    Top = 1
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000080000000FF00000080000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000808080000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000808080000000
      FF000000FF00000080000000FF00000080000000FF00000080000000FF000000
      80000000000000000000000000000000000000000000000000008080800000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000000000000000000000000000000000000000000008080800000FF00000080
      0000008000000000000000000000008000000080000000800000008000000080
      00000080000000000000000000000000000000000000808080000000FF000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      FF00000080000000000000000000000000000000000080808000FFFFFF0000FF
      FF0080808000000000008080800000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008080800000FF00000080
      0000FFFFFF00FFFFFF00FFFFFF00000000000080000000800000008000000080
      00000080000000000000000000000000000000000000808080000000FF000000
      800080808000FFFFFF000000FF00000080000000FF00FFFFFF00808080000000
      80000000FF000000000000000000000000000000000080808000FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      0000840000000000000000000000000000008080800000FF0000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000800000008000000080
      000000800000008000000000000000000000808080000000FF00000080000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000080000000FF00000000000000000080808000FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000008080800000FF0000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008000000080
      000000800000008000000000000000000000808080000000FF000000FF000000
      80000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      80000000FF0000008000000000000000000080808000FFFFFF0000FFFF0000FF
      FF000000000000000000000000008080800000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      0000840000008400000000000000000000008080800000FF0000008000000080
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000080
      000000800000008000000000000000000000808080000000FF00000080000000
      FF00000080000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000080000000
      FF00000080000000FF00000000000000000080808000FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      0000840000008400000000000000000000008080800000FF0000008000000080
      0000FFFFFF00FFFFFF000000000000800000FFFFFF00FFFFFF00FFFFFF000000
      000000800000008000000000000000000000808080000000FF000000FF000000
      80000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      80000000FF0000008000000000000000000080808000FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00808080000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      0000840000008400000000000000000000008080800000FF0000008000000080
      0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00FFFFFF000000
      000000800000008000000000000000000000808080000000FF00000080000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000080000000FF00000000000000000080808000FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      000084000000840000000000000000000000000000008080800000FF00000080
      0000008000000080000000800000008000000080000000800000FFFFFF00FFFF
      FF000080000000000000000000000000000000000000808080000000FF000000
      800080808000FFFFFF000000FF00000080000000FF00FFFFFF00808080000000
      80000000FF000000000000000000000000000000000080808000FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008080800000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      000084000000000000000000000000000000000000008080800000FF00000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000000000000000000000000000000000808080000000FF000000
      FF00000080000000FF00000080000000FF00000080000000FF00000080000000
      FF00000080000000000000000000000000000000000080808000FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      00008400000000000000000000000000000000000000000000008080800000FF
      000000FF00000080000000800000008000000080000000800000008000000080
      0000000000000000000000000000000000000000000000000000808080000000
      FF000000FF00000080000000FF00000080000000FF00000080000000FF000000
      800000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000008080
      80008080800000FF000000FF000000FF000000FF000000FF0000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000808080000000FF000000FF000000FF000000FF000000FF00808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00786038003800380038103800380038003
      0081000100010001004100010001008102210001000100810211000100010101
      001100010001008180038003800382838003800380038023C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object cdsTipoServico: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 279
    Data = {
      E10400009619E0BD010000001800000002001F000000030000005B000D494454
      49504F5345525649434F08000400000000000944455343524943414F01004900
      000001000557494454480200020064000100044C434944040001000908000000
      00000000000000F03F214C696D70657A612C20636F6E7365727661E7E36F206F
      75207A656C61646F7269610000000000000000004017566967696CE26E636961
      206F75207365677572616EE7610000000000000000084010436F6E73747275E7
      E36F20636976696C000000000000000010401A5365727669E76F73206465206E
      61747572657A6120727572616C0000000000000000144009446967697461E7E3
      6F000000000000000018402650726570617261E7E36F206465206461646F7320
      706172612070726F63657373616D656E746F00000000000000001C400A416361
      62616D656E746F0000000000000000204009456D62616C6167656D0000000000
      00000022401041636F6E646963696F6E616D656E746F00000000000000002440
      08436F6272616EE761000000000000000026402B436F6C657461206F75207265
      6369636C6167656D206465206C69786F206F7520646520726573ED64756F7300
      00000000000000284004436F706100000000000000002A4009486F74656C6172
      696100000000000000002C4025436F727465206F75206C696761E7E36F206465
      207365727669E76F732070FA626C69636F7300000000000000002E400C446973
      747269627569E7E36F0000000000000000304014547265696E616D656E746F20
      6520656E73696E6F0000000000000000314021456E747265676120646520636F
      6E746173206520646520646F63756D656E746F7300000000000000003240144C
      696761E7E36F206465206D656469646F72657300000000000000003340144C65
      6974757261206465206D656469646F72657300000000000000003440394D616E
      7574656EE7E36F20646520696E7374616C61E7F565732C206465206DE1717569
      6E6173206F75206465206571756970616D656E746F7300000000000000003540
      084D6F6E746167656D00000000000000003640334F70657261E7E36F20646520
      6DE17175696E61732C206465206571756970616D656E746F7320652064652076
      65ED63756C6F7300000000000000003740304F70657261E7E36F206465207065
      64E167696F206F75206465207465726D696E616C206465207472616E73706F72
      746500000000000000003840254F70657261E7E36F206465207472616E73706F
      727465206465207061737361676569726F730000000000000000394022506F72
      74617269612C207265636570E7E36F206F7520617363656E736F726973746100
      000000000000003A402E5265636570E7E36F2C207472696167656D206F75206D
      6F76696D656E7461E7E36F206465206D61746572696169730000000000000000
      3B402050726F6D6FE7E36F2064652076656E646173206F75206465206576656E
      746F7300000000000000003C4017536563726574617269612065206578706564
      69656E746500000000000000003D40055361FA646500000000000000003E401A
      54656C65666F6E6961206F752074656C656D61726B6574696E67000000000000
      00003F404054726162616C686F2074656D706F72E172696F206E6120666F726D
      61206461204C6569206EBA20362E3031392C206465206A616E6569726F206465
      2031393734}
  end
  object cdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 281
    Top = 347
  end
  object sqlTipoServico: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOSERVICO, DESCRICAO'
      '  FROM TIPOSERVICO')
    ClientDataSet = cdsTipoServico
    Left = 237
    Top = 379
  end
  object sqlProcessos: TCMSqlParams
    SQL.Strings = (
      'SELECT P.IDPROCESSO, P.NUMERO'
      '  FROM PROCESSOS P'
      ' WHERE P.IDFORCLI = :PIDFORCLI'
      
        '   AND (P.DATAFIM IS NULL OR P.DATAFIM >= TO_DATE(:PDATAFIM, '#39'DD' +
        '/MM/YYYY'#39'))')
    ClientDataSet = cdsProcessos
    Left = 349
    Top = 347
  end
  object dsTipoServico: TDataSource
    DataSet = cdsTipoServico
    Left = 160
    Top = 345
  end
  object dsProcessos: TDataSource
    DataSet = cdsProcessos
    Left = 329
    Top = 395
  end
  object msListaServico: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'LISTA_SERVICOS.CODIGO'
      'LISTA_SERVICOS.NOME'
      
        'SUBSTR(LISTA_SERVICOS.CODNATUREZAREINF || '#39' - '#39'  || NATUREZA_REN' +
        'DIMENTO_REINF.TITULO, 0, 200)')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo'
      'Rendimento REINF')
    Tabelas.Strings = (
      'LISTA_SERVICOS'
      'NATUREZA_RENDIMENTO_REINF')
    CamposChave.Strings = (
      'LISTA_SERVICOS.IDSERVICO'
      'LISTA_SERVICOS.CODNATUREZAREINF')
    Filtro.Strings = (
      
        'LISTA_SERVICOS.CODNATUREZAREINF = NATUREZA_RENDIMENTO_REINF.CODN' +
        'ATUREZAREINF')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '8'
      '80'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 649
    Top = 295
  end
  object odAbreArq: TOpenDialog
    DefaultExt = '*.*'
    Filter = 'Todos os Arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Selecionar Arquivo'
    Left = 777
    Top = 170
  end
  object dsPadraoRateio: TwwDataSource
    AutoEdit = False
    DataSet = cdsPadraoRateio
    OnDataChange = dsDetDataChange
    Left = 83
    Top = 294
  end
end
