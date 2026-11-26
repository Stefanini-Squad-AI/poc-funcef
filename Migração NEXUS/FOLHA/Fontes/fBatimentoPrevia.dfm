inherited frmBatimentoPrevia: TfrmBatimentoPrevia
  Left = 17
  Top = 89
  Caption = 'Batimento de Líquido da Folha'
  ClientHeight = 472
  ClientWidth = 763
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 433
    Font.Style = []
    ParentFont = False
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 753
      Height = 423
      ActivePage = tbsAnaliseBatimento
      Align = alClient
      TabOrder = 0
      object tbsopcao: TTabSheet
        Caption = 'Opções'
        object Label3: TLabel
          Left = 257
          Top = 5
          Width = 185
          Height = 16
          Caption = '1. Batimento Prévia => Tabela: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label4: TLabel
          Left = 257
          Top = 32
          Width = 185
          Height = 16
          Caption = '2. Batimento Tabela => Prévia: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label5: TLabel
          Left = 257
          Top = 59
          Width = 149
          Height = 16
          Caption = '3. Batimento de Líquidos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label6: TLabel
          Left = 257
          Top = 87
          Width = 152
          Height = 16
          Caption = '4. Batimento de Rubricas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblArquivo: TLabel
          Left = 18
          Top = 210
          Width = 46
          Height = 16
          Caption = 'Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object SpeedButton1: TSpeedButton
          Left = 716
          Top = 2
          Width = 23
          Height = 22
          Visible = False
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 716
          Top = 29
          Width = 23
          Height = 22
          Visible = False
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 716
          Top = 56
          Width = 23
          Height = 22
          Visible = False
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 716
          Top = 84
          Width = 23
          Height = 22
          Visible = False
          OnClick = SpeedButton4Click
        end
        object lblObsBatimento: TLabel
          Left = 19
          Top = 235
          Width = 527
          Height = 13
          Caption = 
            'Os arquivos tem as colunas separadas pelo caracter TAB de forma ' +
            'a poder ser importado em Planilha Eletrônica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object spbtnArqBatimento: TSpeedButton
          Left = 328
          Top = 208
          Width = 23
          Height = 22
          Visible = False
          OnClick = spbtnArqBatimentoClick
        end
        object Label11: TLabel
          Left = 289
          Top = 90
          Width = 197
          Height = 16
          Caption = '5. Análise Individual de Rubricas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object rgOpcao: TRadioGroup
          Left = 16
          Top = 168
          Width = 165
          Height = 33
          Caption = ' Opção '
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Arquivo'
            'Tabela')
          TabOrder = 14
          OnClick = rgOpcaoClick
        end
        object pnlLblDiretorio: TPanel
          Left = 463
          Top = 3
          Width = 250
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          object lblarq1: TLabel
            Left = 4
            Top = 2
            Width = 108
            Height = 13
            Caption = 'C:\Batimento-Fase1.txt'
            Visible = False
          end
        end
        object Panel1: TPanel
          Left = 463
          Top = 30
          Width = 250
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          object lblarq2: TLabel
            Left = 4
            Top = 2
            Width = 108
            Height = 13
            Caption = 'C:\Batimento-Fase2.txt'
            Visible = False
          end
        end
        object Panel2: TPanel
          Left = 463
          Top = 57
          Width = 250
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          object lblarq3: TLabel
            Left = 4
            Top = 2
            Width = 108
            Height = 13
            Caption = 'C:\Batimento-Fase3.txt'
            Visible = False
          end
        end
        object Panel3: TPanel
          Left = 463
          Top = 85
          Width = 250
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          object lblarq4: TLabel
            Left = 4
            Top = 2
            Width = 108
            Height = 13
            Caption = 'C:\Batimento-Fase4.txt'
            Visible = False
          end
        end
        object chkItem1: TCheckBox
          Left = 232
          Top = 5
          Width = 17
          Height = 17
          Enabled = False
          TabOrder = 4
          Visible = False
        end
        object chkItem2: TCheckBox
          Left = 232
          Top = 32
          Width = 17
          Height = 17
          Enabled = False
          TabOrder = 5
          Visible = False
        end
        object chkItem3: TCheckBox
          Left = 232
          Top = 59
          Width = 17
          Height = 17
          Enabled = False
          TabOrder = 6
          Visible = False
          OnClick = chkItem3Click
        end
        object chkItem4: TCheckBox
          Left = 232
          Top = 86
          Width = 17
          Height = 17
          Enabled = False
          TabOrder = 7
          Visible = False
        end
        object GroupBox1: TGroupBox
          Left = 538
          Top = 18
          Width = 202
          Height = 182
          Caption = ' Opções '
          TabOrder = 8
          object Label2: TLabel
            Left = 16
            Top = 53
            Width = 114
            Height = 13
            Caption = 'Tabela de Comparação:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 16
            Top = 106
            Width = 161
            Height = 13
            Caption = 'Diferença Máxima R$ (com ponto)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 17
            Top = 128
            Width = 50
            Height = 13
            Caption = 'menor que'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cboxConsig: TCheckBox
            Left = 16
            Top = 24
            Width = 177
            Height = 17
            Caption = 'Ignora consignatários'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object edTabela: TEdit
            Left = 16
            Top = 73
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'TABRUBRICAS'
          end
          object eddif: TEdit
            Left = 75
            Top = 126
            Width = 42
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '0.99'
          end
        end
        object pnlArqBatimento: TPanel
          Left = 72
          Top = 208
          Width = 250
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = False
          object lblarq5: TLabel
            Left = 4
            Top = 2
            Width = 108
            Height = 13
            Caption = 'C:\Batimento-Fase5.txt'
          end
        end
        object chkItem5: TCheckBox
          Left = 264
          Top = 73
          Width = 17
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 10
          Visible = False
        end
        object chklstOrigem: TCheckListBox
          Left = 14
          Top = 37
          Width = 516
          Height = 92
          ItemHeight = 13
          TabOrder = 11
        end
        object btnMontaRubrica: TButton
          Left = 16
          Top = 140
          Width = 153
          Height = 25
          Hint = 
            'Clique aqui para montar a lista de rubricas dos lotes selecionad' +
            'os.'
          Caption = 'Identifica Rubricas dos Lotes'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnClick = btnMontaRubricaClick
        end
        object cboxEliminaTabelaBatimento: TCheckBox
          Left = 376
          Top = 134
          Width = 161
          Height = 17
          Caption = 'Elimina Tabela de Batimento'
          TabOrder = 13
          Visible = False
        end
        object pnlResultado: TPanel
          Left = 0
          Top = 257
          Width = 745
          Height = 138
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          object lblResultado: TLabel
            Left = 1
            Top = 1
            Width = 743
            Height = 136
            Align = alClient
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
        end
        object rgOrigem: TRadioGroup
          Left = 15
          Top = 0
          Width = 316
          Height = 37
          Caption = ' Selecione a Origem '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Lotes de Prévia'
            'Versões de Pagamento')
          TabOrder = 16
          OnClick = rgOrigemClick
        end
      end
      object tbsItem1: TTabSheet
        Caption = 'Batimento 1.'
        ImageIndex = 1
        TabVisible = False
        object pnlTitulo1: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 25
          Align = alTop
          Caption = '1. Prévia => Tabela'
          TabOrder = 0
        end
        object dbgItem1: TwwDBGrid
          Left = 0
          Top = 25
          Width = 745
          Height = 370
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matr.Titular'
            'MATDEP'#9'13'#9'Matr. Dep.'
            'NOME'#9'37'#9'Nome Responsável'
            'IDTITULAR'#9'10'#9'IdTitular'
            'IDRESPONSAVEL'#9'11'#9'IdResponsavel')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItem1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsItem2: TTabSheet
        Caption = 'Batimento 2.'
        ImageIndex = 2
        TabVisible = False
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 25
          Align = alTop
          Caption = '2. Prévia => Tabela'
          TabOrder = 0
        end
        object dbgItem2: TwwDBGrid
          Left = 0
          Top = 25
          Width = 745
          Height = 370
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matr. Titular'
            'MATDEP'#9'13'#9'Matr. Dep.'
            'NOME'#9'37'#9'Nome Responsável'
            'IDTITULAR'#9'10'#9'IdTitular'
            'IDRESPONSAVEL'#9'11'#9'IdResponsavel')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItem2
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsItem3: TTabSheet
        Caption = 'Batimento 3.'
        ImageIndex = 3
        TabVisible = False
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 25
          Align = alTop
          Caption = '3. Pessoas com divergência de líquido'
          TabOrder = 0
        end
        object dbgItem3: TwwDBGrid
          Left = 0
          Top = 25
          Width = 745
          Height = 370
          Selected.Strings = (
            'MATRICULA'#9'9'#9'Matr. Titular'
            'MATDEP'#9'8'#9'Matr. Dep.'
            'NOME'#9'23'#9'Nome Responsável'
            'IDTITULAR'#9'10'#9'IdTitular'
            'IDRESPONSAVEL'#9'11'#9'IdResponsavel'
            'LIQPREVIA'#9'10'#9'Líq. Previa'
            'LIQTABELA'#9'10'#9'Liq. Tabela')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItem3
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsItem4: TTabSheet
        Caption = 'Batimento 4.'
        ImageIndex = 4
        TabVisible = False
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 25
          Align = alTop
          Caption = '4. Analítico de Rubricas'
          TabOrder = 0
        end
        object pnlResultado4: TPanel
          Left = 0
          Top = 107
          Width = 745
          Height = 288
          Align = alClient
          TabOrder = 1
        end
        object Panel7: TPanel
          Left = 0
          Top = 66
          Width = 745
          Height = 41
          Align = alTop
          Caption = 'Este processo é realizado para os casos apontados no batimento 3'
          TabOrder = 2
        end
        object Panel8: TPanel
          Left = 0
          Top = 25
          Width = 745
          Height = 41
          Align = alTop
          Caption = 
            'Este processo já salva automaticamente os registros no arquivo e' +
            'specificado'
          TabOrder = 3
        end
      end
      object tbsRelacaoRubricas: TTabSheet
        Caption = 'Associação de Rubricas'
        ImageIndex = 6
        object dbgAssocRub: TwwDBGrid
          Left = 0
          Top = 35
          Width = 745
          Height = 360
          Selected.Strings = (
            'RUBLEG'#9'10'#9'Cod.'#9'F'
            'DESCRICAO'#9'46'#9'Descrição'#9'F'
            'RUBCM'#9'13'#9'Cod.Assoc.'#9'F'
            'DESCRICAO_1'#9'46'#9'Rubrica Assoc.'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAssoc
          KeyOptions = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dblcEscolheRub: TwwDBLookupCombo
          Left = 344
          Top = 104
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryEscolheRub
          LookupField = 'CODPROVDESC'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 35
          Align = alTop
          TabOrder = 2
          object bbtnAtualizaAssociacao: TBitBtn
            Left = 16
            Top = 5
            Width = 169
            Height = 25
            Caption = 'Atualiza Associação'
            TabOrder = 0
            OnClick = bbtnAtualizaAssociacaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              3333333777333777FF33339993707399933333773337F3777FF3399933000339
              9933377333777F3377F3399333707333993337733337333337FF993333333333
              399377F33333F333377F993333303333399377F33337FF333373993333707333
              333377F333777F333333993333101333333377F333777F3FFFFF993333000399
              999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
              99933773FF777F3F777F339993707399999333773F373F77777F333999999999
              3393333777333777337333333999993333333333377777333333}
            NumGlyphs = 2
          end
          object bbtnConfirmaAlteracoes: TBitBtn
            Left = 568
            Top = 5
            Width = 169
            Height = 25
            Caption = 'Confirma Alterações'
            TabOrder = 1
            OnClick = bbtnConfirmaAlteracoesClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              3333333777333777FF33339993707399933333773337F3777FF3399933000339
              9933377333777F3377F3399333707333993337733337333337FF993333333333
              399377F33333F333377F993333303333399377F33337FF333373993333707333
              333377F333777F333333993333101333333377F333777F3FFFFF993333000399
              999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
              99933773FF777F3F777F339993707399999333773F373F77777F333999999999
              3393333777333777337333333999993333333333377777333333}
            NumGlyphs = 2
          end
        end
      end
      object tbsBateRubrica: TTabSheet
        Caption = 'Batimento de Rubricas'
        ImageIndex = 5
        object lblListaRubricas: TLabel
          Left = 0
          Top = 0
          Width = 745
          Height = 19
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Rubricas existentes no lote e na tabela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object cboxRubricas: TCheckBox
          Left = 4
          Top = 2
          Width = 16
          Height = 15
          TabOrder = 0
          OnClick = cboxRubricasClick
        end
        object chklstRubricas: TCheckListBox
          Left = 0
          Top = 19
          Width = 745
          Height = 376
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbsAnaliseBatimento: TTabSheet
        Caption = 'Análise Batimento'
        ImageIndex = 7
        object lblQuantidade: TLabel
          Left = 0
          Top = 379
          Width = 745
          Height = 16
          Align = alBottom
          Alignment = taCenter
          Caption = 'Quant. Selecionada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clActiveCaption
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlOpcao: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 46
          Align = alTop
          TabOrder = 0
          object rgOpcaoBatimento: TRadioGroup
            Left = 1
            Top = 1
            Width = 145
            Height = 44
            Align = alLeft
            Caption = ' Distribuição por ... '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Rubricas'
              'Pessoas')
            TabOrder = 0
            OnClick = rgOpcaoBatimentoClick
          end
          object rgOpcaoRub: TRadioGroup
            Left = 316
            Top = 1
            Width = 210
            Height = 44
            Align = alLeft
            Caption = ' Filtro de Valor '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Valor Diverg.'
              'Apenas CM'
              'Apenas Leg.')
            TabOrder = 1
            OnClick = rgOpcaoRubClick
          end
          object Panel10: TPanel
            Left = 526
            Top = 1
            Width = 218
            Height = 44
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object btnGeraLista: TButton
              Left = 5
              Top = 7
              Width = 68
              Height = 16
              Caption = 'Gera Lista'
              TabOrder = 0
              OnClick = btnGeraListaClick
            end
            object btnImprimir: TButton
              Left = 76
              Top = 7
              Width = 68
              Height = 16
              Caption = 'Imprimir'
              TabOrder = 1
              OnClick = btnImprimirClick
            end
            object btnAplica: TButton
              Left = 147
              Top = 7
              Width = 68
              Height = 16
              Caption = 'Aplica'
              TabOrder = 2
              OnClick = btnAplicaClick
            end
            object dbnPagamentos: TDBNavigator
              Left = 0
              Top = 26
              Width = 218
              Height = 18
              DataSource = dsBatimento
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alBottom
              TabOrder = 3
            end
          end
          object rgDivergencia: TRadioGroup
            Left = 146
            Top = 1
            Width = 170
            Height = 44
            Align = alLeft
            Caption = ' Filtro de Divergência '
            Columns = 2
            ItemIndex = 2
            Items.Strings = (
              'Todas'
              'Aceitas'
              'Não Aceitas')
            TabOrder = 3
            OnClick = rgOpcaoRubClick
          end
        end
        object PageControl2: TPageControl
          Left = 0
          Top = 46
          Width = 745
          Height = 333
          ActivePage = tbsDistribuicaoRubricas
          Align = alClient
          TabOrder = 1
          OnChange = PageControl2Change
          object tbsDistribuicaoRubricas: TTabSheet
            Caption = 'Distribuição das Rubricas'
            ImageIndex = 2
            object lblFiltro: TLabel
              Left = 0
              Top = 0
              Width = 737
              Height = 16
              Align = alTop
              Alignment = taCenter
              Caption = 'Rubricas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbgFiltro: TwwDBGrid
              Left = 0
              Top = 16
              Width = 737
              Height = 289
              Selected.Strings = (
                'CODPROVDESC'#9'8'#9'Código'
                'DIVTOTAL'#9'10'#9'Div. Total'
                'ACEITOS'#9'10'#9'Div. Aceitas'
                'DESCRICAO'#9'94'#9'Rubrica')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsBatimentoLista
              KeyOptions = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object tbsOcorrencias: TTabSheet
            Caption = 'Ocorrências'
            object dbgBatimento: TwwDBGrid
              Left = 0
              Top = 0
              Width = 737
              Height = 305
              Selected.Strings = (
                'MARCA'#9'6'#9'Inverte'
                'MATTIT'#9'8'#9'Mat Tit'
                'MATDEP'#9'7'#9'Mat Dep'
                'CODPROVDESC'#9'6'#9'Código'
                'VALORCM'#9'8'#9'Valor CM'
                'VALORLEG'#9'8'#9'Valor Leg'
                'IDTITULAR'#9'7'#9'Idtitular'
                'IDPESSOA'#9'7'#9'Idpessoa'
                'NOME'#9'57'#9'Nome')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = dsBatimento
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = dbgBatimentoCalcCellColors
              IndicatorColor = icBlack
            end
          end
          object tbsRubricas: TTabSheet
            Caption = 'Rubricas'
            ImageIndex = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 221
              Width = 737
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object Label18: TLabel
              Left = 0
              Top = 224
              Width = 737
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Rubricas Legado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 0
              Top = 55
              Width = 737
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Rubricas CM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbgRubLeg: TwwDBGrid
              Left = 0
              Top = 237
              Width = 737
              Height = 68
              Selected.Strings = (
                'MES'#9'8'#9'Mês'
                'TP'#9'5'#9'Tipo'
                'CODPROVDESC'#9'9'#9'Código'
                'DESCRICAO'#9'79'#9'Descrição'
                'VALORPROVENTO'#9'12'#9'Valor')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsRubLeg
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object dbgRubCM: TwwDBGrid
              Left = 0
              Top = 68
              Width = 737
              Height = 153
              Selected.Strings = (
                'MES'#9'8'#9'Mês'
                'TP'#9'5'#9'Tipo'
                'CODPROVDESC'#9'9'#9'Código'
                'DESCRICAO'#9'79'#9'Descrição'
                'VALORPROVENTO'#9'12'#9'Valor')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              DataSource = dsRubCM
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object pnlInfo: TPanel
              Left = 0
              Top = 0
              Width = 737
              Height = 55
              Align = alTop
              TabOrder = 2
              object lblLote: TLabel
                Left = 8
                Top = 6
                Width = 31
                Height = 13
                Caption = 'lblLote'
              end
              object lblMattit: TLabel
                Left = 8
                Top = 22
                Width = 36
                Height = 13
                Caption = 'lblMattit'
              end
              object lblnomedep: TLabel
                Left = 134
                Top = 22
                Width = 54
                Height = 13
                Caption = 'lblnomedep'
              end
              object lblMatdep: TLabel
                Left = 134
                Top = 6
                Width = 46
                Height = 13
                Caption = 'lblMatdep'
              end
              object Label10: TLabel
                Left = 284
                Top = 5
                Width = 70
                Height = 13
                AutoSize = False
                Caption = 'Proventos CM:'
              end
              object Label14: TLabel
                Left = 284
                Top = 21
                Width = 72
                Height = 13
                AutoSize = False
                Caption = 'Proventos Leg:'
              end
              object lblProvCM: TLabel
                Left = 360
                Top = 5
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Provento CM:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object lblProvLeg: TLabel
                Left = 360
                Top = 21
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Provento Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label12: TLabel
                Left = 444
                Top = 5
                Width = 73
                Height = 13
                AutoSize = False
                Caption = 'Descontos CM:'
              end
              object Label15: TLabel
                Left = 444
                Top = 21
                Width = 75
                Height = 13
                AutoSize = False
                Caption = 'Descontos Leg:'
              end
              object lblDescCM: TLabel
                Left = 527
                Top = 5
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Desconto CM:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object lblDescLeg: TLabel
                Left = 527
                Top = 21
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Desconto Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label13: TLabel
                Left = 610
                Top = 5
                Width = 41
                Height = 13
                AutoSize = False
                Caption = 'Líq. CM:'
              end
              object lblLiqCM: TLabel
                Left = 659
                Top = 5
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Líquido CM:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label16: TLabel
                Left = 610
                Top = 21
                Width = 43
                Height = 13
                AutoSize = False
                Caption = 'Líq. Leg:'
              end
              object lblLiqLeg: TLabel
                Left = 659
                Top = 21
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Líquido Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label17: TLabel
                Left = 284
                Top = 38
                Width = 72
                Height = 13
                AutoSize = False
                Caption = 'Dif. Proventos:'
              end
              object lbldifprov: TLabel
                Left = 360
                Top = 38
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Provento Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label19: TLabel
                Left = 444
                Top = 38
                Width = 75
                Height = 13
                AutoSize = False
                Caption = 'Dif. Descontos:'
              end
              object lbldifdesc: TLabel
                Left = 527
                Top = 38
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Desconto Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Label21: TLabel
                Left = 610
                Top = 38
                Width = 43
                Height = 13
                AutoSize = False
                Caption = 'Dif. Líq.:'
              end
              object lbldifliq: TLabel
                Left = 659
                Top = 38
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Líquido Leg:'
                Color = clHighlightText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 447
      DockPos = 447
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 170
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 170
        Caption = '&Processar Batimento'
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 173
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 286
    Top = 384
  end
  object qryOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND FLGVOLTATMP = 0'
      'AND FLGIDATMP = 1'
      'ORDER BY IDLOTE DESC')
    ValidateWithMask = True
    Left = 629
    Top = 384
  end
  object opdir: TOpenDialog
    Left = 720
    Top = 384
  end
  object dsItem1: TwwDataSource
    DataSet = qryItem1
    Left = 58
    Top = 384
  end
  object qryItem1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.I' +
        'DTITULAR, G.IDRESPONSAVEL'
      'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL'
      '      FROM PREVIA'
      '      WHERE IDLOTE = 368) G, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'ORDER BY E.MATRICULA, MATDEP')
    ValidateWithMask = True
    Left = 126
    Top = 384
  end
  object qryItem2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.I' +
        'DTITULAR, G.IDRESPONSAVEL'
      'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL'
      '      FROM PREVIA'
      '      WHERE IDLOTE = 368) G, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'ORDER BY E.MATRICULA, MATDEP')
    ValidateWithMask = True
    Left = 103
    Top = 384
  end
  object dsItem2: TwwDataSource
    DataSet = qryItem2
    Left = 12
    Top = 384
  end
  object qryItem3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'1'#39' MATRICULA, '#39'1'#39' MATDEP, '#39'1'#39' NOME, 0 IDTITULAR, 0 IDRES' +
        'PONSAVEL,'
      '       0 LIQPREVIA, 0 LIQTABELA'
      'from dual'
      ' ')
    ValidateWithMask = True
    Left = 81
    Top = 384
  end
  object dsItem3: TwwDataSource
    DataSet = qryItem3
    Left = 35
    Top = 384
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(K.TIPO,1,'#39'PRÉVIA'#39',2,'#39'TABELA'#39') AS TIPO, K.MATRICULA' +
        ', K.MATDEP, K.NOME, K.IDTITULAR, K.IDRESPONSAVEL,'
      '       K.CODIGO, K.DESCRICAO, K.FLGDESCONTO, K.VALORPROVENTO'
      'FROM ('
      
        'SELECT 1 as TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      'FROM PREVIA G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE G.IDLOTE = 368'
      'AND G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'UNION ALL'
      
        'SELECT 2 AS TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      
        'FROM TABRUBRICAS G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSO' +
        'A P'
      'WHERE G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL) K'
      'ORDER BY K.TIPO, K.FLGDESCONTO, K.CODIGO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 651
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.I' +
        'DTITULAR, G.IDRESPONSAVEL'
      'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL'
      '      FROM PREVIA'
      '      WHERE IDLOTE = 368) G, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'ORDER BY E.MATRICULA, MATDEP')
    ValidateWithMask = True
    Left = 674
    Top = 384
  end
  object qryBateRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(K.TIPO,1,'#39'PRÉVIA'#39',2,'#39'TABELA'#39') AS TIPO, K.MATRICULA' +
        ', K.MATDEP, K.NOME, K.IDTITULAR, K.IDRESPONSAVEL,'
      '       K.CODIGO, K.DESCRICAO, K.FLGDESCONTO, K.VALORPROVENTO'
      'FROM ('
      
        'SELECT 1 as TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      'FROM PREVIA G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE G.IDLOTE = 368'
      'AND G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'UNION ALL'
      
        'SELECT 2 AS TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      
        'FROM TABRUBRICAS G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSO' +
        'A P'
      'WHERE G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL) K'
      'ORDER BY K.TIPO, K.FLGDESCONTO, K.CODIGO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 697
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryRubPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(K.TIPO,1,'#39'PRÉVIA'#39',2,'#39'TABELA'#39') AS TIPO, K.MATRICULA' +
        ', K.MATDEP, K.NOME, K.IDTITULAR, K.IDRESPONSAVEL,'
      '       K.CODIGO, K.DESCRICAO, K.FLGDESCONTO, K.VALORPROVENTO'
      'FROM ('
      
        'SELECT 1 as TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      'FROM PREVIA G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE G.IDLOTE = 368'
      'AND G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'UNION ALL'
      
        'SELECT 2 AS TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      
        'FROM TABRUBRICAS G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSO' +
        'A P'
      'WHERE G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL) K'
      'ORDER BY K.TIPO, K.FLGDESCONTO, K.CODIGO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 583
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryRubTab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(K.TIPO,1,'#39'PRÉVIA'#39',2,'#39'TABELA'#39') AS TIPO, K.MATRICULA' +
        ', K.MATDEP, K.NOME, K.IDTITULAR, K.IDRESPONSAVEL,'
      '       K.CODIGO, K.DESCRICAO, K.FLGDESCONTO, K.VALORPROVENTO'
      'FROM ('
      
        'SELECT 1 as TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      'FROM PREVIA G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSOA P'
      'WHERE G.IDLOTE = 368'
      'AND G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL'
      'UNION ALL'
      
        'SELECT 2 AS TIPO, E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G' +
        '.IDTITULAR, G.IDRESPONSAVEL,'
      '       NVL(PD.CODPROVDESC,PD.IDPROVENTO) CODIGO, '
      '       NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO,'
      '       PD.FLGDESCONTO, G.VALORPROVENTO'
      
        'FROM TABRUBRICAS G, PROVDESC PD, ELEGPATRO E, DEPENTIT DP, PESSO' +
        'A P'
      'WHERE G.IDTITULAR = :IDTITULAR'
      'AND G.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND E.IDPESSOA = G.IDTITULAR'
      'AND DP.IDTITULAR(+) = G.IDTITULAR'
      'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL'
      'AND P.IDPESSOA = G.IDRESPONSAVEL) K'
      'ORDER BY K.TIPO, K.FLGDESCONTO, K.CODIGO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 606
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object dsAssoc: TwwDataSource
    DataSet = qryAssoc
    Left = 309
    Top = 384
  end
  object qryAssoc: TwwQuery
    CachedUpdates = True
    BeforeScroll = qryAssocBeforeScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.RUBCM, P1.DESCRICAO, R.RUBLEG, P2.DESCRICAO'
      'FROM RUBRICASCMXLEGADO R, PROVDESC P1, PROVDESC P2'
      'WHERE R.RUBLEG = P1.CODPROVDESC'
      'AND R.RUBCM = P2.CODPROVDESC'
      'ORDER BY R.RUBCM ')
    UpdateObject = updAssoc
    ControlType.Strings = (
      'RUBCM;CustomEdit;dblcEscolheRub')
    ValidateWithMask = True
    Left = 355
    Top = 384
    object qryAssocRUBLEG: TStringField
      DisplayLabel = 'Cod.'
      DisplayWidth = 10
      FieldName = 'RUBLEG'
      Origin = 'BASEDADOS.RUBRICASCMXLEGADO.RUBLEG'
      ReadOnly = True
      Size = 30
    end
    object qryAssocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 46
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      ReadOnly = True
      Size = 130
    end
    object qryAssocRUBCM: TStringField
      DisplayLabel = 'Cod.Assoc.'
      DisplayWidth = 13
      FieldName = 'RUBCM'
      KeyFields = 'RUBCM'
      Origin = 'BASEDADOS.RUBRICASCMXLEGADO.RUBCM'
      Size = 30
    end
    object qryAssocDESCRICAO_1: TStringField
      DisplayLabel = 'Rubrica Assoc.'
      DisplayWidth = 46
      FieldName = 'DESCRICAO_1'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      ReadOnly = True
      Size = 130
    end
  end
  object dsEscolheRub: TwwDataSource
    DataSet = qryEscolheRub
    Left = 240
    Top = 384
  end
  object qryEscolheRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPROVDESC'
      'FROM PROVDESC'
      'WHERE FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY CODPROVDESC')
    ControlType.Strings = (
      'RUBCM;CustomEdit;')
    ValidateWithMask = True
    Left = 400
    Top = 384
  end
  object updAssoc: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICASCMXLEGADO'
      'set'
      '  RUBCM = :RUBCM'
      'where'
      '  RUBLEG = :OLD_RUBLEG')
    InsertSQL.Strings = (
      'insert into RUBRICASCMXLEGADO'
      '  (RUBCM)'
      'values'
      '  (:RUBCM)')
    DeleteSQL.Strings = (
      'delete from RUBRICASCMXLEGADO'
      'where'
      '  RUBCM = :OLD_RUBCM and'
      '  RUBLEG = :OLD_RUBLEG')
    Left = 263
    Top = 384
  end
  object dsBatimento: TwwDataSource
    DataSet = qryBatimento
    Left = 514
    Top = 384
  end
  object qryBatimento: TwwQuery
    CachedUpdates = True
    AfterScroll = qryBatimentoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 0 AS MARCA, 0 AS MARCADO, B.*, P.NOME, DV.IDTITULAR AS DV' +
        'TITULAR'
      'FROM BATIMENTOFOLHA B, PESSOA P, DIVERGENCIAFOLHA DV'
      'WHERE B.IDPESSOA = P.IDPESSOA'
      'AND NOT (B.VALORCM = 0 AND B.VALORLEG = 0)'
      'AND B.CODPROVDESC = '#39'212304'#39
      'AND B.IDTITULAR = DV.IDTITULAR(+)'
      'AND B.IDPESSOA = DV.IDPESSOA(+)'
      'AND B.CODPROVDESC = DV.CODPROVDESC(+)'
      'ORDER BY B.MATTIT, B.MATDEP'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updBatimento
    ControlType.Strings = (
      'MARCA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 537
    Top = 384
  end
  object qryBatimentoLista: TwwQuery
    AfterScroll = qryBatimentoListaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.CODPROVDESC, P.DESCRICAO, COUNT(B.IDPESSOA) AS DIVTOTAL' +
        ','
      '       SUM(DECODE(D.IDPESSOA,NULL,0,1)) AS ACEITOS'
      'FROM BATIMENTOFOLHA B, PROVDESC P, DIVERGENCIAFOLHA D'
      'WHERE B.CODPROVDESC = P.CODPROVDESC'
      'AND (B.VALORCM > 0 OR B.VALORLEG > 0)'
      'AND B.IDTITULAR = D.IDTITULAR(+)'
      'AND B.IDPESSOA = D.IDPESSOA(+)'
      'AND B.CODPROVDESC = D.CODPROVDESC(+)'
      'and 1=2'
      'GROUP BY B.CODPROVDESC, P.DESCRICAO'
      'ORDER BY B.CODPROVDESC'
      '')
    ValidateWithMask = True
    Left = 172
    Top = 384
  end
  object dsRubCM: TwwDataSource
    DataSet = qryRubCM
    Left = 149
    Top = 384
  end
  object dsRubLeg: TwwDataSource
    DataSet = qryRubLeg
    Left = 332
    Top = 384
  end
  object qryRubLeg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.DESCRICAO, P.CODPROVDESC, V.VALORPROVENTO,'
      '       DECODE(P.FLGDESCONTO,0,'#39'(+)'#39',1,'#39'(-)'#39','#39'(*)'#39') AS TP'
      'FROM TABRUBRICAS V, PROVDESC P'
      'WHERE P.IDPROVENTO = V.IDRUBRICA'
      'AND V.IDTITULAR = :IDTITULAR'
      'AND V.IDRESPONSAVEL = :IDRESPONSAVEL'
      'ORDER BY P.FLGDESCONTO, P.CODPROVDESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 195
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryRubCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.DESCRICAO, P.CODPROVDESC, V.VALORPROVENTO,'
      '       DECODE(P.FLGDESCONTO,0,'#39'(+)'#39',1,'#39'(-)'#39','#39'(*)'#39') AS TP'
      'FROM PREVIA V, PROVDESC P'
      'WHERE V.IDLOTE = 720'
      'AND P.IDPROVENTO = V.IDRUBRICA'
      'AND V.IDTITULAR = :IDTITULAR'
      'AND V.IDRESPONSAVEL = :IDRESPONSAVEL'
      'ORDER BY P.FLGDESCONTO, P.CODPROVDESC'
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 384
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object pprRelat: TppReport
    AutoStop = False
    DataPipeline = ppRelat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 492
    Top = 384
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 1058
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Num Dep IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 36513
        mmTop = 1058
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUMDEPIRRF'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 56886
        mmTop = 1058
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Isento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 66146
        mmTop = 1058
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ISENTO'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 80169
        mmTop = 1058
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'IR Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 96044
        mmTop = 1058
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IRTOTAL'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 1058
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 6085
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 16404
        mmTop = 6085
        mmWidth = 177007
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 12435
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 35454
        mmTop = 12435
        mmWidth = 21167
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 11377
        mmWidth = 198173
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Mes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 22754
        mmTop = 12435
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 58738
        mmTop = 12435
        mmWidth = 106627
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'TP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 12435
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 166688
        mmTop = 12435
        mmWidth = 16404
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 16669
        mmWidth = 198173
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDLOTE'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CODPROVDESC'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MES'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCRICAO'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58738
        mmTop = 529
        mmWidth = 106627
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 529
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'TP'
        DataPipeline = ppRelat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 529
        mmWidth = 6350
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 4498
        mmWidth = 198173
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 794
        mmWidth = 198173
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppRelat
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppRelat: TppDBPipeline
    DataSource = dsRelat
    OpenDataSource = False
    UserName = 'Relat'
    Left = 469
    Top = 384
    object ppRelatppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 0
    end
    object ppRelatppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppRelatppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppRelatppField4: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 9
      DisplayWidth = 9
      Position = 3
    end
    object ppRelatppField5: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppRelatppField6: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object ppRelatppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 6
    end
    object ppRelatppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRelatppField9: TppField
      FieldAlias = 'TP'
      FieldName = 'TP'
      FieldLength = 3
      DisplayWidth = 3
      Position = 8
    end
    object ppRelatppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDEPIRRF'
      FieldName = 'NUMDEPIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppRelatppField11: TppField
      FieldAlias = 'ISENTO'
      FieldName = 'ISENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppRelatppField12: TppField
      FieldAlias = 'IRTOTAL'
      FieldName = 'IRTOTAL'
      FieldLength = 3
      DisplayWidth = 3
      Position = 11
    end
    object ppRelatppField13: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
  end
  object qryRelat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MATRICULA, IDTITULAR, IDRESPONSAVEL, IDLOTE, CODPROVDESC,' +
        ' MES,'
      
        '       DESCRICAO, VALORPROVENTO, TP, NUMDEPIRRF, ISENTO, IRTOTAL' +
        ', NOME'
      'FROM ('
      
        'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, '#39'TOTALPREV'#39' AS' +
        ' IDLOTE, P.CODPROVDESC, V.MES,'
      '       P.FLGDESCONTO, P.DESCRICAO, V.VALORPROVENTO,'
      '       DECODE(P.FLGDESCONTO,0,'#39'(+)'#39',1,'#39'(-)'#39','#39'(*)'#39') AS TP,'
      '       NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF,'
      '       DECODE(PF.FLGISENTOIRRF,1,'#39'SIM'#39','#39'NÃO'#39') AS ISENTO,'
      
        '       DECODE(PF.FLGSOMAIRSUPINSS,1,'#39'SIM'#39','#39'NÃO'#39') AS IRTOTAL, PR.' +
        'NOME'
      
        'FROM PREVIA V, PROVDESC P, PESSOAFISICA PF, PESSOA PR, BATIMENTO' +
        'FOLHA B, DEPENTIT D'
      'WHERE V.IDLOTE IN (937, 835, 614)'
      'AND P.IDPROVENTO = V.IDRUBRICA'
      'AND V.IDTITULAR = B.IDTITULAR'
      'AND V.IDRESPONSAVEL = B.IDPESSOA'
      'AND V.IDTITULAR = D.IDTITULAR'
      'AND V.IDRESPONSAVEL = D.IDPESSOA'
      'AND B.CODPROVDESC = '#39'212804'#39
      'AND PF.IDPESSOA = V.IDRESPONSAVEL'
      'AND PR.IDPESSOA = V.IDRESPONSAVEL'
      'UNION'
      
        'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, '#39'SBE'#39' AS IDLOT' +
        'E, P.CODPROVDESC, V.MES,'
      '       P.FLGDESCONTO, P.DESCRICAO, V.VALORPROVENTO,'
      '       DECODE(P.FLGDESCONTO,0,'#39'(+)'#39',1,'#39'(-)'#39','#39'(*)'#39') AS TP,'
      '       0 AS NUMDEPIRRF, '#39#39' AS ISENTO, '#39#39' AS IRTOTAL, PR.NOME'
      
        'FROM TABRUBRICAS V, PROVDESC P, PESSOA PR, BATIMENTOFOLHA B, DEP' +
        'ENTIT D'
      'WHERE P.IDPROVENTO = V.IDRUBRICA'
      'AND V.IDTITULAR = B.IDTITULAR'
      'AND V.IDRESPONSAVEL = B.IDPESSOA'
      'AND V.IDTITULAR = D.IDTITULAR'
      'AND V.IDRESPONSAVEL = D.IDPESSOA'
      'AND B.CODPROVDESC = '#39'212804'#39
      'AND PR.IDPESSOA = V.IDRESPONSAVEL)'
      'ORDER BY MATRICULA, FLGDESCONTO, CODPROVDESC, IDLOTE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 446
    Top = 384
  end
  object dsRelat: TwwDataSource
    DataSet = qryRelat
    Left = 423
    Top = 384
  end
  object updBatimento: TUpdateSQL
    ModifySQL.Strings = (
      'update DIVERGENCIAFOLHA'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into DIVERGENCIAFOLHA'
      '  (IDTITULAR, IDPESSOA, CODPROVDESC, IDRUBRICA)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :CODPROVDESC, :IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from DIVERGENCIAFOLHA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 560
    Top = 384
  end
  object dsBatimentoLista: TwwDataSource
    DataSet = qryBatimentoLista
    Left = 218
    Top = 384
  end
end
