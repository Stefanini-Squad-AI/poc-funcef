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
  object rpExtSimDeslig: TppReport
    AutoStop = False
    DataPipeline = ppExtSimDeslig
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 157
    Top = 144
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo de Desligamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 72231
        mmTop = 21696
        mmWidth = 64823
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
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
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
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7938
        mmWidth = 25400
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
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 13229
        mmWidth = 20373
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
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 17463
        mmWidth = 5821
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
        mmHeight = 15346
        mmLeft = 0
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label2'
        Caption = 'Participante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 28575
        mmWidth = 15875
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
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 28575
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        Caption = 'No. de Inscrição :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 32544
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText2'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 32544
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 32544
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText3'
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
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 32544
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label5'
        Caption = 'Patrocinadora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 28575
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 28575
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label6'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 36513
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText37: TppDBText
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
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 36513
        mmWidth = 17992
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 27517
        mmWidth = 197300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 40746
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label9'
        Caption = 'OPÇÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 42069
        mmWidth = 15081
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 46831
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$ #,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 0
        mmWidth = 9525
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
        mmWidth = 197380
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
    end
    object ppGroup1: TppGroup
      BreakName = 'IDEVENTOGERADOR'
      DataPipeline = ppExtSimDeslig
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'NOMEEVENTO'
          DataPipeline = ppExtSimDeslig
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line4'
          Pen.Style = psDot
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'ORDEM'
          DataPipeline = ppExtSimDeslig
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 4233
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label7'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 4233
          mmWidth = 1588
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
    object TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365063E70726F6365647572652056
        61726961626C65733B0D0A76617220200D0A69436F6E74203A20496E74656765
        723B0D0A626567696E0D0A0D0A656E643B0D0A0000}
    end
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
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = rpExtSimDeslig
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
end
