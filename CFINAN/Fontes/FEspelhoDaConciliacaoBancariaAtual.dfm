object frmEspelhoDaConciliacaoBancariaAtual: TfrmEspelhoDaConciliacaoBancariaAtual
  Left = 317
  Top = 93
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impressão do Relatório da Conciliação Bancária'
  ClientHeight = 55
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDadosFiltro: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 58
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 0
    object Label4: TLabel
      Left = 12
      Top = 5
      Width = 102
      Height = 13
      Caption = 'Data Conciliação:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 136
      Top = 5
      Width = 80
      Height = 13
      Caption = 'Banco/Conta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object spbImprimir: TSpeedButton
      Left = 464
      Top = 17
      Width = 96
      Height = 26
      Cursor = crHandPoint
      Hint = 'Confirma a Impressão do Relatório da Conciliação Bancária'
      Caption = '&Confirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        9E050000424D9E05000000000000360400002800000014000000120000000100
        08000000000068010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
        A400FFFF80008080400000FF80000040400080FFFF000080FF008080FF000040
        8000FF00800040008000FF804000804000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707040407070707070707070707070707070707070402020407
        0707070707070707070707070707040202020204070707070707070707070707
        070402020202020204070707070707070707070704020202FA02020202040707
        0707070707070707020202FA07FA0202020407070707070707070707FA02FA07
        0707FA0202020407070707070707070707FA0707070707FA0202020407070707
        070707070707070707070707FA02020204070707070707070707070707070707
        07FA0202020407070707070707070707070707070707FA020202040707070707
        0707070707070707070707FA0202020407070707070707070707070707070707
        FA0202040707070707070707070707070707070707FA02020707070707070707
        07070707070707070707FA070707070707070707070707070707070707070707
        0707}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 15
      OnClick = spbImprimirClick
    end
    object spbSair: TSpeedButton
      Left = 573
      Top = 17
      Width = 41
      Height = 26
      Cursor = crHandPoint
      Hint = 'Sair'
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0000000000000
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
        C0C0C0C0C0C000000000FFFF000000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C00000000000000000
        0000FFFF000000000000000000000000000000000000000000000000C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00000084
        8284848284848284000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000C0C0C0C0C0C0C0C0C000000000FFFF00FFFF000000848284848284848284
        000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
        C0C0C000000000FFFF00FFFF000000848284848284848284000000C0C0C0C0C0
        C0C0C0C0000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C000000000FF
        FF00FFFF000000848284848284848284000000C0C0C0C0C0C0000000000000C0
        C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00000084
        8284848284848284000000C0C0C0000000000000000000000000000000C0C0C0
        0000C0C0C0C0C0C0C0C0C000000000FFFF00FFFF000000848284848284848284
        000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
        C0C0C000000000FFFF00FFFF000000848284848284848284000000C0C0C0C0C0
        C0C0C0C0000000C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C00000000000
        00000000848284848284848284848284000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C000000000000084828484828484
        8284848284848284000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000C0C0C0C0C0C0C0C0C0000000000000000000000000000000000000000000
        000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 10
      OnClick = spbSairClick
    end
    object dblkpBanco: TwwDBLookupCombo
      Left = 138
      Top = 21
      Width = 313
      Height = 21
      Cursor = crHandPoint
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Nome do Banco/Conta Corrente'#9'F')
      LookupTable = qryLkpBanco
      LookupField = 'CODPORTADOR'
      Color = clSilver
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dtDiaExtrato: TCMDateTimePicker
      Left = 13
      Top = 21
      Width = 108
      Height = 21
      TabStop = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clSilver
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
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ShowButton = True
      TabOrder = 0
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
  object qryLkpBanco: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT B.NUMBANCO, C.NOCONTACORR, C.DESCRICAO, C.CODPORTADOR'
      'FROM BANCO B, PORTADORCONTA C'
      'WHERE B.IDPESSOA = C.IDBANCO  AND'
      '     (C.FLGSTATUS = '#39'A'#39' OR C.FLGSTATUS is null)'
      'ORDER BY C.NOCONTACORR, C.CODPORTADOR, C.DESCRICAO'
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
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 520
    Top = 75
    object qryLkpBancoDESCRICAO: TStringField
      DisplayLabel = 'Nome do Banco/Conta Corrente'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORCONTA.DESCRICAO'
      Size = 50
    end
    object qryLkpBancoNUMBANCO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryLkpBancoNOCONTACORR: TStringField
      DisplayWidth = 15
      FieldName = 'NOCONTACORR'
      Origin = 'BASEDADOS.PORTADORCONTA.NOCONTACORR'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryLkpBancoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.PORTADORCONTA.CODPORTADOR'
      Visible = False
    end
  end
  object dsLkpBanco: TwwDataSource
    DataSet = qryLkpBanco
    Left = 516
    Top = 141
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 383
    Top = 3
  end
  object relEspelhoMov: TppReport
    AutoStop = False
    DataPipeline = ppBDEMovimento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório da Conciliação Bancária'
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
    Template.FileName = 'C:\ProjetosCM5\CFINAN\Fontes\relEspelhoMov.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BackgroundPrintSettings.Enabled = True
    DeviceType = 'Screen'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 245
    Top = 9
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEMovimento'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Relatório da Conciliação Bancária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 13229
        mmWidth = 284163
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppEmpresa'
        mmHeight = 20902
        mmLeft = 2117
        mmTop = 1852
        mmWidth = 20108
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMEEMPRESA'
        DataPipeline = ppEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmpresa'
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 256911
        mmTop = 24606
        mmWidth = 27517
        BandType = 1
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 265
        mmLeft = 0
        mmTop = 28840
        mmWidth = 284300
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 242094
        mmTop = 24606
        mmWidth = 14023
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5556
        mmTop = 24342
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label701'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 267759
        mmTop = 24342
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 41540
        mmTop = 24342
        mmWidth = 15081
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 10319
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Saldo Final do Extrato Planus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 10848
        mmWidth = 53446
        BandType = 0
      end
      object ppDBSaldoMovimFinanc: TppDBText
        UserName = 'DBSaldoMovimFinanc'
        BlankWhenZero = True
        DataField = 'SALDOMOVFINANC'
        DataPipeline = ppBDESaldoMovimFinanc
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDESaldoMovimFinanc'
        mmHeight = 4233
        mmLeft = 243682
        mmTop = 10848
        mmWidth = 39952
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Movimento não Conciliado:'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3683
        mmLeft = 529
        mmTop = 17727
        mmWidth = 41571
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'Data Conciliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 2381
        mmWidth = 29633
        BandType = 0
      end
      object pplblDataConc: TppLabel
        UserName = 'lblDataConc'
        Caption = 'lblDataConc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 2381
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Conta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157427
        mmTop = 2381
        mmWidth = 11113
        BandType = 0
      end
      object pplblConta: TppLabel
        UserName = 'lblConta'
        AutoSize = False
        Caption = 'lblConta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 2381
        mmWidth = 114565
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATALANCFINAN'
        DataPipeline = ppBDEMovimento
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovimento'
        mmHeight = 3260
        mmLeft = 5556
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALORLANCFINAN'
        DataPipeline = ppBDEMovimento
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovimento'
        mmHeight = 3260
        mmLeft = 243946
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HISTORICO'
        DataPipeline = ppBDEMovimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovimento'
        mmHeight = 3175
        mmLeft = 41804
        mmTop = 794
        mmWidth = 180975
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Relatório da Conciliação Bancária / CFINAN'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 529
        mmTop = 1058
        mmWidth = 55626
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 269346
        mmTop = 1058
        mmWidth = 6085
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '/'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 276226
        mmTop = 1058
        mmWidth = 794
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 277813
        mmTop = 1058
        mmWidth = 6085
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 75406
      mmPrintPosition = 0
      object ppSubRepBloqCheques: TppSubReport
        UserName = 'SubRepBloqCheques'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppBDEBloqCheques'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 41275
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEBloqCheques
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Conciliação'
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
          Units = utMillimeters
          Left = 552
          Top = 316
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEBloqCheques'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppShape33: TppShape
              UserName = 'Shape33'
              Brush.Color = clBtnFace
              ParentWidth = True
              mmHeight = 265
              mmLeft = 0
              mmTop = 11906
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel62: TppLabel
              UserName = 'Label62'
              AutoSize = False
              Caption = 'Cheques e Outros Bloqueios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 1058
              mmWidth = 64029
              BandType = 1
            end
            object ppLabel63: TppLabel
              UserName = 'Label63'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 6350
              mmTop = 7938
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              AutoSize = False
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 267759
              mmTop = 7938
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel74: TppLabel
              UserName = 'Label74'
              AutoSize = False
              Caption = 'Data Disponib.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 222780
              mmTop = 7938
              mmWidth = 21960
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 25400
              mmTop = 7938
              mmWidth = 31221
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'DATALANCFINAN'
              DataPipeline = ppBDEBloqCheques
              DisplayFormat = 'DD/MM/YYYY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqCheques'
              mmHeight = 3175
              mmLeft = 6085
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'HISTORICO'
              DataPipeline = ppBDEBloqCheques
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEBloqCheques'
              mmHeight = 3175
              mmLeft = 25665
              mmTop = 529
              mmWidth = 183621
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText201'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEBloqCheques
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqCheques'
              mmHeight = 3175
              mmLeft = 251355
              mmTop = 265
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'DATADISPFINANC'
              DataPipeline = ppBDEBloqCheques
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqCheques'
              mmHeight = 3175
              mmLeft = 222780
              mmTop = 265
              mmWidth = 21960
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = 'Sub-Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 227278
              mmTop = 529
              mmWidth = 19050
              BandType = 7
            end
            object ppDBTotCheque: TppDBCalc
              UserName = 'DBTotCheque'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEBloqCheques
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqCheques'
              mmHeight = 3440
              mmLeft = 251355
              mmTop = 529
              mmWidth = 29369
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppSubRepBloqJud: TppSubReport
        UserName = 'SubRepBloqJud'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubRepBloqOutros
        TraverseAllData = False
        DataPipelineName = 'ppBDEBloqJud'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 54504
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEBloqJud
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Conciliação'
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
          Units = utMillimeters
          Left = 652
          Top = 416
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEBloqJud'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppLabel85: TppLabel
              UserName = 'Label85'
              AutoSize = False
              Caption = 'Bloqueios JUDICIAIS:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 1058
              mmWidth = 40746
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 6350
              mmTop = 7938
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label702'
              AutoSize = False
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 267759
              mmTop = 7938
              mmWidth = 12171
              BandType = 1
            end
            object ppShape2: TppShape
              UserName = 'Shape2'
              Brush.Color = clBtnFace
              ParentWidth = True
              mmHeight = 265
              mmLeft = 0
              mmTop = 11906
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 25400
              mmTop = 7938
              mmWidth = 38365
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              AutoSize = False
              Caption = 'Data Disponib.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 222780
              mmTop = 7938
              mmWidth = 21960
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'DATALANCTO'
              DataPipeline = ppBDEBloqJud
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqJud'
              mmHeight = 3175
              mmLeft = 6085
              mmTop = 529
              mmWidth = 16140
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VALORLANCTO'
              DataPipeline = ppBDEBloqJud
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqJud'
              mmHeight = 3175
              mmLeft = 250561
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText1'
              DataField = 'HISTORICO'
              DataPipeline = ppBDEBloqJud
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqJud'
              mmHeight = 3175
              mmLeft = 25665
              mmTop = 529
              mmWidth = 183621
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'DATADISPONIB'
              DataPipeline = ppBDEBloqJud
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqJud'
              mmHeight = 3175
              mmLeft = 223309
              mmTop = 265
              mmWidth = 21960
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Sub-Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 226219
              mmTop = 1323
              mmWidth = 19050
              BandType = 7
            end
            object ppDBTotBloqJud: TppDBCalc
              UserName = 'DBTotBloqJud'
              DataField = 'VALORLANCTO'
              DataPipeline = ppBDEBloqJud
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqJud'
              mmHeight = 3440
              mmLeft = 250561
              mmTop = 1323
              mmWidth = 29369
              BandType = 7
            end
          end
        end
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Sub-Total não Conciliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 202142
        mmTop = 2117
        mmWidth = 39201
        BandType = 7
      end
      object ppDBTotMovNaoConc: TppDBCalc
        UserName = 'DBTotMovNaoConc'
        DataField = 'VALORLANCFINAN'
        DataPipeline = ppBDEMovimento
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovimento'
        mmHeight = 4191
        mmLeft = 243682
        mmTop = 2117
        mmWidth = 39952
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 265
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284300
        BandType = 7
      end
      object ppShape5: TppShape
        UserName = 'Shape1'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 16404
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Total dos Bloqueios:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16933
        mmWidth = 53446
        BandType = 7
      end
      object ppDBTotBloqueios1: TppDBText
        UserName = 'DBTotBloqueios1'
        DataField = 'VALORTOTBLOQ'
        DataPipeline = ppBDETotBloqueios
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETotBloqueios'
        mmHeight = 4233
        mmLeft = 243682
        mmTop = 16933
        mmWidth = 39952
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8996
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Saldo Final do Extrato Bancário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 9525
        mmWidth = 70908
        BandType = 7
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = clBtnFace
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 23813
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Saldo Disponível Extrato Planus:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 24342
        mmWidth = 70908
        BandType = 7
      end
      object ppSaldoDispMovimFinanc: TppLabel
        UserName = 'SaldoDispMovimFinanc'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 243682
        mmTop = 24342
        mmWidth = 39952
        BandType = 7
      end
      object ppShape1: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 32808
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Discriminação de Valores Bloqueados em C/C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 33338
        mmWidth = 79111
        BandType = 7
      end
      object ppSubRepTotalBloqueios: TppSubReport
        UserName = 'SubRepTotalBloqueios'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubRepBloqJud
        TraverseAllData = False
        DataPipelineName = 'ppBDETotBloqueios'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 61383
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDETotBloqueios
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório da Conciliação Bancária'
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
          Units = utMillimeters
          Left = 312
          Top = 26
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDETotBloqueios'
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 9260
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'Shape8'
              Brush.Color = clSilver
              ParentWidth = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 7
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              AutoSize = False
              Caption = 'Total dos Bloqueios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1058
              mmTop = 3440
              mmWidth = 53446
              BandType = 7
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'VALORTOTBLOQ'
              DataPipeline = ppBDETotBloqueios
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDETotBloqueios'
              mmHeight = 4233
              mmLeft = 249767
              mmTop = 3440
              mmWidth = 29369
              BandType = 7
            end
          end
        end
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDOEXTRATO'
        DataPipeline = ppBDESaldoExtBanc
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDESaldoExtBanc'
        mmHeight = 4233
        mmLeft = 243682
        mmTop = 9525
        mmWidth = 39952
        BandType = 7
      end
      object ppSubRepBloqOutros: TppSubReport
        UserName = 'SubRepBloqOutros'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubRepBloqCheques
        TraverseAllData = False
        DataPipelineName = 'ppBDEBloqOutros'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 47890
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEBloqOutros
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório da Conciliação Bancária'
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
          Units = utMillimeters
          Left = 312
          Top = 230
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEBloqOutros'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppLabel21: TppLabel
              UserName = 'Label21'
              AutoSize = False
              Caption = 'Outros Bloqueios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 1058
              mmWidth = 64029
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 6350
              mmTop = 7938
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              AutoSize = False
              Caption = 'Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 27517
              mmTop = 7938
              mmWidth = 31221
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              AutoSize = False
              Caption = 'Data Disponib.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 221986
              mmTop = 7938
              mmWidth = 21960
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label703'
              AutoSize = False
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 264584
              mmTop = 7938
              mmWidth = 12171
              BandType = 1
            end
            object ppShape12: TppShape
              UserName = 'Shape12'
              Brush.Color = clBtnFace
              ParentWidth = True
              mmHeight = 265
              mmLeft = 0
              mmTop = 12171
              mmWidth = 284300
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'DATALANCFINAN'
              DataPipeline = ppBDEBloqOutros
              DisplayFormat = 'DD/MM/YYYY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqOutros'
              mmHeight = 3175
              mmLeft = 6350
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'HISTORICO'
              DataPipeline = ppBDEBloqOutros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEBloqOutros'
              mmHeight = 3175
              mmLeft = 27781
              mmTop = 529
              mmWidth = 82286
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'DATADISPFINANC'
              DataPipeline = ppBDEBloqOutros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEBloqOutros'
              mmHeight = 3175
              mmLeft = 223309
              mmTop = 529
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEBloqOutros
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqOutros'
              mmHeight = 3175
              mmLeft = 250561
              mmTop = 529
              mmWidth = 29369
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Sub-Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 226484
              mmTop = 529
              mmWidth = 19050
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBOutros'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEBloqOutros
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEBloqOutros'
              mmHeight = 3440
              mmLeft = 250561
              mmTop = 529
              mmWidth = 29369
              BandType = 7
            end
          end
        end
      end
      object SubRepMovimentoAnalitico: TppSubReport
        UserName = 'SubRepMovimentoAnalitico'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubRepTotalBloqueios
        TraverseAllData = False
        DataPipelineName = 'ppBDEMovimentoAnalitico'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 69056
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEMovimentoAnalitico
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório da Conciliação Bancária'
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
          Units = utMillimeters
          Left = 312
          Top = 248
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEMovimentoAnalitico'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'IDLANCCONCILIADO'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'IDLANCCONCILIADO_1'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 109009
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'HISTORICO'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 67733
              mmTop = 529
              mmWidth = 28575
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'HISTORICO_1'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 219340
              mmTop = 529
              mmWidth = 63500
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'NUMDOCUMENTO'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 16933
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'TIPOLANCTO'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 36513
              mmTop = 529
              mmWidth = 6879
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'VALORLANCTO'
              DataPipeline = ppBDEMovimentoAnalitico
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 45508
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'NUMCHQBORDERO'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 125148
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'DATALANCFINAN'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 145521
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'ENTRADASAIDA'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 165894
              mmTop = 529
              mmWidth = 6879
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEMovimentoAnalitico
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 175948
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'DATADISPFINANC'
              DataPipeline = ppBDEMovimentoAnalitico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3175
              mmLeft = 198702
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppShape15: TppShape
              UserName = 'Shape15'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 0
              mmTop = 794
              mmWidth = 284692
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'VALORLANCTO'
              DataPipeline = ppBDEMovimentoAnalitico
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3810
              mmLeft = 24077
              mmTop = 1588
              mmWidth = 40746
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'VALORLANCFINAN'
              DataPipeline = ppBDEMovimentoAnalitico
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEMovimentoAnalitico'
              mmHeight = 3810
              mmLeft = 154517
              mmTop = 1588
              mmWidth = 40746
              BandType = 7
            end
            object ppLabel42: TppLabel
              UserName = 'Label42'
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 1058
              mmWidth = 8467
              BandType = 7
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 131498
              mmTop = 1588
              mmWidth = 8467
              BandType = 7
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'BANCO'
            DataPipeline = ppBDEMovimentoAnalitico
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBDEMovimentoAnalitico'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 48419
              mmPrintPosition = 0
              object ppShape13: TppShape
                UserName = 'Shape13'
                Brush.Color = clSilver
                mmHeight = 5292
                mmLeft = 265
                mmTop = 36777
                mmWidth = 96309
                BandType = 3
                GroupNo = 0
              end
              object ppLabel28: TppLabel
                UserName = 'Label28'
                Caption = 'Saldo e Movimentação Bancária (Extrato Banco)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 1323
                mmTop = 37571
                mmWidth = 73290
                BandType = 3
                GroupNo = 0
              end
              object ppShape14: TppShape
                UserName = 'Shape14'
                Brush.Color = clSilver
                mmHeight = 5292
                mmLeft = 106892
                mmTop = 36777
                mmWidth = 177800
                BandType = 3
                GroupNo = 0
              end
              object ppLabel29: TppLabel
                UserName = 'Label29'
                Caption = 'Saldo e Movimentação Financeira (CFinan)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 107950
                mmTop = 37571
                mmWidth = 65088
                BandType = 3
                GroupNo = 0
              end
              object ppLabel30: TppLabel
                UserName = 'Label30'
                Caption = 'Id Conc.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 1588
                mmTop = 44186
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel31: TppLabel
                UserName = 'Label301'
                Caption = 'Tipo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 37042
                mmTop = 44186
                mmWidth = 6879
                BandType = 3
                GroupNo = 0
              end
              object ppLabel32: TppLabel
                UserName = 'Label302'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 57415
                mmTop = 44186
                mmWidth = 7938
                BandType = 3
                GroupNo = 0
              end
              object ppLabel33: TppLabel
                UserName = 'Label303'
                Caption = 'Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 17463
                mmTop = 44186
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLabel34: TppLabel
                UserName = 'Label34'
                Caption = 'Histórico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 68263
                mmTop = 44186
                mmWidth = 12171
                BandType = 3
                GroupNo = 0
              end
              object ppLabel35: TppLabel
                UserName = 'Label304'
                Caption = 'Id Conc.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 109802
                mmTop = 44186
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel36: TppLabel
                UserName = 'Label36'
                Caption = 'Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 125677
                mmTop = 44186
                mmWidth = 15610
                BandType = 3
                GroupNo = 0
              end
              object ppLabel37: TppLabel
                UserName = 'Label37'
                Caption = 'Data Lancto.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 146050
                mmTop = 44186
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object ppLabel38: TppLabel
                UserName = 'Label38'
                Caption = 'Tipo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 166423
                mmTop = 44186
                mmWidth = 6879
                BandType = 3
                GroupNo = 0
              end
              object ppLabel39: TppLabel
                UserName = 'Label39'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 187855
                mmTop = 44186
                mmWidth = 7938
                BandType = 3
                GroupNo = 0
              end
              object ppLabel40: TppLabel
                UserName = 'Label40'
                Caption = 'Dt Dispon.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 199761
                mmTop = 44186
                mmWidth = 14288
                BandType = 3
                GroupNo = 0
              end
              object ppLabel41: TppLabel
                UserName = 'Label41'
                Caption = 'Histórico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 219869
                mmTop = 44186
                mmWidth = 12171
                BandType = 3
                GroupNo = 0
              end
              object ppLine1: TppLine
                UserName = 'Line1'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 1058
                mmTop = 48154
                mmWidth = 95515
                BandType = 3
                GroupNo = 0
              end
              object ppLine2: TppLine
                UserName = 'Line2'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 107421
                mmTop = 48154
                mmWidth = 177007
                BandType = 3
                GroupNo = 0
              end
              object ppLabel27: TppLabel
                UserName = 'Label27'
                Caption = 'Movimentação Conciliadada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 1058
                mmTop = 30427
                mmWidth = 47361
                BandType = 3
                GroupNo = 0
              end
              object ppLabel44: TppLabel
                UserName = 'Label44'
                AutoSize = False
                Caption = 'Relatório da Conciliação Bancária'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 13
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 5292
                mmLeft = 0
                mmTop = 13229
                mmWidth = 284163
                BandType = 3
                GroupNo = 0
              end
              object ppDBImage2: TppDBImage
                UserName = 'DbLogo1'
                MaintainAspectRatio = False
                ShiftWithParent = True
                Stretch = True
                DataField = 'IMAGEM'
                DataPipeline = ppEmpresa
                GraphicType = 'Bitmap'
                ParentDataPipeline = False
                DataPipelineName = 'ppEmpresa'
                mmHeight = 20902
                mmLeft = 2117
                mmTop = 1852
                mmWidth = 20108
                BandType = 3
                GroupNo = 0
              end
              object ppDBText15: TppDBText
                UserName = 'DBText15'
                DataField = 'NOMEEMPRESA'
                DataPipeline = ppEmpresa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 14
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppEmpresa'
                mmHeight = 5821
                mmLeft = 0
                mmTop = 1852
                mmWidth = 284428
                BandType = 3
                GroupNo = 0
              end
              object ppSystemVariable4: TppSystemVariable
                UserName = 'SystemVariable4'
                AutoSize = False
                VarType = vtDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 256911
                mmTop = 24606
                mmWidth = 27517
                BandType = 3
                GroupNo = 0
              end
              object ppShape16: TppShape
                UserName = 'Shape16'
                Brush.Color = clBtnFace
                ParentWidth = True
                mmHeight = 265
                mmLeft = 0
                mmTop = 28840
                mmWidth = 284300
                BandType = 3
                GroupNo = 0
              end
              object ppLabel45: TppLabel
                UserName = 'Label201'
                AutoSize = False
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 243946
                mmTop = 24606
                mmWidth = 14023
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP'
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 430
    Top = 75
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object dsEmpresa: TwwDataSource
    DataSet = qryEmpresa
    Left = 432
    Top = 141
  end
  object ppEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'Empresa'
    Left = 434
    Top = 203
    object ppEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppEmpresappField2: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppEmpresappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppEmpresappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppEmpresappField5: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object ppEmpresappField6: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object qryBloqCheques: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATALANCFINAN, HISTORICO,'
      
        '       DECODE(M.ENTRADASAIDA, '#39'S'#39', -M.VALORLANCFINAN, M.VALORLAN' +
        'CFINAN) AS VALORLANCFINAN,'
      '       DATADISPFINANC'
      'FROM MOVIMFINANC M'
      'WHERE (M.DATALANCFINAN = '#39'20/01/2012'#39' )'
      '      AND (M.CODPORTADOR = 3)'
      '      AND M.SITBLOQUEIOLANC = 1'
      '      AND M.HISTPADFINAN = 14'
      'ORDER BY M.CODPORTADOR, M.DATALANCFINAN, M.CODLANCFINANC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 331
    Top = 74
    object qryBloqChequesDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
    end
    object qryBloqChequesVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBloqChequesDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
    object qryBloqChequesHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
  end
  object qryBloqJud: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATALANCTO, HISTORICO, ABS(VALORLANCTO), DATADISPONIB'
      'FROM MOVFINBLOQJUDICIAIS'
      'WHERE DATALANCTO <= '#39'31/08/2012'#39
      '      AND CODPORTADOR = 3')
    ValidateWithMask = True
    Left = 231
    Top = 78
    object qryBloqJudDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.DATALANCTO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryBloqJudVALORLANCTO: TFloatField
      FieldName = 'VALORLANCTO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.VALORLANCTO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBloqJudDATADISPONIB: TDateTimeField
      FieldName = 'DATADISPONIB'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.DATADISPONIB'
    end
    object qryBloqJudHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.MOVFINBLOQJUDICIAIS.HISTORICO'
      Size = 80
    end
  end
  object dsBloqCheques: TwwDataSource
    DataSet = qryBloqCheques
    Left = 334
    Top = 140
  end
  object dsBloqJud: TwwDataSource
    DataSet = qryBloqJud
    Left = 228
    Top = 142
  end
  object qryMovimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT M.DATALANCFINAN,'
      '       M.HISTORICO,'
      
        '       DECODE(M.ENTRADASAIDA, '#39'S'#39', -M.VALORLANCFINAN, M.VALORLAN' +
        'CFINAN) AS VALORLANCFINAN'
      'FROM MOVIMFINANC M'
      'WHERE M.DATALANCFINAN = '#39'31/08/2012'#39
      '   AND M.CODPORTADOR = 3'
      '   AND M.VALORLANCFINAN <> 0'
      '   AND M.CONCILIADO IN ('#39'N'#39', '#39'Z'#39')'
      'ORDER BY M.CODPORTADOR, M.ENTRADASAIDA, M.VALORLANCFINAN DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 76
    object qryMovimentoDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
    end
    object qryMovimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object qryMovimentoVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
    end
  end
  object dsMovimento: TwwDataSource
    DataSet = qryMovimento
    Left = 150
    Top = 140
  end
  object ppBDEMovimento: TppBDEPipeline
    DataSource = dsMovimento
    UserName = 'BDEBloqJud1'
    Left = 154
    Top = 207
    object ppBDEMovimentoppField1: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object ppBDEMovimentoppField2: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDEMovimentoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object qrySaldoMovimFinanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(ENTRADASAIDA, '#39'S'#39', -VALORLANCFINAN, VALORLANCF' +
        'INAN)) AS SALDOMOVFINANC'
      'FROM MOVIMFINANC'
      'WHERE DATALANCFINAN = '#39'31/08/2012'#39
      '      AND CODPORTADOR = 3'
      '      AND CONCILIADO IN ('#39'N'#39', '#39'Z'#39')'
      '      AND SITBLOQUEIOLANC = 0'
      ' ')
    ValidateWithMask = True
    Left = 41
    Top = 76
    object qrySaldoMovimFinancSALDOMOVFINANC: TFloatField
      FieldName = 'SALDOMOVFINANC'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsSaldoMovimFinanc: TwwDataSource
    DataSet = qrySaldoMovimFinanc
    Left = 44
    Top = 140
  end
  object ppBDESaldoMovimFinanc: TppBDEPipeline
    DataSource = dsSaldoMovimFinanc
    UserName = 'BDESaldoMovimFinanc'
    Left = 44
    Top = 203
    object ppBDESaldoMovimFinancppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOMOVFINANC'
      FieldName = 'SALDOMOVFINANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
  end
  object qryTotBloqueios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '(SELECT NVL(SUM(DECODE(ENTRADASAIDA, '#39'S'#39', -VALORLANCFINAN, VALOR' +
        'LANCFINAN)), 0)'
      ' FROM MOVIMFINANC'
      ' WHERE DATADISPFINANC > '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3'
      '       AND SITBLOQUEIOLANC = 1'
      '       AND HISTPADFINAN = 14)'
      ' +'
      
        '(SELECT NVL(SUM(DECODE(TIPOLANCTO, '#39'S'#39', -VALORLANCTO, VALORLANCT' +
        'O)), 0)'
      ' FROM MOVFINBLOQJUDICIAIS'
      ' WHERE DATALANCTO <= '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3) AS VALORTOTBLOQ'
      'FROM DUAL'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 45
    Top = 270
    object qryTotBloqueiosVALORTOTBLOQ: TFloatField
      FieldName = 'VALORTOTBLOQ'
    end
  end
  object dsTotBloqueios: TwwDataSource
    DataSet = qryTotBloqueios
    Left = 152
    Top = 272
  end
  object ppBDETotBloqueios: TppBDEPipeline
    DataSource = dsTotBloqueios
    UserName = 'BDESaldoMovimFinanc1'
    Left = 244
    Top = 269
    object ppBDETotBloqueiosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTBLOQ'
      FieldName = 'VALORTOTBLOQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppBDEBloqCheques: TppBDEPipeline
    DataSource = dsBloqCheques
    SkipWhenNoRecords = False
    UserName = 'BDEBloqCheques'
    Left = 336
    Top = 203
    object ppBDEBloqChequesppField1: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object ppBDEBloqChequesppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEBloqChequesppField3: TppField
      FieldAlias = 'DATADISPFINANC'
      FieldName = 'DATADISPFINANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppBDEBloqChequesppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
  end
  object ppBDEBloqJud: TppBDEPipeline
    DataSource = dsBloqJud
    UserName = 'BDEBloqJud'
    Left = 240
    Top = 203
    object ppBDEBloqJudppField1: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEBloqJudppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCTO'
      FieldName = 'VALORLANCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEBloqJudppField3: TppField
      FieldAlias = 'DATADISPONIB'
      FieldName = 'DATADISPONIB'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppBDEBloqJudppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 3
    end
  end
  object qrySaldoExtBanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT           '
      '  (SELECT VALORLANCTO '
      '  FROM MOVEXTRATOBANCARIO                '
      '  WHERE DATAEXTRATO = '#39'31/08/2012'#39
      '        AND CODPORTADOR = 3'
      '        AND TIPOLINHA = '#39'A'#39' )'
      '   +         '
      '  (SELECT NVL(SUM(VALORLANCTO),0) '
      '  FROM MOVEXTRATOBANCARIO                '
      '  WHERE DATAEXTRATO = '#39'31/08/2012'#39
      '        AND CODPORTADOR = 3'
      '        AND TIPOLINHA = '#39'N'#39
      '        AND SITCONCILIACAO = '#39'A'#39' ) AS SALDOEXTRATO'
      '  FROM DUAL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 341
    Top = 270
    object qrySaldoExtBancSALDOEXTRATO: TFloatField
      FieldName = 'SALDOEXTRATO'
    end
  end
  object dsSaldoExtBanc: TwwDataSource
    DataSet = qrySaldoExtBanc
    Left = 442
    Top = 272
  end
  object ppBDESaldoExtBanc: TppBDEPipeline
    DataSource = dsSaldoExtBanc
    UserName = 'BDESaldoExtBanc'
    Left = 558
    Top = 269
    object ppBDESaldoExtBancppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOEXTRATO'
      FieldName = 'SALDOEXTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
  end
  object qryBloqOutros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATALANCFINAN, HISTORICO,'
      
        '       DECODE(M.ENTRADASAIDA, '#39'S'#39', -M.VALORLANCFINAN, M.VALORLAN' +
        'CFINAN) AS VALORLANCFINAN,'
      '       DATADISPFINANC'
      'FROM MOVIMFINANC M'
      'WHERE (M.DATALANCFINAN = '#39'20/01/2012'#39' )'
      '      AND (M.CODPORTADOR = 3)'
      '      AND M.SITBLOQUEIOLANC = 1'
      '      AND M.HISTPADFINAN = 19'
      'ORDER BY M.CODPORTADOR, M.DATALANCFINAN, M.CODLANCFINANC'
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 338
    object qryBloqOutrosDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
    end
    object qryBloqOutrosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object qryBloqOutrosVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
    end
    object qryBloqOutrosDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
  end
  object dsBloqOutros: TwwDataSource
    DataSet = qryBloqOutros
    Left = 140
    Top = 338
  end
  object ppBDEBloqOutros: TppBDEPipeline
    DataSource = dsBloqOutros
    UserName = 'BDETotBloqChq1'
    Left = 240
    Top = 339
    object ppBDEBloqOutrosppField1: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEBloqOutrosppField2: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEBloqOutrosppField3: TppField
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEBloqOutrosppField4: TppField
      FieldAlias = 'DATADISPFINANC'
      FieldName = 'DATADISPFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object qryMovimentoAnalitico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9#39'05/05/2021'#39' AS DATA_CONCILIACAO,'
      #9'EB.BANCO,'
      #9'EB.IDLANCCONCILIADO,'
      #9'EB.NUMDOCUMENTO,'
      #9'EB.TIPOLANCTO,'
      #9'EB.VALORLANCTO,'
      #9'EB.HISTORICO,'
      #9'EP.BANCO,'
      #9'EP.IDLANCCONCILIADO,'
      #9'EP.NUMCHQBORDERO,'
      #9'EP.DATALANCFINAN,'
      #9'EP.ENTRADASAIDA,'
      #9'EP.VALORLANCFINAN,'
      #9'EP.DATADISPFINANC,'
      #9'EP.HISTORICO'
      'FROM'
      #9'('
      #9'-- Extrato Banco - conciliado'
      #9'SELECT'
      #9#9'ROWNUM AS LINHA,'
      #9#9'EB1.*'
      #9'FROM'
      #9#9'('
      #9#9'SELECT'
      #9#9#9#39'05/05/2021'#39' AS DATA_CONCILIACAO,'
      #9#9#9'C.DESCRICAO AS BANCO,'
      #9#9#9'ME.IDLANCCONCILIADO,'
      #9#9#9'ME.NUMDOCUMENTO,'
      #9#9#9'ME.TIPOLANCTO,'
      #9#9#9'ME.VALORLANCTO,'
      #9#9#9'ME.HISTORICO'
      #9#9'FROM'
      #9#9#9'MOVEXTRATOBANCARIO ME'
      #9#9'JOIN CM.PORTADORCONTA C ON'
      #9#9#9'ME.CODPORTADOR = C.CODPORTADOR'
      #9#9'JOIN CM.BANCO B ON'
      #9#9#9'B.IDPESSOA = C.IDBANCO'
      #9#9#9'AND (C.FLGSTATUS = '#39'A'#39
      #9#9#9#9'OR C.FLGSTATUS IS NULL)'
      #9#9'WHERE'
      #9#9#9'ME.DATAEXTRATO = '#39'05/05/2021'#39
      #9#9#9'AND C.DESCRICAO = '#39'CEF 4255 CC 003.00930100-6'#39
      #9#9#9'AND ME.CONCILIADO = '#39'S'#39
      #9#9'ORDER BY'
      #9#9#9'ME.CODPORTADOR,'
      #9#9#9'ME.IDLANCCONCILIADO,'
      #9#9#9'ME.TIPOLANCTO,'
      #9#9#9'ME.VALORLANCTO DESC ) EB1) EB'
      'FULL OUTER JOIN ('
      #9'-- Cfinan - conciliado'
      #9'SELECT'
      #9#9'ROWNUM AS LINHA,'
      #9#9'EP1.*'
      #9'FROM'
      #9#9'('
      #9#9'SELECT'
      #9#9#9#39'05/05/2021'#39' AS DATA_CONCILIACAO,'
      #9#9#9'C.DESCRICAO AS BANCO,'
      #9#9#9'M.IDLANCCONCILIADO,'
      #9#9#9'M.NUMCHQBORDERO,'
      #9#9#9'M.DATALANCFINAN,'
      #9#9#9'M.ENTRADASAIDA,'
      #9#9#9'DECODE(M.ENTRADASAIDA,'
      #9#9#9#39'S'#39','
      #9#9#9'-M.VALORLANCFINAN,'
      #9#9#9'M.VALORLANCFINAN) AS VALORLANCFINAN,'
      #9#9#9'M.DATADISPFINANC,'
      #9#9#9'M.HISTORICO'
      #9#9'FROM'
      #9#9#9'CM.MOVIMFINANC M'
      #9#9'JOIN CM.PORTADORCONTA C ON'
      #9#9#9'M.CODPORTADOR = C.CODPORTADOR'
      #9#9'JOIN CM.BANCO B ON'
      #9#9#9'B.IDPESSOA = C.IDBANCO'
      #9#9#9'AND (C.FLGSTATUS = '#39'A'#39
      #9#9#9#9'OR C.FLGSTATUS IS NULL)'
      #9#9'WHERE'
      #9#9#9'C.DESCRICAO = '#39'CEF 4255 CC 003.00930100-6'#39
      #9#9#9'AND M.VALORLANCFINAN <> 0'
      #9#9#9'AND M.DATALANCFINAN = '#39'05/05/2021'#39
      #9#9#9'AND M.CONCILIADO IN ('#39'S'#39', '#39'D'#39' )'
      #9#9'ORDER BY'
      #9#9#9'M.IDLANCCONCILIADO,'
      #9#9#9'M.DATALANCFINAN,'
      #9#9#9'M.ENTRADASAIDA,'
      #9#9#9'M.VALORLANCFINAN DESC ) EP1) EP ON'
      #9'EB.LINHA = EP.LINHA')
    ValidateWithMask = True
    Left = 48
    Top = 416
    object qryMovimentoAnaliticoDATA_CONCILIACAO: TStringField
      FieldName = 'DATA_CONCILIACAO'
      FixedChar = True
      Size = 10
    end
    object qryMovimentoAnaliticoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 50
    end
    object qryMovimentoAnaliticoIDLANCCONCILIADO: TFloatField
      FieldName = 'IDLANCCONCILIADO'
    end
    object qryMovimentoAnaliticoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
    end
    object qryMovimentoAnaliticoTIPOLANCTO: TStringField
      FieldName = 'TIPOLANCTO'
      FixedChar = True
      Size = 1
    end
    object qryMovimentoAnaliticoVALORLANCTO: TFloatField
      FieldName = 'VALORLANCTO'
    end
    object qryMovimentoAnaliticoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 40
    end
    object qryMovimentoAnaliticoBANCO_1: TStringField
      FieldName = 'BANCO_1'
      Size = 50
    end
    object qryMovimentoAnaliticoIDLANCCONCILIADO_1: TFloatField
      FieldName = 'IDLANCCONCILIADO_1'
    end
    object qryMovimentoAnaliticoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      FixedChar = True
      Size = 15
    end
    object qryMovimentoAnaliticoDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
    end
    object qryMovimentoAnaliticoENTRADASAIDA: TStringField
      FieldName = 'ENTRADASAIDA'
      FixedChar = True
      Size = 1
    end
    object qryMovimentoAnaliticoVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
    end
    object qryMovimentoAnaliticoDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
    object qryMovimentoAnaliticoHISTORICO_1: TStringField
      FieldName = 'HISTORICO_1'
      Size = 60
    end
  end
  object dsMovimentoAnalitico: TwwDataSource
    DataSet = qryMovimentoAnalitico
    Left = 144
    Top = 424
  end
  object ppBDEMovimentoAnalitico: TppBDEPipeline
    DataSource = dsMovimentoAnalitico
    UserName = 'BDEMovimentoAnalitico'
    Left = 234
    Top = 423
    object ppBDEMovimentoAnaliticoppField1: TppField
      FieldAlias = 'DATA_CONCILIACAO'
      FieldName = 'DATA_CONCILIACAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEMovimentoAnaliticoppField2: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDEMovimentoAnaliticoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLANCCONCILIADO'
      FieldName = 'IDLANCCONCILIADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEMovimentoAnaliticoppField4: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppBDEMovimentoAnaliticoppField5: TppField
      FieldAlias = 'TIPOLANCTO'
      FieldName = 'TIPOLANCTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppBDEMovimentoAnaliticoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCTO'
      FieldName = 'VALORLANCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEMovimentoAnaliticoppField7: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppBDEMovimentoAnaliticoppField8: TppField
      FieldAlias = 'BANCO_1'
      FieldName = 'BANCO_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppBDEMovimentoAnaliticoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLANCCONCILIADO_1'
      FieldName = 'IDLANCCONCILIADO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEMovimentoAnaliticoppField10: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppBDEMovimentoAnaliticoppField11: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object ppBDEMovimentoAnaliticoppField12: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppBDEMovimentoAnaliticoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEMovimentoAnaliticoppField14: TppField
      FieldAlias = 'DATADISPFINANC'
      FieldName = 'DATADISPFINANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppBDEMovimentoAnaliticoppField15: TppField
      FieldAlias = 'HISTORICO_1'
      FieldName = 'HISTORICO_1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
  end
end
