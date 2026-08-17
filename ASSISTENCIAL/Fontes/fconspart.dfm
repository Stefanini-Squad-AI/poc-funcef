object FRMconspart: TFRMconspart
  Left = 3
  Top = 9
  BorderStyle = bsSingle
  Caption = 'Consulta Geral de Pessoas'
  ClientHeight = 527
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MenuPrin
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NBKelegpart: TNotebook
    Left = 0
    Top = 183
    Width = 788
    Height = 305
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnPageChanged = NBKelegpartPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosPessoais'
      object lblNomePai: TLabel
        Left = 11
        Top = 203
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Nome do Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeMae: TLabel
        Left = 303
        Top = 203
        Width = 79
        Height = 13
        Cursor = crNo
        Caption = 'Nome da Mãe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstadoCivil: TLabel
        Left = 11
        Top = 26
        Width = 68
        Height = 13
        Cursor = crNo
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Naturalidade: TLabel
        Left = 11
        Top = 251
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Naturalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label51: TLabel
        Left = 303
        Top = 251
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Nacionalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEMail: TLabel
        Left = 157
        Top = 159
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 11
        Top = 67
        Width = 94
        Height = 13
        Cursor = crNo
        Caption = 'Num. Dep. IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 122
        Top = 67
        Width = 102
        Height = 13
        Cursor = crNo
        Caption = 'Num. Dep. Sal. F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 235
        Top = 67
        Width = 94
        Height = 13
        Cursor = crNo
        Caption = 'Num. Dep. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 117
        Width = 92
        Height = 13
        Cursor = crNo
        Caption = 'Tipo Sangüíneo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 168
        Top = 26
        Width = 86
        Height = 13
        Cursor = crNo
        Caption = 'Moléstia Grave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 267
        Top = 26
        Width = 59
        Height = 13
        Cursor = crNo
        Caption = 'Deficiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 345
        Top = 26
        Width = 89
        Height = 13
        Cursor = crNo
        Caption = 'Início Invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 454
        Top = 26
        Width = 75
        Height = 13
        Cursor = crNo
        Caption = 'Fim Invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 159
        Top = 117
        Width = 103
        Height = 13
        Cursor = crNo
        Caption = 'Grau de Instrução'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 304
        Top = 117
        Width = 20
        Height = 13
        Cursor = crNo
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label106: TLabel
        Left = 596
        Top = 25
        Width = 26
        Height = 13
        Cursor = crNo
        Caption = 'Foto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 453
        Top = 117
        Width = 33
        Height = 13
        Cursor = crNo
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label135: TLabel
        Left = 11
        Top = 159
        Width = 115
        Height = 13
        Cursor = crNo
        Caption = 'Num. Eleg. a Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbednomepai: TwwDBEdit
        Left = 9
        Top = 217
        Width = 271
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMEPAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbednomemae: TwwDBEdit
        Left = 301
        Top = 217
        Width = 273
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMEMAE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedEstadoCivil: TwwDBEdit
        Left = 9
        Top = 41
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'ESTADOCIVIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object pnlDependentes: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dados Pessoais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
      object wwDBEdit16: TwwDBEdit
        Left = 9
        Top = 265
        Width = 271
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CODESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit17: TwwDBEdit
        Left = 301
        Top = 265
        Width = 273
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMENACIONALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedEMail: TwwDBEdit
        Left = 158
        Top = 174
        Width = 416
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 9
        Top = 81
        Width = 96
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPIRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit3: TwwDBEdit
        Left = 122
        Top = 81
        Width = 96
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPTOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit4: TwwDBEdit
        Left = 235
        Top = 81
        Width = 96
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPTOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit5: TwwDBEdit
        Left = 9
        Top = 132
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'TIPOSANG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit6: TwwDBEdit
        Left = 167
        Top = 41
        Width = 88
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGMOLESTIAGRAVE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit7: TwwDBEdit
        Left = 266
        Top = 41
        Width = 67
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGDEFICIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit8: TwwDBEdit
        Left = 344
        Top = 41
        Width = 99
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'INICIOINVALIDEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit9: TwwDBEdit
        Left = 453
        Top = 41
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FIMINVALIDEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit10: TwwDBEdit
        Left = 157
        Top = 132
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'IDGRINSTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit12: TwwDBEdit
        Left = 303
        Top = 132
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CORPESSOA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBImage1: TDBImage
        Left = 595
        Top = 39
        Width = 182
        Height = 247
        DataField = 'Imagem'
        TabOrder = 17
      end
      object DbedIdade: TwwDBEdit
        Left = 453
        Top = 132
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        BiDiMode = bdLeftToRight
        Color = clInfoBk
        ParentBiDiMode = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNumElegBenef: TwwDBEdit
        Left = 9
        Top = 174
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDocumentos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Documentos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'Documento'
          'NUMDOCUMENTO'#9'18'#9'Número'
          'DATAEMISSAO'#9'12'#9'Data Emissão'
          'NOMEESTADO'#9'20'#9'Estado'
          'NOMEPAIS'#9'26'#9'País'#9'F'
          'ORGAO'#9'10'#9'Órgão'
          'UF'#9'3'#9'UF')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEnderecos'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Endereços'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object DBCtrlGrid2: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 152
        Align = alTop
        ColCount = 1
        PanelHeight = 152
        PanelWidth = 772
        TabOrder = 1
        RowCount = 1
        object Bevel2: TBevel
          Left = 6
          Top = 5
          Width = 757
          Height = 140
        end
        object Label120: TLabel
          Left = 14
          Top = 9
          Width = 32
          Height = 13
          Caption = 'Local'
        end
        object Label123: TLabel
          Left = 14
          Top = 50
          Width = 76
          Height = 13
          Caption = 'Complemento'
        end
        object Label126: TLabel
          Left = 14
          Top = 93
          Width = 40
          Height = 13
          Caption = 'Estado'
        end
        object Label127: TLabel
          Left = 643
          Top = 93
          Width = 17
          Height = 13
          Caption = 'UF'
        end
        object Label129: TLabel
          Left = 677
          Top = 93
          Width = 25
          Height = 13
          Caption = 'CEP'
        end
        object Label124: TLabel
          Left = 302
          Top = 50
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object Label121: TLabel
          Left = 302
          Top = 9
          Width = 65
          Height = 13
          Caption = 'Logradouro'
        end
        object Label128: TLabel
          Left = 303
          Top = 93
          Width = 27
          Height = 13
          Caption = 'País'
        end
        object Label125: TLabel
          Left = 499
          Top = 50
          Width = 40
          Height = 13
          Caption = 'Cidade'
        end
        object Label122: TLabel
          Left = 670
          Top = 9
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object wwDBEdit41: TwwDBEdit
          Left = 14
          Top = 24
          Width = 276
          Height = 21
          Color = clInfoBk
          DataField = 'NOME'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit44: TwwDBEdit
          Left = 14
          Top = 65
          Width = 276
          Height = 21
          Color = clInfoBk
          DataField = 'COMPLEMENTO'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit47: TwwDBEdit
          Left = 14
          Top = 108
          Width = 275
          Height = 21
          Color = clInfoBk
          DataField = 'ESTADO'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit48: TwwDBEdit
          Left = 643
          Top = 108
          Width = 27
          Height = 21
          Color = clInfoBk
          DataField = 'UF'
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit50: TwwDBEdit
          Left = 678
          Top = 108
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'CEP'
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit45: TwwDBEdit
          Left = 302
          Top = 65
          Width = 185
          Height = 21
          Color = clInfoBk
          DataField = 'BAIRRO'
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit42: TwwDBEdit
          Left = 302
          Top = 24
          Width = 351
          Height = 21
          Color = clInfoBk
          DataField = 'LOGRADOURO'
          ReadOnly = True
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit49: TwwDBEdit
          Left = 303
          Top = 108
          Width = 332
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEPAIS'
          ReadOnly = True
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit46: TwwDBEdit
          Left = 499
          Top = 65
          Width = 254
          Height = 21
          Color = clInfoBk
          DataField = 'CIDADE'
          ReadOnly = True
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit43: TwwDBEdit
          Left = 668
          Top = 24
          Width = 85
          Height = 21
          Color = clInfoBk
          DataField = 'NUMERO'
          ReadOnly = True
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgTelefones'
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Telefones'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object DBCtrlGridTelefones: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 282
        Align = alClient
        ColCount = 1
        PanelHeight = 47
        PanelWidth = 772
        TabOrder = 1
        RowCount = 6
        object Label3: TLabel
          Left = 14
          Top = 7
          Width = 23
          Height = 13
          Caption = 'DDI'
        end
        object Label4: TLabel
          Left = 71
          Top = 7
          Width = 28
          Height = 13
          Caption = 'DDD'
        end
        object Label63: TLabel
          Left = 129
          Top = 7
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label114: TLabel
          Left = 341
          Top = 7
          Width = 26
          Height = 13
          Caption = 'Tipo'
        end
        object wwDBEdit1: TwwDBEdit
          Left = 12
          Top = 21
          Width = 43
          Height = 21
          DataField = 'DDI'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit32: TwwDBEdit
          Left = 69
          Top = 21
          Width = 43
          Height = 21
          DataField = 'DDD'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit35: TwwDBEdit
          Left = 127
          Top = 21
          Width = 196
          Height = 21
          DataField = 'NUMERO'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit40: TwwDBEdit
          Left = 339
          Top = 21
          Width = 241
          Height = 21
          DataField = 'TIPO'
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContatos'
      object Label73: TLabel
        Left = 4
        Top = 225
        Width = 75
        Height = 13
        Caption = 'Observações'
      end
      object Panel24: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contatos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object DBGrContatos: TwwDBGrid
        Left = 0
        Top = 19
        Width = 789
        Height = 198
        Selected.Strings = (
          'ENDRECO'#9'30'#9'Endereço'
          'NOME'#9'30'#9'Nome'
          'EMAIL'#9'30'#9'E-Mail'#9'F'
          'CARGO'#9'15'#9'Cargo'
          'SETOR'#9'15'#9'Setor'
          'NASCIMENTO'#9'18'#9'Dt. Nascimento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DBRichEdObs: TwwDBRichEdit
        Left = 2
        Top = 240
        Width = 785
        Height = 73
        AutoURLDetect = False
        DataField = 'OBS'
        PrintJobName = 'Delphi 5'
        TabOrder = 2
        EditorCaption = 'Edit Rich Text'
        EditorPosition.Left = 0
        EditorPosition.Top = 0
        EditorPosition.Width = 0
        EditorPosition.Height = 0
        MeasurementUnits = muInches
        PrintMargins.Top = 1
        PrintMargins.Bottom = 1
        PrintMargins.Left = 1
        PrintMargins.Right = 1
        RichEditVersion = 2
        Data = {
          810000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C667331362044425269636845644F62735C7061720D
          0A7D0D0A00}
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContasBancarias'
      object dbgrContaBancaria: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'NUMBANCO'#9'10'#9'Banco'#9'F'
          'NUMAGENCIA'#9'15'#9'Agência'
          'CONTACORRENTE'#9'15'#9'Conta Corrente'
          'CONTAPREF'#9'3'#9'Preferencial'
          'NOMEBANCO'#9'30'#9'Nome do Banco'
          'NOMEAGENCIA'#9'30'#9'Nome da Agência'
          'TPCONTA'#9'8'#9'Tipo'
          'FLGCONTACONJUNTA'#9'1'#9'Conjunta')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contas Bancárias'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDependentes'
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dependentes'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgriddepen: TwwDBGrid
        Left = 0
        Top = 18
        Width = 788
        Height = 287
        Selected.Strings = (
          'NUMSEQUENCIA'#9'4'#9'Seq.'#9'F'
          'MATRICULA'#9'10'#9'Matrícula'#9'F'
          'NOME'#9'40'#9'Nome'#9'F'
          'DEPENDENCIA'#9'15'#9'Grau de~Parentesco'#9'F'
          'FLGISENTOIRRF'#9'5'#9'Isento~de IR'#9'F'
          'DATANASC'#9'9'#9'Data de ~Nascimento'#9'F'
          'SEXO'#9'4'#9'Sexo'#9'F'
          'FLGELEGIVEL'#9'10'#9'Elegível a~Benefício'#9'F'
          'FLGBENEFICIARIO'#9'10'#9'Beneficiário'#9'F'
          'FLGCONTAIMPOSTOR'#9'10'#9'Imposto~de Renda'#9'F'
          'FLGCONTASALARIOF'#9'10'#9'Salário~Família'#9'F'
          'FLGDESIGNADO'#9'10'#9'Designado'#9'F'
          'FLGDEPLEGAL'#9'10'#9'Dependente~Legal'#9'F'
          'FLGMOLESTIAGRAVE'#9'12'#9'Possui Moléstia~Grave'#9'F'
          'DATAMOLESTIAGRAVE'#9'13'#9'Moléstia~Grave desde'#9'F'
          'NOMEMAE'#9'35'#9'Nome da Mãe'#9'F'
          'NOMEPAI'#9'35'#9'Nome do Pai'#9'F'
          'NUMDOCUMENTO'#9'18'#9'CPF'#9'F'
          'SITUACAODEPEN'#9'50'#9'Situaçao ~Dependente'#9'F'
          'DATAMORTE'#9'13'#9'Data do~Falecimento'#9'F'
          'DESCESTCIVIL'#9'26'#9'Estado~Civil'#9'F'
          'VALORBASE1'#9'10'#9'Opção 1'#9'F'
          'VALORBASE2'#9'10'#9'Opção 2'#9'F'
          'VALORBASE3'#9'10'#9'Opção 3'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        OnDblClick = dbgriddepenDblClick
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosBasicos'
      object lblnomepatro: TLabel
        Left = 5
        Top = 36
        Width = 80
        Height = 13
        Cursor = crNo
        Caption = 'Patrocinadora'
      end
      object lblNomeCargo: TLabel
        Left = 295
        Top = 35
        Width = 43
        Height = 13
        Cursor = crNo
        Caption = 'Função'
      end
      object Label18: TLabel
        Left = 6
        Top = 74
        Width = 32
        Height = 13
        Cursor = crNo
        Caption = 'Nível'
      end
      object lblSalarioTotal: TLabel
        Left = 667
        Top = 114
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Salário Total'
      end
      object lblDataAdmissao: TLabel
        Left = 540
        Top = 113
        Width = 103
        Height = 13
        Cursor = crNo
        Caption = 'Data de Admissão'
      end
      object lblSitFunc: TLabel
        Left = 290
        Top = 113
        Width = 237
        Height = 13
        Cursor = crNo
        Caption = 'Situação do Empregado na Patrocinadora'
      end
      object lblNomeFilial: TLabel
        Left = 5
        Top = 113
        Width = 27
        Height = 13
        Cursor = crNo
        Caption = 'Filial'
      end
      object Label67: TLabel
        Left = 7
        Top = 191
        Width = 88
        Height = 13
        Cursor = crNo
        Caption = 'Dt. Início INSS'
      end
      object Label69: TLabel
        Left = 111
        Top = 192
        Width = 28
        Height = 13
        Cursor = crNo
        Caption = 'DDD'
      end
      object Label68: TLabel
        Left = 150
        Top = 192
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Tel. Comercial'
      end
      object Label151: TLabel
        Left = 545
        Top = 35
        Width = 34
        Height = 13
        Cursor = crNo
        Caption = 'Cargo'
      end
      object Label156: TLabel
        Left = 294
        Top = 73
        Width = 123
        Height = 13
        Cursor = crNo
        Caption = 'Vinculação Funcional'
      end
      object DBText9: TDBText
        Left = 7
        Top = 151
        Width = 239
        Height = 13
        DataField = 'NOMEVALORBASE1'
      end
      object DBText10: TDBText
        Left = 273
        Top = 151
        Width = 239
        Height = 13
        DataField = 'NOMEVALORBASE2'
      end
      object DBText11: TDBText
        Left = 543
        Top = 151
        Width = 239
        Height = 13
        DataField = 'NOMEVALORBASE3'
      end
      object dbednomepatro: TwwDBEdit
        Left = 5
        Top = 50
        Width = 276
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'PATRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedcargo: TwwDBEdit
        Left = 292
        Top = 50
        Width = 240
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'FUNCAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbednivel: TwwDBEdit
        Left = 6
        Top = 88
        Width = 275
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'NIVEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedsaltotal: TwwDBEdit
        Left = 667
        Top = 127
        Width = 110
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'SALTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeddataadmissao: TwwDBEdit
        Left = 540
        Top = 127
        Width = 120
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'DATAADMISSAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedsitfunc: TwwDBEdit
        Left = 290
        Top = 127
        Width = 241
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'SITUACAONAPATRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedFilial: TwwDBEdit
        Left = 5
        Top = 127
        Width = 276
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor1: TwwDBEdit
        Left = 5
        Top = 166
        Width = 240
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor2: TwwDBEdit
        Left = 273
        Top = 166
        Width = 240
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor3: TwwDBEdit
        Left = 541
        Top = 166
        Width = 240
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit18: TwwDBEdit
        Left = 5
        Top = 206
        Width = 92
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'DATAINICIOINSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit19: TwwDBEdit
        Left = 108
        Top = 206
        Width = 32
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'DDD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit20: TwwDBEdit
        Left = 148
        Top = 206
        Width = 117
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dados Básicos Funcionais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 13
      end
      object wwDBEdit81: TwwDBEdit
        Left = 543
        Top = 50
        Width = 240
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'NOMECARGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit82: TwwDBEdit
        Left = 292
        Top = 88
        Width = 240
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'VINCULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEvolucaoFuncional'
      object Bevel1: TBevel
        Left = 3
        Top = 20
        Width = 782
        Height = 109
      end
      object Label105: TLabel
        Left = 8
        Top = 22
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedNomeParticipante: TDBText
        Left = 8
        Top = 38
        Width = 108
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label104: TLabel
        Left = 8
        Top = 57
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object DBText2: TDBText
        Left = 8
        Top = 73
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label103: TLabel
        Left = 8
        Top = 91
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object DBText3: TDBText
        Left = 8
        Top = 107
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMEPLANO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 304
        Top = 107
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label102: TLabel
        Left = 304
        Top = 91
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object DBText5: TDBText
        Left = 304
        Top = 73
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblmat: TLabel
        Left = 304
        Top = 57
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object sbtnCalcEnquadramento: TSpeedButton
        Left = 745
        Top = 64
        Width = 23
        Height = 22
        Hint = 'Calcular Enquadramento com data de HOJE'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
      object Label101: TLabel
        Left = 597
        Top = 57
        Width = 140
        Height = 13
        Caption = 'Valor do Enquadramento'
      end
      object DBText1: TDBText
        Left = 695
        Top = 73
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'VLRENQUADRAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pgctrlDetalhe: TPageControl
        Left = 1
        Top = 133
        Width = 789
        Height = 166
        ActivePage = tbsDet
        TabOrder = 0
        object tbsDet: TTabSheet
          Caption = 'Cargos'
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object Label75: TLabel
              Left = 246
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object lblTituloTipo: TLabel
              Left = 8
              Top = 9
              Width = 34
              Height = 13
              Caption = 'Cargo'
            end
            object Label76: TLabel
              Left = 370
              Top = 9
              Width = 32
              Height = 13
              Caption = 'Modo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbCargoxNivel: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 236
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCARGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Cargo'
                'CODIGO'#9'15'#9'Nível')
              DataField = 'IDCARGOEXT'
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbDataInicio: TCMDateTimePicker
              Left = 246
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dblkpcmbModoCargo: TwwDBLookupCombo
              Left = 370
              Top = 24
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'21'#9'Modo'#9'F')
              DataField = 'MODOFUNCAO'
              LookupField = 'CODIGO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object dbgrdDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'#9'F'
              'CARGO'#9'40'#9'Cargo'#9'F'
              'DATAINICIO'#9'13'#9'Data de~Início'#9'F'
              'DATAFINAL'#9'13'#9'Data de ~Término'#9'F'
              'FLGSITPART'#9'24'#9'Situação'#9'F'
              'DESCMODO'#9'14'#9'Modo'#9'F'
              'DESCORIGEM'#9'20'#9'Origem'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsFuncao: TTabSheet
          Caption = 'Funções'
          object pnlControlesFuncao: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label77: TLabel
              Left = 10
              Top = 54
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label78: TLabel
              Left = 10
              Top = 9
              Width = 43
              Height = 13
              Caption = 'Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label79: TLabel
              Left = 259
              Top = 54
              Width = 32
              Height = 13
              Caption = 'Modo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label80: TLabel
              Left = 135
              Top = 54
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label81: TLabel
              Left = 405
              Top = 54
              Width = 62
              Height = 13
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbFuncao: TwwDBLookupCombo
              Left = 10
              Top = 24
              Width = 245
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Funções'#9'F')
              DataField = 'IDFUNCAO'
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbDataInicioFuncao: TCMDateTimePicker
              Left = 10
              Top = 69
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 135
              Top = 69
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object dblkpcmbModoFuncao: TwwDBLookupCombo
              Left = 259
              Top = 69
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'21'#9'Modo'#9'F')
              DataField = 'MODOFUNCAO'
              LookupField = 'CODIGO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBEdit27: TwwDBEdit
              Left = 405
              Top = 69
              Width = 76
              Height = 21
              DataField = 'PERCFUNCAO'
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbgrdFuncao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'#9'F'
              'GRUPO'#9'15'#9'Grupo'#9'F'
              'FUNCAO'#9'40'#9'Função'#9'F'
              'DATAINICIO'#9'12'#9'Data de ~Início'#9'F'
              'DATAFINAL'#9'12'#9'Data de ~Término'#9'F'
              'FLGSITPART'#9'24'#9'Situação'#9'F'
              'PERCFUNCAO'#9'11'#9'Percentual%'#9'F'
              'DESCMODO'#9'21'#9'Modo'#9'F'
              'DESCORIGEM'#9'23'#9'Origem'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsAdicCompens: TTabSheet
          Caption = 'Adic. Compensatório'
          ImageIndex = 6
          object pnlAdicCompensatorio: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label82: TLabel
              Left = 262
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label83: TLabel
              Left = 10
              Top = 9
              Width = 236
              Height = 13
              Caption = 'Função Base do Adicional Compensatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label84: TLabel
              Left = 387
              Top = 9
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label85: TLabel
              Left = 513
              Top = 9
              Width = 62
              Height = 13
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo
              Left = 10
              Top = 24
              Width = 245
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'TITULO'#9'40'#9'Funções'#9'F')
              DataField = 'IDFUNCAO'
              LookupField = 'IDCARGOEXT'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dtInicioAdicCompens: TCMDateTimePicker
              Left = 262
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dtFimAdicCompens: TCMDateTimePicker
              Left = 387
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object edPercAdicCompens: TwwDBEdit
              Left = 513
              Top = 24
              Width = 76
              Height = 21
              DataField = 'PERC1AC'
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbgrdAdicCompens: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'
              'GRUPO'#9'15'#9'Grupo'
              'FUNCAO'#9'40'#9'Função Base'
              'DATAINICIO'#9'12'#9'Data de ~Início'
              'DATAFINAL'#9'12'#9'Data de ~Término'
              'FLGSITPART'#9'24'#9'Situação'
              'PERC1AC'#9'10'#9'Percentual (%)'
              'DESCORIGEM'#9'23'#9'Origem')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsATS: TTabSheet
          Caption = 'Adic. por Tempo de Serviço'
          object pnlATS: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label86: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label87: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label88: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object spbtnCalcPercATS: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object dbDataInicioATS: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dbDataFinalATS: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedValorATS: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCATS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 2
              IntDigits = 10
              DecDigits = 5
            end
          end
          object dbgrdATS: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCATS'#9'20'#9'Percentual (%)'#9'F'
              'DESCORIGEM'#9'30'#9'Origem'
              'FLGSITPART'#9'24'#9'Situação'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object tbsAdicInsalub: TTabSheet
          Caption = 'Adic. Insalubridade'
          ImageIndex = 4
          object Panel29: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label89: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label90: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label91: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object SpeedButton1: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object dtInicioAdicInsalub: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFimAdicInsalub: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercInsalub: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCINSALUB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 2
              IntDigits = 10
              DecDigits = 5
            end
          end
          object dbgrdAdicInsalub: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCINSALUB'#9'20'#9'Percentual (%)'
              'DESCORIGEM'#9'30'#9'Origem'
              'FLGSITPART'#9'24'#9'Situação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsAdicNoturno: TTabSheet
          Caption = 'Adic. Noturno'
          ImageIndex = 7
          object pnlAdicNoturno: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label92: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label93: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label94: TLabel
              Left = 386
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object Label95: TLabel
              Left = 260
              Top = 15
              Width = 80
              Height = 13
              Caption = 'Qtde. Minutos'
            end
            object dtInicioAdicNoturno: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFimAdicNoturno: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercAdicNoturno: TDBEdit2
              Left = 386
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCADNOT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 3
              IntDigits = 10
              DecDigits = 5
            end
            object dbedQtdeMinutos: TDBEdit2
              Left = 260
              Top = 30
              Width = 121
              Height = 21
              DataField = 'QTDEMINUTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 2
              IntDigits = 10
              DecDigits = 5
            end
          end
          object dbgrdAdicNoturno: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'QTDEMINUTOS'#9'10'#9'Qtde. Minutos'
              'PERCADNOT'#9'10'#9'Percentual (%)'
              'FLGSITPART'#9'24'#9'Situação'
              'DESCORIGEM'#9'30'#9'Origem')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsAdicPericul: TTabSheet
          Caption = 'Adic. Periculosidade'
          ImageIndex = 5
          object Panel32: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object Label96: TLabel
              Left = 9
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label97: TLabel
              Left = 135
              Top = 15
              Width = 95
              Height = 13
              Caption = 'Data de Término'
            end
            object Label98: TLabel
              Left = 263
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Percentual (%)'
            end
            object SpeedButton2: TSpeedButton
              Left = 387
              Top = 29
              Width = 23
              Height = 22
              Hint = 'Calcular Percentual do Adicional'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                0333337F777777737F333308888888880333337F333333337F33330888888888
                03333373FFFFFFFF733333700000000073333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object dtIniAdicPericul: TCMDateTimePicker
              Left = 9
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dtFIMAdicPericul: TCMDateTimePicker
              Left = 135
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFINAL'
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedPercPericul: TDBEdit2
              Left = 263
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PERCPERICUL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 2
              IntDigits = 10
              DecDigits = 5
            end
          end
          object dbgrdAdicPericul: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCPERICUL'#9'20'#9'Percentual (%)'
              'FLGSITPART'#9'24'#9'Situação'
              'DESCORIGEM'#9'30'#9'Origem')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsRubSal: TTabSheet
          Caption = 'Outras Rubricas Salariais'
          object pnlControlesRubSalarial: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            object grpMesAnoRef: TGroupBox
              Left = 6
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              object dbedAnoMesRefRubSal: TwwDBEdit
                Left = 9
                Top = 22
                Width = 121
                Height = 21
                DataField = 'MES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Picture.PictureMask = '####/##'
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object GroupBox1: TGroupBox
              Left = 171
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Cobr/Pgmto'
              TabOrder = 1
              object dbedAnoMesCobRubSal: TwwDBEdit
                Left = 9
                Top = 22
                Width = 121
                Height = 21
                DataField = 'MESCOBRANCA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object GroupBox3: TGroupBox
              Left = 336
              Top = 6
              Width = 316
              Height = 94
              Caption = 'Informações da Rubrica'
              TabOrder = 2
              object Label99: TLabel
                Left = 7
                Top = 15
                Width = 45
                Height = 13
                Caption = 'Rubrica'
              end
              object Label100: TLabel
                Left = 7
                Top = 53
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object dbedValor: TwwDBEdit
                Left = 7
                Top = 66
                Width = 121
                Height = 21
                DataField = 'VALORPROVENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblkpcmbRubrica: TwwDBLookupCombo
                Left = 7
                Top = 29
                Width = 286
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRPROVDESC'#9'130'#9'Rubrica'
                  'CODPROVDESC'#9'7'#9'Código')
                DataField = 'IDRUBRICA'
                LookupField = 'IDRUBRICA'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object dbgrdRubSal: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 138
            Selected.Strings = (
              'CODPROVDESC'#9'7'#9'Código ~da Rubrica'#9'F'
              'MES'#9'7'#9'Mês de ~Referência'#9'F'
              'MESCOBRANCA'#9'7'#9'Mês de ~Cobrança'#9'F'
              'VALORPROVENTO'#9'10'#9'Valor da ~Rubrica'#9'F'
              'VALORNADIB'#9'10'#9'Valor na ~Data  Ref.'#9'F'
              'PERCENTUALNADIB'#9'10'#9'Percentual ~na Data Ref.'#9'F'
              'MODULO'#9'21'#9'Módulo'#9'F'
              'DESCRPROVDESC'#9'60'#9'Nome da Rubrica'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object Panel43: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Evolução Funcional'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgHistoricoFuncional'
      object Label59: TLabel
        Left = 6
        Top = 31
        Width = 217
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (sem Conversão)'
      end
      object Label60: TLabel
        Left = 409
        Top = 31
        Width = 218
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (com Conversão)'
      end
      object pnlHstFuncional: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico Funcional'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridhistfunc: TwwDBGrid
        Left = 0
        Top = 74
        Width = 789
        Height = 242
        Selected.Strings = (
          'EMPRESA'#9'30'#9'Empresa'#9'F'
          'MATRICULA'#9'13'#9'Matrícula'#9'F'
          'DATAINICIO'#9'10'#9'Data Inicial'#9'F'
          'DATAFINAL'#9'10'#9'Data Final'#9'F'
          'TEMPOCALC'#9'10'#9'Dias'#9'F'
          'TEMPOPOREMPRESAEXTENSO'#9'49'#9'Tempo por empresa'#9'F'
          'INSALUBRI'#9'30'#9'Insalubridade'#9'F'
          'FLGCONTATS'#9'10'#9'Conta como tempo ~de Serviço'#9'F'
          'TEMPOSERVANTERIOR'#9'22'#9'Tempo de Serviço Anterior ~[em meses]'#9'F'
          'TEMPONAOCREDITADO'#9'17'#9'Tempo não Creditado ~[em meses]'#9'F'
          'TEMPOSEMCONVERSAO'#9'10'#9'Tempo Sem Conversão'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 4
        ShowHorzScrollBar = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBEdit13: TwwDBEdit
        Left = 5
        Top = 44
        Width = 47
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSEMCONVERSAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edTempoTotal: TEdit
        Left = 55
        Top = 44
        Width = 334
        Height = 21
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object wwDBEdit14: TwwDBEdit
        Left = 409
        Top = 44
        Width = 47
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSERVCALC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edTempoEspecial: TEdit
        Left = 461
        Top = 44
        Width = 314
        Height = 21
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgRubricasSalariais'
      object wwDBGrid11: TwwDBGrid
        Left = 0
        Top = 70
        Width = 788
        Height = 235
        Selected.Strings = (
          'MES'#9'9'#9'Mês de ~Referência'
          'CODPROVDESC'#9'13'#9'Código na~Patrocinadora'
          'PROVENTODESC'#9'10'#9'Tipo de ~Rubrica'
          'VALORPROVENTO'#9'11'#9'Valor (R$)'
          'DESCRICAO'#9'50'#9'Rubrica'
          'FLGCOMPOESALBENEF'#9'8'#9'Compõe ~Sal. Benf.'
          'FLGCOMPOESALPART'#9'8'#9'Compõe ~Sal. Part.'
          'FLGCOMPOEREMTOTAL'#9'12'#9'Compõe ~Sal. Rem. Total'
          'DESCFLGSRB'#9'42'#9'Tipo'
          'FLGSRB'#9'4'#9'SRB'
          'IDRUBRICA'#9'7'#9'Código~Interno')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel28: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 21
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Histórico de Rubricas Salariais - Ativo'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
      object Panel18: TPanel
        Left = 0
        Top = 21
        Width = 788
        Height = 49
        Align = alTop
        TabOrder = 2
        object Label74: TLabel
          Left = 8
          Top = 4
          Width = 100
          Height = 13
          Caption = 'Mês de Cobrança'
        end
        object Label14: TLabel
          Left = 116
          Top = 5
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label54: TLabel
          Left = 416
          Top = 7
          Width = 58
          Height = 13
          Caption = 'Proventos'
        end
        object Label159: TLabel
          Left = 530
          Top = 7
          Width = 61
          Height = 13
          Caption = 'Descontos'
        end
        object Label160: TLabel
          Left = 649
          Top = 7
          Width = 44
          Height = 13
          Caption = 'Líquido'
        end
        object dblkMesCobranca: TwwDBLookupCombo
          Left = 6
          Top = 20
          Width = 103
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'MESCOBRANCA'#9'F')
          LookupField = 'MESCOBRANCA'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkMesCobrancaChange
        end
        object dblkPatros: TwwDBLookupCombo
          Left = 116
          Top = 20
          Width = 293
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9#9'F')
          LookupField = 'IDPESSJUR'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkMesCobrancaChange
        end
        object wwDBEdit25: TwwDBEdit
          Left = 415
          Top = 20
          Width = 107
          Height = 21
          Color = clAqua
          DataField = 'SUMPROVENTO'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit26: TwwDBEdit
          Left = 529
          Top = 20
          Width = 112
          Height = 21
          Color = clRed
          DataField = 'SUMDESCONTO'
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit83: TwwDBEdit
          Left = 648
          Top = 20
          Width = 112
          Height = 21
          Color = clInfoBk
          DataField = 'SUMLIQ'
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEventosPrevidenciarios'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Eventos Previdenciários'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object grpbxHstEventPro: TGroupBox
        Left = 0
        Top = 19
        Width = 788
        Height = 138
        Align = alTop
        Caption = 'Histórico de Eventos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
        object wwDBGrid2: TwwDBGrid
          Left = 2
          Top = 19
          Width = 784
          Height = 117
          Selected.Strings = (
            'NOME'#9'40'#9'Evento Gerador'#9'F'
            'DATAEVENTO'#9'11'#9'Evento'#9'F'
            'INSCRICAONUMERO'#9'11'#9'Número~Inscrição'#9'F'
            'DATAREGISTRO'#9'11'#9'Registro'#9'F'
            'DATAEFETIVADO'#9'10'#9'Efetivação'#9'F'
            'DATAVOLTA'#9'13'#9'Data de~Rerorno'#9'F'
            'SITPARTNOVO'#9'30'#9'Nova Situação~na Fundação'#9'F'
            'SITFUNCNOVO'#9'30'#9'Nova Situação~na Patrocinadora'#9'F'
            'SITPLANONOVO'#9'30'#9'Nova Situação~no Plano'#9'F'
            'SITPARTATUAL'#9'30'#9'Situação Fundação ~Antes do Evento'#9'F'
            'SITFUNCATUAL'#9'30'#9'Situação Patrocinadora ~Antes do Evento'#9'F'
            'SITPLANOATUAL'#9'30'#9'Situação Plano ~Antes do Evento'#9'F'
            'PLANO'#9'40'#9'Plano'#9'F'
            'PATRO'#9'40'#9'Patrocinadora'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 157
        Width = 788
        Height = 148
        Align = alClient
        Caption = 'Histórico de Contribuições'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
        object pnlEventPrevHstContrib: TPanel
          Left = 621
          Top = 19
          Width = 165
          Height = 127
          Align = alRight
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Shape2: TShape
            Left = 7
            Top = 17
            Width = 16
            Height = 12
            Brush.Color = clMaroon
          end
          object Shape3: TShape
            Left = 7
            Top = 50
            Width = 16
            Height = 12
            Brush.Color = clTeal
          end
          object Label16: TLabel
            Left = 35
            Top = 50
            Width = 101
            Height = 26
            Caption = 'Novas Contribuições Associadas'
            WordWrap = True
          end
          object Label17: TLabel
            Left = 33
            Top = 14
            Width = 122
            Height = 26
            Caption = 'Contribuições Suspensas de Cobrança'
            WordWrap = True
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 19
          Width = 619
          Height = 127
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 1
          object dbgHstContFechado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 619
            Height = 127
            Selected.Strings = (
              'CONTRIBUICAOF'#9'85'#9'Contribuição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgHstContFechadoCalcCellColors
            IndicatorColor = icBlack
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEventosAssistenciais'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Eventos Assistenciais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdEventos: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'DATAEVENT'#9'10'#9'Data do Evento'
          'VALOREVENT'#9'10'#9'Valor do Evento'
          'SERV'#9'25'#9'Serviço'
          'PLANASS'#9'25'#9'Plano Assistencial'
          'PREV'#9'25'#9'Plano Previdenciário'
          'TIT'#9'25'#9'Titular'
          'DEP'#9'25'#9'Dependente'
          'VALORPAGO'#9'10'#9'Valor Pago'
          'DATAPAG'#9'10'#9'Data do Pagamento'
          'FLGREEMBOLSO'#9'10'#9'Reembolso ?'
          'MATRICULA'#9'13'#9'Matrícula'
          'CPF'#9'13'#9'CPF'
          'DATAADMISSAO'#9'10'#9'Data de Admissão')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgProtocolos'
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Align = alClient
        ColCount = 1
        PanelHeight = 95
        PanelWidth = 772
        TabOrder = 0
        RowCount = 3
        object Label19: TLabel
          Left = 88
          Top = 19
          Width = 24
          Height = 13
          Caption = 'Rub'
        end
        object Label20: TLabel
          Left = 8
          Top = 19
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label21: TLabel
          Left = 8
          Top = 56
          Width = 44
          Height = 13
          Caption = 'Usuário'
        end
        object Label58: TLabel
          Left = 208
          Top = 8
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object DBMemo1: TDBMemo
          Left = 209
          Top = 32
          Width = 529
          Height = 60
          Color = clInfoBk
          DataField = 'DESCRICAO'
          Enabled = False
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 32
          Width = 75
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINCLUSAO'
          Enabled = False
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 69
          Width = 194
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEUSUARIO'
          Enabled = False
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 32
          Width = 114
          Height = 21
          Color = clInfoBk
          DataField = 'IDRUBS'
          Enabled = False
          TabOrder = 3
        end
        object DBEdit44: TDBEdit
          Left = 248
          Top = 5
          Width = 489
          Height = 21
          Color = clInfoBk
          DataField = 'DESCGRUPO'
          Enabled = False
          TabOrder = 4
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Protocolos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgProcessosRAD'
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Processos RAD'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridproc: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'IDPROCESSO'#9'10'#9'Num. Processo'
          'DATAINIPROCESSO'#9'10'#9'Data Ini'
          'DATAFIMPROCESSO'#9'10'#9'Data Fim'
          'DATAFIMPREV'#9'10'#9'Fim Prev.'
          'STATUS'#9'20'#9'Status'
          'TIPOPROCESSO'#9'35'#9'Tipo de Processo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgRUB'
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'RUBS'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object GrdRub: TwwDBGrid
        Left = 2
        Top = 37
        Width = 391
        Height = 118
        Selected.Strings = (
          'IDRUBS'#9'10'#9'Num Rubs'
          'STATUS'#9'13'#9'Status'
          'DATAMOV'#9'19'#9'Data de Movimentação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        KeyOptions = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel26: TPanel
        Left = 4
        Top = 19
        Width = 389
        Height = 17
        BevelInner = bvLowered
        Caption = 'RUBS'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
      object wwDBGrid7: TwwDBGrid
        Left = 397
        Top = 37
        Width = 386
        Height = 117
        Selected.Strings = (
          'FLGRECEBIDO'#9'2'#9'Recebido'#9'F'
          'DATARECEB'#9'13'#9'Data Recebimento'#9'F'
          'NOMEDOCUMENTO'#9'100'#9'Documento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel27: TPanel
        Left = 396
        Top = 19
        Width = 388
        Height = 17
        BevelInner = bvLowered
        Caption = 'Documentos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 4
      end
      object Panel30: TPanel
        Left = 2
        Top = 159
        Width = 391
        Height = 17
        BevelInner = bvLowered
        Caption = 'Benefícios/Serviços'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 5
      end
      object wwDBGrid9: TwwDBGrid
        Left = 2
        Top = 176
        Width = 391
        Height = 139
        Selected.Strings = (
          'NOME'#9'50'#9'Benefício\Serviço'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid10: TwwDBGrid
        Left = 396
        Top = 176
        Width = 389
        Height = 138
        Hint = 'Duplo Click exibe o conteúdo do histórico'
        Selected.Strings = (
          'HISTORICO'#9'9'#9'Histórico'
          'STATUS'#9'20'#9'Descrição'
          'TRGDTINCLUSAO'#9'10'#9'Data')
        MemoAttributes = [mSizeable, mWordWrap, mGridShow]
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        KeyOptions = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel31: TPanel
        Left = 397
        Top = 159
        Width = 388
        Height = 17
        BevelInner = bvLowered
        Caption = 'Histórico de Movimentacão da RUBS'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 8
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesSituacaoAtual'
      object Panel36: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contribuições/Situação Atual'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object DBCtrlGrid3: TDBCtrlGrid
        Left = 0
        Top = 16
        Width = 785
        Height = 99
        ColCount = 1
        PanelHeight = 99
        PanelWidth = 769
        TabOrder = 1
        RowCount = 1
        object Bevel3: TBevel
          Left = 3
          Top = 2
          Width = 764
          Height = 94
        end
        object Label130: TLabel
          Left = 13
          Top = 4
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label131: TLabel
          Left = 447
          Top = 4
          Width = 78
          Height = 13
          Caption = 'Sit. Cobrança'
        end
        object Label132: TLabel
          Left = 13
          Top = 48
          Width = 65
          Height = 13
          Caption = 'Data Início'
        end
        object Label133: TLabel
          Left = 123
          Top = 48
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object dbtNoneValBase1: TDBText
          Left = 231
          Top = 48
          Width = 162
          Height = 13
          DataField = 'NOMEVALORBASE1'
        end
        object dbtNoneValBase2: TDBText
          Left = 406
          Top = 48
          Width = 162
          Height = 13
          DataField = 'NOMEVALORBASE2'
        end
        object dbtNoneValBase3: TDBText
          Left = 581
          Top = 48
          Width = 162
          Height = 14
          DataField = 'NOMEVALORBASE3'
        end
        object wwDBEdit51: TwwDBEdit
          Left = 11
          Top = 19
          Width = 396
          Height = 21
          DataField = 'NOME'
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit52: TwwDBEdit
          Left = 445
          Top = 19
          Width = 296
          Height = 21
          DataField = 'SITCOBRANCA'
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit53: TwwDBEdit
          Left = 11
          Top = 64
          Width = 86
          Height = 21
          DataField = 'DATAINICIO'
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit54: TwwDBEdit
          Left = 121
          Top = 64
          Width = 86
          Height = 21
          DataField = 'DATAFINAL'
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit55: TwwDBEdit
          Left = 229
          Top = 64
          Width = 162
          Height = 21
          DataField = 'VALORBASE1'
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit56: TwwDBEdit
          Left = 404
          Top = 64
          Width = 162
          Height = 21
          DataField = 'VALORBASE2'
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit57: TwwDBEdit
          Left = 579
          Top = 64
          Width = 162
          Height = 21
          DataField = 'VALORBASE3'
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesHistoricoPrevidenciario'
      object Panel22: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Contribuições do Pevidenciário'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdContribPrev: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'MESREFERENCIA'#9'8'#9'Mês~Referência'#9'F'
          'MESCOBRANCA'#9'7'#9'Mês~Cobrança'#9'F'
          'MOTIVO'#9'25'#9'Motivo'#9'F'
          'CONTRIB'#9'30'#9'Contribuição'#9'F'
          'VALORESPERADO'#9'10'#9'Valor~ Esperado'#9'F'
          'VALORRECEBIDO'#9'12'#9'Valor~ Recebido'#9'F'
          'FLGDEVOLUCAO'#9'10'#9'Devolução'#9'F'
          'FLGCALCRESERVA'#9'7'#9'Alimentou~Reserva'#9'F'
          'DESCRICAO'#9'25'#9'Situação'#9'F'
          'DATARECEBIMENTO'#9'10'#9'Data~Recebimento'#9'F'
          'QUANTCOTAS'#9'17'#9'Quantidade de Cotas'#9'F'
          'PLANPREV'#9'25'#9'Plano Previdenciário'#9'F'
          'DATAFINAL'#9'10'#9'Data Final'#9'F'
          'NOME_1'#9'20'#9'Periodicidade'#9'F'
          'NOME'#9'35'#9'Titular'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesReservaSaldo'
      object lblSaldosReserva: TLabel
        Left = 0
        Top = 273
        Width = 788
        Height = 32
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo: R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Reserva/Saldo Conta'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdResPoupanca: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 254
        Selected.Strings = (
          'NOME'#9'47'#9'Reserva '
          'DATAULTALIM'#9'10'#9'Data~ Referência'
          'VALORRESERVA'#9'16'#9'Reserva~ Em Cotas'
          'COTVALOR'#9'11'#9'Valor ~da Cota'
          'VLRATUAL'#9'16'#9'Valor na Moeda~Corrente'
          'FLGATIVO'#9'7'#9'Situação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alTop
        EditCalculated = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesReservaHistoricoAlimentacao'
      object dbgrHistReserva: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'CODIGO'#9'8'#9'Código'
          'MESREFERENCIA'#9'8'#9'Referência'
          'FLGENTRADA'#9'3'#9'E/S'
          'SALDOCOTAS'#9'18'#9'Saldo Cotas'
          'VALORINDICE'#9'12'#9'Valor Índice'
          'SALDOREAL'#9'13'#9'Saldo Real'
          'VLRCOTAS'#9'18'#9'Valor Cotas'
          'VLRREAL'#9'14'#9'Valor Real'
          'NOME'#9'43'#9'Nome da Reserva '
          'DATAALIMENTACAO'#9'10'#9'Alimentação'
          'DATAMOV'#9'10'#9'Movimento'
          'MOESIGLA'#9'11'#9'Índice'
          'NOMEBENEF'#9'34'#9'Benefício'
          'NOMECONTRIB'#9'40'#9'Contribuição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        EditCalculated = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Alimentação'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesReservaExtrato'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosProcessos'
      object wwDBGrid12: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'NUMEROPROCESSO'#9'10'#9'Núm.~Processo CM'
          'NUMPROCINSS'#9'15'#9'Núm.~Processo INSS'#9'F'
          'BENEFICIO'#9'40'#9'Benefício'
          'SITPROCESSO'#9'35'#9'Situação do Processo'
          'EVENTOGER'#9'40'#9'Evento Gerador'
          'DTEVENTO'#9'18'#9'Data do Evento'
          'DTREGISTRO'#9'18'#9'Data de Registro'
          'DATAINICIOBENEF'#9'18'#9'Data de Início~do Benefício'
          'DATAFINAL'#9'18'#9'Data de Final~do Benefício'
          'DATAINICIOPAG'#9'18'#9'Data de Início de~Pagamento do Benefício'
          'VALORATUAL'#9'10'#9'Valor Atual'
          'VALORCALCULADO'#9'10'#9'Valor Calculado'
          'VALORCOTAS'#9'10'#9'Valor em Cotas')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel33: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Processos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosSituacaoAtual'
      object Panel34: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Benefícios/Situação Atual'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object DBCtrlGrid4: TDBCtrlGrid
        Left = 1
        Top = 19
        Width = 784
        Height = 238
        ColCount = 1
        PanelHeight = 238
        PanelWidth = 768
        TabOrder = 1
        RowCount = 1
        object Bevel4: TBevel
          Left = 4
          Top = 4
          Width = 760
          Height = 229
        end
        object Label136: TLabel
          Left = 14
          Top = 8
          Width = 86
          Height = 13
          Caption = 'Num. Proc. CM'
        end
        object Label137: TLabel
          Left = 114
          Top = 8
          Width = 97
          Height = 13
          Caption = 'Num. Proc. INSS'
        end
        object Label138: TLabel
          Left = 227
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Benefício'
        end
        object Label139: TLabel
          Left = 583
          Top = 8
          Width = 79
          Height = 13
          Caption = 'Sit. Benefício'
        end
        object Label140: TLabel
          Left = 14
          Top = 53
          Width = 133
          Height = 13
          Caption = 'Tipo de Pgto do Benef.'
        end
        object Label141: TLabel
          Left = 168
          Top = 53
          Width = 86
          Height = 13
          Caption = 'Início do Pgto.'
        end
        object Label142: TLabel
          Left = 268
          Top = 53
          Width = 62
          Height = 13
          Caption = 'Final Pgto.'
        end
        object Label143: TLabel
          Left = 368
          Top = 53
          Width = 79
          Height = 13
          Caption = 'Requerimento'
        end
        object Label144: TLabel
          Left = 469
          Top = 53
          Width = 63
          Height = 13
          Caption = 'Concessão'
        end
        object Label145: TLabel
          Left = 571
          Top = 53
          Width = 88
          Height = 13
          Caption = 'Início na Fund.'
        end
        object Label146: TLabel
          Left = 671
          Top = 53
          Width = 56
          Height = 13
          Caption = 'Val. Atual'
        end
        object Label147: TLabel
          Left = 14
          Top = 97
          Width = 83
          Height = 13
          Caption = 'Val. Calculado'
        end
        object Label148: TLabel
          Left = 115
          Top = 97
          Width = 52
          Height = 13
          Caption = 'Val. SRB'
        end
        object Label149: TLabel
          Left = 217
          Top = 97
          Width = 82
          Height = 13
          Caption = 'Preparado Até'
        end
        object Label150: TLabel
          Left = 318
          Top = 97
          Width = 88
          Height = 13
          Caption = 'Reajustado Até'
        end
        object Label152: TLabel
          Left = 419
          Top = 97
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object Label153: TLabel
          Left = 14
          Top = 187
          Width = 85
          Height = 13
          Caption = 'Início no INSS'
        end
        object Label154: TLabel
          Left = 668
          Top = 142
          Width = 89
          Height = 13
          Caption = 'Val. Calc. INSS'
        end
        object Label155: TLabel
          Left = 117
          Top = 187
          Width = 79
          Height = 13
          Caption = 'Val. Inf. INSS'
        end
        object Label157: TLabel
          Left = 221
          Top = 187
          Width = 108
          Height = 13
          Caption = 'Ini. Benef. Anterior'
        end
        object Label158: TLabel
          Left = 347
          Top = 187
          Width = 112
          Height = 13
          Caption = 'Val. Benef. Anterior'
        end
        object DBText4: TDBText
          Left = 232
          Top = 142
          Width = 199
          Height = 13
          DataField = 'NOMEVALORBASE2'
        end
        object DBText7: TDBText
          Left = 14
          Top = 142
          Width = 199
          Height = 13
          DataField = 'NOMEVALORBASE1'
        end
        object DBText8: TDBText
          Left = 452
          Top = 142
          Width = 199
          Height = 13
          DataField = 'NOMEVALORBASE3'
        end
        object DBEdNumProcCM: TwwDBEdit
          Left = 12
          Top = 23
          Width = 87
          Height = 21
          DataField = 'NUMEROPROCESSO'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit58: TwwDBEdit
          Left = 112
          Top = 23
          Width = 99
          Height = 21
          DataField = 'NUMPROCINSS'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit59: TwwDBEdit
          Left = 225
          Top = 23
          Width = 340
          Height = 21
          DataField = 'BENEFICIO'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit60: TwwDBEdit
          Left = 580
          Top = 23
          Width = 175
          Height = 21
          DataField = 'SITBENEFICIO'
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit61: TwwDBEdit
          Left = 12
          Top = 68
          Width = 140
          Height = 21
          DataField = 'TIPOPAGBENEF'
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit62: TwwDBEdit
          Left = 166
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAINICIOPAG'
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit63: TwwDBEdit
          Left = 266
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAFINAL'
          ReadOnly = True
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit64: TwwDBEdit
          Left = 366
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAREQUERIMENTO'
          ReadOnly = True
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit65: TwwDBEdit
          Left = 467
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATACONCESSAO'
          ReadOnly = True
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit66: TwwDBEdit
          Left = 569
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAINICIOFUND'
          ReadOnly = True
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit67: TwwDBEdit
          Left = 668
          Top = 68
          Width = 86
          Height = 21
          DataField = 'VALORATUAL'
          ReadOnly = True
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit68: TwwDBEdit
          Left = 12
          Top = 112
          Width = 86
          Height = 21
          DataField = 'VALORCALCULADO'
          ReadOnly = True
          TabOrder = 11
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit69: TwwDBEdit
          Left = 113
          Top = 112
          Width = 86
          Height = 21
          DataField = 'VALORSRB'
          ReadOnly = True
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit70: TwwDBEdit
          Left = 215
          Top = 112
          Width = 86
          Height = 21
          DataField = 'ULTMESPREPARO'
          ReadOnly = True
          TabOrder = 13
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit71: TwwDBEdit
          Left = 316
          Top = 112
          Width = 86
          Height = 21
          DataField = 'ULTMESREAJUSTE'
          ReadOnly = True
          TabOrder = 14
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit72: TwwDBEdit
          Left = 417
          Top = 112
          Width = 336
          Height = 21
          DataField = 'FORMAPGTO'
          ReadOnly = True
          TabOrder = 15
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit73: TwwDBEdit
          Left = 12
          Top = 157
          Width = 199
          Height = 21
          DataField = 'VALORBASE1'
          ReadOnly = True
          TabOrder = 16
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit74: TwwDBEdit
          Left = 230
          Top = 157
          Width = 199
          Height = 21
          DataField = 'VALORBASE2'
          ReadOnly = True
          TabOrder = 17
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit75: TwwDBEdit
          Left = 450
          Top = 157
          Width = 199
          Height = 21
          DataField = 'VALORBASE3'
          ReadOnly = True
          TabOrder = 18
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit76: TwwDBEdit
          Left = 666
          Top = 157
          Width = 86
          Height = 21
          DataField = 'VLRCALCINSS'
          ReadOnly = True
          TabOrder = 19
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit77: TwwDBEdit
          Left = 12
          Top = 202
          Width = 86
          Height = 21
          DataField = 'DATAINICIOINSS'
          ReadOnly = True
          TabOrder = 20
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit78: TwwDBEdit
          Left = 115
          Top = 202
          Width = 86
          Height = 21
          DataField = 'VLRINFINSS'
          ReadOnly = True
          TabOrder = 21
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBCheckBox1: TDBCheckBox
          Left = 470
          Top = 207
          Width = 122
          Height = 17
          Caption = 'Benef. Provisório'
          DataField = 'FLGPROVISORIO'
          ReadOnly = True
          TabOrder = 22
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object wwDBEdit79: TwwDBEdit
          Left = 219
          Top = 202
          Width = 108
          Height = 21
          DataField = 'DATAINICIOBENEFANT'
          ReadOnly = True
          TabOrder = 23
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBCheckBox2: TDBCheckBox
          Left = 614
          Top = 207
          Width = 145
          Height = 17
          Caption = 'Possui Acomp. INSS'
          DataField = 'FLGPOSSUIACOMPINSS'
          ReadOnly = True
          TabOrder = 24
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object wwDBEdit80: TwwDBEdit
          Left = 345
          Top = 202
          Width = 111
          Height = 21
          DataField = 'VALORBENEFANT'
          ReadOnly = True
          TabOrder = 25
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosHistorico'
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Benefícios'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgirdbenef: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'MESREFERENCIA'#9'8'#9'Mês~Referência'
          'MES'#9'9'#9'Mês~Pagamento'
          'NOME'#9'40'#9'Benefício'
          'VALORPREV'#9'11'#9'Valor Previsto'
          'VLBENEFPGTO'#9'10'#9'Valor Pago'
          'MOTIVO'#9'48'#9'Motivo'
          'NUMEROPROCESSO'#9'12'#9'Num Processo.'
          'BENEFICIARIO'#9'60'#9'Beneficiário'
          'DATAPAGAMENTO'#9'10'#9'Data Pagto~Prevista'
          'DTEFETPGTO'#9'13'#9'Data Efetivação'
          'VALORBASE1'#9'10'#9'Vlr Base 1'
          'VALORBASE2'#9'10'#9'Vlr Base 2'
          'VALORBASE3'#9'10'#9'Vlr Base 3'
          'VALORCALCULADO'#9'10'#9'Vlr Calculado'
          'VALOROP1'#9'10'#9'Valor Opção 1'
          'VALOROP2'#9'10'#9'Valor Opção 2'
          'VALOROP3'#9'10'#9'Valor Opção 3'
          'VALORINTEGRAL'#9'10'#9'Valor Integral'
          'VALORSRB'#9'10'#9'Valor SRB'
          'VALORTOTAL'#9'10'#9'Valor Total'
          'PATROCINADORA'#9'60'#9'Patrocinadora'
          'PLANO'#9'50'#9'Plano'
          'IDHSTFOLHABENEF'#9'10'#9'Versão da Folha'
          'FLGMANUAL'#9'10'#9'Entrada Manual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosPagamentosContraCheque'
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contra-Cheques'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosPagamentosRubricasIndividuais'
      object Panel16: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Rubricas Individuais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Panel17: TPanel
        Left = 0
        Top = 121
        Width = 788
        Height = 184
        Align = alClient
        TabOrder = 1
        object Label26: TLabel
          Left = 8
          Top = 37
          Width = 53
          Height = 13
          Caption = 'Valor / %'
        end
        object Label22: TLabel
          Left = 8
          Top = 71
          Width = 64
          Height = 13
          Caption = 'Favorecido'
        end
        object Label25: TLabel
          Left = 102
          Top = 38
          Width = 35
          Height = 13
          Caption = 'Regra'
        end
        object Label23: TLabel
          Left = 453
          Top = 3
          Width = 65
          Height = 13
          Caption = 'Data Início'
        end
        object Label24: TLabel
          Left = 497
          Top = 72
          Width = 63
          Height = 13
          Caption = 'Alimentado'
        end
        object Label27: TLabel
          Left = 541
          Top = 37
          Width = 50
          Height = 13
          Caption = 'Id Regra'
        end
        object Label28: TLabel
          Left = 536
          Top = 3
          Width = 51
          Height = 13
          Caption = 'Data Fim'
        end
        object Label29: TLabel
          Left = 620
          Top = 3
          Width = 68
          Height = 13
          Caption = 'Permanente'
        end
        object Label30: TLabel
          Left = 697
          Top = 3
          Width = 69
          Height = 13
          Caption = 'Ocorrências'
        end
        object Label31: TLabel
          Left = 721
          Top = 18
          Width = 7
          Height = 13
          Caption = '/'
        end
        object Label32: TLabel
          Left = 8
          Top = 3
          Width = 68
          Height = 13
          Caption = 'Beneficiário'
        end
        object Label33: TLabel
          Left = 10
          Top = 107
          Width = 65
          Height = 13
          Caption = 'Logradouro'
        end
        object Label34: TLabel
          Left = 308
          Top = 107
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label35: TLabel
          Left = 627
          Top = 107
          Width = 40
          Height = 13
          Caption = 'Cidade'
        end
        object Label36: TLabel
          Left = 451
          Top = 107
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object Label37: TLabel
          Left = 364
          Top = 107
          Width = 25
          Height = 13
          Caption = 'CEP'
        end
        object Label38: TLabel
          Left = 10
          Top = 143
          Width = 40
          Height = 13
          Caption = 'Estado'
        end
        object Label39: TLabel
          Left = 402
          Top = 143
          Width = 37
          Height = 13
          Caption = 'Banco'
        end
        object Label40: TLabel
          Left = 218
          Top = 143
          Width = 98
          Height = 13
          Caption = 'Número Telefone'
        end
        object Label41: TLabel
          Left = 321
          Top = 143
          Width = 26
          Height = 13
          Caption = 'Tipo'
        end
        object Label42: TLabel
          Left = 178
          Top = 143
          Width = 28
          Height = 13
          Caption = 'DDD'
        end
        object Label43: TLabel
          Left = 501
          Top = 143
          Width = 101
          Height = 13
          Caption = 'Nome da Agência'
        end
        object Label44: TLabel
          Left = 673
          Top = 143
          Width = 34
          Height = 13
          Caption = 'Conta'
        end
        object Label45: TLabel
          Left = 444
          Top = 143
          Width = 45
          Height = 13
          Caption = 'Num Ag'
        end
        object Label46: TLabel
          Left = 374
          Top = 72
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object DBEdit7: TDBEdit
          Left = 8
          Top = 50
          Width = 86
          Height = 21
          Color = clInfoBk
          DataField = 'VALORRUBRICA'
          Enabled = False
          TabOrder = 0
        end
        object DBEdit13: TDBEdit
          Left = 8
          Top = 85
          Width = 362
          Height = 21
          Color = clAppWorkSpace
          DataField = 'NOMEFAV'
          Enabled = False
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 102
          Top = 50
          Width = 433
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEREGRA'
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 453
          Top = 16
          Width = 78
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          Enabled = False
          TabOrder = 3
        end
        object DBEdit12: TDBEdit
          Left = 495
          Top = 85
          Width = 274
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEALIM'
          Enabled = False
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 541
          Top = 50
          Width = 52
          Height = 21
          Color = clInfoBk
          DataField = 'IDREGRACALCULO'
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit14: TDBEdit
          Left = 536
          Top = 16
          Width = 78
          Height = 21
          Color = clInfoBk
          DataField = 'DATAFINAL'
          Enabled = False
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 619
          Top = 16
          Width = 75
          Height = 21
          Color = clInfoBk
          DataField = 'TIPOPERMANENTE'
          Enabled = False
          TabOrder = 7
        end
        object DBEdit16: TDBEdit
          Left = 699
          Top = 16
          Width = 33
          Height = 21
          Color = clInfoBk
          DataField = 'NUMOCORRENCIAS'
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit17: TDBEdit
          Left = 737
          Top = 16
          Width = 33
          Height = 21
          Color = clInfoBk
          DataField = 'PARCELAS'
          Enabled = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit15: TDBEdit
          Left = 8
          Top = 16
          Width = 440
          Height = 21
          Color = clAppWorkSpace
          DataField = 'NOMEBENEF'
          Enabled = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit18: TDBEdit
          Left = 9
          Top = 120
          Width = 294
          Height = 21
          Color = clInfoBk
          DataField = 'LOGRADOURO'
          Enabled = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit19: TDBEdit
          Left = 307
          Top = 120
          Width = 53
          Height = 21
          Color = clInfoBk
          DataField = 'NUMERO'
          Enabled = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit20: TDBEdit
          Left = 450
          Top = 120
          Width = 173
          Height = 21
          Color = clInfoBk
          DataField = 'BAIRRO'
          Enabled = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit21: TDBEdit
          Left = 627
          Top = 120
          Width = 142
          Height = 21
          Color = clInfoBk
          DataField = 'NOME'
          Enabled = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit22: TDBEdit
          Left = 10
          Top = 156
          Width = 156
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEESTADO'
          Enabled = False
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit23: TDBEdit
          Left = 364
          Top = 120
          Width = 82
          Height = 21
          Color = clInfoBk
          DataField = 'CEP'
          Enabled = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBEdit24: TDBEdit
          Left = 174
          Top = 156
          Width = 36
          Height = 21
          Color = clInfoBk
          DataField = 'DDD'
          Enabled = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit25: TDBEdit
          Left = 402
          Top = 156
          Width = 36
          Height = 21
          Color = clInfoBk
          DataField = 'NUMBANCO'
          Enabled = False
          ReadOnly = True
          TabOrder = 18
        end
        object DBEdit26: TDBEdit
          Left = 217
          Top = 156
          Width = 96
          Height = 21
          Color = clInfoBk
          DataField = 'NUMEROTEL'
          Enabled = False
          ReadOnly = True
          TabOrder = 19
        end
        object DBEdit27: TDBEdit
          Left = 321
          Top = 156
          Width = 48
          Height = 21
          Color = clInfoBk
          DataField = 'TIPO'
          Enabled = False
          ReadOnly = True
          TabOrder = 20
        end
        object DBEdit28: TDBEdit
          Left = 501
          Top = 156
          Width = 164
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEAGENCIA'
          Enabled = False
          ReadOnly = True
          TabOrder = 21
        end
        object DBEdit30: TDBEdit
          Left = 443
          Top = 156
          Width = 53
          Height = 21
          Color = clInfoBk
          DataField = 'NUMAGENCIA'
          Enabled = False
          ReadOnly = True
          TabOrder = 22
        end
        object DBEdit31: TDBEdit
          Left = 373
          Top = 85
          Width = 118
          Height = 21
          Color = clInfoBk
          DataField = 'DOCFAV'
          Enabled = False
          ReadOnly = True
          TabOrder = 23
        end
        object DBEdit4: TDBEdit
          Left = 669
          Top = 156
          Width = 100
          Height = 21
          Color = clInfoBk
          DataField = 'CONTACORRENTE'
          Enabled = False
          ReadOnly = True
          TabOrder = 24
        end
      end
      object dbgRubIndiv: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 102
        Selected.Strings = (
          'IDRUBRICA'#9'10'#9'Rubrica'#9'F'
          'PROVDESC'#9'1'#9'+/-'#9'F'
          'DESCRICAO'#9'92'#9'Descrição'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosPagamentosInformeDeRendimentos'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosProcessosJudiciais'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiariosAssistenciais'
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Beneficiários Assistenciais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridpart: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'DEPEN'#9'48'#9'Nome do Beneficiário'
          'PLANASS'#9'35'#9'Plano Assistencial'
          'PLANPREV'#9'25'#9'Plano previdenciário')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgRecebedores'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEnquadramento'
      object Panel41: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Enquadramento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Panel42: TPanel
        Left = 2
        Top = 21
        Width = 423
        Height = 89
        TabOrder = 1
        object Label165: TLabel
          Left = 5
          Top = 4
          Width = 34
          Height = 13
          Caption = 'Cargo'
        end
        object Label166: TLabel
          Left = 5
          Top = 44
          Width = 38
          Height = 13
          Caption = '% ATS'
        end
        object Label167: TLabel
          Left = 81
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object Label168: TLabel
          Left = 81
          Top = 44
          Width = 89
          Height = 13
          Caption = 'Enquadramento'
        end
        object wwDBEdit87: TwwDBEdit
          Left = 5
          Top = 18
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'VALORITEM'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit88: TwwDBEdit
          Left = 5
          Top = 60
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'VALORITEM'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit89: TwwDBEdit
          Left = 81
          Top = 18
          Width = 336
          Height = 21
          Color = clInfoBk
          DataField = 'DESCITEM'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object Edit1: TEdit
          Left = 81
          Top = 60
          Width = 136
          Height = 21
          Color = clInfoBk
          TabOrder = 3
        end
      end
      object wwDBGrid3: TwwDBGrid
        Left = 2
        Top = 112
        Width = 423
        Height = 88
        Selected.Strings = (
          'CODIGO'#9'7'#9'Função'
          'NOME'#9'34'#9'Nome'
          'PERCPBC'#9'6'#9'% PBC'
          'MODO'#9'6'#9'Modo~Função')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid6: TwwDBGrid
        Left = 427
        Top = 21
        Width = 350
        Height = 301
        Selected.Strings = (
          'DESCITEM'#9'27'#9'Componentes'
          'VALORITEM'#9'9'#9'Valor'
          'PERCITEM'#9'7'#9'%')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = wwDBGrid6CalcCellColors
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEmprestimos'
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Empréstimos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid4: TwwDBGrid
        Left = 0
        Top = 18
        Width = 788
        Height = 117
        Selected.Strings = (
          'TCEDESCRICAO'#9'29'#9'Tipo'
          'DESCSITUACAO'#9'7'#9'Situação'
          'VLRCONTRATO'#9'11'#9'Valor Contrato'
          'VLRPARCELA'#9'11'#9'Valor Parcelas'
          'NUMPARCELAS'#9'10'#9'No Parcelas'
          'PARCELASRESTANTES'#9'8'#9'Restantes'
          'HMESALDODEV'#9'12'#9'Saldo Devedor'
          'DATAASSINATURA'#9'18'#9'Assinatura'
          'DATACANC'#9'18'#9'Cancelamento'
          'TXJUROS'#9'10'#9'Tx Juros'
          'DATACREDITO'#9'18'#9'Crédito'
          'DATAPRIMPARC'#9'18'#9'1a Parcela'
          'HMEDATAATUALIZA'#9'18'#9'Atualização'
          'DESCREC'#9'50'#9'Contas/Caixas Recbto'
          'DESCPAG'#9'50'#9'Contas/Caixas Pagto'
          'DESCFORMA'#9'30'#9'Forma Pagto')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid5: TwwDBGrid
        Left = 0
        Top = 153
        Width = 788
        Height = 152
        Selected.Strings = (
          'ITEDESCRICAO'#9'27'#9'Ítem'
          'HMEPARCELA'#9'6'#9'Parcela'
          'HMEDATA'#9'10'#9'Data~Movimento'
          'HMEVLRPREVISTO'#9'11'#9'Valor~Previsto'
          'HMEVLREFETIVO'#9'10'#9'Valor~Efetivo'
          'DESCBAIXADO'#9'9'#9'Situação'
          'HMEDATAPREVISTA'#9'10'#9'Prevista'
          'HMEDATAEFETIVA'#9'10'#9'Efetiva'
          'HMEANOCOMPETENCIA'#9'10'#9'Ano~Competência'
          'HMEMESCOMPETENCIA'#9'10'#9'Mês~Competência'
          'HMEANOCOBRANCA'#9'7'#9'Ano~Cobrança'
          'HMEMESCOBRANCA'#9'8'#9'Mês~Cobrança'
          'HMETIPOMOV'#9'34'#9'Tipo Movimento'
          'HMESALDODEV'#9'10'#9'Saldo ')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel11: TPanel
        Left = 0
        Top = 135
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiariosPrevidenciarios'
      object Label55: TLabel
        Left = 12
        Top = 119
        Width = 65
        Height = 13
        Caption = 'Documento'
      end
      object Label56: TLabel
        Left = 130
        Top = 119
        Width = 65
        Height = 13
        Caption = 'Logradouro'
      end
      object Label57: TLabel
        Left = 526
        Top = 119
        Width = 44
        Height = 13
        Caption = 'Número'
      end
      object Label64: TLabel
        Left = 583
        Top = 117
        Width = 76
        Height = 13
        Caption = 'Complemento'
      end
      object Label61: TLabel
        Left = 536
        Top = 156
        Width = 40
        Height = 13
        Caption = 'Estado'
      end
      object Label62: TLabel
        Left = 326
        Top = 156
        Width = 40
        Height = 13
        Caption = 'Cidade'
      end
      object Label65: TLabel
        Left = 214
        Top = 156
        Width = 25
        Height = 13
        Caption = 'CEP'
      end
      object Label66: TLabel
        Left = 447
        Top = 194
        Width = 63
        Height = 13
        Caption = 'Recebedor'
      end
      object Label70: TLabel
        Left = 286
        Top = 194
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object Label71: TLabel
        Left = 117
        Top = 194
        Width = 98
        Height = 13
        Caption = 'Número Telefone'
      end
      object Label72: TLabel
        Left = 12
        Top = 194
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label134: TLabel
        Left = 14
        Top = 156
        Width = 34
        Height = 13
        Caption = 'Bairro'
      end
      object dbgridpartprev: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 91
        Selected.Strings = (
          'MATRICULA'#9'10'#9'Matrícula'
          'NOMEBENEF'#9'41'#9'Beneficiário'
          'PLANPREV'#9'36'#9'Plano'
          'BENEFICIO'#9'60'#9'Benefício'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = dbgridpartprevDblClick
        IndicatorColor = icBlack
      end
      object DBEdit36: TDBEdit
        Left = 12
        Top = 133
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'DOCBEN'
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit41: TDBEdit
        Left = 130
        Top = 133
        Width = 391
        Height = 21
        Color = clInfoBk
        DataField = 'LOGRADOURO'
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit42: TDBEdit
        Left = 526
        Top = 133
        Width = 52
        Height = 21
        Color = clInfoBk
        DataField = 'NUMERO'
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit45: TDBEdit
        Left = 583
        Top = 133
        Width = 193
        Height = 21
        Color = clInfoBk
        DataField = 'COMPLEMENTO'
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit32: TDBEdit
        Left = 537
        Top = 169
        Width = 239
        Height = 21
        Color = clInfoBk
        DataField = 'NOMEESTADO'
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit29: TDBEdit
        Left = 324
        Top = 169
        Width = 207
        Height = 21
        Color = clInfoBk
        DataField = 'NOME'
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit5: TDBEdit
        Left = 214
        Top = 169
        Width = 104
        Height = 21
        Color = clInfoBk
        DataField = 'CEP'
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit6: TDBEdit
        Left = 12
        Top = 169
        Width = 196
        Height = 21
        Color = clInfoBk
        DataField = 'BAIRRO'
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit33: TDBEdit
        Left = 12
        Top = 207
        Width = 36
        Height = 21
        Color = clInfoBk
        DataField = 'DDD'
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit34: TDBEdit
        Left = 117
        Top = 207
        Width = 101
        Height = 21
        Color = clInfoBk
        DataField = 'NUMEROTEL'
        Enabled = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit35: TDBEdit
        Left = 287
        Top = 207
        Width = 64
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO'
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit43: TDBEdit
        Left = 447
        Top = 207
        Width = 330
        Height = 21
        Color = clInfoBk
        DataField = 'NOMERESP'
        Enabled = False
        ReadOnly = True
        TabOrder = 12
      end
      object wwDBGrid8: TwwDBGrid
        Left = 12
        Top = 233
        Width = 767
        Height = 65
        Selected.Strings = (
          'NUMBANCO'#9'4'#9'Banco'#9'F'
          'NOMEBANCO'#9'30'#9'Nome do Banco'#9'F'
          'NUMAGENCIA'#9'10'#9'Num. Agência'#9'F'
          'NOMEAGENCIA'#9'30'#9'Nome da Agência'#9'F'
          'CONTACORRENTE'#9'15'#9'Conta'#9'F'
          'CONTAPREF'#9'3'#9'Conta Pref.'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clInfoBk
        TabOrder = 13
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Beneficiários Previdenciários'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 14
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesHistoricoAssistencial'
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Contribuições do Assistencial'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgirdcontrib: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 286
        Selected.Strings = (
          'MES'#9'7'#9'Mês de Referência'
          'PLANPREV'#9'25'#9'Plano Previdenciário'
          'PLANASS'#9'25'#9'Plano Assistencial'
          'CONTRIB'#9'25'#9'Contribuição'
          'VALORESPERADO'#9'10'#9'Valor Esperado'
          'VALORRECEBIDO'#9'10'#9'Valor Recebido'
          'DATA'#9'10'#9'Data do Recebimento'
          'MESCOBRANCA'#9'7'#9'Mês de Cobrança'
          'NOME'#9'25'#9'Titular'
          'DESCRICAO'#9'25'#9'Motivo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgBeneficiosHistoricoMovimentacoes'
      object Panel37: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Movimentações'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridbeneficios: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 120
        Selected.Strings = (
          'NOME'#9'43'#9'Benefício'
          'DESCRICAO'#9'10'#9'Situação'
          'VALORATUAL'#9'15'#9'Valor Atual'
          'DATAINICIO'#9'11'#9'Início'
          'DATAFINAL'#9'10'#9'Final'
          'VALORSRB'#9'12'#9'SRB'
          'DATAFINALPREVISTA'#9'11'#9'Final Prevista'
          'VALORTOTAL'#9'10'#9'Valor total'
          'ULTMESPREPARO'#9'11'#9'Preparado até'
          'ULTMESREAJUSTE'#9'12'#9'Reajustado até'
          'NUMEROPROCESSO'#9'10'#9'Processo CM'
          'NUMPROCINSS'#9'15'#9'Processo INSS'
          'DATAINICIOINSS'#9'18'#9'Início INSS'
          'NOMEVALORBASE1'#9'20'#9'Opção1'
          'VALORBASE1'#9'10'#9'ValorOp1'
          'NOMEVALORBASE2'#9'20'#9'Opção2'
          'VALORBASE2'#9'10'#9'ValorOp2'
          'NOMEVALORBASE3'#9'20'#9'Opção3'
          'VALORBASE3'#9'10'#9'ValorOp3'
          'BENEFMIN'#9'9'#9'Benef. Mín.'
          'PERCENTUAL'#9'10'#9'Percentual'
          'MOTIVO'#9'43'#9'Motivo de Retenção'
          'DATAEMISSAORECAD'#9'18'#9'Data de Emissão ~do Recadastramento'
          'DATALIMITERECAD'#9'18'#9'Data Limite ~de Recadastramento'
          'DATARECEBRECAD'#9'18'#9'Data de Recebimento~do Recadastramento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
        OnFieldChanged = dbgridbeneficiosFieldChanged
      end
      object Panel38: TPanel
        Left = 0
        Top = 139
        Width = 401
        Height = 166
        Align = alLeft
        TabOrder = 2
        object Label47: TLabel
          Left = 15
          Top = 5
          Width = 68
          Height = 13
          Caption = 'Beneficiário'
        end
        object Label48: TLabel
          Left = 15
          Top = 44
          Width = 98
          Height = 13
          Caption = 'Data Nascimento'
        end
        object Label49: TLabel
          Left = 124
          Top = 44
          Width = 142
          Height = 13
          Caption = 'Situação do Dependente'
        end
        object Label50: TLabel
          Left = 15
          Top = 82
          Width = 65
          Height = 13
          Caption = 'Parentesco'
        end
        object Label52: TLabel
          Left = 298
          Top = 82
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object Label53: TLabel
          Left = 15
          Top = 121
          Width = 63
          Height = 13
          Caption = 'Recebedor'
        end
        object wwDBEdit11: TwwDBEdit
          Left = 13
          Top = 20
          Width = 352
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEBEN'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit15: TwwDBEdit
          Left = 13
          Top = 59
          Width = 97
          Height = 21
          Color = clInfoBk
          DataField = 'DATANASC'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit21: TwwDBEdit
          Left = 122
          Top = 59
          Width = 243
          Height = 21
          Color = clInfoBk
          DataField = 'DESCDEPEN'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit22: TwwDBEdit
          Left = 13
          Top = 97
          Width = 270
          Height = 21
          Color = clInfoBk
          DataField = 'DEPENDENCIA'
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit23: TwwDBEdit
          Left = 296
          Top = 97
          Width = 69
          Height = 21
          Color = clInfoBk
          DataField = 'PERCENTUAL'
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit24: TwwDBEdit
          Left = 13
          Top = 136
          Width = 352
          Height = 21
          Color = clInfoBk
          DataField = 'NOMERESP'
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object dbgrMovBenef: TwwDBGrid
        Left = 401
        Top = 139
        Width = 387
        Height = 166
        Selected.Strings = (
          'NOME'#9'30'#9'Beneficiário'#9'F'
          'DESCMOV'#9'17'#9'Movimento'
          'DATAFINAL'#9'10'#9'Final'
          'DATAFINALANT'#9'12'#9'Final~Anterior'
          'DATAMOV'#9'12'#9'Data~Movimentação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 3
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgPlanos'
      object pnlPrevidenciario: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Previdenciário'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridPrev: TwwDBGrid
        Left = 0
        Top = 19
        Width = 788
        Height = 141
        Selected.Strings = (
          'NOME'#9'30'#9'Plano Previdenciário'#9'F'
          'SITPART'#9'20'#9'Situação~ na Fundação'#9'F'
          'DESCRICAO'#9'20'#9'Situação~ no Plano Previdenciário'#9'F'
          'FLGFITESPECIAL'#9'10'#9'Situação~Especial'#9'F'
          'INSCRICAONUMERO'#9'10'#9'Inscrição Nº'#9'F'
          'DTINICIOINSC'#9'10'#9'Primeira ~Inscrição em'#9'F'
          'INSCRICAODATA'#9'10'#9'Inscrição~ Atual em'#9'F'
          'DATACANCELAMENTO'#9'12'#9'Cancelado em '#9'F'
          'DATAINICIOMANUT'#9'18'#9'Início~ Manutenção'#9'F'
          'SALPARTICIPACAO'#9'13'#9'Salário~ de Participação'#9'F'
          'SALMANTIDO'#9'12'#9'Salário~de Manutenção'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object pnlAssistencial: TPanel
        Left = 0
        Top = 160
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Assistencial'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
      object dbgridplanass: TwwDBGrid
        Left = 0
        Top = 179
        Width = 788
        Height = 126
        Selected.Strings = (
          'NOME_1'#9'30'#9'Plano Previdenciário'
          'NOME'#9'30'#9'Plano Assistencial'
          'DESCRICAO'#9'15'#9'Situação no Plano Assistencial'
          'DATACANCELAMENTO'#9'10'#9'Data da Situação Atual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 3
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEnquadramento'
      object Panel39: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Enquadramento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Panel40: TPanel
        Left = 2
        Top = 21
        Width = 423
        Height = 89
        TabOrder = 1
        object Label161: TLabel
          Left = 5
          Top = 4
          Width = 34
          Height = 13
          Caption = 'Cargo'
        end
        object Label162: TLabel
          Left = 5
          Top = 44
          Width = 38
          Height = 13
          Caption = '% ATS'
        end
        object Label163: TLabel
          Left = 81
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object Label164: TLabel
          Left = 81
          Top = 44
          Width = 89
          Height = 13
          Caption = 'Enquadramento'
        end
        object wwDBEdit84: TwwDBEdit
          Left = 5
          Top = 18
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'VALORITEM'
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit85: TwwDBEdit
          Left = 5
          Top = 60
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'VALORITEM'
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit86: TwwDBEdit
          Left = 81
          Top = 18
          Width = 336
          Height = 21
          Color = clInfoBk
          DataField = 'DESCITEM'
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edValEnq: TEdit
          Left = 81
          Top = 60
          Width = 136
          Height = 21
          Color = clInfoBk
          TabOrder = 3
        end
      end
      object wwDBGrid13: TwwDBGrid
        Left = 2
        Top = 112
        Width = 423
        Height = 88
        Selected.Strings = (
          'CODIGO'#9'7'#9'Função'
          'NOME'#9'34'#9'Nome'
          'PERCPBC'#9'6'#9'% PBC'
          'MODO'#9'6'#9'Modo~Função')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgrdCompoDIB: TwwDBGrid
        Left = 427
        Top = 21
        Width = 350
        Height = 301
        Selected.Strings = (
          'DESCITEM'#9'27'#9'Componentes'
          'VALORITEM'#9'9'#9'Valor'
          'PERCITEM'#9'7'#9'%')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 0
    Width = 788
    Height = 183
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object Label107: TLabel
      Left = 709
      Top = 1
      Width = 29
      Height = 13
      Cursor = crNo
      Caption = 'Sexo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label108: TLabel
      Left = 607
      Top = 36
      Width = 69
      Height = 13
      Cursor = crNo
      Caption = 'Falecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label109: TLabel
      Left = 519
      Top = 36
      Width = 67
      Height = 13
      Cursor = crNo
      Caption = 'Nascimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label110: TLabel
      Left = 383
      Top = 1
      Width = 24
      Height = 13
      Cursor = crNo
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label111: TLabel
      Left = 604
      Top = 1
      Width = 53
      Height = 13
      Caption = 'Inscrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label112: TLabel
      Left = 376
      Top = 105
      Width = 129
      Height = 13
      Caption = 'Situação na Fundação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label113: TLabel
      Left = 694
      Top = 36
      Width = 74
      Height = 13
      Cursor = crNo
      Caption = 'Dt. Inscrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label115: TLabel
      Left = 8
      Top = 72
      Width = 80
      Height = 13
      Cursor = crNo
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label116: TLabel
      Left = 497
      Top = 1
      Width = 55
      Height = 13
      Caption = 'Matrícula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label117: TLabel
      Left = 376
      Top = 72
      Width = 152
      Height = 13
      Caption = 'Situação na Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label118: TLabel
      Left = 8
      Top = 1
      Width = 33
      Height = 13
      Cursor = crNo
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label119: TLabel
      Left = 8
      Top = 36
      Width = 76
      Height = 13
      Cursor = crNo
      Caption = 'Classificação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 106
      Width = 39
      Height = 13
      Cursor = crNo
      Caption = 'Planos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label169: TLabel
      Left = 8
      Top = 141
      Width = 105
      Height = 13
      Caption = 'Situação no Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBEdit28: TwwDBEdit
      Left = 607
      Top = 49
      Width = 86
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'DATAMORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit29: TwwDBEdit
      Left = 519
      Top = 49
      Width = 86
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'DATANASC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit30: TwwDBEdit
      Left = 710
      Top = 14
      Width = 71
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'SEXO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit31: TwwDBEdit
      Left = 384
      Top = 14
      Width = 110
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'NUMDOCUMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedSitPlano: TwwDBEdit
      Left = 376
      Top = 118
      Width = 405
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit33: TwwDBEdit
      Left = 604
      Top = 14
      Width = 103
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'INSCRICAONUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit34: TwwDBEdit
      Left = 695
      Top = 49
      Width = 86
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'INSCRICAODATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit36: TwwDBEdit
      Left = 497
      Top = 14
      Width = 104
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'MATRICULA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit37: TwwDBEdit
      Left = 376
      Top = 85
      Width = 405
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'SITUACAONAPATRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit38: TwwDBEdit
      Left = 8
      Top = 14
      Width = 373
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edClassific: TEdit
      Left = 8
      Top = 49
      Width = 508
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object wwDBEdit39: TwwDBEdit
      Left = 8
      Top = 85
      Width = 360
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'PATRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DblkPlanos: TwwDBLookupCombo
      Left = 8
      Top = 118
      Width = 360
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Plano'#9'F'
        'STATUS'#9'15'#9'Status'#9'F')
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = DblkPlanosChange
    end
    object wwDBEdit90: TwwDBEdit
      Left = 8
      Top = 154
      Width = 772
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'SITPLANOPREV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Dock972: TDock97
    Left = 0
    Top = 488
    Width = 788
    Height = 39
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BoundLines = [blTop, blBottom]
    FixAlign = True
    LimitToOneRow = True
    Position = dpBottom
    object lblBloqueio: TLabel
      Left = 7
      Top = 4
      Width = 109
      Height = 24
      Caption = 'Bloqueado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object tb97Fundo2: TToolbar97
      Left = 505
      Top = 0
      Caption = 'tb97Fundo2'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 505
      TabOrder = 0
      object bbtnSair2: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnSair2Click
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
          8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
          FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
          8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
          6087777770F8F0E6608777777066666668777777007770E660877777007770E6
          608777777066666668777777007770E660877777007770E66087777770666666
          68777788060770E760877788060770E76087777770666666687770000E6070E0
          608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
          608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
          687770000E6070E6608770000E6070E6608777777066666668777777060770E6
          60877777060770E66087777770666666687777770077770E608777770077770E
          60877777706666666877777770777770E087777770777770E087777770666666
          687777777000000000777777700000000077777770EEEEEEE877}
        NumGlyphs = 3
        Spacing = 2
      end
      object bbtnAjuda2: TmaHelpBitBtn
        Left = 160
        Top = 0
        Width = 80
        Height = 33
        Caption = 'A&juda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Kind = bkHelp
        Spacing = 2
        ClickHelpContext = 0
      end
      object bbtnProcurar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        Spacing = 2
      end
    end
    object sbtnTitular: TBitBtn
      Left = 425
      Top = 2
      Width = 80
      Height = 33
      Caption = '&Titular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = sbtnTitularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 720
    Top = 40
  end
  object MenuPrin: TMainMenu
    AutoHotkeys = maManual
    Left = 648
    Top = 40
    object AgendaPessoal: TMenuItem
      Caption = '&Agenda Pessoal'
      object DadosPessoais: TMenuItem
        Caption = 'Dados &Pessoais'
        OnClick = DadosPessoaisClick
      end
      object Documentos: TMenuItem
        Caption = 'Do&cumentos'
        OnClick = DocumentosClick
      end
      object Enderecos: TMenuItem
        Caption = '&Endereços'
        OnClick = EnderecosClick
      end
      object Telefones: TMenuItem
        Caption = '&Telefones'
        OnClick = TelefonesClick
      end
      object Contatos: TMenuItem
        Caption = '&Contatos'
        OnClick = ContatosClick
      end
      object ContasBancrias: TMenuItem
        Caption = '&Contas Bancárias'
        OnClick = ContasBancriasClick
      end
      object Dependentes: TMenuItem
        Caption = '&Dependentes'
        OnClick = DependentesClick
      end
    end
    object VidaFuncional: TMenuItem
      Caption = 'Vida &Funcional'
      object DadosBasicos: TMenuItem
        Caption = '&Dados Básicos'
        OnClick = DadosBasicosClick
      end
      object EvolucaoFuncional: TMenuItem
        Caption = '&Evolução Funcional'
        OnClick = EvolucaoFuncionalClick
      end
      object HistoricoFuncional: TMenuItem
        Caption = '&Histórico Funcional'
        OnClick = HistoricoFuncionalClick
      end
      object RubricasSalariais: TMenuItem
        Caption = '&Rubricas Salariais'
        OnClick = RubricasSalariaisClick
      end
    end
    object HistricodeContribuies1: TMenuItem
      Caption = 'Vida No &Plano'
      object Eventos: TMenuItem
        Caption = '&Eventos'
        object Previdenciario: TMenuItem
          Caption = '&Previdenciário'
          OnClick = PrevidenciarioClick
        end
        object Assistencial: TMenuItem
          Caption = '&Assistencial'
          OnClick = AssistencialClick
        end
      end
      object Protocolos: TMenuItem
        Caption = '&Protocolos'
        OnClick = ProtocolosClick
      end
      object ProcessosRad: TMenuItem
        Caption = 'Pro&cessos RAD'
        OnClick = ProcessosRadClick
      end
      object RUB: TMenuItem
        Caption = '&RUB'
        OnClick = RUBClick
      end
      object Contribuicoes: TMenuItem
        Caption = '&Contribuiçoes'
        object SituaoAtual1: TMenuItem
          Caption = '&Situação Atual'
          OnClick = SituaoAtual1Click
        end
        object Histrico1: TMenuItem
          Caption = 'Histórico'
          OnClick = Histrico1Click
          object Previdencirias1: TMenuItem
            Caption = '&Previdenciárias'
            OnClick = Previdencirias1Click
          end
          object Assistenciais2: TMenuItem
            Caption = '&Assistenciais'
            OnClick = Assistenciais2Click
          end
        end
        object Reserva1: TMenuItem
          Caption = '&Reserva'
          object Saldo1: TMenuItem
            Caption = '&Saldo'
            OnClick = Saldo1Click
          end
          object HistricodeAlimentao1: TMenuItem
            Caption = '&Histórico de Alimentação'
            OnClick = HistricodeAlimentao1Click
          end
        end
      end
      object Beneficios: TMenuItem
        Caption = '&Benefícios'
        object Processos: TMenuItem
          Caption = '&Processos'
          OnClick = ProcessosClick
        end
        object SituaoAtual: TMenuItem
          Caption = '&Situação Atual'
          OnClick = SituaoAtualClick
        end
        object Historico: TMenuItem
          Caption = '&Histórico'
          OnClick = HistoricoClick
        end
        object HistricodeMovimentaes1: TMenuItem
          Caption = 'Histórico de Movimentações'
          OnClick = HistricodeMovimentaes1Click
        end
        object Pagamentos: TMenuItem
          Caption = '&Pagamentos'
          object ContraCheque: TMenuItem
            Caption = '&Contra-Cheque'
            OnClick = ContraChequeClick
          end
          object RubricasIndividuais: TMenuItem
            Caption = '&Rubricas Individuais'
            OnClick = RubricasIndividuaisClick
          end
          object InformedeRendimentos: TMenuItem
            Caption = '&Informe de Rendimentos'
            Enabled = False
          end
        end
        object ProcessosJudiciais: TMenuItem
          Caption = 'Processos &Judiciais'
          Enabled = False
        end
      end
      object Beneficiarios: TMenuItem
        Caption = 'Bene&ficiários'
        object Previdencirios1: TMenuItem
          Caption = 'P&revidenciários'
          OnClick = Previdencirios1Click
        end
        object Assistenciais1: TMenuItem
          Caption = 'A&ssistenciais'
          OnClick = Assistenciais1Click
        end
      end
      object Enquadramento: TMenuItem
        Caption = 'En&quadramento'
        OnClick = EnquadramentoClick
      end
      object Emprestimo: TMenuItem
        Caption = 'E&mpréstimo'
        OnClick = EmprestimoClick
      end
      object Planos1: TMenuItem
        Caption = 'P&lanos'
        OnClick = Planos1Click
      end
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 578
    Top = 42
  end
end
