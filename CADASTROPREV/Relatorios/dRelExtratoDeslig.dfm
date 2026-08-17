inherited dtmRelExtratoDeslig: TdtmRelExtratoDeslig
  Left = 196
  Top = 138
  Width = 479
  Height = 231
  Caption = 'Extrato de desligamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object ppExtSimDeslig: TppBDEPipeline
    DataSource = dsExtSimDeslig
    UserName = 'ExtSimDeslig'
    Left = 157
    Top = 88
    object ppExtSimDesligppField1: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppExtSimDesligppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppExtSimDesligppField3: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppExtSimDesligppField4: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppExtSimDesligppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppExtSimDesligppField6: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppExtSimDesligppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppExtSimDesligppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSIMULADESLIG'
      FieldName = 'IDSIMULADESLIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppExtSimDesligppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppExtSimDesligppField10: TppField
      FieldAlias = 'NOMEEVENTO'
      FieldName = 'NOMEEVENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppExtSimDesligppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEVENTOGERADOR'
      FieldName = 'IDEVENTOGERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppExtSimDesligppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppExtSimDesligppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object dsExtSimDeslig: TwwDataSource
    DataSet = qryExtSimDeslig
    Left = 34
    Top = 144
  end
  object qryExtSimDeslig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.NOME NOMEPARTICIPANTE, PF.DATANASC,'
      '       PP.IDPLANOPREV, PL.NOME NOMEPLANO,'
      '       EL.MATRICULA, EL.IDPESSJUR, EL.DATADEMISSAO, '
      '       PJ.NOME NOMEPATRO, PP.INSCRICAODATA,'
      '       PP.INSCRICAONUMERO, SD.IDSIMULADESLIG,'
      '       CF.ORDEM, EG.NOME NOMEEVENTO,'
      '       SD.IDEVENTOGERADOR, SD.DESCRICAO, SD.VALOR,'
      '       TO_CHAR(SD.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39') DATACALCULO,'
      '       EL.TEMPOSIMPLES TEMPOCONTRIBTOTAL,'
      '       :ANO TEMPOCONTRIBANOS,'
      '       :MES TEMPOCONTRIBMESES,'
      '       :DIA TEMPOCONTRIBDIAS'
      'FROM ELEGPATRO EL, PESSOA PE, PESSOA PJ, PESSOAFISICA PF, '
      '     PARTPREVPLAN PP, SIMULADESLIG SD, CFGSIMULADESLIG CF,'
      '     PLANPREV PL, EVENTOGERADOR EG'
      'WHERE PP.IDPESSOA        = :PIDPESSOA'
      '  AND PP.IDPESSJUR       = :PIDPESSJUR'
      '  AND PP.IDPLANOPREV     = :PIDPLANOPREV'
      '  AND PP.IDPESSOA        = EL.IDPESSOA'
      '  AND PP.IDPESSJUR       = EL.IDPESSJUR'
      '  AND PP.IDPLANOPREV     = PL.IDPLANOPREV'
      '  AND PP.FLGDESATIVADO   = 0'
      '  AND EL.IDPESSOA        = PE.IDPESSOA'
      '  AND PE.IDPESSOA        = PF.IDPESSOA'
      '  AND EL.IDPESSJUR       = PJ.IDPESSOA'
      '  AND SD.IDPESSOA        = PP.IDPESSOA'
      '  AND SD.IDPESSJUR       = PP.IDPESSJUR'
      '  AND SD.IDPLANOPREV     = PP.IDPLANOPREV'
      '  AND CF.IDPLANOPREV     = SD.IDPLANOPREV'
      '  AND CF.IDEVENTOGERADOR = SD.IDEVENTOGERADOR'
      '  AND CF.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY CF.ORDEM, SD.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL,'
      
        '       RTRIM(E.LOGRADOURO)||'#39' - '#39'||RTRIM(E.NUMERO)||'#39' '#39'||RTRIM(E' +
        '.COMPLEMENTO)||'#39' - '#39'||'
      
        '       RTRIM(E.BAIRRO)||'#39' - '#39'||RTRIM(C.NOME)||'#39' - '#39'||RTRIM(ES.CO' +
        'DESTADO) AS LOGRADOURO,'
      '       E.IDENDERECO,E.CEP, I.IMAGEM'
      'FROM   PESSOA P, ENDPESS E, IMAGENS I, CIDADES C, ESTADO ES'
      'WHERE ( P.IDPESSOA      = :pFundacao      )'
      'AND   ( E.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      'AND   ( C.IDCIDADES(+)  = E.IDCIDADES     )'
      'AND   ( ES.IDESTADO(+)  = C.IDESTADO      )'
      'AND   ( I.IDIMAGEM(+)   = P.IDIMAGEM      )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 364
    Top = 16
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 422
    Top = 16
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 174
      DisplayWidth = 174
      Position = 2
    end
    object ppFundacaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object ppFundacaoppField6: TppField
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
  object dsgExtSimDeslig: TppDesigner
    Caption = 'Demonstrativo de Desligamento'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = rpExtSimDeslig
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 249
    Top = 118
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 365
    Top = 74
  end
  object rpExtSimDeslig: TppReport
    AutoStop = False
    DataPipeline = ppExtSimDeslig
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 160
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtSimDeslig'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 164042
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label1'
        Caption = 'EXTRATO DE OPÇÕES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7535
        mmLeft = 69779
        mmTop = 21696
        mmWidth = 69723
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 16298
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4191
        mmLeft = 41540
        mmTop = 7938
        mmWidth = 57827
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 13229
        mmWidth = 41021
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48683
        mmTop = 17463
        mmWidth = 12531
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 15346
        mmLeft = 0
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label2'
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 43127
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 528
        mmTop = 47096
        mmWidth = 38693
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        Caption = 'DATA ADMISSÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 43127
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 130175
        mmTop = 47096
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label5'
        Caption = 'PATROCINADORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 76729
        mmTop = 43127
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOMEPATR'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 76729
        mmTop = 47096
        mmWidth = 30014
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label8'
        Caption = 'Institutos Previstos na Lei Complementar 109/2001'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 53711
        mmTop = 29898
        mmWidth = 102659
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clGrayText
        mmHeight = 6085
        mmLeft = 0
        mmTop = 35454
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label9'
        Caption = 'DADOS DO PARTICIPANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36513
        mmWidth = 45773
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'PLANO PREVIDENCIÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 528
        mmTop = 51329
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 528
        mmTop = 55298
        mmWidth = 12319
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'DATA INSCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 51329
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 130440
        mmTop = 55298
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label10'
        Caption = 'DATA DESLIGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 528
        mmTop = 59531
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'DATADEMISSAO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 528
        mmTop = 63500
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label11'
        Caption = 'Nº MATRÍCULA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 43127
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 169598
        mmTop = 47096
        mmWidth = 11896
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label12'
        Caption = 'Nº INSCRIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 169598
        mmTop = 51329
        mmWidth = 19579
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 169863
        mmTop = 55298
        mmWidth = 6265
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label101'
        Caption = 'DATA NASCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 59531
        mmWidth = 27517
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 130175
        mmTop = 63500
        mmWidth = 14139
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clGrayText
        mmHeight = 6085
        mmLeft = 0
        mmTop = 67998
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label7'
        Caption = '1 - AUTOPATROCÍNIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 1059
        mmTop = 69056
        mmWidth = 37169
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label13'
        Caption = 'De Participação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3302
        mmLeft = 5080
        mmTop = 79904
        mmWidth = 21251
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'SALPARTICIPACAO'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 142367
        mmTop = 80433
        mmWidth = 16976
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'AUTOPAT_NOME_CONTRIB_ATUAL_1'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3302
        mmLeft = 5080
        mmTop = 92869
        mmWidth = 58886
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'AUTOPAT_VALOR_CONTRIB_ATUAL_1'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 146315
        mmTop = 92870
        mmWidth = 13039
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clGrayText
        mmHeight = 6085
        mmLeft = 0
        mmTop = 107156
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label14'
        Caption = '2 - BENEFÍCIO PROPORCIONAL DIFERIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 108215
        mmWidth = 71702
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label15'
        Caption = 'Elegilibidade a aposentadoria normal a partir de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 115623
        mmWidth = 65617
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'DATADEMISSAO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 145141
        mmTop = 116152
        mmWidth = 14139
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'DIFERIMENTO_NOME_RESERVA_1'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3302
        mmLeft = 2381
        mmTop = 120121
        mmWidth = 71416
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'DIFERIMENTO_SALDO_1'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 125720
        mmTop = 120386
        mmWidth = 33824
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clGrayText
        mmHeight = 6085
        mmLeft = 0
        mmTop = 125942
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label16'
        Caption = '3 - PORTABILIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 127000
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label17'
        Caption = 'Valor do direito acumulado no plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 134409
        mmWidth = 49213
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'PORTABILIDADE_222'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 142303
        mmTop = 134938
        mmWidth = 16976
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = clGrayText
        mmHeight = 6085
        mmLeft = 0
        mmTop = 139436
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label18'
        Caption = '4 - RESGATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 140494
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label19'
        Caption = 'Valor Bruto do Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 148167
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'RESGATE_91'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 142303
        mmTop = 148696
        mmWidth = 16976
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label20'
        Caption = 'De Manutenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3302
        mmLeft = 5080
        mmTop = 84138
        mmWidth = 20870
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'AUTOPAT_SALMANUT'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 143871
        mmTop = 84667
        mmWidth = 15409
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label21'
        Caption = 'Salários:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3302
        mmLeft = 0
        mmTop = 75936
        mmWidth = 11938
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label22'
        Caption = 'Contribuições'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3302
        mmLeft = 0
        mmTop = 88900
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'AUTOPAT_NOME_CONTRIB_ATUAL_2'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3302
        mmLeft = 5080
        mmTop = 97102
        mmWidth = 50927
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'AUTOPAT_VALOR_CONTRIB_ATUAL_2'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 146240
        mmTop = 97102
        mmWidth = 13039
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'AUTOPAT_NOME_CONTRIB_ATUAL_3'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3302
        mmLeft = 5080
        mmTop = 101071
        mmWidth = 48429
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'AUTOPAT_VALOR_CONTRIB_ATUAL_3'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3260
        mmLeft = 147807
        mmTop = 101071
        mmWidth = 11472
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
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
        mmWidth = 197380
        BandType = 8
      end
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'SISTEMA'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3387
        mmLeft = 529
        mmTop = 3175
        mmWidth = 23453
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDEVENTOGERADOR'
      DataPipeline = ppExtSimDeslig
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtSimDeslig'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365063E70726F6365647572652056
        61726961626C65733B0D0A76617220200D0A69436F6E74203A20496E74656765
        723B0D0A626567696E0D0A0D0A656E643B0D0A0000}
    end
    object TppParameterList
    end
  end
end
