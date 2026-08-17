inherited relProgTipo: TrelProgTipo
  Left = 47
  Top = 238
  Caption = 'Relatório de Programação de Exames ou Testes por Tipo'
  ClientHeight = 301
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    BeforePrint = qrBeforePrint
    DataSet = qryTabPer
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
    ReportTitle = 'Programação de Exames ou Testes por Tipo'
    inherited PageFooterBand1: TQRBand
      Top = 338
      Size.Values = (
        105.833333333333
        1899.70833333333)
      inherited QRSysData1: TQRSysData
        Left = 618
        Width = 100
        Size.Values = (
          39.6875
          1635.125
          55.5625
          264.583333333333)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Size.Values = (
          39.6875
          865.1875
          55.5625
          166.6875)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Size.Values = (
          39.6875
          0
          55.5625
          420.6875)
        FontSize = 8
      end
    end
    inherited PageHeaderBand1: TQRBand
      Height = 77
      Size.Values = (
        203.729166666667
        1899.70833333333)
      inherited qrlblNomeCli: TQRLabel
        Size.Values = (
          60.8541666666667
          709.083333333333
          23.8125
          478.895833333333)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Size.Values = (
          60.8541666666667
          656.166666666667
          95.25
          587.375)
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 259
        Top = 59
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          685.270833333333
          156.104166666667
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
        Left = 330
        Top = 59
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          873.125
          156.104166666667
          82.0208333333333)
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
      object QRLabel5: TQRLabel
        Left = 404
        Top = 59
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1068.91666666667
          156.104166666667
          18.5208333333333)
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
        Left = 434
        Top = 59
        Width = 38
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1148.29166666667
          156.104166666667
          100.541666666667)
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
    inherited qrCabecalho: TQRBand
      Top = 115
      Height = 18
      Enabled = False
      Size.Values = (
        47.625
        1899.70833333333)
      inherited QrLabel4: TQRLabel
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 18
        Top = 3
        Width = 81
        Size.Values = (
          39.6875
          47.625
          7.9375
          214.3125)
        Caption = 'Tipo de Exame'
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Top = 166
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        55.5625
        1899.70833333333)
      object QRDBText4: TQRDBText
        Left = 18
        Top = 3
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          47.625
          7.9375
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabPer
        DataField = 'DESCRTIPOOCMED'
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
      object QRLabel10: TQRLabel
        Left = 377
        Top = 3
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          997.479166666667
          7.9375
          190.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Planejada'
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
        Left = 530
        Top = 3
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1402.29166666667
          7.9375
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observação'
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
    inherited qrMestre: TQRGroup
      Top = 133
      Size.Values = (
        87.3125
        1899.70833333333)
    end
    object qrsubdt: TQRSubDetail
      Left = 38
      Top = 187
      Width = 718
      Height = 40
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
        1899.70833333333)
      Master = qr
      DataSet = tblPeriodo
      FooterBand = qrbSubTot
      PrintBefore = False
      PrintIfEmpty = False
    end
    object qrbTotais: TQRBand
      Left = 38
      Top = 286
      Width = 718
      Height = 52
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
        137.583333333333
        1899.70833333333)
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 172
        Top = 30
        Width = 146
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          455.083333333333
          79.375
          386.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Exames/Testes:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 12
        Top = 30
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          31.75
          79.375
          227.541666666667)
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
      object qrlTotPes: TQRLabel
        Left = 325
        Top = 30
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          859.895833333333
          79.375
          58.2083333333333)
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
        Left = 103
        Top = 30
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          272.520833333333
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
    end
    object qrbPessoas: TQRSubDetail
      Left = 38
      Top = 227
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbPessoasBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = qrsubdt
      DataSet = tblFuncio
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText2: TQRDBText
        Left = 38
        Top = 3
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          100.541666666667
          7.9375
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPessoa
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 56
        Top = 21
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          148.166666666667
          55.5625
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCargo
        DataField = 'TITULO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlDatPlan: TQRLabel
        Left = 379
        Top = 14
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1002.77083333333
          37.0416666666667
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlDatPlan'
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
      object qrlObserv: TQRLabel
        Left = 529
        Top = 14
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1399.64583333333
          37.0416666666667
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlObserv'
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
    object qrbSubTot: TQRBand
      Left = 38
      Top = 267
      Width = 718
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbSubTotBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      BandType = rbGroupFooter
      object QRLabel6: TQRLabel
        Left = 155
        Top = 2
        Width = 163
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          410.104166666667
          5.29166666666667
          431.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Número de Exames/Testes:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlNumPes: TQRLabel
        Left = 325
        Top = 2
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          859.895833333333
          5.29166666666667
          58.2083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlNumPes'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object tblFuncio: TwwTable
    DatabaseName = 'BaseDados'
    OnFilterRecord = tblFuncioFilterRecord
    IndexFieldNames = 'IDPESSOA'
    ReadOnly = True
    TableName = 'CM.FUNCIONARIO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 135
    Top = 3
  end
  object tblHstasm: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;CODTIPOOCMED;NUMSEQ'
    MasterFields = 'IDPESSOA'
    MasterSource = dsX
    TableName = 'CM.HSTASMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 194
    Top = 3
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
    object tblHstasmDATAPLAN: TDateTimeField
      FieldName = 'DATAPLAN'
    end
    object tblHstasmNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object tblPeriodo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOCMED'
    MasterFields = 'CODTIPOOCMED'
    MasterSource = ds2
    TableName = 'CM.PEREXAME'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 358
    Top = 1
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = dsX
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 414
  end
  object dsX: TwwDataSource
    DataSet = tblFuncio
    Left = 96
  end
  object ds2: TwwDataSource
    DataSet = qryTabPer
    Left = 239
  end
  object qryTabPer: TwwQuery
    DatabaseName = 'BaseDados'
    OnFilterRecord = qryTabPerFilterRecord
    SQL.Strings = (
      'Select Distinct TIPOCMED.CODTIPOOCMED, '
      'TIPOCMED.DESCRTIPOOCMED, PEREXAME.CODTIPOOCMED '
      'from TIPOCMED, PEREXAME '
      'where TIPOCMED.CODTIPOOCMED = PEREXAME.CODTIPOOCMED '
      'order by TIPOCMED.DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 285
    Top = 2
  end
  object tblSituacao: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSITFUNC'
    ReadOnly = True
    TableName = 'CM.SITFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 501
    Top = 2
  end
  object dsHst: TwwDataSource
    DataSet = tblHstasm
    Left = 344
    Top = 219
  end
  object tblPesFis: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = dsX
    ReadOnly = True
    TableName = 'CM.PESSOAFISICA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 48
    Top = 3
  end
  object tblPessoa: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = dsX
    ReadOnly = True
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 48
    Top = 54
  end
  object qryUltSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hstasmed'
      'where  IDPESSOA = :IDPESSOA'
      'and  CODTIPOOCMED = :CODTIPOOCMED')
    ValidateWithMask = True
    Left = 592
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
end
