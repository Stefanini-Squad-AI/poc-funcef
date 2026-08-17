inherited cfgRelCartaReajuste: TcfgRelCartaReajuste
  Left = 88
  Top = 122
  HelpContext = 640009
  Caption = 'Emissão de Carta de Reajuste'
  ClientHeight = 352
  ClientWidth = 551
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 319
    object Label2: TLabel
      Left = 16
      Top = 237
      Width = 96
      Height = 13
      Caption = 'Utilizar o Modelo'
    end
    object Label7: TLabel
      Left = 339
      Top = 254
      Width = 168
      Height = 13
      Caption = 'Completar valor extenso com:'
    end
    object Label8: TLabel
      Left = 16
      Top = 267
      Width = 228
      Height = 13
      Caption = 'Modelo Word para impressão das cartas'
      Visible = False
    end
    object DBcboModeloCarta: TwwDBLookupCombo
      Left = 16
      Top = 251
      Width = 294
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MODELOCARTA'#9'60'#9'MODELOCARTA')
      LookupTable = qryTemplate
      LookupField = 'IDCARTACOBRANCA'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnCloseUp = DBcboModeloCartaCloseUp
    end
    object grpCabecalho: TGroupBox
      Left = 16
      Top = 158
      Width = 516
      Height = 65
      Caption = ' Cabeçalho da Carta '
      TabOrder = 2
      object Label1: TLabel
        Left = 30
        Top = 18
        Width = 47
        Height = 13
        Caption = '1ª Parte'
      end
      object Label5: TLabel
        Left = 206
        Top = 18
        Width = 101
        Height = 13
        Caption = 'Parte Incremental'
      end
      object Label6: TLabel
        Left = 334
        Top = 18
        Width = 46
        Height = 13
        Caption = '3ª parte'
      end
      object edtPrimeiraParte: TEdit
        Left = 30
        Top = 32
        Width = 153
        Height = 21
        TabOrder = 0
      end
      object edtTerceiraParte: TEdit
        Left = 334
        Top = 32
        Width = 153
        Height = 21
        TabOrder = 2
      end
      object edtIncremental: TRealEdit
        Left = 206
        Top = 32
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
    object edtCharCompleta: TEdit
      Left = 511
      Top = 251
      Width = 21
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 1
      ParentFont = False
      TabOrder = 3
      Text = '*'
    end
    object edtWord: TEdit
      Left = 16
      Top = 283
      Width = 468
      Height = 21
      Enabled = False
      TabOrder = 4
      Visible = False
      OnChange = edtWordChange
    end
    object BitBtn2: TBitBtn
      Left = 509
      Top = 283
      Width = 24
      Height = 22
      Hint = 'Limpa arquivo Word'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 485
      Top = 283
      Width = 24
      Height = 22
      Hint = 'Busca arquivo Word'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        6E020000424D6E02000000000000760000002800000036000000120000000100
        040000000000F801000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FFFFFFFFFFFF88888888888888888880088870000000000008888
        88777777777777F88887000000000000880088878888888888808888887F8888
        FFFF87F8888788888888888088008887FFFFFFFFFF808888887F8887777887F8
        8887FFFFFFFFFF8088008887FFFFF8888F808888887F8888888887F88887FFFF
        F8888F8088008887FFFFFFFFFF808888887F8FFFFFFF87F88887FFFFFFFFFF80
        88008887F88888888F80888888787777777887F88887F88888888F8088008887
        FFFFFFFFFF808888FFF8FF888FFFF7F88887FFFFFFFFFF8088008000700FF888
        8F808887778778F87777F7F88000700FF8888F80880080EE0EE0F88F8F808887
        F87F87F87887F7F880EE0EE0F88F8F80880080EE0EE0F88F8F808887F878878F
        7F87F7F880EE0EE0F88F8F80880080E0EE0E08FF8F808887F7FF7F78F77787F8
        80E0EE0E08FF8F80880080E00E00E0888F808887877F77878F8FF7F880E00E00
        E0888F8088000EEE0E0EEE0F0000887FFF7F7FFF7F7777880EEE0E0EEE0F0000
        880000000000000F7F088877777777777888788800000000000F7F0888008887
        FFFFFFFF70888888887F8888888788888887FFFFFFFF70888800888777777777
        7888888888777777777888888887777777777888880088888888888888888888
        888888888888888888888888888888888800}
      NumGlyphs = 3
    end
    object ChkVisualiza: TCheckBox
      Left = 16
      Top = 294
      Width = 257
      Height = 17
      Caption = 'Visualizar documento antes da impressão'
      Enabled = False
      TabOrder = 7
      Visible = False
    end
    object Panel1: TPanel
      Left = 4
      Top = 311
      Width = 553
      Height = 57
      TabOrder = 8
      Visible = False
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 67
        Height = 13
        Caption = 'Nº Contrato'
      end
      object Label4: TLabel
        Left = 136
        Top = 10
        Width = 103
        Height = 13
        Caption = 'Nome do Contrato'
      end
      object edtNumContrato: TEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNomeContrato: TEdit
        Left = 136
        Top = 24
        Width = 369
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object btnBuscaContrato: TBitBtn
        Left = 504
        Top = 24
        Width = 24
        Height = 22
        Hint = 'Busca um Contrato'
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object btnLimpaContrato: TBitBtn
        Left = 528
        Top = 24
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Contrato'
        TabOrder = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
    end
    object memReports: TMemo
      Left = 424
      Top = 296
      Width = 109
      Height = 21
      TabStop = False
      Color = clAqua
      Lines.Strings = (
        'memReports')
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 14
      Width = 516
      Height = 128
      Caption = 'Filtros'
      TabOrder = 9
      inline molContrato1: TmolContrato
        Left = 16
        Top = 18
        inherited Label2: TLabel
          Left = 0
          Top = 0
        end
        inherited edtContrato: TEdit
          Left = 0
          Top = 14
        end
        inherited btnBuscaContrato: TBitBtn
          Left = 320
          Top = 14
        end
        inherited btnLimpaContrato: TBitBtn
          Left = 344
          Top = 14
        end
      end
      object GroupBox2: TGroupBox
        Left = 256
        Top = 58
        Width = 242
        Height = 62
        Caption = 'Período de Reajuste'
        TabOrder = 1
        object Label10: TLabel
          Left = 10
          Top = 17
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label11: TLabel
          Left = 126
          Top = 17
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object edtDataIni: TCMDateTimePicker
          Left = 11
          Top = 31
          Width = 105
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
          OnCloseUp = edtDataIniCloseUp
        end
        object edtDataFim: TCMDateTimePicker
          Left = 126
          Top = 31
          Width = 105
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
          OnCloseUp = edtDataFimCloseUp
        end
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 58
        Width = 223
        Height = 62
        Caption = 'Reajuste'
        TabOrder = 2
        object lblMesVencimento: TLabel
          Left = 12
          Top = 17
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label9: TLabel
          Left = 156
          Top = 17
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cboMes: TComboBox
          Left = 10
          Top = 31
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cboMesChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object DBspnAno: TwwDBSpinEdit
          Left = 155
          Top = 31
          Width = 57
          Height = 21
          Increment = 1
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 319
    Width = 551
    inherited tb97Fundo: TToolbar97
      Left = 379
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object pplconsulta: TppBDEPipeline
    DataSource = dsSql
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lconsulta'
    Left = 457
    Top = 146
  end
  object rptImprime: TppReport
    AutoStop = False
    DataPipeline = pplconsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rptImprime'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 457
    Top = 135
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplconsulta'
    object RpImprimeHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dsSql: TwwDataSource
    DataSet = qrySql
    Left = 396
    Top = 180
  end
  object updSql: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  FLGUSUARIO = :FLGUSUARIO,'
      '  FLGCONTATO = :FLGCONTATO,'
      '  FLGCOTISTA = :FLGCOTISTA,'
      '  FLGCLIENTE = :FLGCLIENTE,'
      '  FLGPATROCINADORA = :FLGPATROCINADORA,'
      '  FLGADMINFUNDO = :FLGADMINFUNDO,'
      '  FLGADMINISTRADORA = :FLGADMINISTRADORA,'
      '  FLGEMPEMITETIT = :FLGEMPEMITETIT,'
      '  FLGBANCO = :FLGBANCO,'
      '  FLGBOLSA = :FLGBOLSA,'
      '  FLGAUTARQUIA = :FLGAUTARQUIA,'
      '  FLGSINDICATO = :FLGSINDICATO,'
      '  FLGOUTRO = :FLGOUTRO,'
      '  FLGRESPONSAVEL = :FLGRESPONSAVEL,'
      '  FLGTERCEIRO = :FLGTERCEIRO,'
      '  FLGFORNSERV = :FLGFORNSERV,'
      '  FLGFUNCIONARIO = :FLGFUNCIONARIO,'
      '  FLGINVALIDO = :FLGINVALIDO,'
      '  FLGCANDIDATO = :FLGCANDIDATO,'
      '  FLGESTRANGEIRO = :FLGESTRANGEIRO,'
      '  FLGGESTORFUNDO = :FLGGESTORFUNDO,'
      '  FLGAVALISTA = :FLGAVALISTA,'
      '  FLGPAGADOR = :FLGPAGADOR,'
      '  FLGPRODUTOR = :FLGPRODUTOR,'
      '  FLGAVERBADORA = :FLGAVERBADORA,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  EMAIL = :EMAIL,'
      '  FLGAGENCIA = :FLGAGENCIA,'
      '  FLGFUNDACAO = :FLGFUNDACAO,'
      '  FLGDEPENDENTE = :FLGDEPENDENTE,'
      '  FLGELEGIVEL = :FLGELEGIVEL,'
      '  FLGHOTEL = :FLGHOTEL,'
      '  FLGVENDEDOR = :FLGVENDEDOR,'
      '  FLGAGENCIAVIAGEM = :FLGAGENCIAVIAGEM,'
      '  FLGFILIALPESSOA = :FLGFILIALPESSOA,'
      '  FLGPROPRIETARIOUH = :FLGPROPRIETARIOUH,'
      '  FLGREPRESENTANTE = :FLGREPRESENTANTE,'
      '  SEQTRANSMISSAO = :SEQTRANSMISSAO,'
      '  FLGHOSPEDE = :FLGHOSPEDE,'
      '  FLGEMISSOR = :FLGEMISSOR,'
      '  FLGINSTFIN = :FLGINSTFIN,'
      '  FLGBOLSAVALORES = :FLGBOLSAVALORES,'
      '  FLGCORRETORAVALOR = :FLGCORRETORAVALOR,'
      '  FLGGESTORCARTEIRA = :FLGGESTORCARTEIRA,'
      '  FLGCUSTODIANTE = :FLGCUSTODIANTE,'
      '  FLGBENEFPROCUH = :FLGBENEFPROCUH,'
      '  FLGCANALREP = :FLGCANALREP,'
      '  FLGLOCATARIO = :FLGLOCATARIO,'
      '  FLGADMINIMOVEL = :FLGADMINIMOVEL,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGADMINISTRADORFUNDO = :FLGADMINISTRADORFUNDO,'
      '  FLGEMPRESAEMITENTETITULOS = :FLGEMPRESAEMITENTETITULOS,'
      '  FLGEMPEMITTIT = :FLGEMPEMITTIT,'
      '  FLGCANALREPRESENT = :FLGCANALREPRESENT,'
      '  FLGCONCIERGE = :FLGCONCIERGE,'
      '  FLGOPERADORMANUT = :FLGOPERADORMANUT,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  MASCARACC = :MASCARACC,'
      '  MASCARAAGENCIA = :MASCARAAGENCIA,'
      '  FLGVALIDACC = :FLGVALIDACC,'
      '  HOMEPAGE = :HOMEPAGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, IDGRUPO, IDIMAGEM, IDDOCUMENTO, NOME, TIPO, RAZAOSO' +
        'CIAL, FLGUSUARIO, '
      
        '   FLGCONTATO, FLGCOTISTA, FLGCLIENTE, FLGPATROCINADORA, FLGADMI' +
        'NFUNDO, '
      
        '   FLGADMINISTRADORA, FLGEMPEMITETIT, FLGBANCO, FLGBOLSA, FLGAUT' +
        'ARQUIA, '
      
        '   FLGSINDICATO, FLGOUTRO, FLGRESPONSAVEL, FLGTERCEIRO, FLGFORNS' +
        'ERV, FLGFUNCIONARIO, '
      
        '   FLGINVALIDO, FLGCANDIDATO, FLGESTRANGEIRO, FLGGESTORFUNDO, FL' +
        'GAVALISTA, '
      
        '   FLGPAGADOR, FLGPRODUTOR, FLGAVERBADORA, NUMDOCUMENTO, EMAIL, ' +
        'FLGAGENCIA, '
      
        '   FLGFUNDACAO, FLGDEPENDENTE, FLGELEGIVEL, FLGHOTEL, FLGVENDEDO' +
        'R, FLGAGENCIAVIAGEM, '
      
        '   FLGFILIALPESSOA, FLGPROPRIETARIOUH, FLGREPRESENTANTE, SEQTRAN' +
        'SMISSAO, '
      
        '   FLGHOSPEDE, FLGEMISSOR, FLGINSTFIN, FLGBOLSAVALORES, FLGCORRE' +
        'TORAVALOR, '
      
        '   FLGGESTORCARTEIRA, FLGCUSTODIANTE, FLGBENEFPROCUH, FLGCANALRE' +
        'P, FLGLOCATARIO, '
      
        '   FLGADMINIMOVEL, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGADMINISTRA' +
        'DORFUNDO, '
      
        '   FLGEMPRESAEMITENTETITULOS, FLGEMPEMITTIT, FLGCANALREPRESENT, ' +
        'FLGCONCIERGE, '
      
        '   FLGOPERADORMANUT, IDENDCORRESP, IDENDCOMERCIAL, IDENDENTREGA,' +
        ' IDENDRESIDENCIAL, '
      
        '   IDENDCOBRANCA, MASCARACC, MASCARAAGENCIA, FLGVALIDACC, HOMEPA' +
        'GE)'
      'values'
      
        '  (:IDPESSOA, :IDGRUPO, :IDIMAGEM, :IDDOCUMENTO, :NOME, :TIPO, :' +
        'RAZAOSOCIAL, '
      
        '   :FLGUSUARIO, :FLGCONTATO, :FLGCOTISTA, :FLGCLIENTE, :FLGPATRO' +
        'CINADORA, '
      
        '   :FLGADMINFUNDO, :FLGADMINISTRADORA, :FLGEMPEMITETIT, :FLGBANC' +
        'O, :FLGBOLSA, '
      
        '   :FLGAUTARQUIA, :FLGSINDICATO, :FLGOUTRO, :FLGRESPONSAVEL, :FL' +
        'GTERCEIRO, '
      
        '   :FLGFORNSERV, :FLGFUNCIONARIO, :FLGINVALIDO, :FLGCANDIDATO, :' +
        'FLGESTRANGEIRO, '
      
        '   :FLGGESTORFUNDO, :FLGAVALISTA, :FLGPAGADOR, :FLGPRODUTOR, :FL' +
        'GAVERBADORA, '
      
        '   :NUMDOCUMENTO, :EMAIL, :FLGAGENCIA, :FLGFUNDACAO, :FLGDEPENDE' +
        'NTE, :FLGELEGIVEL, '
      
        '   :FLGHOTEL, :FLGVENDEDOR, :FLGAGENCIAVIAGEM, :FLGFILIALPESSOA,' +
        ' :FLGPROPRIETARIOUH, '
      
        '   :FLGREPRESENTANTE, :SEQTRANSMISSAO, :FLGHOSPEDE, :FLGEMISSOR,' +
        ' :FLGINSTFIN, '
      
        '   :FLGBOLSAVALORES, :FLGCORRETORAVALOR, :FLGGESTORCARTEIRA, :FL' +
        'GCUSTODIANTE, '
      
        '   :FLGBENEFPROCUH, :FLGCANALREP, :FLGLOCATARIO, :FLGADMINIMOVEL' +
        ', :TRGDTINCLUSAO, '
      
        '   :TRGUSERINCLUSAO, :FLGADMINISTRADORFUNDO, :FLGEMPRESAEMITENTE' +
        'TITULOS, '
      
        '   :FLGEMPEMITTIT, :FLGCANALREPRESENT, :FLGCONCIERGE, :FLGOPERAD' +
        'ORMANUT, '
      
        '   :IDENDCORRESP, :IDENDCOMERCIAL, :IDENDENTREGA, :IDENDRESIDENC' +
        'IAL, :IDENDCOBRANCA, '
      '   :MASCARACC, :MASCARAAGENCIA, :FLGVALIDACC, :HOMEPAGE)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 413
    Top = 120
  end
  object ds: TwwDataSource
    DataSet = qryTemplate
    Left = 336
    Top = 241
  end
  object qryTemplate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   FLGTIPOCARTA = '#39'J'#39)
    ValidateWithMask = True
    Left = 302
    Top = 253
    object qryTemplateIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryTemplateMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryTemplateIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryTemplateORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryTemplateFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 369
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qrySql: TwwQuery
    CachedUpdates = True
    OnCalcFields = qrySqlCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   C.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO,'
      '   C.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      ''
      '   C.CONINDICEREAJUSTE,'
      '   C.CONPROXREAJUSTE,'
      '   C.CONDATAREAJUSTE,'
      '   C.CONPERREAJUSTE,'
      ''
      '   P.RAZAOSOCIAL AS RS_LOCATARIO,'
      '   CP.NOME AS NOME_CONTATO,'
      
        '   (E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO) AS ENDERE' +
        'CO,'
      ''
      '   M.MOESIGLA AS INDICE_REAJUSTE,'
      ''
      '   0 AS DIAS_MES,'
      '   0 AS DIAS_VLR_ANTERIOR,'
      '   0 AS DIAS_VLR_POSTERIOR,'
      '   0 AS VLR_DIAS_ANTERIOR,'
      '   0 AS VLR_DIAS_POSTERIOR,'
      '   0 AS VLR_TOTAL,'
      '   0 AS PERCENT_REAJUSTE_CALCULADO,'
      '   0 AS PERCENT_REAJUSTE_ACUMULADO,'
      ''
      '   '#39'        '#39' AS MES_REAJUSTE,'
      '   '#39'        '#39' AS MES_ULT_REAJUSTE,'
      '   '#39'        '#39' AS MES_REAJUSTE_MENOS_UM,'
      ''
      '   '#39'                                           '#39' AS CABECALHO'
      ''
      'FROM'
      '   PESSOA P, CONTRATOIMOVEL C,'
      '   ENDPESS E, MOEDA M,'
      ''
      '   ('
      '   SELECT'
      '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '   FROM'
      '      CONTATOPESS CXP,'
      '      ('
      '      SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '      FROM'
      '         CONTATOPESS'
      '      GROUP BY'
      '         IDENDERECO'
      '      ) CON'
      '   WHERE'
      '      ( CON.IDCONTATO = CXP.IDCONTATO )'
      '   ) CP'
      ''
      'WHERE ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '  AND ( C.IDLOCATARIO = P.IDPESSOA )'
      '  AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) )'
      '  AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '  AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      '  AND ( C.CONDATAREAJUSTE <> C.CONDATAINICIO )'
      ''
      '  AND'
      
        '  (  ( (:DATAINI IS NOT NULL) AND (C.CONDATAREAJUSTE >=:DATAINI)' +
        ' )'
      '  OR   (:DATAINI IS NULL) )'
      ''
      '  AND'
      
        '  (  ( (:DATAFIM IS NOT NULL) AND (C.CONDATAREAJUSTE <=:DATAFIM)' +
        ' )'
      '  OR   (:DATAFIM IS NULL) )'
      ''
      '  AND'
      
        '  (  ( (:CONTRATO IS NOT NULL) AND (C.IDCONTRATOIMOVEL =:CONTRAT' +
        'O) )'
      '  OR   (:CONTRATO IS NULL) )'
      ''
      'ORDER BY'
      '   C.CONNUMERO, C.CONNOME'
      ''
      ''
      ''
      '')
    UpdateObject = updSql
    ValidateWithMask = True
    Left = 348
    Top = 115
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qrySqlData_Atual: TStringField
      FieldKind = fkCalculated
      FieldName = 'Data_Atual'
      Size = 200
      Calculated = True
    end
    object qrySqlNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qrySqlNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qrySqlVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qrySqlVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qrySqlCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qrySqlCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object qrySqlCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qrySqlRS_LOCATARIO: TStringField
      FieldName = 'RS_LOCATARIO'
      Size = 60
    end
    object qrySqlNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qrySqlINDICE_REAJUSTE: TStringField
      FieldName = 'INDICE_REAJUSTE'
      Size = 10
    end
    object qrySqlDIAS_VLR_ANTERIOR: TFloatField
      FieldName = 'DIAS_VLR_ANTERIOR'
    end
    object qrySqlDIAS_VLR_POSTERIOR: TFloatField
      FieldName = 'DIAS_VLR_POSTERIOR'
    end
    object qrySqlPERCENT_REAJUSTE_CALCULADO: TFloatField
      FieldName = 'PERCENT_REAJUSTE_CALCULADO'
    end
    object qrySqlPERCENT_REAJUSTE_ACUMULADO: TFloatField
      FieldName = 'PERCENT_REAJUSTE_ACUMULADO'
    end
    object qrySqlMES_REAJUSTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'MES_REAJUSTE'
      Size = 8
      Calculated = True
    end
    object qrySqlMES_ULT_REAJUSTE: TStringField
      FieldName = 'MES_ULT_REAJUSTE'
      Size = 8
    end
    object qrySqlMES_REAJUSTE_MENOS_UM: TStringField
      FieldName = 'MES_REAJUSTE_MENOS_UM'
      Size = 8
    end
    object qrySqlVLR_DIAS_ANTERIOR: TFloatField
      FieldName = 'VLR_DIAS_ANTERIOR'
    end
    object qrySqlVLR_DIAS_POSTERIOR: TFloatField
      FieldName = 'VLR_DIAS_POSTERIOR'
    end
    object qrySqlDIAS_MES: TFloatField
      FieldName = 'DIAS_MES'
    end
    object qrySqlCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qrySqlVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object qrySqlValorExtenso: TStringField
      DisplayWidth = 400
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qrySqlValorExtensoTot: TStringField
      DisplayWidth = 400
      FieldKind = fkCalculated
      FieldName = 'ValorExtensoTot'
      Size = 200
      Calculated = True
    end
    object qrySqlENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qrySqlCABECALHO: TStringField
      FieldName = 'CABECALHO'
      FixedChar = True
      Size = 43
    end
  end
  object dlgWord: TOpenDialog
    Filter = 'Documentos Word|*.DOC'
    InitialDir = 'C:\CM'
    Left = 423
    Top = 253
  end
  object Extenso: TExtensoCM
    CaracterAdicional = '*'
    DescricaoMoeda.Singular = 'Real'
    DescricaoMoeda.Plural = 'Reais'
    TamanhoLinha = 200
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 461
    Top = 5
  end
end
