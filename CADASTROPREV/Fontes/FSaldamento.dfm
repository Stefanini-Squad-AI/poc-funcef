inherited FrmSaldamento: TFrmSaldamento
  Left = 430
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Formulário de Saldamento'
  ClientHeight = 324
  ClientWidth = 544
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    Height = 285
    BevelInner = bvLowered
    object LblTitulo: TfcLabel
      Left = 14
      Top = 7
      Width = 149
      Height = 36
      Anchors = [akLeft, akBottom]
      Caption = 'Saldamento '
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -29
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object LblRegistrosProcessados: TLabel
      Left = 12
      Top = 240
      Width = 133
      Height = 13
      Caption = 'Registos processados: '
      Visible = False
    end
    object LblErrosProcesso: TLabel
      Left = 12
      Top = 256
      Width = 117
      Height = 13
      Caption = 'Registros com erros:'
      Visible = False
    end
    object grpListaPessoas: TGroupBox
      Left = 12
      Top = 40
      Width = 520
      Height = 187
      Anchors = [akRight, akBottom]
      TabOrder = 0
      object lblListaPessoas: TLabel
        Left = 5
        Top = 15
        Width = 124
        Height = 13
        Caption = 'Mês e ano final do cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbtnListaPessoas: TSpeedButton
        Left = 467
        Top = 75
        Width = 23
        Height = 22
        Hint = 'Selecionar arquivo'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnListaPessoasClick
      end
      object Label1: TLabel
        Left = 5
        Top = 108
        Width = 303
        Height = 13
        Caption = '...ou informe os dados para processamento individual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 491
        Top = 75
        Width = 23
        Height = 22
        Hint = 'Apagar seleção'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FF8888888888888778888888888888F77F8888888888800F0888
          88888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF088
          888887788888F7F8888887FFFFFCF088888887F88888878F888887FFCCCFFF08
          8888878F88888F7F8888887FFFFFCF088888887F88888878F888887FCCC00FF0
          88888878F88778F78F888887FF0910FF08888887F87F878878F88887FF09910F
          F08888878F7F8878F78888887FC090307888888878F7F7F77F88888887FF0BB3
          08888888878F7F8878F88888887770BB30888888887777F8878F88888888880B
          B30888888888887F887888888888888888888888888888888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 5
        Top = 61
        Width = 413
        Height = 13
        Caption = 
          'Selecione o arquivo com as matrículas. Uma em cada linha do arqu' +
          'ivo...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 128
        Width = 46
        Height = 13
        Caption = 'Matricula '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 156
        Width = 51
        Height = 13
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 358
        Top = 107
        Width = 3
        Height = 67
      end
      object PnlNumParcelasRA: TPanel
        Left = 130
        Top = 120
        Width = 221
        Height = 58
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object Label5: TLabel
          Left = 61
          Top = 38
          Width = 96
          Height = 13
          Caption = 'Número de Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 61
          Top = 9
          Width = 56
          Height = 13
          Caption = 'Valor do BS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpEdtNumeroDeParcelas: TSpinEdit
          Left = 174
          Top = 33
          Width = 38
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          MaxValue = 10
          MinValue = 1
          ParentFont = False
          TabOrder = 1
          Value = 1
        end
        object EdValorBS: TRealEdit
          Left = 124
          Top = 5
          Width = 88
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object EdArquivoMatricula: TEdit
        Left = 5
        Top = 75
        Width = 460
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = EdArquivoMatriculaChange
      end
      object cmbMesCob: TComboBox
        Left = 5
        Top = 30
        Width = 107
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 114
        Top = 30
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2010
      end
      object ChBGerarDemonstrativo: TCheckBox
        Left = 368
        Top = 106
        Width = 132
        Height = 17
        Hint = 'Gera um de monstrativo do que foi processado'
        Caption = 'Gerar demonstrativo'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 7
      end
      object EdMatricula: TEdit
        Left = 63
        Top = 124
        Width = 106
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EdPercentual: TRealEdit
        Left = 63
        Top = 152
        Width = 55
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 5
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object ChBxGravarProcesso: TCheckBox
        Left = 368
        Top = 123
        Width = 132
        Height = 17
        Hint = 'Grava as alterações feitas pelo processo no Banco de Dados'
        Caption = 'Gravar processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object PnlAnoMesInicioAcerto: TPanel
        Left = 198
        Top = 13
        Width = 259
        Height = 44
        BevelOuter = bvNone
        TabOrder = 2
        object Label7: TLabel
          Left = 16
          Top = 1
          Width = 236
          Height = 13
          Caption = 'Mês e ano inicio do acerto (caso maior que a DIB)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cmbMesInicio: TComboBox
          Left = 16
          Top = 17
          Width = 107
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro')
        end
        object spedAnoInicio: TSpinEdit
          Left = 130
          Top = 16
          Width = 55
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 2001
        end
      end
      object ChBxDemonstrativoTecnico: TCheckBox
        Left = 368
        Top = 140
        Width = 132
        Height = 17
        Hint = 'Exibe demonstrativo técnico'
        Caption = 'Demonstrativo técnico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
    end
    object ChBxSomenteFinanceiro: TCheckBox
      Left = 389
      Top = 228
      Width = 143
      Height = 22
      Hint = 'Processar somente o acerto financeiro '
      Caption = 'Somente Financeiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ChBxSomenteDiferencaRA: TCheckBox
      Left = 389
      Top = 247
      Width = 143
      Height = 17
      Hint = 'Processar somente as diferenças entre Tábuas'
      Caption = 'Somente diferença de RA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ChBxSomenteBUA: TCheckBox
      Left = 389
      Top = 263
      Width = 143
      Height = 17
      Hint = 'Processar somente o BUA'
      Caption = 'Somente BUA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object BtnProcessar: TBitBtn
      Left = 203
      Top = 236
      Width = 137
      Height = 39
      Caption = 'Processar'
      TabOrder = 4
      OnClick = BtnProcessarClick
      Glyph.Data = {
        460A0000424D460A00000000000036000000280000001E0000001C0000000100
        180000000000100A0000130B0000130B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08F8D905B5D5D343632373A3560
        62617171757272727777777D7D7D8282828D8D8D90909191929460635F4E514B
        6C6E6AC0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0B5B5B57575754949496E6E6E7073703336333F4140282B2A3B3D3B5D60
        5C6565656565655D5D5D5555556969697F807E494E48292D29333534434643C0
        C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C059
        585835353539393930302F61646147484E726D82655F7740404A5C605F565555
        37363631302E2D2D29252422777875494C4C33303E7F788F63606D505251C0C0
        C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06064642B30
        2E393D3E241F276866689796A5EDE9FFE5E2FF807C88655F585A5A582A31304B
        53659495BA5D5F75797C7D7E7783AFA4D0F1F1FFCCC7F0A1A4BCC0C0C0C0C0C0
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BDBBC8AAA6C1D2CCE8
        9B98A58A8D8EA0A3B9D9DBFFCACBFF8A8FAC6B75787B7283717382C9C9F3D8D5
        FFDBD6FF94979A989F98D9D9FCE5EBFFD7D5FDC4C7CFC0C0C0C0C0C00000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DEDDE1D5CFEEF7EFFFC8C5E59D
        A1A6ADB2C6CCCFFFB3B4FF9592F08F8CE89A93E29695E5A1A1FC9E9CFFA8A8FF
        9D9EDE9C9ECFC0C4FCD6DAFFD2D0F4C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DEE6E7C5C7E7D0CFFECECFFAD0C8F5D5CD
        FDCEC9FECAC9FFBEBDFFB5B5FF9C9CFF9799FD9296FF9091FE989CFE9E9FFA9C
        93F89C9CFDA6A5FAC9C4FDC0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C1C3F4A2A0EDA5A1FCA19FF6AFADFDBFBFF8CFCFFCCDCDF8
        CFD0FACDCDFACECEF9CCCCFAC8C7FAC8C7FCCBC9FECDCEFCD0D1FEB6B8F89698
        FB8F92F7A29CFCC0C0C0C0C0C0C0C0C00000C0C0C0EEEEF9E4E4F7E2E0FEE2DF
        FFB0ADED928EFF908BFF989CFFAAB4FF9C9DFA9290FAABADFEC8CDFFC8CDF8CD
        CCFBD1C9FFC9CDFBCACBFDCAC6F9D0CEFDCAC9FDCDCCFBC8C9F99896FF9097FF
        9289FEBBC0E7C0C0C0C0C0C00000DBDCFCCBC7FFCACAFCCAD0FACDD2FFC0C4F8
        8384BC7C79ACB4B3DCD8D8FED7D1FFC3C3F9948EF8A5A4FECACCFDD0CCFDCCCE
        FDCDCAFFCDCBFFCDCBFFCCCAFFCDCBFFCBCAFFCCCCFFD1D2F9CBCDF8A79FF9A5
        A7FBC0C0C0C0C0C00000DDDBF3EBEAFED6D1F0F0F0FFE4E3F8D4CFF6E0E2FDAC
        ABD07477955F6579848AA5CCCFFAB0B1FF9492F6BEBBFDD2CFFEC6C7F9CDCBFF
        CDCBFFCDCBFFCDCBFFCDCBFFCBC9FECAC9FECCCCFCCED1FFC0BDFF9796F3C0C0
        C0C0C0C00000DCE2FFCED0FEC9CBFCD4D2FFCAC9FBDCDCFDF2EEFFDED7FFCEC9
        F9C4C3EDC5C4EDCACBF8C7CCFF9998FBAAA1FECECDF9CBCDFDCDCAFFCDCBFFCD
        CBFFCDCBFFCDCBFFCBC9FFCACAFFCCCBFBC9C9FACACEFEA5A3FCD5D5FCC0C0C0
        0000C0C0C0E0E3F9D9D6FED1CCFCD5D3F9ECEFFEF3F0FED0CEFBCECDFFCECDFF
        D0CAFFD0CBFAC6CFFD9EA0FDA197FED1D3FBC8C9FCCDCBFFCDCBFFCDCBFFCDCB
        FFCDCBFFCBCAFFC7C7FCCCCCFDCECDFECCD0FBB3B2FFCFCDF8C0C0C00000C0C0
        C0C0C0C0F7F6FEF2EEFFEFF0FFEDF0FFDCDFFDBFC6F8C0CCFDC9D3FFCAC8FBD1
        C9FCC6CFFB9FA4FD9E99FDCCCEFACCCAFBCDCBFFCCCAFFCCCAFFCCCAFFCCCAFF
        CBCBFFC7CBFDCACBFECDCAFECCCDFDBCBBFDCDCBF4C0C0C00000C0C0C0C0C0C0
        C0C0C0C0C6F0B2B4ECB2B5EBA6A8E8B6BDF0A8B4E1B8C3F4CBCCFED2CAFFC3C5
        FD9898F7AAA7FECBCFFCCBC8FCCCCBFECDCBFDCDCCFECECDFDD0CEFED0CEFECA
        CBFCCBCAFCCDC9FEC9CAFEC0C0FCCFCCF4C0C0C00000C0C0C0C0C0C0C0C0C0A5
        B0DFCBD5F65C617BADBBE7D5D7DB727A8AADB8E9CCCCFFCCD0FEADA9FA9D93FB
        BDBDFEC9CFFDCBC8FECBCCFBD1D0FCD6D4FED8D8FDDADAFDDCDBFEDDDBFFCECD
        F9CBC9FEC6C9F8BEBCFFD9D4FEC0C0C00000C0C0C0C0C0C0D2D0F3ADB9ECC9D8
        F469778E98A6D0D2D4EE9197BBBDC8F6CFCEFDC7C7F9A4A1ECB3B0FACACDFFC9
        CEF9CBC6FED6D6FED8D7FFDCDDFFDEDEFFDCDEFDDBDDFADDE0F5D2D6F6CDCDFE
        D0D3FEBAB9FCC0C0C0C0C0C00000C0C0C0F2EDFDCECAF8BCC1FAA0A8DEC6CCEC
        C0C6FAADA6E5C0BFF7C9CFFFCDCAF9CDCBFEC4C5FFCBCDFFC6CDF8CACCF5D3CF
        FEDCDFFFDBDCFEDBDCFDDBDCFCDFDFFCDEDDFEDCDBFED9D8FFCBC9FDCBCDFBBB
        BBFDC0C0C0C0C0C00000C0C0C0C0C0C0E3E4FBD9DFF9C0C0C0C0C0C0C0C0C0E5
        E7FECACEF6C8CCFACFCCFECAC8FECACCFEC8CDFDCACCFBCDCDFADDDAFEDBDCFE
        DADBFDDADCFDDCDBFBDBDBFADEDDFCDADBFAD9D8FFCFCBFFC8C8FDA5A0F1CCC7
        FCC0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D7DC
        F5C8C7FACCCAFFCBC7FECACEFBC7CCFAC7C7FED4D1FDD9DAF6DBDCFEDBDCFFDE
        DCFFDDDCFFDEDCFEDED9FDDCDCFCD8D8FEC9C9FBCACFF8C4C4FFA09CF1C0C0C0
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D2D2F8
        C1C5FDC8CCFFD0D3FED3D6FBD5D6FBDDDAFCDFDBFDDDDBFFDEDCFFDFDCFFDEDB
        FFDFDBFFDCDCFDD9DCFDD2D0FFCFCEFBC0C0C0C0C0C0ABA7FCC0C0C00000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D1D5FCC9
        CAFAD0D1FAD7D9FEDEE0FEDEE1FEDDDEFCDEE2FDD9DCFAD9DCFBDADBFED8D9FE
        D5D4FECCCAF9CFCEF5C0C0C0C0C0C0C0C0C0B5B0F6C0C0C00000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DBD9FAD2CC
        FBCEC9FED1CDFFD2D2FFD0D3FED2D2FFD2D3FFD0D0FFCDCCFEC9C9FCCBC8FADD
        D5FBC0C0C0C0C0C0C0C0C0C0C0C0CAC8F6C0C0C00000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DEDAFC
        D1CDFCCCCBFBC8CCF9CFC8FFCFCAFECDC9FCCFCEF7D8D8FEC0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000}
    end
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 376
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 451
    Top = 3
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object OpenDlg: TOpenDialog
    Title = 'Arquivo com Matrículas para Revisão'
    Left = 481
    Top = 3
  end
end
