inherited relFichaProc: TrelFichaProc
  Left = 38
  Top = 140
  Caption = 'Ficha do Processo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 5
    Top = 0
    Width = 476
    Height = 674
    DataSet = tblPessoal
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
    ReportTitle = 'Ficha do Processo'
    Zoom = 60
    inherited PageFooterBand1: TQRBand
      Left = 23
      Top = 611
      Width = 431
      Height = 24
      Size.Values = (
        105.833333333333
        1900.59027777778)
      inherited QRSysData1: TQRSysData
        Left = 397
        Top = 13
        Width = 34
        Height = 9
        Size.Values = (
          39.6875
          1750.65972222222
          57.3263888888889
          149.930555555556)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 196
        Top = 13
        Width = 38
        Height = 9
        Size.Values = (
          39.6875
          864.305555555556
          57.3263888888889
          167.569444444444)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Top = 13
        Width = 95
        Height = 9
        Size.Values = (
          39.6875
          0
          57.3263888888889
          418.923611111111)
        FontSize = 8
      end
    end
    inherited PageHeaderBand1: TQRBand
      Left = 23
      Top = 23
      Width = 431
      Height = 82
      BeforePrint = PageHeaderBand1BeforePrint
      Size.Values = (
        361.597222222222
        1900.59027777778)
      inherited qrlblNomeCli: TQRLabel
        Left = 161
        Top = 5
        Width = 109
        Height = 14
        Size.Values = (
          61.7361111111111
          709.965277777778
          22.0486111111111
          480.659722222222)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 149
        Top = 22
        Width = 133
        Height = 14
        Size.Values = (
          61.7361111111111
          657.048611111111
          97.0138888888889
          586.493055555556)
        FontSize = 14
      end
      object QRLabel19: TQRLabel
        Left = 7
        Top = 43
        Width = 32
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          189.618055555556
          141.111111111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vara e Nº:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 233
        Top = 42
        Width = 30
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1027.46527777778
          185.208333333333
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Situação:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 6
        Top = 57
        Width = 26
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          26.4583333333333
          251.354166666667
          114.652777777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Citação:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbNome: TQRDBText
        Left = 197
        Top = 42
        Width = 25
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          868.715277777778
          185.208333333333
          110.243055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelFichaProc.tblProcesso
        DataField = 'NUMVARAJUSTICA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbNasc: TQRDBText
        Left = 46
        Top = 57
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          202.847222222222
          251.354166666667
          189.618055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelFichaProc.tblProcesso
        DataField = 'DATANOTIF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlSitProc: TQRLabel
        Left = 269
        Top = 42
        Width = 28
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1186.21527777778
          185.208333333333
          123.472222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Situação'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 233
        Top = 55
        Width = 27
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1027.46527777778
          242.534722222222
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Matéria:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlMateria: TQRLabel
        Left = 269
        Top = 55
        Width = 25
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1186.21527777778
          242.534722222222
          110.243055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Matéria'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 6
        Top = 70
        Width = 34
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          26.4583333333333
          308.680555555556
          149.930555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Escritório:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblEscrit: TQRLabel
        Left = 46
        Top = 70
        Width = 67
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          202.847222222222
          308.680555555556
          295.451388888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Escritório/Advogado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblVara: TQRLabel
        Left = 46
        Top = 43
        Width = 147
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          202.847222222222
          189.618055555556
          648.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME DA VARA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      Left = 23
      Top = 105
      Width = 431
      Height = 68
      Size.Values = (
        299.861111111111
        1900.59027777778)
      inherited QrLabel4: TQRLabel
        Left = 34
        Top = 5
        Width = 53
        Height = 9
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 7
        Top = 13
        Width = 22
        Height = 9
        Size.Values = (
          39.6875
          30.8680555555556
          57.3263888888889
          97.0138888888889)
        Caption = 'Nome:'
        FontSize = 8
      end
      object QRDBImage1: TQRDBImage
        Left = 341
        Top = 2
        Width = 56
        Height = 63
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.8125
          1503.71527777778
          8.81944444444444
          246.944444444444)
        DataField = 'IMAGEM'
        DataSet = tblImagem
      end
      object QRLabel23: TQRLabel
        Left = 7
        Top = 46
        Width = 19
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          202.847222222222
          83.7847222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sexo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 29
        Top = 46
        Width = 22
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          127.881944444444
          202.847222222222
          97.0138888888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPesFis
        DataField = 'SEXO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 233
        Top = 28
        Width = 40
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1027.46527777778
          123.472222222222
          176.388888888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estado Civil:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 276
        Top = 28
        Width = 34
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1217.08333333333
          123.472222222222
          149.930555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPesFis
        DataField = 'ESTCIVIL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 181
        Top = 1
        Width = 69
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          798.159722222222
          4.40972222222222
          304.270833333333)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'REQUERENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText19: TQRDBText
        Left = 34
        Top = 12
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          149.930555555556
          52.9166666666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPessoal
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 6
        Top = 27
        Width = 41
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          26.4583333333333
          119.0625
          180.798611111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nascimento:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText20: TQRDBText
        Left = 50
        Top = 27
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          220.486111111111
          119.0625
          189.618055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPesFis
        DataField = 'DATANASC'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Left = 23
      Top = 207
      Width = 431
      Height = 91
      Size.Values = (
        401.284722222222
        1900.59027777778)
      object QRDBText36: TQRDBText
        Left = 264
        Top = 11
        Width = 61
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1164.16666666667
          48.5069444444444
          268.993055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'COMPLEMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 7
        Top = 11
        Width = 34
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          48.5069444444444
          149.930555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Endereço:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbEnder: TQRDBText
        Left = 45
        Top = 11
        Width = 172
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          198.4375
          48.5069444444444
          758.472222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'LOGRADOURO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbBairro: TQRDBText
        Left = 7
        Top = 22
        Width = 30
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          97.0138888888889
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'BAIRRO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbCEP: TQRDBText
        Left = 168
        Top = 22
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          740.833333333333
          97.0138888888889
          74.9652777777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'CEP'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbCidade: TQRDBText
        Left = 226
        Top = 22
        Width = 29
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          996.597222222222
          97.0138888888889
          127.881944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'CIDADE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbUF: TQRDBText
        Left = 341
        Top = 22
        Width = 49
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1503.71527777778
          97.0138888888889
          216.076388888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'CODESTADO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 7
        Top = 56
        Width = 58
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          246.944444444444
          255.763888888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estabelecimento:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbEstab: TQRDBText
        Left = 67
        Top = 56
        Width = 94
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          295.451388888889
          246.944444444444
          414.513888888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblEstab
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 168
        Top = 56
        Width = 57
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          740.833333333333
          246.944444444444
          251.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Centro de Custo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbFonte: TQRDBText
        Left = 229
        Top = 56
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1009.82638888889
          246.944444444444
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblLotacao
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 7
        Top = 67
        Width = 41
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          295.451388888889
          180.798611111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo Atual:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbCargo: TQRDBText
        Left = 50
        Top = 67
        Width = 111
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          220.486111111111
          295.451388888889
          489.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblCargo
        DataField = 'TITULO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 168
        Top = 67
        Width = 43
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          740.833333333333
          295.451388888889
          189.618055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Salário Atual:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbSalario: TQRDBText
        Left = 214
        Top = 67
        Width = 59
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          943.680555555556
          295.451388888889
          260.173611111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblFuncio
        DataField = 'SALARIOATUAL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTipoSal: TQRDBText
        Left = 260
        Top = 67
        Width = 68
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1146.52777777778
          295.451388888889
          299.861111111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblFuncio
        DataField = 'TIPOPAGAMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 296
        Top = 67
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1305.27777777778
          295.451388888889
          202.847222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblSituacao
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 7
        Top = 78
        Width = 34
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          343.958333333333
          149.930555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Profissão:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 50
        Top = 78
        Width = 111
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          220.486111111111
          343.958333333333
          489.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblProfis
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 168
        Top = 78
        Width = 37
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          740.833333333333
          343.958333333333
          163.159722222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Grau Instr.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 214
        Top = 78
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          943.680555555556
          343.958333333333
          202.847222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblGrauInstr
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText35: TQRDBText
        Left = 225
        Top = 11
        Width = 35
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          992.1875
          48.5069444444444
          154.340277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblEndPes
        DataField = 'NUMERO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel26: TQRLabel
        Left = 7
        Top = 33
        Width = 32
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          145.520833333333
          141.111111111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telefone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbTelRes: TQRDBText
        Left = 45
        Top = 33
        Width = 13
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          198.4375
          145.520833333333
          57.3263888888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblTelef
        DataField = 'DDI'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText37: TQRDBText
        Left = 69
        Top = 33
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          304.270833333333
          145.520833333333
          74.9652777777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblTelef
        DataField = 'DDD'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited qrMestre: TQRGroup
      Left = 23
      Top = 173
      Width = 431
      Height = 9
      Size.Values = (
        39.6875
        1900.59027777778)
    end
    object qrsubdt: TQRSubDetail
      Left = 23
      Top = 320
      Width = 431
      Height = 17
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
        74.9652777777778
        1900.59027777778)
      Master = qr
      DataSet = tblObjeto
      HeaderBand = qrbCabObj
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText2: TQRDBText
        Left = 7
        Top = 2
        Width = 118
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          8.81944444444444
          520.347222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblTipObj
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 127
        Top = 2
        Width = 48
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          560.034722222222
          8.81944444444444
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'VALORRECL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 189
        Top = 2
        Width = 38
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          833.4375
          8.81944444444444
          167.569444444444)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'PERCPROB'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 244
        Top = 2
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1075.97222222222
          8.81944444444444
          229.305555555556)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'ValorEsperado'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbValReal: TQRDBText
        Left = 304
        Top = 2
        Width = 48
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1340.55555555556
          8.81944444444444
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'VALORSENTENCA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 364
        Top = 2
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1605.13888888889
          8.81944444444444
          229.305555555556)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'ValorAtual'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbCabObj: TQRBand
      Left = 23
      Top = 298
      Width = 431
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbCabObjBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.0138888888889
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel5: TQRLabel
        Left = 7
        Top = 11
        Width = 73
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          48.5069444444444
          321.909722222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Objeto de Reclamação'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 120
        Top = 11
        Width = 56
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          529.166666666667
          48.5069444444444
          246.944444444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Reclamado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 186
        Top = 11
        Width = 46
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          820.208333333333
          48.5069444444444
          202.847222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Probabilidade'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 246
        Top = 11
        Width = 51
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1084.79166666667
          48.5069444444444
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Esperado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlValReal: TQRLabel
        Left = 313
        Top = 11
        Width = 34
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1380.24305555556
          48.5069444444444
          149.930555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Real'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbEtapa: TQRSubDetail
      Left = 23
      Top = 380
      Width = 431
      Height = 24
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
        105.833333333333
        1900.59027777778)
      Master = qr
      DataSet = tblHstEtp
      HeaderBand = qrbCabExper
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText16: TQRDBText
        Left = 7
        Top = 11
        Width = 38
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          48.5069444444444
          167.569444444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHstEtp
        DataField = 'ASSUNTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 345
        Top = 2
        Width = 64
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1521.35416666667
          8.81944444444444
          282.222222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHstEtp
        DataField = 'DATAREALOCOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 7
        Top = 2
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          8.81944444444444
          202.847222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblTipRec
        DataField = 'DESCRICAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbCabExper: TQRBand
      Left = 23
      Top = 358
      Width = 431
      Height = 22
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
        97.0138888888889
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel21: TQRLabel
        Left = 7
        Top = 11
        Width = 82
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          48.5069444444444
          361.597222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Etapa/Assunto/Descrição'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 340
        Top = 11
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1499.30555555556
          48.5069444444444
          304.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Real ou Prevista'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbObserv: TQRChildBand
      Left = 23
      Top = 404
      Width = 431
      Height = 15
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
        66.1458333333333
        1900.59027777778)
      ParentBand = qrbEtapa
      object QRDBText5: TQRDBText
        Left = 7
        Top = 1
        Width = 290
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          4.40972222222222
          1278.81944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tblHstEtp
        DataField = 'OBSERVETAPA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrCabDocs: TQRBand
      Left = 23
      Top = 182
      Width = 431
      Height = 11
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
        48.5069444444444
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel1: TQRLabel
        Left = 7
        Top = 2
        Width = 65
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          8.81944444444444
          286.631944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo de Documento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 158
        Top = 2
        Width = 27
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          696.736111111111
          8.81944444444444
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Número'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 210
        Top = 2
        Width = 28
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          926.041666666667
          8.81944444444444
          123.472222222222)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Emissor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 260
        Top = 2
        Width = 8
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1146.52777777778
          8.81944444444444
          35.2777777777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel32: TQRLabel
        Left = 291
        Top = 2
        Width = 29
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1283.22916666667
          8.81944444444444
          127.881944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Emissão'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbDocs: TQRSubDetail
      Left = 23
      Top = 193
      Width = 431
      Height = 14
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
        61.7361111111111
        1900.59027777778)
      Master = qr
      DataSet = tblDocPes
      HeaderBand = qrCabDocs
      PrintBefore = True
      PrintIfEmpty = False
      object QRDBText38: TQRDBText
        Left = 7
        Top = 2
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          8.81944444444444
          326.319444444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblTipDoc
        DataField = 'NOMEDOCUMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText39: TQRDBText
        Left = 140
        Top = 2
        Width = 68
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          617.361111111111
          8.81944444444444
          299.861111111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblDocPes
        DataField = 'NUMDOCUMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText40: TQRDBText
        Left = 210
        Top = 2
        Width = 29
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          926.041666666667
          8.81944444444444
          127.881944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblDocPes
        DataField = 'ORGAO'
        Mask = '0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText41: TQRDBText
        Left = 260
        Top = 2
        Width = 11
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1146.52777777778
          8.81944444444444
          48.5069444444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblDocPes
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText42: TQRDBText
        Left = 279
        Top = 2
        Width = 57
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1230.3125
          8.81944444444444
          251.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblDocPes
        DataField = 'DATAEMISSAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object chbObserv: TQRChildBand
      Left = 23
      Top = 337
      Width = 431
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
        92.6041666666667
        1900.59027777778)
      ParentBand = qrsubdt
      object qrdbDescricao: TQRDBText
        Left = 7
        Top = 5
        Width = 290
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          22.0486111111111
          1278.81944444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tblObjeto
        DataField = 'OBSERVACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbCabVinc1: TQRBand
      Left = 23
      Top = 419
      Width = 431
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbCabVinc1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        123.472222222222
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel13: TQRLabel
        Left = 7
        Top = 17
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          74.9652777777778
          313.090277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Número do Processo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 119
        Top = 17
        Width = 43
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          524.756944444445
          74.9652777777778
          189.618055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contra Parte'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 61
        Top = 7
        Width = 106
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          268.993055555556
          30.8680555555556
          467.430555555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Processo(s) Vinculado(s) a Este'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbVinculados: TQRSubDetail
      Left = 23
      Top = 447
      Width = 431
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbVinculadosBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375
        1900.59027777778)
      Master = qr
      DataSet = qryProcVinc1
      HeaderBand = qrbCabVinc1
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText13: TQRDBText
        Left = 7
        Top = 3
        Width = 53
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          13.2291666666667
          233.715277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryProcVinc1
        DataField = 'PROCJCJNUM'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 111
        Top = 3
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          489.479166666667
          13.2291666666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryProcVinc1
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbVinculado2: TQRSubDetail
      Left = 23
      Top = 493
      Width = 431
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbVinculado2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375
        1900.59027777778)
      Master = qr
      DataSet = qryProcVinc1
      HeaderBand = qrbCabVinc2
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText15: TQRDBText
        Left = 7
        Top = 3
        Width = 53
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          13.2291666666667
          233.715277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryProcVinc2
        DataField = 'PROCJCJNUM'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText17: TQRDBText
        Left = 111
        Top = 3
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          489.479166666667
          13.2291666666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryProcVinc2
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbCabVinc2: TQRBand
      Left = 23
      Top = 465
      Width = 431
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbCabVinc2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        123.472222222222
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel16: TQRLabel
        Left = 7
        Top = 17
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          74.9652777777778
          313.090277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Número do Processo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 119
        Top = 17
        Width = 43
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          524.756944444445
          74.9652777777778
          189.618055555556)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contra Parte'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 61
        Top = 7
        Width = 104
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          268.993055555556
          30.8680555555556
          458.611111111111)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Este Processo Está Vinculado a'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbCabLitis: TQRBand
      Left = 23
      Top = 511
      Width = 431
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbCabLitisBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.0138888888889
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel35: TQRLabel
        Left = 7
        Top = 11
        Width = 49
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          48.5069444444444
          216.076388888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Litisconsortes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbLitis: TQRSubDetail
      Left = 23
      Top = 533
      Width = 431
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbLitisBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375
        1900.59027777778)
      Master = qr
      DataSet = qryLitis
      HeaderBand = qrbCabLitis
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText23: TQRDBText
        Left = 8
        Top = 3
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          35.2777777777778
          13.2291666666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryLitis
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbCabHonor: TQRBand
      Left = 23
      Top = 551
      Width = 431
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbCabObjBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.0138888888889
        1900.59027777778)
      BandType = rbGroupHeader
      object QRLabel40: TQRLabel
        Left = 7
        Top = 11
        Width = 56
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          30.8680555555556
          48.5069444444444
          246.944444444444)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Honorário Pago a'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel44: TQRLabel
        Left = 310
        Top = 11
        Width = 53
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1367.01388888889
          48.5069444444444
          233.715277777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Pagamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel45: TQRLabel
        Left = 377
        Top = 11
        Width = 36
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1662.46527777778
          48.5069444444444
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Pago'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbHonor: TQRSubDetail
      Left = 23
      Top = 573
      Width = 431
      Height = 18
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
        79.375
        1900.59027777778)
      Master = qr
      DataSet = qryHonor
      FooterBand = qrbTotHonor
      HeaderBand = qrbCabHonor
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText21: TQRDBText
        Left = 7
        Top = 3
        Width = 175
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          30.8680555555556
          13.2291666666667
          771.701388888889)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryHonor
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText22: TQRDBText
        Left = 282
        Top = 3
        Width = 76
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1243.54166666667
          13.2291666666667
          335.138888888889)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryHonor
        DataField = 'DATAPAGTOHONOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 358
        Top = 3
        Width = 55
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          48.5069444444444
          1578.68055555556
          13.2291666666667
          242.534722222222)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryHonor
        DataField = 'VALORHONOR'
        Mask = '###,###,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbTotHonor: TQRBand
      Left = 23
      Top = 591
      Width = 431
      Height = 20
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
        88.1944444444445
        1900.59027777778)
      BandType = rbGroupFooter
      object QRLabel47: TQRLabel
        Left = 332
        Top = 6
        Width = 17
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1464.02777777778
          26.4583333333333
          74.9652777777778)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 352
        Top = 2
        Width = 60
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.2291666666667
          1552.22222222222
          8.81944444444444
          264.583333333333)
        Shape = qrsHorLine
      end
      object QRExpr1: TQRExpr
        Left = 301
        Top = 5
        Width = 111
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.0972222222222
          1327.32638888889
          22.0486111111111
          489.479166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = qrbHonor
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(qryHonor.VALORHONOR)'
        Mask = '###,###,##0.00'
        FontSize = 10
      end
    end
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    ReadOnly = True
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 21
    Top = 65530
  end
  object tblFuncio: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    ReadOnly = True
    TableName = 'CM.ELEGPATRO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 240
  end
  object tblSituacao: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSITFUNC'
    MasterFields = 'IDSITFUNC'
    MasterSource = dsX
    ReadOnly = True
    TableName = 'CM.SITFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 339
    Top = 65535
  end
  object ds: TwwDataSource
    DataSet = tblPessoal
    Left = 3
    Top = 234
  end
  object dsX: TwwDataSource
    DataSet = tblFuncio
    Left = 6
    Top = 180
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGOEXT'
    MasterFields = 'IDCARGOEXT'
    MasterSource = dsX
    TableName = 'CM.CARGOEXT'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 423
    Top = 65527
  end
  object tblTipObj: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOBJETO'
    MasterFields = 'CODTIPOOBJETO'
    MasterSource = dsObj
    TableName = 'CM.TIPOOBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 522
    Top = 3
  end
  object dsObj: TwwDataSource
    DataSet = tblObjeto
    Left = 473
    Top = 17
  end
  object tblEstab: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDESTAB'
    MasterSource = dsX
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 120
  end
  object tblLotacao: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDEMPRESA;CODCENTROCUSTO'
    MasterFields = 'IDPESSJUR;CODCENTROCUSTO'
    MasterSource = dsX
    TableName = 'CM.CENTCUST'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 72
  end
  object tblProfis: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPROFISS'
    MasterFields = 'IDPROFISS'
    MasterSource = dsFis
    TableName = 'CM.PROFISS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 287
    Top = 65535
  end
  object tblGrauInstr: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDGRINSTR'
    MasterFields = 'IDGRINSTR'
    MasterSource = dsFis
    TableName = 'CM.GRINSTR'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 590
    Top = 47
  end
  object dsEtp: TwwDataSource
    DataSet = tblHstEtp
    Left = 470
    Top = 248
  end
  object tblHstEtp: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;DATAREALOCOR'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = frmSelFichaProc.ds
    TableName = 'CM.ETAPAPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 528
    Top = 249
  end
  object tblEndPes: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.ENDPESS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 495
    Top = 114
  end
  object tblObjeto: TwwTable
    OnCalcFields = tblObjetoCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;CODTIPOOBJETO'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = frmSelFichaProc.ds
    TableName = 'CM.OBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 512
    Top = 64
    object tblObjetoVALORRECL: TFloatField
      DisplayLabel = 'Valor Reclamado'
      DisplayWidth = 16
      FieldName = 'VALORRECL'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoPERCPROB: TFloatField
      DisplayLabel = 'Probabilidade (%)'
      DisplayWidth = 14
      FieldName = 'PERCPROB'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoValorEsperado: TFloatField
      DisplayLabel = 'Valor Estimado'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'ValorEsperado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object tblObjetoNUMPROCTRAB: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPROCTRAB'
      Required = True
      Visible = False
    end
    object tblObjetoCODTIPOOBJETO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOOBJETO'
      Required = True
      Visible = False
    end
    object tblObjetoVALORSENTENCA: TFloatField
      FieldName = 'VALORSENTENCA'
      DisplayFormat = '0.00'
    end
    object tblObjetoValorAtual: TFloatField
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'ValorAtual'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object tblObjetoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 240
    end
  end
  object tblPesFis: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    ReadOnly = True
    TableName = 'CM.PESSOAFISICA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 129
    Top = 51
  end
  object tblImagem: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDIMAGEM'
    MasterFields = 'IDIMAGEM'
    MasterSource = ds
    ReadOnly = True
    TableName = 'CM.IMAGENS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 465
    Top = 69
  end
  object dsFis: TwwDataSource
    DataSet = tblPesFis
    Left = 84
    Top = 51
  end
  object dsEnd: TwwDataSource
    DataSet = tblEndPes
    Left = 555
    Top = 114
  end
  object tblTelef: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDENDERECO'
    MasterFields = 'IDENDERECO'
    MasterSource = dsEnd
    TableName = 'CM.TELENDPESS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 486
    Top = 207
  end
  object tblDocPes: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.DOCPESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 495
    Top = 165
  end
  object dsDoc: TwwDataSource
    DataSet = tblDocPes
    Left = 579
    Top = 162
  end
  object tblTipDoc: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDDOCUMENTO'
    MasterFields = 'IDDOCUMENTO'
    MasterSource = dsDoc
    TableName = 'CM.TIPODOCPESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 627
    Top = 162
  end
  object tblTipRec: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPORECURSO'
    MasterFields = 'CODTIPORECURSO'
    MasterSource = dsEtp
    TableName = 'CM.TIPORECTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 594
    Top = 248
  end
  object qryProcVinc1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.NOME, PROCESSOTRAB.PROCJCJNUM'
      'FROM PESSOA, PROCESSOTRAB '
      'WHERE PESSOA.IDPESSOA = PROCESSOTRAB.IDRECLAMANTE'
      'AND      PROCESSOTRAB.IDPROCVINCULADO = :NumProcTrab'
      'ORDER BY PROCESSOTRAB.PROCJCJNUM')
    ControlType.Strings = (
      'FLGSITPROC;CheckBox;1;0'
      'FLGVINCULADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 543
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object qryProcVinc2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.NOME, PROCESSOTRAB.PROCJCJNUM'
      'FROM PESSOA, PROCESSOTRAB '
      'WHERE PESSOA.IDPESSOA = PROCESSOTRAB.IDRECLAMANTE'
      'AND      PROCESSOTRAB.NumProcTrab = :NumProcTrab')
    ControlType.Strings = (
      'FLGSITPROC;CheckBox;1;0'
      'FLGVINCULADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 543
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object qryLitis: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS NOME, '
      'C.IDPESSOA, C.NUMPROCTRAB '
      'FROM PESSOA P, COPARTPROCTRAB C'
      'WHERE C.NUMPROCTRAB = :NumProcTrab'
      'AND       C.IDPESSOA           = P.IDPESSOA')
    ValidateWithMask = True
    Left = 604
    Top = 311
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 678
    Top = 271
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 678
    Top = 314
  end
  object qryHonor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select H.NUMPROCTRAB, H.DATAPAGTOHONOR,H.IDFORNSERV, '
      '           H.VALORHONOR, P.NOME'
      'from PESSOA P, HONORARIOS H'
      'where (H.NUMPROCTRAB = :NumProcTrab)'
      'and     (P.IDPESSOA = H.IDFORNSERV)'
      'order by H.NUMPROCTRAB, H.DATAPAGTOHONOR,H.IDFORNSERV')
    ValidateWithMask = True
    Left = 663
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
    object qryHonorNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Origin = 'HONORARIOS.NUMPROCTRAB'
    end
    object qryHonorDATAPAGTOHONOR: TDateTimeField
      FieldName = 'DATAPAGTOHONOR'
      Origin = 'HONORARIOS.DATAPAGTOHONOR'
    end
    object qryHonorIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = 'HONORARIOS.IDFORNSERV'
    end
    object qryHonorVALORHONOR: TFloatField
      FieldName = 'VALORHONOR'
      Origin = 'HONORARIOS.VALORHONOR'
      DisplayFormat = '###,###,##0.00'
    end
    object qryHonorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
end
