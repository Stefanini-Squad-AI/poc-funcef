inherited FrmSaldoResidual: TFrmSaldoResidual
  Left = 369
  Top = 177
  Caption = 'Relatório de Saldo Residual'
  ClientHeight = 130
  ClientWidth = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 505
    Height = 91
    object GroupBox2: TGroupBox
      Left = 4
      Top = 3
      Width = 493
      Height = 86
      Caption = 'Indique o período de pesquisa'
      TabOrder = 0
      object Label3: TLabel
        Left = 13
        Top = 29
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label1: TLabel
        Left = 156
        Top = 29
        Width = 51
        Height = 13
        Caption = 'Data Fim'
      end
      object edtDataInicio: TCMDateTimePicker
        Left = 13
        Top = 44
        Width = 123
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object edtDataFim: TCMDateTimePicker
        Left = 155
        Top = 44
        Width = 123
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object chkGerarExcel: TCheckBox
        Left = 312
        Top = 48
        Width = 165
        Height = 17
        Caption = 'Gerar Relatório em Excel'
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 91
    Width = 505
    inherited tb97Fundo: TToolbar97
      Left = 333
      DockPos = 341
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 164
      DockPos = 172
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 128
    Top = 0
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 216
    Top = 0
  end
  object dsDados: TwwDataSource
    DataSet = qryDados
    Left = 79
    Top = 88
  end
  object qryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 18
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryConsultaCODRELATORIO: TFloatField
      FieldName = 'CODRELATORIO'
    end
    object qryConsultaNOMERELATORIO: TStringField
      FieldName = 'NOMERELATORIO'
      Size = 50
    end
    object qryConsultaTEXTO: TMemoField
      FieldName = 'TEXTO'
      BlobType = ftMemo
      Size = 3000
    end
    object qryConsultaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 25
    end
  end
  object prSaldoResidual: TppReport
    AutoStop = False
    DataPipeline = ppSaldoResidual
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 434
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppSaldoResidual'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 49477
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Empréstimos Quitados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 76915
        mmTop = 26723
        mmWidth = 72136
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'FUNDACAO DOS ECONOMIARIOS FEDERAIS FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 32544
        mmTop = 0
        mmWidth = 134409
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 44979
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 22490
        mmTop = 44979
        mmWidth = 19315
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Dt. Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 71967
        mmTop = 44979
        mmWidth = 14817
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 56092
        mmTop = 44979
        mmWidth = 6615
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 48419
        mmWidth = 284300
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Erro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 141817
        mmTop = 44979
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'DATA INÍCIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 0
        mmTop = 36513
        mmWidth = 14901
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'DATA FIM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 39688
        mmTop = 36513
        mmWidth = 11642
        BandType = 1
      end
      object ppDtInicio: TppLabel
        UserName = 'DtInicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2921
        mmLeft = 16140
        mmTop = 36513
        mmWidth = 15081
        BandType = 1
      end
      object ppDtFim: TppLabel
        UserName = 'DtFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 52652
        mmTop = 36513
        mmWidth = 16140
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'ASA NORTE, 0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 32279
        mmTop = 6879
        mmWidth = 21960
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label5'
        Caption = 'ASA NORTE - BRASILIA TI (RESTR CONC) - DF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 11642
        mmWidth = 62706
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = '70712900'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 32279
        mmTop = 16140
        mmWidth = 13494
        BandType = 1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765AE0B0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080064006703012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7ED
          EBEB46F5F5A828A009F7AFAD1B87AD41450058AE17C71F1374CF06C8967E53DE
          6A2EBBBC88DB0107AB1EDFAD768AC41AF95BE24C3750FC44D685D6EDCF705E3D
          DFDC3F771F856F87A6A72B4868F5EF0B7C68D2F5CD4A1D3F50B4934F9A66DB1C
          85C3465BB027A827E98F7AF50ED5F14C6934B2A476F933BB05882F5DD9E3F5AF
          B2ACCCA9A7DB24B9F3042A1F3EB819AAC4528C1AE5EA0CB9B80EF46F5F5A828A
          E6113EF5F5A37AFAD4145004FBD7D68A828A009B6AF7028DABE829B3A1920911
          4E0B2903F2AF9F9FE0C78C9A4661A8C38249FF008F87FF001AD29C232DE5603E
          8228A7B547B4E7A57CFF00FF000A63C65FF41283FF00025FFC690FC18F188EBA
          8C3FF810DFE35A7B187F381F40E0FA1AE6FC51E04D0FC5E13FB4E0759E3C04B8
          85B6C807A670411F515E0BE26F00F8ABC2B642FAF2579AD33B5E582766087FDA
          F41EF5B1F0D7E24EA7A56B369A4EA774F73A65C388D4CA72D013D083E9EA2AFD
          8492E7A72B8EC7A8F87BE15786FC357F1DF4293DD5D2728D72E1821F50001CFD
          735DAE0FA1AF26F8B9F112F745BA4D0B459FC9B931EFB8B85FBD1E7A2AFA1EE7
          EA2BCB3C37E1CF1278D2F261A74D3B84399AE259C84527B139EB495294E3CF36
          07D5983E86A4540073CD7CF3FF000A67C6271FF13187FF00021BFC69DFF0A5FC
          65FF0041283FF025FF00C6A7D8C3F9C47D0BB57D2930BE82BE7BFF008531E32F
          FA0943FF00812FFE35ED3E0DD22EB42F09586997D2092EA042AEE18B67E627A9
          FAD4548462B495C0DDDABE9452D1590051499C0AADFDA5623FE5F2DFFEFE8FF1
          A8954843E2761A8B7B220D4757B6D376098B176E8ABC9A960BA8AF2049E16CA3
          7E9599A9E970EB4EB35B5D465D46D3821811F854F66969A4DB2DABDD44187CCD
          B9C039FA579F4EBE23EB32F69654BA3B9D12853F64B96FCDD5195F10BFE441D6
          BFEBDCFF00315F2C5A122F2DC83CF9A9FF00A157D43E3DBCB69BC09ACA477313
          B9B73855704F515F2F5AFF00C7DDBFFD754FE62BE870538CA0DC5DCC2CD6E75F
          F163FE4A76B3FEF45FFA252BD2FE057FC8A57DFF005F7FD2BCD3E2CFFC94ED67
          FDE8BFF44A57A37C0FB982DFC257BE74D1C79BB38DEC0678A75E4A3874E4ECB4
          0B5F63D5CB04CB31C28E49AA569AFD9DE5D7D9E3660C73B4B0C06FA539EEEC6E
          11A1377010E30409066B36D3C3D1E9F762EA7BA4F2A3394CF1F99AF9DC4E2311
          ED61F57B38FDA77DBF137A74E9F2CBDA5D3E874B4554FED3B1FF009FDB6FFBFA
          BFE353C72A4B1878DC3A9E8CA720D7A11AB09BB45A660E325BA24A28A2AC90C6
          6B3FFB1B4EFF009F38BFEF9ABE585377FB5673A34EA7C714FD51519CA3F0BB1C
          6C44E9DE22962B63B1391B7AF6A5D06D61BE9AE25BA512B0C11BB9EB4975FF00
          233CFF0053FCAA7F0B1E6EBE8BFD6BE430918CB1D1A52578A94F4E9B763D8AAD
          AA0E6B7B4752AF8E74FB483C0BACCB0DBA238B738651F4AF98ED7FE3EEDFFEBA
          A7F315F52FC4039F00EB5FF5EE7FA57CB56BFF001F76FF00F5D53F98AFD03034
          E14E9B5056478EE4E5AC9DCEBFE2CFFC94ED67FDE8BFF44A57A27C12B3B7BBF0
          95E79F12BEDBB38DC3A715E75F163FE4A76B5FEF45FF00A292BD2FE05363C257
          DFF5F67F953C44233C3A8C95D6809B5AA3B3D734CB4834D3341004756182B593
          79753CDA758C4F2314C1FC79EF5D0F88483A3487BEE5AE627FF8F5B2FA37F315
          F9FE73154B1138D3564E2AF6FF0011EBE0DB9D34E5AEAFF23B18B44D396251F6
          58CF1D48C9ABD0C31DBC4B1C481117A2814B1B0F2D7E94BBBDABEB2950A54F58
          452F4479329CA5F13B812734504807A515B1022AE68231C5397A1A6B7DEA6071
          D73FF233CFF56FE553785FADCFD17FAD6CB6896D25F3DE3349E637500F1D292D
          34B874D67F259CEF033B8D7CE61B2CAF4F18AB4AD6E693DFBEC7A353134E545C
          16F65F818DE3EFF910B5AFFAF73FD2BE5BB5FF008FBB7FFAEA9FCC57D77ABE93
          0EB9A3DDE99712491C3729B19E3C6E03DB2315E7B17C0BF0FC7346C356D58946
          0C3262EC73FDCAFAEC3D58C22D48F3D1E69F163FE4A76B5FEF45FF00A292BD2B
          E067FC8A37DFF5F67F956A7893E11E8FE26F105D6B175A8EA314D73B4BA44536
          8C285E32A4FF000FAD6E784BC2167E0CD365B1B1B8B8B88E593CD2D3EDC838FF
          00640A275A0E9282DC2E5CF107FC8224FF00796B9B9FFE3D2CBE8DFCC5765756
          71DFC06DE4242920FCBD6AABF872D1A3890BCB88F20723D7E95F259AE5B5F135
          9CE9DAD64B7F3B9DF85C4D3A7051977FD0D641F228F615205C1CD3506303D062
          A4AFA15B1E78C6FBC68A0FDE3453011C9485C8E0804D78068BE29F1BF88F53D4
          6083C59A7D82DB4871F6E2B1860588017E539C62BDFE61985C0E7E535E0BF0CF
          C1B63ADEBBAF2EBBA5BC891B8687CD05472CD9C74CF6ADE8B8A8C9B1A35FC69E
          22F167857C17A24ADAE41717F7172E25BAB501D244C65704A8E9F4AD6F1FF89B
          58D1FE1B691AB58DE3437B3883CC94283BB7264F6A6FC54F054D75E08D3ADB41
          B52C9A549B96D939263DA410BEA466B85F11789356F17F84B49F0C5AF86AFA3B
          980C61A42A4872ABB46DF4F7CD694D29A8B5DF50367C57E38F11E9BE0BF0BDFD
          A6A2D15CDEC2ED712040779078EDC54DE24F899A85D7C3BD3359D1AEBEC97C6E
          3C8BC555076B85CE39EC7A8AA9F11F40BCD3BC3BE0FD3A38649E4B546597CB5D
          DB5BE52738FC6B07E24781EF740D4F7E976F33E937E3CD58A252C23931CA903F
          4AD211A6F96FE60775E2DF885AAE91A1F872CB4D0B2EB3AA59C1234AEBD0B050
          081EA5B3EC29D6973F13742F105947AA4716B16574479DE42F100C8CFCDC608F
          C73EB58BE37F0E6AC961E10F13585A4971F60B0B64B88541DCBB30C323D0E48A
          D31F107C5DE27D72C6D3C39A24DA7C79CDD3DE461971EA4E3803F3ACD4572FBA
          975B819DE28F1678A13E255DE85A7F882DF4DB61B763DD155893E504E5B06BA3
          F0D5CF8A231AADCEA1E2FD1F57861B095923B09848D1CA3055880A38E0FE75C1
          78D6010FC5ABEBCBED12E353B01B37431A9024F907435D3F84353D227FED8B2D
          27C1B75A43CDA7CA5E776C86C0E17EBCD54A2B9159745D80C2F0CF893C75E278
          2E6587C61A6D8881C47B6F99632D919CAFCA722BDC7424BE8F44B44D4AEA2BAB
          C118F36787EE39F51C0E2BC6BE12F81F4CD6F4ED524D7F4967922B85588CC194
          EDDBCE3F1AF71B7B78ED6DA2B78542C5120445F450302B1C438F372C418F6049
          CD14FA2B9C41451450018A6B0CFAD1450037601DCFE74A1403DE8A2801594673
          D3E94D2A0F527F3A28A0055500F534FA28A0028A28A0028A28A00FFFD9}
        mmHeight = 26458
        mmLeft = 794
        mmTop = 265
        mmWidth = 27252
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Dt. Quitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 91281
        mmTop = 44979
        mmWidth = 13716
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Valor Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 110331
        mmTop = 44979
        mmWidth = 14817
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Valor FGQC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 125942
        mmTop = 44979
        mmWidth = 13631
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Contrato'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2879
        mmLeft = 0
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TIPOCONTRATO'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 22490
        mmTop = 529
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DataPrevista'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 71967
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'Erro'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 3440
        mmLeft = 141817
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SALDO'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 56356
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAQUITACAO'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 91281
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRPARCELA'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 110596
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRFGQC'
        DataPipeline = ppSaldoResidual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSaldoResidual'
        mmHeight = 2910
        mmLeft = 126207
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 49477
        BandType = 8
      end
      object ppLabel162: TppLabel
        UserName = 'ppLabel162'
        AutoSize = False
        Caption = 'Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 49742
        mmTop = 3175
        mmWidth = 94986
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144727
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppSaldoResidual: TppBDEPipeline
    DataSource = dsDados
    UserName = 'SaldoResidual'
    Left = 325
    object ppSaldoResidualppField1: TppField
      FieldAlias = 'CONTRATO'
      FieldName = 'CONTRATO'
      FieldLength = 86
      DisplayWidth = 86
      Position = 0
    end
    object ppSaldoResidualppField2: TppField
      FieldAlias = 'TIPOCONTRATO'
      FieldName = 'TIPOCONTRATO'
      FieldLength = 86
      DisplayWidth = 86
      Position = 1
    end
    object ppSaldoResidualppField3: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 86
      DisplayWidth = 86
      Position = 2
    end
    object ppSaldoResidualppField4: TppField
      FieldAlias = 'DATAPREVISTA'
      FieldName = 'DATAPREVISTA'
      FieldLength = 86
      DisplayWidth = 86
      Position = 3
    end
    object ppSaldoResidualppField6: TppField
      FieldAlias = 'DATAQUITACAO'
      FieldName = 'DATAQUITACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppSaldoResidualppField7: TppField
      FieldAlias = 'VLRPARCELA'
      FieldName = 'VLRPARCELA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppSaldoResidualppField8: TppField
      FieldAlias = 'VLRFGQC'
      FieldName = 'VLRFGQC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppSaldoResidualppField5: TppField
      FieldAlias = 'ERRO'
      FieldName = 'ERRO'
      FieldLength = 86
      DisplayWidth = 86
      Position = 7
    end
  end
  object qryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                              '#39' CONTRATO,'
      
        '       '#39'                                                        ' +
        '                              '#39' TIPOCONTRATO,'
      
        '       '#39'                                                        ' +
        '                              '#39' SALDO,'
      
        '       '#39'                                                        ' +
        '                              '#39' DATAPREVISTA,'
      
        '       '#39'                                                        ' +
        '                              '#39' DATAQUITACAO,  '
      
        '       '#39'                                                        ' +
        '                              '#39' VLRPARCELA,'
      
        '       '#39'                                                        ' +
        '                              '#39' VLRFGQC,'
      
        '       '#39'                                                        ' +
        '                              '#39' ERRO FROM dual'
      ''
      ''
      '')
    UpdateObject = updDados
    ValidateWithMask = True
    Left = 130
    Top = 88
  end
  object updDados: TUpdateSQL
    Left = 180
    Top = 91
  end
end
