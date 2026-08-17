inherited frmCartaCobrMT: TfrmCartaCobrMT
  Left = 222
  Top = 212
  Caption = ' Configuração da Carta de Cobrança'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PnlCadastro: TPanel
      inherited Label1: TLabel
        Left = 12
      end
      inherited DeRelatorio: TwwDBEdit
        Left = 12
      end
      inherited BtnDesenho: TBitBtn
        Left = 414
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    OperComparador.Strings = (
      '-1')
  end
  inherited RptModelo: TppReport
    PrinterSetup.DocumentName = 'Report'
    Template.FileName = ''
    Left = 260
    Top = 111
    mmColumnWidth = 0
    object RptCartaHeaderBand1: TppHeaderBand [0]
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 1852
      mmPrintPosition = 0
    end
    inherited ppDetailBand2: TppDetailBand
      mmHeight = 3704
      object RptCartaDBText1: TppDBText
        UserName = 'RptCartaDBText1'
        DataField = 'NUMDOC'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object RptCartaDBText6: TppDBText
        UserName = 'RptCartaDBText6'
        DataField = 'DATAEMISSAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object RptCartaDBText7: TppDBText
        UserName = 'RptCartaDBText7'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object RptCartaDBText8: TppDBText
        UserName = 'RptCartaDBText8'
        DataField = 'DATAVENCTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66675
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptCartaDBText9: TppDBText
        UserName = 'RptCartaDBText9'
        DataField = 'INDICECORRECAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object RptCartaDBText10: TppDBText
        UserName = 'RptCartaDBText10'
        DataField = 'SALDO'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object RptCartaDBText11: TppDBText
        UserName = 'RptCartaDBText11'
        DataField = 'SALDOOM'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object RptCartaDBText12: TppDBText
        UserName = 'RptCartaDBText12'
        DataField = 'VALORJUROS'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object RptCartaDBText13: TppDBText
        UserName = 'RptCartaDBText13'
        DataField = 'VLRMULTA'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 97102
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
    end
    object RptCartaFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppCalc2: TppCalc
        UserName = 'Calc2'
        Alignment = taCenter
        CalcType = ctPageSetDesc
        CustomType = dtString
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 1588
        mmWidth = 17198
        BandType = 8
      end
    end
    object Group1: TppGroup
      BreakName = 'IDPESSOA'
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object GroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 48683
        mmPrintPosition = 0
        object RptCartaLabel7: TppLabel
          UserName = 'RptCartaLabel7'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 44979
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel8: TppLabel
          UserName = 'RptCartaLabel8'
          Caption = 'Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 29633
          mmTop = 44979
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel9: TppLabel
          UserName = 'RptCartaLabel9'
          Caption = 'Programada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 48948
          mmTop = 44979
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel10: TppLabel
          UserName = 'RptCartaLabel10'
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 67998
          mmTop = 44979
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel11: TppLabel
          UserName = 'RptCartaLabel11'
          Caption = 'Índice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 87048
          mmTop = 44979
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel12: TppLabel
          UserName = 'RptCartaLabel12'
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 114036
          mmTop = 44979
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel13: TppLabel
          UserName = 'RptCartaLabel13'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 138113
          mmTop = 44979
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel14: TppLabel
          UserName = 'RptCartaLabel14'
          Caption = 'Valor O.M.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 155840
          mmTop = 44979
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel15: TppLabel
          UserName = 'RptCartaLabel15'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 187325
          mmTop = 44979
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel4: TppLabel
          UserName = 'RptCartaLabel4'
          Caption = 'Constam em aberto os documentos abaixo listados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          mmHeight = 4498
          mmLeft = 1323
          mmTop = 34131
          mmWidth = 89429
          BandType = 3
          GroupNo = 0
        end
        object RptCartaDBText2: TppDBText
          UserName = 'RptCartaDBText2'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 7673
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object RptCartaLabel2: TppLabel
          UserName = 'RptCartaLabel2'
          Caption = 'Ao Sr(a).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 1323
          mmTop = 1852
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptCartaDBText3: TppDBText
          UserName = 'RptCartaDBText3'
          AutoSize = True
          DataField = 'ENDERECLI1'
          DataPipeline = PpDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 12171
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object RptCartaDBText4: TppDBText
          UserName = 'RptCartaDBText4'
          AutoSize = True
          DataField = 'ENDERECLI2'
          DataPipeline = PpDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 16669
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object RptCartaDBText5: TppDBText
          UserName = 'RptCartaDBText5'
          AutoSize = True
          DataField = 'TELCLI'
          DataPipeline = PpDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 21167
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppImage: TppImage
          UserName = 'Imagem'
          MaintainAspectRatio = False
          mmHeight = 21167
          mmLeft = 166423
          mmTop = 794
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
      end
      object GroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Favor desconsiderar caso já tenha pago.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 5292
          mmWidth = 64294
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'SALDO'
          DataPipeline = PpDados
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 172244
          mmTop = 265
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SALDOOM'
          DataPipeline = PpDados
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 265
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALORJUROS'
          DataPipeline = PpDados
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 265
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRMULTA'
          DataPipeline = PpDados
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 99219
          mmTop = 265
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 87048
          mmTop = 265
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  inherited PpDados: TppBDEPipeline
    object PpDadosppField1: TppField
      FieldAlias = 'VALORPRINCIPAL'
      FieldName = 'VALORPRINCIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDadosppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDadosppField3: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDadosppField4: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDadosppField5: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDadosppField6: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDadosppField7: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDadosppField8: TppField
      FieldAlias = 'INDICECORRECAO'
      FieldName = 'INDICECORRECAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDadosppField9: TppField
      FieldAlias = 'VLRMULTA'
      FieldName = 'VLRMULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDadosppField10: TppField
      FieldAlias = 'VALORJUROS'
      FieldName = 'VALORJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDadosppField11: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDadosppField12: TppField
      FieldAlias = 'VALORLIQUIDO'
      FieldName = 'VALORLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDadosppField13: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDadosppField14: TppField
      FieldAlias = 'SALDOOM'
      FieldName = 'SALDOOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDadosppField15: TppField
      FieldAlias = 'ENDERECLI1'
      FieldName = 'ENDERECLI1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDadosppField16: TppField
      FieldAlias = 'ENDERECLI2'
      FieldName = 'ENDERECLI2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDadosppField17: TppField
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDadosppField18: TppField
      FieldAlias = 'TELCLI'
      FieldName = 'TELCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDadosppField19: TppField
      FieldAlias = 'TELFAX'
      FieldName = 'TELFAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  inherited SqlDados: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 as valorprincipal,'
      '         P.RAZAOSOCIAL,'
      '         DOCUMENTO.CODDOCUMENTO,'
      
        '         RTRIM(TO_CHAR(DOCUMENTO.NODOCUMENTO)) || '#39' '#39'  || DOCUME' +
        'NTO.COMPLDOCUMENTO AS NUMDOC,'
      '         DOCUMENTO.DATAVENCTO,'
      '         DOCUMENTO.DATAPROGRAMADA,'
      '         DOCUMENTO.DATAEMISSAO,'
      '         DOCUMENTO.INDICECORRECAO,'
      '         DOCUMENTO.VLRMULTA,'
      '         DOCUMENTO.VALORJUROS,'
      '         P.IDPESSOA,'
      
        '         DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39 +
        'D'#39',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DE' +
        'BCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1)) AS VALORLIQUID' +
        'O,'
      
        '         DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39 +
        'D'#39',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DE' +
        'BCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1)) AS SALDO,'
      
        '         DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39 +
        'D'#39',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA),D' +
        'ECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOROUTRAMOEDA,LANCTOD' +
        'OCUM.VALOROUTRAMOEDA*-1)) AS SALDOOM,'
      
        '         E.Logradouro || '#39','#39' || E.Numero || '#39'/'#39' || E.Complemento' +
        ' || '#39' '#39' || E.BAIRRO AS ENDERECLI1,'
      
        '         E.CEP ||  '#39' - '#39' || C.NOME || '#39' - '#39' || ES.CODESTADO AS E' +
        'NDERECLI2 ,e.idendereco,'
      ''
      
        '         '#39'('#39'|| '#39'     '#39' ||  '#39') '#39' || '#39'                    '#39' AS TEL' +
        'CLI,'
      
        '         '#39'('#39'|| '#39'     '#39' ||  '#39') '#39' || '#39'                    '#39' AS TEL' +
        'fax'
      '        FROM'
      '        DOCUMENTO, LANCTODOCUM, PESSOA P,'
      '        ENDPESS E, CIDADES C, ESTADO ES'
      ''
      '       WHERE'
      '       1=2'
      ''
      ' '
      ''
      ' '
      '')
  end
  inherited CdsDados: TCMClientDataSet
    object CdsDadosVALORPRINCIPAL: TFloatField
      FieldName = 'VALORPRINCIPAL'
    end
    object CdsDadosRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDadosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDadosNUMDOC: TStringField
      FieldName = 'NUMDOC'
      Size = 44
    end
    object CdsDadosDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsDadosDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDadosDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsDadosINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
    end
    object CdsDadosVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
    end
    object CdsDadosVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object CdsDadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsDadosVALORLIQUIDO: TFloatField
      FieldName = 'VALORLIQUIDO'
    end
    object CdsDadosSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsDadosSALDOOM: TFloatField
      FieldName = 'SALDOOM'
    end
    object CdsDadosENDERECLI1: TStringField
      FieldName = 'ENDERECLI1'
      Size = 111
    end
    object CdsDadosENDERECLI2: TStringField
      FieldName = 'ENDERECLI2'
      Size = 67
    end
    object CdsDadosIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object CdsDadosTELCLI: TStringField
      FieldName = 'TELCLI'
      FixedChar = True
      Size = 28
    end
    object CdsDadosTELFAX: TStringField
      FieldName = 'TELFAX'
      FixedChar = True
      Size = 28
    end
  end
  inherited SqlReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '    REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
  end
end
