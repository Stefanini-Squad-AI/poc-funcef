object dtmModAutoAtendimento: TdtmModAutoAtendimento
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 234
  Top = 161
  Height = 588
  Width = 799
  object dbADOBaseDados: TADOConnection
    CommandTimeout = 60
    LoginPrompt = False
    Mode = cmRead
    Provider = 'MSDAORA'
    Left = 48
    Top = 16
  end
  object cdsSessao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 80
    object cdsSessaoIDWEBSESSAO: TStringField
      FieldName = 'IDWEBSESSAO'
      Size = 8
    end
    object cdsSessaoDTINICIO: TDateTimeField
      FieldName = 'DTINICIO'
    end
    object cdsSessaoDTULTACESSO: TDateTimeField
      FieldName = 'DTULTACESSO'
    end
    object cdsSessaoLOGINPESSOAL: TStringField
      FieldName = 'LOGINPESSOAL'
    end
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 80
  end
  object cdsWebCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object cdsWebPagina: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 152
  end
  object dbBaseDados: TCMDatabase
    DatabaseName = 'dbDesign'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=CBS'
      'USER NAME=CM'
      'PASSWORD=CMSOL'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=TRUE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=1024'
      'BLOB SIZE=1024')
    SessionName = 'sssSessao'
    Left = 167
    Top = 15
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 80
  end
  object sssSessao: TSession
    SessionName = 'sssSessao'
    Left = 272
    Top = 16
  end
  object cdsHTMLColumns: TCMClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'agrSum'
        Expression = 'SUM( cdfWidth )'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'cdfIdCampo'
        DataType = ftInteger
      end
      item
        Name = 'cdfTitle'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'cdfWidth'
        DataType = ftInteger
      end
      item
        Name = 'cdfContent'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'cdfAlign'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'cdfHighlited'
        DataType = ftBoolean
      end
      item
        Name = 'cdfNoHeader'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 16
  end
  object cdsEmprestimosAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 224
    object cdsEmprestimosAntFLGESCOLHA: TIntegerField
      FieldName = 'FLGESCOLHA'
    end
    object cdsEmprestimosAntIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object cdsEmprestimosAntVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object cdsEmprestimosAntDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object cdsEmprestimosAntFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object cdsEmprestimosAntIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object cdsEmprestimosAntNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object cdsEmprestimosAntIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object cdsEmprestimosAntVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object cdsEmprestimosAntMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object cdsEmprestimosAntIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsEmprestimosAntIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsEmprestimosAntIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsEmprestimosAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object cdsEmprestimosAntNUMPARCPAGAS: TFloatField
      FieldName = 'NUMPARCPAGAS'
    end
    object cdsEmprestimosAntVLREMABERTO: TFloatField
      FieldName = 'VLREMABERTO'
    end
    object cdsEmprestimosAntIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object cdsEmprestimosAntMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsEmprestimosAntVLRATUAL: TFloatField
      FieldName = 'VLRATUAL'
    end
  end
  object cdsInputTransfPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 272
    Top = 152
    object cdsInputTransfPlanoIDEVENTOGERADOR: TIntegerField
      FieldName = 'IDEVENTOGERADOR'
    end
    object cdsInputTransfPlanoIDINPUT: TFloatField
      FieldName = 'IDINPUT'
    end
    object cdsInputTransfPlanoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsInputTransfPlanoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object cdsInputTransfPlanoFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      FixedChar = True
      Size = 1
    end
    object cdsInputTransfPlanoTABELA: TStringField
      FieldName = 'TABELA'
    end
    object cdsInputTransfPlanoCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object cdsInputTransfPlanoNOMEPARAREGRA: TStringField
      FieldName = 'NOMEPARAREGRA'
    end
    object cdsInputTransfPlanoFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object cdsInputTransfPlanoFLGMANTIDO: TFloatField
      FieldName = 'FLGMANTIDO'
    end
    object cdsInputTransfPlanoFLGMANTPARC: TFloatField
      FieldName = 'FLGMANTPARC'
    end
    object cdsInputTransfPlanoFLGASSISTIDO: TFloatField
      FieldName = 'FLGASSISTIDO'
    end
    object cdsInputTransfPlanoFLGBENEFICIARIO: TFloatField
      FieldName = 'FLGBENEFICIARIO'
    end
    object cdsInputTransfPlanoFLGPODEALTERAR: TFloatField
      FieldName = 'FLGPODEALTERAR'
    end
    object cdsInputTransfPlanoORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object cdsInputTransfPlanoVALORDEFAULT: TStringField
      FieldName = 'VALORDEFAULT'
    end
    object cdsInputTransfPlanoVALOR: TStringField
      FieldName = 'VALOR'
    end
    object cdsInputTransfPlanoIDREGRAVALIDA: TIntegerField
      FieldName = 'IDREGRAVALIDA'
    end
    object cdsInputTransfPlanoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 30
    end
    object cdsInputTransfPlanoIDREGRAVLRDEFAULT: TIntegerField
      FieldName = 'IDREGRAVLRDEFAULT'
    end
    object cdsInputTransfPlanoTIPODADO: TStringField
      FieldName = 'TIPODADO'
      Size = 1
    end
  end
  object cdsResultTransfDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 80
    object cdsResultTransfDadosIDTIPOTRANSF: TIntegerField
      FieldName = 'IDTIPOTRANSF'
    end
    object cdsResultTransfDadosIDCONFIG: TIntegerField
      FieldName = 'IDCONFIG'
    end
    object cdsResultTransfDadosITEM: TStringField
      FieldName = 'ITEM'
      Size = 120
    end
    object cdsResultTransfDadosMSG: TStringField
      FieldName = 'MSG'
      Size = 200
    end
    object cdsResultTransfDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsResultTransfDadosVALOR: TStringField
      FieldName = 'VALOR'
      Size = 50
    end
    object cdsResultTransfDadosFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Size = 1
    end
  end
  object cdsItemRecDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 224
    object cdsItemRecDepIdHistMovEmptmo: TIntegerField
      FieldName = 'IdHistMovEmptmo'
    end
    object cdsItemRecDepCodigoItem: TIntegerField
      FieldName = 'CodigoItem'
    end
    object cdsItemRecDepRegra: TIntegerField
      FieldName = 'Regra'
    end
    object cdsItemRecDepRubrica: TIntegerField
      FieldName = 'Rubrica'
    end
    object cdsItemRecDepEvento: TIntegerField
      FieldName = 'Evento'
    end
    object cdsItemRecDepFlgEnvio: TIntegerField
      FieldName = 'FlgEnvio'
    end
    object cdsItemRecDepFlgBaixado: TIntegerField
      FieldName = 'FlgBaixado'
    end
    object cdsItemRecDepNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cdsItemRecDepRecPag: TStringField
      FieldName = 'RecPag'
      Size = 1
    end
    object cdsItemRecDepFormaCobranca: TStringField
      FieldName = 'FormaCobranca'
      Size = 1
    end
    object cdsItemRecDepParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object cdsItemRecDepOrigem: TIntegerField
      FieldName = 'Origem'
    end
    object cdsItemRecDepPrioridade: TIntegerField
      FieldName = 'Prioridade'
    end
    object cdsItemRecDepSeqCalculo: TIntegerField
      FieldName = 'SeqCalculo'
    end
    object cdsItemRecDepSeqCobranca: TIntegerField
      FieldName = 'SeqCobranca'
    end
    object cdsItemRecDepFlgCentraliza: TIntegerField
      FieldName = 'FlgCentraliza'
    end
    object cdsItemRecDepFlgDivergPend: TIntegerField
      FieldName = 'FlgDivergPend'
    end
    object cdsItemRecDepIdItemCentraliza: TIntegerField
      FieldName = 'IdItemCentraliza'
    end
    object cdsItemRecDepAnoCompetencia: TIntegerField
      FieldName = 'AnoCompetencia'
    end
    object cdsItemRecDepMesCompetencia: TIntegerField
      FieldName = 'MesCompetencia'
    end
    object cdsItemRecDepAnoCobranca: TIntegerField
      FieldName = 'AnoCobranca'
    end
    object cdsItemRecDepMesCobranca: TIntegerField
      FieldName = 'MesCobranca'
    end
    object cdsItemRecDepDataPrevista: TDateTimeField
      FieldName = 'DataPrevista'
    end
    object cdsItemRecDepDataEfetiva: TDateTimeField
      FieldName = 'DataEfetiva'
    end
    object cdsItemRecDepDataUltAtualiza: TDateTimeField
      FieldName = 'DataUltAtualiza'
    end
    object cdsItemRecDepValor: TFloatField
      FieldName = 'Valor'
    end
    object cdsItemRecDepSaldoDevedor: TFloatField
      FieldName = 'SaldoDevedor'
    end
    object cdsItemRecDepTxJuros: TFloatField
      FieldName = 'TxJuros'
    end
    object cdsItemRecDepTxJurosAnt: TFloatField
      FieldName = 'TxJurosAnt'
    end
    object cdsItemRecDepParcResta: TIntegerField
      FieldName = 'ParcResta'
    end
    object cdsItemRecDepFlgDestacado: TIntegerField
      FieldName = 'FlgDestacado'
    end
    object cdsItemRecDepValorEfetivo: TFloatField
      FieldName = 'ValorEfetivo'
    end
    object cdsItemRecDepFlgTipoDiverg: TIntegerField
      FieldName = 'FlgTipoDiverg'
    end
  end
  object RptIsapi: TppReport
    AutoStop = False
    DataPipeline = ppSQL
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'HTMLFile'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ShowCancelDialog = False
    ShowPrintDialog = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 367
    Top = 291
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppSQL'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dsSQLReport: TDataSource
    DataSet = cdsSQLReport
    Left = 47
    Top = 291
  end
  object EdvIsapi: TExtraOptions
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
    Left = 271
    Top = 291
  end
  object ppSQL: TppDBPipeline
    DataSource = dsSQLReport
    UserName = 'SQL'
    Left = 167
    Top = 291
  end
  object cdsSQLReport: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 367
    Top = 152
  end
  object cdsCamposSimulaBenef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 224
    object cdsCamposSimulaBenefIDINPUT: TIntegerField
      FieldName = 'IDINPUT'
    end
    object cdsCamposSimulaBenefNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
    end
    object cdsCamposSimulaBenefVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
  end
  object CMResourceManager: TCMResourceManager
    PathExe = 'C:\ProjetosCM5\Bin\'
    PathBpl = 'C:\ProjetosCM5\CM\Packages\'
    Left = 48
    Top = 352
  end
  object cdsBpl: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'BPL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VERSAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'CAMINHO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 167
    Top = 350
    object cdsBplBPL: TStringField
      DisplayWidth = 11
      FieldName = 'BPL'
      FixedChar = True
    end
    object cdsBplVERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 10
      FieldName = 'VERSAO'
      FixedChar = True
      Size = 10
    end
    object cdsBplDATA: TDateTimeField
      DisplayLabel = 'Modificado'
      DisplayWidth = 20
      FieldName = 'DATA'
    end
    object cdsBplCAMINHO: TStringField
      DisplayLabel = 'Pasta'
      DisplayWidth = 100
      FieldName = 'CAMINHO'
      FixedChar = True
      Size = 100
    end
    object cdsBplDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 200
    end
  end
  object cdsChecaSessao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 216
  end
  object cdsLoginPessoal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 352
  end
end
