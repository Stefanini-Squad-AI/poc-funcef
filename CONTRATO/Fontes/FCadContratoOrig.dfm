inherited frmCadContratoOrig: TfrmCadContratoOrig
  Left = 190
  Top = 168
  HelpContext = 120018
  Caption = 'Consulta Contratos'
  ClientHeight = 560
  ClientWidth = 1144
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1144
    Height = 521
    object Splitter1: TSplitter
      Left = 1
      Top = 224
      Width = 1142
      Height = 5
      Cursor = crVSplit
      Align = alBottom
    end
    object pgcSuperior: TPageControl
      Left = 1
      Top = 45
      Width = 1142
      Height = 179
      ActivePage = tsDadosContr
      Align = alClient
      TabOrder = 1
      OnChange = pgcSuperiorChange
      object tsDescricao: TTabSheet
        Caption = 'Descrição'
        object dbmDescricaoContrato: TDBMemo
          Left = 0
          Top = 0
          Width = 1134
          Height = 151
          Align = alClient
          DataField = 'DESCRICAOCONTRATO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsDadosContr: TTabSheet
        Caption = 'Dados Contratuais'
        object GroupBox1: TGroupBox
          Left = 10
          Top = 0
          Width = 963
          Height = 56
          Caption = 'Datas'
          TabOrder = 0
          object Label7: TLabel
            Left = 133
            Top = 13
            Width = 60
            Height = 13
            Caption = 'Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 257
            Top = 13
            Width = 60
            Height = 13
            Caption = 'Data Base'
          end
          object Label9: TLabel
            Left = 504
            Top = 13
            Width = 99
            Height = 13
            Caption = 'Prevista Encerra.'
          end
          object Label22: TLabel
            Left = 627
            Top = 13
            Width = 79
            Height = 13
            Caption = 'Encerramento'
          end
          object Label13: TLabel
            Left = 380
            Top = 13
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object lblDtUltimaCotacao: TLabel
            Left = 10
            Top = 13
            Width = 87
            Height = 13
            Caption = 'Última Cotação'
          end
          object dbDataAssinatura: TwwDBEdit
            Left = 133
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATAASSINATURA'
            DataSource = dsContratoOrig
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataBase: TwwDBEdit
            Left = 257
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATABASECONTRATO'
            DataSource = dsContratoOrig
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataPrevista: TwwDBEdit
            Left = 504
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATAPREVENCERRA'
            DataSource = dsContratoOrig
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataEncerramento: TwwDBEdit
            Left = 627
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATAEFETENCERRA'
            DataSource = dsContratoOrig
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit1: TwwDBEdit
            Left = 380
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATAINICIO'
            DataSource = dsContratoOrig
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dtUltimaCotacao: TwwDBEdit
            Left = 10
            Top = 28
            Width = 99
            Height = 21
            DataField = 'DATA_ULTIMA_COTACAO'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 10
          Top = 57
          Width = 432
          Height = 58
          Caption = 'Valores'
          TabOrder = 1
          object Label10: TLabel
            Left = 10
            Top = 15
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label11: TLabel
            Left = 152
            Top = 15
            Width = 62
            Height = 13
            Caption = 'Valor Base'
          end
          object lblValorOrcado: TLabel
            Left = 283
            Top = 15
            Width = 135
            Height = 13
            Caption = 'Valor Orçado/Aprovado'
          end
          object dbMoeda: TwwDBEdit
            Left = 10
            Top = 30
            Width = 121
            Height = 21
            DataField = 'MOEDESC'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBValorBaseContrato: TDBRealEdit
            Left = 152
            Top = 30
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORBASECONTRATO'
            DataSource = dsContratoOrig
          end
          object dbEdtValorOrcado: TDBRealEdit
            Left = 283
            Top = 30
            Width = 133
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALOR_ORCADO'
            DataSource = dsContratoOrig
          end
        end
        object GroupBox3: TGroupBox
          Left = 458
          Top = 57
          Width = 377
          Height = 58
          Caption = 'Outros'
          TabOrder = 2
          object Label12: TLabel
            Left = 8
            Top = 15
            Width = 91
            Height = 13
            Caption = 'Prazo Denúncia'
          end
          object Label1: TLabel
            Left = 143
            Top = 15
            Width = 105
            Height = 13
            Caption = 'Aviso Venc./ Enc.'
          end
          object Label2: TLabel
            Left = 216
            Top = 38
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object Label6: TLabel
            Left = 81
            Top = 38
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object dbPrazoDen: TwwDBEdit
            Left = 8
            Top = 30
            Width = 65
            Height = 21
            DataField = 'PRAZODENUNCIA'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbAviso: TwwDBEdit
            Left = 143
            Top = 30
            Width = 65
            Height = 21
            DataField = 'AVISO'
            DataSource = dsContratoOrig
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 851
          Top = 57
          Width = 123
          Height = 58
          Caption = 'Res.Orçamentária'
          TabOrder = 3
          object dbReservOrc: TwwDBEdit
            Left = 18
            Top = 23
            Width = 79
            Height = 21
            DataField = 'NUMRESERVA'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object pnlRenovacao: TPanel
          Left = 10
          Top = 124
          Width = 966
          Height = 45
          BevelInner = bvLowered
          BevelOuter = bvNone
          Enabled = False
          Locked = True
          TabOrder = 4
          TabStop = True
          object DBCheckBox1: TDBCheckBox
            Left = 571
            Top = 4
            Width = 133
            Height = 17
            Caption = 'Serviço Pontual'
            DataField = 'FLGSERVICOPONTUAL'
            DataSource = dsContratoOrig
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 571
            Top = 26
            Width = 156
            Height = 17
            Caption = 'Serviço Continuado'
            DataField = 'FLGSERVICOCONTINUADO'
            DataSource = dsContratoOrig
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 15
            Top = 4
            Width = 225
            Height = 17
            Caption = 'Serviço em processo de Renovação'
            DataField = 'FLGRENOVACAO'
            DataSource = dsContratoOrig
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 15
            Top = 26
            Width = 221
            Height = 17
            Caption = 'Serviço em fase de Encerramento'
            DataField = 'FLGFASE_ENCERRAMENTO'
            DataSource = dsContratoOrig
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 331
            Top = 4
            Width = 136
            Height = 17
            Caption = 'Contrato com ANS'
            DataField = 'FLGANS'
            DataSource = dsContratoOrig
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 331
            Top = 26
            Width = 159
            Height = 17
            Caption = 'Vigência Indeterminada'
            DataField = 'FLGVIGENCIAINDETERMINADA'
            DataSource = dsContratoOrig
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tsContraparte: TTabSheet
        Caption = 'Dados da Contraparte'
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Contraparte'
        end
        object Label4: TLabel
          Left = 8
          Top = 56
          Width = 45
          Height = 13
          Caption = 'Contato'
        end
        object Label5: TLabel
          Left = 8
          Top = 112
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object dbContraparte: TwwDBEdit
          Left = 8
          Top = 24
          Width = 297
          Height = 21
          DataField = 'NOMEFORCLI'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbgCCustoSelecionados: TwwDBGrid
          Left = 380
          Top = 8
          Width = 190
          Height = 162
          Selected.Strings = (
            'NOME'#9'20'#9'Área Gestora')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsCCustoSelecionados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dbContato: TwwDBEdit
          Left = 8
          Top = 72
          Width = 297
          Height = 21
          DataField = 'NOMECONTATO'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbTelContato: TwwDBEdit
          Left = 8
          Top = 128
          Width = 241
          Height = 21
          DataField = 'TELCONTATO'
          DataSource = dsContratoOrig
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbgCCustoATSelecionados: TwwDBGrid
          Left = 578
          Top = 8
          Width = 190
          Height = 162
          Selected.Strings = (
            'NOME'#9'20'#9'Área Técnica')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsCCCustoATSelecionados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 4
          TitleAlignment = taLeftJustify
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
      object tsEnderecos: TTabSheet
        Caption = 'Endereços'
        object Label17: TLabel
          Left = 8
          Top = 0
          Width = 172
          Height = 13
          Caption = 'Endereço de Correspondência'
        end
        object Label18: TLabel
          Left = 8
          Top = 37
          Width = 121
          Height = 13
          Caption = 'Endereço de Entrega'
        end
        object Label19: TLabel
          Left = 8
          Top = 75
          Width = 131
          Height = 13
          Caption = 'Endereço de Cobrança'
        end
        object dbCorrespondencia: TwwDBEdit
          Left = 8
          Top = 14
          Width = 601
          Height = 21
          DataField = 'ENDCORRESP'
          DataSource = dsContratoOrig
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbEntrega: TwwDBEdit
          Left = 8
          Top = 52
          Width = 601
          Height = 21
          DataField = 'ENDENTREGA'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbCobranca: TwwDBEdit
          Left = 8
          Top = 90
          Width = 601
          Height = 21
          DataField = 'ENDCOBRANCA'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tsIntegracao: TTabSheet
        Caption = 'Integração'
        object Label28: TLabel
          Left = 9
          Top = 8
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label14: TLabel
          Left = 8
          Top = 48
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object Label26: TLabel
          Left = 337
          Top = 8
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label24: TLabel
          Left = 337
          Top = 48
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object dbAtivProj: TwwDBEdit
          Left = 8
          Top = 24
          Width = 297
          Height = 21
          DataField = 'NOMEUNEG'
          DataSource = dsContratoOrig
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbRespons: TwwDBEdit
          Left = 8
          Top = 64
          Width = 297
          Height = 21
          DataField = 'NOMERESPON'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbCentroRespon: TwwDBEdit
          Left = 336
          Top = 24
          Width = 258
          Height = 21
          DataField = 'NOMECENTRORESP'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbTipoDoc: TwwDBEdit
          Left = 336
          Top = 64
          Width = 258
          Height = 21
          DataField = 'TIPODOCDESCR'
          DataSource = dsContratoOrig
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tbObservacao: TTabSheet
        Caption = 'Observação'
        object dbmObservacao: TDBMemo
          Left = 0
          Top = 0
          Width = 1134
          Height = 151
          Align = alClient
          DataField = 'OBSERVACAO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsRenovacao: TTabSheet
        Caption = 'Renovação'
        object dbmRenovacao: TDBMemo
          Left = 0
          Top = 0
          Width = 1134
          Height = 151
          Align = alClient
          DataField = 'RENOVACAO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsImagens: TTabSheet
        Caption = 'Imagens'
        ImageIndex = 7
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 1134
          Height = 29
          ButtonHeight = 21
          Caption = 'ToolBar1'
          TabOrder = 0
          object spbTamOriginal: TSpeedButton
            Left = 0
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Tamanho original'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
              BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
              BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
              BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
              BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
              EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
              EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
              EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
              EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbTamOriginalClick
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 2
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 1
            Style = tbsSeparator
          end
          object tbtnZoomIN: TSpeedButton
            Left = 31
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Aumentar zoom'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
              33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
              3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
              33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
              333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnZoomINClick
          end
          object tbtnZoomOUT: TSpeedButton
            Left = 54
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Diminuir zoom'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
              333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
              333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
              33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
              333337F3333337F333333078F8F870333333373FF333F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnZoomOUTClick
          end
          object ToolButton5: TToolButton
            Left = 77
            Top = 2
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object tbtnPaginaInicial: TSpeedButton
            Left = 85
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Primeira página'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
              66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
              66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
              660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnPaginaInicialClick
          end
          object tbtnPaginaAnterior: TSpeedButton
            Left = 108
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Página anterior'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
              66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
              66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
              660878F888877F88887887E66666F666608887F88888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnPaginaAnteriorClick
          end
          object tbtnProximaPagina: TSpeedButton
            Left = 131
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Próxima página'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
              66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
              66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
              660878F888778888887887E666F66666608887F88878888887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnProximaPaginaClick
          end
          object tbtnUltimaPagina: TSpeedButton
            Left = 154
            Top = 2
            Width = 23
            Height = 21
            Hint = 'Última página'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
              66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
              66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
              660878F877887788887887E6F666F666608887F87888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnUltimaPaginaClick
          end
          object ToolButton10: TToolButton
            Left = 177
            Top = 2
            Width = 40
            Caption = 'ToolButton10'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object Label15: TLabel
            Left = 217
            Top = 2
            Width = 44
            Height = 13
            Alignment = taCenter
            Caption = 'Página:'
          end
          object wwDBEdit2: TwwDBEdit
            Left = 261
            Top = 2
            Width = 38
            Height = 21
            DataField = 'PAGINA'
            DataSource = Ds
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 29
          Width = 1134
          Height = 122
          Align = alClient
          TabOrder = 1
          OnDblClick = ImagemDblClick
          object Imagem: TImage
            Left = 281
            Top = 0
            Width = 849
            Height = 118
            Align = alClient
            OnDblClick = ImagemDblClick
          end
          object dbImagem: TDBImage
            Left = 0
            Top = 0
            Width = 281
            Height = 118
            Align = alLeft
            DataField = 'IMAGEM'
            DataSource = Ds
            TabOrder = 0
            Visible = False
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Ane&xos'
        ImageIndex = 8
        object dbgrdDet: TwwDBGrid
          Left = 0
          Top = 26
          Width = 1134
          Height = 125
          Selected.Strings = (
            'NOMEARQUIVO'#9'113'#9'Arquivos Anexados')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDet
          MultiSelectOptions = [msoAutoUnselect]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgMultiSelect]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgrdDetDblClick
          IndicatorColor = icBlack
        end
        object PnlAnexos: TPanel
          Left = 0
          Top = 0
          Width = 1134
          Height = 26
          Align = alTop
          TabOrder = 0
          object btnVisual: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Visualizar o arquivo'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
              033333777777777773333330777777703333333773F333773333333330888033
              33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
              FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
              8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
              8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
              8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
              8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
              FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnVisualClick
          end
          object btnSalva: TToolbarButton97
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Salvar o arquivo em disco'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
              00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
              00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
              00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
              0003737FFFFFFFFF7F7330099999999900333777777777777733}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvaClick
          end
        end
      end
    end
    object pgcInferior: TPageControl
      Left = 1
      Top = 229
      Width = 1142
      Height = 291
      ActivePage = tsPagamentos_Novo
      Align = alBottom
      TabOrder = 2
      object tsServProd: TTabSheet
        Caption = 'Serviços/Produtos x Item Contratual'
        object dbgObjxItem: TwwDBGrid
          Left = 0
          Top = 0
          Width = 1134
          Height = 263
          Selected.Strings = (
            'NOME_ITEM'#9'44'#9'Item'
            'NOMEOBJETO'#9'52'#9'Objeto'
            'TIPOTOLERANCIAOBJETO'#9'12'#9'TipoTolerância'
            'TOLERANCIAMAISOBJETO'#9'6'#9'Superior'
            'TOLERANCIAMENOSOBJETO'#9'6'#9'Inferior'
            'MOEDESC'#9'20'#9'Moeda'
            'DESCMEDIDA'#9'25'#9'Medida'
            'QTDEITEM'#9'10'#9'Qtd'
            'VALORUNITARIOOBJETO'#9'15'#9'ValorUnitário'
            'VALORTOTALOBJETO'#9'15'#9'ValorTotal'
            'DATAINICIOCOBR'#9'12'#9'InícioCobrança'
            'NUMMEDICOES'#9'10'#9'No.Medições'
            'FREQUENCIA'#9'9'#9'Frequência'
            'INTERVALO'#9'10'#9'Intervalo'
            'NUMPARCELAS'#9'10'#9'No.Parcelas')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsObjxItOrig
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
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
      object tsRateio: TTabSheet
        Caption = 'Rateio'
        object dbgRateio: TwwDBGrid
          Left = 0
          Top = 0
          Width = 1063
          Height = 263
          Selected.Strings = (
            'NOMECC'#9'30'#9'Centro de Custo'
            'PERCRATEIOCONTR'#9'11'#9'Percentual'
            'NOME_PLANO'#9'24'#9'Plano'
            'NOME_PATRO'#9'28'#9'Patrocinadora'
            'NOME_UNIDNEGOCIO'#9'25'#9'Unidade de Negócio')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRateioCCOrig
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
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
      object tsAditamento: TTabSheet
        Caption = 'Aditamentos'
        object dbgLogAditamento: TwwDBGrid
          Left = 0
          Top = 148
          Width = 1134
          Height = 115
          Selected.Strings = (
            'DSC_ITEM'#9'20'#9'Item'
            'DESCRICAO'#9'30'#9'Campo Alterado'
            'VLRATUAL'#9'64'#9'Valor Atual'
            'VLRANTERIOR'#9'66'#9'Valor Anterior')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLogAditamento
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dbgAditamento: TwwDBGrid
          Left = 0
          Top = 0
          Width = 1134
          Height = 148
          Selected.Strings = (
            'TIPO'#9'12'#9'Tipo'
            'DATAASSADITAMENTO'#9'13'#9'Data Assinatura'
            'CODADITAMENTO'#9'18'#9'Código'
            'DESCADITAMENTO'#9'62'#9'Descrição'
            'FLGREINICIODASPARCELAS'#9'15'#9'Parc.Reiniciadas ?'
            'POSSUI_PAGAMENTO'#9'15'#9'Tem Pagamentos ?'
            'VL_ADITAMENTO'#9'16'#9'Valor')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alTop
          DataSource = dsAditamento
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgAditamentoCalcCellColors
          IndicatorColor = icBlack
        end
      end
      object tsPagamentos_Novo: TTabSheet
        Caption = 'Pagamentos'
        ImageIndex = 4
        object lblVlTotalContrato: TLabel
          Left = 250
          Top = 7
          Width = 82
          Height = 13
          Caption = 'Total Contrato'
        end
        object lblVlPagoContrato: TLabel
          Left = 402
          Top = 7
          Width = 103
          Height = 13
          Caption = 'Total Pagamentos'
        end
        object lblSaldoPagar: TLabel
          Left = 537
          Top = 7
          Width = 81
          Height = 13
          Caption = 'Saldo a Pagar'
        end
        object Label16: TLabel
          Left = 6
          Top = 7
          Width = 124
          Height = 13
          Caption = 'Documento de origem'
        end
        object lblMenos: TLabel
          Left = 382
          Top = 17
          Width = 8
          Height = 27
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentFont = False
        end
        object lblIgual: TLabel
          Left = 516
          Top = 23
          Width = 11
          Height = 22
          Caption = '='
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 3
          Top = 55
          Width = 140
          Height = 13
          Caption = 'Pagamentos (Medições):'
        end
        object Label21: TLabel
          Left = 877
          Top = 6
          Width = 115
          Height = 13
          Caption = 'Total Pago Contrato'
        end
        object dbgrdPagtosAnalitico: TwwDBGrid
          Left = 0
          Top = 73
          Width = 1134
          Height = 190
          Selected.Strings = (
            'NODOCUMENTO'#9'11'#9'Nº Documento'#9'F'
            'DATAVENCPARCELA'#9'12'#9'Data Vencto'#9'F'
            'VALORMEDICAO'#9'15'#9'Valor Medição'#9'F'
            'OBS'#9'50'#9'Observação'#9'F'
            'HISTORICOCOMPL'#9'50'#9'Histórico Complementar'#9'F'
            'IDADITAMENTO'#9'10'#9'IdAditamento'#9'F')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow]
          IniAttributes.Delimiter = ';;'
          TitleColor = 8404992
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          Color = 16634576
          DataSource = dsPagtosAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgrdPagtosAnaliticoTitleButtonClick
          IndicatorColor = icBlack
        end
        object edtVL_TOTAL_CONTRATO: TDBRealEdit
          Left = 250
          Top = 23
          Width = 122
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Enabled = False
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VL_TOTAL_CONTRATO'
          DataSource = dsPagtosSintetico
        end
        object edtVL_PAGO_CONTRATO: TDBRealEdit
          Left = 403
          Top = 23
          Width = 104
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VL_PAGO_CONTRATO'
          DataSource = dsPagtosSintetico
        end
        object edtSALDO_A_PAGAR: TDBRealEdit
          Left = 537
          Top = 23
          Width = 104
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'SALDO_A_PAGAR'
          DataSource = dsPagtosSintetico
        end
        object dbcOrigemSaldo: TDBLookupComboBox
          Left = 4
          Top = 23
          Width = 233
          Height = 21
          KeyField = 'IDADITAMENTO'
          ListField = 'NOME;DATAASSINATURA;IDADITAMENTO;FLGSALDOTRANSFERIDO'
          ListSource = dsOrigemSaldo
          TabOrder = 4
          OnCloseUp = dbcOrigemSaldoCloseUp
        end
        object stStatus: TStaticText
          Left = 642
          Top = 24
          Width = 208
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = '...'
          TabOrder = 5
        end
        object DBRealEdit1: TDBRealEdit
          Left = 877
          Top = 22
          Width = 115
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Enabled = False
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'TOTAL_PAGO_CONTRATO'
          DataSource = dsPagtosSintetico
        end
        object stCondicao: TStaticText
          Left = 760
          Top = 54
          Width = 235
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Contrato com condição: "Não se aplica"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Justificativa do valor "Não se aplica"'
        ImageIndex = 5
        object dbJustNSA: TDBMemo
          Left = 0
          Top = 0
          Width = 1134
          Height = 263
          Align = alClient
          DataField = 'JUSTIFOPCAONAOSEAPLICA'
          DataSource = dsContratoOrig
          MaxLength = 500
          TabOrder = 0
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1142
      Height = 44
      Align = alTop
      Alignment = taLeftJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblContrato: TLabel
        Left = 8
        Top = 6
        Width = 63
        Height = 16
        Caption = 'Contrato:'
      end
      object lblProcesso: TLabel
        Left = 8
        Top = 24
        Width = 71
        Height = 16
        Caption = 'Processo:'
      end
      object rgTipo: TRadioGroup
        Left = 504
        Top = 1
        Width = 168
        Height = 38
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Atual'
          'Original')
        TabOrder = 0
        OnClick = rgTipoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 521
    Width = 1144
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 163
        HelpContext = 120018
        TabOrder = 2
      end
      object BtnConsulta: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Consulta'
        TabOrder = 1
        OnClick = BtnConsultaClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00700777777777
          7777770000007000777777777777770000007700077777777777770000007770
          0077777777777700000077770007700007777700000077777000088880077700
          00007777770887F7F88077000000777777087F7F7F807700000077777087F7F7
          F7F8070000007777708FFF7F7F780700000077777087F7F7F7F8070000007777
          708FFF7F7F780700000077777708FFF7F78077000000777777088F7F78807700
          0000777777700888800777000000777777777000077777000000777777777777
          777777000000777777777777777777000000}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 733
    Top = 89
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryContratoOrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO, C.CODPORTFORMA, C.CODCENTRORESPON,'
      '   C.IDPESSOA, C.UNIDNEGOC,'
      '   C.IDCONTATO, C.IDFORCLI, C.MOECODIGO,'
      '   C.NOMECONTRATO, C.DESCRICAOCONTRATO, '
      '   C.TIPOCONTRATO, C.DATAASSINATURA, C.VALORBASECONTRATO,'
      '   C.DATABASECONTRATO, C.DATAPREVENCERRA, C.PRAZODENUNCIA,'
      '   C.CODCONTRATOEMPR, C.DATAINICIO,'
      '   C.FLGEMPENHO, C.DATAEFETENCERRA, C.MOTIVOENCERRA,'
      '   C.FLGFIMCONTRATO, C.CODTIPDOC, C.RENOVACAO, C.OBSERVACAO,'
      '   C.IDTELEFONE, C.IDRESERVAORCAMEN, C.AVISO, M.MOEDESC,'
      '   C.IDRESPONSAVEL,'
      '   C.IDENDCORRESPON,'
      '   C.IDENDCOBRANCA,'
      '   C.IDENDENTREGA,'
      '   R.NUMRESERVA,'
      
        '   CAST(substr(RTRIM(T.DDI)||DECODE(T.DDI,'#39#39','#39#39','#39'-'#39')||DECODE(T.D' +
        'DD,'#39#39','#39#39','#39'('#39')||RTRIM(T.DDD)||DECODE(T.DDD,'#39#39','#39#39','#39') '#39')||T.NUMERO|' +
        '|DECODE(TC.RAMAL,'#39#39','#39' '#39','#39'/R.'#39')||TC.RAMAL,1,254) AS VARCHAR2(254)' +
        ') AS TELCONTATO,'
      '   CP.NOME AS NOMECONTATO,'
      '   P.RAZAOSOCIAL AS NOMEFORCLI,'
      
        '   CAST(substr(RTRIM(ECOR.LOGRADOURO)||'#39' '#39'||RTRIM(ECOR.NUMERO)||' +
        #39' '#39'||RTRIM(ECOR.COMPLEMENTO)||'#39' '#39'||RTRIM(ECOR.BAIRRO)||'#39' '#39'||RTRI' +
        'M(CDCOR.NOME)||DECODE(ECOR.CEP,'#39#39','#39' '#39','#39' CEP:'#39')||RTRIM(ECOR.CEP),' +
        '1,254) AS VARCHAR2(254)) AS  ENDCORRESP,'
      
        '   CAST(substr(RTRIM(ECOB.LOGRADOURO)||'#39' '#39'||RTRIM(ECOB.NUMERO)||' +
        #39' '#39'||RTRIM(ECOB.COMPLEMENTO)||'#39' '#39'||RTRIM(ECOB.BAIRRO)||'#39' '#39'||RTRI' +
        'M(CDCOB.NOME)||DECODE(ECOB.CEP,'#39#39','#39' '#39','#39' CEP:'#39')||RTRIM(ECOB.CEP),' +
        '1,254) AS VARCHAR2(254)) AS  ENDCOBRANCA,'
      
        '   CAST(substr(RTRIM(EENT.LOGRADOURO)||'#39' '#39'||RTRIM(EENT.NUMERO)||' +
        #39' '#39'||RTRIM(EENT.COMPLEMENTO)||'#39' '#39'||RTRIM(EENT.BAIRRO)||'#39' '#39'||RTRI' +
        'M(CDENT.NOME)||DECODE(EENT.CEP,'#39#39','#39' '#39','#39' CEP:'#39')||RTRIM(EENT.CEP),' +
        '1,254) AS VARCHAR2(254)) AS  ENDENTREGA,'
      '   U.NOME AS NOMEUNEG,'
      '   PRES.NOME AS NOMERESPON,'
      '   CR.NOME AS NOMECENTRORESP,'
      '   TD.DESCRICAO AS TIPODOCDESCR,'
      '   C.DATA_ULTIMA_COTACAO,'
      '   C.VALOR_ORCADO,'
      '   C.JUSTIFOPCAONAOSEAPLICA,'
      '   CAST('#39#39' as CHAR(1)) AS FLGRENOVACAO,'
      '   CAST('#39#39' as CHAR(1)) AS FLGFASE_ENCERRAMENTO,'
      '   CAST('#39#39' as CHAR(1)) AS FLGANS,'
      '   CAST('#39#39' as CHAR(1)) AS FLGVIGENCIAINDETERMINADA,'
      '   CAST('#39#39' as CHAR(1)) AS FLGSERVICOPONTUAL,'
      '   CAST('#39#39' as CHAR(1)) AS FLGSERVICOCONTINUADO'
      'FROM'
      '   CONTRATOORIG C,'
      '   MOEDA M,'
      '   RESERVAORCAMEN R,'
      '   TELENDPESS T,'
      '   TELCONTATO TC,'
      '   CONTATOPESS CP,'
      '   PESSOA P,'
      '   UNIDNEGOCIO U,'
      '   CENTRESPON CR,'
      '   TIPODOCRECPAG TD,'
      '   ENDPESS ECOR,'
      '   CIDADES CDCOR,'
      '   ENDPESS ECOB,'
      '   CIDADES CDCOB,'
      '   ENDPESS EENT,'
      '   CIDADES CDENT,'
      '   RESPONSAVEL RES,'
      '   PESSOA PRES'
      'WHERE'
      '   (C.IDCONTRATO = :idcontrato) AND'
      '   (C.MOECODIGO = M.MOECODIGO(+)) AND'
      '   (C.IDRESERVAORCAMEN = R.IDRESERVAORCAMEN(+)) AND'
      '   (C.IDCONTATO = TC.IDCONTATO(+)) AND'
      '   (TC.IDTELEFONE = T.IDTELEFONE(+)) AND'
      '   (C.IDCONTATO = CP.IDCONTATO(+)) AND'
      '   (C.IDFORCLI = P.IDPESSOA(+)) AND'
      '   (C.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '   (C.CODTIPDOC = TD.CODTIPDOC(+)) AND'
      '   (C.IDENDCORRESPON = ECOR.IDENDERECO(+)) AND'
      '   (ECOR.IDCIDADES = CDCOR.IDCIDADES(+)) AND'
      '   (C.IDENDCOBRANCA = ECOB.IDENDERECO(+)) AND'
      '   (ECOB.IDCIDADES  = CDCOB.IDCIDADES(+)) AND'
      '   (C.IDENDENTREGA = EENT.IDENDERECO(+)) AND'
      '   (EENT.IDCIDADES = CDENT.IDCIDADES(+)) AND'
      '   (C.IDRESPONSAVEL = RES.IDRESPONSAVEL(+)) AND'
      '   (RES.IDRESPONSAVEL = PRES.IDPESSOA(+))'
      ''
      ''
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
    Left = 59
    Top = 277
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'idcontrato'
        ParamType = ptUnknown
      end>
    object qryContratoOrigIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object qryContratoOrigCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryContratoOrigCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryContratoOrigIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratoOrigUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryContratoOrigIDENDCOBRANCA: TFloatField
      FieldName = 'IDENDCOBRANCA'
    end
    object qryContratoOrigIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
    end
    object qryContratoOrigIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryContratoOrigMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratoOrigIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryContratoOrigNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryContratoOrigDESCRICAOCONTRATO: TMemoField
      FieldName = 'DESCRICAOCONTRATO'
      BlobType = ftMemo
      Size = 1000
    end
    object qryContratoOrigTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Size = 1
    end
    object qryContratoOrigDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratoOrigVALORBASECONTRATO: TFloatField
      FieldName = 'VALORBASECONTRATO'
    end
    object qryContratoOrigDATABASECONTRATO: TDateTimeField
      FieldName = 'DATABASECONTRATO'
    end
    object qryContratoOrigDATAPREVENCERRA: TDateTimeField
      FieldName = 'DATAPREVENCERRA'
    end
    object qryContratoOrigPRAZODENUNCIA: TFloatField
      FieldName = 'PRAZODENUNCIA'
    end
    object qryContratoOrigCODCONTRATOEMPR: TStringField
      FieldName = 'CODCONTRATOEMPR'
    end
    object qryContratoOrigIDENDCORRESPON: TFloatField
      FieldName = 'IDENDCORRESPON'
    end
    object qryContratoOrigIDENDENTREGA: TFloatField
      FieldName = 'IDENDENTREGA'
    end
    object qryContratoOrigFLGEMPENHO: TStringField
      FieldName = 'FLGEMPENHO'
      Size = 1
    end
    object qryContratoOrigDATAEFETENCERRA: TDateTimeField
      FieldName = 'DATAEFETENCERRA'
    end
    object qryContratoOrigMOTIVOENCERRA: TStringField
      FieldName = 'MOTIVOENCERRA'
      Size = 60
    end
    object qryContratoOrigFLGFIMCONTRATO: TStringField
      FieldName = 'FLGFIMCONTRATO'
      Size = 1
    end
    object qryContratoOrigCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryContratoOrigRENOVACAO: TMemoField
      FieldName = 'RENOVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryContratoOrigOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryContratoOrigIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
    end
    object qryContratoOrigIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object qryContratoOrigAVISO: TFloatField
      FieldName = 'AVISO'
    end
    object qryContratoOrigMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryContratoOrigNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object qryContratoOrigTELCONTATO: TStringField
      FieldName = 'TELCONTATO'
      Size = 56
    end
    object qryContratoOrigNOMECONTATO: TStringField
      FieldName = 'NOMECONTATO'
      Size = 50
    end
    object qryContratoOrigNOMEFORCLI: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object qryContratoOrigENDCORRESP: TStringField
      FieldName = 'ENDCORRESP'
      Size = 175
    end
    object qryContratoOrigENDCOBRANCA: TStringField
      FieldName = 'ENDCOBRANCA'
      Size = 175
    end
    object qryContratoOrigENDENTREGA: TStringField
      FieldName = 'ENDENTREGA'
      Size = 175
    end
    object qryContratoOrigNOMEUNEG: TStringField
      FieldName = 'NOMEUNEG'
      Size = 25
    end
    object qryContratoOrigNOMERESPON: TStringField
      FieldName = 'NOMERESPON'
      Size = 60
    end
    object qryContratoOrigNOMECENTRORESP: TStringField
      FieldName = 'NOMECENTRORESP'
      Size = 30
    end
    object qryContratoOrigTIPODOCDESCR: TStringField
      FieldName = 'TIPODOCDESCR'
      Size = 35
    end
    object qryContratoOrigDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryContratoOrigDATA_ULTIMA_COTACAO: TDateTimeField
      FieldName = 'DATA_ULTIMA_COTACAO'
    end
    object qryContratoOrigVALOR_COTACAO: TFloatField
      FieldName = 'VALOR_ORCADO'
    end
    object qryContratoOrigJUSTIFOPCAONAOSEAPLICA: TMemoField
      FieldName = 'JUSTIFOPCAONAOSEAPLICA'
      BlobType = ftMemo
      Size = 500
    end
    object qryContratoOrigFLGRENOVACAO: TStringField
      FieldName = 'FLGRENOVACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratoOrigFLGFASE_ENCERRAMENTO: TStringField
      FieldName = 'FLGFASE_ENCERRAMENTO'
      Size = 1
    end
    object qryContratoOrigFLGANS: TStringField
      FieldName = 'FLGANS'
      Size = 1
    end
    object qryContratoOrigFLGVIGENCIAINDETERMINADA: TStringField
      FieldName = 'FLGVIGENCIAINDETERMINADA'
      Size = 1
    end
    object qryContratoOrigFLGSERVICOPONTUAL: TStringField
      FieldName = 'FLGSERVICOPONTUAL'
      Size = 1
    end
    object qryContratoOrigFLGSERVICOCONTINUADO: TStringField
      FieldName = 'FLGSERVICOCONTINUADO'
      Size = 1
    end
  end
  object dsContratoOrig: TwwDataSource
    DataSet = qryContratoOrig
    Left = 55
    Top = 347
  end
  object qryObjxItOrig: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContratoOrig
    SQL.Strings = (
      'SELECT O.IDCONTRATO,'
      '       O.IDOBJETO,'
      '       O.IDITEM,'
      '       O.IDPESSOA,'
      '       O.MOECODIGO,'
      '       O.CODMEDIDA,'
      '       O.DATABASEITEM,'
      '       O.QTDEITEM,'
      '       O.VALORUNITARIOOBJETO,'
      '       O.VALORTOTALOBJETO,'
      '       O.TIPOTOLERANCIAOBJETO,'
      '       O.TOLERANCIAMAISOBJETO,'
      '       O.TOLERANCIAMENOSOBJETO,'
      '       O.NUMMEDICOES,'
      '       O.NUMPARCELAS,'
      '       O.FREQUENCIA,'
      '       O.INTERVALO,'
      '       O.DATAINICIOCOBR,'
      '       O.DATAULTGERACAO,'
      '       O.DATAULTVENC,'
      '       O.OBSERVACAO,'
      '       OC.NOMEOBJETO,'
      '       IC.NOME_ITEM,'
      '       MOEDA.MOEDESC,'
      '       UM.DESCMEDIDA'
      'FROM OBJETOSXITEMCONTR O,'
      '     OBJETOCONTRATUAL OC,'
      '     ITEMCONTRATUAL IC,'
      '     MOEDA,'
      '     UNMEDIDA UM'
      'WHERE IDCONTRATO = :IDCONTRATO'
      '      AND O.IDOBJETO = OC.IDOBJETO'
      '      AND O.IDITEM = IC.IDITEM'
      '      AND O.MOECODIGO = MOEDA.MOECODIGO(+)'
      '      AND O.CODMEDIDA = UM.CODMEDIDA(+)'
      'ORDER BY  OC.NOMEOBJETO, IC.NOME_ITEM'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 53
    Top = 91
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryObjxItOrigNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 44
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryObjxItOrigNOMEOBJETO: TStringField
      DisplayLabel = 'Objeto'
      DisplayWidth = 52
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryObjxItOrigTIPOTOLERANCIAOBJETO: TStringField
      DisplayLabel = 'TipoTolerância'
      DisplayWidth = 12
      FieldName = 'TIPOTOLERANCIAOBJETO'
      Size = 1
    end
    object qryObjxItOrigTOLERANCIAMAISOBJETO: TFloatField
      DisplayLabel = 'Superior'
      DisplayWidth = 6
      FieldName = 'TOLERANCIAMAISOBJETO'
    end
    object qryObjxItOrigTOLERANCIAMENOSOBJETO: TFloatField
      DisplayLabel = 'Inferior'
      DisplayWidth = 6
      FieldName = 'TOLERANCIAMENOSOBJETO'
    end
    object qryObjxItOrigMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
    end
    object qryObjxItOrigDESCMEDIDA: TStringField
      DisplayLabel = 'Medida'
      DisplayWidth = 25
      FieldName = 'DESCMEDIDA'
      Size = 25
    end
    object qryObjxItOrigQTDEITEM: TFloatField
      DisplayLabel = 'Qtd'
      DisplayWidth = 10
      FieldName = 'QTDEITEM'
    end
    object qryObjxItOrigVALORUNITARIOOBJETO: TFloatField
      DisplayLabel = 'ValorUnitário'
      DisplayWidth = 15
      FieldName = 'VALORUNITARIOOBJETO'
    end
    object qryObjxItOrigVALORTOTALOBJETO: TFloatField
      DisplayLabel = 'ValorTotal'
      DisplayWidth = 15
      FieldName = 'VALORTOTALOBJETO'
    end
    object qryObjxItOrigDATAINICIOCOBR: TDateTimeField
      DisplayLabel = 'InícioCobrança'
      DisplayWidth = 12
      FieldName = 'DATAINICIOCOBR'
    end
    object qryObjxItOrigNUMMEDICOES: TFloatField
      DisplayLabel = 'No.Medições'
      DisplayWidth = 10
      FieldName = 'NUMMEDICOES'
    end
    object qryObjxItOrigIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object qryObjxItOrigFREQUENCIA: TStringField
      DisplayLabel = 'Frequência'
      DisplayWidth = 9
      FieldName = 'FREQUENCIA'
      Size = 1
    end
    object qryObjxItOrigIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Visible = False
    end
    object qryObjxItOrigINTERVALO: TFloatField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 10
      FieldName = 'INTERVALO'
    end
    object qryObjxItOrigIDITEM: TFloatField
      FieldName = 'IDITEM'
      Visible = False
    end
    object qryObjxItOrigNUMPARCELAS: TFloatField
      DisplayLabel = 'No.Parcelas'
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
    end
    object qryObjxItOrigIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryObjxItOrigMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryObjxItOrigCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Visible = False
      Size = 4
    end
    object qryObjxItOrigDATABASEITEM: TDateTimeField
      FieldName = 'DATABASEITEM'
      Visible = False
    end
    object qryObjxItOrigDATAULTGERACAO: TDateTimeField
      FieldName = 'DATAULTGERACAO'
      Visible = False
    end
    object qryObjxItOrigDATAULTVENC: TDateTimeField
      FieldName = 'DATAULTVENC'
      Visible = False
    end
    object qryObjxItOrigOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Visible = False
      Size = 250
    end
  end
  object dsObjxItOrig: TwwDataSource
    DataSet = qryObjxItOrig
    Left = 50
    Top = 151
  end
  object qryRateioCCOrig: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsObjxItOrig
    SQL.Strings = (
      'SELECT R.IDCONTRATO,'
      '       R.IDOBJETO,'
      '       R.IDITEM,'
      '       R.IDEMPRESA,'
      '       R.CODCENTROCUSTO,'
      '       R.PERCRATEIOCONTR,'
      '       CC.NOME NOMECC,'
      '       PA.RAZAOSOCIAL AS NOME_PATRO,'
      '       PL.NOME        AS NOME_PLANO,'
      '       UN.NOME        AS NOME_UNIDNEGOCIO'
      ' FROM  RATEIOCENTROCUSTO R, PLANPREVCONTABIL PL,'
      '       CENTCUST CC, PESSOA PA, UNIDNEGOCIO UN'
      ' WHERE IDCONTRATO = :IDCONTRATO'
      '   AND IDOBJETO   = :IDOBJETO'
      '   AND IDITEM     = :IDITEM'
      '   AND R.IDEMPRESA      = CC.IDEMPRESA'
      '   AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '   AND R.IDPATRO        = PA.IDPESSOA(+)'
      '   AND R.IDPLANOPREV    = PL.IDPLANOPREV(+)'
      '   AND R.IDPESSOA       = UN.IDPESSOA(+)'
      '   AND R.UNIDNEGOC      = UN.UNIDNEGOC(+)'
      ''
      ''
      ''
      ' ORDER BY CC.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 151
    Top = 94
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryRateioCCOrigNOMECC: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'NOMECC'
      Origin = '"CM.CENTCUST".NOME'
      Size = 30
    end
    object qryRateioCCOrigPERCRATEIOCONTR: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 11
      FieldName = 'PERCRATEIOCONTR'
      Origin = '"CM.RATEIOCENTROCUSTO".PERCRATEIOCONTR'
      DisplayFormat = '#0.00%'
      EditFormat = '#0.00%'
    end
    object qryRateioCCOrigNOME_PLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 24
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object qryRateioCCOrigNOME_PATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 28
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object qryRateioCCOrigNOME_UNIDNEGOCIO: TStringField
      DisplayLabel = 'Unidade de Negócio'
      DisplayWidth = 25
      FieldName = 'NOME_UNIDNEGOCIO'
      Size = 25
    end
    object qryRateioCCOrigIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = '"CM.RATEIOCENTROCUSTO".IDCONTRATO'
      Visible = False
    end
    object qryRateioCCOrigIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Origin = '"CM.RATEIOCENTROCUSTO".IDOBJETO'
      Visible = False
    end
    object qryRateioCCOrigIDITEM: TFloatField
      FieldName = 'IDITEM'
      Origin = '"CM.RATEIOCENTROCUSTO".IDITEM'
      Visible = False
    end
    object qryRateioCCOrigIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.RATEIOCENTROCUSTO".IDEMPRESA'
      Visible = False
    end
    object qryRateioCCOrigCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.RATEIOCENTROCUSTO".CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object dsRateioCCOrig: TwwDataSource
    DataSet = qryRateioCCOrig
    Left = 154
    Top = 151
  end
  object MSContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOCONTR.DATAASSINATURA'
      'CONTRATOCONTR.NOMECONTRATO'
      'CONTRATOCONTR.CODCONTRATOEMPR'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data Assinatura'
      'Nome do Contrato'
      'Processo'
      'Contraparte')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'CONTRATOCONTR')
    CamposChave.Strings = (
      'CONTRATOCONTR.IDCONTRATO')
    Filtro.Strings = (
      'CONTRATOCONTR.IDFORCLI = PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '11'
      '55'
      '20'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 663
    Top = 85
  end
  object qryAditamento: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContratoOrig
    SQL.Strings = (
      'SELECT'
      '       A.IDADITAMENTO,'
      '       A.IDCONTRATO,'
      '       A.DATAASSADITAMENTO,'
      
        '       DECODE(A.FLGTIPO,'#39'A'#39','#39'Aditamento'#39',DECODE(A.FLGTIPO,'#39'C'#39','#39'O' +
        'utros'#39','#39'Regularização'#39')) AS TIPO,'
      '       A.CODADITAMENTO,'
      '       NVL(A.VL_ADITAMENTO,0) AS VL_ADITAMENTO,'
      '       A.DESCADITAMENTO,'
      
        '       DECODE(A.FLGREINICIODASPARCELAS,'#39'S'#39', '#39'Sim'#39', '#39'Não'#39') AS FLG' +
        'REINICIODASPARCELAS,'
      '       CASE '
      '           WHEN EXISTS ('
      '               SELECT 1 '
      '               FROM CTRLPARCELAMEDICAO CPM'
      '               WHERE CPM.IDADITAMENTO = A.IDADITAMENTO'
      '                 AND CPM.FLGPARCELAMEDIDA = 1'
      '           )'
      '           THEN '#39'Sim'#39
      '           ELSE '#39'Não'#39
      '       END AS POSSUI_PAGAMENTO'
      'FROM ADITAMENTO A'
      'WHERE A.IDCONTRATO = :IDCONTRATO '
      'ORDER BY A.DATAASSADITAMENTO DESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 156
    Top = 276
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryAditamentoTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'TIPO'
      Size = 13
    end
    object qryAditamentoDATAASSADITAMENTO: TDateTimeField
      DisplayLabel = 'Data Assinatura'
      DisplayWidth = 13
      FieldName = 'DATAASSADITAMENTO'
      Origin = '"CM.ADITAMENTO".DATAASSADITAMENTO'
    end
    object qryAditamentoCODADITAMENTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 18
      FieldName = 'CODADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.CODADITAMENTO'
      Size = 15
    end
    object qryAditamentoDESCADITAMENTO: TMemoField
      DisplayLabel = 'Descrição'
      DisplayWidth = 62
      FieldName = 'DESCADITAMENTO'
      Origin = '"CM.ADITAMENTO".DESCADITAMENTO'
      BlobType = ftMemo
      Size = 4000
    end
    object qryAditamentoFLGREINICIODASPARCELAS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Parc.Reiniciadas ?'
      DisplayWidth = 15
      FieldName = 'FLGREINICIODASPARCELAS'
      Origin = 'BASEDADOS.ADITAMENTO.FLGREINICIODASPARCELAS'
      Size = 1
    end
    object qryAditamentoPOSSUI_PAGAMENTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tem Pagamentos ?'
      DisplayWidth = 15
      FieldName = 'POSSUI_PAGAMENTO'
      FixedChar = True
      Size = 3
    end
    object qryAditamentoVL_ADITAMENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VL_ADITAMENTO'
    end
    object qryAditamentoIDADITAMENTO: TFloatField
      FieldName = 'IDADITAMENTO'
      Origin = '"CM.ADITAMENTO".IDADITAMENTO'
      Visible = False
    end
    object qryAditamentoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = '"CM.ADITAMENTO".IDCONTRATO'
      Visible = False
    end
  end
  object dsAditamento: TwwDataSource
    DataSet = qryAditamento
    Left = 147
    Top = 347
  end
  object qryLogAditamento: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsAditamento
    SQL.Strings = (
      
        'SELECT CAST(DECODE(L.IDITEM, NULL, '#39'Contrato'#39', I.NOME_ITEM) AS V' +
        'ARCHAR2(200)) AS DSC_ITEM,'
      
        '       CAST(DECODE(F.DESCRICAO, NULL, F.FIELDNAME, SUBSTR(F.DESC' +
        'RICAO,1,40)) AS VARCHAR2(40)) AS DESCRICAO,'
      '       L.VLRANTERIOR,'
      '       L.VLRATUAL'
      '  FROM LOGADITAMENTO L, ITEMCONTRATUAL I,'
      '       DDFIELD F'
      ' WHERE L.IDDDFIELD = F.IDDDFIELD'
      '   AND L.IDITEM = I.IDITEM(+)'
      '   AND L.IDADITAMENTO = :IDADITAMENTO'
      ' ORDER BY DSC_ITEM, DESCRICAO'
      '        '
      ''
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 276
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDADITAMENTO'
        ParamType = ptUnknown
      end>
    object qryLogAditamentoDSC_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 20
      FieldName = 'DSC_ITEM'
      Size = 200
    end
    object qryLogAditamentoDESCRICAO: TStringField
      DisplayLabel = 'Campo Alterado'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qryLogAditamentoVLRATUAL: TMemoField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 64
      FieldName = 'VLRATUAL'
      BlobType = ftMemo
      Size = 500
    end
    object qryLogAditamentoVLRANTERIOR: TMemoField
      DisplayLabel = 'Valor Anterior'
      DisplayWidth = 66
      FieldName = 'VLRANTERIOR'
      BlobType = ftMemo
      Size = 500
    end
  end
  object dsLogAditamento: TwwDataSource
    AutoEdit = False
    DataSet = qryLogAditamento
    Left = 248
    Top = 345
  end
  object qryPagItem: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContratoOrig
    SQL.Strings = (
      'SELECT P.IDCONTRATO,'
      '       P.IDOBJETO,'
      '       P.IDITEM,'
      '       B.NOMEOBJETO,'
      '       I.NOME_ITEM,'
      '       O.VALORTOTALOBJETO,'
      '       DECODE(P.CODDOCUMENTO,NULL,'#39'Pendente'#39','#39#39') AS STATUS,'
      '       SUM(P.VLRMOEDACORRENTE) AS TOT_PAGO,'
      '       (O.VALORTOTALOBJETO - SUM(P.VLRMOEDACORRENTE)) AS SALDO'
      '  FROM PARCELAREALCONTR P,'
      '       OBJETOSXITEMCONTR O,'
      '       ITEMCONTRATUAL I,'
      '       OBJETOCONTRATUAL B'
      ' WHERE P.IDCONTRATO = O.IDCONTRATO'
      '   AND P.IDOBJETO   = O.IDOBJETO'
      '   AND P.IDITEM     = O.IDITEM'
      '   AND O.IDITEM     = I.IDITEM'
      '   AND O.IDOBJETO   = B.IDOBJETO'
      '   AND P.IDCONTRATO = :IDCONTRATO'
      '   AND (P.FLGESTORNADO IS NULL OR P.FLGESTORNADO = 0)'
      ' GROUP BY P.IDCONTRATO, P.IDOBJETO, P.IDITEM, B.NOMEOBJETO,'
      '          I.NOME_ITEM, O.VALORTOTALOBJETO, P.CODDOCUMENTO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 265
    Top = 94
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryPagItemNOMEOBJETO: TStringField
      DisplayLabel = 'Objeto'
      DisplayWidth = 25
      FieldName = 'NOMEOBJETO'
      Origin = 'BASEDADOS.OBJETOCONTRATUAL.NOMEOBJETO'
      Size = 200
    end
    object qryPagItemNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 26
      FieldName = 'NOME_ITEM'
      Origin = 'BASEDADOS.ITEMCONTRATUAL.NOME_ITEM'
      Size = 200
    end
    object qryPagItemTOT_PAGO: TFloatField
      DisplayLabel = 'Total Pago'
      DisplayWidth = 12
      FieldName = 'TOT_PAGO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.VLRMOEDACORRENTE'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPagItemVALORTOTALOBJETO: TFloatField
      DisplayLabel = 'Total Contrato'
      DisplayWidth = 12
      FieldName = 'VALORTOTALOBJETO'
      Origin = 'BASEDADOS.OBJETOSXITEMCONTR.VALORTOTALOBJETO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPagItemSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 12
      FieldName = 'SALDO'
      Origin = 'BASEDADOS.OBJETOSXITEMCONTR.VALORTOTALOBJETO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPagItemSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 8
      FieldName = 'STATUS'
      Size = 8
    end
    object qryPagItemIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDCONTRATO'
      Visible = False
    end
    object qryPagItemIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDOBJETO'
      Visible = False
    end
    object qryPagItemIDITEM: TFloatField
      FieldName = 'IDITEM'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDITEM'
      Visible = False
    end
  end
  object dsPagItem: TwwDataSource
    AutoEdit = False
    DataSet = qryPagItem
    Left = 265
    Top = 151
  end
  object qryPagParc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPagItem
    SQL.Strings = (
      'SELECT P.DATAVENCPARCELA,'
      '       P.QTDEPARCELA,'
      '       P.VALOROBJPARCELA,'
      '       P.VLRMOEDACORRENTE,'
      '       P.NUMNOTAFISCAL,'
      '       DECODE(P.CODDOCUMENTO,NULL,'#39'Pendente'#39','#39#39') AS STATUS'
      '  FROM PARCELAREALCONTR P'
      ' WHERE P.IDCONTRATO = :IDCONTRATO'
      '   AND P.IDOBJETO   = :IDOBJETO'
      '   AND P.IDITEM     = :IDITEM'
      'AND (P.FLGESTORNADO IS NULL OR P.FLGESTORNADO = 0)'
      ' ORDER BY DATAVENCPARCELA'
      ' ')
    ValidateWithMask = True
    Left = 820
    Top = 92
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryPagParcNUMNOTAFISCAL: TFloatField
      DisplayLabel = 'Nota Fiscal'
      DisplayWidth = 23
      FieldName = 'NUMNOTAFISCAL'
      Origin = 'BASEDADOS.PARCELAREALCONTR.NUMNOTAFISCAL'
    end
    object qryPagParcDATAVENCPARCELA: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 19
      FieldName = 'DATAVENCPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.DATAVENCPARCELA'
    end
    object qryPagParcQTDEPARCELA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTDEPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.QTDEPARCELA'
    end
    object qryPagParcVALOROBJPARCELA: TFloatField
      DisplayLabel = 'Valor do Objeto'
      DisplayWidth = 15
      FieldName = 'VALOROBJPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.VALOROBJPARCELA'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPagParcVLRMOEDACORRENTE: TFloatField
      DisplayLabel = 'Total Pago'
      DisplayWidth = 15
      FieldName = 'VLRMOEDACORRENTE'
      Origin = 'BASEDADOS.PARCELAREALCONTR.VLRMOEDACORRENTE'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPagParcSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 8
      FieldName = 'STATUS'
      Size = 8
    end
  end
  object dsPagParc: TwwDataSource
    AutoEdit = False
    DataSet = qryPagParc
    Left = 824
    Top = 153
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 293
    object CdsIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
    end
    object CdsIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object CdsPAGINA: TFloatField
      FieldName = 'PAGINA'
    end
    object CdsIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object CdsDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Size = 50
    end
  end
  object Ds: TwwDataSource
    DataSet = Cds
    OnDataChange = DsDataChange
    Left = 190
    Top = 14
  end
  object CMSql: TCMSqlParams
    SQL.Strings = (
      'SELECT IC.IDIMAGEM, IC.IDCONTRATO,'
      '       IC.PAGINA, I.IMAGEM, I.DESCRIMAGEM'
      '  FROM IMAGENSCONTRATO IC, IMAGENS I'
      ' WHERE (IC.IDCONTRATO = -1)'
      '   AND (IC.IDIMAGEM = I.IDIMAGEM)'
      '   and 1 = 2')
    ClientDataSet = Cds
    Left = 105
    Top = 1
  end
  object cdsAnexos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 742
    Top = 5
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsAnexos
    Left = 190
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from imagenscontrato')
    ClientDataSet = cdsAnexos
    Left = 437
    Top = 12
  end
  object SaveDlg: TSaveDialog
    Filter = 
      'Documentos(*.doc, *.rtf, *.txt, *.pdf)|*.doc; *.rtf; *.txt; *.pd' +
      'f'
    Left = 377
    Top = 8
  end
  object cdsCCustoSelecionados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 371
    Top = 93
  end
  object dsCCustoSelecionados: TwwDataSource
    DataSet = cdsCCustoSelecionados
    Left = 375
    Top = 151
  end
  object dsPagtosAnalitico: TwwDataSource
    AutoEdit = False
    DataSet = cdsPagtosAnalitico
    Left = 506
    Top = 384
  end
  object dsPagtosSintetico: TwwDataSource
    AutoEdit = False
    DataSet = cdsPagtosSintetico
    Left = 612
    Top = 385
  end
  object dsCCCustoATSelecionados: TwwDataSource
    DataSet = cdsCCustoATSelecionados
    Left = 534
    Top = 151
  end
  object cdsCCustoATSelecionados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 527
    Top = 95
  end
  object cdsOrigemSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 390
    Top = 323
    object cdsOrigemSaldoNOME: TStringField
      DisplayWidth = 71
      FieldName = 'NOME'
      Size = 71
    end
    object cdsOrigemSaldoDATAASSINATURA: TStringField
      DisplayWidth = 10
      FieldName = 'DATAASSINATURA'
      Size = 10
    end
    object cdsOrigemSaldoIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsOrigemSaldoIDADITAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDADITAMENTO'
      Visible = False
    end
    object cdsOrigemSaldoFLGSALDOTRANSFERIDO: TStringField
      FieldName = 'FLGSALDOTRANSFERIDO'
      FixedChar = True
      Size = 1
    end
    object cdsOrigemSaldoFLGREINICIODASPARCELAS: TStringField
      FieldName = 'FLGREINICIODASPARCELAS'
      FixedChar = True
      Size = 1
    end
    object cdsOrigemSaldoFLG_TP_VLR_ORCADO_APROVADO: TStringField
      FieldName = 'FLG_TP_VLR_ORCADO_APROVADO'
      Size = 1
    end
    object cdsOrigemSaldoFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Size = 1
    end
  end
  object dsOrigemSaldo: TwwDataSource
    AutoEdit = False
    DataSet = cdsOrigemSaldo
    Left = 388
    Top = 384
  end
  object sqlOrigemSaldo: TCMSqlParams
    SQL.Strings = (
      '  SELECT CAST(SUBSTR(CASE'
      ''
      
        '                WHEN IDADITAMENTO = 0 THEN (NOME || '#39' - '#39' || DAT' +
        'AASSINATURA)        '
      ''
      
        '                ELSE                                            ' +
        '                      '
      ''
      
        '                  CASE                                          ' +
        '                      '
      ''
      
        '                   WHEN INSTR(NOME, '#39'Outros'#39') < 0 THEN (REGEXP_R' +
        'EPLACE(CODADITAMENTO, '#39'[^0-9]'#39', '#39#39') || '#39'º '#39' || NOME || '#39' - '#39' || ' +
        'DATAASSINATURA)  '
      ''
      
        '                     ELSE (NOME || '#39' - '#39' || DATAASSINATURA)     ' +
        '                     '
      ''
      
        '                  END                                           ' +
        '                       '
      ''
      
        '              END, 1, 30) AS VARCHAR2(30)) AS NOME,             ' +
        '                     '
      ''
      
        '       DATAASSINATURA,                                          ' +
        '                      '
      ''
      
        '       IDCONTRATO,                                              ' +
        '                      '
      ''
      '       IDADITAMENTO,'
      ''
      
        '       FLGSALDOTRANSFERIDO,                                     ' +
        '                      '
      ''
      
        '       FLGREINICIODASPARCELAS,                                  ' +
        '                      '
      ''
      
        '       FLG_TP_VLR_ORCADO_APROVADO,                              ' +
        '                      '
      ''
      
        '       FLGTIPO                                                  ' +
        '                      '
      ''
      
        'FROM (SELECT *                                                  ' +
        '                      '
      ''
      
        '      FROM (SELECT CAST('#39'Contrato'#39' AS VARCHAR2(30)) AS NOME,    ' +
        '                                          '
      ''
      
        '                   CO.IDCONTRATO AS IDCONTRATO,                 ' +
        '                      '
      ''
      
        '                   0 AS IDADITAMENTO,                           ' +
        '                      '
      ''
      
        '                   TO_CHAR(CO.DATAASSINATURA,'#39'DD/MM/YYYY'#39') AS DA' +
        'TAASSINATURA,       '
      ''
      
        '                   CO.FLGSALDOTRANSFERIDO,                      ' +
        '                      '
      ''
      
        '                   '#39'S'#39' AS FLGREINICIODASPARCELAS,               ' +
        '                    '
      ''
      
        '                   CO.FLG_TP_VLR_ORCADO_APROVADO,               ' +
        '                      '
      ''
      
        '                   NULL AS FLGTIPO,                             ' +
        '                      '
      ''
      
        '                   NULL AS CODADITAMENTO                        ' +
        '                      '
      ''
      
        '            FROM CM.CONTRATOCONTR CO                            ' +
        '                      '
      ''
      '            WHERE IDCONTRATO = -1'
      ''
      
        '                                                                ' +
        '                      '
      ''
      
        '           UNION                                                ' +
        '                     '
      ''
      
        '                                                                ' +
        '                      '
      ''
      
        '            SELECT CAST('#39'Aditamento'#39' AS VARCHAR2(30)) AS NOME,  ' +
        '                    '
      ''
      
        '                   A.IDCONTRATO AS IDCONTRATO,                  ' +
        '                      '
      ''
      
        '                   A.IDADITAMENTO AS IDADITAMENTO,              ' +
        '                      '
      ''
      
        '                   TO_CHAR(A.DATAASSADITAMENTO,'#39'DD/MM/YYYY'#39') AS ' +
        'DATAASSINATURA,     '
      ''
      
        '                   A.FLGSALDOTRANSFERIDO,                       ' +
        '                      '
      ''
      
        '                   A.FLGREINICIODASPARCELAS,                    ' +
        '                      '
      ''
      
        '                   NULL AS FLG_TP_VLR_ORCADO_APROVADO,          ' +
        '                      '
      ''
      
        '                   A.FLGTIPO,                                   ' +
        '                      '
      ''
      
        '                   A.CODADITAMENTO                              ' +
        '                      '
      ''
      
        '             FROM CM.ADITAMENTO A                               ' +
        '                       '
      ''
      '            WHERE IDCONTRATO = -1'
      ''
      
        '                   AND A.FLGTIPO = '#39'A'#39'                          ' +
        '                     '
      ''
      
        '                                                                ' +
        '                      '
      ''
      '           UNION'
      ''
      ''
      ''
      '            SELECT CAST('#39'Outros'#39' AS VARCHAR2(30)) AS NOME,'
      ''
      '                   A.IDCONTRATO AS IDCONTRATO,'
      ''
      '                   A.IDADITAMENTO AS IDADITAMENTO,'
      ''
      
        '                   TO_CHAR(A.DATAASSADITAMENTO,'#39'DD/MM/YYYY'#39') AS ' +
        'DATAASSINATURA,'
      ''
      '                   A.FLGSALDOTRANSFERIDO,'
      ''
      '                   A.FLGREINICIODASPARCELAS,'
      ''
      '                   NULL AS FLG_TP_VLR_ORCADO_APROVADO,'
      ''
      '                   A.FLGTIPO,'
      ''
      '                   A.CODADITAMENTO'
      ''
      '             FROM CM.ADITAMENTO A'
      ''
      '            WHERE IDCONTRATO = -1'
      ''
      '                   AND A.FLGTIPO = '#39'C'#39
      ''
      '  UNION'
      ''
      '            SELECT CAST('#39'Ajuste'#39' AS VARCHAR2(30)) AS NOME,'
      ''
      '                   A.IDCONTRATO AS IDCONTRATO,'
      ''
      '                   A.IDADITAMENTO AS IDADITAMENTO,'
      ''
      
        '                   TO_CHAR(A.DATAASSADITAMENTO,'#39'DD/MM/YYYY'#39') AS ' +
        'DATAASSINATURA,'
      ''
      '                   A.FLGSALDOTRANSFERIDO,'
      ''
      '                   A.FLGREINICIODASPARCELAS,'
      ''
      '                   NULL AS FLG_TP_VLR_ORCADO_APROVADO,'
      ''
      '                   A.FLGTIPO,'
      ''
      '                   A.CODADITAMENTO'
      ''
      '             FROM CM.ADITAMENTO A'
      ''
      '            WHERE IDCONTRATO = -1'
      ''
      '                   AND A.FLGTIPO = '#39'J'#39
      ''
      '            )'
      ''
      '      ORDER BY 3 ASC'
      ''
      '     )'
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsOrigemSaldo
    Left = 391
    Top = 445
  end
  object cdsPagtosSintetico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 611
    Top = 322
    object cdsPagtosSinteticoVL_TOTAL_CONTRATO: TFloatField
      FieldName = 'VL_TOTAL_CONTRATO'
    end
    object cdsPagtosSinteticoVL_PAGO_CONTRATO: TFloatField
      FieldName = 'VL_PAGO_CONTRATO'
    end
    object cdsPagtosSinteticoSALDO_A_PAGAR: TFloatField
      FieldName = 'SALDO_A_PAGAR'
    end
    object cdsPagtosSinteticoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object cdsPagtosSinteticoFLGSALDOTRANSFERIDO: TStringField
      FieldName = 'FLGSALDOTRANSFERIDO'
      FixedChar = True
      Size = 1
    end
    object cdsPagtosSinteticoTOTAL_PAGO_CONTRATO: TFloatField
      FieldName = 'TOTAL_PAGO_CONTRATO'
    end
  end
  object sqlPagtosSintetico: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ''
      
        '-- VALOR TOTAL DO CONTRATO                                      ' +
        '                      '
      ''
      ' CASE'
      ' '
      '   WHEN NVL(CON.FLG_TP_VLR_ORCADO_APROVADO, '#39' '#39') = '#39'N'#39' THEN'
      '    0.00'
      ' '
      '   ELSE'
      '    NVL(VL_BASE_CONTRATO.VALORBASECONTRATO, 0)'
      ' '
      ' END AS VL_TOTAL_CONTRATO,'
      ' '
      
        ' -- VALORES PAGOS (VALORES MEDIDOS)                             ' +
        '                       '
      ' '
      ' NVL(MED.VALORMEDICAO, 0) VL_PAGO_CONTRATO,'
      ' '
      
        ' -- SALDO DO CONTRATO A PAGAR (VALOR TOTAL - VALORES PAGOS)     ' +
        '                       '
      ' '
      ' CASE'
      ' '
      '   WHEN NVL(CON.FLG_TP_VLR_ORCADO_APROVADO, '#39' '#39') = '#39'N'#39' THEN'
      '    0.00'
      ' '
      '   ELSE'
      
        '    (VL_BASE_CONTRATO.VALORBASECONTRATO - NVL(MED.VALORMEDICAO, ' +
        '0))'
      ' '
      ' END AS SALDO_A_PAGAR,'
      ' '
      ' CON.IDCONTRATO,'
      ' '
      ' CON.FLGSALDOTRANSFERIDO,'
      ' TOTPAGO.TOTAL_PAGO_CONTRATO'
      ''
      
        '  FROM (SELECT IDCONTRATO, FLGSALDOTRANSFERIDO, FLG_TP_VLR_ORCAD' +
        'O_APROVADO'
      '        '
      '          FROM CONTRATOCONTR'
      '        '
      '         WHERE IDCONTRATO = -1'
      '        '
      '        ) CON'
      ''
      
        '-- VALOR TOTAL DO CONTRATO                                      ' +
        '       '
      ''
      '  JOIN (SELECT CO.IDCONTRATO,'
      '               SUM(DECODE(CO.FLGTIPOVALORBASE,'
      '                          '#39'F'#39','
      '                          CO.VALORBASECONTRATO,'
      '                          CO.VALOR_ORCADO)) VALORBASECONTRATO'
      '        '
      '          FROM CM.CONTRATOCONTR CO'
      '        '
      '         GROUP BY CO.IDCONTRATO) VL_BASE_CONTRATO'
      '    ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO'
      ''
      
        '-- MEDICAO (VALORES PAGOS)                                      ' +
        '                 '
      ''
      '  LEFT JOIN (SELECT MI.IDCONTRATO,'
      '                    NVL(CP.IDADITAMENTO, 0) AS IDADITAMENTO,'
      '                    SUM(MI.VALORMEDICAO) VALORMEDICAO'
      '             '
      '               FROM CM.MEDICAO MI'
      '             '
      '               LEFT JOIN CTRLPARCELAMEDICAO CP'
      '                 ON CP.IDMEDICAO = MI.IDMEDICAO'
      '                   '
      '                AND CP.IDMEDICAO IS NOT NULL'
      '                   '
      '                AND CP.FLGPARCELAMEDIDA = 1'
      '             '
      '              GROUP BY MI.IDCONTRATO, CP.IDADITAMENTO) MED'
      '    ON MED.IDCONTRATO = CON.IDCONTRATO'
      '      '
      '   AND NVL(MED.IDADITAMENTO, 0) = 0'
      ''
      
        '  LEFT JOIN (SELECT MI.IDCONTRATO, SUM(MI.VALORMEDICAO) TOTAL_PA' +
        'GO_CONTRATO'
      '               FROM CM.MEDICAO MI'
      '               LEFT JOIN CTRLPARCELAMEDICAO CP'
      '                 ON CP.IDMEDICAO = MI.IDMEDICAO'
      '                AND CP.IDMEDICAO IS NOT NULL'
      '                AND CP.FLGPARCELAMEDIDA = 1'
      '              GROUP BY MI.IDCONTRATO) TOTPAGO'
      '    ON TOTPAGO.IDCONTRATO = CON.IDCONTRATO'
      ''
      ' WHERE CON.IDCONTRATO = -1'
      '')
    ClientDataSet = cdsPagtosSintetico
    Left = 612
    Top = 445
  end
  object cdsPagtosAnalitico: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ascDATAVENCPARCELA'
        Fields = 'DATAVENCPARCELA'
      end
      item
        Name = 'descDATAVENCPARCELA'
        Fields = 'DATAVENCPARCELA'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 499
    Top = 322
    object cdsPagtosAnaliticoNODOCUMENTO: TFloatField
      DisplayLabel = 'Nº Documento'
      DisplayWidth = 11
      FieldName = 'NODOCUMENTO'
    end
    object cdsPagtosAnaliticoDATAVENCPARCELA: TDateTimeField
      DisplayLabel = 'Data Vencto'
      DisplayWidth = 12
      FieldName = 'DATAVENCPARCELA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsPagtosAnaliticoVALORMEDICAO: TFloatField
      DisplayLabel = 'Valor Medição'
      DisplayWidth = 15
      FieldName = 'VALORMEDICAO'
      DisplayFormat = '#,##0.00'
    end
    object cdsPagtosAnaliticoOBS: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 50
      FieldName = 'OBS'
      Size = 254
    end
    object cdsPagtosAnaliticoHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico Complementar'
      DisplayWidth = 50
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object cdsPagtosAnaliticoIDADITAMENTO: TFloatField
      DisplayLabel = 'IdAditamento'
      DisplayWidth = 10
      FieldName = 'IDADITAMENTO'
    end
    object cdsPagtosAnaliticoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsPagtosAnaliticoIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Visible = False
    end
    object cdsPagtosAnaliticoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object sqlPagtosAnalitico: TCMSqlParams
    SQL.Strings = (
      
        'SELECT M.IDCONTRATO, M.IDMEDICAO, PR.CODDOCUMENTO, M.NODOCUMENTO' +
        ', NVL(CP.IDADITAMENTO,0) AS IDADITAMENTO,'
      
        #9'   PR.DATAVENCPARCELA, M.VALORMEDICAO, SUBSTR(M.OBS, 0, 254) OB' +
        'S, SUBSTR(M.HISTORICOCOMPL, 0, 254) HISTORICOCOMPL'
      '  FROM CM.MEDICAO M'
      '  JOIN CM.PARCELAREALCONTR PR ON PR.IDMEDICAO = M.IDMEDICAO'
      
        '  LEFT JOIN CM.CTRLPARCELAMEDICAO CP ON CP.IDMEDICAO = PR.IDMEDI' +
        'CAO'
      ' WHERE M.IDCONTRATO = 1606 AND NVL(CP.IDADITAMENTO,0) = 0'
      'ORDER BY PR.DATAVENCPARCELA DESC')
    ClientDataSet = cdsPagtosAnalitico
    Left = 504
    Top = 445
  end
end
