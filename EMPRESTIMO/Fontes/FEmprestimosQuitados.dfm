inherited frmEmprestimosQuitados: TfrmEmprestimosQuitados
  Left = 354
  Top = 231
  Caption = 'Análise de Prestação Após Quitação'
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
  object prEmprestimosQuitados: TppReport
    AutoStop = False
    DataPipeline = ppEmprestimosQuitados
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
    DataPipelineName = 'ppEmprestimosQuitados'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 27252
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
        mmHeight = 5292
        mmLeft = 111919
        mmTop = 12171
        mmWidth = 72231
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25929
        mmWidth = 284300
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 82550
        mmTop = 4763
        mmWidth = 127794
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Estornar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 529
        mmTop = 22490
        mmWidth = 9260
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 11377
        mmTop = 22490
        mmWidth = 9525
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 31750
        mmTop = 22490
        mmWidth = 9525
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tipo Cont.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 41804
        mmTop = 22490
        mmWidth = 11377
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
        mmLeft = 53975
        mmTop = 22490
        mmWidth = 14023
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Saldo Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 71438
        mmTop = 22490
        mmWidth = 11377
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Saldo 35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 85725
        mmTop = 22490
        mmWidth = 10319
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Prox.13 Efet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 128323
        mmTop = 22490
        mmWidth = 14288
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Prox.13 Prev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 111125
        mmTop = 22490
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Dif.Na.Quit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 97631
        mmTop = 22490
        mmWidth = 12171
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Prox.13 Sal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 144463
        mmTop = 22490
        mmWidth = 13494
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Prox.13 Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 159544
        mmTop = 22490
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Prox. 13 Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 176477
        mmTop = 22490
        mmWidth = 15610
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Prox. 13 Abono'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 193675
        mmTop = 22490
        mmWidth = 16669
        BandType = 1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Erro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 259028
        mmTop = 22490
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Prox.13 Quit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 211667
        mmTop = 22490
        mmWidth = 13494
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Prox. 13 Est'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 227013
        mmTop = 22490
        mmWidth = 14288
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Prox. 13 Susp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 242623
        mmTop = 22490
        mmWidth = 15346
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Estornar'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 794
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IdContratoEmptmo'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 11113
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FlgSituacao'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 31750
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SaldoAnt'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 69586
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'HmeDataPrevista'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 53711
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Saldo35'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 83344
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DifNaQuit'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 96573
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ProxItem13Efet'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 128323
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ProxItem13Prev'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 111390
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ProxItem13Saldo'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 144727
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'sErro'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 259292
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'Prox13Suspensao'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 243153
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Prox13Estornado'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'Prox13Quitado'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 211932
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'Prox13Abonado'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 193940
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'Prox13Baixado'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 176213
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'Prox13Envio'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2910
        mmLeft = 160073
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'IdTipoContrEmptmo'
        DataPipeline = ppEmprestimosQuitados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmprestimosQuitados'
        mmHeight = 2879
        mmLeft = 41804
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
    end
  end
  object ppEmprestimosQuitados: TppBDEPipeline
    DataSource = dsDados
    UserName = 'EmprestimosQuitados'
    Left = 317
    object ppEmprestimosQuitadosppField1: TppField
      FieldAlias = 'Estornar'
      FieldName = 'Estornar'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppEmprestimosQuitadosppField2: TppField
      FieldAlias = 'IdContratoEmptmo'
      FieldName = 'IdContratoEmptmo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppEmprestimosQuitadosppField3: TppField
      FieldAlias = 'FlgSituacao'
      FieldName = 'FlgSituacao'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppEmprestimosQuitadosppField4: TppField
      FieldAlias = 'IdTipoContrEmptmo'
      FieldName = 'IdTipoContrEmptmo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppEmprestimosQuitadosppField5: TppField
      FieldAlias = 'HmeDataPrevista'
      FieldName = 'HmeDataPrevista'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppEmprestimosQuitadosppField6: TppField
      FieldAlias = 'SaldoAnt'
      FieldName = 'SaldoAnt'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppEmprestimosQuitadosppField7: TppField
      FieldAlias = 'Valor35'
      FieldName = 'Valor35'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppEmprestimosQuitadosppField8: TppField
      FieldAlias = 'Saldo35'
      FieldName = 'Saldo35'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppEmprestimosQuitadosppField9: TppField
      FieldAlias = 'DifNaQuit'
      FieldName = 'DifNaQuit'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppEmprestimosQuitadosppField10: TppField
      FieldAlias = 'ProxItem13Prev'
      FieldName = 'ProxItem13Prev'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppEmprestimosQuitadosppField11: TppField
      FieldAlias = 'ProxItem13Efet'
      FieldName = 'ProxItem13Efet'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppEmprestimosQuitadosppField12: TppField
      FieldAlias = 'ProxItem13Saldo'
      FieldName = 'ProxItem13Saldo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppEmprestimosQuitadosppField13: TppField
      FieldAlias = 'Prox13Envio'
      FieldName = 'Prox13Envio'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppEmprestimosQuitadosppField14: TppField
      FieldAlias = 'Prox13Baixado'
      FieldName = 'Prox13Baixado'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppEmprestimosQuitadosppField15: TppField
      FieldAlias = 'Prox13Abonado'
      FieldName = 'Prox13Abonado'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppEmprestimosQuitadosppField16: TppField
      FieldAlias = 'Prox13Quitado'
      FieldName = 'Prox13Quitado'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppEmprestimosQuitadosppField17: TppField
      FieldAlias = 'Prox13Estornado'
      FieldName = 'Prox13Estornado'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppEmprestimosQuitadosppField18: TppField
      FieldAlias = 'Prox13Suspensao'
      FieldName = 'Prox13Suspensao'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppEmprestimosQuitadosppField19: TppField
      FieldAlias = 'sErro'
      FieldName = 'sErro'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
  end
  object qryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                      '#39' Estornar, '
      
        '       '#39'                                                        ' +
        '                              '#39' IdContratoEmptmo, '
      
        '       '#39'                                                        ' +
        '                              '#39' FlgSituacao, '
      
        '       '#39'                                                        ' +
        '                              '#39' IdTipoContrEmptmo,'
      
        '       '#39'                                                        ' +
        '                              '#39' HmeDataPrevista, '
      
        '       '#39'                                                        ' +
        '                              '#39' SaldoAnt,'
      
        '       '#39'                                                        ' +
        '                              '#39' Valor35, '
      
        '       '#39'                                                        ' +
        '                              '#39' Saldo35,'
      
        '       '#39'                                                        ' +
        '                              '#39' DifNaQuit,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxItem13Prev,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxItem13Efet,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxItem13Saldo,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Envio,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Baixado,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Abonado,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Quitado,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Estornado,'
      
        '       '#39'                                                        ' +
        '                              '#39' Prox13Suspensao,'
      
        '       '#39'                                                        ' +
        '                              '#39' sErro FROM dual')
    UpdateObject = updDados
    ValidateWithMask = True
    Left = 130
    Top = 88
  end
  object updDados: TUpdateSQL
    Left = 188
    Top = 83
  end
end
