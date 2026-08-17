inherited relOcorrTipo: TrelOcorrTipo
  Left = 128
  Top = 212
  Caption = 'Relatório de Ocorrências Médicas por Tipo'
  ClientHeight = 301
  ClientWidth = 633
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 0
    Top = 0
    Width = 635
    Height = 898
    BeforePrint = qrBeforePrint
    DataSet = tblOcorr
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    ReportTitle = 'Relatório de Ocorrências Médicas por Tipo'
    Zoom = 80
    inherited PageHeaderBand1: TQRBand [0]
      Left = 30
      Top = 30
      Width = 575
      Height = 61
      Size.Values = (
        201.744791666667
        1901.69270833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 215
        Top = 7
        Width = 145
        Height = 19
        Size.Values = (
          62.8385416666667
          711.067708333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRSysData
        Left = 245
        Top = 29
        Width = 84
        Height = 18
        Size.Values = (
          59.53125
          810.286458333333
          95.9114583333333
          277.8125)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand [1]
      Left = 30
      Top = 91
      Width = 575
      Height = 32
      Size.Values = (
        105.833333333333
        1901.69270833333)
      inherited QRLabelFixo: TQRLabel
        Left = 1
        Top = 18
        Width = 60
        Height = 12
        Size.Values = (
          39.6875
          3.30729166666667
          59.53125
          198.4375)
        Caption = 'Tipo / Pessoa'
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 261
        Top = 18
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          863.203125
          59.53125
          125.677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Real'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 314
        Top = 18
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1038.48958333333
          59.53125
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Examinador'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 470
        Top = 18
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1554.42708333333
          59.53125
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 528
        Top = 18
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1746.25
          59.53125
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 198
        Top = 2
        Width = 40
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          654.84375
          6.61458333333333
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Período: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlabDatIni: TQRLabel
        Left = 255
        Top = 2
        Width = 25
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          843.359375
          6.61458333333333
          82.6822916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DatIni'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 314
        Top = 2
        Width = 6
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1038.48958333333
          6.61458333333333
          19.84375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'a'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlabDatFim: TQRLabel
        Left = 338
        Top = 2
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1117.86458333333
          6.61458333333333
          99.21875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DatFim'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited PageFooterBand1: TQRBand [2]
      Left = 30
      Top = 281
      Width = 575
      Height = 32
      Size.Values = (
        105.833333333333
        1901.69270833333)
      inherited QRSysData1: TQRSysData
        Left = 530
        Top = 17
        Width = 45
        Height = 12
        Size.Values = (
          39.6875
          1752.86458333333
          56.2239583333333
          148.828125)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 262
        Top = 17
        Width = 50
        Height = 12
        Size.Values = (
          39.6875
          866.510416666667
          56.2239583333333
          165.364583333333)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Top = 17
        Width = 127
        Height = 12
        Size.Values = (
          39.6875
          0
          56.2239583333333
          420.026041666667)
        FontSize = 8
      end
    end
    object qrbTotais: TQRBand [3]
      Left = 30
      Top = 239
      Width = 575
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 0
      AlignToBottom = False
      BeforePrint = qrbTotaisBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        138.90625
        1901.69270833333)
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 9
        Top = 24
        Width = 69
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          29.765625
          79.375
          228.203125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Tipos:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 136
        Top = 24
        Width = 85
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          449.791666666667
          79.375
          281.119791666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Pessoas:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 288
        Top = 24
        Width = 118
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          952.5
          79.375
          390.260416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Dias de Licença:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotPes: TQRLabel
        Left = 229
        Top = 24
        Width = 18
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          757.369791666667
          79.375
          59.53125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotPes'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotCur: TQRLabel
        Left = 89
        Top = 24
        Width = 20
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          294.348958333333
          79.375
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTotCur'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotHor: TQRLabel
        Left = 412
        Top = 24
        Width = 42
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1362.60416666667
          79.375
          138.90625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlTotHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbSubTot: TQRBand [4]
      Left = 30
      Top = 213
      Width = 575
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbSubTotBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        85.9895833333333
        1901.69270833333)
      BandType = rbGroupFooter
      object qrlSubHor: TQRLabel
        Left = 265
        Top = 8
        Width = 34
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          876.432291666667
          26.4583333333333
          112.447916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlMdCurs: TQRLabel
        Left = 474
        Top = 8
        Width = 30
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1567.65625
          26.4583333333333
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MdCur'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 196
        Top = 8
        Width = 52
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          648.229166666667
          26.4583333333333
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total do Tipo:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 385
        Top = 8
        Width = 66
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1273.30729166667
          26.4583333333333
          218.28125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação Média:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 149
      Width = 575
      Height = 32
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        105.833333333333
        1901.69270833333)
      object QRDBText1: TQRDBText
        Left = 1
        Top = 10
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          3.30729166666667
          33.0729166666667
          324.114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblOcorr
        DataField = 'DESCRTIPOOCMED'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited qrMestre: TQRGroup
      Left = 30
      Top = 123
      Width = 575
      Height = 26
      Size.Values = (
        85.9895833333333
        1901.69270833333)
    end
    object qrsubdt: TQRSubDetail
      Left = 30
      Top = 181
      Width = 575
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsubdtBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1901.69270833333)
      Master = qr
      DataSet = tblHstasm
      FooterBand = qrbSubTot
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText3: TQRDBText
        Left = 17
        Top = 10
        Width = 24
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          56.2239583333333
          33.0729166666667
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPessoal
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 257
        Top = 10
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          849.973958333333
          33.0729166666667
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHstasm
        DataField = 'DATAREAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 314
        Top = 10
        Width = 152
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1038.48958333333
          33.0729166666667
          502.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblHstasm
        DataField = 'EXAMINADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlAval: TQRLabel
        Left = 475
        Top = 10
        Width = 27
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1570.96354166667
          33.0729166666667
          89.296875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Aval'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlResult: TQRLabel
        Left = 535
        Top = 10
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1769.40104166667
          33.0729166666667
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object tblHstasm: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOCMED'
    MasterFields = 'CODTIPOOCMED'
    MasterSource = ds2
    TableName = 'CM.HSTASMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 77
    Top = 270
    object tblHstasmIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tblHstasmCODTIPOOCMED: TFloatField
      FieldName = 'CODTIPOOCMED'
      Required = True
    end
    object tblHstasmDATAREAL: TDateTimeField
      FieldName = 'DATAREAL'
    end
    object tblHstasmCODCID: TFloatField
      FieldName = 'CODCID'
    end
    object tblHstasmEXAMINADOR: TStringField
      FieldName = 'EXAMINADOR'
      Size = 40
    end
    object tblHstasmOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object tblHstasmDATAPLAN: TDateTimeField
      FieldName = 'DATAPLAN'
    end
    object tblHstasmAVALIACAO: TFloatField
      FieldName = 'AVALIACAO'
    end
    object tblHstasmLICENCA: TFloatField
      FieldName = 'LICENCA'
    end
    object tblHstasmNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object tblOcorr: TwwTable
    DatabaseName = 'BaseDados'
    OnFilterRecord = tblOcorrFilterRecord
    IndexFieldNames = 'CODTIPOOCMED'
    TableName = 'CM.TIPOCMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 183
    Top = 267
  end
  object ds: TwwDataSource
    DataSet = tblHstasm
    Left = 38
    Top = 267
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 245
    Top = 266
  end
  object ds2: TwwDataSource
    DataSet = tblOcorr
    Left = 144
    Top = 270
  end
end
