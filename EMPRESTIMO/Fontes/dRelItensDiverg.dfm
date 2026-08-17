inherited dtmRelItensDiverg: TdtmRelItensDiverg
  Left = 180
  Top = 304
  Width = 185
  Height = 156
  Caption = 'dRelInscPend - Inscrições Pendentes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 24
    Top = 69
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object CmpRptCM: TCmParamReport
    Caption = 'Parametros do Relatório Inscrições Pendentes'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    Left = 648
    Top = 48
  end
  object DevRptCM: TExtraOptions
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
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
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
    Left = 600
    Top = 32
  end
  object CrmRptCM: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DataBaseName = 'BaseDados'
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rptItensDiverg
    ConnectionType = cntBDE
    Left = 552
    Top = 16
  end
  object rptItensDiverg: TppReport
    AutoStop = False
    DataPipeline = pplItensDiverg
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Parcelas Geradas por Mês'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 185000
    DataPipelineName = 'pplItensDiverg'
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 8467
        mmLeft = 0
        mmTop = 44450
        mmWidth = 270542
        BandType = 0
      end
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        AutoSize = False
        Caption = 'Itens com Divergência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65617
        mmTop = 8731
        mmWidth = 139171
        BandType = 0
      end
      object ppLabel1: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 65617
        mmTop = 1323
        mmWidth = 139171
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 529
        mmTop = 48948
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Mutuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 38629
        mmTop = 48948
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 153459
        mmTop = 48948
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'ppLabel106'
        Caption = 'Comp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 164307
        mmTop = 48948
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 13229
        mmTop = 48948
        mmWidth = 10848
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 52123
        mmWidth = 270542
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Cobr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 174361
        mmTop = 48948
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 220928
        mmTop = 48948
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 106892
        mmTop = 48948
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 48948
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 224632
        mmTop = 46038
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 46038
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Efetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 234157
        mmTop = 48948
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 185738
        mmTop = 46038
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label1'
        Caption = 'Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 183621
        mmTop = 48948
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 46038
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Efetiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 209550
        mmTop = 48948
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Divergência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 244211
        mmTop = 48948
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 25929
        mmTop = 48948
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 196321
        mmTop = 48948
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 198173
        mmTop = 46038
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 90488
        mmTop = 48948
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 90488
        mmTop = 46038
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 24342
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 24342
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 31750
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 24342
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 165894
        mmTop = 24342
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 31750
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 19315
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 19315
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 19315
        mmWidth = 102659
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 19315
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppShape2: TppShape
        OnPrint = ppShape2Print
        UserName = 'Shape2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBNumContrato: TppDBText
        UserName = 'DBNumContrato'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 0
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 38100
        mmTop = 794
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEPARCELA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 152665
        mmTop = 794
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 12700
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'COMPETENCIA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 163777
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplItensDiverg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 220398
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 232040
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'COBRANCA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 173302
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 182827
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 207698
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DESC_EVENTO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 106363
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 126736
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText11'
        DataField = 'TIPO_DIVERG'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 243682
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 25400
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'HMEDATAVENCTO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'HMENUMPARCELAS'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 157957
        mmTop = 794
        mmWidth = 3969
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label5'
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 156369
        mmTop = 794
        mmWidth = 1852
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText102'
        DataField = 'DESCSITCONTRATO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2646
        mmLeft = 89959
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 107156
        mmTop = 1323
        mmWidth = 56356
        BandType = 8
      end
      object ppLine45: TppLine
        UserName = 'ppLine45'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1058
        mmWidth = 23813
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 1058
        mmWidth = 27252
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensDiverg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplItensDiverg'
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 3704
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Itens Divergentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 31750
        mmTop = 3704
        mmWidth = 20638
        BandType = 7
      end
    end
  end
  object dtsItensDiverg: TwwDataSource
    AutoEdit = False
    DataSet = qryItensDiverg
    Left = 112
    Top = 68
  end
  object qryItensDiverg: TwwQuery
    BeforeOpen = qryItensDivergBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.MATRICULA,'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.INSCRICAONUMERO,'
      '   CON.NOME,'
      ''
      '   HME.HMEPARCELA,'
      '   HME.HMENUMPARCELAS,'
      ''
      '   HME.COMPETENCIA,'
      '   HME.COBRANCA,'
      ''
      ''
      '   HME.HMEVLRPREVISTO,'
      '   HME.HMEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA,'
      '   HME.HMEDATAVENCTO,'
      '   HME.HMEDATAEFETIVA,'
      ''
      '   HME.DESC_EVENTO,'
      '   HME.ITEDESCRICAO,'
      ''
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Ativo'#39','
      '                          '#39'C'#39', '#39'Cancelado'#39','
      '                          '#39'E'#39', '#39'Encerrado'#39','
      '                          '#39'Q'#39', '#39'Quitado'#39','
      '                          '#39'R'#39', '#39'Refinanciado'#39','
      '                          '#39'S'#39', '#39'Suspenso'#39','
      
        '                          '#39'K'#39', '#39'Em Quitação'#39') AS DESCSITCONTRATO' +
        ','
      ''
      '   DECODE(HME.FLGTIPODIVERG, 1, '#39'Valores ainda não recebidos'#39','
      '                             2, '#39'Recebimentos Inesperados'#39','
      '                             3, '#39'Valores recebidos a menor'#39','
      '                             4, '#39'Valores recebidos a maior'#39','
      '                             5, '#39'Divergência de datas'#39','
      
        '                             6, '#39'Valores não recebidos'#39') AS TIPO' +
        '_DIVERG'
      ''
      'FROM'
      '    VW_MOVEP      HME,'
      '    VWCONTRATOEP  CON'
      ''
      'WHERE'
      '       CON.IDCONTRATOEMPTMO = 309948'
      '   AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '   AND HME.EVENTO           <> 0'
      '   AND ( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 )'
      '   AND HME.FLGDIVERGPEND    = 1'
      ''
      'ORDER BY'
      
        '   CON.NOME, CON.IDCONTRATOEMPTMO, ANOMESCOMPETENCIA, ANOMESCOBR' +
        'ANCA')
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryItensDivergMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 15
    end
    object qryItensDivergIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryItensDivergNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryItensDivergCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Origin = 'BASEDADOS.VW_MOVEP.COMPETENCIA'
      Size = 9
    end
    object qryItensDivergCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Origin = 'BASEDADOS.VW_MOVEP.COBRANCA'
      Size = 9
    end
    object qryItensDivergHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.VW_MOVEP.HMEVLRPREVISTO'
    end
    object qryItensDivergHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      Origin = 'BASEDADOS.VW_MOVEP.HMEVLREFETIVO'
    end
    object qryItensDivergHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.VW_MOVEP.HMEDATAPREVISTA'
    end
    object qryItensDivergHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      Origin = 'BASEDADOS.VW_MOVEP.HMEDATAEFETIVA'
    end
    object qryItensDivergDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      Origin = 'BASEDADOS.VW_MOVEP.DESC_EVENTO'
      Size = 18
    end
    object qryItensDivergITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.VW_MOVEP.ITEDESCRICAO'
      Size = 40
    end
    object qryItensDivergINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryItensDivergTIPO_DIVERG: TStringField
      FieldName = 'TIPO_DIVERG'
      Size = 27
    end
    object qryItensDivergHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensDivergHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryItensDivergHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensDivergDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
      Size = 12
    end
  end
  object AdoQryInscPend: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=CMSOL;User ID=CM;Data Source=CBS2;Pe' +
      'rsist Security Info=True'
    CursorType = ctStatic
    Parameters = <>
    Left = 696
    Top = 64
  end
  object pplItensDiverg: TppDBPipeline
    DataSource = dtsItensDiverg
    CloseDataSource = True
    UserName = 'lItensDiverg'
    Left = 112
    Top = 80
  end
  object CdsInscPend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspInscPend'
    Left = 552
    Top = 72
    object CdsInscPendDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object CdsInscPendIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object CdsInscPendNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsInscPendTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object CdsInscPendVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
    end
    object CdsInscPendNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
  end
  object DspInscPend: TDataSetProvider
    DataSet = qryItensDiverg
    Constraints = True
    Left = 752
    Top = 24
  end
end
