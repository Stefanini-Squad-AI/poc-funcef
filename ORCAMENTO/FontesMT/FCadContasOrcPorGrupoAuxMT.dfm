inherited frmCadContasOrcPorGrupoAuxMT: TfrmCadContasOrcPorGrupoAuxMT
  Left = 272
  Top = 70
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Contas Orçamentárias Por Grupo'
  ClientHeight = 491
  ClientWidth = 695
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 695
    Height = 452
    object pgcCompo: TPageControl
      Left = 1
      Top = 1
      Width = 693
      Height = 275
      ActivePage = tbsAtividade
      Align = alClient
      TabOrder = 0
      object tbsCentroCusto: TTabSheet
        Tag = 1
        Caption = 'Centro de Custo'
        ImageIndex = 1
        object lblRotuloCentroCusto: TLabel
          Left = 16
          Top = 212
          Width = 163
          Height = 13
          Caption = '(*) Centro de Custo Sintético'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ltvCCDisponiveis: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 247
          Align = alLeft
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvCCSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Codigo'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar1: TToolBar
          Left = 327
          Top = 55
          Width = 30
          Height = 128
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object btnCCDisponiveis: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object btnCCSelecionados: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object btnCCDisponiveisTodos: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object btnCCSelecionadosTodos: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object BtnCCRefresh: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
      object tbsAtividade: TTabSheet
        Tag = 2
        Caption = 'Atividade/Projeto'
        ImageIndex = 2
        object ltvAPDisponiveis: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 249
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvAPSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar2: TToolBar
          Left = 328
          Top = 55
          Width = 33
          Height = 137
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object btnAPDisponiveis: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object btnAPSelecionados: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object btnAPDisponiveisTodos: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object btnAPSelecionadosTodos: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object btnAPRefresh: TToolButton
            Left = 2
            Top = 98
            Caption = 'ToolButton5'
            ImageIndex = 4
            OnClick = btnAPRefreshClick
          end
        end
      end
      object tbsPlanoPrev: TTabSheet
        Tag = 3
        Caption = 'Plano Previdenciário'
        ImageIndex = 3
        object ltvPPDisponiveis: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 247
          Align = alLeft
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvPPSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar3: TToolBar
          Left = 330
          Top = 55
          Width = 30
          Height = 128
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object btnPPDisponiveis: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object btnPPSelecionados: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object btnPPDisponiveisTodos: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object btnPPSelecionadosTodos: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object btnPPRefresh: TToolButton
            Left = 2
            Top = 98
            Caption = 'ToolButton5'
            ImageIndex = 4
            OnClick = btnPPRefreshClick
          end
        end
      end
      object tbsPatro: TTabSheet
        Tag = 4
        Caption = 'Patrocinadora'
        ImageIndex = 4
        object ltvPTDisponiveis: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 247
          Align = alLeft
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvPTSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar4: TToolBar
          Left = 330
          Top = 55
          Width = 30
          Height = 128
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object btnPTDisponiveis: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object btnPTSelecionados: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object btnPTDisponiveisTodos: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object btnPTSelecionadosTodos: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object btnPTRefresh: TToolButton
            Left = 2
            Top = 98
            Caption = 'ToolButton5'
            ImageIndex = 4
            OnClick = btnPTRefreshClick
          end
        end
      end
      object tbsPrograma: TTabSheet
        Caption = 'Programa'
        ImageIndex = 4
        object ltvProgramaDisponivel: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 247
          Align = alLeft
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvProgramaSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar5: TToolBar
          Left = 328
          Top = 55
          Width = 33
          Height = 128
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object ToolButton1: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object ToolButton2: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object ToolButton3: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object ToolButton4: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object ToolButton5: TToolButton
            Left = 2
            Top = 98
            Caption = 'ToolButton5'
            ImageIndex = 4
            OnClick = btnPTRefreshClick
          end
        end
      end
      object tbsTipoDespesa: TTabSheet
        Caption = 'Tipo de Despesa'
        ImageIndex = 5
        object ltvTipoDespesaDisponivel: TListView
          Left = 0
          Top = 0
          Width = 320
          Height = 247
          Align = alLeft
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ltvDisponiveisDblClick
        end
        object ltvTipoDespesaSelecionados: TListView
          Left = 365
          Top = 0
          Width = 320
          Height = 247
          Align = alRight
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end
            item
              Caption = 'Código'
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = ltvSelecionadosDblClick
        end
        object ToolBar6: TToolBar
          Left = 328
          Top = 55
          Width = 33
          Height = 128
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object ToolButton6: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
            OnClick = DisponiveisClick
          end
          object ToolButton7: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
            OnClick = SelecionadosClick
          end
          object ToolButton8: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            OnClick = DisponiveisTodosClick
          end
          object ToolButton9: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
            OnClick = SelecionadosTodosClick
          end
          object ToolButton10: TToolButton
            Left = 2
            Top = 98
            Caption = 'ToolButton5'
            ImageIndex = 4
            OnClick = btnPTRefreshClick
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 276
      Width = 693
      Height = 175
      Align = alBottom
      TabOrder = 1
      object Label1: TLabel
        Left = 80
        Top = 132
        Width = 227
        Height = 13
        Caption = 'Caminho para criação do arquivo de log'
      end
      object GroupBox1: TGroupBox
        Left = 80
        Top = 7
        Width = 537
        Height = 96
        Caption = ' Substituir na Composição das Contas Orçamentárias: '
        TabOrder = 0
        object chkCC: TCheckBox
          Left = 16
          Top = 20
          Width = 233
          Height = 17
          Caption = 'Centro de Custo'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkAP: TCheckBox
          Left = 16
          Top = 47
          Width = 233
          Height = 17
          Caption = 'Atividade / Projeto'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkPP: TCheckBox
          Left = 264
          Top = 20
          Width = 257
          Height = 17
          Caption = 'Plano Previdenciário (Entidade Contábil)'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chkPT: TCheckBox
          Left = 264
          Top = 47
          Width = 257
          Height = 17
          Caption = 'Patrocinadora'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object chkTipoDespesa: TCheckBox
          Left = 264
          Top = 71
          Width = 233
          Height = 17
          Caption = 'Tipo de Despesa'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object chkPrograma: TCheckBox
          Left = 16
          Top = 71
          Width = 233
          Height = 17
          Caption = 'Programa'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
      end
      object pnlPasta: TPanel
        Left = 80
        Top = 146
        Width = 461
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'C:\'
        Color = clCaptionText
        TabOrder = 1
        object lblDiretorio: TLabel
          Left = 588
          Top = 22
          Width = 19
          Height = 13
          Caption = 'C:\'
          Visible = False
        end
      end
      object btnEscolheDir: TBitBtn
        Left = 541
        Top = 145
        Width = 27
        Height = 24
        Hint = 'Seleciona a Pasta para gravação do arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnEscolheDirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
          333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
          300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
          333337F373F773333333303330033333333337F3377333333333303333333333
          333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
          333337777F337F33333330330BB00333333337F373F773333333303330033333
          333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
          333377777F77377733330BBB0333333333337F337F33333333330BB003333333
          333373F773333333333330033333333333333773333333333333}
        NumGlyphs = 2
      end
      object btnTemp: TBitBtn
        Left = 568
        Top = 145
        Width = 51
        Height = 24
        Hint = 'Seleciona a Pasta temporária do Sistema'
        Caption = 'Temp...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnTempClick
        NumGlyphs = 2
      end
      object chkAnaliseContaOrcamen: TCheckBox
        Left = 79
        Top = 109
        Width = 550
        Height = 17
        Caption = 
          'Visualizar análise de códigos de contas orçamentárias gerados à ' +
          'partir desta parametrização'
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 452
    Width = 695
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 166
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 83
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 83
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 85
        Width = 22
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 972
    Top = 7
    TargetsData = (
      1
      3
      (
        ''
        'Items'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object ImlPadrao: TImageList
    Left = 912
    Top = 55
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
  object imgBotoes: TImageList
    AllocBy = 8
    Left = 913
    Top = 7
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000031636300000000000000000000000000000000003163
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300844200008442000084420000844200006B3100006B31
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FF840000FF840000FF840000FF84000000000000844200008442
      00006B3100003163630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF840000FF8400000000000084420000844200008442
      0000844200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031630000316300003163000031630000000000844200006B3100008442
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084420000844200006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300000000000000000000000000844200006B3100006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FF840000844200000000000000000000844200006B3100006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF8400008442000000000000844200006B3100006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000316300FF84
      0000FF840000FF840000FF840000FF84000084420000000000006B3100006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000316300FFFF0000FFFF
      0000FF840000FF840000FF840000FF840000FFFF0000FFFF0000000000006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000316300003163000031
      6300FF840000FF840000FF840000FF8400000000000000000000000000006B31
      00006B3100006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF840000FF84000000000000630000006B3100006300
      00006B3100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FFFF0000FF840000FF840000FF84000000000000630000006B31
      00006B3100003163630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300FFFF0000FFFF0000FFFF0000FFFF0000000000006B31
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000316300003163000031630000316300003163003163
      6300000000000000000000000000000000000000000000000000000000000000
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
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      000084840000848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000FFFFFF008484
      00008484000000000000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF008484000084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000848400008484000084840000FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484000084840000000000000000000084848400FFFF000084840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF008484000084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000848400008484000084840000FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF008484
      0000848400008484000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      000084840000848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000FFFFFF008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      000084840000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC0F000000000000F807000000000000
      F003000000000000E003000000000000F081000000000000FF81000000000000
      F981000000000000F081000000000000E001000000000000C001000000000000
      80010000000000008001000000000000E003000000000000F003000000000000
      F807000000000000FC0F000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00780038003800380038003800380038003
      0001000100010001000100010001000100010001000100010001000100010001
      000100010001000180038003800380038003800380038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object CdsCentroDeCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 16
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 64
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 112
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 160
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Pesquisa de Conta Orçamentária'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Conta Orçamentária'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '100')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 973
    Top = 55
  end
  object sqlCodigo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   TAMCOD1,'
      '   TAMCOD2,'
      '   TAMCOD3,'
      '   TAMCOD4,'
      '   TAMCOD5,'
      '   TAMCOD7,'
      '   TAMCOD8,'
      '   FLGTIPOCOD1,'
      '   FLGTIPOCOD2,'
      '   FLGTIPOCOD3,'
      '   FLGTIPOCOD4,'
      '   FLGTIPOCOD5,'
      '   FLGTIPOCOD7,'
      '   FLGTIPOCOD8'
      'FROM'
      '   PARAMORCAMENTO'
      'WHERE'
      '   IDPESSOA =:PIDPESSOA')
    ClientDataSet = cdsCodigo
    Left = 592
    Top = 360
  end
  object cdsCodigo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 360
    Data = {
      AF0000009619E0BD01000000180000000300010000000300000099000E494443
      4F4E54414F5243414D454E01004900000001000557494454480200020019000E
      4944475255504F4F5243414D454E08000400000000000B434F44475255504F4F
      524301004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000100044C4349440400010009080000000002
      2D310000000000001840083532313130333031}
  end
  object cdsCCSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 16
  end
  object cdsAPSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 64
  end
  object cdsPPSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 112
  end
  object cdsPTSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 160
  end
  object cdsCampoSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 208
  end
  object sqlCampo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   '#39'   '#39' AS CAMPO'
      'FROM'
      '   DUAL'
      'WHERE'
      '   1 = 2')
    ClientDataSet = cdsCampoSel
    Left = 592
    Top = 208
  end
  object cdsParamOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 256
  end
  object sqlContaOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   COR.IDCONTAORCAMEN,'
      '   COR.IDGRUPOORCAMEN,'
      '   GOR.CODGRUPOORC'
      'FROM'
      '   CONTASORCAMEN COR,'
      '   GRUPOORCAMEN  GOR'
      'WHERE'
      '       COR.IDPESSOA       =:PIDPESSOA'
      '   AND COR.IDCONTAORCAMEN =:PIDCONTAORCAMEN'
      '   AND COR.IDPLANOORCAMEN =:PIDPLANOORCAMEN'
      '   AND COR.IDGRUPOORCAMEN = GOR.IDGRUPOORCAMEN')
    ClientDataSet = cdsContaOrc
    Left = 592
    Top = 304
  end
  object cdsContaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 304
  end
  object CmeCadastro: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    OpenDsAutomatico = False
    Left = 912
    Top = 104
  end
  object dlgCaminho: TProcuraDirDlg
    Caption = 'Seleção de Caminho'
    Directory = 
      'uCmSqlParams,Db,Db,Db,Db,Db,Db,wwdblook,wwdblook,CMDBLookupCombo' +
      ',StdCtrls,DBCtrls,StdCtrls,ExtCtrls,DBCtrls,wwdbedit,wwdbedit,ww' +
      'dbedit,Buttons,StdCtrls,Mask,DBCtrls,StdCtrls,StdCtrls,ComCtrls,' +
      'ComCtrls,MontaSelect,Db,DBClient,uCMClientDataSet,CmEventosCadas' +
      'tro,'
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 393
    Top = 346
  end
  object qryAux: TQuery
    DatabaseName = 'BASEDADOS'
    Left = 429
    Top = 345
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 293
    Top = 249
  end
  object cdsProgramaSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 313
  end
  object cdsTipoDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 257
  end
  object cdsTipoDespesaSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 312
  end
end
