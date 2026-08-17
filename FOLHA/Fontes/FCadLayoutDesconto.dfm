inherited frmCadLayoutDesconto: TfrmCadLayoutDesconto
  Left = 0
  Top = 115
  HelpContext = 180039
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Layout de Arquivos de Entrada'
  ClientHeight = 705
  ClientWidth = 1424
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label31: TLabel [0]
    Left = 568
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Label31'
  end
  inherited pnlFundo: TPanel
    Width = 1424
    Height = 619
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 110
      Width = 1422
      Height = 508
      TabOrder = 0
      Tabs.Strings = (
        'Modelo ')
      TabStop = False
      detdbGrids.Strings = (
        'dbgrdDet'
        'wwDBGrid1')
      inherited pgctrlDetalhe: TPageControl
        Width = 1324
        Height = 449
        TabStop = False
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 1316
            Height = 421
            Selected.Strings = (
              'IDLAYOUT'#9'8'#9'Código'#9'F'
              'COLVALOR'#9'8'#9'  Coluna ~ do Valor'#9'F'
              'TAMVALOR'#9'8'#9'Tamanho ~ do Valor'#9'F'
              'NUMDECIMAIS'#9'8'#9' Número ~Decimais'#9'F'
              'CARACDECIMAL'#9'1'#9'Caracter ~Decimal'#9'F'
              'DESCR_RUBRICA'#9'60'#9'Código/Descrição da Rubrica'#9'F'
              'COLRUBRICA'#9'9'#9'  Coluna ~da Rubrica'#9'F'
              'TAMRUBRICA'#9'9'#9' Tamanho ~da Rubrica'#9'F'
              'COLPARCELAS'#9'10'#9' Coluna Nº ~de Parcelas'#9'F'
              'TAMPARCELAS'#9'10'#9'Tamanho Nº ~de Parcelas'#9'F'
              'COLVALINFO'#9'10'#9'Coluna Valor ~ Informativo'#9'F'
              'TAMVALINFO'#9'10'#9'Tamanho Valor ~  Informativo'#9'F'
              'RUBRICA_DEVOL'#9'60'#9'Rubrica de Devolução'#9'F'
              'CARACNATUREZA'#9'1'#9'Caracter ~Natureza'#9'F'
              'COLNATUREZA'#9'8'#9'Coluna ~Natureza'#9'F'
              'FAVORECIDO'#9'35'#9' Nome do Favorecido'#9'F'
              'NOMEREGRA'#9'40'#9'Regra Associada'#9'F'
              'DESCRICAOREGRA'#9'8'#9'Descrição ~da Regra'#9'F'
              'COLOPERACAO'#9'10'#9'Coluna Cód. ~ Operação'#9'F'
              'COLMESREF'#9'7'#9'Coluna Mês ~Referência'#9'F'
              'COLCONTROLE'#9'10'#9'Coluna Cód. ~ Controle'#9'F'
              'TAMCONTROLE'#9'10'#9'Tam. Cód. ~ Controle'#9'F')
            MemoAttributes = []
            KeyOptions = [dgEnterToTab, dgAllowDelete, dgAllowInsert]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 1316
            Height = 421
            object gbValor: TGroupBox
              Left = 1
              Top = 1
              Width = 85
              Height = 186
              Caption = 'Valor'
              TabOrder = 0
              object Label4: TLabel
                Left = 6
                Top = 19
                Width = 46
                Height = 13
                Caption = 'Posição'
              end
              object Label5: TLabel
                Left = 6
                Top = 58
                Width = 53
                Height = 13
                Caption = 'Tamanho'
              end
              object Label27: TLabel
                Left = 6
                Top = 98
                Width = 72
                Height = 13
                Caption = 'Nº  decimais'
              end
              object Label29: TLabel
                Left = 6
                Top = 137
                Width = 73
                Height = 13
                Caption = 'Chr. Decimal'
              end
              object dbedtPosicaoValor: TwwDBEdit
                Left = 5
                Top = 32
                Width = 57
                Height = 21
                DataField = 'COLVALOR'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedtTamValor: TwwDBEdit
                Left = 5
                Top = 70
                Width = 56
                Height = 21
                DataField = 'TAMVALOR'
                DataSource = dsDet
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnChange = dbedtTamValorChange
              end
              object dbedtNumDecimais: TwwDBEdit
                Left = 5
                Top = 111
                Width = 57
                Height = 21
                DataField = 'NUMDECIMAIS'
                DataSource = dsDet
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbcboCaracDecimal: TwwDBComboBox
                Left = 7
                Top = 150
                Width = 57
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = False
                AllowClearKey = False
                DataField = 'CARACDECIMAL'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  '.'
                  ',')
                Sorted = False
                TabOrder = 3
                UnboundDataType = wwDefault
              end
            end
            object Panel3: TPanel
              Left = 88
              Top = 133
              Width = 561
              Height = 56
              TabOrder = 1
              object Label10: TLabel
                Left = 143
                Top = 7
                Width = 69
                Height = 13
                Caption = 'Fornecedor '
              end
              object Label12: TLabel
                Left = 142
                Top = 32
                Width = 97
                Height = 13
                Caption = 'Regra Associada'
              end
              object edtfavorecido: TEdit
                Left = 242
                Top = 4
                Width = 288
                Height = 21
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 0
                OnExit = edtfavorecidoExit
                OnKeyDown = edtRubricaDevolucaoKeyDown
                OnKeyPress = edtRubricaDevolucaoKeyPress
              end
              object bbtnSelecionaFavorecido: TBitBtn
                Left = 533
                Top = 3
                Width = 22
                Height = 22
                TabOrder = 1
                OnClick = bbtnSelecionaFavorecidoClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
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
              end
              object dblkRegras: TDBLookupComboBox
                Left = 242
                Top = 29
                Width = 313
                Height = 21
                DataField = 'IDREGRA'
                DataSource = dsDet
                KeyField = 'IDREGRA'
                ListField = 'NOMEREGRA'
                ListSource = dsRegras
                TabOrder = 2
              end
              object GroupBox1: TGroupBox
                Left = 4
                Top = 1
                Width = 135
                Height = 51
                Caption = 'Natureza'
                TabOrder = 3
                object Label19: TLabel
                  Left = 7
                  Top = 12
                  Width = 49
                  Height = 13
                  Caption = 'Caracter'
                end
                object Label26: TLabel
                  Left = 68
                  Top = 12
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object dbechrNatureza: TwwDBEdit
                  Left = 4
                  Top = 26
                  Width = 57
                  Height = 21
                  DataField = 'CARACNATUREZA'
                  DataSource = dsDet
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object wwDBEdit1: TwwDBEdit
                  Left = 66
                  Top = 26
                  Width = 57
                  Height = 21
                  DataField = 'COLNATUREZA'
                  DataSource = dsDet
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object PNLRUBRICAS: TPanel
              Left = 87
              Top = 0
              Width = 562
              Height = 123
              TabOrder = 2
              object pnlRubmanual: TPanel
                Left = 3
                Top = 68
                Width = 557
                Height = 54
                TabOrder = 0
                object Label30: TLabel
                  Left = 6
                  Top = 33
                  Width = 128
                  Height = 13
                  Caption = 'Rubrica de Devolução'
                end
                object Label6: TLabel
                  Left = 6
                  Top = 9
                  Width = 227
                  Height = 13
                  Caption = 'Rubrica Normal (Provento ou Desconto)'
                end
                object edtRubricaDevolucao: TEdit
                  Left = 244
                  Top = 29
                  Width = 281
                  Height = 21
                  AutoSize = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnExit = edtRubricaDevolucaoExit
                  OnKeyDown = edtRubricaDevolucaoKeyDown
                  OnKeyPress = edtRubricaDevolucaoKeyPress
                end
                object bbtnSelecionaRubricaDevolucao: TBitBtn
                  Left = 530
                  Top = 28
                  Width = 22
                  Height = 22
                  TabOrder = 1
                  OnClick = bbtnSelecionaRubricaDevolucaoClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
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
                end
                object edtRubricaNormal: TEdit
                  Left = 244
                  Top = 4
                  Width = 281
                  Height = 21
                  AutoSize = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnExit = edtRubricaNormalExit
                  OnKeyDown = edtRubricaDevolucaoKeyDown
                  OnKeyPress = edtRubricaDevolucaoKeyPress
                end
                object bbtnSelecionaRubricaNormal: TBitBtn
                  Left = 530
                  Top = 3
                  Width = 22
                  Height = 22
                  TabOrder = 3
                  OnClick = bbtnSelecionaRubricaNormalClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
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
                end
              end
              object pnlRubAutomatica: TPanel
                Left = 3
                Top = 4
                Width = 556
                Height = 63
                TabOrder = 1
                object gbxrubricas: TGroupBox
                  Left = 3
                  Top = 1
                  Width = 135
                  Height = 57
                  Caption = ' Rubrica '
                  TabOrder = 0
                  object Label7: TLabel
                    Left = 8
                    Top = 15
                    Width = 46
                    Height = 13
                    Caption = 'Posição'
                  end
                  object Label11: TLabel
                    Left = 68
                    Top = 15
                    Width = 53
                    Height = 13
                    Caption = 'Tamanho'
                  end
                  object dbedtPosicaoRubrica: TwwDBEdit
                    Left = 8
                    Top = 30
                    Width = 57
                    Height = 21
                    DataField = 'COLRUBRICA'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbedtTamRubrica: TwwDBEdit
                    Left = 68
                    Top = 30
                    Width = 56
                    Height = 21
                    DataField = 'TAMRUBRICA'
                    DataSource = dsDet
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object gbxsequencial: TGroupBox
                  Left = 141
                  Top = 1
                  Width = 135
                  Height = 57
                  Caption = ' Seq. Rubrica '
                  TabOrder = 1
                  object Label15: TLabel
                    Left = 9
                    Top = 15
                    Width = 46
                    Height = 13
                    Caption = 'Posição'
                  end
                  object Label16: TLabel
                    Left = 69
                    Top = 15
                    Width = 53
                    Height = 13
                    Caption = 'Tamanho'
                  end
                  object dbedtPosicaoSequencial: TwwDBEdit
                    Left = 9
                    Top = 30
                    Width = 57
                    Height = 21
                    DataField = 'COLOCORRENCIAS'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbedtTamSequencial: TwwDBEdit
                    Left = 69
                    Top = 30
                    Width = 56
                    Height = 21
                    DataField = 'TAMOCORRENCIAS'
                    DataSource = dsDet
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object gbxParcelas: TGroupBox
                  Left = 278
                  Top = 1
                  Width = 135
                  Height = 57
                  Caption = ' Nº Parcelas '
                  TabOrder = 2
                  object Label20: TLabel
                    Left = 9
                    Top = 15
                    Width = 46
                    Height = 13
                    Caption = 'Posição'
                  end
                  object Label25: TLabel
                    Left = 69
                    Top = 15
                    Width = 53
                    Height = 13
                    Caption = 'Tamanho'
                  end
                  object dbedtPosicaoParcelas: TwwDBEdit
                    Left = 9
                    Top = 29
                    Width = 57
                    Height = 21
                    DataField = 'COLPARCELAS'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeDtTamParcelas: TwwDBEdit
                    Left = 69
                    Top = 29
                    Width = 56
                    Height = 21
                    DataField = 'TAMPARCELAS'
                    DataSource = dsDet
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object gbValorInformativo: TGroupBox
                  Left = 416
                  Top = 1
                  Width = 135
                  Height = 57
                  Caption = ' Valor Informativo '
                  TabOrder = 3
                  object Label14: TLabel
                    Left = 9
                    Top = 15
                    Width = 46
                    Height = 13
                    Caption = 'Posição'
                  end
                  object Label17: TLabel
                    Left = 69
                    Top = 15
                    Width = 53
                    Height = 13
                    Caption = 'Tamanho'
                  end
                  object dbedtPosicaoValinfo: TwwDBEdit
                    Left = 9
                    Top = 29
                    Width = 57
                    Height = 21
                    DataField = 'COLVALINFO'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbedtTamValinfo: TwwDBEdit
                    Left = 69
                    Top = 29
                    Width = 56
                    Height = 21
                    DataField = 'TAMVALINFO'
                    DataSource = dsDet
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 192
              Width = 649
              Height = 41
              Caption = 'Panel1'
              TabOrder = 3
              object GroupBox2: TGroupBox
                Left = 1
                Top = 1
                Width = 190
                Height = 39
                Align = alLeft
                Caption = 'Código de Operação'
                TabOrder = 0
                object Label32: TLabel
                  Left = 12
                  Top = 18
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object dbeColOperacao: TwwDBEdit
                  Left = 65
                  Top = 14
                  Width = 57
                  Height = 21
                  DataField = 'COLOPERACAO'
                  DataSource = dsDet
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox5: TGroupBox
                Left = 191
                Top = 1
                Width = 190
                Height = 39
                Align = alLeft
                Caption = 'Mês de Referência'
                TabOrder = 1
                object Label36: TLabel
                  Left = 12
                  Top = 18
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object dbeColMesRef: TwwDBEdit
                  Left = 67
                  Top = 14
                  Width = 57
                  Height = 21
                  DataField = 'COLMESREF'
                  DataSource = dsDet
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox3: TGroupBox
                Left = 381
                Top = 1
                Width = 263
                Height = 39
                Align = alLeft
                Caption = 'Código de Controle'
                TabOrder = 2
                object Label40: TLabel
                  Left = 10
                  Top = 18
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label41: TLabel
                  Left = 131
                  Top = 18
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosControle: TwwDBEdit
                  Left = 64
                  Top = 14
                  Width = 57
                  Height = 21
                  DataField = 'COLCONTROLE'
                  DataSource = dsDet
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbEdtTamControle: TwwDBEdit
                  Left = 193
                  Top = 12
                  Width = 57
                  Height = 21
                  DataField = 'TAMCONTROLE'
                  DataSource = dsDet
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 1328
        Height = 449
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Cancel = False
          end
          inherited bbtnVoltarDet: TBitBtn
            Cancel = False
            Enabled = False
          end
        end
      end
      inherited Dock973: TDock97 [2]
        Width = 1414
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1422
      Height = 109
      TabOrder = 1
      object Label1: TLabel
        Left = 3
        Top = 1
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object pgctrlMestre: TPageControl
        Left = 211
        Top = 0
        Width = 1211
        Height = 109
        ActivePage = tbsTxAdmin
        Align = alRight
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        TabStop = False
        object tbsTitular: TTabSheet
          Caption = 'Identificação Titular'
          object Label2: TLabel
            Left = 16
            Top = 4
            Width = 46
            Height = 13
            Caption = 'Posição'
          end
          object Label3: TLabel
            Left = 80
            Top = 4
            Width = 53
            Height = 13
            Caption = 'Tamanho'
          end
          object rdbtnMatricula: TRadioButton
            Left = 152
            Top = 22
            Width = 81
            Height = 17
            Caption = 'Matrícula'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
          object rdbtnInscricao: TRadioButton
            Left = 240
            Top = 22
            Width = 137
            Height = 17
            Caption = 'Número de Inscrição'
            TabOrder = 3
          end
          object dbedtMatriculaPosicao: TwwDBEdit
            Left = 16
            Top = 20
            Width = 49
            Height = 21
            DataField = 'COLCODIGO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedtMatriculaTam: TwwDBEdit
            Left = 80
            Top = 20
            Width = 56
            Height = 21
            DataField = 'TAMCODIGO'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object tbsDependente: TTabSheet
          Caption = 'Dependente'
          object Label8: TLabel
            Left = 16
            Top = 4
            Width = 46
            Height = 13
            Caption = 'Posição'
          end
          object Label9: TLabel
            Left = 80
            Top = 4
            Width = 53
            Height = 13
            Caption = 'Tamanho'
          end
          object Label13: TLabel
            Left = 144
            Top = 3
            Width = 268
            Height = 13
            Caption = 'OBS: Preencher apenas se, para cada linha do'
          end
          object Label18: TLabel
            Left = 144
            Top = 21
            Width = 247
            Height = 13
            Caption = 'TXT, for indicado um Dependente diferente'
          end
          object dbedtDepPosicao: TwwDBEdit
            Left = 16
            Top = 20
            Width = 49
            Height = 21
            DataField = 'COLCODIGODEP'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dbedtDepPosicaoChange
          end
          object dbedtDepTam: TwwDBEdit
            Left = 80
            Top = 20
            Width = 57
            Height = 21
            DataField = 'TAMCODIGODEP'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dbedtDepTamChange
          end
        end
        object tbsFavorecido: TTabSheet
          Caption = 'Favorecido'
          object Label21: TLabel
            Left = 16
            Top = 4
            Width = 46
            Height = 13
            Caption = 'Posição'
          end
          object Label22: TLabel
            Left = 80
            Top = 4
            Width = 53
            Height = 13
            Caption = 'Tamanho'
          end
          object Label23: TLabel
            Left = 144
            Top = 3
            Width = 268
            Height = 13
            Caption = 'OBS: Preencher apenas se, para cada linha do'
          end
          object Label24: TLabel
            Left = 144
            Top = 21
            Width = 241
            Height = 13
            Caption = 'TXT, for indicado um Favorecido diferente'
          end
          object dbedtFavPosicao: TwwDBEdit
            Left = 16
            Top = 20
            Width = 49
            Height = 21
            DataField = 'COLCODFAVORECIDO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dbedtFavPosicaoChange
          end
          object dbedtFavTam: TwwDBEdit
            Left = 80
            Top = 20
            Width = 57
            Height = 21
            DataField = 'TAMCODFAVORECIDO'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dbedtFavTamChange
          end
        end
        object tbsTipoConvenio: TTabSheet
          Caption = 'Tipo do Convenio'
          ImageIndex = 3
          object dbrTipoConv: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 494
            Height = 81
            Align = alLeft
            Columns = 2
            DataField = 'FLGTIPOCONVENIO'
            DataSource = ds
            Items.Strings = (
              'Avulso '
              'Continuado ')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
        end
        object tbsTratamentoHeader: TTabSheet
          Caption = 'Tratamento de Header e Trailler'
          ImageIndex = 5
          object dbrUtilizaHeadTrai: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 182
            Height = 81
            Align = alLeft
            Caption = 'Utiliza Header e Trailler'
            Columns = 2
            DataField = 'FLGUSAHEADTRAI'
            DataSource = ds
            Items.Strings = (
              'Não'
              'Sim')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
            OnChange = dbrUtilizaHeadTraiChange
          end
          object gbxqtdHeadTrai: TGroupBox
            Left = 182
            Top = 0
            Width = 312
            Height = 81
            Align = alLeft
            Caption = 'Especifique o Nº de Linhas para :'
            TabOrder = 1
            object Label33: TLabel
              Left = 15
              Top = 21
              Width = 50
              Height = 13
              Caption = 'Header :'
            end
            object Label34: TLabel
              Left = 158
              Top = 21
              Width = 48
              Height = 13
              Caption = 'Trailler :'
            end
            object dbeLinhasHeader: TwwDBEdit
              Left = 73
              Top = 17
              Width = 56
              Height = 21
              DataField = 'LINHASHEADER'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeLinhasTrailler: TwwDBEdit
              Left = 213
              Top = 16
              Width = 56
              Height = 21
              DataField = 'LINHASTRAILLER'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsFinanceiro: TTabSheet
          Caption = 'Informações Relativas ao Financeiro'
          ImageIndex = 7
          object dbrdgContasAReceber: TDBRadioGroup
            Left = 116
            Top = 0
            Width = 123
            Height = 81
            Align = alLeft
            Caption = 'Contas a Receber'
            DataField = 'FLGGERACRECEBER'
            DataSource = ds
            Items.Strings = (
              'Automático'
              'Manual')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
            OnChange = dbrdgContasAReceberChange
          end
          object dbrdgContasAPagar: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 116
            Height = 81
            Align = alLeft
            Caption = 'Contas a Pagar'
            DataField = 'FLGGERACPAGAR'
            DataSource = ds
            Items.Strings = (
              'Automático'
              'Manual')
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
            OnChange = dbrdgContasAPagarChange
          end
          object cboxEletronico: TCheckBox
            Left = 251
            Top = 15
            Width = 234
            Height = 17
            Caption = 'Gera Arquivo Eletrônico de Remessa'
            TabOrder = 2
          end
        end
        object tbsPortForma: TTabSheet
          Caption = 'Portador Forma do Favorecido'
          ImageIndex = 7
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 247
            Height = 81
            Align = alLeft
            Caption = 'Pagamento'
            TabOrder = 0
            object dblkPortFormaPag: TwwDBLookupCombo
              Left = 6
              Top = 17
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'CODPORTFORMAFAV'
              DataSource = ds
              LookupTable = dtmLookFolha.cdsPortFormaPag
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object GroupBox6: TGroupBox
            Left = 247
            Top = 0
            Width = 247
            Height = 81
            Align = alLeft
            Caption = 'Recebimento'
            TabOrder = 1
            object dblkPortFormaRec: TwwDBLookupCombo
              Left = 7
              Top = 17
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'CODPORTFORMAFVREC'
              DataSource = ds
              LookupTable = dtmLookFolha.cdsPortFormaRec
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbsFechamento: TTabSheet
          Caption = 'Informações de Fechamento'
          ImageIndex = 8
          object dbrTratamento: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 97
            Height = 81
            Align = alLeft
            Caption = 'Trata resíduo '
            DataField = 'FLGTRATARESIDUO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Não'
              'Sim')
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object gbDiaPag: TGroupBox
            Left = 97
            Top = 0
            Width = 123
            Height = 81
            Align = alLeft
            Caption = 'Dia de Pagamento'
            TabOrder = 1
            object dbspinDiaPagto: TwwDBSpinEdit
              Left = 14
              Top = 18
              Width = 39
              Height = 21
              Increment = 1
              MaxValue = 31
              MinValue = 1
              Value = 1
              DataField = 'DIAPAGAMENTO'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          object dbrdgMesPag: TDBRadioGroup
            Left = 368
            Top = 0
            Width = 127
            Height = 81
            Align = alLeft
            Caption = 'Mês de Pagamento'
            DataField = 'FLGMESPAGTO'
            DataSource = ds
            Items.Strings = (
              'Mês da Folha'
              'Próximo Mês')
            TabOrder = 3
            Values.Strings = (
              '0'
              '1')
          end
          object dbrdgDiaUtil: TDBRadioGroup
            Left = 220
            Top = 0
            Width = 148
            Height = 81
            Align = alLeft
            Caption = 'Pagamento em Dia Útil'
            DataField = 'FLGDIAUTIL'
            DataSource = ds
            Items.Strings = (
              'Anterior'
              'Posterior')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
          end
        end
        object tbsImportacao: TTabSheet
          Caption = 'Parâmetros para Importações'
          ImageIndex = 8
          object Label28: TLabel
            Left = 191
            Top = 37
            Width = 142
            Height = 29
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Situação dos Benefícios na Importação'
            ParentBiDiMode = False
            WordWrap = True
          end
          object Label35: TLabel
            Left = 191
            Top = 3
            Width = 142
            Height = 29
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Tratamento de registros duplicados'
            ParentBiDiMode = False
            WordWrap = True
          end
          object ChkAtivos: TCheckBox
            Left = 9
            Top = 29
            Width = 161
            Height = 17
            Caption = 'Importação só de Ativos'
            TabOrder = 0
          end
          object chkCritica: TCheckBox
            Left = 8
            Top = 5
            Width = 159
            Height = 17
            Caption = 'Gera Arquivo de Crítica'
            TabOrder = 1
          end
          object ChkcriticaRubrica: TCheckBox
            Left = 9
            Top = 53
            Width = 165
            Height = 17
            Caption = 'Efetua crítica de rubrica'
            TabOrder = 2
          end
          object cbboxBeneficio: TComboBox
            Left = 339
            Top = 41
            Width = 852
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 3
            Items.Strings = (
              'Qualquer situação'
              'Apenas benefícios ativos'
              'Benefícios ativos ou retidos'
              'Benefícios ativos e preparados no mês')
          end
          object cbboxDuplicado: TComboBox
            Left = 339
            Top = 7
            Width = 852
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 4
            Items.Strings = (
              'Ignorar registro (Permanecerá o valor anterior)'
              'Alterar valor do registro'
              'Somar o valor atual ao valor anterior'
              'Aceitar os registros duplicados')
          end
        end
        object tbsTxAdmin: TTabSheet
          Caption = 'Taxa Administração'
          ImageIndex = 9
          object Label37: TLabel
            Left = 16
            Top = 2
            Width = 99
            Height = 13
            Caption = 'Regra de Cálculo'
          end
          object Label38: TLabel
            Left = 16
            Top = 42
            Width = 116
            Height = 13
            Caption = 'Tipo de Desembolso'
          end
          inline molRegraCalcTx: TmolRegraDB
            Left = 8
            Top = 16
            Height = 25
            inherited DBedtRegra: TDBEdit
              Top = 0
              DataField = 'REGRA'
              DataSource = ds
            end
            inherited btnBuscaRegra: TBitBtn
              Top = 0
              OnClick = molRegraCalcTxbtnBuscaRegraClick
            end
            inherited btnLimpaRegra: TBitBtn
              Top = 0
            end
            inherited DBedtIDRegra: TDBEdit
              Top = 0
              DataField = 'IDREGRATXADMIN'
              DataSource = ds
            end
          end
          object DBcboTipoDesemb: TwwDBLookupCombo
            Left = 16
            Top = 56
            Width = 345
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
            DataField = 'CODTIPRECDES'
            DataSource = ds
            LookupTable = dtmLookFolha.cdsTipoDesemb
            LookupField = 'CODTIPRECDES'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = DBcboTipoDesembCloseUp
            OnExit = DBcboTipoDesembExit
          end
          object mskCCBaixa: TCMProcuraMaskContabil
            Left = 376
            Top = 0
            Width = 201
            Height = 77
            Caption = ' Conta Contábil para Baixa '
            TabOrder = 2
            OnExit = mskCCBaixaExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTABAIXA'
            Mensagens.EmBranco = 'Conta não pode estar em branco'
            Mensagens.NaoExiste = 'Conta não existe'
            Mensagens.Sintetica = 'Conta não pode ser sintética'
            Mensagens.Analitica = 'Conta não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
        end
      end
      object dbedtDescricao: TwwDBEdit
        Left = 3
        Top = 17
        Width = 197
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1424
    inherited Toolbar971: TToolbar97
      object sbtnReplicar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Replicar'
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
        OnClick = sbtnReplicarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 666
    Width = 1424
    inherited tb97Fundo: TToolbar97
      Left = 352
      DockPos = 352
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      DockPos = 183
      inherited bbtnConfirmar: TBitBtn
        Default = False
      end
      inherited bbtnCancelar: TBitBtn
        Cancel = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 992
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 176
    Top = 152
  end
  inherited ds: TwwDataSource
    Left = 80
    Top = 96
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTDESCONTO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  COLCODIGO = :COLCODIGO,'
      '  TAMCODIGO = :TAMCODIGO,'
      '  FLGMATRICULA = :FLGMATRICULA,'
      '  COLCODFAVORECIDO = :COLCODFAVORECIDO,'
      '  TAMCODFAVORECIDO = :TAMCODFAVORECIDO,'
      '  COLCODIGODEP = :COLCODIGODEP,'
      '  TAMCODIGODEP = :TAMCODIGODEP,'
      '  FLGPOSSUIDEP = :FLGPOSSUIDEP,'
      '  FLGTIPOCONVENIO = :FLGTIPOCONVENIO,'
      '  FLGTRATARESIDUO = :FLGTRATARESIDUO,'
      '  FLGUSAHEADTRAI = :FLGUSAHEADTRAI,'
      '  LINHASHEADER = :LINHASHEADER,'
      '  LINHASTRAILLER = :LINHASTRAILLER,'
      '  FLGENTSAI = :FLGENTSAI,'
      '  DIAPAGAMENTO = :DIAPAGAMENTO,'
      '  FLGMESPAGTO = :FLGMESPAGTO,'
      '  FLGGERACPAGAR = :FLGGERACPAGAR,'
      '  FLGGERACRECEBER = :FLGGERACRECEBER,'
      '  FLGDIAUTIL = :FLGDIAUTIL,'
      '  CODPORTFORMAFAV = :CODPORTFORMAFAV,'
      '  CODPORTFORMAFVREC = :CODPORTFORMAFVREC,'
      '  FLGIMPORTACAO = :FLGIMPORTACAO,'
      '  FLGTRATADUPL = :FLGTRATADUPL,'
      '  FLGIGNORADEMITIDO = :FLGIGNORADEMITIDO,'
      '  FLGCOMBENEF = :FLGCOMBENEF,'
      '  FLGCHECARUBRICA = :FLGCHECARUBRICA,'
      '  FLGELETRONICO = :FLGELETRONICO,'
      '  PLANO = :PLANO,'
      '  PLACONTABAIXA = :PLACONTABAIXA,'
      '  IDPESSOA = :IDPESSOA,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  IDREGRATXADMIN = :IDREGRATXADMIN'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    InsertSQL.Strings = (
      'insert into LAYOUTDESCONTO'
      
        '  (IDLAYOUT, DESCRICAO, COLCODIGO, TAMCODIGO, FLGMATRICULA, COLC' +
        'ODFAVORECIDO, '
      
        '   TAMCODFAVORECIDO, COLCODIGODEP, TAMCODIGODEP, FLGPOSSUIDEP, F' +
        'LGTIPOCONVENIO, '
      
        '   FLGTRATARESIDUO, FLGUSAHEADTRAI, LINHASHEADER, LINHASTRAILLER' +
        ', FLGENTSAI, '
      
        '   DIAPAGAMENTO, FLGMESPAGTO, FLGGERACPAGAR, FLGGERACRECEBER, FL' +
        'GDIAUTIL, '
      
        '   CODPORTFORMAFAV, CODPORTFORMAFVREC, FLGIMPORTACAO, FLGTRATADU' +
        'PL, FLGIGNORADEMITIDO, '
      
        '   FLGCOMBENEF, FLGCHECARUBRICA, FLGELETRONICO, PLANO, PLACONTAB' +
        'AIXA, IDPESSOA, '
      '   RECPAG, CODTIPRECDES, IDREGRATXADMIN)'
      'values'
      
        '  (:IDLAYOUT, :DESCRICAO, :COLCODIGO, :TAMCODIGO, :FLGMATRICULA,' +
        ' :COLCODFAVORECIDO, '
      
        '   :TAMCODFAVORECIDO, :COLCODIGODEP, :TAMCODIGODEP, :FLGPOSSUIDE' +
        'P, :FLGTIPOCONVENIO, '
      
        '   :FLGTRATARESIDUO, :FLGUSAHEADTRAI, :LINHASHEADER, :LINHASTRAI' +
        'LLER, :FLGENTSAI, '
      
        '   :DIAPAGAMENTO, :FLGMESPAGTO, :FLGGERACPAGAR, :FLGGERACRECEBER' +
        ', :FLGDIAUTIL, '
      
        '   :CODPORTFORMAFAV, :CODPORTFORMAFVREC, :FLGIMPORTACAO, :FLGTRA' +
        'TADUPL, '
      
        '   :FLGIGNORADEMITIDO, :FLGCOMBENEF, :FLGCHECARUBRICA, :FLGELETR' +
        'ONICO, '
      
        '   :PLANO, :PLACONTABAIXA, :IDPESSOA, :RECPAG, :CODTIPRECDES, :I' +
        'DREGRATXADMIN)')
    DeleteSQL.Strings = (
      'delete from LAYOUTDESCONTO'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    Left = 16
    Top = 96
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LAYOUTDESCONTO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'LAYOUTDESCONTO')
    CamposChave.Strings = (
      'LAYOUTDESCONTO.IDLAYOUT'
      'LAYOUTDESCONTO.DESCRICAO'
      'LAYOUTDESCONTO.COLCODIGO'
      'LAYOUTDESCONTO.TAMCODIGO'
      'LAYOUTDESCONTO.FLGMATRICULA'
      'LAYOUTDESCONTO.COLCODFAVORECIDO'
      'LAYOUTDESCONTO.TAMCODFAVORECIDO'
      'LAYOUTDESCONTO.COLCODIGODEP'
      'LAYOUTDESCONTO.TAMCODIGODEP'
      'LAYOUTDESCONTO.FLGPOSSUIDEP')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    Left = 328
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 952
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 648
    Top = 0
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    AutoRefresh = True
    SQL.Strings = (
      'SELECT'
      '  LOD.IDLAYOUT,'
      '  LOD.DESCRICAO,'
      '  LOD.COLCODIGO,'
      '  LOD.TAMCODIGO,'
      '  LOD.FLGMATRICULA,'
      '  LOD.COLCODFAVORECIDO,'
      '  LOD.TAMCODFAVORECIDO,'
      '  LOD.COLCODIGODEP,'
      '  LOD.TAMCODIGODEP,'
      '  LOD.FLGPOSSUIDEP,'
      '  LOD.FLGTIPOCONVENIO,'
      '  LOD.FLGTRATARESIDUO,'
      '  LOD.FLGUSAHEADTRAI,'
      '  LOD.LINHASHEADER,'
      '  LOD.LINHASTRAILLER,'
      '  LOD.FLGENTSAI,'
      '  LOD.DIAPAGAMENTO,'
      '  LOD.FLGMESPAGTO,'
      '  LOD.FLGGERACPAGAR,'
      '  LOD.FLGGERACRECEBER,'
      '  LOD.FLGDIAUTIL,'
      '  LOD.CODPORTFORMAFAV,'
      '  LOD.CODPORTFORMAFVREC,'
      '  LOD.FLGIMPORTACAO,'
      '  LOD.FLGTRATADUPL,'
      '  LOD.FLGIGNORADEMITIDO,'
      '  LOD.FLGCOMBENEF,'
      '  LOD.FLGCHECARUBRICA,'
      '  LOD.FLGELETRONICO,'
      ''
      '  LOD.PLANO,'
      '  LOD.PLACONTABAIXA,'
      '  LOD.IDPESSOA,'
      '  LOD.RECPAG,'
      '  LOD.CODTIPRECDES,'
      '  LOD.IDREGRATXADMIN,'
      ''
      '  REG.NOMEREGRA AS REGRA'
      ''
      'FROM'
      '  LAYOUTDESCONTO LOD,'
      '  REGRA          REG'
      ''
      'WHERE'
      '      LOD.IDLAYOUT       = :IDLAYOUT'
      '  AND LOD.IDREGRATXADMIN = REG.IDREGRA(+)')
    Left = 48
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 720
    Top = 0
  end
  object MontaSelectFavorecido: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'S'
      'S')
    Tabelas.Strings = (
      'EMPRESAFORN'
      'PESSOA')
    CamposChave.Strings = (
      'EMPRESAFORN.IDFORCLI'
      'PESSOA.RAZAOSOCIAL')
    Filtro.Strings = (
      'EMPRESAFORN.IDFORCLI = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 432
  end
  object qryDet: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterPost = qryDetAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LC.IDLAYOUT,LC.COLVALOR,LC.TAMVALOR,LC.IDRUBRICA,'
      'LC.IDFAVORECIDO,LC.PLANO,LC.PLACONTAC,LC.PLACONTAD,'
      'LC.CODCENTRORESPON,LC.UNIDNEGOC,LC.IDEMPRESA,'
      'CODCENTROCUSTO,LC.RECPAG,LC.CODTIPRECDES,LC.NUMDECIMAIS,'
      'LC.CARACDECIMAL,LC.IDRUBRICADEVOL,LC.COLPARCELAS,'
      'LC.TAMPARCELAS,LC.COLOCORRENCIAS,LC.TAMOCORRENCIAS,'
      'LC.COLRUBRICA,LC.TAMRUBRICA,LC.IDREGRA,LC.COLVALINFO,'
      'LC.TAMVALINFO,LC.CARACNATUREZA,LC.COLNATUREZA,'
      'LC.COLOPERACAO,LC.COLMESREF,LC.COLCONTROLE,'
      'LC.TAMCONTROLE,'
      'PD.DESCRPROVDESC AS DESCR_RUBRICA,'
      'PV.DESCRICAO AS RUBRICA_DEVOL,'
      'FV.NOME AS FAVORECIDO, RG.NOMEREGRA, RG.DESCRICAOREGRA'
      ''
      
        'FROM PESSOA FV, LAYOUTXCOLUNAS LC, PROVDESC PD, PROVDESC PV, REG' +
        'RA RG'
      ''
      'WHERE'
      ' LC.IDLAYOUT = 0'
      ' AND LC.IDRUBRICA = PD.IDPROVENTO'
      ' AND LC.IDRUBRICADEVOL = PV.IDPROVENTO(+)'
      ' AND LC.IDFAVORECIDO = FV.IDPESSOA'
      ' AND LC.IDREGRA = RG.IDREGRA(+)'
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
    UpdateObject = udpDet
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 136
    Top = 152
    object qryDetIDLAYOUT: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'IDLAYOUT'
    end
    object qryDetCOLVALOR: TFloatField
      DisplayLabel = '  Coluna ~ do Valor'
      DisplayWidth = 8
      FieldName = 'COLVALOR'
    end
    object qryDetTAMVALOR: TFloatField
      DisplayLabel = 'Tamanho ~ do Valor'
      DisplayWidth = 8
      FieldName = 'TAMVALOR'
    end
    object qryDetNUMDECIMAIS: TFloatField
      DisplayLabel = ' Número ~Decimais'
      DisplayWidth = 8
      FieldName = 'NUMDECIMAIS'
    end
    object qryDetCARACDECIMAL: TStringField
      DisplayLabel = 'Caracter ~Decimal'
      DisplayWidth = 1
      FieldName = 'CARACDECIMAL'
      FixedChar = True
      Size = 1
    end
    object qryDetDESCR_RUBRICA: TStringField
      DisplayLabel = 'Código/Descrição da Rubrica'
      DisplayWidth = 60
      FieldName = 'DESCR_RUBRICA'
      Size = 130
    end
    object qryDetCOLRUBRICA: TFloatField
      DisplayLabel = '  Coluna ~da Rubrica'
      DisplayWidth = 9
      FieldName = 'COLRUBRICA'
    end
    object qryDetTAMRUBRICA: TFloatField
      DisplayLabel = ' Tamanho ~da Rubrica'
      DisplayWidth = 9
      FieldName = 'TAMRUBRICA'
    end
    object qryDetCOLPARCELAS: TFloatField
      DisplayLabel = ' Coluna Nº ~de Parcelas'
      DisplayWidth = 10
      FieldName = 'COLPARCELAS'
    end
    object qryDetTAMPARCELAS: TFloatField
      DisplayLabel = 'Tamanho Nº ~de Parcelas'
      DisplayWidth = 10
      FieldName = 'TAMPARCELAS'
    end
    object qryDetCOLVALINFO: TFloatField
      DisplayLabel = 'Coluna Valor ~ Informativo'
      DisplayWidth = 10
      FieldName = 'COLVALINFO'
    end
    object qryDetTAMVALINFO: TFloatField
      DisplayLabel = 'Tamanho Valor ~  Informativo'
      DisplayWidth = 10
      FieldName = 'TAMVALINFO'
    end
    object qryDetRUBRICA_DEVOL: TStringField
      DisplayLabel = 'Rubrica de Devolução'
      DisplayWidth = 60
      FieldName = 'RUBRICA_DEVOL'
      Size = 130
    end
    object qryDetCARACNATUREZA: TStringField
      DisplayLabel = 'Caracter ~Natureza'
      DisplayWidth = 1
      FieldName = 'CARACNATUREZA'
      FixedChar = True
      Size = 1
    end
    object qryDetCOLNATUREZA: TFloatField
      DisplayLabel = 'Coluna ~Natureza'
      DisplayWidth = 8
      FieldName = 'COLNATUREZA'
    end
    object qryDetFAVORECIDO: TStringField
      DisplayLabel = ' Nome do Favorecido'
      DisplayWidth = 35
      FieldName = 'FAVORECIDO'
      Size = 60
    end
    object qryDetNOMEREGRA: TStringField
      DisplayLabel = 'Regra Associada'
      DisplayWidth = 40
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryDetDESCRICAOREGRA: TMemoField
      DisplayLabel = 'Descrição ~da Regra'
      DisplayWidth = 8
      FieldName = 'DESCRICAOREGRA'
      BlobType = ftMemo
      Size = 1
    end
    object qryDetCOLOPERACAO: TFloatField
      DisplayLabel = 'Coluna Cód. ~ Operação'
      DisplayWidth = 10
      FieldName = 'COLOPERACAO'
    end
    object qryDetCOLMESREF: TStringField
      DisplayLabel = 'Coluna Mês ~Referência'
      DisplayWidth = 7
      FieldName = 'COLMESREF'
      FixedChar = True
      Size = 7
    end
    object qryDetCOLCONTROLE: TFloatField
      DisplayLabel = 'Coluna Cód. ~ Controle'
      DisplayWidth = 10
      FieldName = 'COLCONTROLE'
    end
    object qryDetTAMCONTROLE: TFloatField
      DisplayLabel = 'Tam. Cód. ~ Controle'
      DisplayWidth = 10
      FieldName = 'TAMCONTROLE'
    end
    object qryDetIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Visible = False
    end
    object qryDetIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Visible = False
    end
    object qryDetPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryDetPLACONTAC: TStringField
      FieldName = 'PLACONTAC'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryDetPLACONTAD: TStringField
      FieldName = 'PLACONTAD'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryDetCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryDetUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryDetRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryDetIDRUBRICADEVOL: TFloatField
      FieldName = 'IDRUBRICADEVOL'
      Visible = False
    end
    object qryDetCOLOCORRENCIAS: TFloatField
      FieldName = 'COLOCORRENCIAS'
      Visible = False
    end
    object qryDetTAMOCORRENCIAS: TFloatField
      FieldName = 'TAMOCORRENCIAS'
      Visible = False
    end
    object qryDetIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Visible = False
    end
  end
  object udpDet: TUpdateSQL
    ModifySQL.Strings = (
      'update layoutxcolunas'
      'set'
      '  IDLAYOUT = :IDLAYOUT,'
      '  COLVALOR = :COLVALOR,'
      '  TAMVALOR = :TAMVALOR,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  PLANO = :PLANO,'
      '  PLACONTAC = :PLACONTAC,'
      '  PLACONTAD = :PLACONTAD,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  NUMDECIMAIS = :NUMDECIMAIS,'
      '  CARACDECIMAL = :CARACDECIMAL,'
      '  IDRUBRICADEVOL = :IDRUBRICADEVOL,'
      '  COLPARCELAS = :COLPARCELAS,'
      '  TAMPARCELAS = :TAMPARCELAS,'
      '  COLOCORRENCIAS = :COLOCORRENCIAS,'
      '  TAMOCORRENCIAS = :TAMOCORRENCIAS,'
      '  COLRUBRICA = :COLRUBRICA,'
      '  TAMRUBRICA = :TAMRUBRICA,'
      '  IDREGRA = :IDREGRA,'
      '  COLVALINFO = :COLVALINFO,'
      '  TAMVALINFO = :TAMVALINFO,'
      '  CARACNATUREZA = :CARACNATUREZA,'
      '  COLNATUREZA = :COLNATUREZA,'
      '  COLOPERACAO = :COLOPERACAO,'
      '  COLMESREF = :COLMESREF,'
      '  COLCONTROLE = :COLCONTROLE,'
      '  TAMCONTROLE = :TAMCONTROLE '
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    InsertSQL.Strings = (
      'insert into layoutxcolunas'
      '  (IDLAYOUT, COLVALOR, TAMVALOR, IDRUBRICA, IDFAVORECIDO, PLANO,'
      'PLACONTAC,'
      '   PLACONTAD, CODCENTRORESPON, UNIDNEGOC, IDEMPRESA,'
      'CODCENTROCUSTO, RECPAG,'
      '   CODTIPRECDES, NUMDECIMAIS, CARACDECIMAL, IDRUBRICADEVOL,'
      'COLPARCELAS,'
      '   TAMPARCELAS, COLOCORRENCIAS, TAMOCORRENCIAS, COLRUBRICA,'
      'TAMRUBRICA,'
      '   IDREGRA, COLVALINFO, TAMVALINFO, CARACNATUREZA, COLNATUREZA,'
      'COLOPERACAO,'
      '   COLMESREF, COLCONTROLE, TAMCONTROLE)'
      'values'
      
        '  (:IDLAYOUT, :COLVALOR, :TAMVALOR, :IDRUBRICA, :IDFAVORECIDO, :' +
        'PLANO, '
      '   :PLACONTAC, :PLACONTAD, :CODCENTRORESPON, :UNIDNEGOC, '
      ':IDEMPRESA, :CODCENTROCUSTO, '
      '   :RECPAG, :CODTIPRECDES, :NUMDECIMAIS, :CARACDECIMAL, '
      ':IDRUBRICADEVOL, '
      
        '   :COLPARCELAS, :TAMPARCELAS, :COLOCORRENCIAS, :TAMOCORRENCIAS,' +
        ' '
      ':COLRUBRICA, '
      
        '   :TAMRUBRICA, :IDREGRA, :COLVALINFO, :TAMVALINFO, :CARACNATURE' +
        'ZA, '
      ':COLNATUREZA, '
      '   :COLOPERACAO, :COLMESREF, :COLCONTROLE, :TAMCONTROLE)'
      ' ')
    DeleteSQL.Strings = (
      'delete from layoutxcolunas'
      ' where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    Left = 96
    Top = 152
  end
  object qryFavorecido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PESSOA.NOME AS pessoa,'
      '   PESSOA.RAZAOSOCIAL AS razaosocial,'
      '   EMPRESAFORN.IDFORCLI AS empresa'
      'FROM'
      '   EMPRESAFORN,'
      '   PESSOA'
      'WHERE'
      '   ( EMPRESAFORN.IDFORCLI = PESSOA.IDPESSOA ) AND'
      '   ( EMPRESAFORN.IDFORCLI = :IDFORCLI)')
    ValidateWithMask = True
    Left = 264
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
  end
  object qryRegras: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        IDREGRA,'
      '        NOMEREGRA'
      'FROM'
      '        REGRA'
      'ORDER BY UPPER(NOMEREGRA)'
      '')
    ValidateWithMask = True
    Left = 152
    Top = 88
  end
  object dsRegras: TwwDataSource
    AutoEdit = False
    DataSet = qryRegras
    Left = 152
    Top = 72
  end
  object MontaSelectRubrica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição da Rubrica')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO')
    Filtro.Strings = (
      'FLGATRASODEVOL = '#39'N'#39
      'FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 552
  end
end
