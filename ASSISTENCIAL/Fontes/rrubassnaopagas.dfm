inherited relRubNaoPagas: TrelRubNaoPagas
  Left = 109
  Top = 83
  Caption = 'Relatório de Rubricas não Pagas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    BeforePrint = qrBeforePrint
    DataSet = qryPatro
    Page.Values = (
      200
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 229
      Size.Values = (
        105.833333333333
        1899.70833333333)
      inherited QRSysData1: TQRSysData
        Left = 630
        Width = 88
        Size.Values = (
          39.6875
          1666.875
          55.5625
          232.833333333333)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 343
        Width = 31
        Size.Values = (
          39.6875
          907.520833333333
          55.5625
          82.0208333333333)
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
      Size.Values = (
        171.979166666667
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
        Left = 219
        Width = 279
        Size.Values = (
          60.8541666666667
          579.4375
          95.25
          738.1875)
        Caption = 'Relatório de Rubricas não Pagas'
        FontSize = 14
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 103
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = 14548989
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        1899.70833333333)
      BandType = rbDetail
      object QRLabel1: TQRLabel
        Left = 39
        Top = 3
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          103.1875
          7.9375
          301.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PATROCINADORA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 171
        Top = 3
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          452.4375
          7.9375
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryPatro
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object qrlblMesRef: TQRLabel
        Left = 471
        Top = 3
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1246.1875
          7.9375
          182.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblMesRef'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object qrlblMesCob: TQRLabel
        Left = 606
        Top = 3
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1603.375
          7.9375
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblMesCob'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 127
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        1899.70833333333)
      Master = qr
      DataSet = qryPlano
      PrintBefore = False
      PrintIfEmpty = False
      object qrlblPlano: TQRLabel
        Left = 39
        Top = 3
        Width = 118
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          103.1875
          7.9375
          312.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Previdenciário'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbtxtPlano: TQRDBText
        Left = 171
        Top = 3
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          452.4375
          7.9375
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryPlano
        DataField = 'PREV'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 423
        Top = 3
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1119.1875
          7.9375
          288.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Assistencial'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 555
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
          1468.4375
          7.9375
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryPlano
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 151
      Width = 718
      Height = 27
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
        71.4375
        1899.70833333333)
      Master = QRSubDetail1
      DataSet = qryRubricas
      PrintBefore = False
      PrintIfEmpty = False
      object qrdbtxtContribuicao: TQRDBText
        Left = 171
        Top = 3
        Width = 346
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          452.4375
          7.9375
          915.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryRubricas
        DataField = 'RUBRICA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbtxtQtde: TQRDBText
        Left = 528
        Top = 3
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1397
          7.9375
          248.708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryRubricas
        DataField = 'NUMPESSOAS'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblTexto: TQRLabel
        Left = 636
        Top = 3
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1682.75
          7.9375
          190.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'divergências'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrshContrib: TQRShape
        Left = 171
        Top = 18
        Width = 544
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.4583333333333
          452.4375
          47.625
          1439.33333333333)
        Shape = qrsHorLine
      end
    end
    object QRSubDetail3: TQRSubDetail
      Left = 38
      Top = 178
      Width = 718
      Height = 27
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
        71.4375
        1899.70833333333)
      Master = QRSubDetail1
      DataSet = qryParticipante
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText3: TQRDBText
        Left = 171
        Top = 3
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          452.4375
          7.9375
          195.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryParticipante
        DataField = 'MATRICULA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 279
        Top = 3
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          738.1875
          7.9375
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryParticipante
        DataField = 'PARTICIPANTE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 487
        Top = 3
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1288.52083333333
          7.9375
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryParticipante
        DataField = 'DEPENDENTE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail4: TQRSubDetail
      Left = 38
      Top = 205
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail4BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        1899.70833333333)
      Master = qr
      DataSet = qryInfo
      PrintBefore = False
      PrintIfEmpty = False
      object QRLabel2: TQRLabel
        Left = 171
        Top = 3
        Width = 289
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          452.4375
          7.9375
          764.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Não existem divergências para esta patrocinadora'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 27
    Top = 3
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 27
    Top = 21
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatro
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV,PL.NOME'
      'FROM PLANPREV PL, PLANPREVPATRO PP'
      'WHERE PL.IDPLANOPREV = PP.IDPLANOPREV AND'
      '              PL.TPPLANOPREV = '#39'F'#39' AND'
      '              PP.IDPESSJUR = :IDPESSOA')
    Params.Data = {01000100084944504553534F410006080000000000000037400000}
    ValidateWithMask = True
    Left = 75
    Top = 3
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 78
    Top = 21
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPlano
    SQL.Strings = (
      
        'SELECT COUNT(DISTINCT(T.IDPESSOA)) AS NUMPESSOAS, T.IDPESSJUR,T.' +
        'IDPLANOPREV,T.IDPROVENTO,'
      '       PL.NOME AS PLANO, PV.DESCRICAO AS RUBRICA'
      'FROM   TMPDESC T, PLANPREV PL, PROVDESC PV'
      'WHERE  T.IDPLANOPREV = :IDPLANOPREV AND'
      '       T.IDPLANOPREV = PL.IDPLANOPREV AND'
      '       T.IDPROVENTO = PV.IDPROVENTO AND'
      '       (T.VALORRECEBIDO IS NULL OR'
      '        T.VALORRECEBIDO = 0)'
      
        'GROUP BY T.IDPESSJUR,T.IDPLANOPREV,T.IDPROVENTO, PL.NOME, PV.DES' +
        'CRICAO')
    Params.Data = {010001000B4944504C414E4F505245560006080000000000000010400000}
    ValidateWithMask = True
    Left = 153
    Top = 15
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsRubricas
    SQL.Strings = (
      'SELECT P.NOME AS PARTICIPANTE, EL.MATRICULA'
      'FROM PESSOA P, ELEGPATRO EL,'
      '           CONTRIBPREVPARTP CP, CONTPREV C'
      'WHERE C.IDRUBRICA = :IDPROVENTO AND'
      '               C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO AND'
      '               C.IDPLANOPREV = CP.IDPLANOPREV AND'
      '               CP.IDPLANOPREV = :IDPLANOPREV AND'
      '               CP.IDPESSJUR = :IDPESSJUR AND'
      '               CP.IDPESSOA = P.IDPESSOA AND'
      '               CP.IDPESSJUR= EL.IDPESSJUR AND'
      '               CP.IDPESSOA = EL.IDPESSOA'
      'ORDER BY EL.MATRICULA')
    Params.Data = {
      010003000A494450524F56454E544F00060800000000000000364000000B4944
      504C414E4F505245560006080000000000000010400000094944504553534A55
      520006080000000000000037400000}
    ValidateWithMask = True
    Left = 297
    Top = 21
  end
  object dsRubricas: TwwDataSource
    DataSet = qryRubricas
    Left = 162
    Top = 3
  end
  object qryInfo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select 1 from dual')
    ValidateWithMask = True
    Left = 234
    Top = 21
  end
end
