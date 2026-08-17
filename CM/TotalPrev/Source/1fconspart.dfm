object FRMconspart: TFRMconspart
  Left = 5
  Top = 27
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Geral de Pessoas'
  ClientHeight = 522
  ClientWidth = 790
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
  object Label182: TLabel
    Left = 106
    Top = 405
    Width = 27
    Height = 13
    Caption = 'Prazo'
  end
  object NBKelegpart: TNotebook
    Left = 0
    Top = 183
    Width = 790
    Height = 300
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    PageIndex = 40
    ParentFont = False
    TabOrder = 2
    OnPageChanged = NBKelegpartPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosPessoais'
      object lblNomePai: TLabel
        Left = 10
        Top = 171
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
        Left = 311
        Top = 171
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
        Left = 10
        Top = 21
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
        Left = 10
        Top = 209
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
        Left = 402
        Top = 210
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
        Left = 10
        Top = 135
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
        Left = 175
        Top = 58
        Width = 61
        Height = 13
        Cursor = crNo
        Caption = 'Dep. IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 256
        Top = 58
        Width = 69
        Height = 13
        Cursor = crNo
        Caption = 'Dep. Sal. F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 350
        Top = 58
        Width = 61
        Height = 13
        Cursor = crNo
        Caption = 'Dep. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 97
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
        Left = 171
        Top = 21
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
        Left = 274
        Top = 21
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
        Left = 357
        Top = 21
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
        Left = 472
        Top = 21
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
        Left = 136
        Top = 97
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
        Left = 359
        Top = 97
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
        Left = 604
        Top = 20
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
        Left = 529
        Top = 57
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
        Left = 438
        Top = 57
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Eleg. a Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label103: TLabel
        Left = 100
        Top = 209
        Width = 40
        Height = 13
        Cursor = crNo
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label104: TLabel
        Left = 484
        Top = 97
        Width = 98
        Height = 13
        Cursor = crNo
        Caption = 'Dt. Desligamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label78: TLabel
        Left = 353
        Top = 209
        Width = 17
        Height = 13
        Cursor = crNo
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label180: TLabel
        Left = 10
        Top = 57
        Width = 114
        Height = 13
        Cursor = crNo
        Caption = 'Grau de Parentesco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeRecebDadosPessoais: TLabel
        Left = 10
        Top = 248
        Width = 117
        Height = 13
        Cursor = crNo
        Caption = 'Nome do Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblCPFRecebDadosPessoais: TLabel
        Left = 226
        Top = 248
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
        Visible = False
      end
      object lblRGRecebDadosPessoais: TLabel
        Left = 354
        Top = 248
        Width = 19
        Height = 13
        Cursor = crNo
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblExpedicaoRecebDadosPessoais: TLabel
        Left = 486
        Top = 248
        Width = 60
        Height = 13
        Cursor = crNo
        Caption = 'Expedição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblUFRecebDadosPessoais: TLabel
        Left = 564
        Top = 248
        Width = 17
        Height = 13
        Cursor = crNo
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object dbednomepai: TwwDBEdit
        Left = 10
        Top = 185
        Width = 289
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMEPAI'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 309
        Top = 185
        Width = 284
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMEMAE'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 10
        Top = 36
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'ESTADOCIVIL'
        DataSource = dtmConsPart.dspartgeral
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
        Width = 790
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
        Left = 10
        Top = 224
        Width = 78
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CODESTADO'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 402
        Top = 224
        Width = 189
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMENACIONALIDADE'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 10
        Top = 150
        Width = 583
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'EMAIL'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 174
        Top = 72
        Width = 72
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPIRRF'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 256
        Top = 72
        Width = 80
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPTOT'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 350
        Top = 72
        Width = 73
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPTOT'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 10
        Top = 112
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'TIPOSANG'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 170
        Top = 36
        Width = 88
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGMOLESTIAGRAVE'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 273
        Top = 36
        Width = 67
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGDEFICIENTE'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 356
        Top = 36
        Width = 99
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'INICIOINVALIDEZ'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 471
        Top = 36
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FIMINVALIDEZ'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 134
        Top = 112
        Width = 220
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'GRAUINSTRUCAO'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 358
        Top = 112
        Width = 121
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CORPESSOA'
        DataSource = dtmConsPart.dspartgeral
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
        Left = 603
        Top = 34
        Width = 182
        Height = 247
        DataField = 'Imagem'
        DataSource = dtmConsPart.dspartgeral
        TabOrder = 17
      end
      object DbedIdade: TwwDBEdit
        Left = 529
        Top = 72
        Width = 63
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
        Left = 436
        Top = 72
        Width = 81
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
      object DbeditCidade: TwwDBEdit
        Left = 98
        Top = 224
        Width = 244
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CIDADE'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit88: TwwDBEdit
        Left = 483
        Top = 112
        Width = 110
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'DATADEMISSAO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit27: TwwDBEdit
        Left = 351
        Top = 224
        Width = 42
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CODESTADO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit81: TwwDBEdit
        Left = 10
        Top = 72
        Width = 155
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRICAO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNomeRecebDadosPessoais: TwwDBEdit
        Left = 10
        Top = 263
        Width = 207
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NOME'
        DataSource = dtmConsPart.dsRecebDadosPessoais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedCPFRecebDadosPessoais: TwwDBEdit
        Left = 226
        Top = 263
        Width = 119
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CPF'
        DataSource = dtmConsPart.dsRecebDadosPessoais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedRGRecebDadosPessoais: TwwDBEdit
        Left = 354
        Top = 263
        Width = 119
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'RG'
        DataSource = dtmConsPart.dsRecebDadosPessoais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedExpedicaoRecebDadosPessoais: TwwDBEdit
        Left = 484
        Top = 263
        Width = 75
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'EXPEDICAO'
        DataSource = dtmConsPart.dsRecebDadosPessoais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedUFRecebDadosPessoais: TwwDBEdit
        Left = 566
        Top = 263
        Width = 25
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'UFRG'
        DataSource = dtmConsPart.dsRecebDadosPessoais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 28
        UnboundDataType = wwDefault
        Visible = False
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
        Width = 790
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
        Width = 790
        Height = 281
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
        DataSource = DtmconsPart1.dsDocTitular
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
        Width = 790
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
        Width = 790
        Height = 152
        Align = alTop
        ColCount = 1
        DataSource = DtmconsPart1.dsendereco
        PanelHeight = 152
        PanelWidth = 774
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
          DataSource = DtmconsPart1.dsendereco
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
        Width = 793
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
        Width = 793
        Height = 282
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.DsTelefones
        PanelHeight = 47
        PanelWidth = 777
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
        object wwDBEdit1: TwwDBEdit
          Left = 12
          Top = 21
          Width = 43
          Height = 21
          DataField = 'DDI'
          DataSource = dtmConsPart.DsTelefones
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
          DataSource = dtmConsPart.DsTelefones
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
          DataSource = dtmConsPart.DsTelefones
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object GroupBox4: TGroupBox
          Left = 338
          Top = 1
          Width = 265
          Height = 41
          Caption = 'Tipo'
          TabOrder = 3
          object DBCheckBox3: TDBCheckBox
            Left = 14
            Top = 16
            Width = 49
            Height = 17
            Caption = 'Com.'
            DataField = 'FLGCOM'
            DataSource = dtmConsPart.DsTelefones
            ReadOnly = True
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 65
            Top = 16
            Width = 49
            Height = 17
            Caption = 'Part.'
            DataField = 'FLPART'
            DataSource = dtmConsPart.DsTelefones
            ReadOnly = True
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 116
            Top = 16
            Width = 49
            Height = 17
            Caption = 'Fax'
            DataField = 'FLGFAX'
            DataSource = dtmConsPart.DsTelefones
            ReadOnly = True
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox7: TDBCheckBox
            Left = 167
            Top = 16
            Width = 44
            Height = 17
            Caption = 'Cel.'
            DataField = 'FLGCEL'
            DataSource = dtmConsPart.DsTelefones
            ReadOnly = True
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 213
            Top = 16
            Width = 44
            Height = 17
            Caption = 'Rec.'
            DataField = 'FLGREC'
            DataSource = dtmConsPart.DsTelefones
            ReadOnly = True
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
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
        Width = 790
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
          'ENDRECO'#9'30'#9'Local'
          'NOME'#9'30'#9'Nome'
          'EMAIL'#9'30'#9'E-Mail'
          'DDI'#9'4'#9'DDI'
          'DDD'#9'5'#9'DDD'
          'TELEFONE'#9'20'#9'Telefone'
          'CARGO'#9'15'#9'Cargo'
          'SETOR'#9'15'#9'Setor'
          'NASCIMENTO'#9'18'#9'Dt. Nascimento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DtmconsPart1.DsContatos
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
        DataSource = DtmconsPart1.DsContatos
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
        Width = 790
        Height = 281
        Selected.Strings = (
          'NUMBANCO'#9'10'#9'Banco'#9'F'
          'NOMEBANCO'#9'30'#9'Nome do Banco'#9'F'
          'NUMAGENCIA'#9'15'#9'Agência'#9'F'
          'NOMEAGENCIA'#9'30'#9'Nome da Agência'#9'F'
          'CONTACORRENTE'#9'15'#9'Conta Bancária'#9'F'
          'CONTAPREF'#9'3'#9'Preferencial'#9'F'
          'TPCONTA'#9'8'#9'Tipo'#9'F'
          'FLGCONTACONJUNTA'#9'1'#9'Conjunta'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dsContaCorrente
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
        Width = 790
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
        Width = 790
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
        Width = 790
        Height = 153
        Selected.Strings = (
          'NUMSEQUENCIA'#9'4'#9'Seq.'#9'F'
          'MATRICULA'#9'10'#9'Matrícula'#9'F'
          'NOME'#9'40'#9'Nome'#9'F'
          'DATACANCELA'#9'10'#9'Cancelado~Em'#9'F'
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
          'VALORBASE3'#9'10'#9'Opção 3'#9'F'
          'INICIOIMPOSTOR'#9'18'#9'Data de Início de dependencia para IR'#9'F'
          'FIMIMPOSTOR'#9'18'#9'Data final de dependencia para IR'#9'F'
          
            'INICIOSALARIOF'#9'18'#9'Data de Início de dependencia Salário Familia'#9 +
            'F'
          'FIMSALARIOF'#9'18'#9'Data final de dependencia para Salário família'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dtmConsPart.dsdepentit
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
      object dbgrdOutrasInforms: TwwDBGrid
        Left = 0
        Top = 189
        Width = 790
        Height = 111
        Selected.Strings = (
          'DESCRICAO'#9'37'#9'Parâmetro'
          'IDPARAM'#9'10'#9'Código'
          'DATAINICIO'#9'10'#9'Data início'
          'DATAFIM'#9'10'#9'Data Fim'
          'VALOR'#9'30'#9'Conteúdo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dsOutrasInforms
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
      object Panel59: TPanel
        Left = 0
        Top = 171
        Width = 790
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Outras Informações'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosBasicos'
      object DBText2: TDBText
        Left = 8
        Top = 25
        Width = 270
        Height = 13
        DataField = 'NOMEVALORBASE1'
        DataSource = dtmConsPart.DsValoresBaseDepentit
      end
      object DBText3: TDBText
        Left = 292
        Top = 25
        Width = 239
        Height = 13
        DataField = 'NOMEVALORBASE2'
        DataSource = dtmConsPart.DsValoresBaseDepentit
      end
      object DBText5: TDBText
        Left = 545
        Top = 25
        Width = 237
        Height = 13
        DataField = 'NOMEVALORBASE3'
        DataSource = dtmConsPart.DsValoresBaseDepentit
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        TabOrder = 0
      end
      object wwDBEdit18: TwwDBEdit
        Left = 6
        Top = 40
        Width = 276
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE1'
        DataSource = dtmConsPart.DsValoresBaseDepentit
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
      object wwDBEdit19: TwwDBEdit
        Left = 292
        Top = 40
        Width = 240
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE2'
        DataSource = dtmConsPart.DsValoresBaseDepentit
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
      object wwDBEdit20: TwwDBEdit
        Left = 542
        Top = 40
        Width = 240
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE3'
        DataSource = dtmConsPart.DsValoresBaseDepentit
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
      object PanelDadosFuncionais: TPanel
        Left = 0
        Top = 18
        Width = 793
        Height = 211
        BevelOuter = bvNone
        TabOrder = 1
        object lblnomepatro: TLabel
          Left = 7
          Top = 9
          Width = 80
          Height = 13
          Cursor = crNo
          Caption = 'Patrocinadora'
        end
        object Label151: TLabel
          Left = 295
          Top = 8
          Width = 34
          Height = 13
          Cursor = crNo
          Caption = 'Cargo'
        end
        object lblNomeCargo: TLabel
          Left = 544
          Top = 8
          Width = 43
          Height = 13
          Cursor = crNo
          Caption = 'Função'
        end
        object Label18: TLabel
          Left = 8
          Top = 45
          Width = 32
          Height = 13
          Cursor = crNo
          Caption = 'Nível'
        end
        object Label156: TLabel
          Left = 291
          Top = 44
          Width = 123
          Height = 13
          Cursor = crNo
          Caption = 'Vinculação Funcional'
        end
        object lblDataAdmissao: TLabel
          Left = 541
          Top = 45
          Width = 103
          Height = 13
          Cursor = crNo
          Caption = 'Data de Admissão'
        end
        object Label165: TLabel
          Left = 664
          Top = 45
          Width = 104
          Height = 13
          Cursor = crNo
          Caption = 'Data de Demissão'
        end
        object lblNomeFilial: TLabel
          Left = 7
          Top = 83
          Width = 27
          Height = 13
          Cursor = crNo
          Caption = 'Filial'
        end
        object lblSitFunc: TLabel
          Left = 290
          Top = 83
          Width = 237
          Height = 13
          Cursor = crNo
          Caption = 'Situação do Empregado na Patrocinadora'
        end
        object lblSalarioTotal: TLabel
          Left = 539
          Top = 84
          Width = 73
          Height = 13
          Cursor = crNo
          Caption = 'Salário Total'
        end
        object Label102: TLabel
          Left = 678
          Top = 83
          Width = 57
          Height = 13
          Cursor = crNo
          Caption = 'Ex-Diretor'
        end
        object Label67: TLabel
          Left = 9
          Top = 164
          Width = 88
          Height = 13
          Cursor = crNo
          Caption = 'Dt. Início INSS'
        end
        object Label69: TLabel
          Left = 112
          Top = 164
          Width = 28
          Height = 13
          Cursor = crNo
          Caption = 'DDD'
        end
        object Label68: TLabel
          Left = 154
          Top = 164
          Width = 82
          Height = 13
          Cursor = crNo
          Caption = 'Tel. Comercial'
        end
        object DBText9: TDBText
          Left = 8
          Top = 123
          Width = 273
          Height = 13
          DataField = 'NOMEVALORBASE1'
          DataSource = dtmConsPart.dspartgeral
        end
        object DBText10: TDBText
          Left = 292
          Top = 123
          Width = 239
          Height = 13
          DataField = 'NOMEVALORBASE2'
          DataSource = dtmConsPart.dspartgeral
        end
        object DBText11: TDBText
          Left = 542
          Top = 123
          Width = 237
          Height = 13
          DataField = 'NOMEVALORBASE3'
          DataSource = dtmConsPart.dspartgeral
        end
        object dbednomepatro: TwwDBEdit
          Left = 7
          Top = 23
          Width = 276
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'PATRO'
          DataSource = dtmConsPart.dspartgeral
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
        object dbedCargo: TwwDBEdit
          Left = 293
          Top = 23
          Width = 240
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'NOMECARGO'
          DataSource = dtmConsPart.dspartgeral
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
        object DbedFunc: TwwDBEdit
          Left = 541
          Top = 23
          Width = 240
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'FUNCAO'
          DataSource = dtmConsPart.dspartgeral
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
        object dbednivel: TwwDBEdit
          Left = 8
          Top = 59
          Width = 275
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'NIVEL'
          DataSource = dtmConsPart.dspartgeral
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
        object wwDBEdit82: TwwDBEdit
          Left = 292
          Top = 59
          Width = 240
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'VINCULO'
          DataSource = dtmConsPart.dspartgeral
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
        object dbeddataadmissao: TwwDBEdit
          Left = 541
          Top = 59
          Width = 118
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'DATAADMISSAO'
          DataSource = dtmConsPart.dspartgeral
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
        object wwDBEdit87: TwwDBEdit
          Left = 664
          Top = 59
          Width = 117
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'DATADEMISSAO'
          DataSource = dtmConsPart.dspartgeral
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
        object dbedFilial: TwwDBEdit
          Left = 7
          Top = 97
          Width = 276
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'FILIAL'
          DataSource = dtmConsPart.dspartgeral
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
        object dbedsitfunc: TwwDBEdit
          Left = 292
          Top = 97
          Width = 241
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'SITUACAONAPATRO'
          DataSource = dtmConsPart.dspartgeral
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
        object dbedsaltotal: TwwDBEdit
          Left = 541
          Top = 97
          Width = 128
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'SALTOTAL'
          DataSource = dtmConsPart.dspartgeral
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
        object wwDBEdit40: TwwDBEdit
          Left = 677
          Top = 97
          Width = 103
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'FLGDIRETOR'
          DataSource = dtmConsPart.dspartgeral
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
        object wwDBEdit92: TwwDBEdit
          Left = 7
          Top = 180
          Width = 92
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'DATAINICIOINSS'
          DataSource = dtmConsPart.DsDataInicioInss
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
        object wwDBEdit93: TwwDBEdit
          Left = 109
          Top = 180
          Width = 32
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'DDD'
          DataSource = dtmConsPart.DsTelefoneComercial
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
        object wwDBEdit94: TwwDBEdit
          Left = 152
          Top = 180
          Width = 117
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'NUMERO'
          DataSource = dtmConsPart.DsTelefoneComercial
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
        object dbeValor1: TwwDBEdit
          Left = 7
          Top = 138
          Width = 276
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'VALORBASE1'
          DataSource = dtmConsPart.dspartgeral
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
        object dbeValor2: TwwDBEdit
          Left = 292
          Top = 138
          Width = 240
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'VALORBASE2'
          DataSource = dtmConsPart.dspartgeral
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
        object dbeValor3: TwwDBEdit
          Left = 541
          Top = 138
          Width = 240
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'VALORBASE3'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
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
        Height = 42
      end
      object Label101: TLabel
        Left = 13
        Top = 26
        Width = 140
        Height = 13
        Caption = 'Valor do Enquadramento'
      end
      object DBText1: TDBText
        Left = 111
        Top = 42
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'VLRENQUADRAMENTO'
        DataSource = dtmConsPart.ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pgctrlDetalhe: TPageControl
        Left = 1
        Top = 64
        Width = 789
        Height = 235
        ActivePage = tbsDet
        TabOrder = 0
        object tbsDet: TTabSheet
          Caption = 'Cargos'
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
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
            Height = 207
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'
              'CARGO'#9'40'#9'Cargo'
              'NIVEL'#9'15'#9'Nível'
              'DATAINICIO'#9'13'#9'Data de~Início'
              'DATAFINAL'#9'13'#9'Data de ~Término'
              'FLGSITPART'#9'24'#9'Situação'
              'DESCMODO'#9'14'#9'Modo'
              'DESCSITCADASTRADA'#9'9'#9'Situação ~Cadastrada'
              'DESCORIGEM'#9'20'#9'Origem')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmConsPart.dsDet
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
            Height = 207
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dbgrdFuncao: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'#9'F'
                'GRUPO'#9'15'#9'Grupo'#9'F'
                'FUNCAO'#9'40'#9'Função'#9'F'
                'DATAINICIO'#9'12'#9'Data de ~Início'#9'F'
                'DATAFINAL'#9'12'#9'Data de ~Término'#9'F'
                'PERCFUNCAO'#9'11'#9'Percentual%'#9'F'
                'DESCMODO'#9'21'#9'Modo'#9'F'
                'DESCORIGEM'#9'23'#9'Origem'#9'F'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsFuncao
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
        object tbsAdicCompens: TTabSheet
          Caption = 'Adic. Compensatório'
          ImageIndex = 6
          object pnlAdicCompensatorio: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dbgrdAdicCompens: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código'
                'GRUPO'#9'15'#9'Grupo'
                'FUNCAO'#9'40'#9'Função Base'
                'DATAINICIO'#9'12'#9'Data de ~Início'
                'DATAFINAL'#9'12'#9'Data de ~Término'
                'PERC1AC'#9'10'#9'Percentual (%)'
                'DESCORIGEM'#9'23'#9'Origem'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsAdicCompens
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
        object tbsATS: TTabSheet
          Caption = 'Adic. por Tempo de Serviço'
          object pnlATS: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdATS: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'DATAINICIO'#9'15'#9'Data de ~Início'
                'DATAFINAL'#9'15'#9'Data de ~Término'
                'PERCATS'#9'20'#9'Percentual (%)'#9'F'
                'DESCORIGEM'#9'30'#9'Origem'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsATS
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
        end
        object tbsAdicInsalub: TTabSheet
          Caption = 'Adic. Insalubridade'
          ImageIndex = 4
          object Panel29: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdAdicInsalub: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'DATAINICIO'#9'15'#9'Data de ~Início'
                'DATAFINAL'#9'15'#9'Data de ~Término'
                'PERCINSALUB'#9'20'#9'Percentual (%)'
                'DESCORIGEM'#9'30'#9'Origem'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                'DESCSIT'#9'10'#9'Situação na ~época')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsAdicInsalub
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
        object tbsAdicNoturno: TTabSheet
          Caption = 'Adic. Noturno'
          ImageIndex = 7
          object pnlAdicNoturno: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdAdicNoturno: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'DATAINICIO'#9'15'#9'Data de ~Início'
                'DATAFINAL'#9'15'#9'Data de ~Término'
                'QTDEMINUTOS'#9'10'#9'Qtde. Minutos'
                'PERCADNOT'#9'10'#9'Percentual (%)'
                'DESCORIGEM'#9'30'#9'Origem'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                'DESCSIT'#9'10'#9'Situação na ~Época')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsAdicNoturno
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
        object tbsAdicPericul: TTabSheet
          Caption = 'Adic. Periculosidade'
          ImageIndex = 5
          object Panel32: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdAdicPericul: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
              Selected.Strings = (
                'DATAINICIO'#9'15'#9'Data de ~Início'
                'DATAFINAL'#9'15'#9'Data de ~Término'
                'PERCPERICUL'#9'20'#9'Percentual (%)'
                'DESCORIGEM'#9'30'#9'Origem'
                'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                'DESCSIT'#9'20'#9'Situação na ~Época')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsAdicPericul
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
        object tbsRubSal: TTabSheet
          Caption = 'Outras Rubricas Salariais'
          object pnlControlesRubSalarial: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdRubSal: TwwDBGrid
              Left = 1
              Top = 1
              Width = 779
              Height = 205
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
              DataSource = dtmConsPart.dsRubSalarial
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
      end
      object Panel43: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Width = 251
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (com Conversão) INSS'
      end
      object pnlHstFuncional: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Height = 227
        ControlType.Strings = (
          'FLGCONTATS;CheckBox;1;0'
          'FLGCONCOMITANTE;CheckBox;1;0')
        Selected.Strings = (
          'EMPRESA'#9'30'#9'Empresa'
          'MATRICULA'#9'13'#9'Matrícula'
          'DATAINICIO'#9'10'#9'Data Inicial'
          'DATAFINAL'#9'10'#9'Data Final'
          'FATOR'#9'10'#9'Fator'
          'TEMPOCALC'#9'10'#9'Dias'
          'TEMPOINDIVEXT'#9'33'#9'Tempo por Empresa'
          'FLGCONTATS'#9'10'#9'Conta Como Tempo~ de Serviço'
          'FLGCONCOMITANTE'#9'10'#9'Conc.'
          'TEMPOSERVANTERIOR'#9'10'#9'Tempo de Serviço Anterior~ [em Meses]'
          'TEMPONAOCREDITADO'#9'10'#9'Tempo Não Creditado~ [em meses]')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 4
        ShowHorzScrollBar = True
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
        DataSource = ds
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
      object wwDBEdit14: TwwDBEdit
        Left = 409
        Top = 44
        Width = 47
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSERVCALC'
        DataSource = ds
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
      object wwDBEdit89: TwwDBEdit
        Left = 55
        Top = 44
        Width = 334
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSEMCONVERSAOEXT'
        DataSource = ds
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
      object wwDBEdit91: TwwDBEdit
        Left = 459
        Top = 44
        Width = 334
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOTOTALEXT'
        DataSource = ds
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgRubricasSalariais'
      object wwDBGrid11: TwwDBGrid
        Left = 0
        Top = 70
        Width = 790
        Height = 230
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
        DataSource = dtmConsPart.DsHstRubricas
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
        Width = 790
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
        Width = 790
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
          LookupTable = dtmConsPart.qryMesRubrica
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
          LookupTable = dtmConsPart.qryPatros
          LookupField = 'IDPESSJUR'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblkPatrosCloseUp
        end
        object wwDBEdit25: TwwDBEdit
          Left = 415
          Top = 20
          Width = 107
          Height = 21
          Color = clAqua
          DataField = 'SUMPROVENTO'
          DataSource = dtmConsPart.DsHstRubricas
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
          DataSource = dtmConsPart.DsHstRubricas
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
          DataSource = dtmConsPart.DsHstRubricas
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
        Width = 790
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
        Width = 790
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
          Width = 786
          Height = 117
          Selected.Strings = (
            'NOME'#9'40'#9'Evento Gerador'
            'DATAEVENTO'#9'11'#9'Evento'
            'INSCRICAONUMERO'#9'11'#9'Número~Inscrição'
            'DATAREGISTRO'#9'11'#9'Registro'
            'DATAEFETIVADO'#9'10'#9'Efetivação'
            'DATAVOLTA'#9'13'#9'Data de~Retorno'
            'SITPARTNOVO'#9'30'#9'Nova Situação~na Fundação'
            'SITFUNCNOVO'#9'30'#9'Nova Situação~na Patrocinadora'
            'SITPLANONOVO'#9'30'#9'Nova Situação~no Plano'
            'SITPARTATUAL'#9'30'#9'Situação Fundação ~Antes do Evento'
            'SITFUNCATUAL'#9'30'#9'Situação Patrocinadora ~Antes do Evento'
            'SITPLANOATUAL'#9'30'#9'Situação Plano ~Antes do Evento'
            'PLANO'#9'40'#9'Plano'
            'PATRO'#9'40'#9'Patrocinadora')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtmConsPart.dsEventosPrev
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
        Width = 790
        Height = 143
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
          Left = 623
          Top = 19
          Width = 165
          Height = 122
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
          Width = 621
          Height = 122
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 1
          object dbgHstContFechado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 621
            Height = 122
            Selected.Strings = (
              'CONTRIBUICAOF'#9'85'#9'Contribuição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmConsPart.dsHstContF
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
        Width = 790
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
        Width = 790
        Height = 281
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
        DataSource = dtmConsPart.dsevent
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
        Width = 790
        Height = 281
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.dsFiario
        PanelHeight = 93
        PanelWidth = 774
        TabOrder = 0
        RowCount = 3
        object Label19: TLabel
          Left = 88
          Top = 16
          Width = 24
          Height = 13
          Caption = 'Rub'
        end
        object Label20: TLabel
          Left = 8
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label21: TLabel
          Left = 8
          Top = 50
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
          Top = 29
          Width = 529
          Height = 55
          Color = clInfoBk
          DataField = 'DESCRICAO'
          DataSource = dtmConsPart.dsFiario
          Enabled = False
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 29
          Width = 75
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINCLUSAO'
          DataSource = dtmConsPart.dsFiario
          Enabled = False
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 63
          Width = 194
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEUSUARIO'
          DataSource = dtmConsPart.dsFiario
          Enabled = False
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 29
          Width = 114
          Height = 21
          Color = clInfoBk
          DataField = 'IDRUBS'
          DataSource = dtmConsPart.dsFiario
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
          DataSource = dtmConsPart.dsFiario
          Enabled = False
          TabOrder = 4
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        DataSource = dtmConsPart.dsprocesso
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
      object Label168: TLabel
        Left = 399
        Top = 113
        Width = 27
        Height = 13
        Caption = 'Obs.'
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Height = 119
        Selected.Strings = (
          'IDRUBS'#9'10'#9'Num Rubs'
          'STATUS'#9'13'#9'Status'
          'DATAMOV'#9'19'#9'Data de Movimentação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dtmConsPart.DsRubs
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
        Height = 76
        Selected.Strings = (
          'FLGRECEBIDO'#9'2'#9'Recebido'#9'F'
          'DATARECEB'#9'13'#9'Data Recebimento'#9'F'
          'NOMEDOCUMENTO'#9'100'#9'Documento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        DataSource = dtmConsPart.dsTipoDocXRub
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
        Height = 119
        Selected.Strings = (
          'NOME'#9'50'#9'Benefício\Serviço'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dtmConsPart.DsRubXBeneficio
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
        Height = 119
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
        DataSource = dtmConsPart.DsHistRubs
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
      object DBRichEditOBS: TwwDBRichEdit
        Left = 397
        Top = 127
        Width = 386
        Height = 29
        AutoURLDetect = False
        DataField = 'OBS'
        DataSource = dtmConsPart.dsTipoDocXRub
        PrintJobName = 'Delphi 5'
        TabOrder = 9
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
          830000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C6673313620444252696368456469744F42535C7061
          720D0A7D0D0A00}
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesSituacaoAtual'
      object DBCtrlGrid3: TDBCtrlGrid
        Left = 0
        Top = 18
        Width = 790
        Height = 274
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.DsContribSitAtual
        PanelHeight = 91
        PanelWidth = 774
        TabOrder = 0
        RowCount = 3
        object Bevel3: TBevel
          Left = 3
          Top = 2
          Width = 764
          Height = 81
        end
        object Label130: TLabel
          Left = 11
          Top = 4
          Width = 72
          Height = 13
          Caption = 'Contribuição'
        end
        object Label131: TLabel
          Left = 447
          Top = 4
          Width = 78
          Height = 13
          Caption = 'Sit. Cobrança'
        end
        object Label132: TLabel
          Left = 11
          Top = 41
          Width = 65
          Height = 13
          Caption = 'Data Início'
        end
        object Label133: TLabel
          Left = 123
          Top = 41
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object dbtNoneValBase1: TDBText
          Left = 231
          Top = 41
          Width = 162
          Height = 13
          DataField = 'NOMEVALORBASE1'
          DataSource = dtmConsPart.DsContribSitAtual
        end
        object dbtNoneValBase2: TDBText
          Left = 406
          Top = 41
          Width = 162
          Height = 13
          DataField = 'NOMEVALORBASE2'
          DataSource = dtmConsPart.DsContribSitAtual
        end
        object dbtNoneValBase3: TDBText
          Left = 581
          Top = 41
          Width = 162
          Height = 14
          DataField = 'NOMEVALORBASE3'
          DataSource = dtmConsPart.DsContribSitAtual
        end
        object wwDBEdit51: TwwDBEdit
          Left = 11
          Top = 17
          Width = 396
          Height = 21
          DataField = 'NOME'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit52: TwwDBEdit
          Left = 445
          Top = 17
          Width = 296
          Height = 21
          DataField = 'SITCOBRANCA'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit53: TwwDBEdit
          Left = 11
          Top = 55
          Width = 86
          Height = 21
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit54: TwwDBEdit
          Left = 121
          Top = 55
          Width = 86
          Height = 21
          DataField = 'DATAFINAL'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit55: TwwDBEdit
          Left = 229
          Top = 55
          Width = 162
          Height = 21
          DataField = 'VALORBASE1'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit56: TwwDBEdit
          Left = 404
          Top = 55
          Width = 162
          Height = 21
          DataField = 'VALORBASE2'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit57: TwwDBEdit
          Left = 579
          Top = 55
          Width = 162
          Height = 21
          DataField = 'VALORBASE3'
          DataSource = dtmConsPart.DsContribSitAtual
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel58: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesHistoricoPrevidenciario'
      object Panel22: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Width = 790
        Height = 281
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
          'NOME'#9'35'#9'Titular'#9'F'
          'VALOROP1'#9'10'#9'Valor Opção 1'#9'F'
          'VALOROP2'#9'10'#9'Valor Opção 2'#9'F'
          'VALOROP3'#9'10'#9'Valor Opção 3'#9'F'
          'PARCELA'#9'10'#9'Prazo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dscontribprev
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
        Width = 409
        Height = 22
        AutoSize = False
        Caption = 'Saldo de Res. do Participante: R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LblSaldoResControle: TLabel
        Left = 416
        Top = 273
        Width = 374
        Height = 19
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'Saldo de Res. de Controle: R$  '
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
        Width = 790
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
        Width = 790
        Height = 254
        Selected.Strings = (
          'NOME'#9'47'#9'Reserva '#9'F'
          'DATAULTALIM'#9'10'#9'Data~ Referência'#9'F'
          'VALORRESERVA'#9'16'#9'Reserva~ Em Cotas'#9'F'
          'COTVALOR'#9'11'#9'Valor ~da Cota'#9'F'
          'VLRATUAL'#9'16'#9'Valor na Moeda~Corrente'#9'F'
          'FLGCONTROLE'#9'10'#9'Reserva de ~ Controle'#9'F'
          'FLGATIVO'#9'7'#9'Situação'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dtmConsPart.dsreserva
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
      object lblTotal: TLabel
        Left = 10
        Top = 278
        Width = 115
        Height = 13
        Caption = 'Saldo Total R$ 0,00'
      end
      object LblTotalControle: TLabel
        Left = 413
        Top = 277
        Width = 232
        Height = 13
        Caption = 'Saldo Total de Res. de Controle R$ 0,00'
      end
      object dbgrHistReserva: TwwDBGrid
        Left = 0
        Top = 64
        Width = 790
        Height = 213
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
        Align = alTop
        DataSource = dtmConsPart.dsHistReserva
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
        TitleButtons = True
        OnTitleButtonClick = dbgrHistReservaTitleButtonClick
        IndicatorColor = icBlack
      end
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 790
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
      object Panel57: TPanel
        Left = 0
        Top = 19
        Width = 790
        Height = 45
        Align = alTop
        TabOrder = 2
        object Label176: TLabel
          Left = 14
          Top = 2
          Width = 128
          Height = 13
          Caption = 'Mês Referência Inicial'
        end
        object Label177: TLabel
          Left = 166
          Top = 3
          Width = 121
          Height = 13
          Caption = 'Mês Referência Final'
        end
        object Label178: TLabel
          Left = 313
          Top = 2
          Width = 102
          Height = 13
          Caption = 'Nome da Reserva'
        end
        object dbLkMesInicial: TwwDBLookupCombo
          Left = 14
          Top = 16
          Width = 131
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = dtmConsPart.qryMesReferencia
          LookupField = 'Mesreferencia'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = dbLkMesInicialChange
        end
        object DblkMesFinal: TwwDBLookupCombo
          Left = 166
          Top = 17
          Width = 131
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = dtmConsPart.qryMesReferencia
          LookupField = 'Mesreferencia'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DblkMesFinalChange
        end
        object dblkNomeReserva: TwwDBLookupCombo
          Left = 313
          Top = 17
          Width = 351
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = dtmConsPart.qryNomeReserva
          LookupField = 'NOME'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = dblkNomeReservaChange
        end
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
        Width = 790
        Height = 281
        Selected.Strings = (
          'NUMEROPROCESSO'#9'10'#9'Núm.~Processo CM'#9'F'
          'NUMPROCINSS'#9'15'#9'Núm.~Processo INSS'#9'F'
          'BENEFICIO'#9'40'#9'Benefício'#9'F'
          'SITPROCESSO'#9'35'#9'Situação do Processo'#9'F'
          'EVENTOGER'#9'40'#9'Evento Gerador'#9'F'
          'DTEVENTO'#9'18'#9'Data do Evento'#9'F'
          'DTREGISTRO'#9'18'#9'Data de Registro'#9'F'
          'DATAINICIOBENEF'#9'18'#9'Data de Início~do Benefício'#9'F'
          'DATAFINAL'#9'18'#9'Data de Final~do Benefício'#9'F'
          'DATAINICIOPAG'#9'18'#9'Data de Início de~Pagamento do Benefício'#9'F'
          'VALORATUAL'#9'10'#9'Valor Atual'#9'F'
          'VALORCALCULADO'#9'10'#9'Valor Calculado'#9'F'
          'VALORCOTAS'#9'10'#9'Valor em Cotas'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsProcessoBenef
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
        Width = 790
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
        Width = 790
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
        DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          Left = 165
          Top = 53
          Width = 86
          Height = 13
          Caption = 'Início do Pgto.'
        end
        object Label142: TLabel
          Left = 266
          Top = 53
          Width = 93
          Height = 13
          Caption = 'Final Pgto. Efet.'
        end
        object Label143: TLabel
          Left = 471
          Top = 53
          Width = 79
          Height = 13
          Caption = 'Requerimento'
        end
        object Label144: TLabel
          Left = 571
          Top = 53
          Width = 63
          Height = 13
          Caption = 'Concessão'
        end
        object Label145: TLabel
          Left = 670
          Top = 53
          Width = 88
          Height = 13
          Caption = 'Início na Fund.'
        end
        object Label146: TLabel
          Left = 14
          Top = 97
          Width = 56
          Height = 13
          Caption = 'Val. Atual'
        end
        object Label147: TLabel
          Left = 109
          Top = 97
          Width = 83
          Height = 13
          Caption = 'Val. Calculado'
        end
        object Label148: TLabel
          Left = 206
          Top = 97
          Width = 52
          Height = 13
          Caption = 'Val. SRB'
        end
        object Label149: TLabel
          Left = 303
          Top = 97
          Width = 82
          Height = 13
          Caption = 'Preparado Até'
        end
        object Label150: TLabel
          Left = 400
          Top = 97
          Width = 88
          Height = 13
          Caption = 'Reajustado Até'
        end
        object Label152: TLabel
          Left = 497
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
        end
        object DBText7: TDBText
          Left = 14
          Top = 142
          Width = 199
          Height = 13
          DataField = 'NOMEVALORBASE1'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
        end
        object DBText8: TDBText
          Left = 452
          Top = 142
          Width = 199
          Height = 13
          DataField = 'NOMEVALORBASE3'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
        end
        object Label196: TLabel
          Left = 368
          Top = 53
          Width = 96
          Height = 13
          Caption = 'Final Pgto. Prev.'
        end
        object DBEdNumProcCM: TwwDBEdit
          Left = 12
          Top = 23
          Width = 87
          Height = 21
          DataField = 'NUMEROPROCESSO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit62: TwwDBEdit
          Left = 163
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAINICIOPAG'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit63: TwwDBEdit
          Left = 265
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAFINAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit64: TwwDBEdit
          Left = 469
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAREQUERIMENTO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit65: TwwDBEdit
          Left = 569
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATACONCESSAO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit66: TwwDBEdit
          Left = 668
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAINICIOFUND'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit67: TwwDBEdit
          Left = 11
          Top = 112
          Width = 86
          Height = 21
          DataField = 'VALORATUAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit68: TwwDBEdit
          Left = 107
          Top = 112
          Width = 86
          Height = 21
          DataField = 'VALORCALCULADO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 11
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit69: TwwDBEdit
          Left = 204
          Top = 112
          Width = 86
          Height = 21
          DataField = 'VALORSRB'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit70: TwwDBEdit
          Left = 301
          Top = 112
          Width = 86
          Height = 21
          DataField = 'ULTMESPREPARO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 13
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit71: TwwDBEdit
          Left = 398
          Top = 112
          Width = 86
          Height = 21
          DataField = 'ULTMESREAJUSTE'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 14
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit72: TwwDBEdit
          Left = 495
          Top = 112
          Width = 260
          Height = 21
          DataField = 'FORMAPGTO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
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
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 25
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit36: TwwDBEdit
          Left = 367
          Top = 68
          Width = 86
          Height = 21
          DataField = 'DATAFINALPREVISTA'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 26
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
        Width = 790
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
        Width = 790
        Height = 281
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
        DataSource = dtmConsPart.dsbenef
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
        Width = 790
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
        Width = 790
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
        Width = 790
        Height = 179
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
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
          DataSource = dtmConsPart.dsRubIndiv
          Enabled = False
          ReadOnly = True
          TabOrder = 24
        end
      end
      object dbgRubIndiv: TwwDBGrid
        Left = 0
        Top = 19
        Width = 790
        Height = 102
        Selected.Strings = (
          'DATAINICIO'#9'10'#9'Data de Início'
          'DATAFINAL'#9'10'#9'Data Final'
          'ANOMESREF'#9'7'#9'Mês de Referência'
          'VALORRUBRICA'#9'10'#9'Valor'
          'NOMEFAV'#9'40'#9'Favorecido'
          'DOCFAV'#9'18'#9'Documento'
          'FLGBASEPA'#9'12'#9'Forma Base de Outras PA´s'
          'FLGUSAABONO'#9'10'#9'Incide sobre o Abono Anual'
          'FLGPERMANENTE'#9'10'#9'Permanente'
          'PARCELAS'#9'10'#9'Total de Parcelas'
          'NUMOCORRENCIAS'#9'10'#9'Parcelas Processadas'
          'SEQRUBRICAINDIV'#9'10'#9'Sequencial'
          'CODIGORUBRICA'#9'10'#9'Codigo da Rubrica'
          'DESCRUBRICA'#9'60'#9'Descrição da Rubrica'
          'PROVDESC'#9'3'#9'P/D'
          'RUBRICAPA'#9'10'#9'Cód. Rubrica Provento PA'
          'DESCPA'#9'60'#9'Desc. Rubrica Provento PA'
          'PROVDESCPA'#9'1'#9'P/D'
          'FLGDESATIVADO'#9'10'#9'Desativada'
          'FLGUSADO'#9'10'#9'Já Processada'
          'NOMEREGRA'#9'30'#9'Descrição da Regra')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dtmConsPart.dsRubIndiv
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
        Width = 793
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
        Width = 793
        Height = 285
        Selected.Strings = (
          'DEPEN'#9'48'#9'Nome do Beneficiário'
          'PLANASS'#9'35'#9'Plano Assistencial'
          'PLANPREV'#9'25'#9'Plano previdenciário')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dspart
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
      object Panel40: TPanel
        Left = 0
        Top = 19
        Width = 433
        Height = 89
        TabOrder = 0
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
          Left = 153
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
        object Label170: TLabel
          Left = 82
          Top = 5
          Width = 32
          Height = 13
          Caption = 'Nível'
        end
        object wwDBEdit84: TwwDBEdit
          Left = 5
          Top = 18
          Width = 66
          Height = 21
          Color = clInfoBk
          DataField = 'VALORITEM'
          DataSource = dtmConsPart.dsEvolFuncCargo
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
          DataSource = dtmConsPart.dsEvolFuncATS
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit86: TwwDBEdit
          Left = 153
          Top = 18
          Width = 273
          Height = 21
          Color = clInfoBk
          DataField = 'DESCITEM'
          DataSource = dtmConsPart.dsEvolFuncCargo
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
        object wwDBEdit104: TwwDBEdit
          Left = 79
          Top = 18
          Width = 66
          Height = 21
          Color = clInfoBk
          DataField = 'NIVEL'
          DataSource = dtmConsPart.dsEvolFuncCargo
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object wwDBGrid13: TwwDBGrid
        Left = 2
        Top = 112
        Width = 428
        Height = 88
        Selected.Strings = (
          'CODIGO'#9'7'#9'Código'#9'F'
          'NOME'#9'34'#9'Nome'
          'PERCPBC'#9'6'#9'% PBC'
          'MODO'#9'6'#9'Modo~Função')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Color = clInfoBk
        DataSource = dtmConsPart.dsEvolFuncao
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
        IndicatorColor = icBlack
      end
      object dbgrdCompoDIB: TwwDBGrid
        Left = 436
        Top = 19
        Width = 354
        Height = 273
        Selected.Strings = (
          'DESCITEM'#9'27'#9'Componentes'
          'VALORITEM'#9'9'#9'Valor'
          'PERCITEM'#9'7'#9'%')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alRight
        DataSource = dtmConsPart.dsEnqSecao2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
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
      object Panel39: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEmprestimos'
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Width = 790
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
        OnRowChanged = wwDBGrid4RowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dtmConsPart.dsEmprestimo
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
        Width = 790
        Height = 147
        Selected.Strings = (
          'ITEDESCRICAO'#9'40'#9'Ítem'
          'HMEPARCELA'#9'10'#9'Parcela'
          'HMETIPOMOV'#9'18'#9'Movimentação'
          'HMEDATA'#9'18'#9'Data'
          'HMEDATAPREVISTA'#9'18'#9'Data Prevista'
          'HMEDATAEFETIVA'#9'18'#9'Data Efetiva'
          'HMEDATAATUALIZA'#9'18'#9'Data Atualização'
          'HMEVLRPREVISTO'#9'11'#9'Valor Previsto'
          'HMEVLREFETIVO'#9'10'#9'Valor Efetivo'
          'HMESALDODEV'#9'12'#9'Saldo Devedor'
          'DESCBAIXADO'#9'8'#9'Situação'
          'ANOMESCOMPETENCIA'#9'12'#9'Competência'
          'ANOMESCOBRANCA'#9'12'#9'Cobrança')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsHstEmprestimo
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
        Width = 790
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
        Left = 237
        Top = 194
        Width = 63
        Height = 13
        Caption = 'Recebedor'
      end
      object Label70: TLabel
        Left = 163
        Top = 194
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object Label71: TLabel
        Left = 55
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
      object Label79: TLabel
        Left = 628
        Top = 193
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object dbgridpartprev: TwwDBGrid
        Left = 0
        Top = 19
        Width = 790
        Height = 91
        Selected.Strings = (
          'MATRICULA'#9'10'#9'Matrícula'
          'NOMEBENEF'#9'41'#9'Beneficiário'
          'PLANPREV'#9'36'#9'Plano'
          'BENEFICIO'#9'60'#9'Benefício'
          'VALORBASE1'#9'10'#9'ValorBase1'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = DtmconsPart1.dspartprev
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
        IndicatorColor = icBlack
      end
      object DBEdit36: TDBEdit
        Left = 12
        Top = 133
        Width = 113
        Height = 21
        Color = clInfoBk
        DataField = 'DOCBEN'
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.dspartprev
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit34: TDBEdit
        Left = 55
        Top = 207
        Width = 101
        Height = 21
        Color = clInfoBk
        DataField = 'NUMEROTEL'
        DataSource = DtmconsPart1.dspartprev
        Enabled = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit35: TDBEdit
        Left = 164
        Top = 207
        Width = 64
        Height = 21
        Color = clInfoBk
        DataField = 'TIPO'
        DataSource = DtmconsPart1.dspartprev
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit43: TDBEdit
        Left = 237
        Top = 207
        Width = 381
        Height = 21
        Color = clInfoBk
        DataField = 'NOMERESP'
        DataSource = DtmconsPart1.dspartprev
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
        DataSource = DtmconsPart1.DsContaCorrentePartPrev
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
        Width = 790
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
      object DBEdit37: TDBEdit
        Left = 628
        Top = 207
        Width = 148
        Height = 21
        Color = clInfoBk
        DataField = 'NUMDOCBEN'
        DataSource = DtmconsPart1.dspartprev
        Enabled = False
        ReadOnly = True
        TabOrder = 15
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesHistoricoAssistencial'
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 790
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
        Width = 790
        Height = 281
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
        DataSource = DtmconsPart1.dscontrib
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
        Width = 790
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
        Width = 790
        Height = 120
        Selected.Strings = (
          'NOME'#9'43'#9'Benefício'
          'DESCRICAO'#9'10'#9'Situação'
          'VALORATUAL'#9'15'#9'Valor Atual'
          'VALORATUAL_1'#9'10'#9'Valor Autal ~Mov.'
          'VALORATUALANT'#9'10'#9'Valor Autal ~Mov. Ant.'#9'F'
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
        DataSource = DtmconsPart1.DsBeneficios
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
      object Panel38: TPanel
        Left = 0
        Top = 139
        Width = 401
        Height = 161
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
          DataSource = DtmconsPart1.DsBeneficios
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
          DataSource = DtmconsPart1.DsBeneficios
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
          DataSource = DtmconsPart1.DsBeneficios
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
          DataSource = DtmconsPart1.DsBeneficios
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
          DataSource = DtmconsPart1.DsBeneficios
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
          DataSource = DtmconsPart1.DsBeneficios
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
        Width = 389
        Height = 161
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
        DataSource = dtmConsPart.dsMovBenef
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
        Width = 790
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
        Width = 790
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
        DataSource = DtmconsPart1.dsplanprev
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
        Width = 790
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
        Width = 790
        Height = 121
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
        DataSource = DtmconsPart1.dsplanass
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
      Caption = 'pgAcaoJudicial'
      object pnlCompensacao: TPanel
        Left = 0
        Top = 51
        Width = 790
        Height = 249
        Align = alClient
        Enabled = False
        TabOrder = 3
        object Panel49: TPanel
          Left = 1
          Top = 1
          Width = 788
          Height = 64
          Align = alTop
          Caption = 'Panel1'
          TabOrder = 0
          object gbAnoMesInicio: TGroupBox
            Left = 1
            Top = 1
            Width = 184
            Height = 62
            Align = alLeft
            Caption = 'Início da Compensação'
            TabOrder = 0
            object lbAnoInicio: TLabel
              Left = 115
              Top = 16
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object lbMesInicio: TLabel
              Left = 12
              Top = 16
              Width = 24
              Height = 13
              Caption = 'Mês'
            end
            object cbMesInicio: TComboBox
              Left = 9
              Top = 32
              Width = 99
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Janeiro'
                'Fevereiro '
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro'
                'Outubro'
                'Novembro'
                'Dezembro')
            end
            object speAnoInicio: TSpinEdit
              Left = 112
              Top = 32
              Width = 67
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 0
            end
          end
          object gbAnoMesFinal: TGroupBox
            Left = 185
            Top = 1
            Width = 186
            Height = 62
            Align = alLeft
            Caption = 'Final da Compensação'
            TabOrder = 1
            object lbAnoFim: TLabel
              Left = 114
              Top = 16
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object lbMesFim: TLabel
              Left = 11
              Top = 16
              Width = 24
              Height = 13
              Caption = 'Mês'
            end
            object cbMesFim: TComboBox
              Left = 9
              Top = 32
              Width = 99
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Janeiro'
                'Fevereiro '
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro'
                'Outubro'
                'Novembro'
                'Dezembro')
            end
            object speAnoFinal: TSpinEdit
              Left = 112
              Top = 32
              Width = 67
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 0
            end
          end
          object GroupBox5: TGroupBox
            Left = 371
            Top = 1
            Width = 129
            Height = 62
            Align = alLeft
            Caption = 'Total a Compensar'
            TabOrder = 2
            object redCompTotal: TRealEdit
              Left = 4
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object GroupBox6: TGroupBox
            Left = 631
            Top = 1
            Width = 136
            Height = 62
            Align = alLeft
            Caption = 'Saldo a Compensar'
            TabOrder = 3
            object pnlsaldo: TPanel
              Left = 5
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 0
            end
          end
          object GroupBox7: TGroupBox
            Left = 500
            Top = 1
            Width = 131
            Height = 62
            Align = alLeft
            Caption = 'Total já compensado'
            TabOrder = 4
            object redsaldo: TRealEdit
              Left = 5
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
        object GroupBox8: TGroupBox
          Left = 1
          Top = 65
          Width = 344
          Height = 183
          Align = alLeft
          TabOrder = 1
          object Label166: TLabel
            Left = 8
            Top = 7
            Width = 57
            Height = 13
            Caption = 'Cód. Vara'
          end
          object Label167: TLabel
            Left = 80
            Top = 7
            Width = 81
            Height = 13
            Caption = 'Nome da Vara'
          end
          object edtcodvaracomp: TEdit
            Left = 6
            Top = 20
            Width = 67
            Height = 21
            MaxLength = 2
            TabOrder = 0
          end
          object edtNomeVaracomp: TEdit
            Left = 77
            Top = 20
            Width = 250
            Height = 21
            TabOrder = 1
          end
        end
        object GroupBox9: TGroupBox
          Left = 345
          Top = 65
          Width = 132
          Height = 183
          Align = alLeft
          Caption = 'Nº do Processo'
          TabOrder = 2
          object edtNumproccomp: TEdit
            Left = 6
            Top = 13
            Width = 118
            Height = 21
            TabOrder = 0
          end
        end
      end
      object Panel41: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Ação Judicial de Imposto de Renda'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object pnlRestoMestre: TPanel
        Left = 0
        Top = 51
        Width = 790
        Height = 249
        Align = alClient
        BevelInner = bvRaised
        Enabled = False
        TabOrder = 1
        object Panel42: TPanel
          Left = 2
          Top = 88
          Width = 786
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object gbInfVara: TGroupBox
            Left = 0
            Top = 0
            Width = 336
            Height = 50
            Align = alLeft
            TabOrder = 0
            object lbCodVara: TLabel
              Left = 8
              Top = 7
              Width = 57
              Height = 13
              Caption = 'Cód. Vara'
            end
            object lbNomeVara: TLabel
              Left = 80
              Top = 7
              Width = 81
              Height = 13
              Caption = 'Nome da Vara'
            end
            object edCodVara: TEdit
              Left = 6
              Top = 20
              Width = 67
              Height = 21
              MaxLength = 2
              TabOrder = 0
            end
            object edNomeVara: TEdit
              Left = 77
              Top = 20
              Width = 250
              Height = 21
              TabOrder = 1
            end
          end
          object gbInfSecao: TGroupBox
            Left = 336
            Top = 0
            Width = 405
            Height = 50
            Align = alLeft
            TabOrder = 1
            object lbCodSecao: TLabel
              Left = 7
              Top = 7
              Width = 67
              Height = 13
              Caption = 'Cód. Seção'
            end
            object lbUfSecao: TLabel
              Left = 81
              Top = 7
              Width = 57
              Height = 13
              Caption = 'UF Seção'
            end
            object lbNomeSecao: TLabel
              Left = 147
              Top = 7
              Width = 91
              Height = 13
              Caption = 'Nome da Seção'
            end
            object edCodSecao: TEdit
              Left = 6
              Top = 20
              Width = 67
              Height = 21
              MaxLength = 2
              TabOrder = 0
            end
            object edNomeSecao: TEdit
              Left = 146
              Top = 20
              Width = 250
              Height = 21
              TabOrder = 2
            end
            object cmbUF: TDBLookupComboBox
              Left = 81
              Top = 20
              Width = 61
              Height = 21
              DataField = 'UFSECAO'
              KeyField = 'CODESTADO'
              ListField = 'CODESTADO'
              TabOrder = 1
            end
          end
        end
        object Panel44: TPanel
          Left = 2
          Top = 2
          Width = 786
          Height = 86
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel45: TPanel
            Left = 232
            Top = 0
            Width = 530
            Height = 86
            BevelOuter = bvNone
            TabOrder = 1
            object gbxbanco: TGroupBox
              Left = 113
              Top = 0
              Width = 395
              Height = 86
              Caption = 'Informações Bancárias'
              TabOrder = 0
              object lbBanco: TLabel
                Left = 5
                Top = 12
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object lbAgencia: TLabel
                Left = 201
                Top = 10
                Width = 47
                Height = 13
                Caption = 'Agência'
              end
              object lbConta: TLabel
                Left = 5
                Top = 46
                Width = 86
                Height = 13
                Caption = 'Conta Corrente'
              end
              object lbOperacao: TLabel
                Left = 202
                Top = 46
                Width = 56
                Height = 13
                Caption = 'Operação'
              end
              object dblkBanco: TwwDBLookupCombo
                Left = 5
                Top = 24
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Banco'#9'F')
                LookupField = 'IDPESSOA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object dblkAgencia: TwwDBLookupCombo
                Left = 200
                Top = 24
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Agência'#9'F')
                LookupField = 'IDPESSOA'
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object dblkConta: TwwDBLookupCombo
                Left = 5
                Top = 58
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CONTACORRENTE'#9'15'#9'Conta Corrente'#9'F')
                LookupField = 'IDCBANCARIA'
                TabOrder = 2
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object cmbOperacao: TComboBox
                Left = 200
                Top = 59
                Width = 190
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                Items.Strings = (
                  '001 - Conta Corrente'
                  '002 - Conta Corrente Pessoa Física'
                  '003 - Conta Corrente Pessoa Jurídica'
                  '004 - Depósito Judicial'
                  '013 - Conta de Poupança'
                  '022 - Conta Caderneta Pessoa Jurídica'
                  '635 - Dépósito Judicial IR')
              end
            end
            object gbDatas: TGroupBox
              Left = 1
              Top = 0
              Width = 111
              Height = 86
              TabOrder = 1
              object lbDataInicio: TLabel
                Left = 8
                Top = 7
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object lbDataFim: TLabel
                Left = 8
                Top = 43
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object dbdtInicio: TCMDateTimePicker
                Left = 8
                Top = 20
                Width = 96
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
                ShowButton = True
                TabOrder = 0
              end
              object dbdtFinal: TCMDateTimePicker
                Left = 8
                Top = 56
                Width = 96
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
                ShowButton = True
                TabOrder = 1
              end
            end
          end
          object Panel46: TPanel
            Left = 0
            Top = 0
            Width = 233
            Height = 86
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Panel47: TPanel
              Left = 0
              Top = 0
              Width = 232
              Height = 39
              BevelOuter = bvNone
              TabOrder = 0
              object gbNumProc: TGroupBox
                Left = 0
                Top = 0
                Width = 132
                Height = 39
                Align = alLeft
                Caption = 'Nº do Processo'
                TabOrder = 0
                object edNumProc: TEdit
                  Left = 6
                  Top = 13
                  Width = 118
                  Height = 21
                  TabOrder = 0
                end
              end
              object gbxPercentual: TGroupBox
                Left = 132
                Top = 0
                Width = 98
                Height = 39
                Align = alLeft
                Caption = 'Percentual'
                TabOrder = 1
                object Label105: TLabel
                  Left = 74
                  Top = 18
                  Width = 10
                  Height = 13
                  Caption = '%'
                end
                object redPercAcao: TRealEdit
                  Left = 8
                  Top = 14
                  Width = 61
                  Height = 20
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
              end
            end
            object gbStatus: TGroupBox
              Left = 1
              Top = 40
              Width = 229
              Height = 45
              Caption = 'Status da Ação'
              TabOrder = 1
              object cmbStatusAcao: TComboBox
                Left = 7
                Top = 16
                Width = 215
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Items.Strings = (
                  'Ação Judicial em Liminar'
                  'Ação Judicial Julgada Ganha'
                  'Ação Judicial Julgada Perdida')
              end
            end
          end
        end
        object dbgRegras: TwwDBGrid
          Left = 2
          Top = 138
          Width = 786
          Height = 109
          Selected.Strings = (
            'FLGATIVA'#9'10'#9'Regra Ativa'
            'NOMEREGRA'#9'60'#9'Regra'
            'DESCRICAO'#9'130'#9'Descrição da Rubrica')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtmConsPart.dsDetalheRegra
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      object PnlAcaoJudicial: TPanel
        Left = 0
        Top = 19
        Width = 790
        Height = 32
        Align = alTop
        BevelInner = bvRaised
        TabOrder = 2
        object lblAutorAcao: TLabel
          Left = 305
          Top = 8
          Width = 82
          Height = 13
          Caption = 'Autor da Ação'
        end
        object Panel48: TPanel
          Left = 2
          Top = 2
          Width = 301
          Height = 28
          Align = alLeft
          BevelInner = bvRaised
          TabOrder = 0
          object Label114: TLabel
            Left = 4
            Top = 7
            Width = 124
            Height = 13
            Caption = 'Tipo da Ação Judicial'
          end
          object cmbTipoOAcao: TComboBox
            Left = 129
            Top = 3
            Width = 168
            Height = 21
            Color = clWhite
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Correção de Tabela de IRRF'
              'Bitributação'
              'Compensação de IRRF')
          end
        end
        object edAutorAcao: TEdit
          Left = 392
          Top = 5
          Width = 262
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object cbxFazdeposito: TCheckBox
          Left = 657
          Top = 8
          Width = 112
          Height = 17
          Caption = 'Efetua depósito'
          TabOrder = 2
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pgDadosParaEnquadramento'
      object Panel50: TPanel
        Left = 1
        Top = 18
        Width = 790
        Height = 48
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label80: TLabel
          Left = 11
          Top = 7
          Width = 123
          Height = 13
          Caption = 'Vinculação Funcional'
        end
        object Label81: TLabel
          Left = 221
          Top = 7
          Width = 57
          Height = 13
          Caption = 'Ex-Diretor'
        end
        object Label82: TLabel
          Left = 289
          Top = 7
          Width = 38
          Height = 13
          Caption = '% ATS'
        end
        object Label83: TLabel
          Left = 371
          Top = 7
          Width = 42
          Height = 13
          Caption = 'Dt ATS'
        end
        object Label84: TLabel
          Left = 468
          Top = 7
          Width = 27
          Height = 13
          Caption = 'Filial'
        end
        object Label85: TLabel
          Left = 661
          Top = 7
          Width = 116
          Height = 13
          Caption = 'Sal. de Participação'
        end
        object wwDBEdit95: TwwDBEdit
          Left = 10
          Top = 22
          Width = 204
          Height = 21
          Color = clInfoBk
          DataField = 'VINCULO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit96: TwwDBEdit
          Left = 221
          Top = 22
          Width = 59
          Height = 21
          Color = clInfoBk
          DataField = 'FLGDIRETOR'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit97: TwwDBEdit
          Left = 289
          Top = 22
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'PERCATS'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit98: TwwDBEdit
          Left = 371
          Top = 22
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit99: TwwDBEdit
          Left = 468
          Top = 22
          Width = 184
          Height = 21
          Color = clInfoBk
          DataField = 'NOME'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit100: TwwDBEdit
          Left = 660
          Top = 22
          Width = 119
          Height = 21
          Color = clInfoBk
          DataField = 'SALPARTICIPACAO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel51: TPanel
        Left = 2
        Top = 64
        Width = 789
        Height = 45
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label86: TLabel
          Left = 11
          Top = 4
          Width = 64
          Height = 13
          Caption = 'Cód. Cargo'
        end
        object Label87: TLabel
          Left = 96
          Top = 4
          Width = 34
          Height = 13
          Caption = 'Cargo'
        end
        object Label88: TLabel
          Left = 393
          Top = 4
          Width = 87
          Height = 13
          Caption = 'Nível do Cargo'
        end
        object Label89: TLabel
          Left = 601
          Top = 4
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label90: TLabel
          Left = 500
          Top = 4
          Width = 55
          Height = 13
          Caption = 'Dt. Início'
        end
        object wwDBEdit101: TwwDBEdit
          Left = 11
          Top = 19
          Width = 74
          Height = 21
          Color = clInfoBk
          DataField = 'CODCARGO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit102: TwwDBEdit
          Left = 96
          Top = 19
          Width = 285
          Height = 21
          Color = clInfoBk
          DataField = 'TITCARGO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit103: TwwDBEdit
          Left = 393
          Top = 19
          Width = 94
          Height = 21
          Color = clInfoBk
          DataField = 'NIVEL'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorCargo: TwwDBEdit
          Left = 601
          Top = 19
          Width = 86
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit105: TwwDBEdit
          Left = 500
          Top = 19
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel52: TPanel
        Left = 2
        Top = 107
        Width = 789
        Height = 48
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label91: TLabel
          Left = 11
          Top = 5
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label92: TLabel
          Left = 95
          Top = 5
          Width = 43
          Height = 13
          Caption = 'Função'
        end
        object Label93: TLabel
          Left = 393
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label94: TLabel
          Left = 499
          Top = 5
          Width = 55
          Height = 13
          Caption = 'Dt. Início'
        end
        object Label95: TLabel
          Left = 602
          Top = 5
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object wwDBEdit106: TwwDBEdit
          Left = 10
          Top = 20
          Width = 74
          Height = 21
          Color = clInfoBk
          DataField = 'CODIGO'
          DataSource = dtmConsPart.dsFuncAtual
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit107: TwwDBEdit
          Left = 95
          Top = 20
          Width = 285
          Height = 21
          Color = clInfoBk
          DataField = 'FUNCAO'
          DataSource = dtmConsPart.dsFuncAtual
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit108: TwwDBEdit
          Left = 393
          Top = 20
          Width = 95
          Height = 21
          Color = clInfoBk
          DataField = 'GRUPO'
          DataSource = dtmConsPart.dsFuncAtual
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit109: TwwDBEdit
          Left = 499
          Top = 20
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.dsFuncAtual
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorFunc: TwwDBEdit
          Left = 602
          Top = 20
          Width = 86
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel53: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dados para Enquadramento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
      object Panel54: TPanel
        Left = 2
        Top = 153
        Width = 789
        Height = 47
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 4
        object Label96: TLabel
          Left = 11
          Top = 5
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label97: TLabel
          Left = 95
          Top = 5
          Width = 110
          Height = 13
          Caption = 'Função Facultativa'
        end
        object Label98: TLabel
          Left = 393
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label99: TLabel
          Left = 499
          Top = 5
          Width = 55
          Height = 13
          Caption = 'Dt. Início'
        end
        object Label100: TLabel
          Left = 602
          Top = 5
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object wwDBEdit111: TwwDBEdit
          Left = 10
          Top = 20
          Width = 74
          Height = 21
          Color = clInfoBk
          DataField = 'CODIGO'
          DataSource = dtmConsPart.dsFuncFacult
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit112: TwwDBEdit
          Left = 95
          Top = 20
          Width = 285
          Height = 21
          Color = clInfoBk
          DataField = 'FUNCAO'
          DataSource = dtmConsPart.dsFuncFacult
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit113: TwwDBEdit
          Left = 393
          Top = 20
          Width = 95
          Height = 21
          Color = clInfoBk
          DataField = 'GRUPO'
          DataSource = dtmConsPart.dsFuncFacult
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit114: TwwDBEdit
          Left = 499
          Top = 20
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.dsFuncFacult
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValFuncFac: TwwDBEdit
          Left = 602
          Top = 20
          Width = 86
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel55: TPanel
        Left = 2
        Top = 198
        Width = 789
        Height = 46
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 5
        object Label171: TLabel
          Left = 11
          Top = 5
          Width = 200
          Height = 13
          Caption = 'Adicional Compensatório S/Função'
        end
        object Label172: TLabel
          Left = 306
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label173: TLabel
          Left = 412
          Top = 5
          Width = 55
          Height = 13
          Caption = 'Dt. Início'
        end
        object Label174: TLabel
          Left = 605
          Top = 5
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label175: TLabel
          Left = 511
          Top = 6
          Width = 10
          Height = 13
          Caption = '%'
        end
        object wwDBEdit117: TwwDBEdit
          Left = 10
          Top = 20
          Width = 285
          Height = 21
          Color = clInfoBk
          DataField = 'FUNCAO'
          DataSource = dtmConsPart.dsAdicCompens
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit118: TwwDBEdit
          Left = 306
          Top = 20
          Width = 95
          Height = 21
          Color = clInfoBk
          DataField = 'GRUPO'
          DataSource = dtmConsPart.dsAdicCompens
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit119: TwwDBEdit
          Left = 412
          Top = 20
          Width = 89
          Height = 21
          Color = clInfoBk
          DataField = 'DATAINICIO'
          DataSource = dtmConsPart.dsAdicCompens
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edtValorAdicComp: TwwDBEdit
          Left = 605
          Top = 20
          Width = 86
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit121: TwwDBEdit
          Left = 511
          Top = 20
          Width = 86
          Height = 21
          Color = clInfoBk
          DataField = 'PERC1AC'
          DataSource = dtmConsPart.dsAdicCompens
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel56: TPanel
        Left = 2
        Top = 242
        Width = 789
        Height = 47
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 6
        object opcao1: TDBText
          Left = 12
          Top = 5
          Width = 116
          Height = 13
          DataField = 'NOMEVALORBASE1'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object opcao2: TDBText
          Left = 142
          Top = 5
          Width = 116
          Height = 13
          DataField = 'NOMEVALORBASE2'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object opcao3: TDBText
          Left = 271
          Top = 5
          Width = 116
          Height = 13
          DataField = 'NOMEVALORBASE3'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object opcao4: TDBText
          Left = 401
          Top = 4
          Width = 116
          Height = 14
          DataField = 'NOMEVALORBASE4'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object opcao5: TDBText
          Left = 532
          Top = 4
          Width = 116
          Height = 14
          DataField = 'NOMEVALORBASE5'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object opcao6: TDBText
          Left = 661
          Top = 5
          Width = 116
          Height = 13
          DataField = 'NOMEVALORBASE6'
          DataSource = dtmConsPart.dsSitFuncional
        end
        object wwDBEdit116: TwwDBEdit
          Left = 10
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE1'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit122: TwwDBEdit
          Left = 140
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE2'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit123: TwwDBEdit
          Left = 269
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE3'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit124: TwwDBEdit
          Left = 529
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE5'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit125: TwwDBEdit
          Left = 399
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE4'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit126: TwwDBEdit
          Left = 659
          Top = 20
          Width = 120
          Height = 21
          Color = clInfoBk
          DataField = 'VALORBASE6'
          DataSource = dtmConsPart.dsSitFuncional
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Parcelamento'
      object DBCtrlGrid5: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 790
        Height = 280
        Align = alClient
        ColCount = 1
        DataSource = DtmconsPart1.dsParcelamento
        Enabled = False
        PanelHeight = 140
        PanelWidth = 774
        TabOrder = 0
        RowCount = 2
        object Label181: TLabel
          Left = 8
          Top = 1
          Width = 50
          Height = 13
          Cursor = crNo
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label183: TLabel
          Left = 77
          Top = 1
          Width = 43
          Height = 13
          Cursor = crNo
          Caption = '% Desc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label184: TLabel
          Left = 145
          Top = 1
          Width = 54
          Height = 13
          Cursor = crNo
          Caption = '% Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label185: TLabel
          Left = 8
          Top = 43
          Width = 85
          Height = 13
          Cursor = crNo
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label186: TLabel
          Left = 115
          Top = 43
          Width = 101
          Height = 13
          Cursor = crNo
          Caption = 'Parcelas Geradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label187: TLabel
          Left = 316
          Top = 1
          Width = 66
          Height = 13
          Cursor = crNo
          Caption = '1a. Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label188: TLabel
          Left = 424
          Top = 1
          Width = 70
          Height = 13
          Cursor = crNo
          Caption = 'Dívida Part.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label189: TLabel
          Left = 536
          Top = 1
          Width = 73
          Height = 13
          Cursor = crNo
          Caption = 'Dívida Patro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label190: TLabel
          Left = 653
          Top = 1
          Width = 72
          Height = 13
          Cursor = crNo
          Caption = 'Salário Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label191: TLabel
          Left = 243
          Top = 43
          Width = 89
          Height = 13
          Cursor = crNo
          Caption = 'Parcelas Pagas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label192: TLabel
          Left = 220
          Top = 1
          Width = 65
          Height = 13
          Cursor = crNo
          Caption = 'Data Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label193: TLabel
          Left = 361
          Top = 45
          Width = 51
          Height = 13
          Cursor = crNo
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label194: TLabel
          Left = 8
          Top = 85
          Width = 112
          Height = 13
          Cursor = crNo
          Caption = 'Data Cancelamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label195: TLabel
          Left = 131
          Top = 85
          Width = 123
          Height = 13
          Cursor = crNo
          Caption = 'Motivo Cancelamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit38: TDBEdit
          Left = 8
          Top = 16
          Width = 54
          Height = 21
          DataField = 'NUMPARCELAS'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 0
        end
        object DBEdit39: TDBEdit
          Left = 77
          Top = 16
          Width = 51
          Height = 21
          DataField = 'PERCENTUAL'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 1
        end
        object DBEdit40: TDBEdit
          Left = 145
          Top = 16
          Width = 57
          Height = 21
          DataField = 'PERCSEGURO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 2
        end
        object DBEdit46: TDBEdit
          Left = 8
          Top = 58
          Width = 85
          Height = 21
          DataField = 'SDODEVEDOR'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 3
        end
        object DBEdit47: TDBEdit
          Left = 114
          Top = 58
          Width = 103
          Height = 21
          DataField = 'PARCGERADAS'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 4
        end
        object DBEdit48: TDBEdit
          Left = 315
          Top = 16
          Width = 90
          Height = 21
          DataField = 'VLRPRIMPRESTACAO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 5
        end
        object DBEdit49: TDBEdit
          Left = 423
          Top = 16
          Width = 94
          Height = 21
          DataField = 'VLRDIVIDAPART'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 6
        end
        object DBEdit50: TDBEdit
          Left = 535
          Top = 16
          Width = 101
          Height = 21
          DataField = 'VLRDIVIDAPATRO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 7
        end
        object DBEdit51: TDBEdit
          Left = 652
          Top = 16
          Width = 110
          Height = 21
          DataField = 'VLRSALBASE'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 8
        end
        object DBEdit52: TDBEdit
          Left = 242
          Top = 58
          Width = 95
          Height = 21
          DataField = 'PARCPAGAS'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 9
        end
        object DBEdit53: TDBEdit
          Left = 219
          Top = 16
          Width = 79
          Height = 21
          DataField = 'DATAINICIO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 10
        end
        object DBEdit54: TDBEdit
          Left = 360
          Top = 58
          Width = 171
          Height = 21
          DataField = 'DESCSITPARCELAMENTO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 11
        end
        object DBEdit55: TDBEdit
          Left = 8
          Top = 100
          Width = 113
          Height = 21
          DataField = 'DATACANCELAMENTO'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 12
        end
        object DBEdit56: TDBEdit
          Left = 131
          Top = 100
          Width = 400
          Height = 21
          DataField = 'MOTIVOCANCEL'
          DataSource = DtmconsPart1.dsParcelamento
          TabOrder = 13
        end
      end
      object Panel36: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Parcelamento'
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
      Caption = 'OutrasInformacoes'
      object wwDBGrid3: TwwDBGrid
        Left = 0
        Top = 18
        Width = 790
        Height = 282
        Selected.Strings = (
          'DESCRICAO'#9'37'#9'Parâmetro'
          'IDPARAM'#9'10'#9'Código'
          'DATAINICIO'#9'10'#9'Data início'
          'DATAFIM'#9'10'#9'Data Fim'
          'VALOR'#9'30'#9'Conteúdo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dsOutrasInforms
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
      object Panel60: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Outras Informações'
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
      Caption = 'PgVidaNaFundacao'
      object wwDBGrid6: TwwDBGrid
        Left = 0
        Top = 133
        Width = 790
        Height = 167
        Selected.Strings = (
          'INSCRICAONUMERO'#9'10'#9'Inscrição'
          'PLANO'#9'35'#9'Plano'
          'FLGDESATIVADO'#9'3'#9'Desativado'
          'INSCRICAODATA'#9'10'#9'Dt. Inscrição'
          'DATACANCELAMENTO'#9'10'#9'Dt. Cancelamento'
          'DATAINICIOASSIST'#9'10'#9'Dt. Início Assist.'
          'DATAFIMASSIST'#9'10'#9'Dt. Final Assint.')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = DtmconsPart1.dsVidaFundDet
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      object wwDBGrid14: TwwDBGrid
        Left = 0
        Top = 18
        Width = 790
        Height = 98
        Selected.Strings = (
          'PATROCINADORA'#9'30'#9'Patrocinadora'
          'MATRICULA'#9'13'#9'Matrícula'
          'DATAADMISSAO'#9'10'#9'Data de Admissão'
          'DATADEMISSAO'#9'10'#9'Data de Demissão'
          'DATAREADMISSAO'#9'10'#9'Data de Readimissão'
          'DATAINICIOAFAST'#9'10'#9'Data de Início do Afastamento'
          'DATAFIMAFAST'#9'10'#9'Data Final do Afastamento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = DtmconsPart1.dsVidaFundacao
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      object Panel63: TPanel
        Left = 0
        Top = 116
        Width = 790
        Height = 17
        Align = alClient
        BevelInner = bvLowered
        Caption = 'Planos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
      object Panel62: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Vida na Fundação'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 0
    Width = 790
    Height = 183
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
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
      Left = 279
      Top = 140
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
      Left = 182
      Top = 141
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
      Width = 259
      Height = 13
      Caption = 'Situação do Participante Titular na Fundação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label113: TLabel
      Left = 702
      Top = 37
      Width = 74
      Height = 13
      Cursor = crNo
      Caption = 'Dt. Migração'
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
      Width = 282
      Height = 13
      Caption = 'Situação do Participante Titular na Patrocinadora'
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
      Width = 55
      Height = 13
      Cursor = crNo
      Caption = 'Categoria'
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
      Left = 377
      Top = 141
      Width = 235
      Height = 13
      Caption = 'Situação do Participante Titular no Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label77: TLabel
      Left = 94
      Top = 141
      Width = 65
      Height = 13
      Caption = 'Dt. Cancel.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label179: TLabel
      Left = 8
      Top = 141
      Width = 74
      Height = 13
      Caption = 'Dt. Inscrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBEdit28: TwwDBEdit
      Left = 278
      Top = 154
      Width = 89
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'DATAMORTE'
      DataSource = dtmConsPart.dspartgeral
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
      Left = 180
      Top = 154
      Width = 90
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'DATANASC'
      DataSource = dtmConsPart.dspartgeral
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
      DataSource = dtmConsPart.dspartgeral
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
      DataSource = dtmConsPart.dspartgeral
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
    object dbedSitPart: TwwDBEdit
      Left = 376
      Top = 118
      Width = 405
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'SITPART'
      DataSource = DtmconsPart1.dsDadosTitular
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
      DataSource = dtmConsPart.DsPlanos
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
      Left = 700
      Top = 50
      Width = 80
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'DATAMIGRACAO'
      DataSource = dtmConsPart.DsPlanos
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
    object edtMatricula: TwwDBEdit
      Left = 497
      Top = 14
      Width = 104
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
      DataSource = DtmconsPart1.dsDadosTitular
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
      DataSource = dtmConsPart.dspartgeral
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
      Width = 684
      Height = 21
      Color = clGray
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
      DataSource = DtmconsPart1.dsDadosTitular
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
      LookupTable = dtmConsPart.qryPlanos
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DblkPlanosChange
    end
    object wwDBEdit90: TwwDBEdit
      Left = 376
      Top = 154
      Width = 404
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'SITPLANO'
      DataSource = dtmConsPart.DsPlanos
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
    object dbedDataCanc: TwwDBEdit
      Left = 93
      Top = 154
      Width = 82
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
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbEdDtEntrada: TwwDBEdit
      Left = 8
      Top = 153
      Width = 80
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
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Dock972: TDock97
    Left = 0
    Top = 483
    Width = 790
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
  object twMensagem: TToolWindow97
    Left = 216
    Top = 296
    ActivateParent = False
    Caption = 'Mensagem'
    ClientAreaHeight = 147
    ClientAreaWidth = 369
    Resizable = False
    TabOrder = 3
    Visible = False
    OnVisibleChanged = twMensagemVisibleChanged
    object Panel61: TPanel
      Left = 0
      Top = 114
      Width = 369
      Height = 33
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 149
        Top = 4
        Width = 75
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
    end
    object reditMSG: TRichEdit
      Left = 0
      Top = 0
      Width = 369
      Height = 114
      Align = alClient
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 568
    Top = 96
  end
  object MenuPrin: TMainMenu
    AutoHotkeys = maManual
    Left = 592
    Top = 16
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
      object AcaoJudicial: TMenuItem
        Caption = '&Ação Judicial'
        OnClick = AcaoJudicialClick
      end
      object OutrasInformaes1: TMenuItem
        Caption = '&Outras Informações'
        OnClick = OutrasInformaes1Click
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
      object DadosparaEnquadramento1: TMenuItem
        Caption = 'Dados para En&quadramento'
        OnClick = DadosparaEnquadramento1Click
      end
    end
    object HistricodeContribuies1: TMenuItem
      Caption = 'Vida No P&lano'
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
        object Parcelamento1: TMenuItem
          Caption = 'Parcelamento'
          OnClick = Parcelamento1Click
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
    object VidaNaFundao1: TMenuItem
      Caption = 'Vida Na Fu&ndação'
      OnClick = VidaNaFundao1Click
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 554
    Top = 34
  end
  object ds: TwwDataSource
    DataSet = CmCds
    Left = 608
    Top = 95
  end
  object CmCds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 95
    object CmCdsEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 30
      FieldName = 'EMPRESA'
      Size = 60
    end
    object CmCdsMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object CmCdsDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object CmCdsDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object CmCdsFATOR: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 10
      FieldName = 'FATOR'
    end
    object CmCdsTEMPOCALC: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 10
      FieldName = 'TEMPOCALC'
    end
    object CmCdsTEMPOINDIVEXT: TStringField
      DisplayLabel = 'Tempo por Empresa'
      DisplayWidth = 33
      FieldName = 'TEMPOINDIVEXT'
      FixedChar = True
      Size = 33
    end
    object CmCdsFLGCONTATS: TFloatField
      DisplayLabel = 'Conta Como Tempo~ de Serviço'
      DisplayWidth = 10
      FieldName = 'FLGCONTATS'
    end
    object CmCdsFLGCONCOMITANTE: TFloatField
      DisplayLabel = 'Conc.'
      DisplayWidth = 10
      FieldName = 'FLGCONCOMITANTE'
    end
    object CmCdsTEMPOSERVANTERIOR: TFloatField
      DisplayLabel = 'Tempo de Serviço Anterior~ [em Meses]'
      DisplayWidth = 10
      FieldName = 'TEMPOSERVANTERIOR'
    end
    object CmCdsTEMPONAOCREDITADO: TFloatField
      DisplayLabel = 'Tempo Não Creditado~ [em meses]'
      DisplayWidth = 10
      FieldName = 'TEMPONAOCREDITADO'
    end
    object CmCdsTEMPOSEMCONVERSAO: TFloatField
      DisplayLabel = 'Tempo Sem Conversão'
      DisplayWidth = 10
      FieldName = 'TEMPOSEMCONVERSAO'
      Visible = False
    end
    object CmCdsTEMPOSEMCONVERSAOEXT: TStringField
      DisplayWidth = 33
      FieldName = 'TEMPOSEMCONVERSAOEXT'
      Visible = False
      FixedChar = True
      Size = 33
    end
    object CmCdsTEMPOTOTALEXT: TStringField
      DisplayWidth = 33
      FieldName = 'TEMPOTOTALEXT'
      Visible = False
      FixedChar = True
      Size = 33
    end
    object CmCdsTEMPOSERVCALC: TFloatField
      DisplayWidth = 10
      FieldName = 'TEMPOSERVCALC'
      Visible = False
    end
    object CmCdsTEMPOSITESPECIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'TEMPOSITESPECIAL'
      Visible = False
    end
    object CmCdsNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object CmCdsCPF: TStringField
      DisplayWidth = 18
      FieldName = 'CPF'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object CmCdsIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CmCdsSEQHISTFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQHISTFUNC'
      Visible = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select'
      '  '#39'EMPRESA'#39' as EMPRESA,'
      '  '#39'MATRICULA'#39' as MATRICULA,'
      '  to_date('#39'20/10/2003'#39', '#39'DD/MM/YYYY'#39') as DATAINICIO,'
      '  to_date('#39'20/10/2003'#39', '#39'DD/MM/YYYY'#39') as DATAFINAL,'
      '  201 as TEMPOCALC,'
      '  '#39'TEMPOINDIVEXT'#39' as TEMPOINDIVEXT,'
      '  202 as FLGCONTATS,'
      '  203 as TEMPOSERVANTERIOR,'
      '  204 as TEMPONAOCREDITADO,'
      '  205 as TEMPOSEMCONVERSAO,'
      '  '#39'TEMPOSEMCONVERSAOEXT'#39' as TEMPOSEMCONVERSAOEXT,'
      '  '#39'TEMPOTOTALEXT'#39' as TEMPOTOTALEXT,'
      '  206 as TEMPOSERVCALC,'
      '  207 as TEMPOSITESPECIAL,'
      '  '#39'NOME'#39' as NOME,'
      '  '#39'CPF'#39' as CPF,'
      '  208 as IDPESSOA,'
      '  209 as SEQHISTFUNC,'
      '  2.00 as FATOR,'
      '  0 as FLGCONCOMITANTE'
      'from dual')
    ClientDataSet = CmCds
    Left = 714
    Top = 138
  end
end
