inherited frmCadContrato: TfrmCadContrato
  Left = 191
  Top = 178
  HelpContext = 120008
  Caption = 'Cadastro de Contratos'
  ClientHeight = 424
  ClientWidth = 654
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 654
    Height = 338
    object PnlPrincipal: TPanel
      Left = 1
      Top = 1
      Width = 652
      Height = 164
      Align = alTop
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object Label16: TLabel
        Left = 16
        Top = 16
        Width = 103
        Height = 13
        Caption = 'Nome do Contrato'
      end
      object Label20: TLabel
        Left = 368
        Top = 16
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
      end
      object Label21: TLabel
        Left = 16
        Top = 56
        Width = 128
        Height = 13
        Caption = 'Descrição do Contrato'
      end
      object BotaoEncerraCadastramento: TBitBtn
        Left = 16
        Top = 125
        Width = 185
        Height = 25
        Caption = 'Encerrar Cadastramento'
        TabOrder = 0
        OnClick = BotaoEncerraCadastramentoClick
        Glyph.Data = {
          76050000424D7605000000000000360400002800000011000000100000000100
          0800000000004001000000000000000000000001000000010000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF00C0DCC000F0CAA6000101010002020200030303000404
          040005050500060606000707070008080800090909000A0A0A000B0B0B000C0C
          0C000D0D0D000E0E0E000F0F0F00101010001111110012121200131313001414
          140015151500161616001717170018181800191919001A1A1A001B1B1B001C1C
          1C001D1D1D001E1E1E001F1F1F00202020002121210022222200232323002424
          240025252500262626002727270028282800292929002A2A2A002B2B2B002C2C
          2C002D2D2D002E2E2E002F2F2F00303030003131310032323200333333003434
          340035353500363636003737370038383800393939003A3A3A003B3B3B003C3C
          3C003D3D3D003E3E3E003F3F3F00404040004141410042424200434343004444
          440045454500464646004747470048484800494949004A4A4A004B4B4B004C4C
          4C004D4D4D004E4E4E004F4F4F00505050005151510052525200535353005454
          540055555500565656005757570058585800595959005A5A5A005B5B5B005C5C
          5C005D5D5D005E5E5E005F5F5F00606060006161610062626200636363006464
          640065656500666666006767670068686800696969006A6A6A006B6B6B006C6C
          6C006D6D6D006E6E6E006F6F6F00707070007171710072727200737373007474
          740075757500767676007777770078787800797979007A7A7A007B7B7B007C7C
          7C007D7D7D007E7E7E007F7F7F00818181008282820083838300848484008585
          8500868686008787870088888800898989008A8A8A008B8B8B008C8C8C008D8D
          8D008E8E8E008F8F8F0090909000919191009292920093939300949494009595
          9500969696009797970098989800999999009A9A9A009B9B9B009C9C9C009D9D
          9D009E9E9E009F9F9F00A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5
          A500A6A6A600A7A7A700A8A8A800A9A9A900AAAAAA00ABABAB00ACACAC00ADAD
          AD00AEAEAE00AFAFAF00B0B0B000B1B1B100B2B2B200B3B3B300B4B4B400B5B5
          B500B6B6B600B7B7B700B8B8B800B9B9B900BABABA00BBBBBB00BCBCBC00BDBD
          BD00BEBEBE00BFBFBF00C1C1C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6
          C600C7C7C700C8C8C800C9C9C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECE
          CE00CFCFCF00D0D0D000D1D1D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6
          D600D7D7D700D8D8D800D9D9D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDE
          DE00DFDFDF00E0E0E000E1E1E100E2E2E200E3E3E300E4E4E4000F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0000000F0F0F0F0F0F06060F0F0F0F0F0F0F0F0F00
          00000F0F0F0F0F060404060F0F0F0F0F0F0F0F0000000F0F0F0F060404040406
          0F0F0F0F0F0F0F0000000F0F0F06040404040404060F0F0F0F0F0F0000000F0F
          060404041204040404060F0F0F0F0F0000000F0F040404120F12040404060F0F
          0F0F0F0000000F0F1204120F0F0F12040404060F0F0F0F0000000F0F0F120F0F
          0F0F0F12040404060F0F0F0000000F0F0F0F0F0F0F0F0F0F12040404060F0F00
          00000F0F0F0F0F0F0F0F0F0F0F12040404060F0000000F0F0F0F0F0F0F0F0F0F
          0F0F12040404060000000F0F0F0F0F0F0F0F0F0F0F0F0F120404040000000F0F
          0F0F0F0F0F0F0F0F0F0F0F0F1204040000000F0F0F0F0F0F0F0F0F0F0F0F0F0F
          0F12040000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F12000000}
      end
      object BotaoEncerraContrato: TBitBtn
        Left = 213
        Top = 125
        Width = 185
        Height = 25
        Caption = 'Encerrar Contrato'
        TabOrder = 1
        OnClick = BotaoEncerraContratoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
      object DBNomeContrato: TwwDBEdit
        Left = 16
        Top = 32
        Width = 341
        Height = 21
        DataField = 'NOMECONTRATO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBCodigoContratoEmpresa: TwwDBEdit
        Left = 368
        Top = 32
        Width = 257
        Height = 21
        DataField = 'CODCONTRATOEMPR'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBDescricaoContrato: TDBMemo
        Left = 16
        Top = 72
        Width = 613
        Height = 49
        DataField = 'DESCRICAOCONTRATO'
        DataSource = ds
        MaxLength = 500
        TabOrder = 4
      end
    end
    object pgctrlDetalhe: TPageControl
      Left = 1
      Top = 165
      Width = 652
      Height = 172
      ActivePage = TabSheetIntegracao
      Align = alClient
      Enabled = False
      TabOrder = 1
      object TabSheetDadosContratuais: TTabSheet
        Caption = 'Dados Contratuais'
        object GroupBoxDatas: TGroupBox
          Left = 8
          Top = 0
          Width = 593
          Height = 61
          Caption = 'Datas'
          TabOrder = 0
          object Label7: TLabel
            Left = 8
            Top = 16
            Width = 60
            Height = 13
            Caption = 'Assinatura'
          end
          object Label8: TLabel
            Left = 144
            Top = 16
            Width = 60
            Height = 13
            Caption = 'Data Base'
          end
          object Label9: TLabel
            Left = 281
            Top = 16
            Width = 99
            Height = 13
            Caption = 'Prevista Encerra.'
          end
          object Label22: TLabel
            Left = 420
            Top = 16
            Width = 79
            Height = 13
            Caption = 'Encerramento'
          end
          object DBDataAssinatura: TCMDateTimePicker
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAASSINATURA'
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
          end
          object DBDataBase: TCMDateTimePicker
            Left = 144
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATABASECONTRATO'
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
          object DBDataPrevistaEncerramento: TCMDateTimePicker
            Left = 281
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPREVENCERRA'
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
          object DBDataEfetivaEncerramento: TCMDateTimePicker
            Left = 420
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAEFETENCERRA'
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
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 3
          end
        end
        object GroupBoxValores: TGroupBox
          Left = 8
          Top = 64
          Width = 273
          Height = 61
          Caption = 'Valores'
          TabOrder = 1
          object Label10: TLabel
            Left = 8
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label11: TLabel
            Left = 144
            Top = 16
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object DBComboMoeda: TwwDBLookupCombo
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Moeda')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object DBValorBaseContrato: TDBRealEdit
            Left = 140
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORBASECONTRATO'
            DataSource = ds
          end
        end
        object GroupBoxOutros: TGroupBox
          Left = 286
          Top = 64
          Width = 315
          Height = 61
          Caption = 'Outros'
          TabOrder = 2
          object Label12: TLabel
            Left = 8
            Top = 16
            Width = 126
            Height = 13
            Caption = 'Prazo Denuncia (dias)'
          end
          object Label1: TLabel
            Left = 167
            Top = 7
            Width = 102
            Height = 13
            Caption = 'Aviso Vencimento'
          end
          object Label2: TLabel
            Left = 167
            Top = 18
            Width = 132
            Height = 13
            Caption = 'ou Encerramento (dias)'
          end
          object DBPrazoDenuncia: TwwDBEdit
            Left = 43
            Top = 32
            Width = 49
            Height = 21
            AutoSize = False
            DataField = 'PRAZODENUNCIA'
            DataSource = ds
            MaxLength = 3
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBAviso: TwwDBEdit
            Left = 184
            Top = 32
            Width = 49
            Height = 21
            DataField = 'AVISO'
            DataSource = ds
            MaxLength = 3
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TabSheetDadosContraparte: TTabSheet
        Caption = 'Dados da Contraparte'
        object Label13: TLabel
          Left = 280
          Top = 0
          Width = 171
          Height = 13
          Caption = 'Código no Cliente/Fornecedor'
        end
        object Label15: TLabel
          Left = 280
          Top = 40
          Width = 45
          Height = 13
          Caption = 'Contato'
        end
        object Label29: TLabel
          Left = 280
          Top = 80
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object CMPContraparte: TCMProcuraForCli
          Left = 8
          Top = 56
          Width = 257
          Height = 50
          Caption = 'Contraparte'
          TabOrder = 1
          OnExit = CMPContraparteExit
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          DataSource = ds
          DataField = 'IDFORCLI'
          Mensagens.EmBranco = 'Contraparte não pode estar em branco'
          Mensagens.NaoExiste = 'Contraparte  não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object dbrgTipoContrato: TDBRadioGroup
          Left = 8
          Top = 0
          Width = 257
          Height = 45
          Caption = 'Tipo de Contrato'
          Columns = 2
          DataField = 'TIPOCONTRATO'
          DataSource = ds
          Items.Strings = (
            'Cliente'
            'Fornecedor')
          TabOrder = 0
          Values.Strings = (
            'A'
            'P')
          OnChange = dbrgTipoContratoChange
        end
        object DBCodAuxContrato: TDBEdit
          Left = 280
          Top = 16
          Width = 173
          Height = 21
          DataField = 'CODAUXCONTRATO'
          DataSource = ds
          TabOrder = 2
        end
        object DBLookupComboContato: TwwDBLookupCombo
          Left = 280
          Top = 56
          Width = 257
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          DataField = 'IDCONTATO'
          DataSource = ds
          LookupTable = qryContato
          LookupField = 'IDCONTATO'
          Enabled = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = DBLookupComboContatoExit
        end
        object DBLookupComboTelefone: TwwDBLookupCombo
          Left = 280
          Top = 96
          Width = 257
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NUMERO'#9'20'#9'NUMERO')
          DataField = 'IDTELEFONE'
          DataSource = ds
          LookupTable = qryTelefone
          LookupField = 'IDTELEFONE'
          Enabled = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TabSheetEnderecos: TTabSheet
        Caption = 'Endereços'
        object Label17: TLabel
          Left = 8
          Top = 0
          Width = 172
          Height = 13
          Caption = 'Endereço de Correspondência'
        end
        object Label18: TLabel
          Left = 8
          Top = 40
          Width = 121
          Height = 13
          Caption = 'Endereço de Entrega'
        end
        object Label19: TLabel
          Left = 8
          Top = 80
          Width = 131
          Height = 13
          Caption = 'Endereço de Cobrança'
        end
        object LCEnderecoCorrespondencia: TwwDBLookupCombo
          Left = 8
          Top = 16
          Width = 533
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ENDCORRESP'#9'70'#9'Endereço Correspondência'#9'No')
          DataField = 'IDENDCORRESPON'
          DataSource = ds
          LookupTable = qryEnderecoCorrespondencia
          LookupField = 'IDENDERECO'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object LCEnderecoEntrega: TwwDBLookupCombo
          Left = 8
          Top = 56
          Width = 533
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ENDENTREGA'#9'70'#9'Endereço Entrega'#9'No')
          DataField = 'IDENDENTREGA'
          DataSource = ds
          LookupTable = qryEnderecoEntrega
          LookupField = 'IDENDERECO'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object LComboEnderecoCobranca: TwwDBLookupCombo
          Left = 8
          Top = 96
          Width = 533
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ENDCOBRANCA'#9'70'#9'Endereço Cobrança')
          DataField = 'IDENDCOBRANCA'
          DataSource = ds
          LookupTable = qryEnderecoCobranca
          LookupField = 'IDENDERECO'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TabSheetReservaOrcamentario: TTabSheet
        Caption = 'Reserva Orçamentário'
        object GpDotOrc: TGroupBox
          Left = 12
          Top = 11
          Width = 213
          Height = 54
          Caption = ' Reserva  Orçamentário '
          TabOrder = 0
          object btnOrcamento: TSpeedButton
            Left = 169
            Top = 19
            Width = 23
            Height = 22
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
              87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
              FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
              0E070F757770000000E070FFF707777777007700007777777777}
            OnClick = btnOrcamentoClick
          end
          object ReResOrc: TRealEdit
            Left = 17
            Top = 19
            Width = 152
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
          end
        end
      end
      object TabSheetObjetoxItem: TTabSheet
        Caption = 'Serviço/ProdutoxItem'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 636
          Height = 136
          Selected.Strings = (
            'NOMEOBJETO'#9'60'#9'Serviço/Produto'#9'F'
            'NOMEITEM'#9'60'#9'Item Contratual'#9'F'
            'QTDEITEM'#9'10'#9'Quantidade'#9'F'
            'VALORUNITARIOOBJETO'#9'10'#9'Valor Unitário'#9'F'
            'VALORTOTALOBJETO'#9'10'#9'Valor Total'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsObjetoItem
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
      object TabSheetIntegracao: TTabSheet
        Caption = 'Integração'
        object Label28: TLabel
          Left = 9
          Top = 8
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label14: TLabel
          Left = 8
          Top = 48
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object Label26: TLabel
          Left = 288
          Top = 8
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label24: TLabel
          Left = 288
          Top = 48
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object DBcboUnidNegocio: TwwDBLookupCombo
          Left = 8
          Top = 24
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'NOME')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = qryLookUnidNegocio
          LookupField = 'UNIDNEGOC'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBLookupResponsavel: TwwDBLookupCombo
          Left = 8
          Top = 64
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome')
          DataField = 'IDRESPONSAVEL'
          DataSource = ds
          LookupTable = qryResponsavel
          LookupField = 'IDRESPONSAVEL'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboCentroRespon: TwwDBLookupCombo
          Left = 288
          Top = 24
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          DataField = 'CODCENTRORESPON'
          DataSource = ds
          LookupTable = qryLookCentroRespon
          LookupField = 'CODCENTRORESPON'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboTipoDoc: TwwDBLookupCombo
          Left = 288
          Top = 64
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'CODTIPDOC'
          DataSource = ds
          LookupTable = qryLookTipoDoc
          LookupField = 'CODTIPDOC'
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object TabSheetTermino: TTabSheet
        Caption = 'Término'
        TabVisible = False
        object lblMultaTermino: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Multa'
          Visible = False
        end
        object lblRegra: TLabel
          Left = 160
          Top = 8
          Width = 35
          Height = 13
          Caption = 'Regra'
          Visible = False
        end
        object Label25: TLabel
          Left = 8
          Top = 56
          Width = 139
          Height = 24
          Caption = 'em construção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Edit1: TEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Edit1'
          Visible = False
        end
      end
      object TabSheetAtraso: TTabSheet
        Caption = 'Atraso'
        TabVisible = False
        object lblMultaAtraso: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Multa'
          Visible = False
        end
        object lblIndiceCorrecao: TLabel
          Left = 344
          Top = 8
          Width = 109
          Height = 13
          Caption = 'Índice de Correção'
          Visible = False
        end
        object Label27: TLabel
          Left = 8
          Top = 56
          Width = 139
          Height = 24
          Caption = 'em construção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Edit2: TEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Edit2'
          Visible = False
        end
        object rdgrpJuros: TRadioGroup
          Left = 144
          Top = 8
          Width = 185
          Height = 41
          Caption = 'Juros'
          Columns = 2
          Items.Strings = (
            'Simples'
            'Compostos')
          TabOrder = 1
          Visible = False
        end
        object Edit3: TEdit
          Left = 344
          Top = 24
          Width = 113
          Height = 21
          TabOrder = 2
          Text = 'Edit3'
          Visible = False
        end
      end
      object TabSheetRenovacao: TTabSheet
        Caption = 'Renovação'
        object Label3: TLabel
          Left = 0
          Top = 8
          Width = 130
          Height = 13
          Caption = 'Tipo de Processo RAD'
        end
        object DBRenovacao: TDBMemo
          Left = 0
          Top = 64
          Width = 644
          Height = 80
          Align = alBottom
          DataField = 'RENOVACAO'
          DataSource = ds
          MaxLength = 500
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object dblcTipoProcessoRAD: TwwDBLookupCombo
          Left = 0
          Top = 24
          Width = 385
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'#9'F')
          DataField = 'IDTIPOPROCESSORAD'
          DataSource = ds
          LookupTable = QryTiposProcRAD
          LookupField = 'IDTIPOPROCESSO'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TabSheetObservacao: TTabSheet
        Caption = 'Observação'
        object DBObservacao: TDBMemo
          Left = 0
          Top = 0
          Width = 636
          Height = 136
          Align = alClient
          DataField = 'OBSERVACAO'
          DataSource = ds
          MaxLength = 500
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 654
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 654
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120008
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 187
    Top = 54
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOCONTR'
      'set'
      '  IDCONTRATO = :IDCONTRATO,'
      '  NOMECONTRATO = :NOMECONTRATO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDENDCORRESPON = :IDENDCORRESPON,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDCONTATO = :IDCONTATO,'
      '  IDFORCLI = :IDFORCLI,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  TIPOCONTRATO = :TIPOCONTRATO,'
      '  DESCRICAOCONTRATO = :DESCRICAOCONTRATO,'
      '  DATAASSINATURA = :DATAASSINATURA,'
      '  CODAUXCONTRATO = :CODAUXCONTRATO,'
      '  VALORBASECONTRATO = :VALORBASECONTRATO,'
      '  DATABASECONTRATO = :DATABASECONTRATO,'
      '  DATAPREVENCERRA = :DATAPREVENCERRA,'
      '  PRAZODENUNCIA = :PRAZODENUNCIA,'
      '  CODCONTRATOEMPR = :CODCONTRATOEMPR,'
      '  FLGEMPENHO = :FLGEMPENHO,'
      '  DATAEFETENCERRA = :DATAEFETENCERRA,'
      '  MOTIVOENCERRA = :MOTIVOENCERRA,'
      '  FLGFIMCONTRATO = :FLGFIMCONTRATO,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  RENOVACAO = :RENOVACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDTELEFONE = :IDTELEFONE,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  AVISO = :AVISO,'
      '  IDTIPOPROCESSORAD = :IDTIPOPROCESSORAD'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO')
    InsertSQL.Strings = (
      'insert into CONTRATOCONTR'
      
        '  (IDCONTRATO, NOMECONTRATO, CODPORTFORMA, IDENDCOBRANCA, CODCEN' +
        'TRORESPON, '
      
        '   IDPESSOA, IDENDCORRESPON, IDENDENTREGA, UNIDNEGOC, IDCONTATO,' +
        ' IDFORCLI, '
      
        '   MOECODIGO, IDRESPONSAVEL, TIPOCONTRATO, DESCRICAOCONTRATO, DA' +
        'TAASSINATURA, '
      
        '   CODAUXCONTRATO, VALORBASECONTRATO, DATABASECONTRATO, DATAPREV' +
        'ENCERRA, '
      
        '   PRAZODENUNCIA, CODCONTRATOEMPR, FLGEMPENHO, DATAEFETENCERRA, ' +
        'MOTIVOENCERRA, '
      
        '   FLGFIMCONTRATO, CODTIPDOC, RENOVACAO, OBSERVACAO, IDTELEFONE,' +
        ' IDRESERVAORCAMEN, '
      '   AVISO, IDTIPOPROCESSORAD)'
      'values'
      
        '  (:IDCONTRATO, :NOMECONTRATO, :CODPORTFORMA, :IDENDCOBRANCA, :C' +
        'ODCENTRORESPON, '
      
        '   :IDPESSOA, :IDENDCORRESPON, :IDENDENTREGA, :UNIDNEGOC, :IDCON' +
        'TATO, :IDFORCLI, '
      
        '   :MOECODIGO, :IDRESPONSAVEL, :TIPOCONTRATO, :DESCRICAOCONTRATO' +
        ', :DATAASSINATURA, '
      
        '   :CODAUXCONTRATO, :VALORBASECONTRATO, :DATABASECONTRATO, :DATA' +
        'PREVENCERRA, '
      
        '   :PRAZODENUNCIA, :CODCONTRATOEMPR, :FLGEMPENHO, :DATAEFETENCER' +
        'RA, :MOTIVOENCERRA, '
      
        '   :FLGFIMCONTRATO, :CODTIPDOC, :RENOVACAO, :OBSERVACAO, :IDTELE' +
        'FONE, :IDRESERVAORCAMEN, '
      '   :AVISO, :IDTIPOPROCESSORAD)')
    DeleteSQL.Strings = (
      'delete from CONTRATOCONTR'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO')
    Left = 227
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOCONTR.DATAASSINATURA'
      'CONTRATOCONTR.NOMECONTRATO')
    TipodeDado.Strings = (
      'D'
      'C')
    Descricao.Strings = (
      'Data da Assinatura'
      'Nome do Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR')
    CamposChave.Strings = (
      'CONTRATOCONTR.IDCONTRATO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '20')
    Left = 261
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 366
    Top = 2
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '    IDCONTRATO,'
      '    NOMECONTRATO,'
      '    CODPORTFORMA,'
      '    IDENDCOBRANCA,'
      '    CODCENTRORESPON,'
      '    IDPESSOA,'
      '    IDENDCORRESPON,'
      '    IDENDENTREGA,'
      '    UNIDNEGOC,'
      '    IDCONTATO,'
      '    IDFORCLI,'
      '    MOECODIGO,'
      '    IDRESPONSAVEL,'
      '    TIPOCONTRATO,'
      '    DESCRICAOCONTRATO,'
      '    DATAASSINATURA,'
      '    CODAUXCONTRATO,'
      '    VALORBASECONTRATO,'
      '    DATABASECONTRATO,'
      '    DATAPREVENCERRA,'
      '    PRAZODENUNCIA,'
      '    CODCONTRATOEMPR,'
      '    FLGEMPENHO,'
      '    DATAEFETENCERRA,'
      '    MOTIVOENCERRA,'
      '    FLGFIMCONTRATO,'
      '    CODTIPDOC,'
      '    RENOVACAO,'
      '    OBSERVACAO,'
      '    IDTELEFONE,'
      '    IDRESERVAORCAMEN,'
      '    AVISO,'
      '    IDTIPOPROCESSORAD'
      'FROM'
      '    CONTRATOCONTR'
      'WHERE'
      '    (IDCONTRATO = :IDCONTRATO)'
      ''
      ' ')
    Left = 154
    Top = 54
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'CONTRATOCONTR.IDCONTRATO'
    end
    object qryNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = 'CONTRATOCONTR.NOMECONTRATO'
      Size = 60
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'CONTRATOCONTR.CODPORTFORMA'
    end
    object qryIDENDCOBRANCA: TFloatField
      FieldName = 'IDENDCOBRANCA'
      Origin = 'CONTRATOCONTR.IDENDCOBRANCA'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'CONTRATOCONTR.CODCENTRORESPON'
      Size = 10
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CONTRATOCONTR.IDPESSOA'
    end
    object qryIDENDCORRESPON: TFloatField
      FieldName = 'IDENDCORRESPON'
      Origin = 'CONTRATOCONTR.IDENDCORRESPON'
    end
    object qryIDENDENTREGA: TFloatField
      FieldName = 'IDENDENTREGA'
      Origin = 'CONTRATOCONTR.IDENDENTREGA'
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'CONTRATOCONTR.UNIDNEGOC'
    end
    object qryIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
      Origin = 'CONTRATOCONTR.IDCONTATO'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'CONTRATOCONTR.IDFORCLI'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'CONTRATOCONTR.MOECODIGO'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'CONTRATOCONTR.IDRESPONSAVEL'
    end
    object qryTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Origin = 'CONTRATOCONTR.TIPOCONTRATO'
      Size = 1
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
      Origin = 'CONTRATOCONTR.DATAASSINATURA'
    end
    object qryCODAUXCONTRATO: TStringField
      FieldName = 'CODAUXCONTRATO'
      Origin = 'CONTRATOCONTR.CODAUXCONTRATO'
    end
    object qryVALORBASECONTRATO: TFloatField
      FieldName = 'VALORBASECONTRATO'
      Origin = 'CONTRATOCONTR.VALORBASECONTRATO'
    end
    object qryDATABASECONTRATO: TDateTimeField
      FieldName = 'DATABASECONTRATO'
      Origin = 'CONTRATOCONTR.DATABASECONTRATO'
    end
    object qryDATAPREVENCERRA: TDateTimeField
      FieldName = 'DATAPREVENCERRA'
      Origin = 'CONTRATOCONTR.DATAPREVENCERRA'
    end
    object qryPRAZODENUNCIA: TFloatField
      FieldName = 'PRAZODENUNCIA'
      Origin = 'CONTRATOCONTR.PRAZODENUNCIA'
    end
    object qryCODCONTRATOEMPR: TStringField
      FieldName = 'CODCONTRATOEMPR'
      Origin = 'CONTRATOCONTR.CODCONTRATOEMPR'
    end
    object qryFLGEMPENHO: TStringField
      FieldName = 'FLGEMPENHO'
      Origin = 'CONTRATOCONTR.FLGEMPENHO'
      Size = 1
    end
    object qryDATAEFETENCERRA: TDateTimeField
      FieldName = 'DATAEFETENCERRA'
      Origin = 'CONTRATOCONTR.DATAEFETENCERRA'
    end
    object qryMOTIVOENCERRA: TStringField
      FieldName = 'MOTIVOENCERRA'
      Origin = 'CONTRATOCONTR.MOTIVOENCERRA'
      Size = 60
    end
    object qryFLGFIMCONTRATO: TStringField
      FieldName = 'FLGFIMCONTRATO'
      Origin = 'CONTRATOCONTR.FLGFIMCONTRATO'
      Size = 1
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'CONTRATOCONTR.CODTIPDOC'
    end
    object qryRENOVACAO: TMemoField
      FieldName = 'RENOVACAO'
      Origin = 'CONTRATOCONTR.RENOVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'CONTRATOCONTR.OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'CONTRATOCONTR.IDTELEFONE'
    end
    object qryIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'CONTRATOCONTR.IDRESERVAORCAMEN'
    end
    object qryAVISO: TFloatField
      FieldName = 'AVISO'
      Origin = 'CONTRATOCONTR.AVISO'
    end
    object qryDESCRICAOCONTRATO: TMemoField
      FieldName = 'DESCRICAOCONTRATO'
      BlobType = ftMemo
      Size = 500
    end
    object qryIDTIPOPROCESSORAD: TFloatField
      FieldName = 'IDTIPOPROCESSORAD'
      Origin = 'BASEDADOS.CONTRATOCONTR.IDTIPOPROCESSORAD'
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:IDEMPRESA )'
      '   AND'
      '   ( ANALITICOSINTET = '#39'A'#39' )'
      '   AND'
      '   (ATIVO = '#39'S'#39')'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 568
    Top = 156
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCRICAO,CODTIPDOC'
      'FROM'
      '   TIPODOCRECPAG'
      'WHERE'
      '   ( RECPAG = :RECPAG) AND '
      '   ( DEBCRE = :DEBCRE)'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 408
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
    object qryLookTipoDocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC, NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  (IDPESSOA =:IDEMPRESA) AND'
      '  (UNETIPO = '#39'A'#39')'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 576
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object dsObjetoItem: TwwDataSource
    DataSet = qryObjetoItem
    Left = 465
    Top = 147
  end
  object qryTelefone: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT C.IDCONTATO,T.IDTELEFONE,T.DDI,T.DDD,T.NUMERO,C.RAMAL'
      'FROM TELENDPESS T, TELCONTATO C'
      'WHERE (IDCONTATO=:IDCONTATO)'
      'AND (T.IDTELEFONE=C.IDTELEFONE)'
      ' ')
    ValidateWithMask = True
    Left = 571
    Top = 111
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTATO'
        ParamType = ptUnknown
      end>
  end
  object qryObjetoContratual: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from objetocontratual')
    ValidateWithMask = True
    Left = 523
    Top = 20
  end
  object qryItemContratual: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from itemcontratual')
    ValidateWithMask = True
    Left = 521
    Top = 6
  end
  object qryObjetoItem: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT *'
      'FROM OBJETOSXITEMCONTR WHERE'
      'IDCONTRATO = :IDCONTRATO')
    ValidateWithMask = True
    Left = 465
    Top = 133
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryObjetoItemNOMEOBJETO: TStringField
      DisplayLabel = 'Serviço/Produto'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOMEOBJETO'
      LookupDataSet = qryObjetoContratual
      LookupKeyFields = 'IDOBJETO'
      LookupResultField = 'NOMEOBJETO'
      KeyFields = 'IDOBJETO'
      Size = 40
      Lookup = True
    end
    object qryObjetoItemNOMEITEM: TStringField
      DisplayLabel = 'Item Contratual'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOMEITEM'
      LookupDataSet = qryItemContratual
      LookupKeyFields = 'IDITEM'
      LookupResultField = 'NOME_ITEM'
      KeyFields = 'IDITEM'
      Size = 40
      Lookup = True
    end
    object qryObjetoItemQTDEITEM: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEITEM'
      Origin = 'OBJETOSXITEMCONTRATUAL.QTDEITEM'
    end
    object qryObjetoItemVALORUNITARIOOBJETO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VALORUNITARIOOBJETO'
      Origin = 'OBJETOSXITEMCONTRATUAL.VALORUNITARIOOBJETO'
    end
    object qryObjetoItemVALORTOTALOBJETO: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTALOBJETO'
      Origin = 'OBJETOSXITEMCONTRATUAL.VALORTOTALOBJETO'
    end
    object qryObjetoItemIDOBJETO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBJETO'
      Origin = 'OBJETOSXITEMCONTRATUAL.IDOBJETO'
      Visible = False
    end
    object qryObjetoItemIDITEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEM'
      Origin = 'OBJETOSXITEMCONTRATUAL.IDITEM'
      Visible = False
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT MOECODIGO,MOEDESC FROM MOEDA '
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 291
    Top = 120
  end
  object qryContato: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT C.NOME, C.IDCONTATO'
      'FROM PESSOA P,ENDPESS E,CONTATOPESS C'
      'WHERE '
      '(E.IDPESSOA = :IDPESSOA) '
      'AND (P.IDPESSOA = E.IDPESSOA )'
      'AND  (E.IDENDERECO = C.IDENDERECO )'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 467
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFormaPagamento: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT P.CODPORTFORMA,P.DESCRICAO'
      'FROM PORTADORFORMA P'
      '')
    ValidateWithMask = True
    Left = 428
    Top = 75
  end
  object qryEnderecoEntrega: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT E.IDENDERECO,'
      
        'RTRIM(E.LOGRADOURO)||'#39' '#39'||RTRIM(E.NUMERO)||'#39' '#39'||RTRIM(E.COMPLEME' +
        'NTO)||'#39' '#39'||RTRIM(E.BAIRRO)||'#39' '#39'||RTRIM(CD.NOME)||Decode(e.cep,'#39#39 +
        ','#39' '#39','#39' Cep:'#39')||RTRIM(E.CEP) ENDENTREGA'
      'FROM'
      'ENDPESS E, CIDADES CD'
      'WHERE '
      '(E.IDCIDADES = CD.IDCIDADES )'
      'AND '
      '(E.IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 571
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEnderecoEntregaENDENTREGA: TStringField
      DisplayLabel = 'Endereço Entrega'
      DisplayWidth = 70
      FieldName = 'ENDENTREGA'
      Size = 175
    end
    object qryEnderecoEntregaIDENDERECO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Visible = False
    end
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT P.NOME,P.FLGRESPONSAVEL,P.IDPESSOA,R.IDRESPONSAVEL'
      'FROM PESSOA P,RESPONSAVEL R'
      'WHERE ( R.IDRESPONSAVEL = P.IDPESSOA )'
      ''
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 417
    Top = 12
  end
  object qryEnderecoCobranca: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT E.IDENDERECO,'
      
        'RTRIM(E.LOGRADOURO)||'#39' '#39'||RTRIM(E.NUMERO)||'#39' '#39'||RTRIM(E.COMPLEME' +
        'NTO)||'#39' '#39'||RTRIM(E.BAIRRO)||'#39' '#39'||RTRIM(CD.NOME)||Decode(e.cep,'#39#39 +
        ','#39' '#39','#39' Cep:'#39')||RTRIM(E.CEP) ENDCOBRANCA'
      'FROM'
      'ENDPESS E, CIDADES CD'
      'WHERE'
      '(E.IDCIDADES = CD.IDCIDADES )'
      'AND'
      '(E.IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 571
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEnderecoCobrancaENDCOBRANCA: TStringField
      DisplayLabel = 'Endereço Cobrança'
      DisplayWidth = 70
      FieldName = 'ENDCOBRANCA'
      Size = 175
    end
    object qryEnderecoCobrancaIDENDERECO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Visible = False
    end
  end
  object qryEnderecoCorrespondencia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT E.IDENDERECO ,'
      
        'RTRIM(E.LOGRADOURO)||'#39' '#39'||RTRIM(E.NUMERO)||'#39' '#39'||RTRIM(E.COMPLEME' +
        'NTO)||'#39' '#39'||RTRIM(E.BAIRRO)||'#39' '#39'||RTRIM(CD.NOME)||Decode(e.cep,'#39#39 +
        ','#39' '#39','#39' Cep:'#39')||RTRIM(E.CEP) ENDCORRESP'
      'FROM'
      'ENDPESS E, CIDADES CD'
      'WHERE '
      '(E.IDCIDADES = CD.IDCIDADES )'
      'AND '
      '(E.IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 570
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEnderecoCorrespondenciaENDCORRESP: TStringField
      DisplayLabel = 'Endereço Correspondência'
      DisplayWidth = 70
      FieldName = 'ENDCORRESP'
      Size = 175
    end
    object qryEnderecoCorrespondenciaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'RADINSTPROCESSO')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'RESERVAORCAMEN.FLGRESCOMP = '#39'R'#39
      'RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO'
      
        '((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK IS NUL' +
        'L))')
    Mascaras.Strings = (
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
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 317
    Top = 4
  end
  object qryContratoUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOUSUARIO'
      '          (IDCONTRATO,IDUSUARIO)'
      'VALUES'
      '          (:IDCONTRATO,:IDUSUARIO)')
    ValidateWithMask = True
    Left = 577
    Top = 328
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryContratoUsuarioDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONTRATOUSUARIO'
      'WHERE IDCONTRATO = :IDCONTRATO')
    ValidateWithMask = True
    Left = 577
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryContratoOrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO CONTRATOORIG (IDCONTRATO,NOMECONTRATO,IDRESERVAORCAM' +
        'EN,'
      '                          IDTELEFONE,CODPORTFORMA,IDENDCOBRANCA,'
      
        '                          CODCENTRORESPON,IDPESSOA,IDENDCORRESPO' +
        'N,'
      '                          IDENDENTREGA,UNIDNEGOC,IDCONTATO,'
      '                          IDFORCLI,MOECODIGO,IDRESPONSAVEL,'
      
        '                          TIPOCONTRATO,DESCRICAOCONTRATO,DATAASS' +
        'INATURA,'
      
        '                          CODAUXCONTRATO,VALORBASECONTRATO,DATAB' +
        'ASECONTRATO,'
      
        '                          DATAPREVENCERRA,PRAZODENUNCIA,CODCONTR' +
        'ATOEMPR,'
      
        '                          FLGEMPENHO,DATAEFETENCERRA,MOTIVOENCER' +
        'RA,'
      '                          FLGFIMCONTRATO,CODTIPDOC,RENOVACAO,'
      '                          OBSERVACAO,AVISO,IDTIPOPROCESSORAD)'
      'SELECT'
      '   C.IDCONTRATO,C.NOMECONTRATO,C.IDRESERVAORCAMEN,'
      '   C.IDTELEFONE,C.CODPORTFORMA,C.IDENDCOBRANCA,'
      '   C.CODCENTRORESPON,C.IDPESSOA,C.IDENDCORRESPON,'
      '   C.IDENDENTREGA,C.UNIDNEGOC,C.IDCONTATO,'
      '   C.IDFORCLI,C.MOECODIGO,C.IDRESPONSAVEL,'
      '   C.TIPOCONTRATO,C.DESCRICAOCONTRATO,C.DATAASSINATURA,'
      '   C.CODAUXCONTRATO,C.VALORBASECONTRATO,C.DATABASECONTRATO,'
      '   C.DATAPREVENCERRA,C.PRAZODENUNCIA,C.CODCONTRATOEMPR,'
      '   C.FLGEMPENHO,C.DATAEFETENCERRA,C.MOTIVOENCERRA,'
      '   C.FLGFIMCONTRATO,C.CODTIPDOC,C.RENOVACAO,'
      '   C.OBSERVACAO,C.AVISO,C.IDTIPOPROCESSORAD'
      ''
      'FROM CONTRATOCONTR C'
      'WHERE IDCONTRATO=:IDCONTRATO'
      ' ')
    ValidateWithMask = True
    Left = 101
    Top = 52
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryObjxItOrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OBJXITORIG (IDCONTRATO,'
      '                        IDOBJETO,'
      '                        IDITEM,'
      '                        IDPROGRAMA,'
      '                        MOECODIGO,'
      '                        IDPLANOPREV,'
      '                        IDPATRO,'
      '                        IDPESSOA,'
      '                        QTDEITEM,'
      '                        CODMEDIDA,'
      '                        DATABASEITEM,'
      '                        VALORUNITARIOOBJETO,'
      '                        VALORTOTALOBJETO,'
      '                        TIPOTOLERANCIAOBJETO,'
      '                        TOLERANCIAMAISOBJETO,'
      '                        TOLERANCIAMENOSOBJETO,'
      '                        NUMPARCELAS,'
      '                        FREQUENCIA,'
      '                        INTERVALO,'
      '                        NUMMEDICOES,'
      '                        DATAINICIOCOBR,'
      '                        DATAULTGERACAO,'
      '                        DATAULTVENC,'
      '                        OBSERVACAO,'
      '                        TRGDTINCLUSAO,'
      '                        TRGUSERINCLUSAO)'
      ''
      '                        SELECT'
      '                           IDCONTRATO,'
      '                           IDOBJETO,'
      '                           IDITEM,'
      '                           IDPROGRAMA,'
      '                           MOECODIGO,'
      '                           IDPLANOPREV,'
      '                           IDPATRO,'
      '                           IDPESSOA,'
      '                           QTDEITEM,'
      '                           CODMEDIDA,'
      '                           DATABASEITEM,'
      '                           VALORUNITARIOOBJETO,'
      '                           VALORTOTALOBJETO,'
      '                           TIPOTOLERANCIAOBJETO,'
      '                           TOLERANCIAMAISOBJETO,'
      '                           TOLERANCIAMENOSOBJETO,'
      '                           NUMPARCELAS,'
      '                           FREQUENCIA,'
      '                           INTERVALO,'
      '                           NUMMEDICOES,'
      '                           DATAINICIOCOBR,'
      '                           DATAULTGERACAO,'
      '                           DATAULTVENC,'
      '                           OBSERVACAO,'
      '                           TRGDTINCLUSAO,'
      '                           TRGUSERINCLUSAO'
      '                        FROM'
      '                           OBJETOSXITEMCONTR'
      '                        WHERE'
      '                           IDCONTRATO=:IDCONTRATO'
      ''
      '')
    ValidateWithMask = True
    Left = 293
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end>
  end
  object qryRateioCCOrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RATEIOCCORIG  (IDCONTRATO,'
      '                           IDEMPRESA,'
      '                           IDOBJETO,'
      '                           CODCENTROCUSTO,'
      '                           IDITEM,'
      '                           PERCRATEIOCONTR,'
      '                           IDPROGRAMA)'
      ''
      '                           SELECT'
      '                              IDCONTRATO,'
      '                              IDEMPRESA,'
      '                              IDOBJETO,'
      '                              CODCENTROCUSTO,'
      '                              IDITEM,'
      '                              PERCRATEIOCONTR,'
      '                              IDPROGRAMA'
      '                           FROM'
      '                              RATEIOCENTROCUSTO'
      '                           WHERE'
      '                              IDCONTRATO=:IDCONTRATO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 293
    Top = 84
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object QryTiposProcRAD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOPROCESSO,'
      '   NOME'
      'FROM'
      '   RADTIPOPROCESSO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 57
    Top = 376
  end
end
