inherited frmEvolucaoContrato: TfrmEvolucaoContrato
  Left = 422
  Top = 208
  Caption = 'Relatório de Evolução de Contrato'
  ClientHeight = 130
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 504
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
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 332
      DockPos = 341
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 163
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
  object prEvolucaoContrato: TppReport
    AutoStop = False
    DataPipeline = ppEvolucaoContrato
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
    DataPipelineName = 'ppEvolucaoContrato'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Evolução de Contratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 111125
        mmTop = 14817
        mmWidth = 71967
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
        mmLeft = 81492
        mmTop = 7408
        mmWidth = 127794
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
        mmTop = 25135
        mmWidth = 9525
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 21431
        mmTop = 25135
        mmWidth = 9525
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'TipoEmp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 33867
        mmTop = 25135
        mmWidth = 10054
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Pl. Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 45244
        mmTop = 25135
        mmWidth = 11642
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
        mmLeft = 59267
        mmTop = 25135
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Dt. Atualiza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 74613
        mmTop = 25135
        mmWidth = 12435
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Item Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 90752
        mmTop = 25135
        mmWidth = 11642
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 25135
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Vl.Quit.Enc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 117475
        mmTop = 25135
        mmWidth = 12435
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Vl.Quit.Par'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 104246
        mmTop = 25135
        mmWidth = 11906
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Novo Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 142346
        mmTop = 25135
        mmWidth = 12435
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Parc. Rest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 25135
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Prox. Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 168275
        mmTop = 25135
        mmWidth = 11377
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Prox. Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 182563
        mmTop = 25135
        mmWidth = 11113
        BandType = 1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Seq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 194998
        mmTop = 25135
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Sal.Prox.Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 200555
        mmTop = 25135
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Prox. Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 214313
        mmTop = 25135
        mmWidth = 11377
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Prox. Prev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 226484
        mmTop = 25135
        mmWidth = 11113
        BandType = 1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Prox. Sal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 238919
        mmTop = 25135
        mmWidth = 9790
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Prox. TpSusp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 249767
        mmTop = 25135
        mmWidth = 14817
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28575
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
        mmLeft = 265907
        mmTop = 25135
        mmWidth = 4763
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Erro Prest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 271992
        mmTop = 25135
        mmWidth = 11007
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
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Contrato'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2879
        mmLeft = 794
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Sit'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2879
        mmLeft = 22490
        mmTop = 529
        mmWidth = 11641
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TipoEmp'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 34396
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DataAtualiza'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 75671
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DataPrevista'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 59796
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Item'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 91281
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VlQuitParc'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 104511
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'Saldo'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 131763
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VlQuitEnc'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 117740
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NovoSaldo'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 142082
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ProxSaldo'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 239184
        mmTop = 529
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ProxPrev'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 226484
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'ProxEnvio'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 213784
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'SaldoProxItem'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 201084
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'Seq'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 194998
        mmTop = 529
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ProxItem'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 182298
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'ProxData'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 168275
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'ParcRest'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 155840
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PlanoOrigem'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 45773
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ProxTpSusp'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 248180
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'Erro'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 2910
        mmLeft = 261673
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'ErroPrest'
        DataPipeline = ppEvolucaoContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppEvolucaoContrato'
        mmHeight = 6615
        mmLeft = 270934
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
    end
  end
  object ppEvolucaoContrato: TppBDEPipeline
    DataSource = dsDados
    UserName = 'ppEvolucaoContrato'
    Left = 325
    object ppEvolucaoContratoppField1: TppField
      FieldAlias = 'Contrato'
      FieldName = 'Contrato'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppEvolucaoContratoppField2: TppField
      FieldAlias = 'Sit'
      FieldName = 'Sit'
      FieldLength = 10
      DisplayFormat = 'Situação'
      DisplayWidth = 10
      Position = 1
    end
    object ppEvolucaoContratoppField3: TppField
      FieldAlias = 'TipoEmp'
      FieldName = 'TipoEmp'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppEvolucaoContratoppField4: TppField
      FieldAlias = 'PlanoOrigem'
      FieldName = 'PlanoOrigem'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppEvolucaoContratoppField5: TppField
      FieldAlias = 'DataPrevista'
      FieldName = 'DataPrevista'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppEvolucaoContratoppField6: TppField
      FieldAlias = 'DataAtualiza'
      FieldName = 'DataAtualiza'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppEvolucaoContratoppField7: TppField
      FieldAlias = 'Item'
      FieldName = 'Item'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppEvolucaoContratoppField8: TppField
      FieldAlias = 'VlQuitParc'
      FieldName = 'VlQuitParc'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppEvolucaoContratoppField9: TppField
      FieldAlias = 'VlQuitEnc'
      FieldName = 'VlQuitEnc'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppEvolucaoContratoppField10: TppField
      FieldAlias = 'Saldo'
      FieldName = 'Saldo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppEvolucaoContratoppField11: TppField
      FieldAlias = 'NovoSaldo'
      FieldName = 'NovoSaldo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppEvolucaoContratoppField12: TppField
      FieldAlias = 'ParcRest'
      FieldName = 'ParcRest'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppEvolucaoContratoppField13: TppField
      FieldAlias = 'ProxData'
      FieldName = 'ProxData'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppEvolucaoContratoppField14: TppField
      FieldAlias = 'ProxItem'
      FieldName = 'ProxItem'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppEvolucaoContratoppField15: TppField
      FieldAlias = 'Seq'
      FieldName = 'Seq'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppEvolucaoContratoppField16: TppField
      FieldAlias = 'SaldoProxItem'
      FieldName = 'SaldoProxItem'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppEvolucaoContratoppField17: TppField
      FieldAlias = 'ProxEnvio'
      FieldName = 'ProxEnvio'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppEvolucaoContratoppField18: TppField
      FieldAlias = 'ProxPrev'
      FieldName = 'ProxPrev'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppEvolucaoContratoppField19: TppField
      FieldAlias = 'ProxSaldo'
      FieldName = 'ProxSaldo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppEvolucaoContratoppField20: TppField
      FieldAlias = 'ProxEfet'
      FieldName = 'ProxEfet'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppEvolucaoContratoppField21: TppField
      FieldAlias = 'ProxQuit'
      FieldName = 'ProxQuit'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppEvolucaoContratoppField22: TppField
      FieldAlias = 'ProxTpSusp'
      FieldName = 'ProxTpSusp'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppEvolucaoContratoppField23: TppField
      FieldAlias = 'Erro'
      FieldName = 'Erro'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppEvolucaoContratoppField24: TppField
      FieldAlias = 'ErroPrest'
      FieldName = 'ErroPrest'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
  end
  object qryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                              '#39' Contrato, '
      
        '       '#39'                                                        ' +
        '                              '#39' Sit, '
      
        '       '#39'                                                        ' +
        '                              '#39' TipoEmp, '
      
        '       '#39'                                                        ' +
        '                              '#39' PlanoOrigem,'
      
        '       '#39'                                                        ' +
        '                              '#39' DataPrevista, '
      
        '       '#39'                                                        ' +
        '                              '#39' DataAtualiza,'
      
        '       '#39'                                                        ' +
        '                              '#39' Item, '
      
        '       '#39'                                                        ' +
        '                              '#39' VlQuitParc,'
      
        '       '#39'                                                        ' +
        '                              '#39' VlQuitEnc,'
      
        '       '#39'                                                        ' +
        '                              '#39' Saldo,'
      
        '       '#39'                                                        ' +
        '                              '#39' NovoSaldo,'
      
        '       '#39'                                                        ' +
        '                              '#39' ParcRest,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxData,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxItem,'
      
        '       '#39'                                                        ' +
        '                              '#39' Seq,'
      
        '       '#39'                                                        ' +
        '                              '#39' SaldoProxItem,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxEnvio,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxPrev,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxSaldo,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxEfet,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxQuit,'
      
        '       '#39'                                                        ' +
        '                              '#39' ProxTpSusp,'
      
        '       '#39'                                                        ' +
        '                              '#39' Erro,'
      
        '       '#39'                                                        ' +
        '                              '#39' ErroPrest FROM dual')
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
