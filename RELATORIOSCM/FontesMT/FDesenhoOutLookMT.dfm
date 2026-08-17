inherited FrmDesenhoOutLook: TFrmDesenhoOutLook
  Left = 189
  Top = 129
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Área de Trabalho'
  ClientHeight = 475
  ClientWidth = 778
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object LkReports: TfcOutlookBar [0]
    Left = 0
    Top = 0
    Width = 120
    Height = 475
    ActivePage = BtnRelatorios
    Align = alLeft
    Animation.Enabled = True
    Animation.Interval = 1
    Animation.Steps = 7
    AutoBold = False
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ButtonSize = 20
    ButtonClassName = 'TfcShapeBtn'
    Layout = loVertical
    Options = []
    PanelAlignment = paDynamic
    ShowButtons = True
    TabOrder = 0
    object BtnConsultas: TfcShapeBtn
      Left = 0
      Top = 0
      Width = 116
      Height = 20
      Caption = 'Consultas'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 0
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = BtnConsultasClick
    end
    object BtnRelatorios: TfcShapeBtn
      Left = 0
      Top = 20
      Width = 116
      Height = 20
      Caption = 'Relatórios'
      Color = clBtnFace
      DitherColor = clWhite
      Down = True
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 1
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = BtnConsultasClick
    end
    object BtnAssistentes: TfcShapeBtn
      Left = 0
      Top = 431
      Width = 116
      Height = 20
      Caption = 'Assistentes'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 2
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object BtnEtiquetas: TfcShapeBtn
      Left = 0
      Top = 451
      Width = 116
      Height = 20
      Caption = 'Etiquetas'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 6
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 116
      Height = 0
      object OutConsultas: TfcOutlookList
        Left = 0
        Top = 0
        Width = 116
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        Images = ImlWork
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 6
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Cadastro'
            OnClick = OutConsultasItems0Click
          end
          item
            ImageIndex = 7
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Procurar'
            OnClick = OutConsultasItems1Click
          end
          item
            ImageIndex = 8
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Visualizar'
            OnClick = OutConsultasItems2Click
          end
          item
            ImageIndex = 9
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Dic. Dados'
            OnClick = OutConsultasItems3Click
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 40
      Width = 116
      Height = 391
      object OutRelatorios: TfcOutlookList
        Left = 0
        Top = 0
        Width = 116
        Height = 391
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        Images = ImlWork
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 3
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Cadastro'
            OnClick = OutRelatoriosItems0Click
          end
          item
            ImageIndex = 4
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Procurar'
            OnClick = OutRelatoriosItems1Click
          end
          item
            ImageIndex = 5
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Visualizar'
            OnClick = OutRelatoriosItems2Click
          end
          item
            ImageIndex = 13
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Gráficos'
            OnClick = OutRelatoriosItems3Click
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 116
      Height = 0
      object OutAssistentes: TfcOutlookList
        Left = 0
        Top = 0
        Width = 116
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        Images = ImlWork
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 1
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Consultas'
            OnClick = OutAssistentesItems0Click
          end
          item
            ImageIndex = 2
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Exportações'
            OnClick = OutAssistentesItems1Click
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 116
      Height = 0
      object OutEtiquetas: TfcOutlookList
        Left = 0
        Top = 0
        Width = 116
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        Images = ImlWork
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 12
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Configuração'
            OnClick = OutEtiquetasItems0Click
          end
          item
            ImageIndex = 11
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Impressão'
            OnClick = OutEtiquetasItems1Click
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
  end
  object ScrollBox1: TScrollBox [1]
    Left = 120
    Top = 0
    Width = 658
    Height = 475
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object NtbReports: TNotebook
      Left = 0
      Top = 0
      Width = 654
      Height = 471
      Align = alClient
      Color = clWhite
      PageIndex = 4
      ParentColor = False
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Relatorio'
        object LblConsAssoc: TLabel
          Left = 373
          Top = 48
          Width = 116
          Height = 12
          Caption = 'Consulta Associada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblGrupoRelat: TLabel
          Left = 373
          Top = 85
          Width = 182
          Height = 13
          Caption = 'Grupo de Exibição do Relatório:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblDescRelat: TLabel
          Left = 373
          Top = 232
          Width = 137
          Height = 13
          Caption = 'Descrição Do Relatório:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblSisRelat: TLabel
          Left = 373
          Top = 128
          Width = 176
          Height = 13
          Caption = 'Sistema a Vincular o Relatório:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblNomeRelat: TLabel
          Left = 373
          Top = 8
          Width = 37
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DbtNomeRelat: TDBText
          Left = 373
          Top = 23
          Width = 83
          Height = 13
          AutoSize = True
          DataField = 'NOMERELATORIO'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DbtNomeConsRelat: TDBText
          Left = 373
          Top = 63
          Width = 111
          Height = 13
          AutoSize = True
          DataField = 'NOMECONSULTA'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DbtGrupoRelat: TDBText
          Left = 373
          Top = 102
          Width = 85
          Height = 13
          AutoSize = True
          DataField = 'DESCRICAO'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DbtSistRelat: TDBText
          Left = 373
          Top = 145
          Width = 72
          Height = 13
          AutoSize = True
          DataField = 'NOMEMODULO'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 352
          Top = 9
          Width = 4
          Height = 491
          Shape = stRoundRect
        end
        object DbCkbFiltro: TDBCheckBox
          Left = 373
          Top = 173
          Width = 185
          Height = 17
          Caption = 'Exibe Tela de Filtro Padrão'
          DataField = 'FLGFILTROMANUAL'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbmDescRelat: TDBMemo
          Left = 373
          Top = 254
          Width = 271
          Height = 208
          BorderStyle = bsNone
          DataField = 'DESCRIPTION'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object TreeReports: TTreeView
          Left = 0
          Top = 0
          Width = 345
          Height = 471
          Align = alLeft
          BorderStyle = bsNone
          Ctl3D = False
          Images = ImlReports
          Indent = 19
          ParentCtl3D = False
          ReadOnly = True
          StateImages = ImlReports
          TabOrder = 2
          OnChange = TreeReportsChange
        end
        object DBCheckBox1: TDBCheckBox
          Left = 373
          Top = 197
          Width = 185
          Height = 17
          Caption = 'Tem Sub-Relatório'
          DataField = 'FLGSUBREPORT'
          DataSource = DsDadosReports
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Consulta'
        object Nome: TLabel
          Left = 11
          Top = 7
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object LblDescConsulta: TLabel
          Left = 11
          Top = 62
          Width = 58
          Height = 13
          Caption = 'Descricao'
        end
        object LblMemConsulta: TLabel
          Left = 267
          Top = 62
          Width = 50
          Height = 13
          Caption = 'Consulta'
        end
        object EditNome: TwwDBEdit
          Left = 11
          Top = 28
          Width = 636
          Height = 19
          Ctl3D = False
          DataField = 'NAME'
          DataSource = DsDadosConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBMemo2: TDBMemo
          Left = 11
          Top = 81
          Width = 238
          Height = 372
          BorderStyle = bsNone
          DataField = 'DESCRIPTION'
          DataSource = DsDadosConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object DBMemo3: TDBMemo
          Left = 264
          Top = 81
          Width = 381
          Height = 376
          BorderStyle = bsNone
          DataField = 'TEMPLATE'
          DataSource = DsDadosConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Wizzards'
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PreviewConsulta'
        object GridSql: TDBGrid
          Left = 0
          Top = 0
          Width = 654
          Height = 471
          Align = alClient
          DataSource = DsGrid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PreviewRelatórios'
        object PnlPreview: TPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 471
          Align = alClient
          Caption = 'PnlPreview'
          TabOrder = 0
          object ppViewer1: TppViewer
            Left = 1
            Top = 33
            Width = 652
            Height = 437
            Align = alClient
            BevelInner = bvLowered
            BorderStyle = bsSingle
            Ctl3D = False
            PageColor = clWindow
            ParentCtl3D = False
            ZoomPercentage = 100
            ZoomSetting = zsPageWidth
            OnPageChange = ppViewer1PageChange
            OnPrintStateChange = ppViewer1PrintStateChange
            object wwDBGrid2: TwwDBGrid
              Left = 153
              Top = 39
              Width = 320
              Height = 120
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBtnShadow
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object Dock973: TDock97
            Left = 1
            Top = 1
            Width = 652
            Height = 32
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
            object Toolbar972: TToolbar97
              Left = 0
              Top = 0
              Caption = 'Toolbar971'
              DockPos = 0
              TabOrder = 0
              object spbPreview100Percent: TToolbarButton97
                Tag = 1
                Left = 29
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Visualizar Tamanho Natural'
                DisplayMode = dmGlyphOnly
                Caption = '100 %'
                Glyph.Data = {
                  BA030000424DBA03000000000000760000002800000051000000130000000100
                  0400000000004403000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  77777777777777777777777777777777777777777777777777F7F7F7F7F7F7F7
                  F7F7F00000007777777777777777777777777777777777777777777777777777
                  777777777F7F7F7F7F7F7F7F7F7F700000007700000000000000007777700000
                  0000000000077770000000000000000777F00000000000000007F00000007706
                  80FFFFFFFFFFF0777770680FFFFFFFFFFF077770680FFFFFFFFFFF077F700807
                  87878787870F70000000770860FFFFFFFFFFF0777770860FFFFFFFFFFF077770
                  860FFFFFFFFFFF0777F08008787878787807F0000000770680FF000F00000077
                  7770680FF000F00000077770680FF000F00000077F70080780008000000F7000
                  0000770860FF000F000000777770860FF000F00000077770860FF000F0000007
                  77F08008700070000007F0000000770680FFFFFFFFFFF0777770680FFFFFFFFF
                  FF077770680FFFFFFFFFFF077F70080787878787870F70000000770860FFFFFF
                  FFFFF0777770860FFFFFFFFFFF077770860FFFFFFFFFFF0777F0800878787878
                  7807F0000000770680FF000F000000777770680FF000F00000077770680FF000
                  F00000077F70080780008000000F70000000770860FF000F000000777770860F
                  F000F00000077770860FF000F000000777F08008700070000007F00000007706
                  80FFFFFFFFFFF0777770680FFFFFFFFFFF077770680FFFFFFFFFFF077F700807
                  87878787870F70000000770860FFFFFFFFFFF0777770860FFFFFFFFFFF077770
                  860FFFFFFFFFFF0777F08008787878787807F000000077068000000000000077
                  77706800000000000007777068000000000000077F70080000000000000F7000
                  0000770868686868686860777770868686868686860777708686868686868607
                  77F08080808080808007F0000000770686868686868680777770686868686868
                  6807777068686868686868077F70080808080808080F70000000770000000000
                  00000077777000000000000000077770000000000000000777F0000000000000
                  0007F00000007777777777777777777777777777777777777777777777777777
                  777777777F7F7F7F7F7F7F7F7F7F700000007777777777777777777777777777
                  7777777777777777777777777777777777F7F7F7F7F7F7F7F7F7F0000000}
                Layout = blGlyphTop
                NumGlyphs = 4
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = spbPreview100PercentClick
              end
              object spbPreviewWhole: TToolbarButton97
                Tag = 1
                Left = 58
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Visualizar Página Inteira'
                DisplayMode = dmGlyphOnly
                Caption = 'In&teira'
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777770000007777777777777777770000007777777777777777770000007700
                  0000000000077700000070686868686868607700000070868000000086807700
                  0000706860FFFFF0686077000000708680F444F0868077000000706860FFFFF0
                  686077000000708680F44FF0868077000000706860FFFFF06860770000007086
                  80F444F0868077000000706860FFFFF068607700000070868000000086807700
                  0000706868686868686077000000770000000000000777000000777777777777
                  777777000000777777777777777777000000}
                Layout = blGlyphTop
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = spbPreviewWholeClick
              end
              object spbPreviewPrint: TToolbarButton97
                Left = 97
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Imprimir'
                DisplayMode = dmGlyphOnly
                Caption = '&Imprimir'
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
                  22222200000000000222208888888880802200000000000008020888888BBB88
                  0002088888877788080200000000000008800888888888808080200000000008
                  0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
                  022222220FFFFFFFF02222222000000000222222222222222222}
                Layout = blGlyphTop
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = spbPreviewPrintClick
              end
              object ToolbarSep973: TToolbarSep97
                Left = 184
                Top = 0
                Blank = True
                SizeHorz = 10
                SizeVert = 2
              end
              object ToolbarSep974: TToolbarSep97
                Left = 87
                Top = 0
                Blank = True
                SizeHorz = 10
                SizeVert = 3
              end
              object lblRelatPct: TLabel
                Left = 240
                Top = 6
                Width = 10
                Height = 13
                Alignment = taCenter
                Caption = '%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object spbPreviewWidth: TToolbarButton97
                Tag = 1
                Left = 0
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Visualizar Largura da Página'
                DisplayMode = dmGlyphOnly
                Caption = '&Largura'
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777770000007777777777777777770000007777777777777777770000007700
                  0000000000077700000074FFFFFFFFFFFFF07700000074FFFF000000FFF07700
                  000074FFFFFFFFFFFFF07700000074FFFF00000FFFF07700000074FFFFFFFFFF
                  FFF07700000074FF4F0000FF4FF07700000074F44FFFFFFF44F0770000007444
                  44F000F444407700000074F44FFFFFFF44F07700000074FF4F00000F4FF07700
                  000074FFFFFFFFFFFFF077000000770000000000000777000000777777777777
                  777777000000777777777777777777000000}
                Layout = blGlyphTop
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = spbPreviewWidthClick
              end
              object ToolbarSep975: TToolbarSep97
                Left = 250
                Top = 0
                Blank = True
                SizeHorz = 10
                SizeVert = 3
              end
              object SpBtnNextPage: TSpeedButton
                Left = 397
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Próxima página'
                Flat = True
                Glyph.Data = {
                  66010000424D6601000000000000760000002800000014000000140000000100
                  040000000000F000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777777700007FFFFFFFFFFFFFFFFFF700008777777777777777777F00008777
                  777777777777777F00008777777477777777777F00008777777447777777777F
                  00008777777444777777777F00008777777444477777777F0000877777744444
                  7777777F00008777777444444777777F00008777777444447777777F00008777
                  777444477777777F00008777777444777777777F00008777777447777777777F
                  00008777777477777777777F00008777777777777777777F0000877777777777
                  7777777F00007888888888888888888700007777777777777777777700007777
                  77777777777777770000}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                OnClick = SpBtnNextPageClick
              end
              object SpBtnLastPage: TSpeedButton
                Left = 426
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Última página'
                Flat = True
                Glyph.Data = {
                  66010000424D6601000000000000760000002800000014000000140000000100
                  040000000000F000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777777700007FFFFFFFFFFFFFFFFFF700008777777777777777777F00008777
                  777777777777777F00008777747777774477777F00008777744777774477777F
                  00008777744477774477777F00008777744447774477777F0000877774444477
                  4477777F00008777744444474477777F00008777744444774477777F00008777
                  744447774477777F00008777744477774477777F00008777744777774477777F
                  00008777747777774477777F00008777777777777777777F0000877777777777
                  7777777F00007888888888888888888700007777777777777777777700007777
                  77777777777777770000}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                OnClick = SpBtnLastPageClick
              end
              object LblPreviewPage: TLabel
                Left = 260
                Top = 6
                Width = 79
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object SpBtnPriorPage: TSpeedButton
                Left = 368
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Página anterior'
                Flat = True
                Glyph.Data = {
                  66010000424D6601000000000000760000002800000014000000140000000100
                  040000000000F000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777777700007FFFFFFFFFFFFFFFFFF700008777777777777777777F00008777
                  777777777777777F00008777777777774777777F00008777777777744777777F
                  00008777777777444777777F00008777777774444777777F0000877777774444
                  4777777F00008777777444444777777F00008777777744444777777F00008777
                  777774444777777F00008777777777444777777F00008777777777744777777F
                  00008777777777774777777F00008777777777777777777F0000877777777777
                  7777777F00007888888888888888888700007777777777777777777700007777
                  77777777777777770000}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                OnClick = SpBtnPriorPageClick
              end
              object SpBrnFirstPage: TSpeedButton
                Left = 339
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Primeira página'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  66010000424D6601000000000000760000002800000014000000140000000100
                  040000000000F000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  7777777700007FFFFFFFFFFFFFFFFFF700008777777777777777777F00008777
                  777777777777777F00008777774477777747777F00008777774477777447777F
                  00008777774477774447777F00008777774477744447777F0000877777447744
                  4447777F00008777774474444447777F00008777774477444447777F00008777
                  774477744447777F00008777774477774447777F00008777774477777447777F
                  00008777774477777747777F00008777777777777777777F0000877777777777
                  7777777F00007888888888888888888700007777777777777777777700007777
                  77777777777777770000}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpBrnFirstPageClick
              end
              object bbtnAbrir: TToolbarButton97
                Left = 126
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Abrir'
                DisplayMode = dmGlyphOnly
                Caption = 'A&brir'
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  77777777777777777777000000000007777700333333333077770B0333333333
                  07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
                  77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
                  7007777777770777070777777777700077777777777777777777}
                Layout = blGlyphTop
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = bbtnAbrirClick
              end
              object bbtnSalvar: TToolbarButton97
                Left = 155
                Top = 0
                Width = 29
                Height = 26
                Hint = 'Salvar'
                DisplayMode = dmGlyphOnly
                Caption = 'Sal&var'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
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
                Layout = blGlyphTop
                NumGlyphs = 2
                Opaque = False
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = bbtnSalvarClick
              end
              object SpinEdit1: TSpinEdit
                Left = 194
                Top = 2
                Width = 46
                Height = 22
                Color = clYellow
                Increment = 10
                MaxValue = 200
                MinValue = 1
                TabOrder = 0
                Value = 100
                OnChange = SpinEdit1Change
              end
            end
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 498
    Top = 151
    TargetsData = (
      1
      5
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  object MsRelat: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REPORTS.NAME'
      'MODULO.NOMEMODULO'
      'GRUPORELATORIO.DESCRICAO'
      'DATAVIEW.NAME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome Relatório'
      'Sistema'
      'Grupo de Exibição'
      'Consulta Associada')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REPORTS'
      'MODULO'
      'GRUPORELATORIO'
      'DATAVIEW')
    CamposChave.Strings = (
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    Filtro.Strings = (
      'REPORTS.IDDATAVIEW = DATAVIEW.IDDATAVIEW'
      'REPORTS.IDMODULO = MODULO.IDMODULO'
      'REPORTS.IDGRUPORELATORIO = GRUPORELATORIO.IDGRUPORELATORIO'
      'REPORTS.ORIGEMCMDV = DATAVIEW.ORIGEMCMDV'
      'REPORTS.ORIGEMCMGR = GRUPORELATORIO.ORIGEMCMGR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '100'
      '50'
      '60'
      '100')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 609
    Top = 100
  end
  object MsConsulta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'SUBSTR(DATAVIEW.DESCRIPTION,1,200)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 608
    Top = 48
  end
  object svReport: TSaveDialog
    DefaultExt = 'rcm'
    Filter = 
      'Relatorios CM|*.rcm|HTML|*.Htm|Ritch Text Format|*.Rtf|Excel|*.X' +
      'ls|Lotus|*.Wk1|Quatro Pro|*.Wq1|Bitmap|*.Bmp|Jpeg|*.Jpg|CSS2|*.C' +
      'ss|Todos Os Arquivos|*.Rcm;*.Htm;*.Rtf;*.Xls;*.Wk1;*.Wq1;*.Bmp;*' +
      '.Jpg;*.Css'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist]
    Left = 550
    Top = 48
  end
  object opnReport: TOpenDialog
    DefaultExt = 'rcm'
    Filter = 'Relatorios CM|*.rcm|Todos os arquivos|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist]
    Title = 'Abrir relatorios'
    Left = 551
    Top = 100
  end
  object ImlReports: TImageList
    Left = 498
    Top = 100
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF0000000000000000000084840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF000000000000000000000000000084840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00000000000000000000000000000000008484840000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000008484840000000000848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF00000000000000000000000000000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF00000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C600848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFFFF000000000000FF
      FF0000000000000000000000000000000000000000000084840000FFFF008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C6000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF00000000000000000000000000000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000008484840084848400000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000084840000FFFF008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000084848400848484008484840084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000084840000848400008484000084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000C6C6C600FFFF
      FF00FFFFFF00000000000000000000000000000000000084840000FFFF008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000000000FFFF0000848400008484000084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400000000000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000084840000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF000000000000000000000000000084840000FFFF008484
      8400848484000000000000000000000000000000000000000000848484000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF0084848400FFFFFF00C6C6C600848484000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000008484000084
      8400008484000084840084848400C6C6C6000000000000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFEFFC007000FFF3FBC3D8003
      0007FC3FCC3380038003F03FC0038003C001C01FC0078003C001C01FC00F8003
      E001C00FC0078003E001E00FC0038003E003E00700008003E003F003C0038003
      E003F001E0018003E003F803E0038003E003FC0FC0038003F003FE3FCC338003
      F807FFFFBEFDC007FFFFFFFFFEFFF83F00000000000000000000000000000000
      000000000000}
  end
  object ImlWork: TImageList
    Height = 32
    Width = 32
    Left = 497
    Top = 48
    Bitmap = {
      494C01010E000F00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084848400FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000FF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000FF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000FF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF00000000FF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0084848400FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF00000000FF0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      000000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0084848400FFFFFF0084848400FFFFFF00FF00
      0000FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF000000FF
      000000FF000000FF000000FF00000000FF000000FF000000FF00FF000000FF00
      0000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF00000000FF000000FF000000FF000000FF00FF00
      0000FF000000FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF00000000FF000000FF000000FF000000FF00FF00
      0000FF000000FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF
      000000FF000000FF00000000FF000000FF000000FF000000FF000000FF000000
      FF00FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00840000008400
      0000FFFF0000FFFFFF008400000084000000840000008400000084000000FFFF
      FF00848484008484840084848400848484000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF
      000000FF000000FF00000000FF000000FF000000FF000000FF000000FF000000
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008400000084000000FFFF
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84008484840000FF00000000FF000000FF000000FF000000FF00848484008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00840000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000000000000000
      0000008400000084000000840000008400000084000000840000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000FFFFFF000000
      0000000000000000000084848400C6C6C600C6C6C600FFFFFF00FFFFFF000084
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000008400000084000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000FFFFFF000000
      0000C6C6C600FFFFFF0084848400000000000000000000000000FFFFFF000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0084848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000000000000000000000000084000000840000FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000FFFFFF000084
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400008484000084
      84000084840000000000000000000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF0000000000FFFFFF000084
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000FFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000848400C6C6C600FFFFFF00C6C6
      C600FFFFFF0000848400008484000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000FFFFFF000084
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF00000000000000
      000000FFFF0084848400000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000840000FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF0000000000FFFFFF000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000FFFFFF000084
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000000000000FFFF0000FFFF0000848484000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF0000000000FFFFFF000084
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00008484840000000000FFFF0000000000000084840000848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00C6C6C6000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000840000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF000000000000FFFFFF008484840000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000840000FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000FFFF0000FFFF00000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00000000000084848400FFFFFF000000000000FFFF0000FFFF000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400C6C6C600FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF
      00000000000084848400FFFFFF00C6C6C600FFFFFF000000000000FFFF0000FF
      FF00000000000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000084840000848400FFFFFF00C6C6C600FFFF
      FF00C6C6C6000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      00008484840084848400C6C6C600FFFFFF00C6C6C600FFFFFF000000000000FF
      FF0000FFFF000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484
      840084848400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000
      000000FFFF0000FFFF0000000000008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF000000000000848484008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF000000000000FFFF0000FFFF00000000000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000000000008484840084848400C6C6
      C600840000008400000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000000FFFF0000FFFF000000000000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF0084000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF000000000000848484008484840084000000FFFF
      FF0084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000C6C6C600FFFFFF008400000084000000C6C6C600840000008400
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000000000008484840084848400C6C6C60084000000C6C6
      C60084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF000000000000FFFF0000FFFF00000000000000
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000C6C6C600FFFFFF008400000084000000C6C6C600840000008400
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400C6C6C60084000000C6C6C600FFFF
      FF0084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000FFFF0000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000FFFFFF008400
      0000FFFFFF00C6C6C60084000000C6C6C60084000000C6C6C60084000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF00000000
      0000C6C6C6008484840000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00C6C6C60084000000C6C6C600FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      0000FFFFFF00C6C6C60084000000C6C6C60084000000C6C6C60084000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000008400000000000000000000000000000000000000FFFF
      FF00C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00C6C6C60084000000C6C6C600FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084848400848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000008400000084000000C6C6C600C6C6C6008484
      8400C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008484840084848400848484008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000C6C6C600C6C6C60084848400C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000008400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000FFFFFF00C6C6C600FFFF
      FF00C6C6C6008484840084848400FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000008400000084000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00C6C6C600FFFFFF000000
      000000000000FFFFFF0000000000C6C6C600FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0084848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C6000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000084000000C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF0084000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000848400C6C6C600FFFFFF00C6C6C600FFFFFF00008484000084
      84000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000C6C6C600FFFFFF008400000084000000C6C6C600840000008400
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00C6C6C6000000000084000000FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      0000FFFFFF00C6C6C60084000000C6C6C60084000000C6C6C60084000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00000000008484840084000000C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000C6C6C600FFFFFF00C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00C6C6C60084000000C6C6C600FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00C6C6
      C600000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF000000000000848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000C6C6C600C6C6C600FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00000000008400000084000000FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000008484
      840000000000FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000C6C6C600FFFFFF00C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084848400848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600FFFFFF0000000000000000000000000000848400FFFF
      FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000C6C6C600C6C6C600FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000008400000084000000C6C6C600C6C6C6008484
      8400C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000000084848400FFFF
      FF00848484008484840000000000000000000000000000000000000000008484
      8400C6C6C6000000000000000000FFFFFF00FFFFFF00C6C6C600000000000084
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C600008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000C6C6C600FFFFFF00C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF008400000084000000C6C6C600FFFFFF008400000084000000C6C6
      C600840000008400000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000C6C6C600FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF000000
      000084848400000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00C6C6C6000000
      00000084840000848400FFFFFF00C6C6C600FFFFFF00C6C6C600008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF0084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000008484840084848400848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400008484000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0084000000FFFFFF00C6C6C60084000000C6C6C60084000000C6C6
      C60084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000008484840084848400C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000084
      84000000000000000000000000000000000084848400C6C6C600FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000
      0000C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF008400000084000000FFFFFF00C6C6C60084000000C6C6C600FFFF
      FF0084000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000008400000084000000
      84000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000C6C6C600FFFFFF00C6C6C6000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000084000000
      FF000000FF000000FF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00C6C6C60084848400848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00000000008400000084000000FFFFFF00C6C6C60000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C6008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008484
      8400848484008484840084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000000840000008400000084000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000008484
      840000FFFF008400000084000000840000008400000084000000840000008400
      000084000000840000008400000084000000840000008400000084000000C6C6
      C600C6C6C60084848400C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400000084000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF000000000084848400FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF008484
      840000FFFF008484840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000FFFF00000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000C6C6C600FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000C6C6C600FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000
      0000C6C6C600FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000C6C6C6000000000000000000FFFFFF000000000000000000000000000000
      00000000000000FFFF0000848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000C6C6C6000000000000000000FFFFFF000000000000000000000000000000
      00000000000000FFFF0000848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000C6C6C6000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00C6C6C600FFFFFF00C6C6C6008484840084848400FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FFFF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600FFFFFF000000000000000000C6C6C60000000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000000000000000000000000008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF0000000000C6C6
      C600FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF0000000000C6C6
      C600FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF0000000000C6C6
      C600FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C6000000000000000000FFFFFF00C6C6C600FFFFFF00000000008400
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00C6C6C6000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00C6C6C6000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00C6C6C6000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000C6C6C6000000000000000000000000000000
      00000000000000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000C6C6C6000000000000000000000000000000
      00000000000000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C6008484840084848400FFFFFF00C6C6C6000000
      000084000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C60000FFFF0000848400FFFFFF00C6C6
      C60000000000848484000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000848400000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000848400000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF000000000000000000FFFFFF0000000000C6C6C600FFFFFF000000
      0000FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00C6C6C600FFFFFF00C6C6C6008484840084848400FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000084000000C6C6C6000000
      00008484840084000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C60000FFFF000084840000000000FFFFFF0000000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C6000000000000000000FFFFFF00FFFFFF00FFFFFF00000000008400
      0000C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00C6C6C6000000000084000000FFFF
      FF00000000008400000084000000FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000FFFF0000848400FFFFFF00000000008484
      8400FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6
      C600FFFFFF0000000000FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00C6C6C6000000
      000084000000FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000008484
      8400000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF0000000000848484008400
      0000C6C6C6000000000084848400FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C600FFFFFF00C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000
      000084848400840000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000FFFF0000848400C6C6
      C600FFFFFF00C6C6C600000000000000000000000000C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00000000008400
      000084000000FFFFFF00C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000FFFF00000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000FFFF0000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00000000008484840000000000C6C6C600FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C6000000000000FFFF0000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000848484008484840000FF00008484
      8400848484008484840084848400848484008484840084848400000000000000
      00000000000000FFFF0000000000000000000000000000000000000000008484
      84008484840000FF000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF000000
      000084848400FFFFFF0084848400848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF00C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF0084000000FFFFFF00C6C6C600FFFF
      FF00C6C6C60000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000FFFF00000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF000000000084848400C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000C6C6C600FFFFFF008400000084000000C6C6C600840000008400
      000084000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF000000000000FFFF0084848400C6C6C600FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C60084000000FFFFFF0084000000FFFFFF0084000000FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      0000FFFFFF00C6C6C60084000000C6C6C60084000000C6C6C60084000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000084848400848484008484840084848400C6C6C60000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      000084848400FFFFFF000000000084848400848484008484840084848400C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0084848400C6C6
      C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00C6C6C60084000000C6C6C600FFFFFF0084000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000084840000848400008484000084848400C6C6C60000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000084848400FFFFFF000000000000840000008400000084000084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      0000FFFF0000848400008484000084848400C6C6C60000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      000084848400FFFFFF000000000000FF0000008400000084000084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      000084848400FFFFFF00FFFFFF00C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084848400848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000084848400FFFFFF000000000000000000000000000000000000000000C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000FFFF00000000000000000000FFFF00000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000008400000084000000C6C6C600C6C6C6008484
      8400C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFF80000010000000000000000FF00003FF00000010000000000000000
      FE00003FF00000010000000000000000FE00003FF00000010000000000000000
      FE00003FF00000010000000000000000FE00003FF00000010000000000000000
      FE00003FF00000010000000000000000FE00003FF00000010000000000000000
      FE00003FF00000010000000000000000FE00003FF00000010000000000000000
      FE00003FF00000010000000000000000FE00003FE00000010000000000000000
      FE00003FC00000010000000000000000FE00003FC00000010000000000000000
      FE00003FC00000010000000000000000FE00003FC00000010000000000000000
      FE00003FC00000010000000000000000FE00003FC00000010000000000000000
      FE00003FC00000010000000000000000FE00003FC00000030000000000000000
      FE00003FC00000070000000000000000FE00003FC00000070000000000000000
      FE00003FC00000070000000000000000FE00003FC00000070000000000000000
      FE00003FC00000070000000000000000FE00007FC00000070000000000000000
      FE0000FFC00000070000000000000000FE0001FFC00000070000000000000000
      FE0003FFC000000F0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFF3FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE1FFFF8FFFFFFFFFFFFFFFFFFFFFFFFFC1FFFF0007FFFFFFFFFFFFFFFF
      FFFFFF81FFFF0007FFFFFFFFFE0003FFFFFFFF03FFFF0007E000001FFC0001FF
      FFFFFE07FFFE0007C000001FF80001FFFFFF840FFF7C0007C000001FF80001FF
      FFFE001FFF3C0007C000001FF80001FFFFFC003FFC1C0007C000001FF80001FF
      FFF8007FF80C0007C000003FF80003FFFFF8007FF01C0007F00007FFFC0001FF
      FFF0003FE33C0007F0000FFFF80001FFFFF0003FE77C000FF0000FFFF80001FF
      FFF0003FE7FC183FF00007FFF80001FFFFF0003FEFFC1E3FE00000FFF80001FF
      C000007FEFFE3FFFE00000FFF80003FF8000007FFFFF7FFFE00000FFFC0001FF
      800000FFFFFFFFFFE000007FF80000FF800001FFC0001FFFE000003FF800007F
      800001FF80001FFFE000001FF800003F800001FF80001FFFE000000FF800021F
      800001FF80001FFFE0000007F800000F800001FF80001FFFE0000003FC00060F
      800001FF80001FFFE0000001F800020F800001FF80001FFFE0000080F800021F
      800001FF80001FFFE00000C0FC00000F800001FF80001FFFE00000E1FC00010F
      800001FF80001FFFE00000F3FE00009F800001FF80001FFFFFFFFFFFFF00003F
      800003FF80001FFFFFFFFFFFFFFFFFFFFFFFFFFF80003FFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFFFFFF
      FFFFFE7FFFFFFF0FFFFFFFFFFFC00001FFFFF87FFFFFFE0FFFFFFFFFFF800001
      FFFFE07FFFFFFC0FFFFFFFFFFF800001FFFF803FFFFFF81FFFFFFFFFFF800001
      FFFE003FFFFFF03FFF000007FF800001FFFE003FFFFC207FFE000007FF800001
      FFFE001FFFF000FFFE000007FF800001FFFE001FFFE001FFFE000007FF800001
      FFF8000FFFC003FFF0000007FF800001FFF8000FFFC003FFE0000007FF800001
      FFF80007FE0001FFE0000007FF800001FFF80003F80001FFE0000007FF800001
      FFFC0001E00001FFE0000007FF800001FFFC0001E00001FFE0000007FF800001
      FFFC0003E00003FFE0000007FF800003FFBE000FE00003FFE0000007FFFFFFFF
      FF1E0007800007FFE0000007FF7FFFFFFF0F000780000FFFE0000007FE3FFFFF
      FF07000F80003FFFE000000FFE1FFFFFFE03803F80003FFFE000007FFE0FFFFF
      FE01C0FFC0001FFFE000007FFC07FFFFFC00E3FFC0001FFFA000007FFC03FFFF
      F800FFFFC0003FFFC00000FFF801FFFFF00FFFFFE000FFFFF7FFFFFFF001FFFF
      E03FFFFFE0007FFF80FFFFFFE01FFFFFC03FFFFFF0007FFFF7FFFFFFC07FFFFF
      C07FFFFFF000FFFFD5FFFFFF807FFFFFE1FFFFFFF803FFFFB6FFFFFF80FFFFFF
      F3FFFFFFFC0FFFFFFFFFFFFFC3FFFFFFFFFFFFFFFE3FFFFFF7FFFFFFE7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC03FFFFFC03FFFFFC03FFFFFFFFF
      FFFFC00FFFFFC00FFFFFC00FFFFFFFFFFFFFC007FFFFC007FFFFC007FFFFFFFF
      FFFFC001FFFFC001FFFFC001FFFFE7FFFF9FC000FF9FC000FF9FC000FFFF87FF
      FFFFC000FFFFC000FFFFC000FFFE07FFF9FFC000F9FFC000F9FFC000FFF807FF
      FFCFC000FFCFC000FFCFC000FFE003FFFFFFC000FFFFC000FFFFC000FFE003FF
      FCE7C000FCFFC000FCFFC000FFE003FFFF87C300FFCFC300FFCFC300FFE001FF
      FE07C100F9FFC100F9FFC100FF8001FFF803C002FFE7C002FFE7C002FF8000FF
      E003E023FF9FE023FF9FE023FF8000FFE003E073FCFFE073FCFFE073FF80007F
      E001C7FFFFE7C7FFFFE7C7FFFE00003FE0018FFFC00001FFFFFF8FFFFE00001F
      80001FFF800001FFFF9F1FFFFE00003F80003FFF800001FFFFFE3FFFFE0000FF
      80007FFF800001FFFFE47FFFFF00007F80003FFF800001FF8038F007FD00007F
      C0001FFF800001FF0011E003FF0000FFC0001FFF800001FF001BE003ED8003FF
      C0003FFF800001FF801EF003F50001FFE000FFFF800001FF803E7007FDC001FF
      E0007FFF800001FF80303007E00003FFF0007FFF800001FF80301007FDE00FFF
      F000FFFF800001FF80303007F5703FFFF803FFFF800001FF803E7007EDB8FFFF
      FC0FFFFF800001FF803EF007FFFFFFFFFE3FFFFF800003FFC03FF807FDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PpSql: TppBDEPipeline
    DataSource = DsSql
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'PpSql'
    Left = 674
    Top = 99
  end
  object dpDataView: TppBDEPipeline
    UserName = 'dpDataView'
    Left = 674
    Top = 48
  end
  object RptCM: TppReport
    AutoStop = False
    DataPipeline = PpSql
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 674
    Top = 151
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpSql'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object DsGrid: TwwDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 416
    Top = 154
  end
  object DsDadosConsulta: TwwDataSource
    DataSet = CdsDadosConsulta
    Left = 174
    Top = 154
  end
  object DsSql: TwwDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 418
    Top = 205
  end
  object CdsDadosConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 102
  end
  object CdsDadosReports: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 102
  end
  object CdsDataview: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 102
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 102
  end
  object SqlParDadosReports: TCMSqlParams
    SQL.Strings = (
      'Select'
      '    M.NomeModulo, '
      '    R.Name As NomeRelatorio,'
      '    G.Descricao, '
      '    D.Name As NomeConsulta,'
      '    R.FlgFiltroManual, '
      '    R.Description,'
      '    D.Template as DataviewTemplate,'
      '    R.Template As ReportTemplate, '
      '    R.Name,'
      '    R.FLGSubReport'
      'From'
      '    Reports R, '
      '    Modulo M, '
      '    DataView D, '
      '    GrupoRelatorio G'
      'Where'
      '    (R.IdReports = :pIdReports) And'
      '    (R.OrigemCm = :pIdOrigemCM) And'
      '    (R.FormEventos Is Null) And'
      '    (R.IdModulo = M.IdModulo) And'
      '    (R.IdGrupoRelatorio = G.IdGrupoRelatorio) And'
      '    (R.OrigemCMGr = G.OrigemCMGr) And'
      '    (D.IdDataView = R.IdDataView) And'
      '    (R.OrigemCMDv = D.OrigemCmDv)'
      'Order By'
      '    M.NomeModulo, G.Descricao, R.Name')
    ClientDataSet = CdsDadosReports
    Left = 278
    Top = 50
  end
  object SqlPar: TCMSqlParams
    SQL.Strings = (
      'Select '
      '   R.IdReports, '
      '   R.OrigemCm, '
      '   M.NomeModulo, '
      '   R.Name, '
      '   G.Descricao '
      'From '
      '   Reports R, '
      '   Modulo M, '
      '   GrupoRelatorio G '
      'Where '
      '   (R.FormEventos is null) And '
      '   (R.IdModulo = M.IdModulo) And '
      '   (R.IdGrupoRelatorio = G.IdGrupoRelatorio) and '
      '   (R.OrigemCmGr = G.OrigemCmGr) '
      'Order By '
      '   M.NomeModulo, G.Descricao, R.Name')
    ClientDataSet = Cds
    Left = 418
    Top = 50
  end
  object SqlParDadosConsulta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   IDDATAVIEW, NAME, DESCRIPTION, TEMPLATE, CLASSNAME, ORIGEMCMD' +
        'V'
      'FROM'
      '  DATAVIEW'
      'WHERE'
      '  IDDATAVIEW = :PIDDATAVIEW AND'
      '  ORIGEMCMDV = :PORIGEMCMDV')
    ClientDataSet = CdsDadosConsulta
    Left = 174
    Top = 50
  end
  object DsDadosReports: TwwDataSource
    DataSet = CdsDadosReports
    Left = 278
    Top = 154
  end
end
