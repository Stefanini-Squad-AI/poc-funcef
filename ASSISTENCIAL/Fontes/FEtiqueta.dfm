inherited frmEtiquetas: TfrmEtiquetas
  Caption = 'Etiquetas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Frame.Color = clNavy
    Frame.Style = psDot
    DataSet = qryetiqueta
    Font.Height = -11
    Options = []
    Page.Columns = 2
    Page.Values = (
      99.1
      2970
      99.1
      2100
      99.1
      99.1
      10.2)
    object QRBand1: TQRBand
      Left = 37
      Top = 37
      Width = 357
      Height = 84
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        222.25
        944.5625)
      BandType = rbDetail
      object QRDBText8: TQRDBText
        Left = 8
        Top = 8
        Width = 45
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          21.1666666666667
          21.1666666666667
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'NOME_1'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 8
        Top = 24
        Width = 78
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          21.1666666666667
          63.5
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'LOGRADOURO'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 136
        Top = 40
        Width = 42
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          359.833333333333
          105.833333333333
          111.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'BAIRRO'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 136
        Top = 56
        Width = 41
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          359.833333333333
          148.166666666667
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'CIDADE'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 8
        Top = 56
        Width = 22
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          21.1666666666667
          148.166666666667
          58.2083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'CEP'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 256
        Top = 24
        Width = 49
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          677.333333333333
          63.5
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'NUMERO'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 8
        Top = 40
        Width = 84
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          21.1666666666667
          105.833333333333
          222.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'COMPLEMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 280
        Top = 56
        Width = 68
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          740.833333333333
          148.166666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryetiqueta
        DataField = 'CODESTADO'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 634
  end
  object qryetiqueta: TwwQuery
    BeforeOpen = qryetiquetaBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PARTASS.*, EP.*,'
      'PESSOA.IDPESSOA, PESSOA.NOME, PESSOA.NUMDOCUMENTO CPF,    '
      'ELEGPATRO.MATRICULA, ELEGPATRO.DATAADMISSAO, '
      'PLANASS.NOME AS NOMEPLANO,PLANASS.IDPLANASS,'
      'PLANASS.IDREGRACANCELAME,P2.NOME,PR.NOME ,'
      'SITPART.DESCRICAO AS DESCSITUACAO,SITPART.DESCRICAO,'
      'PR.IDPLANOPREV , P2.IDPESSOA IDPESSJUR'
      'FROM   ELEGPATRO , PARTASS , PESSOA ,  PLANASS ,  SITPART , '
      'PESSOA P2 , PLANPREV PR, ENDPESS EP'
      'WHERE '
      'PARTASS.IDPESSJUR = P2.IDPESSOA AND '
      'P2.IDPESSOA = ELEGPATRO.IDPESSJUR AND '
      'ELEGPATRO.IDPESSJUR = PARTASS.IDPESSJUR AND '
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA AND '
      'PLANASS.IDPLANASS = PARTASS.IDPLANASS AND '
      'SITPART.IDSITPART = PARTASS.IDSITPART AND '
      'PARTASS.IDPLANOPREV = PR.IDPLANOPREV AND '
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA  AND'
      'PESSOA.IDPESSOA = EP.IDPESSOA')
    ValidateWithMask = True
    Left = 64
    Top = 160
  end
  object dsetiqueta: TwwDataSource
    DataSet = qryetiqueta
    Left = 96
    Top = 176
  end
end
