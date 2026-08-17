inherited frmRelFornservAnalit: TfrmRelFornservAnalit
  Left = 20
  Top = 157
  Caption = 'Relatório de Fornecedores'
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 5
    DataSet = qryforn
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 163
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
        Left = 244
        Width = 229
        Size.Values = (
          60.8541666666667
          645.583333333333
          95.25
          605.895833333333)
        Caption = 'Relatório de Fornecedores'
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Frame.Color = clNone
      Color = clWindow
      Size.Values = (
        87.3125
        1899.70833333333)
      inherited QRLabel4: TQRLabel
        Left = 17
        Top = -23
        Width = 41
        Height = 17
        Size.Values = (
          44.9791666666667
          44.9791666666667
          -60.8541666666667
          108.479166666667)
        Caption = 'Código'
        Font.Color = clNavy
        Font.Height = -13
        Font.Style = []
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 577
        Top = 4
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1526.64583333333
          10.5833333333333
          76.7291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CGC'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 353
        Top = 4
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          933.979166666667
          10.5833333333333
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Razão Social'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 41
        Top = 4
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          108.479166666667
          10.5833333333333
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Top = 147
      Height = 16
      Frame.DrawTop = True
      Size.Values = (
        42.3333333333333
        1899.70833333333)
      object QRDBText3: TQRDBText
        Left = 354
        Top = 1
        Width = 76
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          936.625
          2.64583333333333
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryforn
        DataField = 'RAZAOSOCIAL'
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
        Left = 579
        Top = 1
        Width = 23
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1531.9375
          2.64583333333333
          60.8541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryforn
        DataField = 'CGC'
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
      object QRDBText1: TQRDBText
        Left = 42
        Top = 1
        Width = 33
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          111.125
          2.64583333333333
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryforn
        DataField = 'NOME'
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
      Height = 1
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Size.Values = (
        2.64583333333333
        1899.70833333333)
    end
  end
  object qryforn: TwwQuery
    BeforeOpen = qryfornBeforeOpen
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT  PESSOA.NOME , PESSOA.RAZAOSOCIAL,PESSOA.IDPESSOA,'
      'PESSOA.NUMDOCUMENTO CGC'
      ' FROM  FORNSERV , PESSOA'
      'WHERE PESSOA.IDPESSOA = FORNSERV.IDPESSOA')
    ValidateWithMask = True
    Left = 182
    Top = 34
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DSFORN
    SQL.Strings = (
      'SELECT * FROM PLANASS'
      'WHERE IDFORNSERV =   :IDPESSOA')
    Params.Data = {01000100084944504553534F410006080000000000007498400000}
    ValidateWithMask = True
    Left = 110
    Top = 29
  end
  object DSFORN: TwwDataSource
    DataSet = qryforn
    Left = 224
    Top = 72
  end
end
 
