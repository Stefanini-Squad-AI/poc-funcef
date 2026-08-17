object frmFrameConsultaHistorico: TfrmFrameConsultaHistorico
  Left = 0
  Top = 0
  Width = 796
  Height = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  ParentShowHint = False
  ShowHint = False
  TabOrder = 0
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 496
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 81
      Width = 796
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object PnlValores: TPanel
      Left = 0
      Top = 466
      Width = 796
      Height = 30
      Align = alBottom
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LblProventos: TLabel
        Left = 16
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Proventos'
      end
      object LblDescontos: TLabel
        Left = 227
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Descontos'
      end
      object LblValLiquido: TLabel
        Left = 450
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Valor Líquido '
      end
      object pnlProventos: TPanel
        Left = 71
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
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
        Left = 290
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
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
        Left = 526
        Top = 4
        Width = 125
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
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
    object PageControl1: TPageControl
      Left = 0
      Top = 84
      Width = 796
      Height = 382
      ActivePage = TbsBasePagamento
      Align = alClient
      TabOrder = 1
      OnChanging = PageControl1Changing
      object TabSheet1: TTabSheet
        Caption = '&Rubricas'
        object dbgDetalhe: TwwDBGrid
          Left = 0
          Top = 0
          Width = 788
          Height = 354
          Selected.Strings = (
            'MES'#9'8'#9'Mês Ref.'
            'ORDEM'#9'6'#9'Ordem'
            'CODRUBRICA'#9'7'#9'Rubrica'
            'CODRUBRICAEXT'#9'7'#9'Rubrica'
            'RUBRICA'#9'49'#9'Descrição'
            'VALORPROVENTO'#9'9'#9'Proventos'
            'VALORDESCONTO'#9'10'#9'Descontos'
            'PARCELAS'#9'4'#9'Prazo'
            'SEQRUB'#9'3'#9'Seq.'
            'INFORMATIVO'#9'10'#9'Informativo'
            'CODIRRFDARF'#9'4'#9'Darf'
            'FONTEPAGADORA'#9'5'#9'F.Pag.'
            'FLGIRRF'#9'2'#9' IR '
            'FLGSALFAM'#9'3'#9'S.Fam'
            'FLGTIPODESC'#9'1'#9'TD'
            'IDPLANOCONTABIL'#9'4'#9'PC'
            'NOMEPLANO'#9'73'#9'Perfil de Investimento'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRubricasDetalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dados do &Pagamento'
        ImageIndex = 1
        object pnlDadosPagDir: TPanel
          Left = 430
          Top = 0
          Width = 358
          Height = 354
          Align = alRight
          TabOrder = 0
          Visible = False
        end
        object pnlDadosPagGeral: TPanel
          Left = 0
          Top = 0
          Width = 430
          Height = 354
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlDadosPag2: TPanel
            Left = 0
            Top = 0
            Width = 430
            Height = 160
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object PnlDetalhes: TPanel
              Left = 0
              Top = 0
              Width = 371
              Height = 160
              Align = alLeft
              BevelInner = bvLowered
              TabOrder = 0
              object LblPortForma: TLabel
                Left = 7
                Top = 126
                Width = 86
                Height = 26
                Alignment = taRightJustify
                Caption = 'Contas/Caixas x Forma Pagamento'
                WordWrap = True
              end
              object lblVersaoEstorno: TLabel
                Left = 21
                Top = 133
                Width = 76
                Height = 13
                Caption = 'Pago na Versão'
                Visible = False
              end
              object LblDataNasc: TLabel
                Left = 7
                Top = 12
                Width = 51
                Height = 13
                Caption = 'Data Nasc'
              end
              object LblNumDep: TLabel
                Left = 157
                Top = 12
                Width = 66
                Height = 13
                Caption = 'Nº Dep. IRRF'
              end
              object LblBanco: TLabel
                Left = 7
                Top = 66
                Width = 31
                Height = 13
                Caption = 'Banco'
              end
              object LblAgencia: TLabel
                Left = 66
                Top = 66
                Width = 39
                Height = 13
                Caption = 'Agência'
              end
              object LblContaCorrente: TLabel
                Left = 127
                Top = 66
                Width = 71
                Height = 13
                Caption = 'Conta Corrente'
              end
              object LblArqTxt: TLabel
                Left = 243
                Top = 66
                Width = 62
                Height = 13
                Caption = 'Arquivo texto'
              end
              object LblSitucao: TLabel
                Left = 51
                Top = 109
                Width = 42
                Height = 13
                Caption = 'Situação'
              end
              object lblDtInicio: TLabel
                Left = 7
                Top = 31
                Width = 53
                Height = 13
                Caption = 'Data Início'
              end
              object lblDtFinal: TLabel
                Left = 121
                Top = 31
                Width = 42
                Height = 13
                Caption = 'Data Fim'
              end
              object dbedPortForma: TwwDBEdit
                Left = 100
                Top = 129
                Width = 266
                Height = 21
                Color = clInfoBk
                DataField = 'DESCRICAO'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedVersaoEstorno: TwwDBEdit
                Left = 100
                Top = 129
                Width = 61
                Height = 21
                Color = clInfoBk
                DataField = 'IDVERSAOPAGTO'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
                UnboundDataType = wwDefault
                Visible = False
                WantReturns = False
                WordWrap = False
              end
              object dbedSituacao: TwwDBEdit
                Left = 100
                Top = 105
                Width = 266
                Height = 21
                Color = clInfoBk
                DataField = 'SITUACAO'
                DataSource = dsPrevia
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedDataNasc: TwwDBEdit
                Left = 63
                Top = 8
                Width = 80
                Height = 21
                Color = clInfoBk
                DataField = 'DATANASC'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedNumDepIR: TwwDBEdit
                Left = 228
                Top = 8
                Width = 28
                Height = 21
                Color = clInfoBk
                DataField = 'NUMDEPIRRF'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbchIsentoIR: TDBCheckBox
                Left = 268
                Top = 10
                Width = 96
                Height = 17
                Caption = 'Isento de IRRF'
                DataField = 'FLGISENTOIRRF'
                DataSource = dsPrevia
                ReadOnly = True
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbedBanco: TwwDBEdit
                Left = 7
                Top = 79
                Width = 46
                Height = 21
                Color = clInfoBk
                DataField = 'NUMBANCO'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedAgencia: TwwDBEdit
                Left = 66
                Top = 79
                Width = 46
                Height = 21
                Color = clInfoBk
                DataField = 'NUMAGENCIA'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedContaCorrente: TwwDBEdit
                Left = 127
                Top = 79
                Width = 102
                Height = 21
                Color = clInfoBk
                DataField = 'CONTACORRENTE'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedNomeArqTxt: TwwDBEdit
                Left = 243
                Top = 79
                Width = 123
                Height = 21
                Color = clInfoBk
                DataField = 'NOMETXT'
                DataSource = dsPrevia
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edtDtInicio: TEdit
                Left = 7
                Top = 43
                Width = 85
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 10
              end
              object edtDtFinal: TEdit
                Left = 121
                Top = 43
                Width = 85
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 11
              end
              object chkBenefProvisorio: TDBCheckBox
                Left = 229
                Top = 45
                Width = 106
                Height = 17
                Caption = 'Benef. Provisório'
                TabOrder = 12
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
            end
            object pnlDadosPag1: TPanel
              Left = 371
              Top = 0
              Width = 59
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object PnlSRB: TPanel
                Left = 0
                Top = 0
                Width = 59
                Height = 55
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object pnlMostraSRB: TPanel
                  Left = 2
                  Top = 2
                  Width = 413
                  Height = 51
                  BevelInner = bvLowered
                  TabOrder = 0
                  object lblValorSRB: TLabel
                    Left = 21
                    Top = 10
                    Width = 49
                    Height = 13
                    Caption = 'Valor SRB'
                  end
                  object lblValorINSS: TLabel
                    Left = 157
                    Top = 10
                    Width = 52
                    Height = 13
                    Caption = 'Valor INSS'
                  end
                  object lblSuplementacao: TLabel
                    Left = 288
                    Top = 10
                    Width = 62
                    Height = 13
                    Caption = 'Valor Integral'
                  end
                  object pnlValorSRB: TPanel
                    Left = 19
                    Top = 25
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
                    Left = 155
                    Top = 25
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
                    Left = 286
                    Top = 25
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
                end
              end
              object wwDBgrid1: TwwDBGrid
                Left = 0
                Top = 55
                Width = 59
                Height = 105
                Selected.Strings = (
                  'FATOR'#9'14'#9'Fator'
                  'NOME'#9'24'#9'Descrição'
                  'BENEFICIARIO'#9'24'#9'Beneficiário')
                MemoAttributes = []
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = False
                Align = alClient
                DataSource = dsFator
                KeyOptions = []
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
                TabOrder = 1
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
          end
          object pnlFavorecido: TPanel
            Left = 0
            Top = 160
            Width = 430
            Height = 47
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            Visible = False
            object LB: TLabel
              Left = 7
              Top = 5
              Width = 125
              Height = 13
              Caption = 'Favorecido do Pagamento'
            end
            object wwDBEdit1: TwwDBEdit
              Left = 7
              Top = 21
              Width = 412
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'FAVORECIDO'
              DataSource = dsPrevia
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      object TbsBasePagamento: TTabSheet
        Caption = 'Base de Pagamento'
        ImageIndex = 2
        object PnlBasePagamento: TPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 354
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object dbgBasePagamento: TDBGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 354
            Align = alClient
            DataSource = dsBasePagamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'CAMPO'
                Width = 165
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Width = 600
                Visible = True
              end>
          end
          object pnlBasePagDir: TPanel
            Left = 603
            Top = 0
            Width = 185
            Height = 354
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object TbsConciliacaoCredito: TTabSheet
        Caption = 'Conciliação de Crédito Efetuado'
        ImageIndex = 3
        object PnlConcCredito: TPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 354
          Align = alClient
          TabOrder = 0
          object dbgConcCredito: TDBGrid
            Left = 1
            Top = 1
            Width = 786
            Height = 352
            Align = alClient
            DataSource = dsConcCreditoEfetuado
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawDataCell = dbgConcCreditoDrawDataCell
            OnDrawColumnCell = dbgConcCreditoDrawColumnCell
            OnDblClick = dbgConcCreditoDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAOEVENTO'
                Title.Caption = 'Evento'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEARQUIVO'
                Title.Caption = 'Arquivo de Regularização'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMEROAR'
                Title.Caption = 'Documento a Receber'
                Width = 117
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAVENCTOAR'
                Title.Caption = 'Data Vencimento'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMEROAP'
                Title.Caption = 'Documento a Pagar'
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAVENCTOAP'
                Title.Caption = 'Data Vencimento'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAREGULARIZACAO'
                Title.Caption = 'Data Regularização'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPOREGULARIZACAO'
                Title.Caption = 'Tipo Regularização'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMBANCO'
                Title.Caption = 'Banco'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMAGENCIA'
                Title.Caption = 'Agência'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTABANCARIA'
                Title.Caption = 'Conta'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBSERVACAO'
                Title.Caption = 'Observação'
                Width = 300
                Visible = True
              end>
          end
        end
      end
    end
    object PnlHistorico: TPanel
      Left = 0
      Top = 0
      Width = 796
      Height = 81
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object dbgHistorico: TwwDBGrid
        Left = 2
        Top = 2
        Width = 497
        Height = 77
        Selected.Strings = (
          'IDHSTFOLHABENEF'#9'6'#9'Versão'
          'MESCOBRANCA'#9'7'#9'Mês'
          'DATAPAGAMENTO'#9'10'#9'Dt. Pagto.'
          'HISTORICO'#9'50'#9'Histórico')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSelecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
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
      object DBGridRecebedor: TwwDBGrid
        Left = 499
        Top = 2
        Width = 295
        Height = 77
        Selected.Strings = (
          'BENEFICIARIO'#9'45'#9'Recebedor'#9'F')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = DBGridRecebedorRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alRight
        DataSource = dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = DBGridRecebedorCalcCellColors
        OnColEnter = DBGridRecebedorColEnter
        OnColExit = DBGridRecebedorColExit
        IndicatorColor = icBlack
      end
    end
  end
  object qryPrevia: TwwQuery
    AfterOpen = qryPreviaAfterOpen
    AfterScroll = qryPreviaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJR.NOME AS PATROCINADORA,'
      '  TIT.NOME AS TITULAR,'
      '  ELG.MATRICULA,'
      '  BEN.NOME AS BENEFICIARIO,'
      '  PLP.NOME AS PLANO,'
      '  NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS,'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(HST.FLGESTORNO,'
      '           Null, '#39'PAGAMENTO NORMAL'#39','
      '           0,    '#39'PAGAMENTO NORMAL'#39','
      '           1,    '#39'PAGAMENTO PENDENTE'#39','
      '           2,    '#39'PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'#39','
      
        '           3,    '#39'PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO P' +
        'ARA CAP)'#39','
      '           9,    '#39'PAGAMENTO INDEVIDO ESTORNADO'#39') AS SITUACAO,'
      '  HST.IDVERSAOPAGTO,'
      
        '  SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),7,4)||SUBSTR(TO' +
        '_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),3,3) AS DATAPAGAMENTO,'
      '  NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF,'
      
        '  NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIR' +
        'RF,'
      '  PSF.DATANASC,'
      '  HST.IDRESPONSAVEL,'
      '  HST.IDRECEBEPGTO,'
      '  FAV.NOME AS FAVORECIDO,'
      '  HST.MESCOBRANCA,'
      '  HST.IDPESSJUR,'
      '  HST.NUMBANCO,'
      '  HST.NUMAGENCIA,'
      '  HST.CONTACORRENTE,'
      '  HFCAP.NOMETXT,'
      '  PTF.DESCRICAO'
      'FROM'
      '  HISTRUBSAL HST,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO ELG,'
      '  PESSOAFISICA PSF,'
      '  PESSOA TIT,'
      '  PESSOA BEN,'
      '  PLANPREV PLP,'
      '  PESSOA PJR,'
      '  PESSOA FAV,'
      '  HSTFOLHABENEFCAP HFCAP,'
      '  PORTADORFORMA PTF'
      'WHERE'
      '  (HST.IDHSTFOLHABENEF = :IDFOLHA)                 AND'
      '  (HST.IDTITULAR       = :IDTITULAR)               AND'
      '  (HST.IDHSTFOLHABENEF = HFCAP.IDHSTFOLHABENEF(+)) AND'
      '  (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+))    AND'
      '  (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+))      AND'
      '  (PPP.IDPESSJUR       = HST.IDPATRO)              AND'
      '  (PJR.IDPESSOA        = HST.IDPATRO)              AND'
      '  (PPP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
      '  (PPP.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (TIT.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (BEN.IDPESSOA        = HST.IDRESPONSAVEL)        AND'
      '  (PLP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
      '  (ELG.IDPESSOA        = HST.IDTITULAR)            AND'
      '  (PSF.IDPESSOA        = BEN.IDPESSOA)             AND'
      '  (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 196
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object dsPrevia: TwwDataSource
    DataSet = qryPrevia
    Left = 226
    Top = 54
  end
  object dsRubricasDetalhe: TwwDataSource
    DataSet = qryRubricasDetalhe
    Left = 264
    Top = 22
  end
  object qryRubricasDetalhe: TwwQuery
    AfterOpen = qryRubricasDetalheAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  HST.MES,'
      '  HST.IDPESSOA,'
      '  HST.IDPLANOCONTABIL,'
      '  HST.VALORPROVENTO AS IDPROVENTO,'
      
        '  NVL(DECODE(PRD.FLGDESCONTO,0,HST.VALORPROVENTO,NULL), '#39'0,00'#39') ' +
        'VALORPROVENTO,'
      
        '  NVL(DECODE(PRD.FLGDESCONTO,1,HST.VALORPROVENTO,NULL), '#39'0,00'#39') ' +
        'VALORDESCONTO,'
      '  PRD.FLGDESCONTO,'
      '  HST.ORDEM,'
      '  PRD.CODIRRFDARF,'
      '  HST.IDRUBRICA AS CODRUBRICA,'
      ''
      '  HST.PARCELAS, HST.FLGTIPODESC,'
      '  DECODE(HST.FLGTIPODESC,'#39'Y'#39',HST.ORDEM,NULL) AS SEQRUB,'
      
        '  DECODE(HST.FONTEPAGADORA,1,'#39'FUND'#39',2,'#39'INSS'#39',4,'#39'PATRO'#39',NULL) AS ' +
        'FONTEPAGADORA,'
      '  '
      '  PRD.CODPROVDESC AS CODRUBRICAEXT,'
      '  PRD.DESCRPROVDESC AS RUBRICA ,'
      '  HST.FLGIRRF,'
      '  TO_CHAR(DECODE(PRD.FLGDESCONTO,1,NULL,2,'
      
        '                                DECODE(HST.VALORRECEBIDO-HST.VAL' +
        'ORPROVENTO,0,'
      
        '                                DECODE(HST.VALORINFO,0,NULL,HST.' +
        'VALORINFO||'#39' (I)'#39'),'
      
        '                                HST.VALORRECEBIDO-HST.VALORPROVE' +
        'NTO||'#39' (R)'#39'))) AS INFORMATIVO,'
      '  HST.FLGSALFAM,'
      '  HST.Idperfilinvest,'
      
        '  TRIM(PE.NOME || '#39' - '#39' ||cast(PE.IDPLANOPREV as varchar(10))) a' +
        's NOMEPLANO,'
      '   HST.FLGESTORNO'
      ''
      'FROM'
      '  HISTRUBSAL HST,'
      '  PROVDESC PRD,'
      'PERFILINVEST PE'
      ''
      'WHERE'
      '  (HST.IDHSTFOLHABENEF = :IDFOLHA)      AND'
      '  (HST.IDTITULAR       = :IDTITULAR)    AND'
      '  (HST.IDPESSOA        = :IDPESSOA)     AND'
      '  (PRD.IDPROVENTO      = HST.IDRUBRICA) AND'
      ' (HST.IDPERFILINVEST = PE.IDPERFILINVEST(+)) AND'
      '  (PRD.FLGESPECIAL    <> 2)'
      ''
      'ORDER BY'
      '  PRD.FLGDESCONTO'
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
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'#,##0.00'#9'T'#9'T'
      'VALORDESCONTO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 286
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 167
    Top = 54
  end
  object dsFator: TDataSource
    DataSet = qryFator
    Left = 137
    Top = 38
  end
  object qryFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NOME,'
      '  FATOR,'
      '  BENEFICIARIO'
      ''
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
      '    AND H.MES             = :PMES'
      '    AND H.IDHSTFOLHABENEF = :IDFOLHA'
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
      ' ')
    ValidateWithMask = True
    Left = 109
    Top = 38
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
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object dsSelecao: TwwDataSource
    DataSet = qrySelecao
    Left = 42
    Top = 38
  end
  object qrySelecao: TwwQuery
    AfterScroll = qrySelecaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT HIS.HISTORICO, HST.MESCOBRANCA, HST.IDHSTFOLHABE' +
        'NEF,'
      '       HST.DATAPAGAMENTO'
      'FROM HISTRUBSAL HST, HSTFOLHABENEF HIS'
      'WHERE HST.IDTITULAR = :TITULAR'
      'AND HST.IDMODULO = 18'
      'AND HIS.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF'
      
        'ORDER BY HST.DATAPAGAMENTO DESC, HST.MESCOBRANCA DESC, HST.IDHST' +
        'FOLHABENEF DESC')
    ValidateWithMask = True
    Left = 79
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptInput
        Value = '11'
      end>
    object qrySelecaoIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão'
      DisplayWidth = 6
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.HISTORICO'
    end
    object qrySelecaoMESCOBRANCA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 7
    end
    object qrySelecaoDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto.'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
      Origin = 'BASEDADOS.HISTRUBSAL.DATAPAGAMENTO'
    end
    object qrySelecaoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
  end
  object QryObtemBasePagamento: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      ' SELECT --BA.IDBASEPGTO,'
      '        BA.IDTITULAR,'
      '        BA.IDPESSOA,'
      '        BA.MARGEMREAL,'
      '        BA.RENDABASE,'
      '        BA.MARGEMCONSIGNAVEL,'
      '        BA.IRCOMPENSADO13,'
      '        BA.IRCOMPENSADO,'
      '        BA.IRINFORMATIVO13,'
      '        BA.IRINFORMATIVO,'
      '        BA.NUMDOCUMENTO,'
      '        BA.DATANASC,'
      '        BA.CONTACORRENTE,'
      '        BA.NUMAGENCIA,'
      '        BA.NUMBANCO,'
      '        BA.NUMDEPIRRF,'
      '        BA.FLGSOMAIRSUPINSS,'
      '        BA.NUMPROCINSS,'
      '        BA.DATAFIMMOLESTIA,'
      '        BA.DATAINICIOMOLESTIA,'
      '        BA.FLGMOLESTIAGRAVE,'
      '        BA.FLGISENTOIRRF,'
      '        BA.IDHSTFOLHABENEF,'
      '        BA.FLGEFETIVADO,'
      ' '#9#9'--0.0 as FLGRISCO, -- BA.FLGRISCO, -- BANCO DE RISCO'
      '        BA.TIPOFOLHA,'
      '        SUM(nvl(BA.VLRLIQUIDO,0)) VLRLIQUIDO,'
      '        SUM(nvl(BA.VLRDESCONTO,0)) VLRDESCONTO,'
      '        SUM(nvl(BA.VLRBRUTO,0)) VLRBRUTO,'
      '        SUM(nvl(BA.VLRIRREGRESSIVO,0)) VLRIRREGRESSIVO,'
      
        '        SUM(nvl(BA.PERCENTUALIRREGRESSIVO,0)) PERCENTUALIRREGRES' +
        'SIVO,'
      
        '        SUM(nvl(BA.BASECALCIRREGRESSIVO,0)) BASECALCIRREGRESSIVO' +
        ','
      '        SUM(nvl(BA.PRAZOMEDIOPONDERADO,0)) PRAZOMEDIOPONDERADO,'
      '        BA.MESCOBRANCA,'
      '        BA.MES,'
      '        BA.DATAPAGAMENTO,'
      '        ( SELECT DISTINCT B.MATRICULA'
      '             FROM BASEDEPAGAMENTO B'
      '            WHERE B.IDPESSOA = BA.IDPESSOA'
      '              AND B.IDTITULAR = BA.IDTITULAR'
      '              AND B.IDHSTFOLHABENEF = BA.IDHSTFOLHABENEF'
      '              AND B.MATRICULA IS NOT NULL ) MATRICULA,'
      '        pf.descricao as PORTADORFORMA,'
      
        '        Decode(BA.TIPOFOLHA, 1, '#39'Abono'#39', 2, '#39'Antecipação de Abon' +
        'o'#39', 3, '#39'Reprocessamento'#39', 4, '#39'Pagamento Pendente'#39', 5, '#39'Extra Fol' +
        'ha'#39', 6, '#39'Resgate'#39', '#39'Manutenção'#39') AS TIPOPAGAMENTO,'
      
        '        cast(Decode(numdocumento, NULL, NULL, Translate(To_Char(' +
        'numdocumento/100, '#39'000,000,000.00'#39'), '#39',.'#39', '#39'.-'#39')) as varchar2(14' +
        ')) cpf_mascara,'
      '        bc.nome as NOMEBANCO,'
      '        ag.nome as NOMEAGENCIA,'
      '        --BA.TRGUSERINCLUSAO,'
      '        --BA.TRGDTINCLUSAO,'
      '        --BA.TRGUSERALTERACAO,'
      '        --BA.TRGDTALTERACAO,'
      '        BA.CODPORTFORMA,'
      '        --BA.IDLOTE,'
      '        BA.ALTMANUAL'
      '        '
      
        '   FROM BASEDEPAGAMENTO BA join portadorforma pf on pf.codportfo' +
        'rma = BA.codportforma left join '
      '   ( select b.numbanco, p.nome'
      
        '       from pessoa p join banco b on p.idpessoa = b.idpessoa) bc' +
        ' on bc.numbanco = BA.numbanco '
      
        '     left join ( select a.numagencia, p.nome from pessoa p join ' +
        'agenciabancaria a on p.idpessoa = a.idpessoa) ag on ag.numagenci' +
        'a = BA.numbanco'
      ''
      '  WHERE BA.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '    AND BA.IDPESSOA =  :IDPESSOA'
      '    AND BA.IDTITULAR = :IDTITULAR'
      ''
      '  GROUP BY --BA.IDBASEPGTO,'
      '        BA.IDTITULAR,'
      '        BA.IDPESSOA,'
      '        BA.MES,'
      '        BA.MARGEMREAL,'
      '        BA.RENDABASE,'
      '        BA.MARGEMCONSIGNAVEL,'
      '        BA.IRCOMPENSADO13,'
      '        BA.IRCOMPENSADO,'
      '        BA.IRINFORMATIVO13,'
      '        BA.IRINFORMATIVO,'
      '        BA.NUMDOCUMENTO,'
      '        BA.DATANASC,'
      '        BA.CONTACORRENTE,'
      '        BA.NUMAGENCIA,'
      '        BA.NUMBANCO,'
      '        BA.NUMDEPIRRF,'
      '        BA.FLGSOMAIRSUPINSS,'
      '        BA.NUMPROCINSS,'
      '        BA.DATAFIMMOLESTIA,'
      '        BA.DATAINICIOMOLESTIA,'
      '        BA.FLGMOLESTIAGRAVE,'
      '        BA.FLGISENTOIRRF,'
      '        BA.IDHSTFOLHABENEF,'
      '        BA.FLGEFETIVADO,'
      '        -- BA.FLGRISCO, -- BANCO DE RISCO'
      #9#9'BA.TIPOFOLHA,'
      '        BA.MESCOBRANCA,'
      '        BA.DATAPAGAMENTO,'
      '        pf.descricao,'
      
        '        decode(BA.TIPOFOLHA, 1, '#39'Abono'#39', 2, '#39'Antecipação de Abon' +
        'o'#39', 3, '#39'Reprocessamento'#39', 4, '#39'Pagamento Pendente'#39', 5, '#39'Extra Fol' +
        'ha'#39', 6, '#39'Resgate'#39', '#39'Manutenção'#39'),'
      
        '        Decode(numdocumento, NULL, NULL, Translate(To_Char(numdo' +
        'cumento/100, '#39'000,000,000.00'#39'), '#39',.'#39', '#39'.-'#39') ),'
      '        bc.nome,'
      '        ag.nome,'
      '        BA.IDPESSOA,'
      '        BA.IDTITULAR,'
      '        BA.IDHSTFOLHABENEF,'
      '        --BA.TRGUSERINCLUSAO,'
      '        --BA.TRGDTINCLUSAO,'
      '        --BA.TRGDTALTERACAO,'
      '        BA.CODPORTFORMA,'
      #9#9'--BA.IDLOTE,'
      #9#9'BA.ALTMANUAL'
      ' ')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'#,##0.00'#9'T'#9'T'
      'VALORDESCONTO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 410
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object QryObtemBasePagamentoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IDTITULAR'
    end
    object QryObtemBasePagamentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IDPESSOA'
    end
    object QryObtemBasePagamentoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.MATRICULA'
      Size = 13
    end
    object QryObtemBasePagamentoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.DATAPAGAMENTO'
    end
    object QryObtemBasePagamentoMES: TStringField
      FieldName = 'MES'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.MES'
      Size = 7
    end
    object QryObtemBasePagamentoMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.MESCOBRANCA'
      Size = 7
    end
    object QryObtemBasePagamentoPRAZOMEDIOPONDERADO: TFloatField
      FieldName = 'PRAZOMEDIOPONDERADO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.PRAZOMEDIOPONDERADO'
      DisplayFormat = '##0.00'
    end
    object QryObtemBasePagamentoPERCENTUALIRREGRESSIVO: TFloatField
      FieldName = 'PERCENTUALIRREGRESSIVO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.PERCENTUALIRREGRESSIVO'
      DisplayFormat = '##0.00'
    end
    object QryObtemBasePagamentoBASECALCIRREGRESSIVO: TFloatField
      FieldName = 'BASECALCIRREGRESSIVO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.BASECALCIRREGRESSIVO'
    end
    object QryObtemBasePagamentoVLRIRREGRESSIVO: TFloatField
      FieldName = 'VLRIRREGRESSIVO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.VLRIRREGRESSIVO'
    end
    object QryObtemBasePagamentoVLRBRUTO: TFloatField
      FieldName = 'VLRBRUTO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.VLRBRUTO'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.VLRDESCONTO'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoTIPOFOLHA: TFloatField
      FieldName = 'TIPOFOLHA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.TIPOFOLHA'
    end
    object QryObtemBasePagamentoFLGEFETIVADO: TFloatField
      FieldName = 'FLGEFETIVADO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.FLGEFETIVADO'
    end
    object QryObtemBasePagamentoIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IDHSTFOLHABENEF'
    end
    object QryObtemBasePagamentoFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.FLGISENTOIRRF'
    end
    object QryObtemBasePagamentoFLGMOLESTIAGRAVE: TFloatField
      FieldName = 'FLGMOLESTIAGRAVE'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.FLGMOLESTIAGRAVE'
    end
    object QryObtemBasePagamentoDATAINICIOMOLESTIA: TDateTimeField
      FieldName = 'DATAINICIOMOLESTIA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.DATAINICIOMOLESTIA'
    end
    object QryObtemBasePagamentoDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.DATAFIMMOLESTIA'
    end
    object QryObtemBasePagamentoNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.NUMPROCINSS'
      Size = 15
    end
    object QryObtemBasePagamentoFLGSOMAIRSUPINSS: TFloatField
      FieldName = 'FLGSOMAIRSUPINSS'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.FLGSOMAIRSUPINSS'
    end
    object QryObtemBasePagamentoNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.NUMDEPIRRF'
    end
    object QryObtemBasePagamentoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.NUMBANCO'
      Size = 10
    end
    object QryObtemBasePagamentoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object QryObtemBasePagamentoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.CONTACORRENTE'
      Size = 15
    end
    object QryObtemBasePagamentoDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.DATANASC'
    end
    object QryObtemBasePagamentoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.CODPORTFORMA'
    end
    object QryObtemBasePagamentoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object QryObtemBasePagamentoIRINFORMATIVO: TFloatField
      FieldName = 'IRINFORMATIVO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IRINFORMATIVO'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoIRINFORMATIVO13: TFloatField
      FieldName = 'IRINFORMATIVO13'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IRINFORMATIVO13'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoIRCOMPENSADO: TFloatField
      FieldName = 'IRCOMPENSADO'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IRCOMPENSADO'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoIRCOMPENSADO13: TFloatField
      FieldName = 'IRCOMPENSADO13'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.IRCOMPENSADO13'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoMARGEMCONSIGNAVEL: TFloatField
      FieldName = 'MARGEMCONSIGNAVEL'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.MARGEMCONSIGNAVEL'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoRENDABASE: TFloatField
      FieldName = 'RENDABASE'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.RENDABASE'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoMARGEMREAL: TFloatField
      FieldName = 'MARGEMREAL'
      Origin = 'BASEDADOS.BASEDEPAGAMENTO.MARGEMREAL'
      DisplayFormat = '#,##0.00'
    end
    object QryObtemBasePagamentoPORTADORFORMA: TStringField
      FieldName = 'PORTADORFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object QryObtemBasePagamentoCPF_MASCARA: TStringField
      FieldName = 'CPF_MASCARA'
      Size = 15
    end
    object QryObtemBasePagamentoNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object QryObtemBasePagamentoNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object QryObtemBasePagamentoALTMANUAL: TStringField
      FieldName = 'ALTMANUAL'
      Size = 1
    end
    object QryObtemBasePagamentoTIPOPAGAMENTO: TStringField
      FieldName = 'TIPOPAGAMENTO'
    end
  end
  object qryConcCreditoEfetuado: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT H.IDHSTREGULARIZACAOFOLHA,'
      '       C.IDCADEVENTOSDEREGULARIZACAO,'
      '       C.DESCRICAOEVENTO,'
      '       H.ARQUIVOREGULARIZACAO ,'
      
        '       TO_DATE(H.DATAREGULARIZACAO,'#39'DD/MM/RRRR'#39') AS DATAREGULARI' +
        'ZACAO,'
      '       H.TIPOREGULARIZACAO,'
      '       H.ARQUIVOREGULARIZACAO,'
      '       d1.coddocumento AS NUMEROAP,'
      '       d1.Datavencto As DataVenctoAP,'
      '       d.coddocumento AS NUMEROAR,       '
      '       d.Datavencto As DataVenctoAR,'
      '       H.NUMBANCO,'
      '       H.NUMAGENCIA,'
      '       H.CONTABANCARIA,'
      '       H.OBSERVACAO,'
      '       H.EXTENSAOARQUIVO,'
      '       H.NOMEARQUIVO,'
      
        '       NVL(A.CODIGORETORNOARQUIVO,C.CODIGORETORNO) AS CODIGORETO' +
        'RNO'
      'FROM  BASEDEPAGAMENTO B'
      ' Left Outer JOIN ARQUIVODERETORNOCAIXA A'
      
        '    ON (A.IDBASEPGTO  = B.IDBASEPGTO AND A.IDHSTFOLHABENEF = B.I' +
        'DHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND A.IDTITULAR = B.I' +
        'DTITULAR) '
      ' Left Outer JOIN HSTREGULARIZACAOFOLHA H'
      '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)'
      ' Left Outer JOIN PORTADORFORMA P'
      '    ON (P.CODPORTFORMA = B.CODPORTFORMA)'
      ' Left Outer JOIN CADASTROEVENTOSDEREGULARIZACAO C'
      
        '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARI' +
        'ZACAO)'
      
        '  left outer join documento d on (d.coddocumento = h.coddocument' +
        'ocar)    '
      
        ' left outer join documento d1 on (d1.coddocumento = h.coddocumen' +
        'tocap)'
      '  WHERE  B.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '  AND    B.IDPESSOA  =  :IDPESSOA'
      '  AND    B.IDTITULAR =  :IDTITULAR'
      'ORDER BY   H.TRGDTINCLUSAO  DESC, H.DATAREGULARIZACAO DESC'
      ''
      ' ')
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'#,##0.00'#9'T'#9'T'
      'VALORDESCONTO'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 630
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object qryConcCreditoEfetuadoIDHSTREGULARIZACAOFOLHA: TFloatField
      FieldName = 'IDHSTREGULARIZACAOFOLHA'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.IDHSTREGULARIZACAOFOLHA'
    end
    object qryConcCreditoEfetuadoIDCADEVENTOSDEREGULARIZACAO: TFloatField
      FieldName = 'IDCADEVENTOSDEREGULARIZACAO'
      Origin = 
        'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.IDCADEVENTOSDEREGULARIZ' +
        'ACAO'
    end
    object qryConcCreditoEfetuadoDESCRICAOEVENTO: TStringField
      FieldName = 'DESCRICAOEVENTO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.DESCRICAOEVENTO'
      Size = 100
    end
    object qryConcCreditoEfetuadoARQUIVOREGULARIZACAO: TBlobField
      FieldName = 'ARQUIVOREGULARIZACAO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.ARQUIVOREGULARIZACAO'
      BlobType = ftBlob
      Size = 1
    end
    object qryConcCreditoEfetuadoDATAREGULARIZACAO: TDateTimeField
      FieldName = 'DATAREGULARIZACAO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.DATAREGULARIZACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryConcCreditoEfetuadoTIPOREGULARIZACAO: TStringField
      FieldName = 'TIPOREGULARIZACAO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.TIPOREGULARIZACAO'
      Size = 100
    end
    object qryConcCreditoEfetuadoARQUIVOREGULARIZACAO_1: TBlobField
      FieldName = 'ARQUIVOREGULARIZACAO_1'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.ARQUIVOREGULARIZACAO'
      BlobType = ftBlob
      Size = 1
    end
    object qryConcCreditoEfetuadoNUMEROAP: TFloatField
      FieldName = 'NUMEROAP'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.NUMEROAP'
    end
    object qryConcCreditoEfetuadoDATAVENCTOAP: TDateTimeField
      FieldName = 'DATAVENCTOAP'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.DATAVENCTOAP'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryConcCreditoEfetuadoNUMEROAR: TFloatField
      FieldName = 'NUMEROAR'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.NUMEROAR'
    end
    object qryConcCreditoEfetuadoDATAVENCTOAR: TDateTimeField
      FieldName = 'DATAVENCTOAR'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.DATAVENCTOAR'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryConcCreditoEfetuadoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.NUMBANCO'
      Size = 10
    end
    object qryConcCreditoEfetuadoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.NUMAGENCIA'
      Size = 15
    end
    object qryConcCreditoEfetuadoCONTABANCARIA: TStringField
      FieldName = 'CONTABANCARIA'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.CONTABANCARIA'
      Size = 15
    end
    object qryConcCreditoEfetuadoOBSERVACAO: TMemoField
      DisplayWidth = 40
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryConcCreditoEfetuadoEXTENSAOARQUIVO: TStringField
      FieldName = 'EXTENSAOARQUIVO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.EXTENSAOARQUIVO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qryConcCreditoEfetuadoNOMEARQUIVO: TStringField
      FieldName = 'NOMEARQUIVO'
      Origin = 'BASEDADOS.HSTREGULARIZACAOFOLHA.NOMEARQUIVO'
      Size = 40
    end
    object qryConcCreditoEfetuadoCODIGORETORNO: TStringField
      FieldName = 'CODIGORETORNO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.CODIGORETORNO'
      FixedChar = True
      Size = 2
    end
  end
  object dsConcCreditoEfetuado: TwwDataSource
    AutoEdit = False
    DataSet = qryConcCreditoEfetuado
    Left = 632
    Top = 307
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
    Left = 545
    Top = 137
  end
  object dsBasePagamento: TwwDataSource
    AutoEdit = False
    DataSet = CdsBasePagamento
    Left = 632
    Top = 139
  end
  object CdsBasePagamento: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CAMPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 81
      end
      item
        Name = 'VALOR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 111
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 541
    Top = 199
    Data = {
      910000009619E0BD0100000018000000020001000000030000008B000543414D
      504F01004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020051000556414C4F52010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002006F00
      0100044C4349440400010009080000000001000100}
  end
end
