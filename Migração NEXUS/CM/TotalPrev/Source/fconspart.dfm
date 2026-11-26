object FRMconspart: TFRMconspart
  Left = 363
  Top = 170
  HelpContext = 230001
  BorderStyle = bsSingle
  Caption = 'Consulta Geral de Pessoas'
  ClientHeight = 640
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
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
    Top = 209
    Width = 830
    Height = 398
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnPageChanged = NBKelegpartPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosPessoais'
      object lblNomePai: TLabel
        Left = 10
        Top = 165
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Nome do Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeMae: TLabel
        Left = 311
        Top = 165
        Width = 79
        Height = 13
        Cursor = crNo
        Caption = 'Nome da Mãe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Naturalidade: TLabel
        Left = 10
        Top = 200
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Naturalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label51: TLabel
        Left = 402
        Top = 201
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Nacionalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEMail: TLabel
        Left = 10
        Top = 129
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 175
        Top = 57
        Width = 61
        Height = 13
        Cursor = crNo
        Caption = 'Dep. IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 261
        Top = 57
        Width = 69
        Height = 13
        Cursor = crNo
        Caption = 'Dep. Sal. F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 356
        Top = 57
        Width = 61
        Height = 13
        Cursor = crNo
        Caption = 'Dep. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 93
        Width = 92
        Height = 13
        Cursor = crNo
        Caption = 'Tipo Sangüíneo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label10: TLabel
        Left = 163
        Top = 21
        Width = 59
        Height = 13
        Cursor = crNo
        Caption = 'Deficiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 374
        Top = 21
        Width = 89
        Height = 13
        Cursor = crNo
        Caption = 'Início Invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 476
        Top = 21
        Width = 75
        Height = 13
        Cursor = crNo
        Caption = 'Fim Invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 136
        Top = 93
        Width = 103
        Height = 13
        Cursor = crNo
        Caption = 'Grau de Instrução'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 359
        Top = 93
        Width = 20
        Height = 13
        Cursor = crNo
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 435
        Top = 56
        Width = 33
        Height = 13
        Cursor = crNo
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label135: TLabel
        Left = 507
        Top = 56
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Eleg. a Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label103: TLabel
        Left = 100
        Top = 200
        Width = 40
        Height = 13
        Cursor = crNo
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label104: TLabel
        Left = 484
        Top = 93
        Width = 98
        Height = 13
        Cursor = crNo
        Caption = 'Dt. Desligamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label78: TLabel
        Left = 596
        Top = 205
        Width = 17
        Height = 13
        Cursor = crNo
        Caption = 'UF'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label180: TLabel
        Left = 10
        Top = 56
        Width = 114
        Height = 13
        Cursor = crNo
        Caption = 'Grau de Parentesco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeRecebDadosPessoais: TLabel
        Left = 10
        Top = 237
        Width = 117
        Height = 13
        Cursor = crNo
        Caption = 'Nome do Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblCPFRecebDadosPessoais: TLabel
        Left = 226
        Top = 237
        Width = 24
        Height = 13
        Cursor = crNo
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblRGRecebDadosPessoais: TLabel
        Left = 354
        Top = 237
        Width = 19
        Height = 13
        Cursor = crNo
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblExpedicaoRecebDadosPessoais: TLabel
        Left = 486
        Top = 237
        Width = 60
        Height = 13
        Cursor = crNo
        Caption = 'Expedição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblUFRecebDadosPessoais: TLabel
        Left = 564
        Top = 236
        Width = 17
        Height = 13
        Cursor = crNo
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label113: TLabel
        Left = 226
        Top = 296
        Width = 71
        Height = 13
        Cursor = crNo
        Caption = 'Isento de IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label179: TLabel
        Left = 346
        Top = 281
        Width = 168
        Height = 26
        Cursor = crNo
        Caption = 'Desconta IR sobre'#13#10'suplementação e INSS juntos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label212: TLabel
        Left = 311
        Top = 129
        Width = 114
        Height = 13
        Caption = 'Email base FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipoDeficiencia: TLabel
        Left = 231
        Top = 21
        Width = 116
        Height = 13
        Caption = 'Tipo  de Deficiência'
      end
      object imgPessoa1: TImage
        Left = 600
        Top = 34
        Width = 200
        Height = 250
        Stretch = True
      end
      object pnlDependentes: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        TabOrder = 29
      end
      object wwDBEdit27: TwwDBEdit
        Left = 594
        Top = 220
        Width = 42
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'CODESTADO'
        DataSource = dtmConsPart.dspartgeral
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 31
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbednomepai: TwwDBEdit
        Left = 10
        Top = 179
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
        TabOrder = 17
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbednomemae: TwwDBEdit
        Left = 310
        Top = 179
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
        TabOrder = 18
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
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit16: TwwDBEdit
        Left = 10
        Top = 215
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
        TabOrder = 19
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit17: TwwDBEdit
        Left = 402
        Top = 215
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
        TabOrder = 21
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedEMail: TwwDBEdit
        Left = 10
        Top = 144
        Width = 289
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
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 174
        Top = 71
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
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit3: TwwDBEdit
        Left = 261
        Top = 71
        Width = 80
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'NUMDEPSALF'
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
      object wwDBEdit4: TwwDBEdit
        Left = 356
        Top = 71
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
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit5: TwwDBEdit
        Left = 10
        Top = 108
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
        TabOrder = 11
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit7: TwwDBEdit
        Left = 162
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
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit8: TwwDBEdit
        Left = 373
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
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit9: TwwDBEdit
        Left = 475
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
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit10: TwwDBEdit
        Left = 134
        Top = 108
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
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit12: TwwDBEdit
        Left = 358
        Top = 108
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
        TabOrder = 13
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object DBImage1: TDBImage
        Left = 603
        Top = 290
        Width = 182
        Height = 247
        DataField = 'Imagem'
        TabOrder = 30
        Visible = False
      end
      object DbedIdade: TwwDBEdit
        Left = 435
        Top = 71
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
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNumElegBenef: TwwDBEdit
        Left = 505
        Top = 71
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
        TabOrder = 10
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object DbeditCidade: TwwDBEdit
        Left = 98
        Top = 215
        Width = 295
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
        Top = 108
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
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit81: TwwDBEdit
        Left = 10
        Top = 71
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
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNomeRecebDadosPessoais: TwwDBEdit
        Left = 10
        Top = 252
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
        TabOrder = 22
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedCPFRecebDadosPessoais: TwwDBEdit
        Left = 226
        Top = 252
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
        TabOrder = 23
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedRGRecebDadosPessoais: TwwDBEdit
        Left = 354
        Top = 252
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
        TabOrder = 24
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedExpedicaoRecebDadosPessoais: TwwDBEdit
        Left = 484
        Top = 252
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
        TabOrder = 25
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedUFRecebDadosPessoais: TwwDBEdit
        Left = 566
        Top = 251
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
        TabOrder = 26
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object edtflgisentoir: TwwDBEdit
        Left = 226
        Top = 311
        Width = 103
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGISENTOIRRF'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtsomeirsupinss: TwwDBEdit
        Left = 346
        Top = 311
        Width = 167
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGSOMAIRSUPINSS'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 28
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit13: TwwDBEdit
        Left = 310
        Top = 144
        Width = 284
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'EMAILFUNCEF'
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
      object dbedTipoDeficiencia: TwwDBEdit
        Left = 231
        Top = 36
        Width = 139
        Height = 21
        Cursor = crNo
        Color = clInfoBk
        DataField = 'TPDEFICIENCIA'
        DataSource = dtmConsPart.dspartgeral
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 11
        Top = 277
        Width = 194
        Height = 80
        Caption = 'Possui Moléstia Grave?'
        TabOrder = 32
        object btnHstMolestiaTit: TButton
          Left = 47
          Top = 47
          Width = 101
          Height = 25
          Caption = 'Histórico'
          TabOrder = 0
          OnClick = btnHistMolestiaClick
        end
        object pnlOpcMolestia: TPanel
          Left = 18
          Top = 20
          Width = 157
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object rbMolestiaTitNao: TRadioButton
            Left = 104
            Top = 3
            Width = 47
            Height = 17
            Caption = 'Não'
            TabOrder = 0
          end
          object rbMolestiaTitSim: TRadioButton
            Left = 8
            Top = 3
            Width = 47
            Height = 17
            Caption = 'Sim'
            TabOrder = 1
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDadosPessoaisDepen'
      object lblEstadoCivilDepen: TLabel
        Left = 6
        Top = 25
        Width = 68
        Height = 13
        Cursor = crNo
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblGrauParentescoDepen: TLabel
        Left = 158
        Top = 25
        Width = 114
        Height = 13
        Cursor = crNo
        Caption = 'Grau de Parentesco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDeficienteDepen: TLabel
        Left = 314
        Top = 25
        Width = 59
        Height = 13
        Cursor = crNo
        Caption = 'Deficiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIdadeDepen: TLabel
        Left = 389
        Top = 25
        Width = 33
        Height = 13
        Cursor = crNo
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIRRFDepen: TLabel
        Left = 462
        Top = 25
        Width = 61
        Height = 13
        Cursor = crNo
        Caption = 'Dep. IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEscolaridadeDepen: TLabel
        Left = 538
        Top = 25
        Width = 74
        Height = 13
        Cursor = crNo
        Caption = 'Escolaridade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataInclusaoDepen: TLabel
        Left = 6
        Top = 67
        Width = 80
        Height = 13
        Cursor = crNo
        Caption = 'Data Inclusão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOrigemInclusaoDepen: TLabel
        Left = 158
        Top = 67
        Width = 92
        Height = 13
        Cursor = crNo
        Caption = 'Origem Inclusão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUltimaAtualizacaoDepen: TLabel
        Left = 310
        Top = 67
        Width = 106
        Height = 13
        Cursor = crNo
        Caption = 'Última Atualização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCanceladoEmDepen: TLabel
        Left = 462
        Top = 67
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Cancelado Em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSituacaoDepen: TLabel
        Left = 614
        Top = 67
        Width = 51
        Height = 13
        Cursor = crNo
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmailDepen: TLabel
        Left = 6
        Top = 110
        Width = 35
        Height = 13
        Cursor = crNo
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmailFuncef: TLabel
        Left = 402
        Top = 110
        Width = 118
        Height = 13
        Cursor = crNo
        Caption = 'E-mail base FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomePaiDepen: TLabel
        Left = 6
        Top = 150
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Nome do Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeMaeDepen: TLabel
        Left = 402
        Top = 150
        Width = 79
        Height = 13
        Cursor = crNo
        Caption = 'Nome da Mãe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNaturalidadeDepen: TLabel
        Left = 6
        Top = 200
        Width = 73
        Height = 13
        Cursor = crNo
        Caption = 'Naturalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidadeDepen: TLabel
        Left = 158
        Top = 200
        Width = 40
        Height = 13
        Cursor = crNo
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNacionalidadeDepen: TLabel
        Left = 474
        Top = 200
        Width = 82
        Height = 13
        Cursor = crNo
        Caption = 'Nacionalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label141: TLabel
        Left = 624
        Top = 188
        Width = 183
        Height = 39
        Cursor = crNo
        AutoSize = False
        Caption = 'Desconta IR sobre Suplementação de INSS juntos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object pnlMolPlanos: TPanel
        Left = 8
        Top = 240
        Width = 813
        Height = 120
        Cursor = crNo
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 21
        object rgMolestia: TRadioGroup
          Left = 2
          Top = 3
          Width = 185
          Height = 113
          BiDiMode = bdLeftToRight
          Caption = 'Possui Moléstia Grave?'
          Columns = 2
          Items.Strings = (
            'Sim'
            'Não')
          ParentBiDiMode = False
          TabOrder = 0
        end
        object rgDependIR: TRadioGroup
          Left = 192
          Top = 3
          Width = 185
          Height = 113
          Caption = 'Dependente de IR?'
          Columns = 2
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 1
        end
        object grpPlanoPrev: TGroupBox
          Left = 388
          Top = 3
          Width = 409
          Height = 113
          Caption = 'Plano Previdenciário'
          TabOrder = 2
          object lblDataCancelREG: TLabel
            Left = 10
            Top = 55
            Width = 112
            Height = 13
            Cursor = crNo
            Caption = 'Data Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDataCancelREB: TLabel
            Left = 140
            Top = 55
            Width = 112
            Height = 13
            Cursor = crNo
            Caption = 'Data Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDataCancelNOVO: TLabel
            Left = 270
            Top = 55
            Width = 112
            Height = 13
            Cursor = crNo
            Caption = 'Data Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object chkREGREPLAN: TCheckBox
            Left = 10
            Top = 28
            Width = 119
            Height = 17
            Caption = 'REG/REPLAN'
            TabOrder = 0
          end
          object chkREB: TCheckBox
            Left = 148
            Top = 28
            Width = 97
            Height = 17
            Caption = 'REB'
            TabOrder = 1
          end
          object chkNOVOPLANO: TCheckBox
            Left = 276
            Top = 32
            Width = 97
            Height = 17
            Caption = 'NOVOPLANO'
            TabOrder = 2
          end
          object dbedDataCancelREG: TwwDBEdit
            Left = 10
            Top = 70
            Width = 119
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
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDataCancelREB: TwwDBEdit
            Left = 140
            Top = 70
            Width = 119
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
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDataCancelNOVO: TwwDBEdit
            Left = 270
            Top = 70
            Width = 119
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
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object dbedEstadoCivilDepen: TwwDBEdit
        Left = 6
        Top = 40
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
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedGrauParentDepen: TwwDBEdit
        Left = 158
        Top = 40
        Width = 147
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
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDeficienteDepen: TwwDBEdit
        Left = 314
        Top = 40
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
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedIdadeDepen: TwwDBEdit
        Left = 393
        Top = 40
        Width = 67
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
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDepIRRFDepen: TwwDBEdit
        Left = 462
        Top = 40
        Width = 69
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
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedEscolaridadeDepen: TwwDBEdit
        Left = 538
        Top = 40
        Width = 266
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
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit75: TwwDBEdit
        Left = 6
        Top = 82
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'TRGDTINCLUSAO'
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
      object wwDBEdit76: TwwDBEdit
        Left = 158
        Top = 82
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'TRGUSERINCLUSAO'
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
      object wwDBEdit77: TwwDBEdit
        Left = 310
        Top = 82
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'TRGDTALTERACAO'
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
      object wwDBEdit89: TwwDBEdit
        Left = 462
        Top = 82
        Width = 147
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'DATACANCELA'
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
      object wwDBEdit91: TwwDBEdit
        Left = 614
        Top = 82
        Width = 190
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'SITUACAO'
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
      object wwDBEdit110: TwwDBEdit
        Left = 6
        Top = 125
        Width = 391
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
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit115: TwwDBEdit
        Left = 402
        Top = 125
        Width = 403
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'EMAILFUNCEF'
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
      object wwDBEdit120: TwwDBEdit
        Left = 6
        Top = 165
        Width = 391
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
        TabOrder = 13
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit128: TwwDBEdit
        Left = 402
        Top = 165
        Width = 403
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
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit129: TwwDBEdit
        Left = 6
        Top = 215
        Width = 147
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
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit130: TwwDBEdit
        Left = 158
        Top = 215
        Width = 311
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
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit131: TwwDBEdit
        Left = 474
        Top = 215
        Width = 142
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
        TabOrder = 17
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object btnHistMolestia: TButton
        Left = 32
        Top = 322
        Width = 101
        Height = 25
        Caption = 'Histórico'
        TabOrder = 18
        OnClick = btnHistMolestiaClick
      end
      object btnHistIR: TButton
        Left = 224
        Top = 322
        Width = 101
        Height = 25
        Caption = 'Histórico'
        TabOrder = 19
        OnClick = btnHistIRClick
      end
      object pnlDadosPessoaisDepen: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        TabOrder = 20
      end
      object dbedIRComplemento: TwwDBEdit
        Left = 622
        Top = 215
        Width = 179
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clInfoBk
        DataField = 'FLGSOMAIRSUPINSS'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgDocumentos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 813
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
        Width = 813
        Height = 347
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
        Font.Height = -12
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
        Width = 813
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
        Width = 813
        Height = 347
        Align = alClient
        ColCount = 1
        DataSource = DtmconsPart1.dsendereco
        PanelHeight = 347
        PanelWidth = 796
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
          Left = 499
          Top = 93
          Width = 17
          Height = 13
          Caption = 'UF'
        end
        object Label129: TLabel
          Left = 533
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
        object Label77: TLabel
          Left = 637
          Top = 93
          Width = 102
          Height = 13
          Caption = 'Tipo de Endereço'
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
          Left = 499
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
          Left = 534
          Top = 108
          Width = 91
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
          Width = 178
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
        object wwDBEdit34: TwwDBEdit
          Left = 638
          Top = 108
          Width = 113
          Height = 21
          Color = clInfoBk
          DataField = 'TIPOENDERECO'
          DataSource = DtmconsPart1.dsendereco
          ReadOnly = True
          TabOrder = 10
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
        Width = 813
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
        Width = 813
        Height = 342
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.DsTelefones
        PanelHeight = 57
        PanelWidth = 796
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
        object lblDtInclusao: TLabel
          Left = 609
          Top = 7
          Width = 98
          Height = 13
          Caption = 'Data de Inclusão'
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
        object edtDataInclusao: TwwDBEdit
          Left = 608
          Top = 24
          Width = 121
          Height = 19
          BorderStyle = bsNone
          Color = clBtnFace
          DataField = 'DTINCLUSAO'
          DataSource = dtmConsPart.DsTelefones
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
        Width = 830
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
        Anchors = [akLeft, akTop, akRight]
        DataSource = DtmconsPart1.DsContatos
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
        Height = 105
        Anchors = [akLeft, akTop, akRight, akBottom]
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
          750000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C667331385C7061720D0A7D0D0A00}
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContasBancarias'
      object dbgrContaBancaria: TwwDBGrid
        Left = 0
        Top = 19
        Width = 813
        Height = 347
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 813
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
      object sptOutrasInforms: TSplitter
        Left = 0
        Top = 284
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object sptDependentes: TSplitter
        Left = 0
        Top = 170
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dependentes Funcef'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdOutrasInforms: TwwDBGrid
        Left = 0
        Top = 191
        Width = 830
        Height = 93
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = DtmconsPart1.dsOutrasInforms
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel71: TPanel
        Left = 0
        Top = 173
        Width = 830
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
      object Panel59: TPanel
        Left = 0
        Top = 287
        Width = 830
        Height = 18
        Align = alTop
        Caption = 'Histórico de Alterações'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
      object dbgrdLogAltDepen: TwwDBGrid
        Left = 0
        Top = 305
        Width = 830
        Height = 93
        Selected.Strings = (
          'OPERACAO'#9'12'#9'Operação'#9'F'
          'NOMECAMPO'#9'21'#9'Campo'#9'F'
          'VLRANTERIOR'#9'25'#9'Valor Anterior'#9'F'
          'VLRALTERADO'#9'25'#9'Valor Alterado'#9'F'
          'TRGDTINCLUSAO'#9'20'#9'Data Alteração'#9'F'
          'NOMEUSUARIO'#9'35'#9'Responsável'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsLogAltDependentes
        TabOrder = 4
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object TabDepen: TTabControl
        Left = 0
        Top = 18
        Width = 830
        Height = 152
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Tabs.Strings = (
          'Dep. Total'
          'Dep. IR'
          'Dep. Funcef'
          'Designados')
        TabIndex = 0
        OnChange = TabDepenChange
        object dbgriddepen: TwwDBGrid
          Left = 4
          Top = 24
          Width = 822
          Height = 124
          Selected.Strings = (
            'NUMSEQUENCIA'#9'4'#9'Seq.'#9'F'
            'MATRICULA'#9'10'#9'Matrícula'#9'F'
            'NOME'#9'10'#9'Nome'#9'F'
            'NOMEPLANO'#9'10'#9'Plano'#9'F'
            'DATACANCELA'#9'10'#9'Cancelado~Em'#9'F'
            'DEPENDENCIA'#9'15'#9'Grau de~Parentesco'#9'F'
            'FLGISENTOIRRF'#9'5'#9'Isento~de IR'#9'F'
            'DATANASC'#9'10'#9'Data de ~Nascimento'#9'F'
            'IDADE'#9'9'#9'Idade'#9'F'
            'SEXO'#9'4'#9'Sexo'#9'F'
            'FLGBENEFICIARIO'#9'10'#9'Beneficiário'#9'F'
            'FLGCONTAIMPOSTOR'#9'10'#9'Imposto~de Renda'#9'F'
            'FLGCONTASALARIOF'#9'10'#9'Salário~Família'#9'F'
            'FLGDESIGNADO'#9'11'#9'Designado ~Para Resgate'#9'F'
            'FLGDEPLEGAL'#9'10'#9'Dependente~Funcef'#9'F'
            'FLGMOLESTIAGRAVE'#9'12'#9'Possui Moléstia~Grave'#9'F'
            'DATAMOLESTIAGRAVE'#9'13'#9'Moléstia~Grave desde'#9'F'
            'INICIOINVALIDEZ'#9'12'#9'Data Início~Invalidez'#9'F'
            'FIMINVALIDEZ'#9'12'#9'Data Fim~Invalidez'#9'F'
            'NOMEMAE'#9'35'#9'Nome da Mãe'#9'F'
            'NOMEPAI'#9'35'#9'Nome do Pai'#9'F'
            'NUMDOCUMENTO'#9'18'#9'CPF'#9'F'
            'SITUACAODEPEN'#9'50'#9'Situaçao ~Dependente'#9'F'
            'DATAMORTE'#9'13'#9'Data do~Falecimento'#9'F'
            'DESCESTCIVIL'#9'26'#9'Estado~Civil'#9'F'
            'VALORBASE1'#9'10'#9'Opção 1'#9'F'
            'VALORBASE2'#9'10'#9'Opção 2'#9'F'
            'VALORBASE3'#9'10'#9'Opção 3'#9'F'
            'INICIOIMPOSTOR'#9'31'#9'Data de Início de dependencia para IR'#9'F'
            'FIMIMPOSTOR'#9'28'#9'Data final de dependencia para IR'#9'F'
            
              'INICIOSALARIOF'#9'37'#9'Data de Início de dependencia Salário Familia'#9 +
              'F'
            'FIMSALARIOF'#9'37'#9'Data final de dependencia para Salário família'#9'F'
            'DATAINCLUSAO'#9'10'#9'Data da Inclusão'#9'F'
            'USUINCLUSAO'#9'10'#9'Origem da Inclusão'#9'F'
            'ULTALTERACAO'#9'10'#9'Última Atualização'#9'F'
            'DATACANCEL'#9'10'#9'Data Cancelamento'#9'F'
            'IDSITDEPENDENTE'#9'10'#9'Situação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtmConsPart.dsdepentit
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgriddepenCalcCellColors
          OnDblClick = dbgriddepenDblClick
          IndicatorColor = icBlack
        end
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
      object PanelDadosFuncionais: TPanel
        Left = 0
        Top = 18
        Width = 793
        Height = 259
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
          Left = 656
          Top = 45
          Width = 104
          Height = 13
          Cursor = crNo
          Caption = 'Data de Demissão'
        end
        object lblNomeFilial: TLabel
          Left = 7
          Top = 83
          Width = 47
          Height = 13
          Cursor = crNo
          Caption = 'Lotação'
        end
        object lblSitFunc: TLabel
          Left = 286
          Top = 165
          Width = 237
          Height = 13
          Cursor = crNo
          Caption = 'Situação do Empregado na Patrocinadora'
        end
        object lblSalarioTotal: TLabel
          Left = 7
          Top = 125
          Width = 73
          Height = 13
          Cursor = crNo
          Caption = 'Salário Total'
        end
        object Label102: TLabel
          Left = 770
          Top = 211
          Width = 57
          Height = 13
          Cursor = crNo
          Caption = 'Ex-Diretor'
          Enabled = False
          Visible = False
        end
        object Label67: TLabel
          Left = 9
          Top = 210
          Width = 88
          Height = 13
          Cursor = crNo
          Caption = 'Dt. Início INSS'
        end
        object Label69: TLabel
          Left = 108
          Top = 210
          Width = 28
          Height = 13
          Cursor = crNo
          Caption = 'DDD'
        end
        object Label68: TLabel
          Left = 150
          Top = 210
          Width = 82
          Height = 13
          Cursor = crNo
          Caption = 'Tel. Comercial'
        end
        object DBText9: TDBText
          Left = 8
          Top = 165
          Width = 273
          Height = 13
          DataField = 'NOMEVALORBASE1'
          DataSource = dtmConsPart.dspartgeral
        end
        object DBText10: TDBText
          Left = 541
          Top = 165
          Width = 239
          Height = 13
          DataField = 'NOMEVALORBASE2'
          DataSource = dtmConsPart.dspartgeral
        end
        object DBText11: TDBText
          Left = 543
          Top = 210
          Width = 237
          Height = 13
          DataField = 'NOMEVALORBASE3'
          DataSource = dtmConsPart.dspartgeral
        end
        object lbNomeacao: TLabel
          Left = 257
          Top = 127
          Width = 92
          Height = 13
          Cursor = crNo
          Caption = 'Data Nomeação'
        end
        object lbExoneracao: TLabel
          Left = 376
          Top = 127
          Width = 117
          Height = 13
          Cursor = crNo
          Caption = 'Data de Exoneração'
        end
        object LblLotacaoF: TLabel
          Left = 293
          Top = 83
          Width = 86
          Height = 13
          Cursor = crNo
          Caption = 'Lotação Física'
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
          Width = 110
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
          Left = 656
          Top = 59
          Width = 126
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
          Left = 288
          Top = 180
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
          Left = 8
          Top = 141
          Width = 110
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
          Left = 773
          Top = 225
          Width = 103
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'FLGDIRETOR'
          DataSource = dtmConsPart.dspartgeral
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit92: TwwDBEdit
          Left = 7
          Top = 225
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
          Top = 225
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
          Top = 225
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
          Top = 180
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
          Left = 541
          Top = 180
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
          Top = 225
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
        object dbrgrpDiretor: TDBRadioGroup
          Left = 125
          Top = 130
          Width = 127
          Height = 32
          Caption = 'Cargo de Diretoria ?'
          Columns = 2
          DataField = 'TIPOFLGDIRETOR'
          DataSource = dtmConsPart.dspartgeral
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 17
          Values.Strings = (
            '0'
            '1')
        end
        object dbeDataExoneracao: TwwDBEdit
          Left = 376
          Top = 141
          Width = 126
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'DTEXONERACAO'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
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
        object dbeDtNomeacao: TwwDBEdit
          Left = 257
          Top = 141
          Width = 110
          Height = 21
          Cursor = crNo
          Color = clGray
          DataField = 'DTNOMEACAO'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
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
        object dbedLotacaoF: TwwDBEdit
          Left = 291
          Top = 97
          Width = 276
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'LOTACAOFISICA'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
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
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Dados Básicos Funcionais'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
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
        Anchors = [akLeft, akTop, akRight]
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
        Height = 267
        ActivePage = tbsFuncao
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object tbsDet: TTabSheet
          Caption = 'Cargos'
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 239
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
            Height = 239
            Selected.Strings = (
              'CODIGO'#9'15'#9'Código'
              'CARGO'#9'40'#9'Cargo'
              'NIVEL'#9'15'#9'Nível'
              'DATAINICIO'#9'13'#9'Data de~Início'
              'DATAFINAL'#9'13'#9'Data de ~Término'
              'FLGSITPART'#9'24'#9'Situação'
              'DESCMODO'#9'14'#9'Modo'
              'DESCSITCADASTRADA'#9'9'#9'Situação ~Cadastrada'
              'DESCORIGEM'#9'20'#9'Origem'
              'MATRICULA'#9'15'#9'Matrícula')
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
        object tbsAdicConfianca: TTabSheet
          Caption = 'Adicional de Confiança'
          ImageIndex = 8
          object dbgAdicConfianca: TwwDBGrid
            Left = 0
            Top = 0
            Width = 781
            Height = 207
            Selected.Strings = (
              'DATAINICIO'#9'15'#9'Data de ~Início'
              'DATAFINAL'#9'15'#9'Data de ~Término'
              'PERCINCORP'#9'16'#9'Percentual (%)'
              'DESCORIGEM'#9'32'#9'Origem'
              'DESCSITCADASTRADA'#9'16'#9'Situação ~Cadastrada')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmConsPart.dsAdicConfianca
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
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Evolução Funcional'
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
      Caption = 'PgHistoricoFuncional'
      object Label59: TLabel
        Left = 10
        Top = 239
        Width = 217
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (sem Conversão)'
      end
      object Label60: TLabel
        Left = 413
        Top = 239
        Width = 251
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (com Conversão) INSS'
      end
      object lblTempoServico: TLabel
        Left = 236
        Top = 42
        Width = 104
        Height = 13
        Caption = 'Tempo de Serviço'
      end
      object lblHfAnos: TLabel
        Left = 398
        Top = 42
        Width = 28
        Height = 13
        Caption = 'anos'
      end
      object lblHfMes: TLabel
        Left = 488
        Top = 42
        Width = 36
        Height = 13
        Caption = 'meses'
      end
      object lblHfDias: TLabel
        Left = 586
        Top = 42
        Width = 24
        Height = 13
        Caption = 'dias'
      end
      object pnlHstFuncional: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico Funcional'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgridhistfunc: TwwDBGrid
        Left = 8
        Top = 290
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object edtTEMPOSEMCONVERSAO: TEdit
        Left = 9
        Top = 254
        Width = 47
        Height = 21
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtTEMPOSEMCONVERSAOEXT: TEdit
        Left = 59
        Top = 254
        Width = 334
        Height = 21
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtTEMPOSERVCALC: TEdit
        Left = 413
        Top = 254
        Width = 47
        Height = 21
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtTEMPOTOTALEXT: TEdit
        Left = 463
        Top = 254
        Width = 327
        Height = 21
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbeHfAno: TEdit
        Left = 350
        Top = 40
        Width = 45
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object dbeHfMes: TEdit
        Left = 441
        Top = 40
        Width = 45
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
      object dbeHfDia: TEdit
        Left = 538
        Top = 40
        Width = 45
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgRubricasSalariais'
      object wwDBGrid11: TwwDBGrid
        Left = 0
        Top = 100
        Width = 830
        Height = 298
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel28: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 21
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Histórico de Rubricas Salariais - Ativo'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
      object Panel18: TPanel
        Left = 0
        Top = 21
        Width = 830
        Height = 79
        Align = alTop
        TabOrder = 2
        object Label74: TLabel
          Left = 8
          Top = 36
          Width = 100
          Height = 13
          Caption = 'Mês de Cobrança'
        end
        object Label14: TLabel
          Left = 116
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label54: TLabel
          Left = 416
          Top = 36
          Width = 58
          Height = 13
          Caption = 'Proventos'
        end
        object Label159: TLabel
          Left = 530
          Top = 36
          Width = 61
          Height = 13
          Caption = 'Descontos'
        end
        object Label160: TLabel
          Left = 649
          Top = 36
          Width = 44
          Height = 13
          Caption = 'Líquido'
        end
        object Label211: TLabel
          Left = 8
          Top = 1
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object dblkMesCobranca: TwwDBLookupCombo
          Left = 6
          Top = 52
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
          Top = 52
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
          Top = 52
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
          Top = 52
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
          Top = 52
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
        object dbMatriculas: TwwDBLookupCombo
          Left = 6
          Top = 14
          Width = 103
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MATRICULA'#9'15'#9'MATRICULA'#9'F')
          LookupTable = dtmConsPart.QryMatriculas
          LookupField = 'IDPESSOA'
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dbMatriculasChange
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgEventosPrevidenciarios'
      object sptEventosPrev: TSplitter
        Left = 0
        Top = 157
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        Width = 830
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
          Width = 826
          Height = 117
          Selected.Strings = (
            'NOME'#9'40'#9'Evento Gerador'
            'MATRICULA'#9'10'#9'Matrícula'
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
          Font.Height = -12
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
        Top = 160
        Width = 830
        Height = 206
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
          Left = 663
          Top = 19
          Width = 165
          Height = 185
          Align = alRight
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
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
            Width = 67
            Height = 39
            Caption = 'Novas Contribuições Associadas'
            WordWrap = True
          end
          object Label17: TLabel
            Left = 33
            Top = 14
            Width = 67
            Height = 39
            Caption = 'Contribuições Suspensas de Cobrança'
            WordWrap = True
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 19
          Width = 661
          Height = 185
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 1
          object dbgHstContFechado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 661
            Height = 185
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
            Font.Height = -12
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
        Width = 813
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
        Width = 813
        Height = 347
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
        TitleFont.Height = -12
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
        Width = 813
        Height = 347
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.dsFiario
        PanelHeight = 115
        PanelWidth = 796
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
        Width = 813
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
        Width = 813
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
        Width = 813
        Height = 347
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
        TitleFont.Height = -12
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
        Width = 830
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
        TitleFont.Height = -12
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
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
      object wwDBGrid7: TwwDBGrid
        Left = 397
        Top = 37
        Width = 386
        Height = 39
        Selected.Strings = (
          'FLGRECEBIDO'#9'2'#9'Recebido'#9'F'
          'DATARECEB'#9'13'#9'Data Recebimento'#9'F'
          'NOMEDOCUMENTO'#9'100'#9'Documento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight]
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
        TitleFont.Height = -12
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
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvLowered
        Caption = 'Documentos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
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
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 5
      end
      object wwDBGrid9: TwwDBGrid
        Left = 2
        Top = 176
        Width = 391
        Height = 151
        Selected.Strings = (
          'NOME'#9'50'#9'Benefício\Serviço'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dtmConsPart.DsRubXBeneficio
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
        Height = 151
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
        Anchors = [akLeft, akTop, akRight, akBottom]
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
        TitleFont.Height = -12
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
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvLowered
        Caption = 'Histórico de Movimentacão da RUBS'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
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
        Anchors = [akLeft, akTop, akRight]
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
          5C706172645C625C66305C6673313820444252696368456469744F42535C7061
          720D0A7D0D0A00}
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesSituacaoAtual'
      object dbgrdSitAtualTit: TDBCtrlGrid
        Left = 0
        Top = 18
        Width = 830
        Height = 348
        Align = alClient
        ColCount = 1
        DataSource = dtmConsPart.DsContribSitAtual
        PanelHeight = 116
        PanelWidth = 813
        TabOrder = 0
        RowCount = 3
        object bvlSitAtualTit: TBevel
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
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contribuições / Situação Atual / Titular'
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
      Caption = 'PgContribuicoesHistoricoPrevidenciario'
      object Label202: TLabel
        Left = 8
        Top = 23
        Width = 128
        Height = 13
        Caption = 'Mês Referência Inicial'
      end
      object Label203: TLabel
        Left = 151
        Top = 23
        Width = 121
        Height = 13
        Caption = 'Mês Referência Final'
      end
      object Label204: TLabel
        Left = 288
        Top = 23
        Width = 126
        Height = 13
        Caption = 'Nome da Contribuição'
      end
      object Label205: TLabel
        Left = 579
        Top = 23
        Width = 125
        Height = 13
        Caption = 'Data Última Alteração'
      end
      object Label206: TLabel
        Left = 717
        Top = 24
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Panel22: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        Top = 72
        Width = 790
        Height = 289
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
          'VALOROP1'#9'10'#9'Percentual de Contrib.'#9'F'
          'VALOROP2'#9'10'#9'Valor Opção 2'#9'F'
          'VALOROP3'#9'10'#9'Valor Opção 3'#9'F'
          'PARCELA'#9'10'#9'Prazo'#9'F'
          'NOME_2'#9'20'#9'Tipo de Recurso'#9'F'
          'ORIGEMRECURSO'#9'100'#9'Origem do Recurso'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DtmconsPart1.dscontribprev
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
      object dbMesReferenciaIni: TwwDBLookupCombo
        Left = 8
        Top = 40
        Width = 127
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DtmconsPart1.QryMesCobranca
        LookupField = 'MESCOBRANCA'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbMesReferenciaIniChange
      end
      object dbMesReferenciaFim: TwwDBLookupCombo
        Left = 151
        Top = 40
        Width = 123
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DtmconsPart1.QryMesCobranca
        LookupField = 'MESCOBRANCA'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbMesReferenciaFimChange
      end
      object dbNomeContribuicao: TwwDBLookupCombo
        Left = 288
        Top = 40
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DtmconsPart1.QryContribuicao
        LookupField = 'NOME'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbNomeContribuicaoChange
      end
      object edtDataUltAlteracao: TEdit
        Left = 578
        Top = 39
        Width = 124
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object edtPercentual: TEdit
        Left = 717
        Top = 39
        Width = 64
        Height = 21
        Enabled = False
        TabOrder = 6
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
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Saldo de Res. do Participante: R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
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
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = 'Saldo de Res. de Controle: R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 813
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
        Width = 813
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
        TitleFont.Height = -12
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
        Top = 83
        Width = 830
        Height = 289
        ControlType.Strings = (
          'OBSERVACAO;RichEdit;DBRichHistReservaObs')
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
          'NOMECONTRIB'#9'40'#9'Contribuição'
          'PATRO'#9'60'#9'Patrocinadora'
          'OBSERVACAO'#9'50'#9'Observação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsHistReserva
        EditCalculated = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
        Width = 830
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
        Width = 830
        Height = 64
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
        object chkTodasPatro: TCheckBox
          Left = 12
          Top = 42
          Width = 229
          Height = 17
          Caption = 'Exibir todas as patrocinadoras'
          TabOrder = 3
          OnClick = chkTodasPatroClick
        end
      end
      object pnlSaldoHstAlimentacao: TPanel
        Left = 0
        Top = 372
        Width = 830
        Height = 26
        Align = alBottom
        TabOrder = 3
        object LblTotalControle: TLabel
          Left = 554
          Top = 6
          Width = 232
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Saldo Total de Res. de Controle R$ 0,00'
        end
        object lblTotal: TLabel
          Left = 23
          Top = 6
          Width = 115
          Height = 13
          Anchors = []
          Caption = 'Saldo Total R$ 0,00'
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
        Width = 813
        Height = 347
        Selected.Strings = (
          'NUMEROPROCESSO'#9'10'#9'Núm.~Processo CM'
          'NUMPROCINSS'#9'15'#9'Núm.~Processo INSS'
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
          'VALORCOTAS'#9'10'#9'Valor em Cotas'
          'PERCENTUAL'#9'10'#9'Percentual')
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel33: TPanel
        Left = 0
        Top = 0
        Width = 813
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
        Width = 830
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
        Width = 789
        Height = 366
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 1
        DataSource = dtmConsPart.DsSituacaoAtualBenef
        PanelHeight = 366
        PanelWidth = 772
        TabOrder = 1
        RowCount = 1
        object Bevel4: TBevel
          Left = 6
          Top = 6
          Width = 760
          Height = 356
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object Label136: TLabel
          Left = 14
          Top = 8
          Width = 100
          Height = 13
          Caption = 'Número Processo'
        end
        object Label137: TLabel
          Left = 117
          Top = 8
          Width = 51
          Height = 13
          Caption = 'NB INSS'
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
          Width = 128
          Height = 13
          Caption = 'Situação do Benefício'
        end
        object Label140: TLabel
          Left = 122
          Top = 43
          Width = 151
          Height = 13
          Caption = 'Tipo de Pgto do Benefício'
        end
        object lblDIP: TLabel
          Left = 378
          Top = 43
          Width = 22
          Height = 13
          Caption = 'DIP'
        end
        object Label142: TLabel
          Left = 14
          Top = 82
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object Label143: TLabel
          Left = 576
          Top = 43
          Width = 110
          Height = 13
          Caption = 'Data Requerimento'
        end
        object Label144: TLabel
          Left = 473
          Top = 43
          Width = 94
          Height = 13
          Caption = 'Data Concessão'
        end
        object lblBSDIB: TLabel
          Left = 105
          Top = 121
          Width = 42
          Height = 13
          Caption = 'BS DIB'
        end
        object Label148: TLabel
          Left = 14
          Top = 121
          Width = 52
          Height = 13
          Caption = 'Val. SRB'
        end
        object Label149: TLabel
          Left = 231
          Top = 82
          Width = 84
          Height = 13
          Caption = 'Último Preparo'
        end
        object Label150: TLabel
          Left = 328
          Top = 82
          Width = 90
          Height = 13
          Caption = 'Último Reajuste'
        end
        object lblFormaPagamento: TLabel
          Left = 441
          Top = 121
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object Label157: TLabel
          Left = 429
          Top = 82
          Width = 70
          Height = 13
          Caption = 'DIB Anterior'
        end
        object Label158: TLabel
          Left = 544
          Top = 82
          Width = 137
          Height = 13
          Caption = 'Valor Benefício Anterior'
        end
        object Label196: TLabel
          Left = 105
          Top = 82
          Width = 110
          Height = 13
          Caption = 'Data Encerramento'
        end
        object lblBeneficioInicial: TLabel
          Left = 290
          Top = 121
          Width = 94
          Height = 13
          Caption = 'Benefício Inicial'
        end
        object Label201: TLabel
          Left = 14
          Top = 43
          Width = 95
          Height = 13
          Caption = '% Grupo Familiar'
        end
        object lblDIB: TLabel
          Left = 284
          Top = 43
          Width = 22
          Height = 13
          Caption = 'DIB'
        end
        object lblFABDIB: TLabel
          Left = 199
          Top = 121
          Width = 49
          Height = 13
          Caption = 'FAB DIB'
        end
        object lblValorAtualBS: TLabel
          Left = 14
          Top = 160
          Width = 83
          Height = 13
          Caption = 'Valor Atual BS'
        end
        object lblValorTotalBS: TLabel
          Left = 102
          Top = 160
          Width = 83
          Height = 13
          Caption = 'Valor Total BS'
        end
        object lblValorAtualFAB: TLabel
          Left = 197
          Top = 160
          Width = 90
          Height = 13
          Caption = 'Valor Atual FAB'
        end
        object lblValorTotalFAB: TLabel
          Left = 292
          Top = 160
          Width = 90
          Height = 13
          Caption = 'Valor Total FAB'
        end
        object lblValorAtual: TLabel
          Left = 386
          Top = 160
          Width = 63
          Height = 13
          Caption = 'Valor Atual'
        end
        object lblValorTotal: TLabel
          Left = 479
          Top = 160
          Width = 63
          Height = 13
          Caption = 'Valor Total'
        end
        object lblCalcDeficit: TLabel
          Left = 573
          Top = 160
          Width = 134
          Height = 13
          Caption = 'Base Cálculo do Déficit'
        end
        object DBEdNumProcCM: TwwDBEdit
          Left = 12
          Top = 21
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
          Left = 115
          Top = 21
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
          Top = 21
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
          Top = 21
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
          Left = 120
          Top = 58
          Width = 153
          Height = 21
          DataField = 'TIPOPAGBENEF'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit62: TwwDBEdit
          Left = 377
          Top = 58
          Width = 86
          Height = 21
          DataField = 'DATAINICIOPAG'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit63: TwwDBEdit
          Left = 12
          Top = 97
          Width = 86
          Height = 21
          DataField = 'DATAFINAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit64: TwwDBEdit
          Left = 574
          Top = 58
          Width = 86
          Height = 21
          DataField = 'DATAREQUERIMENTO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit65: TwwDBEdit
          Left = 471
          Top = 58
          Width = 98
          Height = 21
          DataField = 'DATACONCESSAO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 11
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedBSDIB: TwwDBEdit
          Left = 103
          Top = 136
          Width = 86
          Height = 21
          DataField = 'BSDIB'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit69: TwwDBEdit
          Left = 12
          Top = 136
          Width = 86
          Height = 21
          DataField = 'VALORSRB'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 13
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit70: TwwDBEdit
          Left = 229
          Top = 97
          Width = 86
          Height = 21
          DataField = 'ULTMESPREPARO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 14
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit71: TwwDBEdit
          Left = 326
          Top = 97
          Width = 86
          Height = 21
          DataField = 'ULTMESREAJUSTE'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 15
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedFormaPagamento: TwwDBEdit
          Left = 439
          Top = 136
          Width = 260
          Height = 21
          DataField = 'FORMAPGTO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 16
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit79: TwwDBEdit
          Left = 427
          Top = 97
          Width = 108
          Height = 21
          DataField = 'DATAINICIOBENEFANT'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 17
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit80: TwwDBEdit
          Left = 542
          Top = 97
          Width = 111
          Height = 21
          DataField = 'VALORBENEFANT'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 18
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit36: TwwDBEdit
          Left = 104
          Top = 97
          Width = 86
          Height = 21
          DataField = 'DATAENCERRAMENTO'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedBeneficioInicial: TwwDBEdit
          Left = 290
          Top = 136
          Width = 138
          Height = 21
          DataField = 'VALBENEFINICIAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit127: TwwDBEdit
          Left = 12
          Top = 58
          Width = 93
          Height = 21
          DataField = 'PERCGRUPOFAMILIAR'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object pnlDEC: TPanel
          Left = 8
          Top = 279
          Width = 753
          Height = 77
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 19
          object lblDtEntrConv: TLabel
            Left = 19
            Top = 40
            Width = 169
            Height = 13
            Caption = 'Data de Entrada no Convênio'
          end
          object lblServAno: TLabel
            Left = 523
            Top = 58
            Width = 28
            Height = 13
            Caption = 'anos'
          end
          object lblServMes: TLabel
            Left = 601
            Top = 58
            Width = 36
            Height = 13
            Caption = 'meses'
          end
          object lblServDia: TLabel
            Left = 684
            Top = 58
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object lblTempoServ: TLabel
            Left = 366
            Top = 58
            Width = 104
            Height = 13
            Caption = 'Tempo de Serviço'
          end
          object Label155: TLabel
            Left = 19
            Top = 2
            Width = 57
            Height = 13
            Caption = 'RMI INSS'
          end
          object Label145: TLabel
            Left = 117
            Top = 2
            Width = 55
            Height = 13
            Caption = 'DIB INSS'
          end
          object dbeDtEtnrada: TwwDBEdit
            Left = 17
            Top = 55
            Width = 87
            Height = 21
            DataField = 'DEC'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbcbBenef142: TDBCheckBox
            Left = 215
            Top = 58
            Width = 122
            Height = 17
            Caption = 'Benefício Lei 142'
            DataField = 'BENEFLEI142'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbeServAnos: TwwDBEdit
            Left = 476
            Top = 55
            Width = 43
            Height = 21
            DataField = 'TEMPOSERVICOANOS'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeServMes: TwwDBEdit
            Left = 557
            Top = 55
            Width = 39
            Height = 21
            DataField = 'TEMPOSERVICOMES'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeServDias: TwwDBEdit
            Left = 642
            Top = 55
            Width = 38
            Height = 21
            DataField = 'TEMPOSERVICODIAS'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit78: TwwDBEdit
            Left = 17
            Top = 16
            Width = 70
            Height = 21
            DataField = 'VLRINFINSS'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit66: TwwDBEdit
            Left = 115
            Top = 16
            Width = 86
            Height = 21
            DataField = 'DATAINICIOINSS'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbchkPagoConvenio: TDBCheckBox
            Left = 215
            Top = 18
            Width = 169
            Height = 17
            Caption = 'Pago no Convênio INSS'
            DataField = 'FLGPAGAINSS'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object wwDBEdit14: TwwDBEdit
          Left = 282
          Top = 58
          Width = 86
          Height = 21
          DataField = 'DATAINICIOBENEF'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 20
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedFABDIB: TwwDBEdit
          Left = 197
          Top = 136
          Width = 86
          Height = 21
          DataField = 'FABDIB'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 21
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorAtualBS: TwwDBEdit
          Left = 12
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VLRBSATUAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 22
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorTotalBS: TwwDBEdit
          Left = 100
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VLRBSTOTAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 23
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorAtualFAB: TwwDBEdit
          Left = 195
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VLRFABATUAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 24
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorTotalFAB: TwwDBEdit
          Left = 290
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VLRFABTOTAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 25
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorAtual: TwwDBEdit
          Left = 384
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VALORATUAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 26
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorTotal: TwwDBEdit
          Left = 477
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VALORTOTAL'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 27
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedCalcDeficit: TwwDBEdit
          Left = 571
          Top = 175
          Width = 86
          Height = 21
          DataField = 'VLRBASEDEFICIT'
          DataSource = dtmConsPart.DsSituacaoAtualBenef
          ReadOnly = True
          TabOrder = 28
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object pnlOpcao: TPanel
          Left = 8
          Top = 239
          Width = 753
          Height = 39
          BevelOuter = bvNone
          TabOrder = 29
          object lblValorOpcao1: TDBText
            Left = 6
            Top = 1
            Width = 199
            Height = 13
            DataField = 'NOMEVALORBASE1'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
          end
          object lblValorOpcao2: TDBText
            Left = 232
            Top = 1
            Width = 199
            Height = 13
            DataField = 'NOMEVALORBASE2'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
          end
          object lblValorOpcao3: TDBText
            Left = 452
            Top = 1
            Width = 199
            Height = 13
            DataField = 'NOMEVALORBASE3'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
          end
          object dbedValorOpcao1: TwwDBEdit
            Left = 4
            Top = 16
            Width = 199
            Height = 21
            DataField = 'VALORBASE1'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedValorOpcao2: TwwDBEdit
            Left = 230
            Top = 16
            Width = 199
            Height = 21
            DataField = 'VALORBASE2'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedValorOpcao3: TwwDBEdit
            Left = 450
            Top = 16
            Width = 199
            Height = 21
            DataField = 'VALORBASE3'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object gbTitular: TGroupBox
          Left = 12
          Top = 198
          Width = 746
          Height = 37
          TabOrder = 30
          object lblBSTitular: TLabel
            Left = 7
            Top = 15
            Width = 90
            Height = 13
            Caption = 'Valor BS Titular'
          end
          object lblFABTitular: TLabel
            Left = 196
            Top = 16
            Width = 97
            Height = 13
            Caption = 'Valor FAB Titular'
          end
          object lblTotalTitular: TLabel
            Left = 389
            Top = 17
            Width = 103
            Height = 13
            Caption = 'Valor Total Titular'
          end
          object lblPercPensao: TLabel
            Left = 588
            Top = 18
            Width = 109
            Height = 13
            Caption = '% Aplicado Pensão'
          end
          object dbedValorBSTit: TwwDBEdit
            Left = 101
            Top = 10
            Width = 80
            Height = 21
            Color = clSilver
            DataField = 'BSTITULAR'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedValorFABTit: TwwDBEdit
            Left = 296
            Top = 10
            Width = 80
            Height = 21
            Color = clSilver
            DataField = 'FABTITULAR'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedValorTotalTit: TwwDBEdit
            Left = 495
            Top = 10
            Width = 80
            Height = 21
            Color = clSilver
            DataField = 'VLRTOTALTITULAR'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedPercPensao: TwwDBEdit
            Left = 702
            Top = 10
            Width = 36
            Height = 21
            Color = clSilver
            DataField = 'PERC_PENSAO'
            DataSource = dtmConsPart.DsSituacaoAtualBenef
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
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
        Width = 830
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
        Width = 830
        Height = 379
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
          'VALOROP1'#9'11'#9'Valor Opção 1'
          'VALOROP2'#9'11'#9'Valor Opção 2'
          'VALOROP3'#9'11'#9'Valor Opção 3'
          'VALORINTEGRAL'#9'10'#9'Valor Integral'
          'VALORSRB'#9'10'#9'Valor SRB'
          'VALORTOTAL'#9'10'#9'Valor Total'
          'PATROCINADORA'#9'60'#9'Patrocinadora'
          'PLANO'#9'50'#9'Plano'
          'IDHSTFOLHABENEF'#9'13'#9'Versão da Folha'
          'FLGMANUAL'#9'12'#9'Entrada Manual'
          'PERCENTUAL'#9'10'#9'Percentual'
          'FLGPAGAINSS'#9'20'#9'Convênio~INSS')
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
        TitleFont.Height = -12
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
        Width = 813
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
        Width = 813
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
        Width = 813
        Height = 245
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
        Width = 813
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
        TitleFont.Height = -12
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
        Width = 813
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
        Width = 813
        Height = 347
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
        TitleFont.Height = -12
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
        Anchors = [akLeft, akTop, akRight]
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
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clInfoBk
        DataSource = dtmConsPart.dsEvolFuncao
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgrdCompoDIB: TwwDBGrid
        Left = 459
        Top = 19
        Width = 354
        Height = 347
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
        Font.Height = -12
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
        Width = 813
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
      object sptEmprestimo: TSplitter
        Left = 0
        Top = 135
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Empréstimos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid4: TwwDBGrid
        Left = 0
        Top = 18
        Width = 830
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid5: TwwDBGrid
        Left = 0
        Top = 156
        Width = 830
        Height = 210
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel11: TPanel
        Left = 0
        Top = 138
        Width = 830
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico'
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
      Caption = 'PgBeneficiariosPrevidenciarios'
      object sptBenefPrev: TSplitter
        Left = 0
        Top = 110
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object dbgridpartprev: TwwDBGrid
        Left = 0
        Top = 19
        Width = 830
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        TabOrder = 1
      end
      object pnlDadosBenefPrev: TPanel
        Left = 0
        Top = 113
        Width = 830
        Height = 253
        Align = alClient
        TabOrder = 2
        object Label55: TLabel
          Left = 17
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label56: TLabel
          Left = 135
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Logradouro'
        end
        object Label57: TLabel
          Left = 531
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label64: TLabel
          Left = 588
          Top = 6
          Width = 76
          Height = 13
          Caption = 'Complemento'
        end
        object Label61: TLabel
          Left = 541
          Top = 45
          Width = 40
          Height = 13
          Caption = 'Estado'
        end
        object Label62: TLabel
          Left = 331
          Top = 45
          Width = 40
          Height = 13
          Caption = 'Cidade'
        end
        object Label65: TLabel
          Left = 219
          Top = 45
          Width = 25
          Height = 13
          Caption = 'CEP'
        end
        object Label66: TLabel
          Left = 242
          Top = 83
          Width = 63
          Height = 13
          Caption = 'Recebedor'
        end
        object Label70: TLabel
          Left = 168
          Top = 83
          Width = 26
          Height = 13
          Caption = 'Tipo'
        end
        object Label71: TLabel
          Left = 60
          Top = 83
          Width = 98
          Height = 13
          Caption = 'Número Telefone'
        end
        object Label72: TLabel
          Left = 17
          Top = 83
          Width = 28
          Height = 13
          Caption = 'DDD'
        end
        object Label134: TLabel
          Left = 14
          Top = 45
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object Label79: TLabel
          Left = 633
          Top = 82
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object DBEdit36: TDBEdit
          Left = 17
          Top = 22
          Width = 113
          Height = 21
          Color = clInfoBk
          DataField = 'DOCBEN'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit41: TDBEdit
          Left = 135
          Top = 22
          Width = 391
          Height = 21
          Color = clInfoBk
          DataField = 'LOGRADOURO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit42: TDBEdit
          Left = 531
          Top = 22
          Width = 52
          Height = 21
          Color = clInfoBk
          DataField = 'NUMERO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit45: TDBEdit
          Left = 588
          Top = 22
          Width = 193
          Height = 21
          Color = clInfoBk
          DataField = 'COMPLEMENTO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit32: TDBEdit
          Left = 542
          Top = 58
          Width = 239
          Height = 21
          Color = clInfoBk
          DataField = 'NOMEESTADO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit29: TDBEdit
          Left = 329
          Top = 58
          Width = 207
          Height = 21
          Color = clInfoBk
          DataField = 'NOME'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit5: TDBEdit
          Left = 219
          Top = 58
          Width = 104
          Height = 21
          Color = clInfoBk
          DataField = 'CEP'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit6: TDBEdit
          Left = 17
          Top = 58
          Width = 196
          Height = 21
          Color = clInfoBk
          DataField = 'BAIRRO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit33: TDBEdit
          Left = 17
          Top = 96
          Width = 36
          Height = 21
          Color = clInfoBk
          DataField = 'DDD'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit34: TDBEdit
          Left = 60
          Top = 96
          Width = 101
          Height = 21
          Color = clInfoBk
          DataField = 'NUMEROTEL'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit35: TDBEdit
          Left = 169
          Top = 96
          Width = 64
          Height = 21
          Color = clInfoBk
          DataField = 'TIPO'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit43: TDBEdit
          Left = 242
          Top = 96
          Width = 381
          Height = 21
          Color = clInfoBk
          DataField = 'NOMERESP'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 11
        end
        object wwDBGrid8: TwwDBGrid
          Left = 17
          Top = 126
          Width = 765
          Height = 73
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
          TabOrder = 12
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object DBEdit37: TDBEdit
          Left = 633
          Top = 96
          Width = 148
          Height = 21
          Color = clInfoBk
          DataField = 'NUMDOCBEN'
          DataSource = DtmconsPart1.dspartprev
          Enabled = False
          ReadOnly = True
          TabOrder = 13
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgContribuicoesHistoricoAssistencial'
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 813
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
        Width = 813
        Height = 347
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
        TitleFont.Height = -12
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
      Caption = 'PgBeneficiosHistoricoRevisoes'
      object Label50: TLabel
        Left = 8
        Top = 259
        Width = 126
        Height = 13
        Cursor = crNo
        Caption = 'Descrição da Revisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrMovBenef: TwwDBGrid
        Left = 9
        Top = 72
        Width = 794
        Height = 232
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dtmConsPart.dsHistoricoRevisoes
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbmmHMDescricaoRevisao: TDBMemo
        Left = 9
        Top = 303
        Width = 794
        Height = 93
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'DESCREVISAO'
        DataSource = dtmConsPart.dsHistoricoRevisoes
        ReadOnly = True
        TabOrder = 4
      end
      object Panel37: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Revisões'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Panel38: TPanel
        Left = 0
        Top = 19
        Width = 830
        Height = 46
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label47: TLabel
          Left = 9
          Top = 3
          Width = 56
          Height = 13
          Cursor = crNo
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 378
          Top = 3
          Width = 22
          Height = 13
          Cursor = crNo
          Caption = 'DIP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 522
          Top = 3
          Width = 22
          Height = 13
          Cursor = crNo
          Caption = 'DIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedtHMDIP: TwwDBEdit
          Left = 378
          Top = 18
          Width = 133
          Height = 21
          Color = clGray
          DataField = 'DIP'
          DataSource = dtmConsPart.dsHistoricoRevisoes
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedtHMDIB: TwwDBEdit
          Left = 522
          Top = 18
          Width = 133
          Height = 21
          Color = clGray
          DataField = 'DIB'
          DataSource = dtmConsPart.dsHistoricoRevisoes
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object cbHistoricoRevisoesBeneficios: TComboBox
          Left = 9
          Top = 18
          Width = 363
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
          OnChange = cbHistoricoRevisoesBeneficiosChange
        end
      end
      object pnlHistoricoRevisoesBeneficios: TPanel
        Left = 8
        Top = 23
        Width = 793
        Height = 374
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'Nenhum registro no histórico de revisão encontrado!'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgPlanos'
      object sptPlanos: TSplitter
        Left = 0
        Top = 161
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object pnlPrevidenciario: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Plano Previdenciário do Titular'
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
        Top = 51
        Width = 830
        Height = 110
        Selected.Strings = (
          'MATRICULA'#9'15'#9'Matrícula'
          'NOME'#9'30'#9'Plano Previdenciário'
          'PATROCINADORA'#9'30'#9'Patrocinadora'
          'SITPART'#9'20'#9'Situação~ na Fundação'
          'DESCRICAO'#9'20'#9'Situação~ no Plano Previdenciário'
          'FLGFITESPECIAL'#9'10'#9'Situação~Especial'
          'INSCRICAONUMERO'#9'10'#9'Inscrição Nº'
          'DTINICIOINSC'#9'10'#9'Primeira ~Inscrição em'
          'INSCRICAODATA'#9'10'#9'Inscrição~ Atual em'
          'DATACANCELAMENTO'#9'12'#9'Cancelado em '
          'DATAINICIOMANUT'#9'18'#9'Início~ Manutenção'
          'SALPARTICIPACAO'#9'13'#9'Salário~ de Participação'
          'SALMANTIDO'#9'12'#9'Salário~de Manutenção'
          'DATAOPCAOIR'#9'18'#9'Data~Opção de IR'
          'TIPOOPCAOIR'#9'17'#9'Tabela~Opção de IR')
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object pnlAssistencial: TPanel
        Left = 0
        Top = 164
        Width = 830
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
        Top = 183
        Width = 830
        Height = 183
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel64: TPanel
        Left = 0
        Top = 19
        Width = 830
        Height = 32
        Align = alTop
        TabOrder = 4
        object Label197: TLabel
          Left = 16
          Top = 13
          Width = 83
          Height = 13
          Caption = 'Plano Contábil'
        end
        object dbedPlanoContab: TwwDBEdit
          Left = 104
          Top = 6
          Width = 405
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'PLANPCONTAB'
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
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pgAcaoJudicial'
      object pnlCompensacao: TPanel
        Left = 0
        Top = 51
        Width = 830
        Height = 347
        Align = alClient
        Enabled = False
        TabOrder = 3
        object Panel49: TPanel
          Left = 1
          Top = 1
          Width = 828
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
          Height = 281
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
          Height = 281
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
        Width = 830
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
        Width = 830
        Height = 347
        Align = alClient
        BevelInner = bvRaised
        Enabled = False
        TabOrder = 1
        object Panel42: TPanel
          Left = 2
          Top = 88
          Width = 826
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
          Width = 826
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
                LookupTable = dtmConsPart.qryBanco
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
                LookupTable = dtmConsPart.qryAgencia
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
                LookupTable = dtmConsPart.qryConta
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
                  Left = 3
                  Top = 12
                  Width = 127
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
                  'Ação Judicial em Antecipação de Tutela (Em Liminar)'
                  'Ação Judicial Decisão Definitiva a favor do Contribuinte (Ganha)'
                  'Ação Judicial Julgada Perdida')
              end
            end
          end
        end
        object dbgRegras: TwwDBGrid
          Left = 2
          Top = 138
          Width = 826
          Height = 207
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
          TitleFont.Height = -12
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
        Width = 830
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
              'Equacionamento')
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
          Enabled = False
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
        Anchors = [akLeft, akTop, akRight]
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
        Anchors = [akLeft, akTop, akRight]
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
        Anchors = [akLeft, akTop, akRight]
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
        Width = 813
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
        Anchors = [akLeft, akTop, akRight]
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
        Anchors = [akLeft, akTop, akRight]
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
        Anchors = [akLeft, akTop, akRight]
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
        Width = 813
        Height = 346
        Align = alClient
        ColCount = 1
        DataSource = DtmconsPart1.dsParcelamento
        Enabled = False
        PanelHeight = 173
        PanelWidth = 796
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
          Font.Height = -12
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
        Width = 813
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
        Width = 813
        Height = 348
        Selected.Strings = (
          'DESCRICAO'#9'37'#9'Parâmetro'
          'IDPARAM'#9'10'#9'Código'
          'DATAINICIO'#9'10'#9'Data Início'
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel60: TPanel
        Left = 0
        Top = 0
        Width = 813
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
        Top = 199
        Width = 813
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid14: TwwDBGrid
        Left = 0
        Top = 19
        Width = 813
        Height = 161
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
        Align = alClient
        DataSource = DtmconsPart1.dsVidaFundacao
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel63: TPanel
        Left = 0
        Top = 180
        Width = 813
        Height = 19
        Align = alBottom
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
        Width = 813
        Height = 19
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
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgPlanosBenef'
      object wwDBGrid15: TwwDBGrid
        Left = 0
        Top = 19
        Width = 813
        Height = 347
        Selected.Strings = (
          'PLANOPREV'#9'46'#9'Plano Previdenciário'
          'DATAINSCRICAO'#9'21'#9'Data Inicio'
          'DATACANCELAMENTO'#9'19'#9'Data Final')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dsPlanPrevBenef
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel65: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Plano Previdenciário Beneficiário'
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
      Caption = 'PgContrSitAtualBeneficiario'
      object Panel66: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Contribuições / Situação Aual / Beneficiário'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid16: TwwDBGrid
        Left = 0
        Top = 19
        Width = 813
        Height = 347
        Selected.Strings = (
          'NOME'#9'50'#9'Contribuição'#9'F'
          'SITCOBRANCA'#9'9'#9'Situação da Cobrança'
          'DATAINICIO'#9'18'#9'Data de Início'
          'DATAFINAL'#9'18'#9'Data Final')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DtmconsPart1.dsContribSitAtualBeneficiario
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
      Caption = 'pgHistoricodePercentual'
      object Panel67: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Percentual de Contribuição'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid17: TwwDBGrid
        Left = 0
        Top = 19
        Width = 813
        Height = 347
        Selected.Strings = (
          'NOME'#9'66'#9'Contribuição'
          'DTINICIO'#9'14'#9'Data Alteração'
          'DTFIM'#9'13'#9'Data Fim'
          'PERCENTUAL'#9'11'#9'Percentual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsHistoricoPercentual
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
      Caption = 'pgCompraCarenciaTempo'
      object Panel68: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Compra de Carência de Tempo'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid18: TwwDBGrid
        Left = 0
        Top = 26
        Width = 790
        Height = 261
        Selected.Strings = (
          'DATACOMPRA'#9'15'#9'Data da Compra'#9'F'
          'QTDEMESES'#9'15'#9'Quantidade de Meses~Comprados'#9'F'
          'VALORPATROCINADORA'#9'15'#9'Valor da Patrocinadora'#9'F'
          'VALORPATROCINANTE'#9'15'#9'Valor da Patrocinante'#9'F'
          'VALORTOTAL'#9'35'#9'Valor Total'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsCpCarencia
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
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
      Caption = 'PgBeneficiosHistoricoMovimentacoes'
      object sptHstMovimentacao: TSplitter
        Left = 0
        Top = 139
        Width = 830
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel69: TPanel
        Left = 0
        Top = 142
        Width = 401
        Height = 224
        Align = alLeft
        TabOrder = 0
        object Label52: TLabel
          Left = 15
          Top = 5
          Width = 68
          Height = 13
          Caption = 'Beneficiário'
        end
        object Label53: TLabel
          Left = 15
          Top = 44
          Width = 98
          Height = 13
          Caption = 'Data Nascimento'
        end
        object Label207: TLabel
          Left = 124
          Top = 44
          Width = 142
          Height = 13
          Caption = 'Situação do Dependente'
        end
        object Label208: TLabel
          Left = 15
          Top = 82
          Width = 65
          Height = 13
          Caption = 'Parentesco'
        end
        object Label209: TLabel
          Left = 298
          Top = 82
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object Label210: TLabel
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
      object dbgridbeneficios: TwwDBGrid
        Left = 0
        Top = 19
        Width = 830
        Height = 120
        Selected.Strings = (
          'NOME'#9'43'#9'Benefício'
          'DESCRICAO'#9'10'#9'Situação'
          'VALORATUAL'#9'15'#9'Valor Atual'
          'VALORATUAL_1'#9'10'#9'Valor Atual ~Mov.'
          'VALORATUALANT'#9'10'#9'Valor Atual ~Mov. Ant.'
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
          'DATARECEBRECAD'#9'18'#9'Data de Recebimento~do Recadastramento'
          'VLRBSATUAL'#9'10'#9'Valor Atual BS'
          'VLRBSTOTAL'#9'10'#9'Valor Total BS'
          'VLRFABATUAL'#9'10'#9'Valor Atual FAB'
          'VLRFABTOTAL'#9'10'#9'Valor Total FAB'
          'VLRBASEDEFICIT'#9'10'#9'Base de Cálculo de Déficit')
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
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DbgridMovBenef: TwwDBGrid
        Left = 401
        Top = 142
        Width = 429
        Height = 224
        Selected.Strings = (
          'NOME'#9'30'#9'Beneficiário'
          'DESCMOV'#9'17'#9'Movimento'
          'DESFEZCONCESSAO'#9'3'#9'Desfeito'
          'DESCDESFEZCONCESSAO'#9'17'#9'Movimento Desfeito'
          'DATAFINAL'#9'10'#9'Final'
          'DATAFINALANT'#9'12'#9'Final~Anterior'
          'DATAMOV'#9'12'#9'Data~Movimentação'
          'MOTIVO_RETENCAO'#9'30'#9'Motivo Retenção'
          'DESCEMPRESTIMO'#9'20'#9'Posição do Emprestimo'
          'VALORTOTAL'#9'15'#9'Valor Total do Benefício'
          'VALORTOTALANT'#9'15'#9'Valor Total Anterior do Benefício'
          'VALORATUAL'#9'15'#9'Valor Atual do Benefício'
          'VALORATUALANT'#9'15'#9'Valor Atual Anterior do Benefício'
          'VALORSRB'#9'15'#9'Valor SRB'
          'VALORSRBANT'#9'15'#9'Valor SRB Anterior'
          'DATAINICIO'#9'12'#9'Data Início'
          'DATAINICIOANT'#9'12'#9'Data Início Anterior'
          'IDSITANTERIOR'#9'20'#9'Situação do Benefício Anterior'
          'TRGUSERINCLUSAO'#9'20'#9'Triguer do Usuário de Inclusão'
          'VLRBSATUALANT'#9'10'#9'Vlr BS Atual Ant'
          'VLRBSTOTALANT'#9'10'#9'Vlr BS Total Ant'
          'VLRBSATUALNOVO'#9'10'#9'Vlr BS Atual Novo'
          'VLRBSTOTALNOVO'#9'10'#9'Vlr BS Total Novo'
          'VLRFABATUALANT'#9'10'#9'Vlr FAB Atual Ant'
          'VLRFABTOTALANT'#9'10'#9'Vlr FAB Total Ant'
          'VLRFABATUALNOVO'#9'10'#9'Vlr FAB Atual Novo'
          'VLRFABTOTALNOVO'#9'10'#9'Vlr FAB Total Novo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsMovBenef
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel70: TPanel
        Left = 0
        Top = 0
        Width = 830
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
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PghistSalParticipacao'
      object Panel153: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico de Salário de Participação'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object grdHstSalParticipacao: TwwDBGrid
        Left = 0
        Top = 19
        Width = 830
        Height = 379
        Selected.Strings = (
          'SALCONT'#9'57'#9'Salário de Contribuição'#9'F'
          'SALPART'#9'57'#9'Salário de Participação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.DSHstSalParticipGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnColEnter = grdHstSalParticipacaoColEnter
        OnDrawDataCell = grdHstSalParticipacaoDrawDataCell
        OnDblClick = grdHstSalParticipacaoDblClick
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgHistSRB'
      object pnlHistSRB: TPanel
        Left = 0
        Top = 0
        Width = 813
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Histórico do Salário Real de Benefício'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdHistSRB01: TwwDBGrid
        Left = 0
        Top = 19
        Width = 420
        Height = 346
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dtmConsPart.dsHistSRBGrid01
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
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
        OnCalcCellColors = dbgrdHistSRB01CalcCellColors
        OnDblClick = dbgrdHistSRB01DblClick
        IndicatorColor = icBlack
      end
      object dbgrdHistSRB02: TwwDBGrid
        Left = 419
        Top = 19
        Width = 420
        Height = 346
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dtmConsPart.dsHistSRBGrid02
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnCalcCellColors = dbgrdHistSRB02CalcCellColors
        OnDblClick = dbgrdHistSRB02DblClick
        IndicatorColor = icBlack
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'PgPortabEntrada'
      object dbgrPortabEntrada: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 789
        Height = 334
        ColCount = 1
        DataSource = dtmConsPart.dsPortabEntrada
        PanelHeight = 334
        PanelWidth = 772
        TabOrder = 0
        RowCount = 1
        object bvlBvPortabEntrada: TBevel
          Left = 6
          Top = 5
          Width = 760
          Height = 188
        end
        object grpPortabEntradaOrigem: TGroupBox
          Left = 16
          Top = 12
          Width = 737
          Height = 80
          Caption = 'Entidade de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblPortabEntradaNome: TLabel
            Left = 9
            Top = 24
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object lblPortabEntradacnpj: TLabel
            Left = 359
            Top = 24
            Width = 27
            Height = 13
            Caption = 'CNPJ'
          end
          object lblPortabEntradacnpb: TLabel
            Left = 504
            Top = 24
            Width = 70
            Height = 13
            Caption = 'CNPB/SUSEP'
          end
          object grpPortabEntradaTipo: TGroupBox
            Left = 639
            Top = 12
            Width = 82
            Height = 57
            Caption = 'Tipo'
            TabOrder = 0
            object dbchkPortabEntradaAberta: TDBCheckBox
              Left = 6
              Top = 16
              Width = 57
              Height = 17
              Caption = 'Aberta'
              DataField = 'TIPO'
              DataSource = dtmConsPart.dsPortabEntrada
              TabOrder = 0
              ValueChecked = 'A'
              ValueUnchecked = 'F'
            end
            object dbchkPortabEntradaFechada: TDBCheckBox
              Left = 6
              Top = 34
              Width = 64
              Height = 17
              Caption = 'Fechada'
              DataField = 'TIPO'
              DataSource = dtmConsPart.dsPortabEntrada
              TabOrder = 1
              ValueChecked = 'F'
              ValueUnchecked = 'A'
            end
          end
          object DBEPortabEntradaCNPJ: TwwDBEdit
            Left = 359
            Top = 40
            Width = 138
            Height = 21
            DataField = 'CNPJ'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaNome: TwwDBEdit
            Left = 9
            Top = 40
            Width = 336
            Height = 21
            DataField = 'NOME'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaCNPB: TwwDBEdit
            Left = 506
            Top = 40
            Width = 125
            Height = 21
            DataField = 'CNPBSUSEP'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object grpPortabEntrada: TGroupBox
          Left = 16
          Top = 95
          Width = 737
          Height = 89
          Caption = 'Portabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblPortabEntradaDtReceb: TLabel
            Left = 9
            Top = 24
            Width = 104
            Height = 13
            Caption = 'Data de Recebimento'
          end
          object lblPortabEntradaVlPortado: TLabel
            Left = 139
            Top = 24
            Width = 64
            Height = 13
            Caption = 'Valor Portado'
          end
          object lblPortabEntradaPlano: TLabel
            Left = 269
            Top = 24
            Width = 97
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object lblPortabEntradaMeses: TLabel
            Left = 394
            Top = 24
            Width = 92
            Height = 26
            Alignment = taCenter
            Caption = 'Tempo Vinculação em Meses'
            WordWrap = True
          end
          object lblPortabEntradaDtIR: TLabel
            Left = 624
            Top = 24
            Width = 72
            Height = 13
            Caption = 'Data Opção IR'
          end
          object DBEPortabEntradaDTReceb: TwwDBEdit
            Left = 9
            Top = 40
            Width = 104
            Height = 21
            DataField = 'DATARECEBIMENTO'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaValor: TwwDBEdit
            Left = 138
            Top = 40
            Width = 105
            Height = 21
            DataField = 'VALORPORTADO'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaPlano: TwwDBEdit
            Left = 269
            Top = 40
            Width = 99
            Height = 21
            DataField = 'NOMEPLANO'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaMeses: TwwDBEdit
            Left = 396
            Top = 56
            Width = 88
            Height = 21
            DataField = 'TEMPOMESES'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEPortabEntradaDtIR: TwwDBEdit
            Left = 624
            Top = 40
            Width = 99
            Height = 21
            DataField = 'DATAOPCAOIR'
            DataSource = dtmConsPart.dsPortabEntrada
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object grpPortabEntradaTpIR: TGroupBox
            Left = 517
            Top = 16
            Width = 90
            Height = 57
            Caption = 'Opção IR'
            TabOrder = 5
            object dbchkPortabEntradaRegressivo: TDBCheckBox
              Left = 4
              Top = 16
              Width = 82
              Height = 17
              Caption = 'Regressivo'
              DataField = 'OPCAOIR'
              DataSource = dtmConsPart.dsPortabEntrada
              TabOrder = 0
              ValueChecked = 'R'
              ValueUnchecked = 'P'
            end
            object dbchkPortabEntradaProgressivo: TDBCheckBox
              Left = 4
              Top = 36
              Width = 82
              Height = 17
              Caption = 'Progressivo'
              DataField = 'OPCAOIR'
              DataSource = dtmConsPart.dsPortabEntrada
              TabOrder = 1
              ValueChecked = 'P'
              ValueUnchecked = 'R'
            end
          end
        end
      end
      object pnlPortabEntrada: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Portabilidade/Entrada'
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
      Caption = 'PgPortabSaida'
      object dbgrPortabSaida: TDBCtrlGrid
        Left = 0
        Top = 19
        Width = 789
        Height = 334
        ColCount = 1
        DataSource = dtmConsPart.dsPortabSaida
        PanelHeight = 334
        PanelWidth = 772
        TabOrder = 0
        RowCount = 1
        object bvlPortabSaida: TBevel
          Left = 6
          Top = 5
          Width = 760
          Height = 196
        end
        object grpPortabSaidaEntidadeDestino: TGroupBox
          Left = 16
          Top = 11
          Width = 737
          Height = 108
          Caption = 'Entidade Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblPortabSaidaNome: TLabel
            Left = 24
            Top = 19
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object lblPortabSaidaCnpj: TLabel
            Left = 401
            Top = 19
            Width = 27
            Height = 13
            Caption = 'CNPJ'
          end
          object lblPortabSaidaBeneficio: TLabel
            Left = 24
            Top = 63
            Width = 46
            Height = 13
            Caption = 'Benefício'
          end
          object lblPortabSaidaCnpb: TLabel
            Left = 546
            Top = 19
            Width = 70
            Height = 13
            Caption = 'CNPB/SUSEP'
          end
          object DBENOME1: TwwDBEdit
            Left = 24
            Top = 35
            Width = 361
            Height = 21
            DataField = 'NOME'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBENOME: TwwDBEdit
            Left = 400
            Top = 35
            Width = 129
            Height = 21
            DataField = 'CNPJ'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBENOME2: TwwDBEdit
            Left = 545
            Top = 35
            Width = 145
            Height = 21
            DataField = 'CNPBSUSEP'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBENOME3: TwwDBEdit
            Left = 24
            Top = 77
            Width = 361
            Height = 21
            DataField = 'BENEFÍCIO'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object grp1: TGroupBox
          Left = 16
          Top = 124
          Width = 737
          Height = 69
          Caption = 'Portabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblPortabSaidaDtSol: TLabel
            Left = 24
            Top = 19
            Width = 93
            Height = 13
            Caption = 'Data da Solicitação'
          end
          object lblPortabSaidaDtRegistro: TLabel
            Left = 140
            Top = 19
            Width = 80
            Height = 13
            Caption = 'Data do Registro'
          end
          object lblPortabSaidaDtEfetiva: TLabel
            Left = 253
            Top = 19
            Width = 59
            Height = 13
            Caption = 'Data Efetiva'
          end
          object lblPortabSaidaVlPortado: TLabel
            Left = 368
            Top = 19
            Width = 64
            Height = 13
            Caption = 'Valor Portado'
          end
          object lblPortabSaidaVlPortadoCotas: TLabel
            Left = 480
            Top = 19
            Width = 100
            Height = 13
            Caption = 'Valor Portado (Cotas)'
          end
          object DBENOME4: TwwDBEdit
            Left = 24
            Top = 35
            Width = 99
            Height = 21
            DataField = 'DATASOLICITACAO'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEDATASOLICITACAO: TwwDBEdit
            Left = 140
            Top = 35
            Width = 99
            Height = 21
            DataField = 'DATAREGISTRO'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEDATASOLICITACAO1: TwwDBEdit
            Left = 254
            Top = 35
            Width = 99
            Height = 21
            DataField = 'DATAPAGAMENTO'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEDATAPAGAMENTO: TwwDBEdit
            Left = 368
            Top = 35
            Width = 99
            Height = 21
            DataField = 'VALORPORTADO'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEDATAPAGAMENTO1: TwwDBEdit
            Left = 481
            Top = 35
            Width = 102
            Height = 21
            DataField = 'VLRCOTAS'
            DataSource = dtmConsPart.dsPortabSaida
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object pnlPortabSaida: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Portabilidade/Saída'
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
  end
  object Dock972: TDock97
    Left = 0
    Top = 607
    Width = 830
    Height = 33
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
      Left = 495
      Top = 0
      Caption = 'tb97Fundo2'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 1500
      FloatingMode = fmOnTopOfAllForms
      TabOrder = 0
      object sep1: TToolbarSep97
        Left = 246
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep971: TToolbarSep97
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97
        Left = 329
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object bbtnSair2: TBitBtn
        Left = 165
        Top = 0
        Width = 81
        Height = 27
        Cancel = True
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnSair2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
          B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
          BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
          BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
          BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnAjuda2: TmaHelpBitBtn
        Left = 248
        Top = 0
        Width = 81
        Height = 27
        Caption = 'A&juda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888004444400
          888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
          408887F88877788887F88744447F74444088878888878888878F7C4444444444
          44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
          44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
          440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
          4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
        ClickHelpContext = 0
      end
      object bbtnProcurar: TBitBtn
        Left = 85
        Top = 0
        Width = 78
        Height = 27
        Cancel = True
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
        Spacing = 2
      end
      object sbtnTitular: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
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
  end
  object twMensagem: TToolWindow97
    Left = 968
    Top = 32
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
      Top = 112
      Width = 369
      Height = 35
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 149
        Top = 4
        Width = 92
        Height = 25
        Caption = '&Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 270
        Top = 4
        Width = 83
        Height = 25
        Caption = 'Próxima'
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FF3333333333333447333333333333377FFF33333333333744473333333
          333337773FF3333333333444447333333333373F773FF3333333334444447333
          33333373F3773FF3333333744444447333333337F333773FF333333444444444
          733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
          999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
          33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
          333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
          33333777333333333333CC333333333333337733333333333333}
        Layout = blGlyphRight
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 22
        Top = 4
        Width = 83
        Height = 25
        Caption = '&Anterior'
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF3333333333333744333333333333F773333333333337
          44473333333333F777F3333333333744444333333333F7733733333333374444
          4433333333F77333733333333744444447333333F7733337F333333744444444
          433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
          9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
          C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
          CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
          CCC333333333333777FF33333333333333CC3333333333333773}
        NumGlyphs = 2
      end
    end
    object reditMSG: TRichEdit
      Left = 0
      Top = 0
      Width = 369
      Height = 112
      Align = alClient
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 830
    Height = 22
    ButtonHeight = 21
    ButtonWidth = 94
    Caption = 'ToolBar1'
    Color = clBtnFace
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowCaptions = True
    TabOrder = 4
    object AgendaPessoal: TToolButton
      Left = 0
      Top = 0
      Caption = '&Agenda Pessoal'
      DropdownMenu = PopupMenu1
    end
    object ToolButton2: TToolButton
      Left = 94
      Top = 0
      Caption = 'Vida Funcional'
      DropdownMenu = PopupMenu2
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 188
      Top = 0
      Caption = 'Vida No Plano'
      DropdownMenu = PopupMenu3
      ImageIndex = 2
    end
    object VidaNaFundao1: TToolButton
      Left = 282
      Top = 0
      Caption = 'Vida na Fundação'
      ImageIndex = 3
      OnClick = VidaNaFundao1Click
    end
  end
  object DBRichHistReservaObs: TwwDBRichEdit
    Left = 792
    Top = 488
    Width = 17
    Height = 25
    ScrollBars = ssVertical
    AutoURLDetect = False
    DataField = 'OBSERVACAO'
    DataSource = dtmConsPart.dsHistReserva
    MaxLength = 500
    PrintJobName = 'Delphi 5'
    ReadOnly = True
    TabOrder = 5
    Visible = False
    PopupOptions = [rpoPopupEdit]
    EditorOptions = []
    EditorCaption = 'Observação'
    EditorPosition.Left = 0
    EditorPosition.Top = 0
    EditorPosition.Width = 0
    EditorPosition.Height = 0
    MeasurementUnits = muInches
    PrintMargins.Top = 1
    PrintMargins.Bottom = 1
    PrintMargins.Left = 1
    PrintMargins.Right = 1
    OnCreateDialog = DBRichHistReservaObsCreateDialog
    RichEditVersion = 2
    Data = {
      880000007B5C727466315C616E73695C616E7369637067313235325C64656666
      305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
      4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
      5C706172645C66305C667331362044425269636848697374526573657276614F
      62735C7061720D0A7D0D0A00}
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 22
    Width = 830
    Height = 187
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
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label108: TLabel
      Left = 113
      Top = 36
      Width = 69
      Height = 13
      Cursor = crNo
      Caption = 'Falecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label109: TLabel
      Left = 10
      Top = 36
      Width = 67
      Height = 13
      Cursor = crNo
      Caption = 'Nascimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      Font.Height = -12
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
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label112: TLabel
      Left = 8
      Top = 108
      Width = 259
      Height = 13
      Caption = 'Situação do Participante Titular na Fundação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label115: TLabel
      Left = 377
      Top = 73
      Width = 80
      Height = 13
      Cursor = crNo
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label117: TLabel
      Left = 8
      Top = 73
      Width = 282
      Height = 13
      Caption = 'Situação do Participante Titular na Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label119: TLabel
      Left = 376
      Top = 141
      Width = 55
      Height = 13
      Cursor = crNo
      Caption = 'Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 377
      Top = 108
      Width = 39
      Height = 13
      Cursor = crNo
      Caption = 'Planos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label169: TLabel
      Left = 8
      Top = 142
      Width = 235
      Height = 13
      Caption = 'Situação do Participante Titular no Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSitBenefPlano: TLabel
      Left = 376
      Top = 142
      Width = 194
      Height = 13
      Caption = 'Situação do Beneficiário no Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblResponsavel: TLabel
      Left = 216
      Top = 36
      Width = 74
      Height = 13
      Caption = 'Responsável'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTpResponsavel: TLabel
      Left = 598
      Top = 36
      Width = 121
      Height = 13
      Caption = 'Tipo de Responsável'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBEdit28: TwwDBEdit
      Left = 112
      Top = 49
      Width = 101
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
      Left = 8
      Top = 49
      Width = 101
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
      Left = 8
      Top = 121
      Width = 360
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
    object wwDBEdit37: TwwDBEdit
      Left = 8
      Top = 85
      Width = 360
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
      TabOrder = 6
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
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edClassific: TEdit
      Left = 377
      Top = 155
      Width = 361
      Height = 21
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
    object wwDBEdit39: TwwDBEdit
      Left = 376
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
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DblkPlanos: TwwDBLookupCombo
      Left = 376
      Top = 121
      Width = 405
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Plano'#9'F'
        'STATUS'#9'15'#9'Status'#9'F'
        'DATACANCELAMENTO'#9'10'#9'Data Canc.'#9'F')
      LookupTable = dtmConsPart.qryPlanos
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DblkPlanosChange
    end
    object wwDBEdit90: TwwDBEdit
      Left = 8
      Top = 155
      Width = 361
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
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtSitBenefPlano: TwwDBEdit
      Left = 376
      Top = 155
      Width = 405
      Height = 21
      Cursor = crNo
      TabStop = False
      AutoSize = False
      Color = clGray
      DataField = 'STATUS'
      DataSource = DtmconsPart1.dsSitBenefPlano
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtMatricula: TwwDBEdit
      Left = 496
      Top = 14
      Width = 105
      Height = 21
      Cursor = crNo
      TabStop = False
      Color = clGray
      DataField = 'MATRICULA'
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
    object DblkPatro: TwwDBLookupCombo
      Left = 376
      Top = 85
      Width = 405
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PATROCINADORA'#9'60'#9'PATROCINADORA'#9'F')
      LookupTable = dtmConsPart.qryListPatros
      LookupField = 'CODPATROCINADORA'
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = DblkPatroChange
      OnKeyDown = DblkPatroKeyDown
      OnKeyPress = DblkPatroKeyPress
    end
    object edtResponsavel: TwwDBEdit
      Left = 216
      Top = 49
      Width = 378
      Height = 21
      Cursor = crNo
      Color = clGray
      DataField = 'IDRESPONSAVEL'
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
    object edtTpResponsavel: TwwDBEdit
      Left = 597
      Top = 49
      Width = 184
      Height = 21
      Cursor = crNo
      Color = clGray
      DataField = 'CODTIPORESPONSAVEL'
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
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 880
    Top = 112
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 816
    Top = 64
  end
  object ds: TwwDataSource
    DataSet = CmCds
    Left = 816
    Top = 112
  end
  object CmCds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 64
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
    Left = 936
    Top = 24
  end
  object qryMatricula: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.MATRICULA'
      'FROM DEPENTIT D, PARTPREVPLAN P'
      'WHERE D.IDPESSOA  = P.IDPESSOA'
      'AND P.IDPLANOPREV = :PIDPLANOPREV'
      'AND P.IDPESSOA    = :PIDPESSOA'
      'AND D.MATRICULA   = :MATRICULA')
    ControlType.Strings = (
      'CODIGO;CustomEdit;dbcSituacao'
      'FLGSITPART;CustomEdit;dbcSituacao')
    ValidateWithMask = True
    Left = 613
    Top = 331
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
    object qryMatriculaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.ELEGPATRO.MATRICULA'
      ReadOnly = True
      Size = 13
    end
  end
  object dsMatricula: TwwDataSource
    AutoEdit = False
    DataSet = qryMatricula
    Left = 663
    Top = 347
  end
  object qryCpCarencia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TO_DATE(TRUNC(TRGDTINCLUSAO),'#39'DD/MM/RRRR'#39')  AS DATACOMPRA'
      '     , TPCOMPRACARENCIA QTDEMESES'
      '     , VLRDIVIDAPATRO VALORPATROCINADORA'
      '     , VLRDIVIDAPART VALORPATROCINANTE '
      '     , SDODEVEDOR VALORTOTAL'
      'FROM PARCELAMENTO'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND IDPLANOPREV = :IDPLANOPREV'
      'AND IDPESSOA    = :IDPESSOA'
      'AND TPCOMPRACARENCIA IS NOT NULL'
      'ORDER BY TRGDTINCLUSAO'
      ' ')
    ValidateWithMask = True
    Left = 700
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCpCarenciaDATACOMPRA: TDateTimeField
      DisplayLabel = 'Data da Compra'
      DisplayWidth = 15
      FieldName = 'DATACOMPRA'
    end
    object qryCpCarenciaQTDEMESES: TFloatField
      DisplayLabel = 'Quantidade de Meses~Comprados'
      DisplayWidth = 15
      FieldName = 'QTDEMESES'
    end
    object qryCpCarenciaVALORPATROCINADORA: TFloatField
      DisplayLabel = 'Valor da Patrocinadora'
      DisplayWidth = 15
      FieldName = 'VALORPATROCINADORA'
    end
    object qryCpCarenciaVALORPATROCINANTE: TFloatField
      DisplayLabel = 'Valor da Patrocinante'
      DisplayWidth = 15
      FieldName = 'VALORPATROCINANTE'
    end
    object qryCpCarenciaVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 35
      FieldName = 'VALORTOTAL'
    end
  end
  object dsCpCarencia: TwwDataSource
    AutoEdit = False
    DataSet = qryCpCarencia
    Left = 712
    Top = 287
  end
  object PopupMenu1: TPopupMenu
    Left = 180
    Top = 179
    object DadosPessoais: TMenuItem
      Caption = 'Dados Pessoais'
      OnClick = DadosPessoais_1Click
    end
    object Documentos: TMenuItem
      Caption = 'Documentos'
      OnClick = Documentos_1Click
    end
    object Enderecos: TMenuItem
      Caption = 'Endereços'
      OnClick = Enderecos_1Click
    end
    object Telefones: TMenuItem
      Caption = 'Telefones'
      OnClick = TelefonesClick
    end
    object Contatos: TMenuItem
      Caption = 'Contatos'
      OnClick = ContatosClick
    end
    object ContasBancrias: TMenuItem
      Caption = 'Contas Bancárias'
      OnClick = ContasBancriasClick
    end
    object Dependentes: TMenuItem
      Caption = 'Dependentes'
      OnClick = DependentesClick
    end
    object AoJudicial: TMenuItem
      Caption = 'Ação Judicial'
      OnClick = AcaoJudicialClick
    end
    object OutrasInformaes1: TMenuItem
      Caption = 'Outras Informações'
      OnClick = OutrasInformaes1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 136
    Top = 296
    object DadosBasicos: TMenuItem
      Caption = 'Dados Básicos'
      OnClick = DadosBasicosClick
    end
    object EvolucaoFuncional: TMenuItem
      Caption = 'Evolução Funcional'
      OnClick = EvolucaoFuncionalClick
    end
    object HistoricoFuncional: TMenuItem
      Caption = 'Histórico Funcional'
      OnClick = HistoricoFuncionalClick
    end
    object RubricasSalariais: TMenuItem
      Caption = 'Rúbricas Salariais'
      OnClick = RubricasSalariaisClick
    end
    object Dadosparaenquadramento1: TMenuItem
      Caption = 'Dados para enquadramento'
      OnClick = DadosparaEnquadramento1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 216
    Top = 295
    object Eventos: TMenuItem
      Caption = 'Eventos'
      object Previdencirios2: TMenuItem
        Caption = 'Previdenciários'
        OnClick = PrevidenciarioClick
      end
      object Assistenciais3: TMenuItem
        Caption = 'Assistenciais'
        OnClick = AssistencialClick
      end
    end
    object Protocolos: TMenuItem
      Caption = 'Protocolos'
      OnClick = ProtocolosClick
    end
    object ProcessosRad: TMenuItem
      Caption = 'Processos RAD'
      OnClick = ProcessosRadClick
    end
    object RUB: TMenuItem
      Caption = 'RUB'
      OnClick = RUBClick
    end
    object Contribuicoes: TMenuItem
      Caption = '&Contribuiçoes'
      object SituaoAtual2: TMenuItem
        Caption = '&Situação Atual'
        object DoTitular1: TMenuItem
          Caption = 'Do &Titular'
          OnClick = SituaoAtual1Click
        end
        object DoBeneficirio1: TMenuItem
          Caption = 'Do &Beneficiário'
          OnClick = Beneficirio1Click
        end
      end
      object Histrico2: TMenuItem
        Caption = 'Histórico'
        object Previdencirias2: TMenuItem
          Caption = '&Previdenciárias'
          OnClick = Previdencirias1Click
        end
        object Aprovasdas1: TMenuItem
          Caption = '&Assistenciais'
          OnClick = Assistenciais2Click
        end
      end
      object Reserva2: TMenuItem
        Caption = '&Reserva'
        object Saldo2: TMenuItem
          Caption = '&Saldo'
          OnClick = Saldo1Click
        end
        object HistricodeAlimentao2: TMenuItem
          Caption = '&Histórico de Alimentação'
          OnClick = HistricodeAlimentao1Click
        end
      end
      object Parcelamento2: TMenuItem
        Caption = 'Parcelamento'
        OnClick = Parcelamento1Click
      end
      object HistricodePercentualdeContribuio2: TMenuItem
        Caption = 'Histórico de Percentual de Contribuição'
        OnClick = HistricodePercentualdeContribuio1Click
      end
      object CompradeCarnciadeTempo1: TMenuItem
        Caption = 'Compra de Carência de Tempo'
        OnClick = MmCompradeCarenciadeTempoClick
      end
      object HistricodeSalriodeParticipao1: TMenuItem
        Caption = 'Histórico de Salário de Participação '
        OnClick = HistricodeSalriodeParticipao1Click
      end
    end
    object Beneficios: TMenuItem
      Caption = '&Benefícios'
      object Processos: TMenuItem
        Caption = '&Processos'
        OnClick = ProcessosClick
      end
      object SituaoAtual3: TMenuItem
        Caption = '&Situação Atual'
        OnClick = SituaoAtual3Click
      end
      object Histrico3: TMenuItem
        Caption = '&Histórico'
        OnClick = HistoricoClick
      end
      object HistricodeRevises2: TMenuItem
        Caption = 'Histórico de Revisões'
        OnClick = HistricodeRevises1Click
      end
      object HistricodeMovimentaes2: TMenuItem
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
        object InformedeRendimentos1: TMenuItem
          Caption = '&Informe de Rendimentos'
          Enabled = False
        end
      end
      object HistoricoSRB: TMenuItem
        Caption = 'Histórico do SRB'
        OnClick = HistoricoSRBClick
      end
    end
    object Beneficiarios: TMenuItem
      Caption = 'Bene&ficiários'
      object Previdencirios3: TMenuItem
        Caption = 'P&revidenciários'
        OnClick = Previdencirios1Click
      end
      object Assistenciais5: TMenuItem
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
    object Planos2: TMenuItem
      Caption = 'P&lanos'
      object DoTitular2: TMenuItem
        Caption = 'Do &Titular'
        OnClick = Titular2Click
      end
      object DoBeneficirio2: TMenuItem
        Caption = 'Do &Beneficiário'
        OnClick = Beneficirio1Click
      end
    end
    object Portabilidade1: TMenuItem
      Caption = 'Portabilidade'
      object Entrada1: TMenuItem
        Caption = 'Entrada'
        OnClick = Entrada1Click
      end
      object Sada1: TMenuItem
        Caption = 'Saída'
        OnClick = Sada1Click
      end
    end
  end
end
