inherited frmGerRecContr: TfrmGerRecContr
  Left = 13
  Top = 114
  Caption = 'Relatório de Recebimento de Contribuições'
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = -104
    Top = 12
    Width = 1344
    Height = 960
    DataSet = qrycontr
    Page.Orientation = poLandscape
    Page.PaperSize = qr10X14
    Page.Values = (
      100
      2540
      100
      3556
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 214
      Width = 1268
      Size.Values = (
        105.833333333333
        3354.91666666667)
      inherited QRSysData1: TQRSysData
        Left = 1212
        Size.Values = (
          39.6875
          3206.75
          55.5625
          148.166666666667)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 602
        Size.Values = (
          39.6875
          1592.79166666667
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
      Width = 1268
      Height = 75
      Size.Values = (
        198.4375
        3354.91666666667)
      inherited qrlblNomeCli: TQRLabel
        Left = 543
        Size.Values = (
          60.8541666666667
          1436.6875
          23.8125
          478.895833333333)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 448
        Width = 372
        Size.Values = (
          60.8541666666667
          1185.33333333333
          95.25
          984.25)
        Caption = 'Relatório de Recebimento de Contribuições'
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Width = 1268
      Size.Values = (
        87.3125
        3354.91666666667)
      inherited QRLabel4: TQRLabel
        Left = 7
        Top = 4
        Width = 36
        Height = 17
        Frame.DrawBottom = True
        Size.Values = (
          44.9791666666667
          18.5208333333333
          10.5833333333333
          95.25)
        Caption = 'Titular'
        Font.Color = clNavy
        Font.Height = -13
        Font.Style = []
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 230
        Top = 4
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          608.541666666667
          10.5833333333333
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dependente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 445
        Top = 4
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1177.39583333333
          10.5833333333333
          288.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Assistencial'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 605
        Top = 4
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1600.72916666667
          10.5833333333333
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contribuição'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 747
        Top = 4
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1976.4375
          10.5833333333333
          238.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Esperado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 862
        Top = 4
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2280.70833333333
          10.5833333333333
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Recebido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 974
        Top = 4
        Width = 126
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2577.04166666667
          10.5833333333333
          333.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data de Recebimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Top = 147
      Width = 1268
      Height = 20
      Size.Values = (
        52.9166666666667
        3354.91666666667)
      object QRDBText1: TQRDBText
        Left = 7
        Top = 1
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          18.5208333333333
          2.64583333333333
          39.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'TIT'
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
      object QRDBText2: TQRDBText
        Left = 231
        Top = 1
        Width = 38
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          611.1875
          2.64583333333333
          100.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'DEPEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 610
        Top = 1
        Width = 49
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1613.95833333333
          2.64583333333333
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'CONTRIB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 447
        Top = 1
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1182.6875
          2.64583333333333
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'PLANASS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 746
        Top = 2
        Width = 93
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1973.79166666667
          5.29166666666667
          246.0625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'VALORESPERADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 864
        Top = 2
        Width = 88
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2286
          5.29166666666667
          232.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'VALORRECEBIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 1071
        Top = 3
        Width = 30
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          2833.6875
          7.9375
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrycontr
        DataField = 'DATA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited qrMestre: TQRGroup
      Top = 146
      Width = 1268
      Height = 1
      Size.Values = (
        2.64583333333333
        3354.91666666667)
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 113
      Width = 1268
      Height = 0
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0
        3354.91666666667)
      BandType = rbTitle
      object QRDBText3: TQRDBText
        Left = 496
        Top = 40
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1312.33333333333
          105.833333333333
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'QRDBText3'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 851
        Top = 4
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2251.60416666667
          10.5833333333333
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Recebido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 955
        Top = 4
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2526.77083333333
          10.5833333333333
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrsubdt: TQRSubDetail
      Left = 38
      Top = 193
      Width = 1268
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.5625
        3354.91666666667)
      Master = qr
      HeaderBand = GroupHeaderBand1
      PrintBefore = False
      PrintIfEmpty = False
    end
    object GroupHeaderBand1: TQRBand
      Left = 38
      Top = 167
      Width = 1268
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.7916666666667
        3354.91666666667)
      BandType = rbGroupHeader
    end
  end
  object qrycontr: TwwQuery
    BeforeOpen = qrycontrBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select cc.nome tit , aa.mes , aa.mescobranca ,aa.valoresperado ,' +
        ' '
      'aa.valorrecebido , aa.data , pl.nome planass , '
      
        'pv.nome planprev , p1.nome depen , cto.nome contrib,mt.descricao' +
        ', '
      'pt.descricao  '
      
        'from  hstcontribass aa, contass bb ,motivo mt, contribass ct , p' +
        'lanass pl, planprev pv , pessoa p1 ,'
      
        'pessoa cc, elegpatro dd , partass pat, portadorforma pt , contri' +
        'buicao cto      '
      'where'
      'aa.idtitular   = dd.idpessoa    and '
      'aa.idpessjur   = dd.idpessjur    and '
      'aa.idplanoprev = bb.idplanoprev    and '
      'dd.idpessoa =  cc.idpessoa    and '
      'ct.idcontass =  bb.idcontass   and '
      'bb.idtitular =  dd.idpessoa   and '
      'aa.idplanass = bb.idplanass and '
      'bb.idcontass = ct.idcontass and '
      'aa.idpessjur = bb.idpessjur and '
      'aa.idtitular = bb.idtitular and '
      'aa.iddependente = bb.iddependente  and '
      'pl.idplanass = aa.idplanass  and '
      'pv.idplanoprev = aa.idplanoprev  and '
      'p1.idpessoa =  aa.idtitular  and '
      'ct.idplanass =  aa.idplanass  and '
      'aa.idmotivo =  mt.idmotivo  and '
      'pat.idpessjur =  aa.idpessjur  and '
      'pat.idpessoa = p1.idpessoa  and '
      'pat.idplanass = pl.idplanass  and '
      'pat.idplanoprev = pv.idplanoprev  and '
      'pt.codportforma(+) = aa.codportforma and'
      'cto.idcontribuicao = ct.idcontass')
    ValidateWithMask = True
    Left = 304
    Top = 180
  end
  object dscontr: TwwDataSource
    DataSet = qrycontr
    Left = 336
    Top = 192
  end
end
