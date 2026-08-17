inherited frmConsultaPrevia: TfrmConsultaPrevia
  Left = 121
  Top = 57
  HelpContext = 180052
  Caption = 'Consulta Prévia da Folha de Benefícios'
  ClientHeight = 755
  ClientWidth = 1393
  OnPaint = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1393
    Height = 716
    object PnlMatricOuInscricao: TPanel
      Left = 1
      Top = 48
      Width = 1391
      Height = 75
      Align = alTop
      TabOrder = 0
      object LblInscricao: TLabel
        Left = 564
        Top = 2
        Width = 89
        Height = 13
        Caption = 'Nº de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMatric: TLabel
        Left = 448
        Top = 2
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object LblTitular: TLabel
        Left = 11
        Top = 2
        Width = 91
        Height = 13
        Caption = 'Nome do Titular'
      end
      object LblPatrocinadora: TLabel
        Left = 11
        Top = 36
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object LblPlano: TLabel
        Left = 451
        Top = 36
        Width = 33
        Height = 13
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 669
        Top = 1
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtitular: TwwDBEdit
        Left = 9
        Top = 16
        Width = 427
        Height = 21
        Color = clMenu
        DataField = 'TITULAR'
        DataSource = dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object dbedPatrocinadora: TwwDBEdit
        Left = 9
        Top = 50
        Width = 426
        Height = 21
        Color = clMenu
        DataField = 'PATROCINADORA'
        DataSource = dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object dbedPlano: TwwDBEdit
        Left = 446
        Top = 49
        Width = 427
        Height = 21
        Color = clMenu
        DataField = 'PLANO'
        DataSource = dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object EdtMatricula: TEdit
        Left = 446
        Top = 16
        Width = 107
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EdtMatriculaKeyPress
      end
      object EdtNumInscr: TEdit
        Left = 562
        Top = 16
        Width = 94
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EdtNumInscrKeyPress
      end
      object EdtSituacao: TEdit
        Left = 668
        Top = 16
        Width = 205
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object PnlHistoricoEDetalhes: TPanel
      Left = 1
      Top = 123
      Width = 1391
      Height = 240
      Align = alTop
      TabOrder = 1
      object PnlHistorico: TPanel
        Left = 1
        Top = 126
        Width = 504
        Height = 113
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object dbgHistorico: TwwDBGrid
          Left = 2
          Top = 2
          Width = 500
          Height = 109
          Selected.Strings = (
            'IDLOTE'#9'9'#9'Nº Lote'
            'MESCOBRANCA'#9'9'#9'Mês Pagto'
            'DESCRICAO'#9'48'#9'Descrição')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsSelecao
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object PnlDetalhes: TPanel
        Left = 1
        Top = 1
        Width = 1389
        Height = 82
        Align = alTop
        TabOrder = 1
        object LblDataNasc: TLabel
          Left = 389
          Top = 2
          Width = 61
          Height = 13
          Caption = 'Data Nasc'
        end
        object LblNumDep: TLabel
          Left = 653
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Nº Dep. IRRF'
        end
        object LblBanco: TLabel
          Left = 8
          Top = 42
          Width = 37
          Height = 13
          Caption = 'Banco'
        end
        object LblAgencia: TLabel
          Left = 100
          Top = 42
          Width = 47
          Height = 13
          Caption = 'Agência'
        end
        object LblContaCorrente: TLabel
          Left = 191
          Top = 42
          Width = 86
          Height = 13
          Caption = 'Conta Corrente'
        end
        object LblPortForma: TLabel
          Left = 390
          Top = 42
          Width = 87
          Height = 13
          Caption = 'Portador Forma'
        end
        object LblRecebedor: TLabel
          Left = 10
          Top = 2
          Width = 63
          Height = 13
          Caption = 'Recebedor'
        end
        object Label1: TLabel
          Left = 513
          Top = 1
          Width = 103
          Height = 13
          Caption = 'Nº Dep. Sal. Fam.'
        end
        object Label3: TLabel
          Left = 8
          Top = 82
          Width = 149
          Height = 13
          Caption = 'Favorecido do Pagamento'
        end
        object dbedDataNasc: TwwDBEdit
          Left = 389
          Top = 15
          Width = 95
          Height = 21
          Color = clMenu
          DataField = 'DATANASC'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dbedNumDepIR: TwwDBEdit
          Left = 653
          Top = 15
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'NUMDEPIRRF'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dbchIsentoIR: TDBCheckBox
          Left = 762
          Top = 15
          Width = 109
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Isento de IRRF'
          Color = clBtnFace
          DataField = 'FLGISENTOIRRF'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentColor = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedBanco: TwwDBEdit
          Left = 8
          Top = 55
          Width = 83
          Height = 21
          Color = clMenu
          DataField = 'NUMBANCO'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dbedAgencia: TwwDBEdit
          Left = 100
          Top = 55
          Width = 83
          Height = 21
          Color = clMenu
          DataField = 'NUMAGENCIA'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dbedContaCorrente: TwwDBEdit
          Left = 191
          Top = 55
          Width = 181
          Height = 21
          Color = clMenu
          DataField = 'CONTACORRENTE'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dblkRecebedor: TwwDBLookupCombo
          Left = 8
          Top = 15
          Width = 366
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'BENEFICIARIO'#9'30'#9'Beneficiário'#9'F')
          LookupTable = qryPrevia
          LookupField = 'idresponsavel'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkRecebedorChange
          OnCloseUp = dblkRecebedorCloseUp
        end
        object dbedPortForma: TwwDBEdit
          Left = 390
          Top = 55
          Width = 478
          Height = 21
          Color = clMenu
          DataField = 'DESCRICAO'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object wwDBEdit1: TwwDBEdit
          Left = 513
          Top = 15
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'NUMDEPSALF'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object dbChkIRTotal: TDBCheckBox
          Left = 565
          Top = 36
          Width = 304
          Height = 17
          Caption = 'Cálculo do IRRF com base no somatório de todas as fontes'
          DataField = 'FLGSOMAIRSUPINSS'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object wwDBEdit2: TwwDBEdit
          Left = 8
          Top = 95
          Width = 1360
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'FAVORECIDO'
          DataSource = dsPrevia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
      end
      object pnlSRB: TPanel
        Left = 505
        Top = 126
        Width = 378
        Height = 113
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 2
        object dbgFator: TwwDBGrid
          Left = 2
          Top = 2
          Width = 374
          Height = 109
          Selected.Strings = (
            'FATOR'#9'10'#9'Fator'
            'NOME'#9'13'#9'Descrição'
            'BENEFICIARIO'#9'11'#9'Beneficiário')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = False
          Align = alClient
          DataSource = dsFator
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object pnlMostraSRB: TPanel
        Left = 1
        Top = 83
        Width = 1389
        Height = 43
        Align = alTop
        BevelInner = bvRaised
        TabOrder = 3
        object lblValorSRB: TLabel
          Left = 270
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Valor SRB'
        end
        object lblValorINSS: TLabel
          Left = 411
          Top = 3
          Width = 63
          Height = 13
          Caption = 'Valor INSS'
        end
        object lblSuplementacao: TLabel
          Left = 552
          Top = 3
          Width = 90
          Height = 13
          Caption = 'Valor Fundação'
        end
        object lblDtInicio: TLabel
          Left = 8
          Top = 3
          Width = 65
          Height = 13
          Caption = 'Data Início'
        end
        object lblDtFim: TLabel
          Left = 134
          Top = 3
          Width = 51
          Height = 13
          Caption = 'Data Fim'
        end
        object pnlValorSRB: TPanel
          Left = 268
          Top = 16
          Width = 107
          Height = 21
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '0,00 '
          Color = clAqua
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object pnlValorINSS: TPanel
          Left = 409
          Top = 16
          Width = 107
          Height = 21
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '0,00 '
          Color = clAqua
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object pnlValorSupl: TPanel
          Left = 550
          Top = 16
          Width = 107
          Height = 21
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = '0,00 '
          Color = clAqua
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtDtInicio: TEdit
          Left = 7
          Top = 16
          Width = 97
          Height = 21
          Color = clInactiveCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtDtFinal: TEdit
          Left = 133
          Top = 16
          Width = 97
          Height = 21
          Color = clInactiveCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object PnlGridDetalhe: TPanel
      Left = 1
      Top = 363
      Width = 1391
      Height = 324
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 2
      object PgRubricaBasePagamento: TPageControl
        Left = 2
        Top = 2
        Width = 1297
        Height = 320
        ActivePage = TbsBasePagamento
        Align = alClient
        TabOrder = 0
        object TbsRubricas: TTabSheet
          Caption = 'Rubricas'
          object PnlRubricas: TPanel
            Left = 0
            Top = 31
            Width = 1289
            Height = 261
            Align = alClient
            TabOrder = 0
            object lblOrdem: TLabel
              Left = 276
              Top = 17
              Width = 37
              Height = 13
              Caption = 'Ordem'
            end
            object lblRubrica: TLabel
              Left = 332
              Top = 17
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object lblFonte: TLabel
              Left = 775
              Top = 17
              Width = 91
              Height = 13
              Caption = 'Fonte Pagadora'
            end
            object lblPrazo: TLabel
              Left = 44
              Top = 81
              Width = 33
              Height = 13
              Caption = 'Prazo'
            end
            object lblSequencia: TLabel
              Left = 108
              Top = 81
              Width = 27
              Height = 13
              Caption = 'Seq.'
            end
            object lblTD: TLabel
              Left = 171
              Top = 81
              Width = 18
              Height = 13
              Caption = 'TD'
            end
            object lblProvento: TLabel
              Left = 230
              Top = 81
              Width = 52
              Height = 13
              Caption = 'Provento'
            end
            object lblDesconto: TLabel
              Left = 362
              Top = 81
              Width = 55
              Height = 13
              Caption = 'Desconto'
            end
            object lbl1: TLabel
              Left = 499
              Top = 81
              Width = 39
              Height = 13
              Caption = 'V. Info'
            end
            object lblDarf: TLabel
              Left = 637
              Top = 81
              Width = 34
              Height = 13
              Caption = 'DARF'
            end
            object lblPlanoCont: TLabel
              Left = 779
              Top = 81
              Width = 83
              Height = 13
              Caption = 'Plano Contábil'
            end
            object lblIR: TLabel
              Left = 245
              Top = 27
              Width = 14
              Height = 13
              Caption = 'IR'
            end
            object lblSF: TLabel
              Left = 244
              Top = 45
              Width = 16
              Height = 13
              Caption = 'SF'
            end
            object Label4: TLabel
              Left = 929
              Top = 82
              Width = 218
              Height = 13
              Caption = 'Perfil de Investimento - Plano Contábil'
            end
            object GroupBox1: TGroupBox
              Left = 40
              Top = 12
              Width = 182
              Height = 49
              Caption = ' Mês e Ano de Referência '
              Enabled = False
              TabOrder = 0
              object edtMesRef: TEdit
                Left = 6
                Top = 19
                Width = 107
                Height = 21
                TabStop = False
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object edtAnoRef: TEdit
                Left = 122
                Top = 19
                Width = 53
                Height = 21
                TabStop = False
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
            end
            object chkIR: TCheckBox
              Left = 231
              Top = 25
              Width = 11
              Height = 17
              TabStop = False
              Color = clWhite
              Enabled = False
              ParentColor = False
              TabOrder = 1
            end
            object chkSF: TCheckBox
              Left = 231
              Top = 44
              Width = 11
              Height = 17
              TabStop = False
              Color = clWhite
              Enabled = False
              ParentColor = False
              TabOrder = 2
            end
            object dblcPlanoContab: TwwDBLookupCombo
              Left = 779
              Top = 97
              Width = 133
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'IDPLANOCONTABIL'
              DataSource = dsRubricasDetalhe
              LookupTable = qryPlContab
              LookupField = 'IDPLANOPREV'
              TabOrder = 7
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblcDARF: TwwDBLookupCombo
              Left = 637
              Top = 97
              Width = 111
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODNATUREZA'#9'7'#9'Natureza'#9'F'
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'CODIRRFDARF'
              DataSource = dsRubricasDetalhe
              LookupTable = qryDarf
              LookupField = 'CODNATUREZA'
              TabOrder = 6
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedProvento: TwwDBEdit
              Left = 230
              Top = 97
              Width = 109
              Height = 21
              DataField = 'VLRPROVENTO'
              DataSource = dsRubricasDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDesconto: TwwDBEdit
              Left = 363
              Top = 97
              Width = 109
              Height = 21
              DataField = 'VALORDESCONTO'
              DataSource = dsRubricasDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object pnlOrdem: TPanel
              Left = 278
              Top = 32
              Width = 42
              Height = 21
              Alignment = taRightJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
            end
            object pnlRubrica: TPanel
              Left = 334
              Top = 32
              Width = 429
              Height = 21
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
            end
            object pnlFonte: TPanel
              Left = 774
              Top = 32
              Width = 133
              Height = 21
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
            end
            object pnlPrazo: TPanel
              Left = 46
              Top = 98
              Width = 50
              Height = 21
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
            end
            object pnlSeq: TPanel
              Left = 109
              Top = 98
              Width = 50
              Height = 21
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
            end
            object pnlTD: TPanel
              Left = 172
              Top = 98
              Width = 50
              Height = 21
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 13
            end
            object dbedtVInfo: TwwDBEdit
              Left = 499
              Top = 97
              Width = 109
              Height = 21
              DataField = 'VALORINFO'
              DataSource = dsRubricasDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcPerfil: TwwDBLookupCombo
              Left = 929
              Top = 97
              Width = 216
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEPLANO'#9'73'#9'Plano'#9'F')
              DataField = 'IDPERFILINVEST'
              DataSource = dsRubricasDetalhe
              LookupTable = qryPerfil
              LookupField = 'IDPERFILINVEST'
              TabOrder = 14
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object dbgDetalhe: TwwDBGrid
            Left = 0
            Top = 31
            Width = 1289
            Height = 261
            Selected.Strings = (
              'MES'#9'7'#9'MES'
              'IDPESSOA'#9'10'#9'IDPESSOA'
              'CODIRRFDARF'#9'4'#9'CODIRRFDARF'
              'VALORPROVENTO'#9'10'#9'VALORPROVENTO'
              'VALORDESCONTO'#9'10'#9'VALORDESCONTO'
              'INFORMATIVO'#9'44'#9'INFORMATIVO'
              'FLGDESCONTO'#9'10'#9'FLGDESCONTO'
              'FLGIRRF'#9'10'#9'FLGIRRF'
              'FLGSALFAM'#9'10'#9'FLGSALFAM'
              'CODIRRFDARF_1'#9'4'#9'CODIRRFDARF_1'
              'IDPROVENTO'#9'10'#9'IDPROVENTO'
              'ORDEM'#9'10'#9'ORDEM'
              'CODRUBRICA'#9'15'#9'CODRUBRICA'
              'RUBRICA'#9'130'#9'RUBRICA'
              'PARCELAS'#9'10'#9'PARCELAS'
              'ORDEM_1'#9'5'#9'ORDEM_1'#9'F'
              'FONTEPAGADORA'#9'4'#9'FONTEPAGADORA')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRubricasDetalhe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTrailingEllipsis, dgShowCellHint]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Dock973: TDock97
            Left = 0
            Top = 0
            Width = 1289
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object sbtnAltDet: TToolbarButton97
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Enabled = False
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltDetClick
              end
              object sbtnExcDet: TToolbarButton97
                Left = 25
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                Enabled = False
                ImageIndex = 2
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnExcDetClick
              end
            end
          end
        end
        object TbsBasePagamento: TTabSheet
          Caption = 'Base de Pagamento'
          ImageIndex = 1
          object PnlBasePagamento: TPanel
            Left = 0
            Top = 31
            Width = 1289
            Height = 261
            Align = alClient
            TabOrder = 0
            object lblBPBruto: TLabel
              Left = 63
              Top = 8
              Width = 64
              Height = 13
              Caption = 'Valor Bruto'
            end
            object lblBPDesconto: TLabel
              Left = 63
              Top = 51
              Width = 88
              Height = 13
              Caption = 'Valor Desconto'
            end
            object lblBPLiquido: TLabel
              Left = 63
              Top = 94
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object lblBPIRRegr: TLabel
              Left = 222
              Top = 8
              Width = 114
              Height = 13
              Caption = 'Valor IR Regressivo'
            end
            object lblBPMargemC: TLabel
              Left = 222
              Top = 51
              Width = 118
              Height = 13
              Caption = 'Margem Consignável'
            end
            object lblBPRenda: TLabel
              Left = 222
              Top = 94
              Width = 70
              Height = 13
              Caption = 'Renda Base'
            end
            object lblBPMargemR: TLabel
              Left = 383
              Top = 8
              Width = 75
              Height = 13
              Caption = 'Margem Real'
            end
            object lblBPIrInforma: TLabel
              Left = 383
              Top = 51
              Width = 81
              Height = 13
              Caption = 'IR Informativo'
            end
            object lblBPIrInforma13: TLabel
              Left = 383
              Top = 94
              Width = 104
              Height = 13
              Caption = 'IR Informativo 13º'
            end
            object lblBPIrCompensa: TLabel
              Left = 539
              Top = 8
              Width = 90
              Height = 13
              Caption = 'IR Compensado'
            end
            object lblBPIrCompensa13: TLabel
              Left = 539
              Top = 51
              Width = 113
              Height = 13
              Caption = 'IR Compensado 13º'
            end
            object dbedVlrBruto: TwwDBEdit
              Left = 63
              Top = 22
              Width = 119
              Height = 21
              DataField = 'VLRBRUTO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedVlrDesconto: TwwDBEdit
              Left = 63
              Top = 65
              Width = 119
              Height = 21
              DataField = 'VLRDESCONTO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedVlrLiquido: TwwDBEdit
              Left = 63
              Top = 107
              Width = 119
              Height = 21
              DataField = 'VLRLIQUIDO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIrRegressivo: TwwDBEdit
              Left = 222
              Top = 22
              Width = 119
              Height = 21
              DataField = 'VLRIRREGRESSIVO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedMargemC: TwwDBEdit
              Left = 222
              Top = 65
              Width = 119
              Height = 21
              DataField = 'MARGEMCONSIGNAVEL'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedRendaBase: TwwDBEdit
              Left = 222
              Top = 107
              Width = 119
              Height = 21
              DataField = 'RENDABASE'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedMargemR: TwwDBEdit
              Left = 383
              Top = 22
              Width = 119
              Height = 21
              DataField = 'MARGEMREAL'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIrInforma: TwwDBEdit
              Left = 383
              Top = 65
              Width = 119
              Height = 21
              DataField = 'IRINFORMATIVO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIrInforma13: TwwDBEdit
              Left = 383
              Top = 107
              Width = 119
              Height = 21
              DataField = 'IRINFORMATIVO13'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIrCompensa: TwwDBEdit
              Left = 539
              Top = 22
              Width = 119
              Height = 21
              DataField = 'IRCOMPENSADO'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIrCompensa13: TwwDBEdit
              Left = 539
              Top = 65
              Width = 119
              Height = 21
              DataField = 'IRCOMPENSADO13'
              DataSource = dsQryBasePagto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbgBasePagamento: TDBGrid
            Left = 0
            Top = 31
            Width = 1289
            Height = 261
            Align = alClient
            DataSource = dsBasePagamento
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'Campo'
                Width = 165
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Valor'
                Width = 600
                Visible = True
              end>
          end
          object Dock974: TDock97
            Left = 0
            Top = 0
            Width = 1289
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar972: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object sbtnAltBase: TToolbarButton97
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Enabled = False
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltBaseClick
              end
            end
          end
        end
        object tbsHstIsencao: TTabSheet
          Caption = 'Histórico de Isenção de IRRF por Benefício'
          ImageIndex = 2
          object pnlHstCalculo: TPanel
            Left = 0
            Top = 0
            Width = 1221
            Height = 101
            Align = alTop
            TabOrder = 0
            object pnlHstCalcTit: TPanel
              Left = 1
              Top = 1
              Width = 1219
              Height = 21
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Cálculo do IRRF'
              TabOrder = 0
            end
            object dbgHstBenefIR: TwwDBGrid
              Left = 1
              Top = 22
              Width = 1219
              Height = 78
              Selected.Strings = (
                'BENEFICIO'#9'43'#9'Benefício'#9'F'
                'ESPECIE'#9'6'#9'Espécie'#9'F'
                'EXISTEISENCAO'#9'3'#9'Existe Isenção'#9'F'
                'MOLESTIAGRAVE'#9'3'#9'Moléstia Grave'#9'F'
                'SITPROCESSO'#9'25'#9'Ação Judicial'#9'F')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              DataSource = dsHstBenefIR
              KeyOptions = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object pnlHstIsencao: TPanel
            Left = 0
            Top = 101
            Width = 1221
            Height = 126
            Align = alClient
            TabOrder = 1
            object pnlHstIsentoTit: TPanel
              Left = 1
              Top = 1
              Width = 1219
              Height = 21
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Histórico de Isenção por Benefício'
              TabOrder = 0
            end
            object dbgHstIsento: TwwDBGrid
              Left = 1
              Top = 22
              Width = 1219
              Height = 103
              Selected.Strings = (
                'DTINICIO'#9'10'#9'Data Início'
                'DTFIM'#9'13'#9'Data Fim'
                'DESCOCORRENCIA'#9'30'#9'Ocorrêcia')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              DataSource = dsHstIsento
              KeyOptions = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
        object tbsBaseREINF: TTabSheet
          Caption = 'Base REINF'
          ImageIndex = 3
          object pnlBaseREINF: TPanel
            Left = 0
            Top = 0
            Width = 1221
            Height = 227
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbgBaseREINF: TwwDBGrid
              Left = 0
              Top = 0
              Width = 1221
              Height = 227
              Selected.Strings = (
                'CODNATUREZAREINF'#9'15'#9'Natureza REINF'#9'F'
                'DESCRICAO_REINF'#9'43'#9'Descrição'#9'F'
                'CODFONTEPAGADORA'#9'6'#9'Fonte Pagadora'#9'F'
                'IDPLANOPREV'#9'3'#9'Plano Previdenciário'#9'F'
                'VLREINF'#9'15'#9'Valor'#9'F')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              DataSource = dsBaseREINF
              KeyOptions = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      object pnlBotoes: TDock97
        Left = 1299
        Top = 2
        Width = 90
        Height = 320
        AllowDrag = False
        BoundLines = [blLeft]
        Position = dpRight
        Visible = False
        object tb97Detalhe: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97Detalhe'
          DockPos = 0
          TabOrder = 0
          object bbtnOkDet: TBitBtn
            Left = 0
            Top = 0
            Width = 85
            Height = 27
            Caption = 'OK'
            TabOrder = 0
            OnClick = bbtnOkDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
          object bbtnCancelarDet: TBitBtn
            Left = 0
            Top = 27
            Width = 85
            Height = 27
            Cancel = True
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = bbtnCancelarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Spacing = -1
          end
          object bbtnVoltarDet: TBitBtn
            Left = 0
            Top = 54
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Voltar'
            TabOrder = 2
            OnClick = bbtnVoltarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
    object PnlValores: TPanel
      Left = 1
      Top = 687
      Width = 1391
      Height = 28
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 3
      object LblProventos: TLabel
        Left = 71
        Top = 7
        Width = 58
        Height = 13
        Caption = 'Proventos'
      end
      object LblDescontos: TLabel
        Left = 284
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Descontos'
      end
      object LblValLiquido: TLabel
        Left = 506
        Top = 7
        Width = 81
        Height = 13
        Caption = 'Valor Líquido '
      end
      object pnlProventos: TPanel
        Left = 135
        Top = 4
        Width = 125
        Height = 19
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'pnlProventos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlDescontos: TPanel
        Left = 357
        Top = 4
        Width = 125
        Height = 19
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'pnlDescontos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnlLiquido: TPanel
        Left = 593
        Top = 4
        Width = 125
        Height = 19
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'pnlLiquido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object Dock972: TDock97
      Left = 1
      Top = 1
      Width = 1391
      Height = 47
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
      BackgroundTransparent = True
      BoundLines = [blTop, blBottom]
      object Toolbar971: TToolbar97
        Left = 0
        Top = 0
        Caption = 'Toolbar971'
        CloseButton = False
        DefaultDock = Dock972
        DockPos = 0
        TabOrder = 0
        object sbtnAlterar: TToolbarButton97
          Left = 0
          Top = 0
          Width = 60
          Height = 41
          AllowAllUp = True
          GroupIndex = 1
          Caption = '&Alterar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          ImageIndex = 1
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnAlterarClick
        end
        object sbtnProcurar: TToolbarButton97
          Left = 60
          Top = 0
          Width = 60
          Height = 41
          AllowAllUp = True
          GroupIndex = 1
          Caption = '&Procurar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
            33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
            8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
            F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
            F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
            0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
            B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
            B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
            333333333777733333333333FBFBFB3333333333333333333333}
          ImageIndex = 3
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnProcurarClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 716
    Width = 1393
    inherited tb97Fundo: TToolbar97
      Left = 1080
      DockPos = 1080
    end
    object TB97oKCancelar: TToolbar97
      Left = 911
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 911
      TabOrder = 1
      object ToolbarSep971: TToolbarSep97
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Ok'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 84
        Top = 0
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        Enabled = False
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
    Top = 359
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryPrevia: TwwQuery
    AfterOpen = qryPreviaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJR.NOME AS PATROCINADORA,'
      '  TIT.NOME AS TITULAR,'
      '  ELG.MATRICULA,'
      '  BEN.NOME AS BENEFICIARIO,'
      '  PLP.NOME AS PLANO,'
      '  PPP.INSCRICAONUMERO,'
      
        '  SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),7,4)||SUBSTR(TO' +
        '_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),3,3) AS DATAPAGAMENTO,'
      '  PSF.NUMDEPIRRF,'
      '  PSF.NUMDEPSALF,'
      '  PSF.FLGSOMAIRSUPINSS,'
      '  NVL(PSF.FLGISENTOIRRF,0) AS FLGISENTOIRRF,'
      '  PSF.DATANASC,'
      '  HST.IDRESPONSAVEL,'
      '  HST.IDRECEBEPGTO,'
      '  FAV.NOME AS FAVORECIDO,'
      '  HST.MESCOBRANCA,'
      '  HST.IDPESSJUR,'
      '  BAN.NUMBANCO,'
      '  AGB.NUMAGENCIA,'
      '  CBC.CONTACORRENTE,'
      '  PTF.DESCRICAO,'
      '  HST.NUMBANCO ,'
      '  HST.NUMAGENCIA ,'
      '  HST.CONTACORRENTE,'
      '  HST.IDTITULAR,'
      '  HST.IDPATRO '
      ''
      'FROM'
      '  PREVIA HST,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO ELG,'
      '  PESSOAFISICA PSF,'
      '  PESSOA TIT,'
      '  PESSOA BEN,'
      '  PESSOA FAV,'
      '  PLANPREV PLP,'
      '  PESSOA PJR,'
      '  PORTADORFORMA PTF,'
      '  BANCO BAN,'
      '  AGENCIABANCARIA AGB,'
      '  CONTABANCARIA CBC'
      'WHERE'
      '  (HST.IDLOTE       = :IDLOTE)               AND'
      '  (HST.IDTITULAR    = :IDTITULAR)            AND'
      '  (HST.CODPORTFORMA = PTF.CODPORTFORMA(+))   AND'
      '  (PPP.IDPESSJUR    = HST.IDPATRO)           AND'
      '  (PJR.IDPESSOA     = HST.IDPATRO)           AND'
      '  (PPP.IDPLANOPREV  = HST.IDPLANOPREV)       AND'
      '  (PPP.IDPESSOA     = HST.IDTITULAR)         AND'
      '  (TIT.IDPESSOA     = HST.IDTITULAR)         AND'
      '  (BEN.IDPESSOA     = HST.IDRESPONSAVEL)     AND'
      '  (PLP.IDPLANOPREV  = HST.IDPLANOPREV)       AND'
      '  (ELG.IDPESSOA     = HST.IDTITULAR)         AND'
      '  (PSF.IDPESSOA     = BEN.IDPESSOA)          AND'
      '  (BEN.IDPESSOA     = CBC.IDPESSOA)          AND'
      '  (CBC.IDAGENCIA    = AGB.IDPESSOA)          AND'
      '  (AGB.IDBANCO      = BAN.IDPESSOA)          AND'
      
        '  (NVL(HST.IDRECEBEPGTO, HST.IDRESPONSAVEL) = FAV.IDPESSOA(+)) A' +
        'ND'
      '  FLGDESATIVADO = 0'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 409
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object dsPrevia: TwwDataSource
    DataSet = qryPrevia
    Left = 358
    Top = 304
  end
  object qryMatric: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ELG.IDPESSOA AS IDTITULAR, ELG.IDPESSOA, ELG.IDPESSJUR, P' +
        'PP.INSCRICAONUMERO'
      'FROM ELEGPATRO ELG, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE ELG.MATRICULA LIKE :NUMMATRICULA'
      'AND ELG.IDPESSOA = PPP.IDPESSOA'
      'AND ELG.IDPESSJUR = PPP.IDPESSJUR'
      'AND ELG.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND ((PPP.FLGDESATIVADO = 0)'
      '     OR ((PPP.FLGDESATIVADO = 1) AND'
      '         NOT EXISTS (SELECT 1'
      '                     FROM PARTPREVPLAN P1'
      '                     WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                     AND P1.FLGDESATIVADO = 0)))'
      'UNION'
      
        'SELECT DPT.IDTITULAR, DPT.IDTITULAR AS IDPESSOA, PPP.IDPESSJUR, ' +
        'PPP.INSCRICAONUMERO'
      'FROM DEPENTIT DPT, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE DPT.MATRICULA LIKE :NUMMATRICULA'
      'AND DPT.IDTITULAR = PPP.IDPESSOA'
      'AND PPP.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND ((PPP.FLGDESATIVADO = 0)'
      '     OR ((PPP.FLGDESATIVADO = 1) AND'
      '         NOT EXISTS (SELECT 1'
      '                     FROM PARTPREVPLAN P1'
      '                     WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                     AND P1.FLGDESATIVADO = 0)))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 429
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryMatricIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ELEGPATRO.IDPESSOA'
    end
    object qryMatricIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'ELEGPATRO.IDPESSJUR'
    end
    object qryMatricINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.PARTPREVPLAN.INSCRICAONUMERO'
    end
    object qryMatricIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'E.MATRICULA'
      'P.INSCRICAONUMERO'
      'TIT.NOME'
      'REC.NOME'
      'PA.NOME'
      'DP.MATRICULA'
      'PP.NOME'
      'REC.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Número de Inscrição'
      'Titular'
      'Recebedor'
      'Patrocinadora'
      'Matrícula de Dependente'
      'Plano Previdenciário'
      'CPF')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'PREVIA PR'
      'PARTPREVPLAN P'
      'ELEGPATRO E'
      'PESSOA TIT'
      'PESSOA REC'
      'PESSOA PA'
      'DEPENTIT DP'
      'PLANPREV PP')
    CamposChave.Strings = (
      'PR.IDTITULAR'
      'P.INSCRICAONUMERO'
      'E.MATRICULA'
      'DP.MATRICULA')
    Filtro.Strings = (
      'P.IDPESSOA=PR.IDTITULAR'
      'E.IDPESSOA=PR.IDTITULAR'
      'REC.IDPESSOA=PR.IDTITULAR'
      'REC.IDPESSOA=PR.IDPESSOA'
      'ROWNUM <= 3'
      'DP.IDPESSOA(+)=PR.IDPESSOA'
      'DP.IDTITULAR = PR.IDTITULAR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '40'
      '40'
      '40'
      '15'
      '40'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 299
    Top = 315
  end
  object dsRubricasDetalhe: TwwDataSource
    DataSet = qryRubricasDetalhe
    Left = 616
    Top = 264
  end
  object qryRubricasDetalhe: TwwQuery
    CachedUpdates = True
    BeforePost = qryRubricasDetalheBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  HST.MES,'
      '  HST.IDPESSOA,'
      '  PRD.CODIRRFDARF,'
      
        '  DECODE(PRD.FLGDESCONTO,0,HST.VALORPROVENTO,NULL) VALORPROVENTO' +
        ','
      
        '  DECODE(PRD.FLGDESCONTO,1,HST.VALORPROVENTO,NULL) VALORDESCONTO' +
        ','
      
        '  TO_CHAR(DECODE(PRD.FLGDESCONTO,1,NULL,2, DECODE(HST.VALORRECEB' +
        'IDO-HST.VALORPROVENTO,0,'
      
        '                                           DECODE(HST.VALORINFO,' +
        '0,NULL,HST.VALORINFO||'#39' (I)'#39'),'
      
        '                                           HST.VALORRECEBIDO-HST' +
        '.VALORPROVENTO||'#39' (R)'#39')))'
      '  INFORMATIVO,'
      '  PRD.FLGDESCONTO,'
      '  PRD.FLGIRRF,'
      '  /*PRD.FLGSALFAMILIA*/0 AS FLGSALFAM,     -- SOL 191668    '
      '  HST.CODIRRFDARF,'
      '  PRD.IDPROVENTO,'
      '  HST.SEQRUBRICA AS ORDEM,'
      '  PRD.CODPROVDESC AS CODRUBRICA ,'
      '  PRD.DESCRPROVDESC AS RUBRICA,'
      '  HST.PARCELAS,'
      '  DECODE(HST.FLGTIPODESC,'#39'Y'#39','#39'ORDEM'#39',NULL) AS  ORDEM,'
      '  DECODE(HST.FONTEPAGADORA,1,'#39'FUND'#39','#39'INSS'#39') AS FONTEPAGADORA,'
      '  HST.Idperfilinvest,'
      
        '  TRIM(PE.NOME || '#39' - '#39' ||cast(PE.IDPLANPREVCONTAB as varchar(10' +
        '))) as NOMEPLANO,'
      '   0 as VALORINFO,'
      '  0 as VLRPROVENTO,'
      ' 0 as IDPLANOCONTABIL'
      ''
      'FROM'
      '  PREVIA HST,'
      '  PROVDESC PRD,'
      '  PERFILINVEST PE'
      ''
      ''
      'WHERE'
      '  (HST.MESCOBRANCA = '#39'2002/02'#39')     AND'
      '  (HST.IDTITULAR   = 386019)        AND'
      '  (HST.IDPESSOA    = 386019)        AND'
      '  (PRD.IDPROVENTO  = HST.IDRUBRICA) AND'
      '  (PRD.FLGESPECIAL <> 2) AND'
      '  (HST.IDPERFILINVEST = PE.IDPERFILINVEST)'
      ''
      ''
      'ORDER BY'
      '  HST.SEQRUBRICA,'
      '  PRD.FLGIRRF,'
      '  HST.CODIRRFDARF'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRubDetalhe
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 614
    Top = 312
  end
  object qryInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ELG.IDPESSOA, ELG.IDPESSJUR, PPP.INSCRICAONUMERO, ELG.MAT' +
        'RICULA'
      'FROM ELEGPATRO ELG, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE PPP.INSCRICAONUMERO = :INSCRICAO'
      'AND PPP.IDPESSJUR = ELG.IDPESSJUR'
      'AND PPP.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND ELG.IDPESSOA = PPP.IDPESSOA'
      'AND ((PPP.FLGDESATIVADO = 0)'
      '     OR ((FLGDESATIVADO = 1) AND'
      '         NOT EXISTS (SELECT 1'
      '                     FROM PARTPREVPLAN P1'
      '                     WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                     AND P1.FLGDESATIVADO = 0)))')
    ValidateWithMask = True
    Left = 546
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'INSCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsSelecao: TwwDataSource
    DataSet = qrySelecao
    Left = 408
    Top = 344
  end
  object qrySelecao: TwwQuery
    BeforeScroll = qrySelecaoBeforeScroll
    AfterScroll = qrySelecaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CT.DESCRICAO, PR.MESCOBRANCA, PR.IDLOTE,'
      
        '       DECODE(LXF.idhstfolhabenef,NULL, '#39'N'#39', '#39'S'#39') AS EFETIVADO  ' +
        ' '
      'FROM PREVIA PR, CTRLINTERFACE CT, LOTEXHSTFOLHABENEF LXF'
      'WHERE PR.IDTITULAR = :TITULAR'
      'AND CT.IDPESSOA = :PIDFUNDACAO '
      'AND CT.IDLOTE = PR.IDLOTE'
      'AND CT.IDLOTE = LXF.IDLOTE(+)'
      'ORDER BY PR.IDLOTE DESC, PR.MESCOBRANCA'
      '--ORDER BY PR.MESCOBRANCA DESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 184
    Top = 312
  end
  object qryFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NOME,'
      '  FATOR,'
      '  BENEFICIARIO'
      'FROM'
      ' (SELECT DISTINCT'
      '    BPV.NOMEVALORBASE1 AS NOME,'
      '    BPP.VALORBASE1 AS FATOR,'
      '    P.NOME AS BENEFICIARIO'
      ''
      '  FROM'
      '    BENEFPLANOPART BPP,'
      '    BFCIARIOTITPLAN BFC,'
      '    BENEFPLANPREV BPV,'
      '    BENEFICIO B,'
      '    PESSOA P'
      ''
      '  WHERE BPP.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BPP.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BPV.FLGREFERENCIA = 0'
      '    AND BFC.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BFC.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BFC.IDPESSOA      = BPP.IDPESSOA'
      '    AND BFC.IDRESPONSAVEL = :PIDRESPONSAVEL'
      '    AND P.IDPESSOA        = BFC.IDPESSOA'
      '    AND B.IDBENEFICIO     = BPV.IDBENEFICIO'
      '    AND B.TIPOBENEFICIO  <> 99'
      ''
      '  UNION'
      ''
      '  SELECT DISTINCT'
      '    BPV.NOMEVALORBASE2 AS NOME,'
      '    BPP.VALORBASE2 AS FATOR,'
      '    P.NOME AS BENEFICIARIO'
      ''
      '  FROM'
      '    BENEFPLANOPART BPP,'
      '    BFCIARIOTITPLAN BFC,'
      '    BENEFPLANPREV BPV,'
      '    BENEFICIO B,'
      '    PESSOA P'
      ''
      '  WHERE BPP.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BPP.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BPV.FLGREFERENCIA = 0'
      '    AND BFC.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BFC.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BFC.IDPESSOA      = BPP.IDPESSOA'
      '    AND BFC.IDRESPONSAVEL = :PIDRESPONSAVEL'
      '    AND P.IDPESSOA        = BFC.IDPESSOA'
      '    AND B.IDBENEFICIO     = BPV.IDBENEFICIO'
      '    AND B.TIPOBENEFICIO  <> 99'
      ''
      '  UNION'
      ''
      '  SELECT DISTINCT'
      '    BPV.NOMEVALORBASE3 AS NOME,'
      '    BPP.VALORBASE3 AS FATOR,'
      '    P.NOME AS BENEFICIARIO'
      ''
      '  FROM'
      '    BENEFPLANOPART BPP,'
      '    BFCIARIOTITPLAN BFC,'
      '    BENEFPLANPREV BPV,'
      '    BENEFICIO B,'
      '    PESSOA P'
      ''
      '  WHERE BPP.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BPP.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BPV.FLGREFERENCIA = 0'
      '    AND BFC.IDPLANOPREV   = BPV.IDPLANOPREV'
      '    AND BFC.IDBENEFICIO   = BPV.IDBENEFICIO'
      '    AND BFC.IDPESSOA      = BPP.IDPESSOA'
      '    AND BFC.IDRESPONSAVEL = :PIDRESPONSAVEL'
      '    AND P.IDPESSOA        = BFC.IDPESSOA'
      '    AND B.IDBENEFICIO     = BPV.IDBENEFICIO'
      '    AND B.TIPOBENEFICIO  <> 99'
      ''
      '  UNION'
      ''
      '  SELECT DISTINCT'
      '    '#39'% RATEIO'#39' AS NOME,'
      '    BFC.PERCENTUAL AS FATOR,'
      '    P.NOME AS BENEFICIARIO'
      ''
      '  FROM'
      '    HSTBENEFBFCIARIO H,'
      '    BENEFPLANPREV BPV,'
      '    BFCIARIOTITPLAN BFC,'
      '    BENEFICIO B,'
      '    PESSOA P'
      ''
      '  WHERE H.IDTITULAR       = :PIDTITULAR'
      '    AND H.IDLOTE          = :PIDLOTE'
      '    AND H.IDPESSOA        = P.IDPESSOA'
      '    AND BFC.IDRESPONSAVEL = :PIDRESPONSAVEL'
      '    AND H.IDPESSOA       <> H.IDTITULAR'
      '    AND H.IDPLANOPREV     = BPV.IDPLANOPREV'
      '    AND H.IDBENEFICIO     = BPV.IDBENEFICIO'
      '    AND BPV.FLGREFERENCIA = 0'
      '    AND H.IDPLANOPREV     = BFC.IDPLANOPREV'
      '    AND H.IDPLANOORIGEM   = BFC.IDPLANOORIGEM'
      '    AND H.IDPESSJUR       = BFC.IDPESSJUR'
      '    AND H.IDBENEFICIO     = BFC.IDBENEFICIO'
      '    AND H.IDPESSOA        = BFC.IDPESSOA'
      '    AND H.IDTITULAR       = BFC.IDTITULAR'
      '    AND H.SEQPROPOSTA     = BFC.SEQPROPOSTA'
      '    AND B.IDBENEFICIO     = H.IDBENEFICIO'
      '    AND B.TIPOBENEFICIO  <> 99) G'
      ''
      'WHERE NOME IS NOT NULL'
      '  AND FATOR > 0'
      '')
    ValidateWithMask = True
    Left = 233
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end>
    object qryFatorFATOR: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 10
      FieldName = 'FATOR'
      DisplayFormat = '#0.000000'
    end
    object qryFatorNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 13
      FieldName = 'NOME'
      Size = 60
    end
    object qryFatorBENEFICIARIO: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 11
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
  end
  object dsFator: TDataSource
    DataSet = qryFator
    Left = 109
    Top = 303
  end
  object CdsBasePagamento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Campo'
        DataType = ftString
        Size = 26
      end
      item
        Name = 'Valor'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 821
    Top = 415
  end
  object SqlCampos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                         '#39' AS Campo,'
      
        '               '#39'                                                ' +
        '                                                               '#39 +
        ' AS Valor'
      '  FROM DUAL')
    ClientDataSet = CdsBasePagamento
    Left = 705
    Top = 313
  end
  object dsBasePagamento: TwwDataSource
    AutoEdit = False
    DataSet = CdsBasePagamento
    Left = 824
    Top = 467
  end
  object QryObtemBasePagamento: TwwQuery
    CachedUpdates = True
    BeforePost = QryObtemBasePagamentoBeforePost
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT ba.*,'
      '       pf.descricao as PORTADORFORMA,'
      
        '       Decode(numdocumento, NULL,NULL, Translate(To_Char(numdocu' +
        'mento/100,'#39'000,000,000.00'#39'),'#39',.'#39','#39'.-'#39')) cpf_mascara,'
      '       bc.nome as NOMEBANCO,'
      '       ag.nome as NOMEAGENCIA'
      'FROM BASEDEPAGAMENTO BA'
      '     join portadorforma pf on pf.codportforma = ba.codportforma'
      '     left join (select b.numbanco, p.nome from pessoa p'
      '             join banco b on p.idpessoa = b.idpessoa'
      '           ) bc on bc.numbanco = ba.numbanco'
      '     left join (select a.numagencia, p.nome from pessoa p'
      '             join agenciabancaria a on p.idpessoa = a.idpessoa'
      '           ) ag on ag.numagencia = ba.numbanco'
      'WHERE BA.IDLOTE =    :IDLOTE'
      'AND   BA.IDTITULAR = :IDTITULAR'
      'AND   BA.IDPESSOA =  :IDPESSOA'
      ' ')
    UpdateObject = updBasePagto
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'#,##0.00'#9'T'#9'T'
      'VALORDESCONTO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 808
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ImlPadrao: TImageList
    Left = 273
    Top = 10
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object updRubDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PREVIA SET'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  VALORINFO = :VALORINFO,'
      '  CODIRRFDARF = :CODIRRFDARF,'
      '  IDPLANOCONTABIL = :IDPLANOCONTABIL,'
      '  SEQRUBRICA = :SEQRUBRICA,'
      '  ALTMANUAL = :ALTMANUAL,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'WHERE'
      '      MES = :OLD_MES'
      '  AND MESCOBRANCA = :OLD_MESCOBRANCA'
      '  AND IDPESSJUR = :OLD_IDPESSJUR'
      '  AND IDRUBRICA = :OLD_IDRUBRICA'
      '  AND IDMOTIVO = :OLD_IDMOTIVO'
      '  AND IDPESSOA = :OLD_IDPESSOA'
      '  AND SEQRUBRICA = :OLD_SEQRUBRICA'
      '  AND IDTITULAR = :OLD_IDTITULAR'
      '  AND IDLOTE = :OLD_IDLOTE'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM PREVIA'
      ' WHERE'
      '       MES = :OLD_MES'
      '   AND MESCOBRANCA = :OLD_MESCOBRANCA'
      '   AND IDPESSJUR = :OLD_IDPESSJUR'
      '   AND IDRUBRICA = :OLD_IDRUBRICA'
      '   AND IDMOTIVO = :OLD_IDMOTIVO'
      '   AND IDPESSOA = :OLD_IDPESSOA'
      '   AND SEQRUBRICA = :OLD_SEQRUBRICA'
      '   AND IDTITULAR = :OLD_IDTITULAR'
      '   AND IDLOTE = :OLD_IDLOTE'
      ' ')
    Left = 617
    Top = 363
  end
  object qryDarf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODNATUREZA, DESCRICAO'
      '  FROM NATURENDIMENTO'
      ' ORDER BY DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 698
    Top = 464
  end
  object dsQryBasePagto: TwwDataSource
    AutoEdit = False
    DataSet = QryObtemBasePagamento
    Left = 808
    Top = 259
  end
  object updBasePagto: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE BASEDEPAGAMENTO SET'
      '  VLRBRUTO = :VLRBRUTO,  '
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  VLRLIQUIDO = :VLRLIQUIDO,'
      '  VLRIRREGRESSIVO = :VLRIRREGRESSIVO,'
      '  MARGEMCONSIGNAVEL = :MARGEMCONSIGNAVEL,'
      '  RENDABASE = :RENDABASE,'
      '  MARGEMREAL = :MARGEMREAL,'
      '  IRINFORMATIVO = :IRINFORMATIVO,'
      '  IRINFORMATIVO13 = :IRINFORMATIVO13,'
      '  IRCOMPENSADO = :IRCOMPENSADO,'
      '  IRCOMPENSADO13 = :IRCOMPENSADO13,'
      '  ALTMANUAL = :ALTMANUAL'
      'WHERE'
      '  IDBASEPGTO = :OLD_IDBASEPGTO')
    Left = 809
    Top = 355
  end
  object qryLogExcPrevia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO LOG_EXCLUSAO_PREVIA'
      '('
      '    IDLOGEXPREVIA,'
      '    mes,'
      '    mescobranca,'
      '    idpessjur,'
      '    idrubrica,'
      '    idmotivo,'
      '    referencia,'
      '    idpessoa,'
      '    seqrubrica,'
      '    codirrfdarf,'
      '    codcentrorespon,'
      '    idempresa,'
      '    recpag,'
      '    codtiprecdes,'
      '    idresponsavel,'
      '    numeroprocesso,'
      '    idpatro,'
      '    idplanoprev,'
      '    idtitular,'
      '    seqproposta,'
      '    idbeneficio,'
      '    codprovdesc,'
      '    idlote,'
      '    flgtipodesc,'
      '    valorprovento,'
      '    flgdesconto,'
      '    codmoeda,'
      '    idregracalculo,'
      '    flgcompoesalpart,'
      '    flgcompoesalbenef,'
      '    flgirrf,'
      '    valorcotas,'
      '    flgsrb,'
      '    flgok,'
      '    plano,'
      '    placonta,'
      '    codcentrocusto,'
      '    unidnegoc,'
      '    flgconcessao,'
      '    datapagamento,'
      '    idfavorecido,'
      '    fontepagadora,'
      '    codalterador,'
      '    flgindividual,'
      '    idmodulo,'
      '    valorinfo,'
      '    valorrecebido,'
      '    idversaoestorno,'
      '    codportforma,'
      '    dfloatpagto,'
      '    datainicio,'
      '    datafinal,'
      '    ideventogerador,'
      '    flgespecial,'
      '    flgpaga,'
      '    matricula,'
      '    flgeveninterno,'
      '    ordem,'
      '    codsubconta,'
      '    loteoriginal,'
      '    numprocinss,'
      '    inscricaonumero,'
      '    numbanco,'
      '    numagencia,'
      '    contacorrente,'
      '    placontac,'
      '    placontad,'
      '    codcentrocustoc,'
      '    codcentrocustod,'
      '    flgsalfam,'
      '    flgprovisorio,'
      '    idplanoorigem,'
      '    idresponnaorec,'
      '    flgpensaoalim,'
      '    parcelas,'
      '    idplanocontabil,'
      '    idfavdoc,'
      '    trgdtinclusao,'
      '    trguserinclusao,'
      '    idseqinternofb,'
      '    seqdocumento,'
      '    codccustodprovis,'
      '    codccustocprovis,'
      '    placontadprovis,'
      '    placontacprovis,'
      '    flgtemprovisao,'
      '    idrecebepgto,'
      '    idprocjud,'
      '    mescompreem,'
      '    idhstbitributacao,'
      '    altmanual,'
      '    IDOBS,'
      '    TRGDTALTERACAO,'
      '    TRGUSERALTERACAO    '
      ')'
      'VALUES '
      '('
      '    CM.SEQLOG_EXCLUSAO_PREVIA.NEXTVAL,'
      '    :mes,'
      '    :mescobranca,'
      '    :idpessjur,'
      '    :idrubrica,'
      '    :idmotivo,'
      '    :referencia,'
      '    :idpessoa,'
      '    :seqrubrica,'
      '    :codirrfdarf,'
      '    :codcentrorespon,'
      '    :idempresa,'
      '    :recpag,'
      '    :codtiprecdes,'
      '    :idresponsavel,'
      '    :numeroprocesso,'
      '    :idpatro,'
      '    :idplanoprev,'
      '    :idtitular,'
      '    :seqproposta,'
      '    :idbeneficio,'
      '    :codprovdesc,'
      '    :idlote,'
      '    :flgtipodesc,'
      '    :valorprovento,'
      '    :flgdesconto,'
      '    :codmoeda,'
      '    :idregracalculo,'
      '    :flgcompoesalpart,'
      '    :flgcompoesalbenef,'
      '    :flgirrf,'
      '    :valorcotas,'
      '    :flgsrb,'
      '    :flgok,'
      '    :plano,'
      '    :placonta,'
      '    :codcentrocusto,'
      '    :unidnegoc,'
      '    :flgconcessao,'
      '    :datapagamento,'
      '    :idfavorecido,'
      '    :fontepagadora,'
      '    :codalterador,'
      '    :flgindividual,'
      '    :idmodulo,'
      '    :valorinfo,'
      '    :valorrecebido,'
      '    :idversaoestorno,'
      '    :codportforma,'
      '    :dfloatpagto,'
      '    :datainicio,'
      '    :datafinal,'
      '    :ideventogerador,'
      '    :flgespecial,'
      '    :flgpaga,'
      '    :matricula,'
      '    :flgeveninterno,'
      '    :ordem,'
      '    :codsubconta,'
      '    :loteoriginal,'
      '    :numprocinss,'
      '    :inscricaonumero,'
      '    :numbanco,'
      '    :numagencia,'
      '    :contacorrente,'
      '    :placontac,'
      '    :placontad,'
      '    :codcentrocustoc,'
      '    :codcentrocustod,'
      '    :flgsalfam,'
      '    :flgprovisorio,'
      '    :idplanoorigem,'
      '    :idresponnaorec,'
      '    :flgpensaoalim,'
      '    :parcelas,'
      '    :idplanocontabil,'
      '    :idfavdoc,'
      '    :trgdtinclusao,'
      '    :trguserinclusao,'
      '    :idseqinternofb,'
      '    :seqdocumento,'
      '    :codccustodprovis,'
      '    :codccustocprovis,'
      '    :placontadprovis,'
      '    :placontacprovis,'
      '    :flgtemprovisao,'
      '    :idrecebepgto,'
      '    :idprocjud,'
      '    :mescompreem,'
      '    :idhstbitributacao,'
      '    :altmanual,'
      '    :IDOBS,'
      '    :TRGDTALTERACAO,'
      '    :TRGUSERALTERACAO    '
      ')')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 912
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idrubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idmotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'seqrubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codirrfdarf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcentrorespon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'recpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codtiprecdes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idresponsavel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroprocesso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpatro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'seqproposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codprovdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idlote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgtipodesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorprovento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgdesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codmoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idregracalculo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgcompoesalpart'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgcompoesalbenef'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgirrf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorcotas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgsrb'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgok'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placonta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcentrocusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unidnegoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgconcessao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfavorecido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fontepagadora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codalterador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgindividual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idmodulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorinfo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorrecebido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idversaoestorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codportforma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dfloatpagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datainicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ideventogerador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgespecial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgpaga'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgeveninterno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ordem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codsubconta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'loteoriginal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numprocinss'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inscricaonumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numbanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numagencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacorrente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placontac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placontad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcentrocustoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcentrocustod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgsalfam'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgprovisorio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idplanoorigem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idresponnaorec'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgpensaoalim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcelas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idplanocontabil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfavdoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trgdtinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trguserinclusao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idseqinternofb'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'seqdocumento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codccustodprovis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codccustocprovis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placontadprovis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placontacprovis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'flgtemprovisao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idrecebepgto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idprocjud'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mescompreem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idhstbitributacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'altmanual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDOBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRGDTALTERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRGUSERALTERACAO'
        ParamType = ptUnknown
      end>
  end
  object qryLogAltPrevia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO LOG_ALT_PREVIA'
      '('
      '  IDLOGALTPREVIA,'
      '  IDPESSOA,'
      '  IDTITULAR,'
      '  IDLOTE,'
      '  IDPLANOPREV,'
      '  MESCOBRANCA,'
      '  MES,'
      '  IDRUBRICA,'
      '  CAMPOALTERADO,'
      '  VLRANTERIOR,'
      '  VLRNOVO,'
      '  IDOBS'
      ') '
      'VALUES '
      '('
      '  SEQLOG_ALT_PREVIA.NEXTVAL,'
      '  :IDPESSOA,'
      '  :IDTITULAR,'
      '  :IDLOTE,'
      '  :IDPLANOPREV,'
      '  :MESCOBRANCA,'
      '  :MES,'
      '  :IDRUBRICA,'
      '  :CAMPOALTERADO,'
      '  :VLRANTERIOR,'
      '  :VLRNOVO,'
      '  :IDOBS'
      ')')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 912
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CAMPOALTERADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBS'
        ParamType = ptUnknown
      end>
  end
  object qryLogAltBase: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO LOG_ALT_BASEPGTO'
      '('
      '  IDLOALTBASEPGTO,'
      '  IDBASEPGTO,'
      '  CAMPOALTERADO,'
      '  VLRANTERIOR,'
      '  VLRNOVO,'
      '  IDOBS'
      ') '
      'VALUES '
      '('
      '  SEQLOG_ALT_BASEPGTO.NEXTVAL,'
      '  :IDBASEPGTO,'
      '  :CAMPOALTERADO,'
      '  :VLRANTERIOR,'
      '  :VLRNOVO,'
      '  :IDOBS'
      ')')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 936
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBASEPGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CAMPOALTERADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBS'
        ParamType = ptUnknown
      end>
  end
  object qryPlContab: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      '  FROM PLANPREVCONTABIL'
      ' WHERE ATIVO = '#39'S'#39
      '   AND IDPLANOPREVPREV = :IDPLANOPREV'
      ' ORDER BY NOME'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 696
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryPerfil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PE.Idperfilinvest, PE.IDPLANPREVCONTAB, PE.NOME, TRIM(PE.' +
        'NOME || '#39' - '#39' ||cast(PE.IDPLANPREVCONTAB as varchar(10))) as nom' +
        'eplano'
      '  FROM PERFILINVEST PE'
      ' WHERE FLGATIVO = 1'
      ' AND PE.IDPLANOPREV = :IDPLANOPREV')
    ValidateWithMask = True
    Left = 743
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryHstIsento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HB.IDHISTISENCAOIRRFBENF,'
      '       HB.IDPLANOPREV,'
      '       HB.IDBENEFICIO,'
      '       HB.NUMEROPROCESSO,'
      '       HB.IDPESSJUR,'
      '       HB.IDTITULAR,'
      '       HB.IDPLANOORIGEM,'
      '       HB.IDPESSOA,'
      '       HB.SEQPROPOSTA,'
      '       HB.FLGINDOCORRENCIA,'
      '       HB.DTINICIO,'
      '       HB.DTFIM,'
      '       HB.OBSERVACAO,'
      '       HB.TRGUSERINCLUSAO,'
      '       HB.TRGDTINCLUSAO,'
      '       HB.TRGUSERALTERACAO,'
      '       HB.TRGDTALTERACAO,'
      
        '       DECODE(HB.FLGINDOCORRENCIA,1,'#39'Lançamento único'#39','#39'Periódic' +
        'o'#39') AS DESCOCORRENCIA'
      '  FROM CM.HISTISENCAOIRRFBENF HB'
      ' WHERE HB.IDPLANOPREV = :IDPLANOPREV'
      '   AND HB.IDBENEFICIO = :IDBENEFICIO'
      '   AND HB.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND HB.IDPESSJUR = :IDPESSJUR'
      '   AND HB.IDTITULAR = :IDTITULAR'
      '   AND HB.IDPLANOORIGEM = :IDPLANOORIGEM'
      '   AND HB.IDPESSOA = :IDPESSOA'
      '   AND HB.SEQPROPOSTA = :SEQPROPOSTA')
    ValidateWithMask = True
    Left = 1036
    Top = 542
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOORIGEM'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptInputOutput
      end>
    object qryHstIsentoIDHISTISENCAOIRRFBENF: TFloatField
      FieldName = 'IDHISTISENCAOIRRFBENF'
      Visible = False
    end
    object qryHstIsentoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryHstIsentoIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryHstIsentoNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object qryHstIsentoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryHstIsentoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryHstIsentoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryHstIsentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryHstIsentoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryHstIsentoDTINICIO: TStringField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DTINICIO'
      EditMask = '!9999/99;1;_'
    end
    object qryHstIsentoDTFIM: TStringField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DTFIM'
      EditMask = '!9999/99;1;_'
    end
    object qryHstIsentoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryHstIsentoDESCOCORRENCIA: TStringField
      DisplayLabel = 'Ocorrência'
      FieldName = 'DESCOCORRENCIA'
      Size = 30
    end
  end
  object dsHstIsento: TwwDataSource
    AutoEdit = False
    DataSet = qryHstIsento
    Left = 1099
    Top = 542
  end
  object dsHstBenefIR: TwwDataSource
    DataSet = qryHstBenefIR
    Left = 1132
    Top = 442
  end
  object qryHstBenefIR: TwwQuery
    CachedUpdates = True
    AfterScroll = qryHstBenefIRAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      BBF.IDPLANOPREV,'
      '      BBF.IDPESSJUR,'
      '      BBF.IDPESSOA,'
      '      BEN.NOME AS BENEFICIO,'
      '      BBF.FLGDESCIRMES,'
      '      BBF.IDBENEFICIO,'
      '      BBF.IDSITBENEFICIO,'
      
        '      DECODE(BPP.FLGREFERENCIA,1,BEN.CODBENEFICIO,'#39' '#39') AS ESPECI' +
        'E,'
      
        '      DECODE(PF.FLGMOLESTIAGRAVE,1,'#39'SIM'#39','#39'NÃO'#39') AS MOLESTIAGRAVE' +
        ','
      '      DECODE(PRJ.SITPROCESSO,0,'#39'AÇÃO JUDICIAL EM LIMINAR'#39','
      '                             1,'#39'AÇÃO JUDICIAL JULGADA GANHA'#39','
      
        '                             2,'#39'AÇÃO JUDICIAL JULGADA PERDIDA'#39','#39 +
        ' '#39') AS SITPROCESSO,'
      '      (SELECT DECODE(COUNT(1),0,'#39'NÃO'#39','#39'SIM'#39') '
      '         FROM CM.HISTISENCAOIRRFBENF HB'
      '        WHERE HB.IDPLANOPREV    = BBF.IDPLANOPREV'
      '          AND HB.IDBENEFICIO    = BBF.IDBENEFICIO'
      '          AND HB.NUMEROPROCESSO = BBF.NUMEROPROCESSO'
      '          AND HB.IDPESSJUR      = BBF.IDPESSJUR'
      '          AND HB.IDTITULAR      = BBF.IDTITULAR'
      '          AND HB.IDPLANOORIGEM  = BBF.IDPLANOORIGEM'
      '          AND HB.IDPESSOA       = BBF.IDPESSOA'
      '          AND HB.SEQPROPOSTA    = BBF.SEQPROPOSTA'
      
        '          AND C.MESREFERENCIA BETWEEN HB.DTINICIO AND NVL(HB.DTF' +
        'IM, TO_CHAR(SYSDATE, '#39'YYYY/MM'#39'))'
      '       ) AS EXISTEISENCAO,'
      '     BBF.NUMEROPROCESSO,'
      '     BBF.IDTITULAR,'
      '     BBF.IDPLANOORIGEM,'
      '     BBF.SEQPROPOSTA'
      'FROM'
      '     BENEFBFCIARIO BBF,'
      '     BENEFICIO BEN,'
      '     PESSOAFISICA PF,'
      '     PROCJUD PRJ,'
      '     BENEFPLANPREV BPP,'
      '     CM.HISTISENCAOIRRFBENF HIB,'
      '     CTRLINTERFACE C'
      'WHERE BBF.IDPESSJUR      = :IDPESSJUR   AND'
      '     BBF.IDPESSOA       = :IDPESSOA     AND'
      '     BBF.IDSITBENEFICIO = 1             AND'
      '     BBF.IDPESSOA       = PF.IDPESSOA(+) AND'
      '     BBF.IDPESSOA       = PRJ.IDPESSOA(+) AND'
      '     BEN.IDBENEFICIO    = BBF.IDBENEFICIO AND'
      '     BBF.IDPLANOPREV    = BPP.IDPLANOPREV AND'
      '     BBF.IDBENEFICIO    = BPP.IDBENEFICIO  AND     '
      '     HIB.IDPLANOPREV(+)    = BBF.IDPLANOPREV AND'
      '     HIB.IDBENEFICIO(+)    = BBF.IDBENEFICIO AND'
      '     HIB.NUMEROPROCESSO(+) = BBF.NUMEROPROCESSO AND'
      '     HIB.IDPESSJUR(+)      = BBF.IDPESSJUR AND'
      '     HIB.IDTITULAR(+)      = BBF.IDTITULAR AND'
      '     HIB.IDPLANOORIGEM(+)  = BBF.IDPLANOORIGEM AND'
      '     HIB.IDPESSOA(+)       = BBF.IDPESSOA AND'
      '     HIB.SEQPROPOSTA(+)    = BBF.SEQPROPOSTA  AND'
      '     C.IDLOTE              = :IDLOTE AND'
      
        '     EXISTS (SELECT 1  FROM PREVIA PRV WHERE PRV.IDPATRO      = ' +
        'BBF.IDPESSJUR  AND'
      '     PRV.IDPESSOA       = BBF.IDPESSOA AND'
      '     PRV.IDBENEFICIO    = BBF.IDBENEFICIO AND'
      '     PRV.IDLOTE         = :IDLOTE AND'
      
        '     PRV.MESCOBRANCA BETWEEN HIB.DTINICIO AND NVL(HIB.DTFIM, TO_' +
        'CHAR(SYSDATE, '#39'YYYY/MM'#39')))')
    ControlType.Strings = (
      'FLGDESCIRMES;CheckBox;1;0')
    ValidateWithMask = True
    Left = 1099
    Top = 442
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object qryHstBenefIRBENEFICIO: TStringField
      DisplayLabel = 'BENEFÍCIO'
      DisplayWidth = 50
      FieldName = 'BENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryHstBenefIRESPECIE: TStringField
      DisplayLabel = 'ESPÉCIE '
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryHstBenefIRFLGDESCIRMES: TFloatField
      DisplayLabel = '  Não Calcula~ IRRF no Mês'
      DisplayWidth = 12
      FieldName = 'FLGDESCIRMES'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGDESCIRMES'
    end
    object qryHstBenefIRMOLESTIAGRAVE: TStringField
      DisplayLabel = 'MOLÉSTIA ~  GRAVE'
      DisplayWidth = 3
      FieldName = 'MOLESTIAGRAVE'
      Size = 3
    end
    object qryHstBenefIRSITPROCESSO: TStringField
      DisplayLabel = ' AÇÃO JUDICIAL'
      DisplayWidth = 29
      FieldName = 'SITPROCESSO'
      Size = 29
    end
    object qryHstBenefIRIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object qryHstBenefIRIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
    object qryHstBenefIRIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
      Visible = False
    end
    object qryHstBenefIRIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDBENEFICIO'
      Visible = False
    end
    object qryHstBenefIRIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDSITBENEFICIO'
      Visible = False
    end
    object qryHstBenefIRNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
    end
    object qryHstBenefIRIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryHstBenefIRIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryHstBenefIRSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryHstBenefIREXISTEISENCAO: TStringField
      FieldName = 'EXISTEISENCAO'
      Size = 3
    end
  end
  object dsBaseREINF: TwwDataSource
    DataSet = qryBaseREINF
    Left = 1180
    Top = 294
  end
  object qryBaseREINF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TR.DESCRICAO_REINF , '
      
        'DECODE(TR.CODFONTEPAGADORA,0,'#39'N/A'#39',1,'#39'FUND'#39',2,'#39'INSS'#39',TR.CODFONTE' +
        'PAGADORA) AS CODFONTEPAGADORA, '
      
        'DECODE(NVL(TR.IDPLANOPREV,0), 0, '#39'N/A'#39',TR.IDPLANOPREV) AS IDPLAN' +
        'OPREV, '
      'BR.VLREINF,'
      'BR.CODNATUREZAREINF'
      'FROM CM.BASEDEPAGAMENTO BA'
      
        'INNER JOIN  CM.BASEDEPAGAMENTOREINF BR ON BA.IDBASEPGTO = BR.IDB' +
        'ASEPGTO'
      'INNER JOIN  CM.TIPOREINF TR ON TR.IDTIPOREINF = BR.IDTIPOREINF'
      'WHERE BA.IDLOTE =    :IDLOTE'
      'AND   BA.IDTITULAR = :IDTITULAR'
      'AND   BA.IDPESSOA =  :IDRESPONSAVEL'
      'ORDER BY BR.CODNATUREZAREINF, TR.DESCRICAO_REINF')
    ValidateWithMask = True
    Left = 1131
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryBaseREINFCODNATUREZAREINF: TFloatField
      Alignment = taCenter
      DisplayLabel = 'NATUREZA REINF'
      DisplayWidth = 15
      FieldName = 'CODNATUREZAREINF'
    end
    object qryBaseREINFDESCRICAO_REINF: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 50
      FieldName = 'DESCRICAO_REINF'
      Size = 50
    end
    object qryBaseREINFCODFONTEPAGADORA: TStringField
      Alignment = taCenter
      DisplayLabel = 'FONTE PAGADORA'
      DisplayWidth = 10
      FieldName = 'CODFONTEPAGADORA'
      Size = 10
    end
    object qryBaseREINFIDPLANOPREV: TStringField
      Alignment = taCenter
      DisplayLabel = 'PLANO PREVIDENCIÁRIO'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Size = 10
    end
    object qryBaseREINFVLREINF: TFloatField
      DisplayLabel = 'VALOR'
      DisplayWidth = 10
      FieldName = 'VLREINF'
      DisplayFormat = '#0.00'
    end
  end
end
