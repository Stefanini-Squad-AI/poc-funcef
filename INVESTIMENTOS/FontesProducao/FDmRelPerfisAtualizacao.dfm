inherited DmRelPerfisAtualizacao: TDmRelPerfisAtualizacao
  Left = 370
  Top = 189
  Width = 258
  Height = 255
  Caption = 'DmRelPerfisAtualizacao'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 7
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
    Left = 18
    Top = 7
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 7
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 7
    DataPipelineName = 'pplExemplo'
  end
  object pplPerfisAtualizacao: TppBDEPipeline
    DataSource = dsPerfisAtualizacao
    UserName = 'pplPerfisAtualizacao'
    Left = 141
    Top = 72
    object pplPerfisAtualizacaoppField1: TppField
      FieldAlias = 'CURVA'
      FieldName = 'CURVA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplPerfisAtualizacaoppField2: TppField
      FieldAlias = 'ITEM'
      FieldName = 'ITEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplPerfisAtualizacaoppField3: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object pplPerfisAtualizacaoppField4: TppField
      FieldAlias = 'REGRA'
      FieldName = 'REGRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplPerfisAtualizacaoppField5: TppField
      FieldAlias = 'FLGMOEDA'
      FieldName = 'FLGMOEDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplPerfisAtualizacaoppField6: TppField
      FieldAlias = 'FLGDESTACADO'
      FieldName = 'FLGDESTACADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplPerfisAtualizacaoppField7: TppField
      FieldAlias = 'FLGCENTRALIZADO'
      FieldName = 'FLGCENTRALIZADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pplPerfisAtualizacaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQCALCULO'
      FieldName = 'SEQCALCULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplPerfisAtualizacaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCURVARENFIX'
      FieldName = 'IDCURVARENFIX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplPerfisAtualizacaoppField10: TppField
      FieldAlias = 'TIPOITEM'
      FieldName = 'TIPOITEM'
      FieldLength = 18
      DisplayWidth = 18
      Position = 9
    end
    object pplPerfisAtualizacaoppField11: TppField
      FieldAlias = 'FLGEXIBENAOPER'
      FieldName = 'FLGEXIBENAOPER'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
  end
  object dsPerfisAtualizacao: TwwDataSource
    AutoEdit = False
    DataSet = qryPerfisAtualizacao
    Left = 143
    Top = 128
  end
  object qryPerfisAtualizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       CV.DESCCURVARENFIX AS CURVA, IT.DESCITEMRENFIX AS ITEM,'
      '       IT.CODITEMRENFIX AS CODIGO, RG.NOMEREGRA AS REGRA,'
      '       DECODE(IT.TIPOITEM, '#39'A'#39', '#39'Agio'#39','
      '                           '#39'D'#39', '#39'Deságio'#39','
      '                           '#39'I'#39', '#39'Imposto'#39','
      '                           '#39'L'#39', '#39'Lucro'#39','
      '                           '#39'M'#39', '#39'Moeda'#39','
      '                           '#39'R'#39', '#39'Percentual'#39','
      '                           '#39'P'#39', '#39'PU'#39','
      '                           '#39'T'#39', '#39'Taxa'#39','
      '                           '#39'V'#39', '#39'Valor'#39','
      
        '                           '#39'N'#39', '#39'Valor para Cálculo'#39') AS TIPOITE' +
        'M,'
      '       CI.FLGEXIBENAOPER,'
      '       DECODE(CI.FLGMOEDA,'#39'Y'#39','#39'S'#39','#39'N'#39') AS FLGMOEDA,'
      '       DECODE(CI.FLGDESTACADO,'#39'Y'#39','#39'S'#39','#39'N'#39') AS FLGDESTACADO,'
      
        '       DECODE(CI.FLGCENTRALIZADO,'#39'Y'#39','#39'S'#39','#39'N'#39') AS FLGCENTRALIZADO' +
        ','
      '       CI.SEQCALCULO, CI.IDCURVARENFIX'
      
        'FROM CURVASXITEMRENFIX CI, CURVASRENFIX CV, ITEMRENFIX IT, REGRA' +
        ' RG'
      'WHERE CI.IDCURVARENFIX = CV.IDCURVARENFIX'
      '  AND CI.IDITEMRENFIX = IT.IDITEMRENFIX'
      '  AND CI.IDREGRA = RG.IDREGRA(+)'
      
        '  AND ((( :PERFIL IS NOT NULL) AND (CI.IDCURVARENFIX = :PERFIL))' +
        ' OR'
      '        ( :PERFIL IS NULL))'
      'ORDER BY CURVA, SEQCALCULO, ITEM')
    ValidateWithMask = True
    Left = 146
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PERFIL'
        ParamType = ptInput
      end>
    object qryPerfisAtualizacaoCURVA: TStringField
      FieldName = 'CURVA'
      Size = 60
    end
    object qryPerfisAtualizacaoITEM: TStringField
      FieldName = 'ITEM'
      Size = 60
    end
    object qryPerfisAtualizacaoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 12
    end
    object qryPerfisAtualizacaoREGRA: TStringField
      FieldName = 'REGRA'
      Size = 60
    end
    object qryPerfisAtualizacaoFLGMOEDA: TStringField
      FieldName = 'FLGMOEDA'
      Size = 1
    end
    object qryPerfisAtualizacaoFLGDESTACADO: TStringField
      FieldName = 'FLGDESTACADO'
      Size = 1
    end
    object qryPerfisAtualizacaoFLGCENTRALIZADO: TStringField
      FieldName = 'FLGCENTRALIZADO'
      Size = 1
    end
    object qryPerfisAtualizacaoSEQCALCULO: TFloatField
      FieldName = 'SEQCALCULO'
    end
    object qryPerfisAtualizacaoIDCURVARENFIX: TFloatField
      FieldName = 'IDCURVARENFIX'
    end
    object qryPerfisAtualizacaoTIPOITEM: TStringField
      FieldName = 'TIPOITEM'
      Size = 18
    end
    object qryPerfisAtualizacaoFLGEXIBENAOPER: TStringField
      FieldName = 'FLGEXIBENAOPER'
      Size = 1
    end
  end
  object rptPerfisAtualizacao: TppReport
    AutoStop = False
    DataPipeline = pplPerfisAtualizacao
    OnStartPage = rptPerfisAtualizacaoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Perfis de Atualização'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 142
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplPerfisAtualizacao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Perfis de Atualização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 78581
        mmTop = 8731
        mmWidth = 42598
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ITEM'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 0
        mmWidth = 51329
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CODIGO'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'REGRA'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 0
        mmWidth = 59796
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FLGEXIBENAOPER'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SEQCALCULO'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 183092
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'TIPOITEM'
        DataPipeline = pplPerfisAtualizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPerfisAtualizacao'
        mmHeight = 3175
        mmLeft = 147902
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CURVA'
      DataPipeline = pplPerfisAtualizacao
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplPerfisAtualizacao'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object shpCabPerfil: TppShape
          UserName = 'shpCabPerfil'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 8467
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Perfil: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3704
          mmTop = 529
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CURVA'
          DataPipeline = pplPerfisAtualizacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPerfisAtualizacao'
          mmHeight = 3175
          mmLeft = 13494
          mmTop = 529
          mmWidth = 124884
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3969
          mmTop = 4763
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 116681
          mmTop = 4763
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Regra Utilizada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 56356
          mmTop = 4763
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Exibe na Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 168540
          mmTop = 1588
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Seq. de Cálculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 6615
          mmLeft = 183357
          mmTop = 1588
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Tipo de Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 6615
          mmLeft = 147902
          mmTop = 1588
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
      end
    end
  end
end
