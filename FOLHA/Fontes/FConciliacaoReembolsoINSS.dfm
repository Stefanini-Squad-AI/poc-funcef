inherited frmConciliacaoReembolsoINSS: TfrmConciliacaoReembolsoINSS
  Left = 12
  Top = 94
  BorderStyle = bsSingle
  Caption = 'Conciliação do Reembolso do INSS'
  ClientHeight = 551
  ClientWidth = 1236
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1236
    Height = 512
    object pnPesquisa: TPanel
      Left = 1
      Top = 1
      Width = 1234
      Height = 124
      Align = alTop
      Anchors = [akBottom]
      TabOrder = 0
      object Label1: TLabel
        Left = 122
        Top = 6
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label2: TLabel
        Left = 231
        Top = 6
        Width = 92
        Height = 13
        Caption = 'N° do Benefício'
      end
      object Label11: TLabel
        Left = 5
        Top = 78
        Width = 84
        Height = 13
        AutoSize = False
        Caption = 'Período Inicial'
      end
      object Label12: TLabel
        Left = 57
        Top = 96
        Width = 6
        Height = 20
        AutoSize = False
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 178
        Top = 96
        Width = 6
        Height = 20
        AutoSize = False
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 125
        Top = 78
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'Período Final'
      end
      object Label18: TLabel
        Left = 111
        Top = 100
        Width = 8
        Height = 13
        AutoSize = False
        Caption = 'a'
      end
      object Label3: TLabel
        Left = 346
        Top = 6
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 697
        Top = 6
        Width = 152
        Height = 13
        Caption = 'Mantenedora do Benefício'
      end
      object Label7: TLabel
        Left = 231
        Top = 46
        Width = 22
        Height = 13
        AutoSize = False
        Caption = 'DIB'
      end
      object Label10: TLabel
        Left = 308
        Top = 46
        Width = 46
        Height = 13
        AutoSize = False
        Caption = 'Espécie'
      end
      object Label6: TLabel
        Left = 385
        Top = 46
        Width = 56
        Height = 13
        AutoSize = False
        Caption = 'Benefício'
      end
      object Label5: TLabel
        Left = 629
        Top = 46
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'Entidade Contábil'
      end
      object Label13: TLabel
        Left = 793
        Top = 46
        Width = 118
        Height = 13
        AutoSize = False
        Caption = 'Plano Previdenciário'
      end
      object Label19: TLabel
        Left = 947
        Top = 46
        Width = 130
        Height = 13
        AutoSize = False
        Caption = 'Perfil de Investimento'
      end
      object edtMatricula: TEdit
        Left = 121
        Top = 21
        Width = 102
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtNumBeneficio: TEdit
        Left = 231
        Top = 21
        Width = 102
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object spAno: TSpinEdit
        Left = 5
        Top = 96
        Width = 51
        Height = 22
        AutoSize = False
        MaxLength = 4
        MaxValue = 9999
        MinValue = 0
        TabOrder = 2
        Value = 1997
        OnChange = spAnoChange
        OnExit = spAnoExit
      end
      object spMes: TSpinEdit
        Left = 66
        Top = 96
        Width = 40
        Height = 22
        AutoSize = False
        MaxLength = 2
        MaxValue = 12
        MinValue = 1
        TabOrder = 3
        Value = 5
        OnChange = spAnoChange
        OnExit = spMesExit
      end
      object SpAnoFim: TSpinEdit
        Left = 125
        Top = 96
        Width = 51
        Height = 22
        AutoSize = False
        MaxLength = 4
        MaxValue = 9999
        MinValue = 0
        TabOrder = 4
        Value = 2004
        OnChange = spAnoChange
        OnExit = SpAnoFimExit
      end
      object SpMesFim: TSpinEdit
        Left = 187
        Top = 96
        Width = 40
        Height = 22
        AutoSize = False
        MaxLength = 2
        MaxValue = 12
        MinValue = 1
        TabOrder = 5
        Value = 1
        OnChange = spAnoChange
        OnExit = SpMesFimExit
      end
      object btnProcurar: TBitBtn
        Left = 4
        Top = 5
        Width = 102
        Height = 35
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = False
        OnClick = btnProcurarClick
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
      end
      object edNome: TEdit
        Left = 347
        Top = 21
        Width = 337
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object edMantenedora: TEdit
        Left = 698
        Top = 20
        Width = 248
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object edDIB: TEdit
        Left = 231
        Top = 62
        Width = 75
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
      object edEspecie: TEdit
        Left = 308
        Top = 62
        Width = 75
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 10
      end
      object edBeneficio: TEdit
        Left = 385
        Top = 62
        Width = 242
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object edEntidade: TEdit
        Left = 629
        Top = 62
        Width = 162
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 12
      end
      object EdNomePlanoPrev: TEdit
        Left = 793
        Top = 62
        Width = 152
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 13
      end
      object chkInibirPA: TCheckBox
        Left = 403
        Top = 95
        Width = 232
        Height = 17
        Caption = 'Inibir rubricas de pensão alimentícia'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 14
        OnClick = chkInibirPAClick
      end
      object chkReembolsoFundacao: TCheckBox
        Left = 666
        Top = 96
        Width = 264
        Height = 17
        Caption = 'Apenas reembolso p/ mantenedora Funcef'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 15
        OnClick = chkReembolsoFundacaoClick
      end
      object chkFiltrarRubricas: TCheckBox
        Left = 260
        Top = 95
        Width = 109
        Height = 17
        Caption = 'Filtrar Rubricas'
        TabOrder = 16
        OnClick = chkFiltrarRubricasClick
      end
      object edPerfilInvest: TEdit
        Left = 947
        Top = 62
        Width = 198
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 17
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 125
      Width = 1234
      Height = 386
      Align = alClient
      TabOrder = 1
      object pcPrincipal: TPageControl
        Left = 1
        Top = 1
        Width = 1232
        Height = 384
        ActivePage = tsRubricasDesembolso
        Align = alClient
        TabOrder = 0
        OnChange = pcPrincipalChange
        object tsGrids: TTabSheet
          Caption = 'Resultado'
          object pnGrids: TPanel
            Left = 0
            Top = 0
            Width = 1224
            Height = 356
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 179
              Width = 1224
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object pnGridSintentico: TPanel
              Left = 0
              Top = 0
              Width = 1224
              Height = 179
              Align = alTop
              TabOrder = 0
              object Panel5: TPanel
                Left = 1
                Top = 1
                Width = 1222
                Height = 25
                Align = alTop
                Caption = 'Conciliação Mensal do Reembolso do INSS'
                Color = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindow
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object Panel2: TPanel
                Left = 1
                Top = 26
                Width = 323
                Height = 152
                Align = alLeft
                BevelOuter = bvNone
                Color = clWindow
                TabOrder = 1
              end
              object Panel3: TPanel
                Left = 900
                Top = 26
                Width = 323
                Height = 152
                Align = alRight
                BevelOuter = bvNone
                Color = clWindow
                TabOrder = 2
              end
              object dbGridConsAnalitica: TwwDBGrid
                Left = 324
                Top = 26
                Width = 576
                Height = 152
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsConsAnalitica
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ReadOnly = True
                TabOrder = 3
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                IndicatorColor = icBlack
                object wwIButton1: TwwIButton
                  Left = 0
                  Top = 0
                  Width = 13
                  Height = 22
                  AllowAllUp = True
                end
              end
            end
            object pnGridsAnaliticos: TPanel
              Left = 0
              Top = 182
              Width = 1224
              Height = 174
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Splitter2: TSplitter
                Left = 590
                Top = 0
                Width = 3
                Height = 174
                Cursor = crHSplit
              end
              object pnGridDesembolso: TPanel
                Left = 0
                Top = 0
                Width = 590
                Height = 174
                Align = alLeft
                TabOrder = 0
                object Panel10: TPanel
                  Left = 1
                  Top = 1
                  Width = 588
                  Height = 25
                  Align = alTop
                  Caption = 'Desembolso Funcef'
                  Color = clNavy
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindow
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object dbGridDesembolso: TwwDBGrid
                  Left = 1
                  Top = 26
                  Width = 588
                  Height = 147
                  Selected.Strings = (
                    'MESCOMPREEM'#9'8'#9'Competência~do INSS'
                    'MESCOBRANCA'#9'7'#9'Cobrança'
                    'MES'#9'8'#9'Referência'
                    'CODPROVDESC'#9'7'#9'Rubrica~INSS'
                    'DESCRRUBRICA'#9'25'#9'Descrição da Rubrica'#9'F'
                    'SINAL'#9'4'#9'Sinal'
                    'VALORPROVENTO'#9'11'#9'Valor'
                    'NOME_ENTIDADE_CONTABIL'#9'20'#9'Entidade~Contábil'
                    'NOME_PLANO_PREVIDENCIARIO'#9'20'#9'Plano~Previdenciário')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsFolhaFuncef
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ReadOnly = True
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
                  object wwDBGrid5IButton: TwwIButton
                    Left = 0
                    Top = 0
                    Width = 13
                    Height = 22
                    AllowAllUp = True
                  end
                end
              end
              object pnGridReembolso: TPanel
                Left = 593
                Top = 0
                Width = 631
                Height = 174
                Align = alClient
                TabOrder = 1
                object Panel11: TPanel
                  Left = 1
                  Top = 1
                  Width = 629
                  Height = 24
                  Align = alTop
                  Caption = 'Reembolso INSS'
                  Color = clNavy
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindow
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object dbGridReembolso: TwwDBGrid
                  Left = 1
                  Top = 25
                  Width = 629
                  Height = 148
                  Selected.Strings = (
                    'MESCOMPREEM'#9'7'#9'Competência~do INSS'
                    'MESCOBRANCA'#9'7'#9'Cobrança'
                    'MESREFERENCIA'#9'7'#9'Referência'
                    'DESCRRUBRICA'#9'25'#9'Rubrica da Rubrica'
                    'SINAL'#9'3'#9'Sinal'
                    'VALORINSS'#9'10'#9'Valor'
                    'CODMANTENEDORA'#9'10'#9'OL Mantenedora'
                    'NOMEMANTENEDORA'#9'15'#9'Mantenedora'
                    'RMREAJ'#9'10'#9'RMREAJ'
                    'APREAJ'#9'10'#9'APREAJ'
                    'CODCONCESSORINSS'#9'10'#9'Concessor INSS'
                    'CODMANTENEDORINSS'#9'10'#9'Mantenedor INSS'
                    'CODSINONIMO'#9'10'#9'Sinonimo'
                    'DTINICIOCRED'#9'10'#9'Dt Inicio~Crédito'
                    'DTFIMCRED'#9'10'#9'Dt Fim~Crédito'
                    'NUMPROCINSS'#9'15'#9'Proc INSS'
                    'MATRICULA'#9'13'#9'Matrícula'
                    'NOMEPLANOPREV'#9'15'#9'Plano~Previdenciário'
                    'ENTIDADECONTABIL'#9'15'#9'Entidade~Contábil'
                    'ESPECIE'#9'10'#9'Espécie'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsReembolso
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ReadOnly = True
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
            end
          end
        end
        object tsRubricasDesembolso: TTabSheet
          Caption = 'Rubricas Desembolso'
          ImageIndex = 2
          object dbgrdRubricasDesembolso: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1224
            Height = 356
            Selected.Strings = (
              'PROCESSAR'#9'10'#9'Selecionar~Todos'#9'F'
              'DESCRICAO'#9'100'#9'Rubrica Desembolso'#9'F')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsRubricasDesembolso
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = dbgrdRubricasDesembolsoTitleButtonClick
            IndicatorColor = icBlack
            OnFieldChanged = dbgrdRubricasDesembolsoFieldChanged
          end
        end
        object tsRubricasReembolso: TTabSheet
          Caption = 'Rubricas Reembolso'
          ImageIndex = 2
          object dbgrdRubricasReembolso: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1224
            Height = 356
            Selected.Strings = (
              'PROCESSAR'#9'10'#9'Selecionar~Todos'#9'F'
              'DESCRICAO'#9'100'#9'Rubrica Reembolso'#9'F')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsRubricasReembolso
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = dbgrdRubricasReembolsoTitleButtonClick
            IndicatorColor = icBlack
            OnFieldChanged = dbgrdRubricasReembolsoFieldChanged
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 512
    Width = 1236
    object Label15: TLabel [0]
      Left = 5
      Top = 0
      Width = 69
      Height = 13
      Anchors = [akLeft]
      Caption = 'Desembolso'
    end
    object Label16: TLabel [1]
      Left = 173
      Top = 0
      Width = 63
      Height = 13
      Anchors = [akLeft]
      Caption = 'Reembolso'
    end
    object Label8: TLabel [2]
      Left = 343
      Top = 0
      Width = 56
      Height = 13
      Anchors = [akLeft]
      Caption = 'Diferença'
    end
    object Label9: TLabel [3]
      Left = 513
      Top = 0
      Width = 33
      Height = 13
      Anchors = [akLeft]
      Caption = 'Glosa'
    end
    inherited tb97Fundo: TToolbar97
      Left = 746
      DockPos = 784
      inherited sep1: TToolbarSep97
        Left = 484
      end
      inherited bbtnSair: TBitBtn
        Left = 403
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 0
        Visible = False
      end
      object btnImprimir: TBitBtn
        Left = 242
        Top = 0
        Width = 161
        Height = 33
        Caption = '&Imprimir Rel. Analítico'
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object btnImprimirSintetico: TBitBtn
        Left = 81
        Top = 0
        Width = 161
        Height = 33
        Caption = '&Imprimir Rel. Sintético'
        TabOrder = 3
        OnClick = btnImprimirSinteticoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    object medReembolso: TMaskEdit
      Left = 173
      Top = 14
      Width = 160
      Height = 21
      BiDiMode = bdRightToLeft
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object medDiferenca: TMaskEdit
      Left = 343
      Top = 14
      Width = 160
      Height = 21
      BiDiMode = bdRightToLeft
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object medDesembolso: TMaskEdit
      Left = 6
      Top = 13
      Width = 160
      Height = 21
      BiDiMode = bdRightToLeft
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object medGlosa: TMaskEdit
      Left = 513
      Top = 14
      Width = 160
      Height = 21
      BiDiMode = bdRightToLeft
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 843
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object MSBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'NVL(BENEFBFCIARIO.NUMPROCINSS, DETCONCINSS.NUMPROCINSS)'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número Benefício INSS'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BENEFBFCIARIO'
      'PESSOA'
      'DEPENTIT'
      'BENEFPLANPREV'
      'BENEFICIO'
      'DETCONCINSS')
    CamposChave.Strings = (
      'NVL(BENEFBFCIARIO.NUMPROCINSS, DETCONCINSS.NUMPROCINSS)'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA'
      'DEPENTIT.IDPESSOA')
    Filtro.Strings = (
      'DEPENTIT.IDPESSOA              = PESSOA.IDPESSOA(+)'
      'BENEFBFCIARIO.IDBENEFICIO      = BENEFICIO.IDBENEFICIO(+)'
      'BENEFBFCIARIO.IDBENEFICIO      = BENEFPLANPREV.IDBENEFICIO(+) '
      'BENEFBFCIARIO.IDPLANOPREV      = BENEFPLANPREV.IDPLANOPREV(+)'
      'BENEFPLANPREV.FLGREFERENCIA(+) = 1'
      'BENEFBFCIARIO.IDPESSOA(+)      = DEPENTIT.IDPESSOA'
      'BENEFBFCIARIO.IDTITULAR(+)     = DEPENTIT.IDTITULAR'
      'DETCONCINSS.IDPESSOA(+)        = DEPENTIT.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 958
    Top = 92
  end
  object dsFolhaFuncef: TwwDataSource
    DataSet = qryFolhaFuncef
    Left = 344
    Top = 400
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDPESSOA,'
      '       bf.numprocinss,'
      '       nvl(PES.NOME,bf.nome) nome,'
      '       DP.MATRICULA,'
      '       B.NOME AS NOMEBENEFICIO,'
      '       nvl(B.CODBENEFICIO,bf.especie) AS ESPECIE,'
      '       PPC.NOME AS PLANOCONTABIL,'
      '       BF.IDPLANOPREV,'
      '       nvl(bf.nomeplanoprev,PP.NOME) AS NOMEPLANOPREV,'
      '       BF.IDSITBENEFICIO,'
      '       bf.datafinal,'
      '       P.idperfilinvest ||'#39' - '#39'|| P.nome PERFINV         '
      '  FROM PLANPREV         PP,'
      '       BENEFICIO        B,'
      
        '       (SELECT b.idpessoa, b.idplanoprev, b.idsitbeneficio, b.nu' +
        'mprocinss, b.datafinal,'
      
        '               b.idbeneficio, b.idplanprevcontab, NULL nome, NUL' +
        'L especie, NULL nomeplanoprev, null perfinv'
      '        FROM benefbfciario b'
      '        WHERE b.numprocinss = :numproc  AND'
      '              b.fontepagadora = 2 AND'
      
        '              (b.idsitbeneficio = 1 OR (b.idsitbeneficio <> 1 AN' +
        'D '
      '                                        NOT EXISTS (SELECT 1'
      
        '                                                    FROM benefbf' +
        'ciario b1'
      
        '                                                    WHERE b1.num' +
        'procinss = :numproc  AND'
      
        '                                                          b1.idp' +
        'essoa = b.idpessoa AND'
      
        '                                                          b1.idt' +
        'itular = b.idtitular AND'
      
        '                                                          b1.ids' +
        'itbeneficio = 1) AND'
      
        '                                        b.datafinal = (SELECT MA' +
        'X(b1.datafinal)'
      
        '                                                       FROM bene' +
        'fbfciario b1'
      
        '                                                       WHERE b1.' +
        'numprocinss = :numproc  AND'
      
        '                                                             b1.' +
        'idpessoa = b.idpessoa AND'
      
        '                                                             b1.' +
        'idtitular = b.idtitular)))'
      '        UNION ALL'
      '        SELECT *'
      
        '        FROM (SELECT d.idpessoa, d.idplanoprev, NULL idsitbenefi' +
        'cio, d.numprocinss, NULL datafinal,'
      
        '              d.idbeneficio, d.idplanoprev idplanprevcontab, d.n' +
        'ome, d.especie, NULL nomoeplanoprev, null perfinv'
      '              FROM detconcinss d'
      '              WHERE d.numprocinss = :numproc '
      '                AND NOT EXISTS (SELECT 1'
      '                                  FROM benefbfciario b'
      '                                 WHERE b.numprocinss = :numproc '
      '                                   AND b.fontepagadora = 2'
      '                                   AND b.idpessoa = d.idpessoa)'
      '              ORDER BY d.idpessoa)'
      '        WHERE ROWNUM = 1'
      '        UNION ALL'
      '        SELECT *'
      
        '        FROM (SELECT d.idpessoa, 2 idplanoprev, NULL idsitbenefi' +
        'cio, d.numprocinss, NULL datafinal,'
      
        '                     NULL idbeneficio, 2 idplanprevcontab, d.Nom' +
        'e, d.especie, '#39'  '#39' nomeplanoprev, null perfinv'
      '              FROM tempconcinss d'
      '              WHERE d.numprocinss = :numproc '
      '                AND (NOT EXISTS (SELECT 1'
      '                                 FROM benefbfciario b'
      '                                 WHERE b.numprocinss = :numproc '
      '                                   AND b.fontepagadora = 2)'
      '                AND NOT EXISTS (SELECT 1'
      '                                 FROM detconcinss b'
      
        '                                 WHERE b.numprocinss = :numproc ' +
        '))'
      '              ORDER BY d.idpessoa)'
      '        WHERE ROWNUM = 1) BF,'
      '       (SELECT DISTINCT IDPLANOPREV, IDBENEFICIO'
      '        FROM BENEFPLANPREV'
      '        WHERE flgreferencia = 1) BPP,'
      '       PESSOA           PES,'
      '       DEPENTIT         DP,'
      '       PLANPREVCONTABIL PPC,'
      '       perfilinvest P'
      ' WHERE BF.NUMPROCINSS = :numproc '
      '   AND BF.IDPLANOPREV = P.IDPLANOPREV'
      '   AND (BF.IDSITBENEFICIO = 1 OR'
      '        BF.IDSITBENEFICIO IS NULL OR '
      '        BF.DATAFINAL = (SELECT MAX(BFC.DATAFINAL)'
      
        '                          FROM BENEFBFCIARIO BFC, BENEFPLANPREV ' +
        'BPPP'
      '                         WHERE BFC.NUMPROCINSS = :numproc '
      
        '                           AND BPPP.IDPLANOPREV = BFC.IDPLANOPRE' +
        'V'
      '                           AND BPPP.FLGREFERENCIA = 1'
      
        '                           AND BFC.IDBENEFICIO = BPPP.IDBENEFICI' +
        'O))'
      '   AND BF.IDPLANOPREV = BPP.IDPLANOPREV (+)'
      '   AND BF.IDBENEFICIO = BPP.IDBENEFICIO (+)'
      '   AND BF.IDPESSOA = PES.IDPESSOA (+)'
      '   AND BF.IDPESSOA = DP.IDPESSOA (+)'
      '   AND BF.IDBENEFICIO = B.IDBENEFICIO (+)'
      '   AND BF.IDPLANOPREV = PP.IDPLANOPREV (+)  '
      '   AND BF.IDPLANOPREV = PPC.IDPLANOPREVPREV (+)'
      '   AND BF.IDPLANPREVCONTAB = PPC.IDPLANOPREV (+)')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 224
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 264
    Top = 160
  end
  object qryMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NVL(M.CODMANTENEDORA,'#39'14'#39') AS CODMANTENEDORA,'
      '                NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA'
      'FROM DETCONCINSS D, MANTENEDORA M'
      'WHERE (D.NUMPROCINSS  = :NUMPROC) AND'
      '      (D.FLGMANUAL = 0)           AND'
      '      (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      'UNION ALL'
      'SELECT DISTINCT '#39'999'#39' AS CODMANTENEDORA,'
      '                '#39'NÃO IDENTIFICADO'#39' AS NOMEMANTENEDORA'
      'FROM TEMPCONCINSS D'
      'WHERE (D.NUMPROCINSS  = :NUMPROC) AND'
      '      (D.FLGMANUAL = 0)           '
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 264
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object dsMantenedora: TwwDataSource
    DataSet = qryMantenedora
    Left = 224
    Top = 192
  end
  object qryMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  BF.IDPESSOA, DP.MATRICULA, P.NOME'
      ''
      'FROM'
      '  BENEFBFCIARIO BF,'
      '  PESSOA        P,'
      '  DEPENTIT      DP,'
      '  BENEFPLANPREV BP,'
      '  BENEFICIO     B'
      ''
      'WHERE'
      '      BF.NUMPROCINSS      = :NUMPROC'
      '  AND BF.IDPESSOA         = P.IDPESSOA(+)'
      '  AND BF.IDBENEFICIO      = B.IDBENEFICIO(+)'
      '  AND BF.IDBENEFICIO      = BP.IDBENEFICIO(+)'
      '  AND BF.IDPLANOPREV      = BP.IDPLANOPREV(+)'
      '  AND BP.FLGREFERENCIA(+) = 1'
      '  AND BF.IDPESSOA         = DP.IDPESSOA(+)'
      '  AND BF.IDTITULAR        = DP.IDTITULAR(+)'
      ''
      'ORDER BY'
      '  BF.IDPESSOA')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 208
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptInput
      end>
  end
  object qryGlosaExtrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  SUM(DECODE(SUBSTR(RUBRICAINSS, 2, 1), 1, -D.VALORINSS, D.VALOR' +
        'INSS)) AS VLRGLOSA'
      'FROM'
      '  DETCONCINSS D'
      'WHERE'
      '      (D.NUMPROCINSS = :NUMPROC)'
      
        '  AND ((D.MESCOBRANCA >= :MESCOB)           AND (D.MESCOBRANCA <' +
        '= :MESCOBFIM))'
      ''
      '  AND ('
      '      (SUBSTR(D.RUBRICAINSS, 1, 1)  = '#39'9'#39') AND'
      '      (SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'9'#39') AND'
      '      (SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'3'#39')'
      '      )'
      ''
      '  AND ('
      '      (:PMANTENEDORAFUND = 0) OR'
      
        '      ((:PMANTENEDORAFUND = 1) AND (D.CODMANTENEDORA IS NULL OR ' +
        'D.CODMANTENEDORA IN (6, 14, 99)))'
      '      )'
      ''
      'UNION'
      ''
      'SELECT'
      
        '  SUM(DECODE(SUBSTR(CODRUBRICA1, 2, 1), 1, -D.VLRRUBRICA1, D.VLR' +
        'RUBRICA1)) AS VLRGLOSA'
      'FROM'
      '  TEMPCONCINSS D'
      'WHERE'
      '      (D.NUMPROCINSS = :NUMPROC)'
      
        '  AND ((D.MESPROCESSAMENTO >= :MESCOB)      AND (D.MESPROCESSAME' +
        'NTO <= :MESCOBFIM))'
      '  AND ('
      '      (SUBSTR(D.CODRUBRICA1, 1, 1)  = '#39'9'#39') AND'
      '      (SUBSTR(D.CODRUBRICA1, 2, 1) <> '#39'9'#39') AND'
      '      (SUBSTR(D.CODRUBRICA1, 2, 1) <> '#39'3'#39')'
      '      )')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 168
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMANTENEDORAFUND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMANTENEDORAFUND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end>
    object qryGlosaExtratoVLRGLOSA: TFloatField
      FieldName = 'VLRGLOSA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object dsGlosa: TwwDataSource
    DataSet = qryGlosaExtrato
    Left = 128
    Top = 392
  end
  object dsReembolso: TwwDataSource
    DataSet = qryReembolso
    Left = 744
    Top = 392
  end
  object qryFolhaFuncef01: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDPLANOCONTABIL'
      '  ,0 AS IDPLANOPREV'
      '  ,'#39#39' AS MES'
      '  ,'#39#39' AS MESCOBRANCA'
      '  ,0  AS IDRUBRICA'
      '  ,'#39#39' AS CODPROVDESC'
      '  ,0 AS VALORPROVENTO'
      '  ,0 AS FONTEPAGADORA'
      '  ,'#39#39' AS NUMPROCINSS'
      '  ,'#39#39' AS DATAPAGTO'
      '  ,'#39#39' AS SINAL'
      '  ,'#39#39' AS DESCRRUBRICA'
      '  ,0 AS VALOR'
      '  ,'#39#39' AS MESCOMPREEM'
      'FROM DUAL')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 440
    Top = 400
    object qryFolhaFuncef01MESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncef01CODPROVDESC: TStringField
      DisplayLabel = 'Rubrica~INSS'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryFolhaFuncef01VALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALORPROVENTO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryFolhaFuncef01SINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object qryFolhaFuncef01DESCRRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 42
      FieldName = 'DESCRRUBRICA'
      Size = 30
    end
    object qryFolhaFuncef01MES: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncef01IDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica~Planus'
      DisplayWidth = 8
      FieldName = 'IDRUBRICA'
    end
    object qryFolhaFuncef01DATAPAGTO: TStringField
      DisplayLabel = 'Data~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAPAGTO'
      Size = 10
    end
    object qryFolhaFuncef01IDPLANOCONTABIL: TFloatField
      DisplayLabel = 'Entidade~Contábil'
      DisplayWidth = 8
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryFolhaFuncef01IDPLANOPREV: TFloatField
      DisplayLabel = 'Plano~Previdenciário'
      DisplayWidth = 8
      FieldName = 'IDPLANOPREV'
    end
    object qryFolhaFuncef01MESCOMPREEM: TStringField
      DisplayLabel = 'Competência~do INSS'
      DisplayWidth = 8
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 128
    end
    object qryFolhaFuncef01NUMPROCINSS: TStringField
      DisplayLabel = 'NB'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryFolhaFuncef01FONTEPAGADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object qryFolhaFuncef01VALOR: TFloatField
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object qryFolhaFuncef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  H.IDPLANOCONTABIL,H.IDPLANOPREV,                              ' +
        '                                             '
      
        '  H.MES,H.MESCOBRANCA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVEN' +
        'TO,                                          '
      
        '  H.FONTEPAGADORA,     H.NUMPROCINSS,                           ' +
        '                                             '
      
        '  TO_CHAR(H.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39') AS DATAPAGTO,           ' +
        '                                           '
      
        '  DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL,               ' +
        '                                         '
      
        '  SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA,                     ' +
        '                                             '
      
        '  H.MESCOMPREEM, H.IDPLANOCONTABIL || '#39' - '#39' || PPC.nome AS NOME_' +
        'ENTIDADE_CONTABIL ,            '
      
        '  H.IDPLANOPREV || '#39' - '#39' || PP.nome AS NOME_PLANO_PREVIDENCIARIO' +
        ','
      
        '  DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPROVENTO)' +
        ' AS  VALOR'
      '--  TOTAL.VALOR'
      
        'FROM                                                            ' +
        '                                             '
      
        '  HISTRUBSAL H, PROVDESC P,  INFORME I, PLANPREVCONTABIL PPC, PL' +
        'ANPREV PP,                                   '
      
        '  (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA                     ' +
        '                                             '
      'WHERE                 '
      
        '  1 = 2 AND                                                     ' +
        '                                  '
      
        '  (H.IDPESSJUR = :IDPESSJUR)      AND                           ' +
        '                                             '
      '  (H.IDPESSOA  = :IDPESSOA)       AND'
      
        '  ( ( (H.NUMPROCINSS = :NUMPROCINSS) AND (H.IDMODULO=18) ) OR   ' +
        '                                             '
      
        '    ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND         ' +
        '                                             '
      
        '  (H.IDMODULO IN (18,21))            AND                        ' +
        '                                             '
      
        '  (H.IDRUBRICA = P.IDPROVENTO)       AND                        ' +
        '                                             '
      
        '  (H.IDRUBRICA <> PA.IDRUBIRRFINSS)  AND                        ' +
        '                                             '
      
        '  ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND            ' +
        '                                             '
      
        '  ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.' +
        'IDMODULO=21) AND                             '
      
        '  (P.CODFONTEPAGADORA = 2) ) )                                  ' +
        '                                             '
      
        '  AND (H.IDINFORME = I.IDINFORME(+))                            ' +
        '                                             '
      '  AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )'
      
        '  AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL)' +
        ' )                                           '
      
        '  AND ((1=:pConsideraPA) AND (H.CODPROVDESC NOT LIKE '#39'%30404'#39') A' +
        'ND (H.CODPROVDESC NOT LIKE '#39'%33404'#39') AND '
      
        '      (H.CODPROVDESC NOT LIKE '#39'%30104'#39') OR (1<>:pConsideraPA))  ' +
        '                                           '
      
        '  AND  H.MESCOMPREEM = :MESCOB                                  ' +
        '                                             '
      
        '  AND H.IDPLANOCONTABIL = PPC.IDPLANOPREV                       ' +
        '                                             '
      
        '  AND H.IDPLANOPREV = PP.IDPLANOPREV                            ' +
        '                                             '
      '  AND NVL(I.ANOVIGENCIA,'#39#39') ='
      '  ('
      '    SELECT NVL(MAX(ANOVIGENCIA),'#39#39')'
      '    FROM INFORME I2'
      '    WHERE I2.ANOVIGENCIA <= :ANOCOB'
      '      AND I2.IDINFORME = H.IDINFORME'
      '      AND I2.CODDIRF NOT IN (3, 7, 14, 16, 17)'
      '  )'
      '  ORDER BY  H.MESCOMPREEM, H.MESCOBRANCA DESC, H.MES DESC'
      '')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 376
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pConsideraPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pConsideraPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOCOB'
        ParamType = ptUnknown
      end>
    object qryFolhaFuncefMESCOMPREEM: TStringField
      DisplayLabel = 'Competência~do INSS'
      DisplayWidth = 8
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 128
    end
    object qryFolhaFuncefMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncefMES: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncefCODPROVDESC: TStringField
      DisplayLabel = 'Rubrica~INSS'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryFolhaFuncefDESCRRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 25
      FieldName = 'DESCRRUBRICA'
      Size = 30
    end
    object qryFolhaFuncefSINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object qryFolhaFuncefVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALORPROVENTO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryFolhaFuncefNOME_ENTIDADE_CONTABIL: TStringField
      DisplayLabel = 'Entidade~Contábil'
      DisplayWidth = 20
      FieldName = 'NOME_ENTIDADE_CONTABIL'
      Size = 50
    end
    object qryFolhaFuncefNOME_PLANO_PREVIDENCIARIO: TStringField
      DisplayLabel = 'Plano~Previdenciário'
      DisplayWidth = 20
      FieldName = 'NOME_PLANO_PREVIDENCIARIO'
      Size = 50
    end
    object qryFolhaFuncefIDPLANOCONTABIL: TFloatField
      DisplayLabel = 'Entidade~Contábil'
      DisplayWidth = 8
      FieldName = 'IDPLANOCONTABIL'
      Visible = False
    end
    object qryFolhaFuncefIDPLANOPREV: TFloatField
      DisplayLabel = 'Plano~Previdenciário'
      DisplayWidth = 8
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryFolhaFuncefFONTEPAGADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object qryFolhaFuncefDATAPAGTO: TStringField
      DisplayLabel = 'Data~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAPAGTO'
      Visible = False
      Size = 10
    end
    object qryFolhaFuncefIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica~Planus'
      DisplayWidth = 8
      FieldName = 'IDRUBRICA'
      Visible = False
    end
    object qryFolhaFuncefNUMPROCINSS: TStringField
      DisplayLabel = 'NB'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryFolhaFuncefVALOR: TFloatField
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object qryReembolso01: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39#39' AS MESREFERENCIA'
      ' , '#39#39' AS MESCOBRANCA'
      ' , '#39#39' AS NUMPROCINSS'
      ' , 0 AS VALORINSS'
      ' , '#39#39' AS MATRICULA'
      ' , '#39#39' AS SINAL'
      ' , '#39#39' AS ESPECIE'
      ' , 0 AS RUBRICAINSS'
      ' , '#39#39' AS DESCRRUBRICA'
      ' , 0 AS VALOR3'
      ' , 0 AS VALOR4'
      ' , 0 AS IDPLANOPREV'
      ' , '#39#39' AS ENTIDADECONTABIL'
      ' , 0 AS RMREAJ'
      ' , 0 AS APREAJ'
      ' , '#39#39' AS CODMANTENEDORA'
      ' , '#39#39' AS NOMEMANTENEDORA'
      ' , 0 AS SEQUENCIAL'
      ' , '#39#39' AS CODCONCESSORINSS'
      ' , '#39#39' AS CODMANTENEDORINSS'
      ' , 0 AS IDPLANOPREVPREV'
      ' , '#39#39' AS NOMEPLANOPREV'
      ' , 0 AS CODSINONIMO'
      ' , SYSDATE AS DTINICIOCRED'
      ' , SYSDATE AS DTFIMCRED'
      ' , '#39#39' AS MESCOMPREEM'
      'FROM DUAL ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 848
    Top = 144
    object StringField1: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 6
      FieldName = 'RUBRICAINSS'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALORINSS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object StringField2: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object StringField3: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 37
      FieldName = 'DESCRRUBRICA'
      Size = 40
    end
    object StringField4: TStringField
      DisplayLabel = 'Código~Mantenedora'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORA'
      Size = 10
    end
    object StringField5: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
      DisplayFormat = ',0.00'
    end
    object StringField6: TStringField
      DisplayLabel = 'OL Concessor'
      DisplayWidth = 11
      FieldName = 'CODCONCESSORINSS'
      Size = 10
    end
    object StringField7: TStringField
      DisplayLabel = 'OL Mantenedor'
      DisplayWidth = 13
      FieldName = 'CODMANTENEDORINSS'
      Size = 10
    end
    object StringField8: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 15
      FieldName = 'NOMEMANTENEDORA'
      Size = 60
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Código~Sinônimo'
      DisplayWidth = 10
      FieldName = 'CODSINONIMO'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Inicio~Crédito'
      DisplayWidth = 10
      FieldName = 'DTINICIOCRED'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Fim~Crédito '
      DisplayWidth = 10
      FieldName = 'DTFIMCRED'
    end
    object StringField9: TStringField
      DisplayLabel = 'Competência~do INSS'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 128
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR4'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Código~Mantenedora'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object StringField10: TStringField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 23
      FieldName = 'ENTIDADECONTABIL'
      Visible = False
      Size = 50
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Código do~Plano'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREVPREV'
      Visible = False
    end
    object StringField11: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 28
      FieldName = 'NOMEPLANOPREV'
      Visible = False
      Size = 50
    end
    object StringField12: TStringField
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object StringField13: TStringField
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Visible = False
      Size = 6
    end
    object FloatField9: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR3'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object StringField14: TStringField
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Visible = False
      Size = 13
    end
    object FloatField10: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQUENCIAL'
      Visible = False
    end
  end
  object qryReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MESCOBRANCA'
      '      ,MESREFERENCIA'
      '      ,DESCRRUBRICA'
      '      ,SINAL'
      '      ,SUM(VALOR) AS VALOR'
      '      ,VALORINSS'
      '      ,CODMANTENEDORA'
      '      ,NOMEMANTENEDORA'
      '      ,RMREAJ'
      '      ,APREAJ'
      '      ,CODCONCESSORINSS'
      '      ,CODMANTENEDORINSS'
      '      ,CODSINONIMO    '
      '      ,DTINICIOCRED'
      '      ,DTFIMCRED'
      '      ,MESCOMPREEM'
      '      ,NUMPROCINSS'
      '      ,MATRICULA'
      '      ,ESPECIE'
      '      ,RUBRICAINSS'
      '      ,IDPLANOPREV'
      '      ,ENTIDADECONTABIL'
      '      ,SEQUENCIAL'
      '      ,IDPLANOPREVPREV'
      '      ,NOMEPLANOPREV'
      'FROM '
      '('
      'SELECT D.MESCOBRANCA'
      '      ,D.MESREFERENCIA'
      '      ,P.DESCRICAO AS DESCRRUBRICA'
      '      ,DECODE(P.FLGDESCONTO, 1, '#39'(-)'#39', 0, '#39'(+)'#39', '#39'(*)'#39') AS SINAL'
      
        '      ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS ' +
        'VALOR'
      '      ,D.VALORINSS'
      '      ,D.CODMANTENEDORA'
      '      ,NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA'
      '      ,D.RMREAJ'
      '      ,D.APREAJ'
      '      ,D.CODCONCESSORINSS'
      '      ,D.CODMANTENEDORINSS'
      '      ,CODSINONIMO    '
      '      ,DTINICIOCRED'
      '      ,DTFIMCRED'
      '      ,D.MESREFERENCIA AS MESCOMPREEM'
      '      ,D.NUMPROCINSS'
      '      ,D.MATRICULA'
      '      ,D.ESPECIE'
      '      ,D.RUBRICAINSS'
      '      ,D.IDPLANOPREV'
      '      ,PL.NOME AS ENTIDADECONTABIL'
      '      ,D.SEQUENCIAL'
      '      ,D.IDPLANOPREVPREV'
      '      ,PP.NOME AS NOMEPLANOPREV'
      'FROM'
      '   DETCONCINSS      D,'
      '   PROVDESC         P,'
      '   PLANPREVCONTABIL PL,'
      '   MANTENEDORA      M,'
      '   PLANPREV         PP'
      'WHERE'
      '       (D.NUMPROCINSS = :pNUMPROCINSS)'
      '   AND ( D.MESCOBRANCA = :pMESCOBRANCA )'
      
        '   AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'3'#39') AND (SUBSTR(D.RUBRI' +
        'CAINSS, 2, 1) <> '#39'9'#39'))'
      '   AND (D.IDRUBRICA       = P.IDPROVENTO)'
      '   AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '   AND (D.IDPLANOPREV     = PL.IDPLANOPREV(+))'
      '   AND (D.FLGMANUAL      <> 4)'
      '   AND (D.FLGMANUAL      <> 1)'
      '   AND (D.FLGMANUAL      <> 2)'
      '   AND (D.CODMANTENEDORA  = M.CODMANTENEDORA(+))'
      '   '
      'UNION ALL'
      ''
      'SELECT T.MESPROCESSAMENTO AS MESCOBRANCA'
      '      ,T.MESREFERENCIA'
      '      ,P.DESCRICAO AS DESCRRUBRICA'
      '      ,DECODE(P.FLGDESCONTO, 1, '#39'(-)'#39', 0, '#39'(+)'#39', '#39'(*)'#39') AS SINAL'
      
        '      ,DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)' +
        ' AS VALOR'
      '      ,T.VLRRUBRICA1 AS VALORINSS'
      '      ,'#39'99'#39' AS CODMANTENEDORA'
      '      ,'#39'NÃO IDENTIFICADO'#39' AS NOMEMANTENEDORA'
      '      ,T.RMREAJ'
      '      ,T.APREAJ'
      '      ,T.CODCONCESSORINSS'
      '      ,T.CODMANTENEDORINSS'
      '      ,T.CODSINONIMO    '
      '      ,T.DTINICIOCRED'
      '      ,T.DTFIMCRED'
      '      ,T.MESREFERENCIA AS MESCOMPREEM'
      '      ,T.NUMPROCINSS'
      '      ,T.MATRICULA'
      '      ,T.ESPECIE'
      '      ,T.CODRUBRICA1 AS RUBRICAINSS'
      '      ,2 AS IDPLANOPREV'
      '      ,'#39'REPLAN'#39' AS ENTIDADECONTABIL'
      '      ,1 AS SEQUENCIAL'
      '      ,0 AS IDPLANOPREVPREV'
      '      ,'#39' '#39' AS NOMEPLANOPREV'
      'FROM'
      '   TEMPCONCINSS T'
      '  ,PROVDESC P'
      'WHERE'
      '       T.NUMPROCINSS = :pNUMPROCINSS'
      '   AND T.MESPROCESSAMENTO = :pMESCOBRANCA'
      '   AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC'
      '   AND T.FLGMANUAL <> 4'
      '   AND T.FLGMANUAL <> 1'
      '   AND T.FLGMANUAL <> 2'
      ')'
      'WHERE 1 = 2'
      ''
      'GROUP BY MESCOBRANCA'
      '      ,MESREFERENCIA'
      '      ,DESCRRUBRICA'
      '      ,SINAL'
      '      ,VALORINSS'
      '      ,CODMANTENEDORA'
      '      ,NOMEMANTENEDORA'
      '      ,RMREAJ'
      '      ,APREAJ'
      '      ,CODCONCESSORINSS'
      '      ,CODMANTENEDORINSS'
      '      ,CODSINONIMO'
      '      ,DTINICIOCRED'
      '      ,DTFIMCRED'
      '      ,MESCOMPREEM'
      '      ,NUMPROCINSS'
      '      ,MATRICULA'
      '      ,ESPECIE'
      '      ,RUBRICAINSS'
      '      ,IDPLANOPREV'
      '      ,ENTIDADECONTABIL'
      '      ,SEQUENCIAL'
      '      ,IDPLANOPREVPREV'
      '      ,NOMEPLANOPREV'
      ''
      ''
      'ORDER BY'
      '   MESCOBRANCA DESC'
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 779
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMESCOBRANCA'
        ParamType = ptUnknown
      end>
    object qryReembolsoMESCOMPREEM: TStringField
      DisplayLabel = 'Competência~do INSS'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object qryReembolsoMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryReembolsoMESREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryReembolsoDESCRRUBRICA: TStringField
      DisplayLabel = 'Rubrica da Rubrica'
      DisplayWidth = 25
      FieldName = 'DESCRRUBRICA'
      Size = 130
    end
    object qryReembolsoSINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 3
      FieldName = 'SINAL'
      Size = 3
    end
    object qryReembolsoVALORINSS: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORINSS'
    end
    object qryReembolsoCODMANTENEDORA: TStringField
      DisplayLabel = 'OL Mantenedora'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORA'
      Size = 10
    end
    object qryReembolsoNOMEMANTENEDORA: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 15
      FieldName = 'NOMEMANTENEDORA'
      Size = 60
    end
    object qryReembolsoRMREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
    end
    object qryReembolsoAPREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
    end
    object qryReembolsoCODCONCESSORINSS: TStringField
      DisplayLabel = 'Concessor INSS'
      DisplayWidth = 10
      FieldName = 'CODCONCESSORINSS'
      Size = 10
    end
    object qryReembolsoCODMANTENEDORINSS: TStringField
      DisplayLabel = 'Mantenedor INSS'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORINSS'
      Size = 10
    end
    object qryReembolsoCODSINONIMO: TFloatField
      DisplayLabel = 'Sinonimo'
      DisplayWidth = 10
      FieldName = 'CODSINONIMO'
    end
    object qryReembolsoDTINICIOCRED: TDateTimeField
      DisplayLabel = 'Dt Inicio~Crédito'
      DisplayWidth = 10
      FieldName = 'DTINICIOCRED'
    end
    object qryReembolsoDTFIMCRED: TDateTimeField
      DisplayLabel = 'Dt Fim~Crédito'
      DisplayWidth = 10
      FieldName = 'DTFIMCRED'
    end
    object qryReembolsoNUMPROCINSS: TStringField
      DisplayLabel = 'Proc INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryReembolsoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryReembolsoNOMEPLANOPREV: TStringField
      DisplayLabel = 'Plano~Previdenciário'
      DisplayWidth = 15
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
    object qryReembolsoENTIDADECONTABIL: TStringField
      DisplayLabel = 'Entidade~Contábil'
      DisplayWidth = 15
      FieldName = 'ENTIDADECONTABIL'
      Size = 50
    end
    object qryReembolsoESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 10
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryReembolsoIDPLANOPREV: TFloatField
      DisplayLabel = 'Entidade~Contábil'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryReembolsoIDPLANOPREVPREV: TFloatField
      DisplayLabel = 'Plano~Previdenciário'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREVPREV'
      Visible = False
    end
    object qryReembolsoRUBRICAINSS: TFloatField
      DisplayLabel = 'Rubrica~INSS'
      DisplayWidth = 10
      FieldName = 'RUBRICAINSS'
      Visible = False
    end
    object qryReembolsoSEQUENCIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQUENCIAL'
      Visible = False
    end
    object qryReembolsoVALOR: TFloatField
      FieldName = 'VALOR'
      Visible = False
    end
  end
  object qryTotReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) AS VALO' +
        'R'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P'
      'WHERE'
      '       (H.NUMPROCINSS                  =:numproc)'
      '   AND ((SUBSTR(H.RUBRICAINSS, 2, 1)  <> '#39'3'#39')'
      '   AND (SUBSTR(H.RUBRICAINSS, 2, 1)   <> '#39'9'#39'))'
      '   AND (H.IDRUBRICA                    = P.IDPROVENTO)'
      '   AND (H.FLGMANUAL                   <> 4)'
      '   AND (H.FLGMANUAL                   <> 1)'
      '   AND (H.FLGMANUAL                   <> 2)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)' +
        ') AS VALOR'
      'FROM'
      '   TEMPCONCINSS H,'
      '   PROVDESC     P,'
      '   RUBRICAXINSS R'
      'WHERE'
      '       (H.NUMPROCINSS                  =:numproc)'
      '   AND ((SUBSTR(H.CODRUBRICA1, 2, 1)  <> '#39'3'#39')'
      '   AND (SUBSTR(H.CODRUBRICA1, 2, 1)   <> '#39'9'#39'))'
      '   AND (TO_NUMBER(H.CODRUBRICA1)       = R.RUBRICAINSS(+))'
      '   AND (R.IDRUBRICA                    = P.IDPROVENTO(+))'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS' +
        ' VALOR'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P,'
      '   ('
      '   SELECT'
      
        '      DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD.SE' +
        'QUENCIAL'
      '   FROM'
      '      DETCONCINSS DD'
      '   WHERE'
      '          (DD.NUMPROCINSS                 =:numproc)'
      '      AND ((SUBSTR(DD.RUBRICAINSS, 2, 1) <> '#39'3'#39')'
      '      AND (SUBSTR(DD.RUBRICAINSS, 2, 1)  <> '#39'9'#39'))'
      '      AND (DD.FLGMANUAL                   = 3)'
      '   ) DETF3'
      'WHERE'
      '       (H.NUMPROCINSS               =:numproc)'
      '   AND (H.IDRUBRICA                 = P.IDPROVENTO)'
      '   AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '   AND (SUBSTR(H.RUBRICAINSS,2,1)  <> '#39'9'#39'))'
      '   AND (H.FLGMANUAL                 =  4 )'
      '   AND (H.NUMPROCINSS               = DETF3.NUMPROCINSS)'
      '   AND (NVL(H.CODMANTENEDORA, 14)   =:codmant )'
      '   AND (H.MESREFERENCIA             = DETF3.MESREFERENCIA)'
      '   AND (H.SEQUENCIAL + 1            = DETF3.SEQUENCIAL)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS' +
        ' VALOR'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P'
      'WHERE'
      '       (H.NUMPROCINSS   = :numproc)'
      '   AND (H.IDRUBRICA     = P.IDPROVENTO)'
      '   AND ('
      '           ((H.FLGMANUAL      = 1) OR (H.FLGMANUAL = 2))'
      
        '       AND ((H.CODMANTENEDORA IS NULL ) OR (H.CODMANTENEDORA = 1' +
        '4))'
      '       )')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 778
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codmant'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end>
    object qryTotReembolsoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsTotReembolso: TDataSource
    DataSet = qryTotReembolso
    Left = 744
    Top = 424
  end
  object qryDIB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MIN(DIB) AS DIB '
      'FROM DETCONCINSS D'
      'WHERE (D.NUMPROCINSS  = :NUMPROC)          AND'
      '           (D.DIB IS NOT NULL)                  AND'
      '           (TO_CHAR(DIB,'#39'YYYY'#39') > '#39'1970'#39')'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 264
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end>
  end
  object updExtrIndivCRI: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  DESCRRUBRICA = :DESCRRUBRICA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDPLANOCONTABIL = :IDPLANOCONTABIL,'
      '  MESCOMPREEM = :MESCOMPREEM,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  DIB = :DIB,'
      '  MANTENEDORA = :MANTENEDORA,'
      '  NB = :NB,'
      '  ESPECIE = :ESPECIE,'
      '  MATRICULA = :MATRICULA,'
      '  NOMEBENEF = :NOMEBENEF,'
      '  RUBFUNCEF = :RUBFUNCEF,'
      '  VALORFUNCEF = :VALORFUNCEF,'
      '  RUBINSS = :RUBINSS,'
      '  VALORINSS = :VALORINSS,'
      '  DIFERENCA = :DIFERENCA,'
      '  MESCOBREEMB = :MESCOBREEMB,'
      '  MESREFREEMB = :MESREFREEMB,'
      '  RMREAJ = :RMREAJ,'
      '  IDPLANOPREVREEMB = :IDPLANOPREVREEMB,'
      '  NOMEPLANOPREV = :NOMEPLANOPREV,'
      '  DESCRRUBRICAREM = :DESCRRUBRICAREM,'
      '  DTINICIOCREDREM = :DTINICIOCREDREM,'
      '  DTFIMCREDREM = :DTFIMCREDREM,'
      '  MESCOMPREEMREM = :MESCOMPREEMREM,'
      '  MESANALITICO = :MESANALITICO,'
      '  TOTALDESEMBOLSO = :TOTALDESEMBOLSO,'
      '  TOTALREEMBOLSO = :TOTALREEMBOLSO,'
      '  DIFERENCAANALITICA = :DIFERENCAANALITICA,'
      '  CONTADOR = :CONTADOR,'
      '  LINHADESEMBOLSO = :LINHADESEMBOLSO,'
      '  LINHAREEMBOLSO = :LINHAREEMBOLSO'
      'where'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  VALORPROVENTO = :OLD_VALORPROVENTO and'
      '  DESCRRUBRICA = :OLD_DESCRRUBRICA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPLANOCONTABIL = :OLD_IDPLANOCONTABIL and'
      '  MESCOMPREEM = :OLD_MESCOMPREEM and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  DIB = :OLD_DIB and'
      '  MANTENEDORA = :OLD_MANTENEDORA and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  MESCOBREEMB = :OLD_MESCOBREEMB and'
      '  MESREFREEMB = :OLD_MESREFREEMB and'
      '  RMREAJ = :OLD_RMREAJ and'
      '  IDPLANOPREVREEMB = :OLD_IDPLANOPREVREEMB and'
      '  NOMEPLANOPREV = :OLD_NOMEPLANOPREV and'
      '  DESCRRUBRICAREM = :OLD_DESCRRUBRICAREM and'
      '  DTINICIOCREDREM = :OLD_DTINICIOCREDREM and'
      '  DTFIMCREDREM = :OLD_DTFIMCREDREM and'
      '  MESCOMPREEMREM = :OLD_MESCOMPREEMREM and'
      '  MESANALITICO = :OLD_MESANALITICO and'
      '  TOTALDESEMBOLSO = :OLD_TOTALDESEMBOLSO and'
      '  TOTALREEMBOLSO = :OLD_TOTALREEMBOLSO and'
      '  DIFERENCAANALITICA = :OLD_DIFERENCAANALITICA and'
      '  CONTADOR = :OLD_CONTADOR and'
      '  LINHADESEMBOLSO = :OLD_LINHADESEMBOLSO and'
      '  LINHAREEMBOLSO = :OLD_LINHAREEMBOLSO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (MESCOBRANCA, MESREFERENCIA, CODPROVDESC, VALORPROVENTO, '
      'DESCRRUBRICA, '
      '   IDRUBRICA, IDPLANOCONTABIL, MESCOMPREEM, IDPLANOPREV, '
      'NOMEPLANO, DIB, '
      '   MANTENEDORA, NB, ESPECIE, MATRICULA, NOMEBENEF, RUBFUNCEF, '
      'VALORFUNCEF, '
      '   RUBINSS, VALORINSS, DIFERENCA, MESCOBREEMB, MESREFREEMB, '
      'RMREAJ, IDPLANOPREVREEMB, '
      '   NOMEPLANOPREV, DESCRRUBRICAREM, DTINICIOCREDREM, '
      'DTFIMCREDREM, MESCOMPREEMREM, '
      '   MESANALITICO, TOTALDESEMBOLSO, TOTALREEMBOLSO, '
      'DIFERENCAANALITICA, CONTADOR, '
      '   LINHADESEMBOLSO, LINHAREEMBOLSO)'
      'values'
      '  (:MESCOBRANCA, :MESREFERENCIA, :CODPROVDESC, :VALORPROVENTO, '
      ':DESCRRUBRICA, '
      '   :IDRUBRICA, :IDPLANOCONTABIL, :MESCOMPREEM, :IDPLANOPREV, '
      ':NOMEPLANO, '
      '   :DIB, :MANTENEDORA, :NB, :ESPECIE, :MATRICULA, :NOMEBENEF, '
      ':RUBFUNCEF, '
      
        '   :VALORFUNCEF, :RUBINSS, :VALORINSS, :DIFERENCA, :MESCOBREEMB,' +
        ' '
      ':MESREFREEMB, '
      
        '   :RMREAJ, :IDPLANOPREVREEMB, :NOMEPLANOPREV, :DESCRRUBRICAREM,' +
        ' '
      ':DTINICIOCREDREM, '
      '   :DTFIMCREDREM, :MESCOMPREEMREM, :MESANALITICO, '
      ':TOTALDESEMBOLSO, :TOTALREEMBOLSO, '
      '   :DIFERENCAANALITICA, :CONTADOR, :LINHADESEMBOLSO, '
      ':LINHAREEMBOLSO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  VALORPROVENTO = :OLD_VALORPROVENTO and'
      '  DESCRRUBRICA = :OLD_DESCRRUBRICA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPLANOCONTABIL = :OLD_IDPLANOCONTABIL and'
      '  MESCOMPREEM = :OLD_MESCOMPREEM and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  DIB = :OLD_DIB and'
      '  MANTENEDORA = :OLD_MANTENEDORA and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  MESCOBREEMB = :OLD_MESCOBREEMB and'
      '  MESREFREEMB = :OLD_MESREFREEMB and'
      '  RMREAJ = :OLD_RMREAJ and'
      '  IDPLANOPREVREEMB = :OLD_IDPLANOPREVREEMB and'
      '  NOMEPLANOPREV = :OLD_NOMEPLANOPREV and'
      '  DESCRRUBRICAREM = :OLD_DESCRRUBRICAREM and'
      '  DTINICIOCREDREM = :OLD_DTINICIOCREDREM and'
      '  DTFIMCREDREM = :OLD_DTFIMCREDREM and'
      '  MESCOMPREEMREM = :OLD_MESCOMPREEMREM and'
      '  MESANALITICO = :OLD_MESANALITICO and'
      '  TOTALDESEMBOLSO = :OLD_TOTALDESEMBOLSO and'
      '  TOTALREEMBOLSO = :OLD_TOTALREEMBOLSO and'
      '  DIFERENCAANALITICA = :OLD_DIFERENCAANALITICA and'
      '  CONTADOR = :OLD_CONTADOR and'
      '  LINHADESEMBOLSO = :OLD_LINHADESEMBOLSO and'
      '  LINHAREEMBOLSO = :OLD_LINHAREEMBOLSO')
    Left = 703
    Top = 262
  end
  object qryExtrIndivCRI: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'2004/01'#39' AS MESCOBRANCA'
      '  ,'#39'200/4/01'#39' AS MESREFERENCIA'
      '  ,'#39'9999'#39' AS CODPROVDESC'
      '  ,0 AS VALORPROVENTO'
      '  ,'#39'DESC RUBRICA                   '#39' AS DESCRRUBRICA'
      '  ,0 AS IDRUBRICA'
      '  ,0 AS IDPLANOCONTABIL'
      '  ,'#39'2004/01'#39' AS MESCOMPREEM'
      '  ,33 AS IDPLANOPREV'
      '  , '#39'REPLAN                        '#39' AS NOMEPLANO'
      '  ,TO_DATE('#39'20/01/2004'#39','#39'DD/MM/YYYY'#39') AS DIB'
      '  ,'#39'CAIXA ECONOMICA FEDERAL       '#39' AS MANTENEDORA'
      '  ,'#39'000.840.225/6'#39' AS NB'
      '  , 21 AS ESPECIE'
      '  , '#39'968.071/7'#39' AS MATRICULA'
      
        '  ,'#39'SINEIDE SANTOS DO NASCIMENTO LIMA                  '#39' AS NOME' +
        'BENEF'
      '  ,2188 AS RUBFUNCEF'
      '  ,123231.99 AS VALORFUNCEF'
      '  ,2101 AS RUBINSS'
      '  ,133400.88 AS  VALORINSS'
      '  ,65900.99 AS DIFERENCA'
      '  ,'#39'2004/01'#39' AS MESCOBREEMB'
      '  ,'#39'200/4/01'#39' AS MESREFREEMB'
      '  ,123.89 AS RMREAJ'
      '  ,33 AS IDPLANOPREVREEMB,'
      '  '#39'                              '#39' AS NOMEPLANOPREV'
      ' ,'#39'DESC RUBRICA REEMBOLSO        '#39' AS DESCRRUBRICAREM'
      ' ,SYSDATE AS DTINICIOCREDREM'
      ' ,SYSDATE AS DTFIMCREDREM'
      ' ,'#39'2004/01'#39' AS MESCOMPREEMREM'
      ' ,'#39'2004/01'#39' AS  MESANALITICO'
      ' ,133400.88 AS  TOTALDESEMBOLSO'
      ' ,133400.88 AS  TOTALREEMBOLSO'
      ' ,133400.88 AS  DIFERENCAANALITICA'
      ' ,0 AS CONTADOR'
      ' ,0 AS LINHADESEMBOLSO'
      ' ,0 AS LINHAREEMBOLSO'
      ' ,'#39'(+)'#39' AS SINALD'
      ' ,'#39'(+)'#39' AS SINALR'
      ' , '#39'001-Plano de teste Descrição   '#39' AS PERFINV'
      ''
      'FROM'
      '  DUAL'
      'WHERE'
      '  1=1'
      'ORDER BY'
      '  MESCOBRANCA,IDPLANOPREV, NB, ESPECIE'
      ''
      '')
    UpdateObject = updExtrIndivCRI
    ValidateWithMask = True
    Left = 745
    Top = 262
    object qryExtrIndivCRIMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryExtrIndivCRIMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 8
    end
    object qryExtrIndivCRIIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryExtrIndivCRINOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      FixedChar = True
      Size = 30
    end
    object qryExtrIndivCRIDIB: TDateTimeField
      FieldName = 'DIB'
    end
    object qryExtrIndivCRIMANTENEDORA: TStringField
      FieldName = 'MANTENEDORA'
      FixedChar = True
      Size = 30
    end
    object qryExtrIndivCRINB: TStringField
      FieldName = 'NB'
      FixedChar = True
      Size = 13
    end
    object qryExtrIndivCRIESPECIE: TFloatField
      FieldName = 'ESPECIE'
    end
    object qryExtrIndivCRIMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 9
    end
    object qryExtrIndivCRINOMEBENEF: TStringField
      FieldName = 'NOMEBENEF'
      FixedChar = True
      Size = 100
    end
    object qryExtrIndivCRIRUBFUNCEF: TFloatField
      FieldName = 'RUBFUNCEF'
    end
    object qryExtrIndivCRIVALORFUNCEF: TFloatField
      FieldName = 'VALORFUNCEF'
    end
    object qryExtrIndivCRIRUBINSS: TFloatField
      FieldName = 'RUBINSS'
    end
    object qryExtrIndivCRIVALORINSS: TFloatField
      FieldName = 'VALORINSS'
    end
    object qryExtrIndivCRIDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
    object qryExtrIndivCRIMESCOBREEMB: TStringField
      FieldName = 'MESCOBREEMB'
      FixedChar = True
      Size = 7
    end
    object qryExtrIndivCRIMESREFREEMB: TStringField
      FieldName = 'MESREFREEMB'
      FixedChar = True
      Size = 8
    end
    object qryExtrIndivCRIRMREAJ: TFloatField
      FieldName = 'RMREAJ'
    end
    object qryExtrIndivCRIIDPLANOPREVREEMB: TFloatField
      FieldName = 'IDPLANOPREVREEMB'
    end
    object qryExtrIndivCRINOMEPLANOPREV: TStringField
      FieldName = 'NOMEPLANOPREV'
      FixedChar = True
      Size = 30
    end
    object qryExtrIndivCRICODPROVDESC: TStringField
      DisplayWidth = 10
      FieldName = 'CODPROVDESC'
      FixedChar = True
      Size = 10
    end
    object qryExtrIndivCRIVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
    end
    object qryExtrIndivCRIDESCRRUBRICA: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRRUBRICA'
      FixedChar = True
      Size = 100
    end
    object qryExtrIndivCRIIDPLANOCONTABIL: TFloatField
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryExtrIndivCRIMESCOMPREEM: TStringField
      DisplayWidth = 8
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 8
    end
    object qryExtrIndivCRIIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryExtrIndivCRIDESCRRUBRICAREM: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRRUBRICAREM'
      FixedChar = True
      Size = 100
    end
    object qryExtrIndivCRIDTINICIOCREDREM: TDateTimeField
      FieldName = 'DTINICIOCREDREM'
    end
    object qryExtrIndivCRIDTFIMCREDREM: TDateTimeField
      FieldName = 'DTFIMCREDREM'
    end
    object qryExtrIndivCRIMESCOMPREEMREM: TStringField
      FieldName = 'MESCOMPREEMREM'
      FixedChar = True
      Size = 7
    end
    object qryExtrIndivCRIMESANALITICO: TStringField
      FieldName = 'MESANALITICO'
      FixedChar = True
      Size = 7
    end
    object qryExtrIndivCRITOTALDESEMBOLSO: TFloatField
      FieldName = 'TOTALDESEMBOLSO'
    end
    object qryExtrIndivCRITOTALREEMBOLSO: TFloatField
      FieldName = 'TOTALREEMBOLSO'
    end
    object qryExtrIndivCRIDIFERENCAANALITICA: TFloatField
      FieldName = 'DIFERENCAANALITICA'
    end
    object qryExtrIndivCRICONTADOR: TFloatField
      FieldName = 'CONTADOR'
    end
    object qryExtrIndivCRILINHADESEMBOLSO: TFloatField
      FieldName = 'LINHADESEMBOLSO'
    end
    object qryExtrIndivCRILINHAREEMBOLSO: TFloatField
      FieldName = 'LINHAREEMBOLSO'
    end
    object qryExtrIndivCRISINALD: TStringField
      FieldName = 'SINALD'
      FixedChar = True
      Size = 3
    end
    object qryExtrIndivCRISINALR: TStringField
      FieldName = 'SINALR'
      FixedChar = True
      Size = 3
    end
    object qryExtrIndivCRIPERFINV: TStringField
      DisplayWidth = 50
      FieldName = 'PERFINV'
      FixedChar = True
      Size = 50
    end
  end
  object dsExtrIndivCRI: TwwDataSource
    DataSet = qryExtrIndivCRI
    Left = 790
    Top = 260
  end
  object ppExtrIndivCRI: TppBDEPipeline
    DataSource = dsExtrIndivCRI
    UserName = 'ExtrIndivCRI'
    Left = 828
    Top = 262
    object ppExtrIndivCRIppField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField4: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField5: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField6: TppField
      FieldAlias = 'MANTENEDORA'
      FieldName = 'MANTENEDORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField7: TppField
      FieldAlias = 'NB'
      FieldName = 'NB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField8: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField9: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField10: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField11: TppField
      FieldAlias = 'RUBFUNCEF'
      FieldName = 'RUBFUNCEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField12: TppField
      FieldAlias = 'VALORFUNCEF'
      FieldName = 'VALORFUNCEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField13: TppField
      FieldAlias = 'RUBINSS'
      FieldName = 'RUBINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField14: TppField
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField15: TppField
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField16: TppField
      FieldAlias = 'MESCOBREEMB'
      FieldName = 'MESCOBREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField17: TppField
      FieldAlias = 'MESREFREEMB'
      FieldName = 'MESREFREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField18: TppField
      FieldAlias = 'RMREAJ'
      FieldName = 'RMREAJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField19: TppField
      FieldAlias = 'IDPLANOPREVREEMB'
      FieldName = 'IDPLANOPREVREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField20: TppField
      FieldAlias = 'NOMEPLANOPREV'
      FieldName = 'NOMEPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField21: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField22: TppField
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField23: TppField
      FieldAlias = 'DESCRRUBRICA'
      FieldName = 'DESCRRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField24: TppField
      FieldAlias = 'IDPLANOCONTABIL'
      FieldName = 'IDPLANOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField25: TppField
      FieldAlias = 'MESCOMPREEM'
      FieldName = 'MESCOMPREEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField26: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField27: TppField
      FieldAlias = 'DESCRRUBRICAREM'
      FieldName = 'DESCRRUBRICAREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField28: TppField
      FieldAlias = 'DTINICIOCREDREM'
      FieldName = 'DTINICIOCREDREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField29: TppField
      FieldAlias = 'DTFIMCREDREM'
      FieldName = 'DTFIMCREDREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField30: TppField
      FieldAlias = 'MESCOMPREEMREM'
      FieldName = 'MESCOMPREEMREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField31: TppField
      FieldAlias = 'MESANALITICO'
      FieldName = 'MESANALITICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField32: TppField
      FieldAlias = 'TOTALDESEMBOLSO'
      FieldName = 'TOTALDESEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField33: TppField
      FieldAlias = 'TOTALREEMBOLSO'
      FieldName = 'TOTALREEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField34: TppField
      FieldAlias = 'DIFERENCAANALITICA'
      FieldName = 'DIFERENCAANALITICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField35: TppField
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField36: TppField
      FieldAlias = 'LINHADESEMBOLSO'
      FieldName = 'LINHADESEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField37: TppField
      FieldAlias = 'LINHAREEMBOLSO'
      FieldName = 'LINHAREEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField38: TppField
      FieldAlias = 'SINALD'
      FieldName = 'SINALD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRIppField39: TppField
      FieldAlias = 'SINALR'
      FieldName = 'SINALR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
  end
  object pprExtrIndivCRI: TppReport
    AutoStop = False
    DataPipeline = ppExtrIndivCRI
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 868
    Top = 261
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtrIndivCRI'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 63500
      mmPrintPosition = 0
      object ppDBText305: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19981
        BandType = 0
      end
      object ppDBText307: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText309: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9398
        BandType = 0
      end
      object ppDBText347: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 7832
        BandType = 0
      end
      object ppDBText348: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3768
        BandType = 0
      end
      object ppDBText349: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 9313
        BandType = 0
      end
      object ppDBText350: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 7832
        BandType = 0
      end
      object ppLabel282: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText351: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 10964
        BandType = 0
      end
      object ppLabel283: TppLabel
        UserName = 'Label65'
        Caption = 'Conciliação do Reembolso do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 95250
        mmTop = 26458
        mmWidth = 71702
        BandType = 0
      end
      object ppLine88: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 33338
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel320: TppLabel
        UserName = 'Label235'
        Caption = 'Núm. Benefício :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 40481
        mmWidth = 27771
        BandType = 0
      end
      object ppLabel322: TppLabel
        UserName = 'Label236'
        Caption = 'Espécie :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 45244
        mmWidth = 15409
        BandType = 0
      end
      object ppLabel323: TppLabel
        UserName = 'Label243'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 59267
        mmTop = 40481
        mmWidth = 17653
        BandType = 0
      end
      object ppLabel381: TppLabel
        UserName = 'Label242'
        Caption = 'Nome do Beneficiário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 35190
        mmWidth = 38312
        BandType = 0
      end
      object ppDBText352: TppDBText
        UserName = 'DBText242'
        DataField = 'NB'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 40481
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText353: TppDBText
        UserName = 'DBText244'
        DataField = 'MATRICULA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 40481
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText354: TppDBText
        UserName = 'DBText243'
        DataField = 'ESPECIE'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 45244
        mmWidth = 6085
        BandType = 0
      end
      object ppDBText355: TppDBText
        UserName = 'DBText245'
        DataField = 'NOMEBENEF'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 41010
        mmTop = 35190
        mmWidth = 152400
        BandType = 0
      end
      object ppLabel388: TppLabel
        UserName = 'Label245'
        Caption = 'Entidade Contábil :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 142082
        mmTop = 40480
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText356: TppDBText
        UserName = 'DBText273'
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 40480
        mmWidth = 57415
        BandType = 0
      end
      object ppLine96: TppLine
        UserName = 'Line80'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 49477
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel395: TppLabel
        UserName = 'Label263'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 45245
        mmWidth = 37835
        BandType = 0
      end
      object ppDBText357: TppDBText
        UserName = 'DBText277'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 45245
        mmWidth = 57415
        BandType = 0
      end
      object ppShape33: TppShape
        UserName = 'Shape20'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 2117
        mmTop = 50536
        mmWidth = 281253
        BandType = 0
      end
      object ppLabel382: TppLabel
        UserName = 'Label240'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2921
        mmLeft = 15346
        mmTop = 55563
        mmWidth = 12488
        BandType = 0
      end
      object ppLabel386: TppLabel
        UserName = 'Label232'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 2117
        mmTop = 55563
        mmWidth = 11261
        BandType = 0
      end
      object ppLabel387: TppLabel
        UserName = 'Label233'
        Caption = 'Rubrica INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 63500
        mmTop = 55563
        mmWidth = 9102
        BandType = 0
      end
      object ppLabel389: TppLabel
        UserName = 'Label257'
        Caption = 'Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 59531
        mmTop = 51065
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel390: TppLabel
        UserName = 'Label258'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 131234
        mmTop = 55563
        mmWidth = 11261
        BandType = 0
      end
      object ppLabel394: TppLabel
        UserName = 'Label262'
        Caption = 'Reembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 187590
        mmTop = 51065
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel405: TppLabel
        UserName = 'Label405'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 121179
        mmTop = 55563
        mmWidth = 6011
        BandType = 0
      end
      object ppLabel406: TppLabel
        UserName = 'Label406'
        Caption = 'Descrição Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 76465
        mmTop = 55563
        mmWidth = 12361
        BandType = 0
      end
      object ppLabel407: TppLabel
        UserName = 'Label407'
        Caption = 'Entidade Contabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 50006
        mmTop = 55563
        mmWidth = 10287
        BandType = 0
      end
      object ppLabel408: TppLabel
        UserName = 'Label408'
        Caption = 'Competência do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 29898
        mmTop = 55563
        mmWidth = 15325
        BandType = 0
      end
      object ppLabel385: TppLabel
        UserName = 'Label385'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 253207
        mmTop = 55563
        mmWidth = 6011
        BandType = 0
      end
      object ppLabel391: TppLabel
        UserName = 'Label391'
        Caption = 'Descrição Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 206905
        mmTop = 55563
        mmWidth = 21463
        BandType = 0
      end
      object ppLabel392: TppLabel
        UserName = 'Label2401'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2921
        mmLeft = 144992
        mmTop = 55563
        mmWidth = 12488
        BandType = 0
      end
      object ppLabel393: TppLabel
        UserName = 'Label393'
        Caption = 'Inicio Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 175155
        mmTop = 55563
        mmWidth = 8551
        BandType = 0
      end
      object ppLabel409: TppLabel
        UserName = 'Label409'
        Caption = 'Fim Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 190500
        mmTop = 55563
        mmWidth = 8551
        BandType = 0
      end
      object ppLabel410: TppLabel
        UserName = 'Label410'
        Caption = 'Referência Reembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5842
        mmLeft = 158486
        mmTop = 55563
        mmWidth = 13166
        BandType = 0
      end
      object ppLine89: TppLine
        UserName = 'Line89'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13758
        mmLeft = 130175
        mmTop = 50536
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 266171
        mmTop = 51065
        mmWidth = 14520
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 14288
        mmLeft = 263261
        mmTop = 50536
        mmWidth = 1588
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 63236
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label2'
        Caption = 'Sinal(+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 110861
        mmTop = 55563
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label3'
        Caption = 'Sinal(+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 242888
        mmTop = 55563
        mmWidth = 8996
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170B6960000424DB69600000000000036000000280000007200
          000070000000010018000000000080960000C30E0000C30E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE3E3430000
          5200004F0000600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEADCDCF3EBEB9D5D5D4B000052000052000052000052
          00004E0000771D1DF6F1F1EBDEDEE9DBDBFFFFFFFFFFFFFFFFFF5E0000500000
          5200005200004E0000721414FFFFFFFFFFFFFFFFFFEEE3E3AD77774A00005200
          00520000470000BF9494FFFFFFFDFCFCE8DADAF7F3F36907074F000052000052
          0000520000520000520000470000CEAFAFEEE2E2F1E8E8FFFFFFFFFFFFF3EDED
          4200005200005200005200005200005200005200005200005200005200005200
          004D00007D2727FFFFFFFFFFFF5700005000005200005100004E0000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006300007012
          12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF5500005500005E0000660000660000660000660000660000660000610000
          560000550000520000FFFFFFFFFFFFFFFFFF6E0D0D6300006600006600006100
          00812C2CFFFFFFFFFFFFFFFFFF4400005D00006600006600006600005A0000C7
          A0A0FFFFFFE9DBDB470000560000620000660000660000660000660000660000
          6600006600005A00004F0000904646FFFFFFFFFFFFF6F1F15500006600006600
          006600006600006600006600006600006600006600006600006000008B3D3DFF
          FFFFFFFFFF680404630000660000640000600000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E9560000660000630000701212FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF630000640000
          6600006600005800005600005600005600005800006600006600006400006000
          00FFFFFFFFFFFFFFFFFF6E0D0D630000660000660000610000812C2CFFFFFFFF
          FFFFAD77775C00006600006600006600006600005A0000C7A0A0FFFFFFF8F4F4
          5600006600006600006300005600005600005600005600005C00006600006600
          00630000711313D9C1C1FFFFFFF6F1F15500006600006600006600006600005E
          0000560000560000560000560000560000510000802B2BFFFFFFFFFFFF680404
          630000660000640000600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E9560000660000630000711313FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF630000640000660000580000EBDD
          DDEDE1E1EBDFDFEDE1E1EDE0E0580000660000640000600000FFFFFFFFFFFFFF
          FFFF6E0D0D630000660000660000610000812C2CFFFFFFFFFFFF6D0C0C620000
          6600006600006600006600005A0000C7A0A0FFFFFF6804046200006600006300
          00741919F8F3F3EBDFDFEBDFDFF1E8E8BE94945C0000660000660000580000B8
          8989FFFFFFF6F1F15500006600006600006600005E0000AC7575F3EBEBEBDFDF
          EBDFDFEBDFDFEBDFDFEADDDDEFE5E5FFFFFFFFFFFF6804046300006600006400
          00600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          660000630000701111F8F4F4EBDFDFEBDFDFEBDFDFEBDFDFE9DADAFBF9F9FFFF
          FFFFFFFFF4EEEEF8F3F3640000640000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000640000610000FDFCFCFFFFFFFFFFFF6E0D0D630000
          660000660000610000822F2FFFFFFFF6F0F07214146300006600006600006600
          006600005A0000C7A0A0FFFFFF4F0000660000660000620000761C1CFFFFFFFF
          FFFFFFFFFFFFFFFFCEAEAE5900006600006600005B0000BB8F8FFFFFFFF6F1F1
          5500006600006600006600005C0000B88989FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF680404630000660000640000620000FAF6F6EB
          DFDFEBDFDFEBDFDFEADCDCF4ECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006600006300
          00560000560000560000560000560000480000DAC3C3FFFFFFFFFFFFA66B6B4D
          0000640000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          6600006600005F00007A2222FFFFFFFFFFFF6E0D0D6300006600006600006100
          008C3E3ECCACAC4B00006300006600006600006600006600006600005A0000C7
          A0A0FFFFFF520000660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFF
          C7A3A34E00005A00005A0000500000B68686FFFFFFF6F1F15500006600006600
          006600005C0000BC9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF680404630000660000660000640000560000560000560000560000
          4E0000A06161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E956000066000066000066000066000066000066
          0000660000660000580000DEC9C9FFFFFFFFFFFFAE78785C0000660000660000
          660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5400006600006600006000
          00863535FFFFFFFFFFFF6E0D0D6300006600006600006400007315158D414161
          00006500005600005D00006600006600006600005A0000C7A0A0FFFFFF520000
          660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFFECDFDFC09797C59F
          9FC59F9FC19898E5D5D5FFFFFFF6F1F155000066000066000066000061000084
          3232A365659F5F5F9F5F5F9F5F5F954E4EFEFEFEFFFFFFFFFFFFFFFFFF680404
          6300006600006600006600006600006600006600006600005D0000A96F6FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E9560000660000660000650000620000620000620000620000620000
          540000DDC8C8FFFFFFFFFFFFAE78785C0000660000660000660000540000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF540000660000660000600000863535FFFFFFFF
          FFFF6E0D0D6300006600006600006600006400006100006500005B0000FFFFFF
          B584845D00006600006600005A0000C7A0A0FFFFFF5200006600006600006200
          00751A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F1F15500006600006600006600006600006100005E00005E0000
          5E00005E00004D0000FEFEFEFFFFFFFFFFFFFFFFFF6804046300006600006600
          00650000620000620000620000620000590000A76C6CFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          6600006500006600007C2525791F1F791F1F791F1F791F1F6D0D0DE2CFCFFFFF
          FFFFFFFFAE78785C0000660000660000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000660000600000863535FFFFFFFFFFFF6E0D0D630000
          660000660000660000660000660000650000510000FFFFFFC39B9B5B00006600
          006600005A0000C7A0A0FFFFFF520000660000660000620000751A1AFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F1F1
          5500006600006600006600006600006200005E00005E00005E00005E00004D00
          00FEFEFEFFFFFFFFFFFFFFFFFF6804046300006600006500006400007C252579
          1F1F791F1F791F1F721414B38181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006300007316
          16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE78785C
          0000660000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          660000660000600000863535FFFFFFFFFFFF6E0D0D6300006600006600006600
          006600006600005F0000924A4AFFFFFFC097975B00006600006600005A0000C7
          A0A0FFFFFF520000660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFF
          ECDFDFC09797C59F9FC59F9FC19898E5D5D5FFFFFFF6F1F15500006600006600
          00660000620000843232A365659F5F5F9F5F5F9F5F5F954E4EFEFEFEFFFFFFFF
          FFFFFFFFFF680404630000660000640000610000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E9560000660000630000731616FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE78785C0000660000660000
          660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5400006600006600006000
          00863535FFFFFFFFFFFF6E0D0D6300006600006600006600006600005F000046
          0000F8F4F4FFFFFFC097975B00006600006600005A0000C7A0A0FFFFFF460000
          660000660000620000781F1FFFFFFFFFFFFFFFFFFFFFFFFFD1B3B34E00005A00
          005A00004A0000AF7A7AFFFFFFF6F1F15500006600006600006600005C0000C4
          9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF680404
          630000660000640000610000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E95600006600006500006600007C2525791F1F791F1F791F1F791F1F
          791F1F6A0808FFFFFFFFFFFFAE78785C0000660000660000660000540000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF540000660000660000600000863535FFFFFFFF
          FFFF6E0D0D6300006600006600006600005A0000934B4BF1E8E8FEFDFDFFFFFF
          C097975B00006600006600005A0000C7A0A0FFFFFFD3B6B64600005E00006500
          006701017C2525791F1F791F1F7A22227315156300006600006000008E4343FF
          FFFFFFFFFFF6F1F15500006600006600006600006300007010107A2222791F1F
          791F1F791F1F791F1F7418189A5757FFFFFFFFFFFF6804046300006600006500
          006400007C2525791F1F791F1F791F1F791F1F791F1F781E1E701212FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          660000660000650000620000620000620000620000620000620000500000FFFF
          FFFFFFFFAE78785C0000660000660000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000660000600000863535FFFFFFFFFFFF6E0D0D630000
          660000660000610000853434FFFFFFFFFFFFFFFFFFFFFFFFC097975B00006600
          006600005A0000C7A0A0FFFFFFFFFFFFFFFFFFA367675C000065000062000062
          0000620000620000630000660000660000570000924A4AFFFFFFFFFFFFF6F1F1
          5500006600006600006600006600006300006200006200006200006200006200
          005C0000883939FFFFFFFFFFFF68040463000066000066000065000062000062
          0000620000620000620000620000610000560000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006600006600
          00660000660000660000660000660000660000540000FFFFFFFFFFFFAE78785C
          0000660000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          660000660000600000863535FFFFFFFFFFFF6E0D0D6300006600006600006100
          00812C2CFFFFFFFFFFFFFFFFFFFFFFFFC097975B00006600006600005A0000C7
          A0A0FFFFFFFFFFFFFFFFFFC9A7A7680505640000660000660000660000660000
          6600006600005E0000A06060BE9292FFFFFFFFFFFFF6F1F15500006600006600
          006600006600006600006600006600006600006600006600006000008B3D3DFF
          FFFFFFFFFF680404630000660000660000660000660000660000660000660000
          6600006600006500005A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFE4E446000056000056000056000056000056000056
          0000560000560000560000440000FFFFFFFFFFFFA66B6B4D0000560000560000
          560000450000FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF4500005600005600005100
          007A2222FFFFFFFFFFFF610000530000560000560000520000751818FFFFFFFF
          FFFFFFFFFFFFFFFFBA8D8D4B00005600005600004B0000C19696FFFFFFFFFFFF
          FFFFFFFFFFFF7113135200005C00006600006600005700005600005600004400
          00FFFFFFFFFFFFFFFFFFFFFFFFF4EEEE46000056000056000056000056000056
          0000560000560000560000560000560000510000802B2BFFFFFFFFFFFF5A0000
          5400005600005600005600005600005600005600005600005600005600005500
          004B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFDE8D9D9EBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDF
          EBDFDFE8D9D9FFFFFFFFFFFFF4EEEEEADCDCEBDFDFEBDFDFEBDFDFE8D9D9FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE8D9D9EBDFDFEBDFDFEADDDDEFE4E4FFFFFFFF
          FFFFEBDFDFEBDEDEEBDFDFEBDFDFEADDDDEEE3E3FFFFFFFFFFFFFFFFFFFFFFFF
          F7F2F2E9DBDBEBDFDFEBDFDFE9DBDBF8F3F3FFFFFFFFFFFFFFFFFFFFFFFFEDE2
          E2F0E7E7B58484490000430000F6F0F0ECDFDFEBDFDFE8D8D8FFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFFE8D9D9EBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDF
          EBDFDFEBDFDFEBDFDFEADDDDEFE5E5FFFFFFFFFFFFEBDDDDEBDEDEEBDFDFEBDF
          DFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDEDEE9DADAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF4F4E4F1
          F1E5F2F2E5F2F2E0EFEFFFFFFFF9FCFCE1F0F0E5F2F2E5F2F2E2F1F1F2F8F8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F6F1F1E9DBDBEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFE8D9
          D9FFFFFFFFFFFFF2EAEAEADCDCEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEB
          DFDFE8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE1F0F0E5F2F2E5F2F2E3F1F1EBF5F5FFFFFFEAF4
          F4E4F1F1E5F2F2E5F2F2E0EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FA6A6178B8B1E8E8E1E8E8E07
          8383FFFFFFC5E1E10C86861E8E8E1E8E8E1188888DC5C5FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB483834C00005600
          00560000560000560000560000560000560000560000460000FFFFFFFFFFFF94
          4E4E4F0000560000560000560000560000560000560000560000440000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF5FAFA0883831E8E8E1E8E8E168A8A5AADADFFFFFF56AAAA178B8B1E8E8E1E
          8E8E078383F9FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          992692929ACBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFD1C8D8D3399993399992A9494
          64B2B2FFFFFF64B1B12B95953399993399991C8D8DFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60AFAF2C95
          953399992D9696118888FFFFFFC8E3E3178B8B28939332989828939387C2C2FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDCEDED208F8F3399993298982B959580C0C0FFFFFF5DAE
          AE2A9494339999339999208F8FDFEFEFEFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD5D5B2D8D8B2D8D8B2D8D8B2D8
          D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8BDDEDE4EA6A62E96962D96965BADAD76
          BABAFFFFFFDEEEEE74B9B988C3C33298983298981E8E8E8AC4C4B7DBDBB2D8D8
          B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8AFD7D7C9EEEEC392925B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          E6F3F3ACD5D5B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8C0DF
          DF1E8E8E319898339999309797389C9CFFFFFFFFFFFFA7D3D32D969632989833
          99993399991C8D8D41A0A0BDDEDEB2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8
          B2D8D8ABD5D5E7F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF12888822909023919123919123919123919123919123
          91912391912391912391912E9696208F8F1188889CCDCDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF2391913097973399992893932391912391912391912391912391
          912391912391912391911D8E8E57B5B5CE98985B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFB5DBDB1389892391
          9123919123919123919123919123919123919123919123919131989833999928
          93931B8D8D249292FFFFFFFFFFFFFFFFFF2190901C8D8D1E8E8E2C9595339999
          2E9696239191239191239191239191239191239191239191239191138989B9DC
          DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1C8D8D2D96962D96962D96962D96962D96962D96962D96962D96962D9696
          2D96961A8C8CEAF4F4E4F1F1F2F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F0
          F01B8D8D2D96962D96962D96962D96962D96962D96962D96962D96962D96962D
          96962793935FB9B9CE98985B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFB9DDDD1D8E8E2D96962D96962D96962D
          96962D96962D96962D96962D96962D96962D96962391918EC6C6EEF6F6E4F1F1
          FFFFFFFFFFFFFFFFFFE3F1F1E4F1F1F3F9F95EAFAF2793932D96962D96962D96
          962D96962D96962D96962D96962D96962D96961D8E8EBCDDDDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E9E9E4BA5A5
          4CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A5399C9CFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A9C9C4CA5A54C
          A5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A547A3A378C5C5
          CB96965B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFC3E2E23F9F9F4CA5A54CA5A54CA5A54CA5A54CA5A54CA5A5
          4CA5A54CA5A54CA5A54CA5A541A0A0ACD5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF7DBEBE46A2A24CA5A54CA5A54CA5A54CA5A54CA5A54C
          A5A54CA5A54CA5A54CA5A53F9F9FC5E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFADD6D642A0A04CA5A54CA5A54CA5A54AA4A44DA6
          A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3A9C9C4CA5A54CA5A546A2A280BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFBDDEDE1288882D96962D96962D96962D96962B95952D9696FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EA7A71489892D96962D96962D96
          962D9696279393078383C1DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6E2E221909033
          9999339999339999339999309797329898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF60B0B02B959533999933999933999933999933999921
          9090C9E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6E2E2219090339999339999339999
          339999309797329898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF60B0B02B9595339999339999339999339999339999219090C9E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBDDEDE158A8A3399993399993399993399993097973298
          98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60B0B02B9595
          3399993399993399993399992B9595078383C1DFDFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFA0CFCF269292339999339999339999309797329898FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF59ACAC2290903399993399993399
          992B95956CB5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CC5C517
          8B8B319898339999339999309797269292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF9DCECE7ABCBC2994943399993399991D8E8E59ACACFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6EAEABBDDDD309898319898
          339999249191B1D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF1C8D8D339999259292AFD7D7C6E2E2FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF188C8C178B8B198C8C028080FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB
          028181198C8C028080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49D9D5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6E0D0D781F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F
          791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F
          1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F79
          1F1F791F1F7A2222701212630000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          006600006600006600006200007C2525792020791F1F791F1F791F1F791F1F79
          1F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F
          791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F
          1F791F1F791F1F791F1F791F1F791F1F791F1F6F0F0FD4B7B7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000610000
          6200006200006200006200006200006200006200006200006200006200006200
          0062000062000062000062000062000062000062000062000062000062000062
          0000620000620000620000620000620000620000620000620000620000620000
          6300006600006600006600006600006600006600006600006600006100004D00
          00FFFFFFFFFFFF99565656000066000066000066000066000066000066000066
          0000660000620000620000620000620000620000620000620000620000620000
          6200006200006200006200006200006200006200006200006200006200006200
          0062000062000062000062000062000062000062000062000062000062000062
          0000620000620000620000550000CDACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5700006500006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          006600006600006600006600006600006100008B3D3D985454FFFFFFFFFFFFC2
          9A9AA264645E0000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          660000590000CEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF57000065000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000530000CAA7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF460000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          660000660000660000660000660000660000660000660000660000590000CEAE
          AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF570000650000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600006600006600006100005200005200005200004C0000
          8F4444FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3B6B64600005200005200
          005200005A000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          00660000660000660000660000660000660000590000CEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5000005D0000
          5E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00
          005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E
          00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E0000
          5E00005E00005900007F2A2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B4B452
          00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E0000
          5E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00
          005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E
          00005E00005E00005E0000510000CBA9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9651519F5F5F9F5F5F9F5F5F9F5F
          5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F
          5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F
          9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9C5B
          5BB07B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC6C69853539F5F5F9F5F5F
          9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F
          5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F
          5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F
          9F5F5F975353E0CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD8BEBE9854549F5F5F9F5F5F9F5F5F9F5F5F9D5B5BAB7373
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BF96965300005E00005E00005E00005E00005A0000751A1AFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE0E0F1E8E8B584845D00006600
          00660000660000660000660000620000490000AD7676FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6803035300005D000066000066000066000066000066
          00006600006600006600004D0000E6D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCACA9F
          5F5F6A0707640000660000660000660000660000660000660000660000660000
          660000560000F6EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D9D96200005C0000640000660000
          6600006600006600006600006600006600006600006600006600006200007418
          18893B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2D1D15500006600006600006600006600006600006600
          00660000660000660000660000660000660000660000600000701111FEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFE3D2D257000066000066000066000066000066000066000066000066000066
          00006600006600006600006600006600005B0000914949FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D2D257000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600005E00009B5959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D2D2570000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          005E0000995555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2CFCF5300006600006600006600006600006600006600
          00660000660000660000660000660000660000660000650000610000AB7373FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF1E8E87E292961000066000066000066000066000066000066000066000066
          0000660000660000660000660000620000781F1FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49E9E5B
          0000660000660000660000660000660000660000660000660000660000660000
          660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68686480000620000660000
          6600006600006600006600006600006600006600006600006600006600005300
          00660000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7011116200006600006600006600
          00660000660000660000660000660000660000560000F9F4F4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAD77775C000066000066000066000066000066000066
          0000660000660000660000560000EADBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF440000560000600000660000660000660000660000660000560000
          560000470000E6D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D8D8
          F5EEEE893B3B4D0000520000520000520000430000FBF8F8EBDFDFE8DADAFDFB
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000}
        mmHeight = 29633
        mmLeft = 1852
        mmTop = 0
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label4'
        Caption = 'Perfil de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 136261
        mmTop = 45245
        mmWidth = 37761
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText2'
        DataField = 'PERFINV'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 45245
        mmWidth = 57415
        BandType = 0
      end
    end
    object ppDetailBand23: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText358: TppDBText
        UserName = 'DBText246'
        DataField = 'RUBFUNCEF'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 62971
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText359: TppDBText
        UserName = 'DBText247'
        DataField = 'DESCRRUBRICA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 76200
        mmTop = 529
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText362: TppDBText
        UserName = 'DBText269'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 1323
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText363: TppDBText
        UserName = 'DBText270'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 116681
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText364: TppDBText
        UserName = 'DBText268'
        DataField = 'MESCOBREEMB'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 131498
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText368: TppDBText
        UserName = 'DBText368'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 14817
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText370: TppDBText
        UserName = 'DBText370'
        DataField = 'IDPLANOCONTABIL'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 49213
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText371: TppDBText
        UserName = 'DBText3701'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 28310
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText366: TppDBText
        UserName = 'DBText366'
        DataField = 'MESREFREEMB'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 144992
        mmTop = 265
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText367: TppDBText
        UserName = 'DBText367'
        DataField = 'DTINICIOCREDREM'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 174361
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText372: TppDBText
        UserName = 'DBText372'
        DataField = 'DTFIMCREDREM'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 190236
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText373: TppDBText
        UserName = 'DBText373'
        DataField = 'MESCOMPREEMREM'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 157692
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppLine87: TppLine
        UserName = 'Line87'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText361: TppDBText
        UserName = 'DBText249'
        DataField = 'VALORINSS'
        DataPipeline = ppExtrIndivCRI
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 249767
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText365: TppDBText
        UserName = 'DBText365'
        DataField = 'DESCRRUBRICAREM'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 206111
        mmTop = 265
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'DIFERENCAANALITICA'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2879
        mmLeft = 264319
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 263261
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText2701'
        DataField = 'SINALD'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2910
        mmLeft = 111654
        mmTop = 529
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText1'
        DataField = 'SINALR'
        DataPipeline = ppExtrIndivCRI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRI'
        mmHeight = 2910
        mmLeft = 243682
        mmTop = 265
        mmWidth = 5556
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine97: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel396: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 281782
        BandType = 8
      end
      object ppSystemVariable39: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable40: TppSystemVariable
        UserName = 'SystemVariable32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 254530
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand20: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppShape36: TppShape
        UserName = 'Shape15'
        Brush.Color = 14803425
        Pen.Color = clWhite
        mmHeight = 17198
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 7
      end
      object ppLine98: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 7673
        mmWidth = 283634
        BandType = 7
      end
      object ppLabel397: TppLabel
        UserName = 'Label248'
        Caption = 'Diferença :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 2910
        mmWidth = 18256
        BandType = 7
      end
      object lblTotalFuncefCRI: TppLabel
        UserName = 'lblTotalFuncefCRI'
        AutoSize = False
        Caption = 'lblTotalFuncefCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object lblTotalReembCRI: TppLabel
        UserName = 'lblTotalReembCRI'
        AutoSize = False
        Caption = 'lblTotalReembCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object lblDiferencaCRI: TppLabel
        UserName = 'lblDiferencaCRI'
        AutoSize = False
        Caption = 'lblDiferencaCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187325
        mmTop = 2910
        mmWidth = 20373
        BandType = 7
      end
      object ppLabel401: TppLabel
        UserName = 'lblTotalFuncef1'
        AutoSize = False
        Caption = 'Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel402: TppLabel
        UserName = 'lblTotalReemb1'
        AutoSize = False
        Caption = 'Reembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel403: TppLabel
        UserName = 'Label267'
        Caption = 'Glosa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 8996
        mmWidth = 10848
        BandType = 7
      end
      object lblGlosaCRI: TppLabel
        UserName = 'lblGlosaCRI'
        AutoSize = False
        Caption = 'lblGlosaCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187325
        mmTop = 8996
        mmWidth = 20108
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MESANALITICO'
      DataPipeline = ppExtrIndivCRI
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtrIndivCRI'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 130175
          mmTop = 0
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 263261
          mmTop = 0
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'Line12'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 130175
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line101'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 263261
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object ppdExtrIndivCRI: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprExtrIndivCRI
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 911
    Top = 261
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 560
    Top = 208
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 440
    Top = 258
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME'
      '     , P.RAZAOSOCIAL'
      '     , E.LOGRADOURO'
      '     , E.NUMERO'
      '     , E.COMPLEMENTO'
      '     , E.BAIRRO'
      '     , C.NOME AS CIDADE'
      '     , C.CODESTADO'
      '     , E.CEP'
      'FROM PESSOA P'
      '   , ENDPESS E'
      '   , CIDADES C'
      'WHERE (P.IDPESSOA = :pPessoa) AND'
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))')
    ValidateWithMask = True
    Left = 392
    Top = 259
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasDesembolso: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO,'
      '       1 AS PROCESSAR'
      'FROM PROVDESC P'
      'WHERE CODFONTEPAGADORA=2'
      'AND EXISTS'
      '('
      'SELECT 1'
      'FROM RUBRICAXINSS RI'
      'WHERE RI.IDRUBRICA = P.IDPROVENTO'
      ')'
      'ORDER BY 2'
      ''
      ' '
      ' ')
    UpdateObject = updRubricasDesembolso
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 78
    Top = 198
    object qryRubricasDesembolsoPROCESSAR: TFloatField
      DisplayLabel = 'Selecionar~Todos'
      DisplayWidth = 10
      FieldName = 'PROCESSAR'
    end
    object qryRubricasDesembolsoDESCRICAO: TStringField
      DisplayLabel = 'Rubrica Desembolso'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryRubricasDesembolsoIDPROVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object dsRubricasDesembolso: TwwDataSource
    DataSet = qryRubricasDesembolso
    Left = 116
    Top = 206
  end
  object qryRubricasReembolso: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '               NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO,'
      '               1 as PROCESSAR'
      'FROM PROVDESC P'
      'WHERE CODFONTEPAGADORA=2'
      'AND EXISTS'
      '('
      'SELECT 1'
      'FROM RUBRICAXINSS RI'
      'WHERE RI.IDRUBRICA = P.IDPROVENTO'
      ')'
      'ORDER BY 2'
      ''
      '')
    UpdateObject = updRubricasReembolso
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 80
    Top = 160
    object qryRubricasReembolsoPROCESSAR: TFloatField
      DisplayLabel = 'Selecionar~Todos'
      DisplayWidth = 10
      FieldName = 'PROCESSAR'
    end
    object qryRubricasReembolsoDESCRICAO: TStringField
      DisplayLabel = 'Rubrica Reembolso'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryRubricasReembolsoIDPROVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object dsRubricasReembolso: TwwDataSource
    DataSet = qryRubricasReembolso
    Left = 120
    Top = 160
  end
  object qryConsAnalitica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MESCOMPREEM AS MESCOBRANCA                               ' +
        '                                             '
      '     ,SUBSTR(MESCOMPREEM,1,4) AS ANOCOBRANCA'
      
        '     ,SUM(VALORDESEMBOLSO) AS VALORDESEMBOLSO                   ' +
        '                                            '
      
        '     ,SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                     ' +
        '                                            '
      
        '     ,SUM(VALORREEMBOLSO-VALORDESEMBOLSO) AS DIFERENCA          ' +
        '                                            '
      
        'FROM                                                            ' +
        '                                             '
      
        '(                                                               ' +
        '                                             '
      
        '(                                                               ' +
        '                                             '
      
        'SELECT                                                          ' +
        '                                             '
      
        '   H.MESCOMPREEM                                                ' +
        '                                             '
      
        '  ,SUM(DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPROV' +
        'ENTO)) AS  VALORDESEMBOLSO                   '
      
        '  ,0 AS VALORREEMBOLSO                                          ' +
        '                                             '
      
        'FROM                                                            ' +
        '                                             '
      
        '  HISTRUBSAL H, PROVDESC P,  INFORME I,                         ' +
        '                                             '
      
        '  (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA                     ' +
        '                                           '
      
        'WHERE                                                           ' +
        '                                             '
      
        '  (H.IDPESSJUR = :IDPESSJUR)      AND                           ' +
        '                                             '
      
        '  (H.IDPESSOA  = :IDPESSOA)       AND                           ' +
        '                                             '
      
        '  ((H.MESCOMPREEM >= :MESCOB)     AND                           ' +
        '                                             '
      
        '   (H.MESCOMPREEM <= :MESCOBFIM)) AND                           ' +
        '                                             '
      
        '  ( ( (H.NUMPROCINSS = :pNUMPROCINSS) AND (H.IDMODULO=18) ) OR  ' +
        '                                             '
      
        '    ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND         ' +
        '                                             '
      
        '  (H.IDMODULO IN (18,21))            AND                        ' +
        '                                             '
      
        '  (H.IDRUBRICA = P.IDPROVENTO)       AND                        ' +
        '                                             '
      
        '  (H.IDRUBRICA <> PA.IDRUBIRRFINSS)  AND                        ' +
        '                                             '
      
        '  ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND            ' +
        '                                             '
      
        '  ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.' +
        'IDMODULO=21) AND                             '
      
        '  (P.CODFONTEPAGADORA = 2) ) )                                  ' +
        '                                             '
      
        '  AND (H.IDINFORME = I.IDINFORME(+))                            ' +
        '                                             '
      
        '  AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )      ' +
        '                                             '
      
        '  AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL)' +
        ' )                                           '
      
        '  AND ( (0 = :pINIBIR_RUBRICA_PA) OR                            ' +
        '                                             '
      
        '        ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC N' +
        'OT LIKE '#39'%33404'#39') ) )                    '
      
        'GROUP BY MESCOMPREEM                                            ' +
        '                                             '
      
        ')                                                               ' +
        '                                             '
      
        'UNION ALL                                                       ' +
        '                                             '
      
        '(                                                               ' +
        '                                             '
      
        'SELECT MESCOMPREEM                                              ' +
        '                                             '
      
        '      ,0 AS VALORDESEMBOLSO                                     ' +
        '                                             '
      
        '      ,SUM(VALOR) as VALORREEMBOLSO                             ' +
        '                                             '
      
        'FROM                                                            ' +
        '                                             '
      
        '(                                                               ' +
        '                                             '
      
        'SELECT D.MESCOBRANCA AS MESCOMPREEM                             ' +
        '                                             '
      
        '      ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS ' +
        'VALOR                                        '
      
        'FROM                                                            ' +
        '                                             '
      
        '   DETCONCINSS      D,                                          ' +
        '                                             '
      
        '   PROVDESC         P                                           ' +
        '                                             '
      
        'WHERE                                                           ' +
        '                                             '
      
        '       (D.NUMPROCINSS = :pNUMPROCINSS)                          ' +
        '                                             '
      
        '   AND ( D.MESCOBRANCA >= :MESCOB )                             ' +
        '                                             '
      
        '   AND ( D.MESCOBRANCA <= :MESCOBFIM )                          ' +
        '                                             '
      
        '   AND (D.IDRUBRICA       = P.IDPROVENTO)                       ' +
        '                                             '
      
        '   AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'3'#39') AND (SUBSTR(D.RUBRI' +
        'CAINSS, 2, 1) <> '#39'9'#39'))                   '
      
        '   AND (D.FLGMANUAL      <> 4)                                  ' +
        '                                             '
      
        '   AND (D.FLGMANUAL      <> 1)                                  ' +
        '                                             '
      
        '   AND (D.FLGMANUAL      <> 2)                                  ' +
        '                                             '
      
        '   AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                ' +
        '                                             '
      
        '         ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN ' +
        '(6, 14, 99) ) )  )                           '
      
        '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                           ' +
        '                                             '
      
        '         ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC ' +
        'NOT LIKE '#39'%33404'#39') ) )                   '
      
        'UNION ALL                                                       ' +
        '                                             '
      
        'SELECT T.MESPROCESSAMENTO AS MESCOMPREEM                        ' +
        '                                             '
      
        '      ,DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)' +
        ' AS VALOR                                    '
      
        'FROM                                                            ' +
        '                                             '
      
        '   TEMPCONCINSS T                                               ' +
        '                                             '
      
        '  ,PROVDESC P                                                   ' +
        '                                             '
      
        'WHERE                                                           ' +
        '                                             '
      
        '       T.NUMPROCINSS = :pNUMPROCINSS                            ' +
        '                                             '
      
        '   AND ( T.MESPROCESSAMENTO >= :MESCOB )                        ' +
        '                                             '
      
        '   AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )                     ' +
        '                                             '
      
        '   AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                   ' +
        '                                             '
      
        '   AND T.FLGMANUAL <> 4                                         ' +
        '                                             '
      
        '   AND T.FLGMANUAL <> 1                                         ' +
        '                                             '
      
        '   AND T.FLGMANUAL <> 2                                         ' +
        '                                             '
      
        '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                           ' +
        '                                             '
      
        '         ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC ' +
        'NOT LIKE '#39'%33404'#39') ) )                   '
      
        ')                                                               ' +
        '                                             '
      
        'GROUP BY MESCOMPREEM                                            ' +
        '                                             '
      ')'
      ')'
      
        'GROUP BY MESCOMPREEM                                            ' +
        '                                             '
      
        'ORDER BY                                                        ' +
        '                                             '
      
        'MESCOMPREEM DESC                                                ' +
        '                                             ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 392
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pAPENAS_REEMBOLSO_PARA_FUNCEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end>
    object qryConsAnaliticaMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 15
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryConsAnaliticaVALORDESEMBOLSO: TFloatField
      DisplayLabel = 'Total Desembolso'
      DisplayWidth = 20
      FieldName = 'VALORDESEMBOLSO'
    end
    object qryConsAnaliticaVALORREEMBOLSO: TFloatField
      DisplayLabel = 'Total Reembolso'
      DisplayWidth = 20
      FieldName = 'VALORREEMBOLSO'
    end
    object qryConsAnaliticaDIFERENCA: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 20
      FieldName = 'DIFERENCA'
    end
    object qryConsAnaliticaANOCOBRANCA: TStringField
      DisplayWidth = 4
      FieldName = 'ANOCOBRANCA'
      Visible = False
      Size = 4
    end
  end
  object dsConsAnalitica: TwwDataSource
    DataSet = qryConsAnalitica
    OnDataChange = dsConsAnaliticaDataChange
    Left = 440
    Top = 224
  end
  object dsExtrIndivCRISint: TwwDataSource
    DataSet = qryExtrIndivCRI
    Left = 790
    Top = 220
  end
  object ppExtrIndivCRISint: TppBDEPipeline
    DataSource = dsExtrIndivCRISint
    UserName = 'ExtrIndivCRISint'
    Left = 828
    Top = 222
    object ppExtrIndivCRISintppField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField4: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField5: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField6: TppField
      FieldAlias = 'MANTENEDORA'
      FieldName = 'MANTENEDORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField7: TppField
      FieldAlias = 'NB'
      FieldName = 'NB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField8: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField9: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField10: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField11: TppField
      FieldAlias = 'RUBFUNCEF'
      FieldName = 'RUBFUNCEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField12: TppField
      FieldAlias = 'VALORFUNCEF'
      FieldName = 'VALORFUNCEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField13: TppField
      FieldAlias = 'RUBINSS'
      FieldName = 'RUBINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField14: TppField
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField15: TppField
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField16: TppField
      FieldAlias = 'MESCOBREEMB'
      FieldName = 'MESCOBREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField17: TppField
      FieldAlias = 'MESREFREEMB'
      FieldName = 'MESREFREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField18: TppField
      FieldAlias = 'RMREAJ'
      FieldName = 'RMREAJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField19: TppField
      FieldAlias = 'IDPLANOPREVREEMB'
      FieldName = 'IDPLANOPREVREEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField20: TppField
      FieldAlias = 'NOMEPLANOPREV'
      FieldName = 'NOMEPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField21: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField22: TppField
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField23: TppField
      FieldAlias = 'DESCRRUBRICA'
      FieldName = 'DESCRRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField24: TppField
      FieldAlias = 'IDPLANOCONTABIL'
      FieldName = 'IDPLANOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField25: TppField
      FieldAlias = 'MESCOMPREEM'
      FieldName = 'MESCOMPREEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField26: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField27: TppField
      FieldAlias = 'DESCRRUBRICAREM'
      FieldName = 'DESCRRUBRICAREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField28: TppField
      FieldAlias = 'DTINICIOCREDREM'
      FieldName = 'DTINICIOCREDREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField29: TppField
      FieldAlias = 'DTFIMCREDREM'
      FieldName = 'DTFIMCREDREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField30: TppField
      FieldAlias = 'MESCOMPREEMREM'
      FieldName = 'MESCOMPREEMREM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField31: TppField
      FieldAlias = 'MESANALITICO'
      FieldName = 'MESANALITICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField32: TppField
      FieldAlias = 'TOTALDESEMBOLSO'
      FieldName = 'TOTALDESEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField33: TppField
      FieldAlias = 'TOTALREEMBOLSO'
      FieldName = 'TOTALREEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField34: TppField
      FieldAlias = 'DIFERENCAANALITICA'
      FieldName = 'DIFERENCAANALITICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField35: TppField
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField36: TppField
      FieldAlias = 'LINHADESEMBOLSO'
      FieldName = 'LINHADESEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField37: TppField
      FieldAlias = 'LINHAREEMBOLSO'
      FieldName = 'LINHAREEMBOLSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField38: TppField
      FieldAlias = 'SINALD'
      FieldName = 'SINALD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppExtrIndivCRISintppField39: TppField
      FieldAlias = 'SINALR'
      FieldName = 'SINALR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
  end
  object pprExtrIndivCRISint2: TppReport
    AutoStop = False
    DataPipeline = ppExtrIndivCRISint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 796
    Top = 173
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtrIndivCRISint'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 66146
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape20'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 1588
        mmTop = 50800
        mmWidth = 124619
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19981
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9398
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 7832
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3768
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 9313
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 7832
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 10964
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label65'
        Caption = 'Conciliação do Reembolso do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 95250
        mmTop = 26458
        mmWidth = 71702
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 33338
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label235'
        Caption = 'Núm. Benefício :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 40481
        mmWidth = 27771
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label236'
        Caption = 'Espécie :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 45244
        mmWidth = 15409
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label243'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 59267
        mmTop = 40481
        mmWidth = 17653
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label242'
        Caption = 'Nome do Beneficiário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 35190
        mmWidth = 38312
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label240'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3387
        mmLeft = 81492
        mmTop = 55563
        mmWidth = 15610
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line76'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 63236
        mmWidth = 284300
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText242'
        DataField = 'NB'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 40481
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText244'
        DataField = 'MATRICULA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 40481
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText243'
        DataField = 'ESPECIE'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 45244
        mmWidth = 6085
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText245'
        DataField = 'NOMEBENEF'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 41010
        mmTop = 35190
        mmWidth = 152400
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label232'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 1058
        mmTop = 55563
        mmWidth = 14690
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label233'
        Caption = 'Rubrica INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7620
        mmLeft = 16695
        mmTop = 55563
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label245'
        Caption = 'Entidade Contábil :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 100277
        mmTop = 40481
        mmWidth = 32089
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText273'
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 40481
        mmWidth = 57415
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line80'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 49477
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label257'
        Caption = 'DESEMBOLSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 58473
        mmTop = 51065
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label258'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 55563
        mmWidth = 14817
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape201'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 125942
        mmTop = 50800
        mmWidth = 140759
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label262'
        Caption = 'REEMBOLSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 51065
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label263'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 100013
        mmTop = 45244
        mmWidth = 37835
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText277'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 139171
        mmTop = 45244
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label405'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 29898
        mmTop = 55563
        mmWidth = 7959
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label406'
        Caption = 'Descrição Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 55563
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label407'
        Caption = 'Entidade Contabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 97896
        mmTop = 55563
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label408'
        Caption = 'Competência do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 110861
        mmTop = 55563
        mmWidth = 15325
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label384'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 55827
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label385'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 55563
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label391'
        Caption = 'Descrição Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 164571
        mmTop = 55563
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label2401'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 55563
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label393'
        Caption = 'Inicio Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 223044
        mmTop = 55563
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label409'
        Caption = 'Fim Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 237596
        mmTop = 55563
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label410'
        Caption = 'Referência Reembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6773
        mmLeft = 251090
        mmTop = 55563
        mmWidth = 15282
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line89'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 125942
        mmTop = 61648
        mmWidth = 1323
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape1'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 266171
        mmTop = 50800
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label1'
        Caption = 'DIFERENÇA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 267230
        mmTop = 50800
        mmWidth = 16383
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 266171
        mmTop = 61913
        mmWidth = 1323
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DBText246'
        DataField = 'RUBFUNCEF'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText247'
        DataField = 'DESCRRUBRICA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3260
        mmLeft = 41010
        mmTop = 0
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText248'
        DataField = 'RUBINSS'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText249'
        DataField = 'VALORINSS'
        DataPipeline = ppExtrIndivCRISint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 152665
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText269'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText270'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 28310
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText268'
        DataField = 'MESCOBREEMB'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 127794
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText368'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText370'
        DataField = 'IDPLANOCONTABIL'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 97631
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText3701'
        DataField = 'MESREFREEMB'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText365'
        DataField = 'DESCRRUBRICAREM'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 0
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText366'
        DataField = 'MESREFREEMB'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 209815
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText367'
        DataField = 'DTINICIOCREDREM'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 222515
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText372'
        DataField = 'DTFIMCREDREM'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 237596
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText373'
        DataField = 'MESCOMPREEMREM'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line87'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 126207
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText1'
        DataField = 'DIFERENCA'
        DataPipeline = ppExtrIndivCRISint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3175
        mmLeft = 266965
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 281782
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 254530
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape15'
        Brush.Color = 14803425
        Pen.Color = clWhite
        mmHeight = 17198
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 7673
        mmWidth = 283634
        BandType = 7
      end
      object ppLabel29: TppLabel
        UserName = 'Label248'
        Caption = 'Diferença :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 2910
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'lblTotalFuncefCRI'
        AutoSize = False
        Caption = 'lblTotalFuncefCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'lblTotalReembCRI'
        AutoSize = False
        Caption = 'lblTotalReembCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'lblDiferencaCRI'
        AutoSize = False
        Caption = 'lblDiferencaCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187325
        mmTop = 2910
        mmWidth = 20373
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'lblTotalFuncef1'
        AutoSize = False
        Caption = 'Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'lblTotalReemb1'
        AutoSize = False
        Caption = 'Reembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label267'
        Caption = 'Glosa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 8996
        mmWidth = 10848
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'lblGlosaCRI'
        AutoSize = False
        Caption = 'lblGlosaCRI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187325
        mmTop = 8996
        mmWidth = 20108
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdExtrIndivCRISint: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprExtrIndivCRISint
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 911
    Top = 221
  end
  object updRubricasReembolso: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  IDPROVENTO = :IDPROVENTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  PROCESSAR = :PROCESSAR'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PROCESSAR = :OLD_PROCESSAR')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (IDPROVENTO, DESCRICAO, PROCESSAR)'
      'values'
      '  (:IDPROVENTO, :DESCRICAO, :PROCESSAR)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PROCESSAR = :OLD_PROCESSAR')
    Left = 38
    Top = 159
  end
  object updRubricasDesembolso: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  IDPROVENTO = :IDPROVENTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  PROCESSSAR = :PROCESSSAR'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PROCESSSAR = :OLD_PROCESSSAR')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (IDPROVENTO, DESCRICAO, PROCESSSAR)'
      'values'
      '  (:IDPROVENTO, :DESCRICAO, :PROCESSSAR)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PROCESSSAR = :OLD_PROCESSSAR')
    Left = 38
    Top = 199
  end
  object pprExtrIndivCRISint: TppReport
    AutoStop = False
    DataPipeline = ppExtrIndivCRISint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 872
    Top = 221
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtrIndivCRISint'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 60854
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19981
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 150813
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9398
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 7832
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3768
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 9313
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 7832
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 10964
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label65'
        Caption = 'Conciliação do Reembolso do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 95250
        mmTop = 26458
        mmWidth = 71702
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 33338
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label235'
        Caption = 'Núm. Benefício :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 40481
        mmWidth = 27771
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label236'
        Caption = 'Espécie :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 45245
        mmWidth = 15409
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label243'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 59267
        mmTop = 40480
        mmWidth = 17653
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label242'
        Caption = 'Nome do Beneficiário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 35190
        mmWidth = 38312
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText242'
        DataField = 'NB'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 40481
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText244'
        DataField = 'MATRICULA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 40481
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText243'
        DataField = 'ESPECIE'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 45244
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText245'
        DataField = 'NOMEBENEF'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 41010
        mmTop = 35190
        mmWidth = 152400
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label245'
        Caption = 'Entidade Contábil :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 142083
        mmTop = 40481
        mmWidth = 32089
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText273'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 45244
        mmWidth = 57415
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line80'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 49477
        mmWidth = 283105
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label263'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 39159
        mmTop = 45244
        mmWidth = 37835
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText277'
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 40746
        mmWidth = 57415
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape202'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 51065
        mmWidth = 136261
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label37'
        Caption = 'Consolidaçao Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 51065
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label1'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 56092
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label38'
        Caption = 'Total Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 19844
        mmTop = 56251
        mmWidth = 27220
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label39'
        Caption = 'Total Reembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 50536
        mmTop = 56251
        mmWidth = 25442
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label40'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 81756
        mmTop = 56251
        mmWidth = 14520
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        AutoSize = True
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D6170B6960000424DB69600000000000036000000280000007200
          000070000000010018000000000080960000C30E0000C30E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE3E3430000
          5200004F0000600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEADCDCF3EBEB9D5D5D4B000052000052000052000052
          00004E0000771D1DF6F1F1EBDEDEE9DBDBFFFFFFFFFFFFFFFFFF5E0000500000
          5200005200004E0000721414FFFFFFFFFFFFFFFFFFEEE3E3AD77774A00005200
          00520000470000BF9494FFFFFFFDFCFCE8DADAF7F3F36907074F000052000052
          0000520000520000520000470000CEAFAFEEE2E2F1E8E8FFFFFFFFFFFFF3EDED
          4200005200005200005200005200005200005200005200005200005200005200
          004D00007D2727FFFFFFFFFFFF5700005000005200005100004E0000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006300007012
          12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF5500005500005E0000660000660000660000660000660000660000610000
          560000550000520000FFFFFFFFFFFFFFFFFF6E0D0D6300006600006600006100
          00812C2CFFFFFFFFFFFFFFFFFF4400005D00006600006600006600005A0000C7
          A0A0FFFFFFE9DBDB470000560000620000660000660000660000660000660000
          6600006600005A00004F0000904646FFFFFFFFFFFFF6F1F15500006600006600
          006600006600006600006600006600006600006600006600006000008B3D3DFF
          FFFFFFFFFF680404630000660000640000600000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E9560000660000630000701212FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF630000640000
          6600006600005800005600005600005600005800006600006600006400006000
          00FFFFFFFFFFFFFFFFFF6E0D0D630000660000660000610000812C2CFFFFFFFF
          FFFFAD77775C00006600006600006600006600005A0000C7A0A0FFFFFFF8F4F4
          5600006600006600006300005600005600005600005600005C00006600006600
          00630000711313D9C1C1FFFFFFF6F1F15500006600006600006600006600005E
          0000560000560000560000560000560000510000802B2BFFFFFFFFFFFF680404
          630000660000640000600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E9560000660000630000711313FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF630000640000660000580000EBDD
          DDEDE1E1EBDFDFEDE1E1EDE0E0580000660000640000600000FFFFFFFFFFFFFF
          FFFF6E0D0D630000660000660000610000812C2CFFFFFFFFFFFF6D0C0C620000
          6600006600006600006600005A0000C7A0A0FFFFFF6804046200006600006300
          00741919F8F3F3EBDFDFEBDFDFF1E8E8BE94945C0000660000660000580000B8
          8989FFFFFFF6F1F15500006600006600006600005E0000AC7575F3EBEBEBDFDF
          EBDFDFEBDFDFEBDFDFEADDDDEFE5E5FFFFFFFFFFFF6804046300006600006400
          00600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          660000630000701111F8F4F4EBDFDFEBDFDFEBDFDFEBDFDFE9DADAFBF9F9FFFF
          FFFFFFFFF4EEEEF8F3F3640000640000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000640000610000FDFCFCFFFFFFFFFFFF6E0D0D630000
          660000660000610000822F2FFFFFFFF6F0F07214146300006600006600006600
          006600005A0000C7A0A0FFFFFF4F0000660000660000620000761C1CFFFFFFFF
          FFFFFFFFFFFFFFFFCEAEAE5900006600006600005B0000BB8F8FFFFFFFF6F1F1
          5500006600006600006600005C0000B88989FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF680404630000660000640000620000FAF6F6EB
          DFDFEBDFDFEBDFDFEADCDCF4ECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006600006300
          00560000560000560000560000560000480000DAC3C3FFFFFFFFFFFFA66B6B4D
          0000640000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          6600006600005F00007A2222FFFFFFFFFFFF6E0D0D6300006600006600006100
          008C3E3ECCACAC4B00006300006600006600006600006600006600005A0000C7
          A0A0FFFFFF520000660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFF
          C7A3A34E00005A00005A0000500000B68686FFFFFFF6F1F15500006600006600
          006600005C0000BC9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF680404630000660000660000640000560000560000560000560000
          4E0000A06161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E956000066000066000066000066000066000066
          0000660000660000580000DEC9C9FFFFFFFFFFFFAE78785C0000660000660000
          660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5400006600006600006000
          00863535FFFFFFFFFFFF6E0D0D6300006600006600006400007315158D414161
          00006500005600005D00006600006600006600005A0000C7A0A0FFFFFF520000
          660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFFECDFDFC09797C59F
          9FC59F9FC19898E5D5D5FFFFFFF6F1F155000066000066000066000061000084
          3232A365659F5F5F9F5F5F9F5F5F954E4EFEFEFEFFFFFFFFFFFFFFFFFF680404
          6300006600006600006600006600006600006600006600005D0000A96F6FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E9560000660000660000650000620000620000620000620000620000
          540000DDC8C8FFFFFFFFFFFFAE78785C0000660000660000660000540000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF540000660000660000600000863535FFFFFFFF
          FFFF6E0D0D6300006600006600006600006400006100006500005B0000FFFFFF
          B584845D00006600006600005A0000C7A0A0FFFFFF5200006600006600006200
          00751A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F1F15500006600006600006600006600006100005E00005E0000
          5E00005E00004D0000FEFEFEFFFFFFFFFFFFFFFFFF6804046300006600006600
          00650000620000620000620000620000590000A76C6CFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          6600006500006600007C2525791F1F791F1F791F1F791F1F6D0D0DE2CFCFFFFF
          FFFFFFFFAE78785C0000660000660000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000660000600000863535FFFFFFFFFFFF6E0D0D630000
          660000660000660000660000660000650000510000FFFFFFC39B9B5B00006600
          006600005A0000C7A0A0FFFFFF520000660000660000620000751A1AFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F1F1
          5500006600006600006600006600006200005E00005E00005E00005E00004D00
          00FEFEFEFFFFFFFFFFFFFFFFFF6804046300006600006500006400007C252579
          1F1F791F1F791F1F721414B38181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006300007316
          16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE78785C
          0000660000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          660000660000600000863535FFFFFFFFFFFF6E0D0D6300006600006600006600
          006600006600005F0000924A4AFFFFFFC097975B00006600006600005A0000C7
          A0A0FFFFFF520000660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFF
          ECDFDFC09797C59F9FC59F9FC19898E5D5D5FFFFFFF6F1F15500006600006600
          00660000620000843232A365659F5F5F9F5F5F9F5F5F954E4EFEFEFEFFFFFFFF
          FFFFFFFFFF680404630000660000640000610000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1E9E9560000660000630000731616FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE78785C0000660000660000
          660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5400006600006600006000
          00863535FFFFFFFFFFFF6E0D0D6300006600006600006600006600005F000046
          0000F8F4F4FFFFFFC097975B00006600006600005A0000C7A0A0FFFFFF460000
          660000660000620000781F1FFFFFFFFFFFFFFFFFFFFFFFFFD1B3B34E00005A00
          005A00004A0000AF7A7AFFFFFFF6F1F15500006600006600006600005C0000C4
          9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF680404
          630000660000640000610000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E9E95600006600006500006600007C2525791F1F791F1F791F1F791F1F
          791F1F6A0808FFFFFFFFFFFFAE78785C0000660000660000660000540000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF540000660000660000600000863535FFFFFFFF
          FFFF6E0D0D6300006600006600006600005A0000934B4BF1E8E8FEFDFDFFFFFF
          C097975B00006600006600005A0000C7A0A0FFFFFFD3B6B64600005E00006500
          006701017C2525791F1F791F1F7A22227315156300006600006000008E4343FF
          FFFFFFFFFFF6F1F15500006600006600006600006300007010107A2222791F1F
          791F1F791F1F791F1F7418189A5757FFFFFFFFFFFF6804046300006600006500
          006400007C2525791F1F791F1F791F1F791F1F791F1F781E1E701212FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E9560000
          660000660000650000620000620000620000620000620000620000500000FFFF
          FFFFFFFFAE78785C0000660000660000660000540000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF540000660000660000600000863535FFFFFFFFFFFF6E0D0D630000
          660000660000610000853434FFFFFFFFFFFFFFFFFFFFFFFFC097975B00006600
          006600005A0000C7A0A0FFFFFFFFFFFFFFFFFFA367675C000065000062000062
          0000620000620000630000660000660000570000924A4AFFFFFFFFFFFFF6F1F1
          5500006600006600006600006600006300006200006200006200006200006200
          005C0000883939FFFFFFFFFFFF68040463000066000066000065000062000062
          0000620000620000620000620000610000560000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E95600006600006600006600
          00660000660000660000660000660000660000540000FFFFFFFFFFFFAE78785C
          0000660000660000660000540000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000
          660000660000600000863535FFFFFFFFFFFF6E0D0D6300006600006600006100
          00812C2CFFFFFFFFFFFFFFFFFFFFFFFFC097975B00006600006600005A0000C7
          A0A0FFFFFFFFFFFFFFFFFFC9A7A7680505640000660000660000660000660000
          6600006600005E0000A06060BE9292FFFFFFFFFFFFF6F1F15500006600006600
          006600006600006600006600006600006600006600006600006000008B3D3DFF
          FFFFFFFFFF680404630000660000660000660000660000660000660000660000
          6600006600006500005A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFE4E446000056000056000056000056000056000056
          0000560000560000560000440000FFFFFFFFFFFFA66B6B4D0000560000560000
          560000450000FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF4500005600005600005100
          007A2222FFFFFFFFFFFF610000530000560000560000520000751818FFFFFFFF
          FFFFFFFFFFFFFFFFBA8D8D4B00005600005600004B0000C19696FFFFFFFFFFFF
          FFFFFFFFFFFF7113135200005C00006600006600005700005600005600004400
          00FFFFFFFFFFFFFFFFFFFFFFFFF4EEEE46000056000056000056000056000056
          0000560000560000560000560000560000510000802B2BFFFFFFFFFFFF5A0000
          5400005600005600005600005600005600005600005600005600005600005500
          004B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFDE8D9D9EBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDF
          EBDFDFE8D9D9FFFFFFFFFFFFF4EEEEEADCDCEBDFDFEBDFDFEBDFDFE8D9D9FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE8D9D9EBDFDFEBDFDFEADDDDEFE4E4FFFFFFFF
          FFFFEBDFDFEBDEDEEBDFDFEBDFDFEADDDDEEE3E3FFFFFFFFFFFFFFFFFFFFFFFF
          F7F2F2E9DBDBEBDFDFEBDFDFE9DBDBF8F3F3FFFFFFFFFFFFFFFFFFFFFFFFEDE2
          E2F0E7E7B58484490000430000F6F0F0ECDFDFEBDFDFE8D8D8FFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFFE8D9D9EBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDF
          EBDFDFEBDFDFEBDFDFEADDDDEFE5E5FFFFFFFFFFFFEBDDDDEBDEDEEBDFDFEBDF
          DFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDEDEE9DADAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF4F4E4F1
          F1E5F2F2E5F2F2E0EFEFFFFFFFF9FCFCE1F0F0E5F2F2E5F2F2E2F1F1F2F8F8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F6F1F1E9DBDBEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFE8D9
          D9FFFFFFFFFFFFF2EAEAEADCDCEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEBDFDFEB
          DFDFE8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE1F0F0E5F2F2E5F2F2E3F1F1EBF5F5FFFFFFEAF4
          F4E4F1F1E5F2F2E5F2F2E0EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FA6A6178B8B1E8E8E1E8E8E07
          8383FFFFFFC5E1E10C86861E8E8E1E8E8E1188888DC5C5FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB483834C00005600
          00560000560000560000560000560000560000560000460000FFFFFFFFFFFF94
          4E4E4F0000560000560000560000560000560000560000560000440000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF5FAFA0883831E8E8E1E8E8E168A8A5AADADFFFFFF56AAAA178B8B1E8E8E1E
          8E8E078383F9FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          9926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B9595
          68B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95
          953399993399991B8D8DFFFFFFCBE4E421909033999933999926929297CACAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1
          B12B95953399993399991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B
          8D8DFFFFFFCBE4E421909033999933999926929297CACAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF8FBFB1C8D8D3399993399992B959568B4B4FFFFFF64B1B12B959533999933
          99991C8D8DFBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E4
          21909033999933999926929297CACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB1C8D8D33
          99993399992B959568B4B4FFFFFF64B1B12B95953399993399991C8D8DFBFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5EAEAE2C95953399993399991B8D8DFFFFFFCBE4E42190903399993399
          992692929ACBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFD1C8D8D3399993399992A9494
          64B2B2FFFFFF64B1B12B95953399993399991C8D8DFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60AFAF2C95
          953399992D9696118888FFFFFFC8E3E3178B8B28939332989828939387C2C2FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDCEDED208F8F3399993298982B959580C0C0FFFFFF5DAE
          AE2A9494339999339999208F8FDFEFEFEFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD5D5B2D8D8B2D8D8B2D8D8B2D8
          D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8BDDEDE4EA6A62E96962D96965BADAD76
          BABAFFFFFFDEEEEE74B9B988C3C33298983298981E8E8E8AC4C4B7DBDBB2D8D8
          B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8AFD7D7C9EEEEC392925B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          E6F3F3ACD5D5B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8C0DF
          DF1E8E8E319898339999309797389C9CFFFFFFFFFFFFA7D3D32D969632989833
          99993399991C8D8D41A0A0BDDEDEB2D8D8B2D8D8B2D8D8B2D8D8B2D8D8B2D8D8
          B2D8D8ABD5D5E7F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF12888822909023919123919123919123919123919123
          91912391912391912391912E9696208F8F1188889CCDCDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF2391913097973399992893932391912391912391912391912391
          912391912391912391911D8E8E57B5B5CE98985B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFB5DBDB1389892391
          9123919123919123919123919123919123919123919123919131989833999928
          93931B8D8D249292FFFFFFFFFFFFFFFFFF2190901C8D8D1E8E8E2C9595339999
          2E9696239191239191239191239191239191239191239191239191138989B9DC
          DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1C8D8D2D96962D96962D96962D96962D96962D96962D96962D96962D9696
          2D96961A8C8CEAF4F4E4F1F1F2F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F0
          F01B8D8D2D96962D96962D96962D96962D96962D96962D96962D96962D96962D
          96962793935FB9B9CE98985B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFB9DDDD1D8E8E2D96962D96962D96962D
          96962D96962D96962D96962D96962D96962D96962391918EC6C6EEF6F6E4F1F1
          FFFFFFFFFFFFFFFFFFE3F1F1E4F1F1F3F9F95EAFAF2793932D96962D96962D96
          962D96962D96962D96962D96962D96962D96961D8E8EBCDDDDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E9E9E4BA5A5
          4CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A5399C9CFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A9C9C4CA5A54C
          A5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A54CA5A547A3A378C5C5
          CB96965B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFC3E2E23F9F9F4CA5A54CA5A54CA5A54CA5A54CA5A54CA5A5
          4CA5A54CA5A54CA5A54CA5A541A0A0ACD5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF7DBEBE46A2A24CA5A54CA5A54CA5A54CA5A54CA5A54C
          A5A54CA5A54CA5A54CA5A53F9F9FC5E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFADD6D642A0A04CA5A54CA5A54CA5A54AA4A44DA6
          A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3A9C9C4CA5A54CA5A546A2A280BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFBDDEDE1288882D96962D96962D96962D96962B95952D9696FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EA7A71489892D96962D96962D96
          962D9696279393078383C1DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6E2E221909033
          9999339999339999339999309797329898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF60B0B02B959533999933999933999933999933999921
          9090C9E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6E2E2219090339999339999339999
          339999309797329898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF60B0B02B9595339999339999339999339999339999219090C9E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBDDEDE158A8A3399993399993399993399993097973298
          98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60B0B02B9595
          3399993399993399993399992B9595078383C1DFDFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFA0CFCF269292339999339999339999309797329898FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF59ACAC2290903399993399993399
          992B95956CB5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CC5C517
          8B8B319898339999339999309797269292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF9DCECE7ABCBC2994943399993399991D8E8E59ACACFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6EAEABBDDDD309898319898
          339999249191B1D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF1C8D8D339999259292AFD7D7C6E2E2FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF188C8C178B8B198C8C028080FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFB
          028181198C8C028080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBB8F8F5B0000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          00660000660000660000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BB8F8F5B00006600006600006600006600006600006600006600006500005500
          00FFFFFFFFFFFF9D5E5E5E000066000066000066000066000066000066000066
          0000530000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8F8F5B00006600
          00660000660000660000660000660000660000650000550000FFFFFFFFFFFF9D
          5E5E5E0000660000660000660000660000660000660000660000530000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49D9D5B000066000066000066000066
          0000660000660000660000650000550000FFFFFFFFFFFF9D5E5E5E0000660000
          660000660000660000660000660000660000530000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6E0D0D781F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F
          791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F
          1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F79
          1F1F791F1F7A2222701212630000660000660000660000660000660000660000
          660000650000550000FFFFFFFFFFFF9D5E5E5E00006600006600006600006600
          006600006600006600006200007C2525792020791F1F791F1F791F1F791F1F79
          1F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F
          791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F1F791F
          1F791F1F791F1F791F1F791F1F791F1F791F1F6F0F0FD4B7B7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF540000610000
          6200006200006200006200006200006200006200006200006200006200006200
          0062000062000062000062000062000062000062000062000062000062000062
          0000620000620000620000620000620000620000620000620000620000620000
          6300006600006600006600006600006600006600006600006600006100004D00
          00FFFFFFFFFFFF99565656000066000066000066000066000066000066000066
          0000660000620000620000620000620000620000620000620000620000620000
          6200006200006200006200006200006200006200006200006200006200006200
          0062000062000062000062000062000062000062000062000062000062000062
          0000620000620000620000550000CDACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5700006500006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          006600006600006600006600006600006100008B3D3D985454FFFFFFFFFFFFC2
          9A9AA264645E0000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          660000590000CEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF57000065000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000530000CAA7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF460000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          660000660000660000660000660000660000660000660000660000590000CEAE
          AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF570000650000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600006600006600006100005200005200005200004C0000
          8F4444FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3B6B64600005200005200
          005200005A000066000066000066000066000066000066000066000066000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          00660000660000660000660000660000660000590000CEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5000005D0000
          5E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00
          005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E
          00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E0000
          5E00005E00005900007F2A2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B4B452
          00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E0000
          5E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00
          005E00005E00005E00005E00005E00005E00005E00005E00005E00005E00005E
          00005E00005E00005E0000510000CBA9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9651519F5F5F9F5F5F9F5F5F9F5F
          5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F
          5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F
          9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9C5B
          5BB07B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC6C69853539F5F5F9F5F5F
          9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F
          5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F
          5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F9F5F5F
          9F5F5F975353E0CCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD8BEBE9854549F5F5F9F5F5F9F5F5F9F5F5F9D5B5BAB7373
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BF96965300005E00005E00005E00005E00005A0000751A1AFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE0E0F1E8E8B584845D00006600
          00660000660000660000660000620000490000AD7676FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6803035300005D000066000066000066000066000066
          00006600006600006600004D0000E6D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCACA9F
          5F5F6A0707640000660000660000660000660000660000660000660000660000
          660000560000F6EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D9D96200005C0000640000660000
          6600006600006600006600006600006600006600006600006600006200007418
          18893B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2D1D15500006600006600006600006600006600006600
          00660000660000660000660000660000660000660000600000701111FEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFE3D2D257000066000066000066000066000066000066000066000066000066
          00006600006600006600006600006600005B0000914949FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D2D257000066
          0000660000660000660000660000660000660000660000660000660000660000
          6600006600006600005E00009B5959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D2D2570000660000660000660000
          6600006600006600006600006600006600006600006600006600006600006600
          005E0000995555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2CFCF5300006600006600006600006600006600006600
          00660000660000660000660000660000660000660000650000610000AB7373FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF1E8E87E292961000066000066000066000066000066000066000066000066
          0000660000660000660000660000620000781F1FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49E9E5B
          0000660000660000660000660000660000660000660000660000660000660000
          660000660000620000751A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68686480000620000660000
          6600006600006600006600006600006600006600006600006600006600005300
          00660000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7011116200006600006600006600
          00660000660000660000660000660000660000560000F9F4F4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAD77775C000066000066000066000066000066000066
          0000660000660000660000560000EADBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF440000560000600000660000660000660000660000660000560000
          560000470000E6D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D8D8
          F5EEEE893B3B4D0000520000520000520000430000FBF8F8EBDFDFE8DADAFDFB
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000}
        mmHeight = 29633
        mmLeft = 2117
        mmTop = 529
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label2'
        Caption = 'Perfil de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 136261
        mmTop = 45245
        mmWidth = 37835
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText1'
        DataField = 'PERFINV'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 45245
        mmWidth = 57415
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText64: TppDBText
        UserName = 'DBText32'
        DataField = 'MESANALITICO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3598
        mmLeft = 1588
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText33'
        DataField = 'TOTALDESEMBOLSO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3598
        mmLeft = 19844
        mmTop = 265
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText34'
        DataField = 'TOTALREEMBOLSO'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3598
        mmLeft = 50536
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText35'
        DataField = 'DIFERENCAANALITICA'
        DataPipeline = ppExtrIndivCRISint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndivCRISint'
        mmHeight = 3598
        mmLeft = 81756
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel71: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 281782
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 254530
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape15'
        Brush.Color = 14803425
        Pen.Color = clWhite
        mmHeight = 17198
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 7
      end
      object ppLine15: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 7673
        mmWidth = 283634
        BandType = 7
      end
      object ppLabel72: TppLabel
        UserName = 'Label248'
        Caption = 'Diferença :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 2910
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel76: TppLabel
        UserName = 'lblTotalFuncef1'
        AutoSize = False
        Caption = 'Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel77: TppLabel
        UserName = 'lblTotalReemb1'
        AutoSize = False
        Caption = 'Reembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel78: TppLabel
        UserName = 'Label267'
        Caption = 'Glosa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 8996
        mmWidth = 10848
        BandType = 7
      end
      object lblTotalFuncefCRISint: TppLabel
        UserName = 'lblTotalFuncefCRISint'
        AutoSize = False
        Caption = 'lblTotalFuncefCRISint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 90752
        mmTop = 2910
        mmWidth = 23019
        BandType = 7
      end
      object lblTotalReembCRISint: TppLabel
        UserName = 'lblTotalReembCRISint'
        AutoSize = False
        Caption = 'lblTotalReembCRISint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 141552
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object lblDiferencaCRISint: TppLabel
        UserName = 'lblDiferencaCRISint'
        AutoSize = False
        Caption = 'lblDiferencaCRISint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187855
        mmTop = 2910
        mmWidth = 20373
        BandType = 7
      end
      object lblGlosaCRISint: TppLabel
        UserName = 'lblGlosaCRISint'
        AutoSize = False
        Caption = 'lblGlosaCRISint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187855
        mmTop = 8996
        mmWidth = 20108
        BandType = 7
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryConsTotais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT SUM(VALORDESEMBOLSO) AS VALORDESEMBOLSO'
      
        '       ,SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                   ' +
        '                                              '
      
        '       ,SUM(VALORREEMBOLSO-VALORDESEMBOLSO) AS DIFERENCA        ' +
        '                                              '
      
        ' FROM                                                           ' +
        '                                              '
      
        ' (                                                              ' +
        '                                              '
      
        ' (                                                              ' +
        '                                              '
      
        ' SELECT                                                         ' +
        '                                              '
      
        '    SUM(DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPRO' +
        'VENTO)) AS  VALORDESEMBOLSO                   '
      
        '   ,0 AS VALORREEMBOLSO                                         ' +
        '                                              '
      
        ' FROM                                                           ' +
        '                                              '
      
        '   HISTRUBSAL H, PROVDESC P,  INFORME I,                        ' +
        '                                              '
      
        '   (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA,                   ' +
        '                                              '
      '   (SELECT'
      
        '      SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,' +
        '0)) AS VALOR                                  '
      
        '    FROM                                                        ' +
        '                                              '
      
        '      HISTRUBSAL H, INFORME I, PROVDESC P,                      ' +
        '                                              '
      
        '      (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA                 ' +
        '                                              '
      
        '    WHERE                                                       ' +
        '                                              '
      
        '      (H.IDPESSJUR = :IDPESSJUR)     AND                        ' +
        '                                              '
      
        '      (H.IDPESSOA  = :IDPESSOA)      AND                        ' +
        '                                              '
      
        '      ((H.MESCOMPREEM >= :MESCOB)     AND                       ' +
        '                                              '
      
        '       (H.MESCOMPREEM <= :MESCOBFIM))     AND                   ' +
        '                                              '
      
        '      ( ( (H.NUMPROCINSS = :pNUMPROCINSS) AND (H.IDMODULO=18) ) ' +
        'OR                                            '
      
        '        ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ) )AND    ' +
        '                                              '
      
        '        (H.IDMODULO IN (18,21))      AND                        ' +
        '                                              '
      
        '      (H.IDRUBRICA = P.IDPROVENTO) AND                          ' +
        '                                              '
      
        '      (H.IDRUBRICA <> PA.IDRUBIRRFINSS) AND                     ' +
        '                                              '
      
        '      ( (H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL) ) AND      ' +
        '                                              '
      
        '      ( (H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AN' +
        'D (H.IDMODULO=21)  AND                        '
      
        '        (P.CODFONTEPAGADORA = 2) ) )                            ' +
        '                                              '
      
        '   AND (H.IDINFORME = I.IDINFORME(+))                           ' +
        '                                              '
      
        '   AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )     ' +
        '                                              '
      
        '   AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL' +
        ') )                                           '
      
        '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                           ' +
        '                                              '
      
        '         ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC ' +
        'NOT LIKE '#39'%33404'#39') ) )'
      
        '    AND ( (0 = :pFILTRAR_RUB_DESEMBOLSO) OR (P.IDPROVENTO IN (:p' +
        'LISTA_RUB_DESEMBOLSO) )  )                    '
      
        '   ) TOTAL                                                      ' +
        '                                              '
      
        ' WHERE                                                          ' +
        '                                              '
      
        '   (H.IDPESSJUR = :IDPESSJUR)      AND                          ' +
        '                                              '
      
        '   (H.IDPESSOA  = :IDPESSOA)       AND                          ' +
        '                                              '
      
        '   ((H.MESCOMPREEM >= :MESCOB)     AND                          ' +
        '                                              '
      
        '    (H.MESCOMPREEM <= :MESCOBFIM)) AND                          ' +
        '                                              '
      
        '   ( ( (H.NUMPROCINSS = :pNUMPROCINSS) AND (H.IDMODULO=18) ) OR ' +
        '                                              '
      
        '     ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND        ' +
        '                                              '
      
        '   (H.IDMODULO IN (18,21))            AND                       ' +
        '                                              '
      
        '   (H.IDRUBRICA = P.IDPROVENTO)       AND                       ' +
        '                                              '
      
        '   (H.IDRUBRICA <> PA.IDRUBIRRFINSS)  AND                       ' +
        '                                              '
      
        '   ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND           ' +
        '                                              '
      
        '   ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H' +
        '.IDMODULO=21) AND                             '
      
        '   (P.CODFONTEPAGADORA = 2) ) )                                 ' +
        '                                              '
      
        '   AND (H.IDINFORME = I.IDINFORME(+))                           ' +
        '                                              '
      
        '   AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )     ' +
        '                                              '
      
        '   AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL' +
        ') )                                           '
      
        '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                           ' +
        '                                              '
      
        '         ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC ' +
        'NOT LIKE '#39'%33404'#39') ) )'
      
        '    AND ( (0 = :pFILTRAR_RUB_DESEMBOLSO) OR (P.IDPROVENTO IN (:p' +
        'LISTA_RUB_DESEMBOLSO) )  )                    '
      
        ' )                                                              ' +
        '                                              '
      
        ' UNION ALL                                                      ' +
        '                                              '
      
        ' (                                                              ' +
        '                                              '
      
        ' SELECT 0 AS VALORDESEMBOLSO                                    ' +
        '                                              '
      
        '       ,SUM(VALOR) as VALORREEMBOLSO                            ' +
        '                                              '
      
        ' FROM                                                           ' +
        '                                              '
      
        ' (                                                              ' +
        '                                              '
      
        ' SELECT DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS' +
        ' VALOR                                        '
      
        ' FROM                                                           ' +
        '                                              '
      
        '    DETCONCINSS      D,                                         ' +
        '                                              '
      
        '    PROVDESC         P                                          ' +
        '                                              '
      
        ' WHERE                                                          ' +
        '                                              '
      
        '        (D.NUMPROCINSS = :pNUMPROCINSS)                         ' +
        '                                              '
      
        '    AND ( D.MESCOBRANCA >= :MESCOB )                            ' +
        '                                              '
      
        '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                         ' +
        '                                              '
      
        '    AND (D.IDRUBRICA       = P.IDPROVENTO)                      ' +
        '                                              '
      
        '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'3'#39') AND (SUBSTR(D.RUBR' +
        'ICAINSS, 2, 1) <> '#39'9'#39'))'
      
        '    AND (D.FLGMANUAL      <> 4)                                 ' +
        '                                              '
      
        '    AND (D.FLGMANUAL      <> 1)                                 ' +
        '                                              '
      
        '    AND (D.FLGMANUAL      <> 2)                                 ' +
        '                                              '
      
        '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR               ' +
        '                                              '
      
        '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN' +
        ' (6, 14, 99) ) )  )                           '
      
        '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                          ' +
        '                                              '
      
        '          ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC' +
        ' NOT LIKE '#39'%33404'#39') ) )'
      
        ' UNION ALL                                                      ' +
        '                                              '
      
        ' SELECT DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0' +
        ') AS VALOR                                    '
      
        ' FROM                                                           ' +
        '                                              '
      
        '    TEMPCONCINSS T                                              ' +
        '                                              '
      
        '   ,PROVDESC P                                                  ' +
        '                                              '
      
        ' WHERE                                                          ' +
        '                                              '
      
        '        T.NUMPROCINSS = :pNUMPROCINSS                           ' +
        '                                              '
      
        '    AND ( T.MESPROCESSAMENTO >= :MESCOB )                       ' +
        '                                              '
      
        '    AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )                    ' +
        '                                              '
      
        '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                  ' +
        '                                              '
      
        '    AND T.FLGMANUAL <> 4                                        ' +
        '                                              '
      
        '    AND T.FLGMANUAL <> 1                                        ' +
        '                                              '
      
        '    AND T.FLGMANUAL <> 2                                        ' +
        '                                              '
      
        '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                          ' +
        '                                              '
      
        '          ( (P.CODPROVDESC NOT LIKE '#39'%30404'#39') AND (P.CODPROVDESC' +
        ' NOT LIKE '#39'%33404'#39') ) )'
      ' )'
      
        ' )                                                              ' +
        '                                              '
      
        ' )                                                              ' +
        '                                              '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 393
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFILTRAR_RUB_DESEMBOLSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pLISTA_RUB_DESEMBOLSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFILTRAR_RUB_DESEMBOLSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pLISTA_RUB_DESEMBOLSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pAPENAS_REEMBOLSO_PARA_FUNCEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end>
  end
  object dsConsTotais: TwwDataSource
    DataSet = qryConsTotais
    OnDataChange = dsConsAnaliticaDataChange
    Left = 440
    Top = 296
  end
  object qryConsGlosa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT SUM(VALORGLOSA) AS VALORGLOSA'
      
        ' FROM                                                           ' +
        '                                              '
      
        ' (                                                              ' +
        '                                              '
      ' SELECT '
      '      CASE'
      
        '          WHEN SUBSTR(D.RUBRICAINSS,1,2) in ('#39'91'#39','#39'30'#39') THEN D.V' +
        'ALORINSS * -1'
      '          ELSE D.VALORINSS'
      '      END AS VALORGLOSA'
      
        ' FROM                                                           ' +
        '                                              '
      
        '    DETCONCINSS      D                                          ' +
        '                                              '
      
        '   ,PROVDESC         P                                          ' +
        '                                              '
      
        ' WHERE                                                          ' +
        '                                              '
      '        (D.NUMPROCINSS = :pNUMPROCINSS)'
      '    AND (D.IDRUBRICA   = P.IDPROVENTO)'
      '    AND ( D.MESCOBRANCA >= :MESCOB )'
      '    AND ( D.MESCOBRANCA <= :MESCOBFIM )'
      
        '    AND ((SUBSTR(D.RUBRICAINSS,1,1) in '#39'9'#39') or D.RUBRICAINSS in ' +
        '('#39'3093'#39','#39'1093'#39'))'
      '    AND (SUBSTR(D.RUBRICAINSS,2,1) not in ('#39'9'#39','#39'3'#39') )'
      
        '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR               ' +
        '                                              '
      
        '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN' +
        ' (6, 14, 99) ) )  )                           '
      
        '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                          ' +
        '                                              '
      
        '          ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTUR' +
        'AXRUBRICA ER '
      'WHERE ER.IDESTRUTURA = 47)) )'
      
        ' UNION ALL                                                      ' +
        '                                              '
      ' SELECT'
      '      CASE'
      
        '          WHEN SUBSTR(T.CODRUBRICA1,1,2) in ('#39'91'#39','#39'30'#39') THEN T.V' +
        'LRRUBRICA1 * -1'
      '          ELSE T.VLRRUBRICA1'
      '      END AS VALORGLOSA'
      
        ' FROM                                                           ' +
        '                                              '
      
        '    TEMPCONCINSS T                                              ' +
        '                                              '
      
        '   ,PROVDESC         P                                          ' +
        '                                              '
      
        ' WHERE                                                          ' +
        '                                              '
      
        '        T.NUMPROCINSS = :pNUMPROCINSS                           ' +
        '                                              '
      '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC'
      '    AND ( T.MESPROCESSAMENTO >= :MESCOB )'
      '    AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )'
      '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR '
      
        '          ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTU' +
        'RAXRUBRICA ER '
      'WHERE ER.IDESTRUTURA = 47)) )'
      ')'
      '')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 394
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pAPENAS_REEMBOLSO_PARA_FUNCEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pINIBIR_RUBRICA_PA'
        ParamType = ptUnknown
      end>
  end
end
