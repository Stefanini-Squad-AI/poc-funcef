inherited dtmRelInscPend: TdtmRelInscPend
  Left = 188
  Top = 226
  Width = 439
  Height = 176
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
    Left = 312
    Top = 40
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
    Left = 264
    Top = 24
  end
  object CrmRptCM: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DataBaseName = 'BaseDados'
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rptInscPend
    LabelEmpresa = ppLabel1
    LabelSistema = ppLabel3
    ConnectionType = cntBDE
    Left = 216
    Top = 8
  end
  object rptInscPend: TppReport
    AutoStop = False
    DataPipeline = PplInscPend
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Parcelas Geradas por Mês'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    DataPipelineName = 'PplInscPend'
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 48154
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 43656
        mmWidth = 196770
        BandType = 0
      end
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        Caption = 'Inscrições não Efetivadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 67204
        mmTop = 8731
        mmWidth = 52123
        BandType = 0
      end
      object ppLabel1: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78317
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Inscrição Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 44186
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 44715
        mmTop = 44186
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'Valor Solicitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 44186
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'ppLabel106'
        Caption = 'Nº Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 150548
        mmTop = 44186
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Data Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 44186
        mmWidth = 18785
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 47625
        mmWidth = 196770
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
        mmTop = 23813
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
        mmLeft = 111125
        mmTop = 23813
        mmWidth = 12700
        BandType = 0
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
        mmTop = 23813
        mmWidth = 68527
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
        mmLeft = 123561
        mmTop = 23813
        mmWidth = 73290
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 18785
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
        mmLeft = 101865
        mmTop = 18785
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
        mmTop = 18785
        mmWidth = 66146
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
        mmLeft = 123561
        mmTop = 18785
        mmWidth = 73290
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppShape2: TppShape
        OnPrint = ppShape2Print
        UserName = 'Shape2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppDBNumContrato: TppDBText
        UserName = 'DBNumContrato'
        DataField = 'IDINSCRICAOEMPTMO'
        DataPipeline = PplInscPend
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 23813
        mmTop = 794
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = PplInscPend
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 44715
        mmTop = 794
        mmWidth = 81227
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRSOLIC'
        DataPipeline = PplInscPend
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAINSC'
        DataPipeline = PplInscPend
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMPARCELAS'
        DataPipeline = PplInscPend
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 150548
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PENDENTE'
        DataPipeline = PplInscPend
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplInscPend'
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 794
        mmWidth = 26458
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
        mmLeft = 70115
        mmTop = 1058
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
        mmWidth = 196770
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
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 23019
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
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 27252
        BandType = 8
      end
    end
  end
  object DsInscPend: TwwDataSource
    AutoEdit = False
    DataSet = qryInscPend
    Left = 112
    Top = 80
  end
  object qryInscPend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.DATAINSC, INS.IDINSCRICAOEMPTMO,'
      '   INS.VLRSOLIC, INS.NUMPARCELAS,'
      ''
      '   PE.NOME,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   DECODE(INS.FLGPENDENTE, '#39'P'#39', '#39'Pendente'#39', '#39#39') AS PENDENTE'
      ''
      'FROM'
      
        '   INSCRICAOEMPTMO INS, CONTRATOEMPTMO CTE, PESSOA PE, TIPOCONTR' +
        'EMPTMO TCE'
      ''
      'WHERE'
      '       ( INS.IDINSCRICAOEMPTMO   = CTE.IDINSCRICAOEMPTMO(+) )'
      '   AND ( CTE.IDINSCRICAOEMPTMO   IS NULL )'
      '   AND ( INS.IDPESSOA            = PE.IDPESSOA(+) )'
      '   AND ( INS.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( INS.DATACANCINSC        IS NULL )'
      ''
      'ORDER BY'
      '   INS.IDINSCRICAOEMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 68
    object qryInscPendDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryInscPendIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryInscPendNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryInscPendTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryInscPendVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
    end
    object qryInscPendNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryInscPendPENDENTE: TStringField
      FieldName = 'PENDENTE'
      Size = 8
    end
  end
  object AdoQryInscPend: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=CMSOL;User ID=CM;Data Source=CBS2;Pe' +
      'rsist Security Info=True'
    CursorType = ctStatic
    Parameters = <>
    Left = 360
    Top = 56
  end
  object PplInscPend: TppDBPipeline
    DataSource = DsInscPend
    CloseDataSource = True
    UserName = 'PplInscPend'
    Left = 112
    Top = 56
  end
  object CdsInscPend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspInscPend'
    Left = 216
    Top = 64
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
    object CdsInscPendPENDENTE: TStringField
      FieldName = 'PENDENTE'
      Size = 8
    end
  end
  object DspInscPend: TDataSetProvider
    DataSet = qryInscPend
    Constraints = True
    Left = 264
    Top = 88
  end
end
