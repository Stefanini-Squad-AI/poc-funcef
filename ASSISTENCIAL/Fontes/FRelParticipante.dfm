inherited frmRelParticipante: TfrmRelParticipante
  Left = 4
  Top = 161
  Caption = 'Relatório de Participantes'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    DataSet = qrypatro
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 258
      Size.Values = (
        105.833333333333
        1899.70833333333)
      inherited QRSysData1: TQRSysData
        Size.Values = (
          39.6875
          1751.54166666667
          55.5625
          148.166666666667)
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
      Height = 75
      Size.Values = (
        198.4375
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
        Left = 250
        Width = 218
        Size.Values = (
          60.8541666666667
          661.458333333333
          95.25
          576.791666666667)
        Caption = 'Relatório de Participantes'
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Height = 25
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Color = clInfoBk
      Size.Values = (
        66.1458333333333
        1899.70833333333)
      BandType = rbDetail
      inherited QRLabel4: TQRLabel
        Left = 8
        Top = 3
        Width = 83
        Height = 17
        Size.Values = (
          44.9791666666667
          21.1666666666667
          7.9375
          219.604166666667)
        Caption = 'Patrocinadora  '
        Font.Color = clBlack
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 99
        Top = 3
        Width = 502
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          261.9375
          7.9375
          1328.20833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrypatro
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object ColumnHeaderBand1: TQRBand [3]
      Left = 38
      Top = 113
      Width = 718
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
        1899.70833333333)
      BandType = rbTitle
    end
    inherited DetailBand1: TQRBand
      Top = 113
      Height = 0
      Size.Values = (
        0
        1899.70833333333)
      BandType = rbColumnHeader
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 138
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clInfoBk
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        1899.70833333333)
      Master = qr
      DataSet = qryplanprev
      PrintBefore = False
      PrintIfEmpty = False
      object QRLabel1: TQRLabel
        Left = 7
        Top = 3
        Width = 116
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          18.5208333333333
          7.9375
          306.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Previdenciário '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object dbprev: TQRDBText
        Left = 130
        Top = 3
        Width = 471
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          343.958333333333
          7.9375
          1246.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryplanprev
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 162
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clInfoBk
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.1458333333333
        1899.70833333333)
      Master = QRSubDetail1
      DataSet = qryplanass
      PrintBefore = False
      PrintIfEmpty = False
      object QRLabel2: TQRLabel
        Left = 8
        Top = 4
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          10.5833333333333
          277.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Assistencial '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object dbplanass: TQRDBText
        Left = 124
        Top = 4
        Width = 477
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          328.083333333333
          10.5833333333333
          1262.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryplanass
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail3: TQRSubDetail
      Left = 38
      Top = 209
      Width = 718
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail3BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.8541666666667
        1899.70833333333)
      Master = QRSubDetail2
      DataSet = qryPartic
      HeaderBand = GroupHeaderBand1
      PrintBefore = False
      PrintIfEmpty = False
      object ednome: TQRDBText
        Left = 212
        Top = 3
        Width = 469
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          560.916666666667
          7.9375
          1240.89583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryPartic
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edmat: TQRDBText
        Left = 65
        Top = 3
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          171.979166666667
          7.9375
          359.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryPartic
        DataField = 'MATRICULA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object GroupHeaderBand1: TQRBand
      Left = 38
      Top = 187
      Width = 718
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.2083333333333
        1899.70833333333)
      BandType = rbGroupHeader
      object QRLabel3: TQRLabel
        Left = 64
        Top = 2
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          169.333333333333
          5.29166666666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Matrícula'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 211
        Top = 3
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          558.270833333333
          7.9375
          367.770833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome do Participante'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail4: TQRSubDetail
      Left = 38
      Top = 232
      Width = 718
      Height = 26
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
        68.7916666666667
        1899.70833333333)
      Master = QRSubDetail3
      DataSet = qryInfo
      PrintBefore = False
      PrintIfEmpty = False
      object QRLabel9: TQRLabel
        Left = 213
        Top = 4
        Width = 271
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          563.5625
          10.5833333333333
          717.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Não Existem Participantes para este Plano'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qryPartic: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsplanass
    SQL.Strings = (
      'SELECT MATRICULA, NOME'
      'FROM PESSOA , ELEGPATRO, PARTASS'
      'WHERE '
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA AND'
      'PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR AND'
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA AND'
      'PARTASS.IDPLANASS = :IDPLANASS AND'
      'PARTASS.IDPLANOPREV = :IDPLANOPREV AND'
      'PARTASS.IDPESSJUR = :IDPESSJUR')
    Params.Data = {
      01000300094944504C414E41535300060800000000000000F03F00000B494450
      4C414E4F505245560006080000000000000000400000094944504553534A5552
      000608000000000000C051400000}
    ValidateWithMask = True
    Left = 334
    Top = 209
  end
  object dspartic: TwwDataSource
    DataSet = qryPartic
    Left = 326
    Top = 225
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDPESSOA '
      'FROM PESSOA '
      'WHERE IDPESSOA IN'
      '(SELECT IDPESSJUR FROM PARTASS)')
    ValidateWithMask = True
    Left = 179
    Top = 23
  end
  object qryplanprev: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dspatro
    SQL.Strings = (
      'SELECT PLANPREV.NOME ,'
      'PLANPREV.IDPLANOPREV,'
      'PLANPREVPATRO.IDPESSJUR '
      'FROM PLANPREV , PLANPREVPATRO'
      'WHERE PLANPREVPATRO.IDPLANOPREV = PLANPREV.IDPLANOPREV AND'
      'PLANPREVPATRO.IDPESSJUR = :IDPESSOA')
    Params.Data = {01000100084944504553534F410006080000000000000010400000}
    ValidateWithMask = True
    Left = 243
    Top = 71
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsprev
    SQL.Strings = (
      'SELECT NOME, PLANASS.IDPLANASS,IDPESSJUR,IDPLANOPREV'
      'FROM PLANASS, PLANPREVASS'
      'WHERE PLANPREVASS.IDPLANASS = PLANASS.IDPLANASS AND'
      'IDPESSJUR = :IDPESSJUR AND'
      'IDPLANOPREV = :IDPLANOPREV')
    Params.Data = {
      01000200094944504553534A555200060800000000000000104000000B494450
      4C414E4F505245560006080000000000000037400000}
    ValidateWithMask = True
    Left = 331
    Top = 87
  end
  object dsprev: TwwDataSource
    DataSet = qryplanprev
    Left = 248
    Top = 112
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 363
    Top = 114
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 176
    Top = 64
  end
  object qryInfo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select 1 from dual')
    ValidateWithMask = True
    Left = 426
    Top = 37
  end
end
.
