inherited frmCadMsgPreDef: TfrmCadMsgPreDef
  Left = 62
  Top = 173
  Width = 757
  Height = 450
  HelpContext = 230090
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Mensagens Pré-Definidas'
  Position = poDesigned
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 749
    Height = 330
    object pnlEdicao: TPanel
      Left = 1
      Top = 111
      Width = 747
      Height = 218
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PageControl: TPageControl
        Left = 0
        Top = 0
        Width = 747
        Height = 218
        ActivePage = tabComposicao
        Align = alClient
        TabOrder = 0
        OnChange = PageControlChange
        object tabComposicao: TTabSheet
          Caption = 'Composição'
          object pnlComposicao: TPanel
            Left = 0
            Top = 0
            Width = 739
            Height = 190
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 193
              Top = 0
              Width = 5
              Height = 190
              Cursor = crHSplit
              Beveled = True
              ResizeStyle = rsUpdate
            end
            object pnlTags: TPanel
              Left = 0
              Top = 0
              Width = 193
              Height = 190
              Align = alLeft
              BevelOuter = bvLowered
              TabOrder = 0
              object pnlBottomTag: TPanel
                Left = 1
                Top = 91
                Width = 191
                Height = 98
                Align = alBottom
                BevelOuter = bvLowered
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Visible = False
                object pnlHelp: TPanel
                  Left = 1
                  Top = 1
                  Width = 189
                  Height = 41
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object dbmemDescricao: TDBMemo
                    Left = 0
                    Top = 13
                    Width = 189
                    Height = 28
                    Align = alClient
                    BorderStyle = bsNone
                    DataField = 'DESCRICAO'
                    DataSource = dtsTags
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object pnldescHelp: TPanel
                    Left = 0
                    Top = 0
                    Width = 189
                    Height = 13
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    TabOrder = 1
                    object lblDescTag: TLabel
                      Left = 2
                      Top = 2
                      Width = 45
                      Height = 12
                      Caption = 'Descrição:'
                    end
                  end
                end
                object pnlBottomHelp: TPanel
                  Left = 1
                  Top = 42
                  Width = 189
                  Height = 55
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 1
                  object lblTag: TLabel
                    Left = 2
                    Top = 0
                    Width = 64
                    Height = 12
                    Caption = 'Palavra-chave:'
                    FocusControl = dbedtTag
                  end
                  object lblExemplo: TLabel
                    Left = 2
                    Top = 28
                    Width = 93
                    Height = 12
                    Caption = 'Exemplo de conteúdo:'
                    FocusControl = dbedtExemplo
                  end
                  object dbedtTag: TDBEdit
                    Left = 2
                    Top = 11
                    Width = 185
                    Height = 13
                    Anchors = [akLeft, akTop, akRight]
                    BorderStyle = bsNone
                    DataField = 'TAG'
                    DataSource = dtsTags
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object dbedtExemplo: TDBEdit
                    Left = 2
                    Top = 39
                    Width = 185
                    Height = 13
                    Anchors = [akLeft, akTop, akRight]
                    BorderStyle = bsNone
                    DataField = 'EXEMPLOCONT'
                    DataSource = dtsTags
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                end
              end
              object pnlAllContexto: TPanel
                Left = 1
                Top = 1
                Width = 191
                Height = 90
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object pnlContexto: TPanel
                  Left = 0
                  Top = 0
                  Width = 191
                  Height = 38
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object lblContexto: TLabel
                    Left = 2
                    Top = 0
                    Width = 45
                    Height = 13
                    Caption = 'Contexto:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object btnSelecionaContexto: TSpeedButton
                    Left = 168
                    Top = 14
                    Width = 21
                    Height = 20
                    Hint = 'Seleciona Contexto'
                    Anchors = [akTop, akRight]
                    Flat = True
                    Glyph.Data = {
                      E6010000424DE60100000000000036000000280000000C0000000C0000000100
                      180000000000B001000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FF000084FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FF000084000084000084FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FF000084000084000084FF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF00008400008400008400000000000000
                      0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000084000000FFFF00
                      FF00FFFFFF00FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFF
                      00FF00FFFFFF00FF00FFFFFF00FF00FF000000FF00FFFF00FFFF00FFFF00FF00
                      0000FF00FFFFFF00FF00FFFFFF00FF00FFFFFF00000000FF00FFFF00FFFF00FF
                      FF00FF000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000FF00FFFF00
                      FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF00FFFFFF00000000FF
                      00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00000000
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000
                      00FF00FFFF00FFFF00FF}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnSelecionaContextoClick
                  end
                  object edtContexto: TEdit
                    Left = 3
                    Top = 13
                    Width = 165
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object lbTags: TListBox
                  Left = 0
                  Top = 38
                  Width = 191
                  Height = 52
                  Align = alClient
                  Color = clSilver
                  DragMode = dmAutomatic
                  ItemHeight = 13
                  TabOrder = 1
                  OnClick = lbTagsClick
                  OnDblClick = lbTagsDblClick
                end
              end
            end
            object dbmemTexto: TDBMemo
              Left = 198
              Top = 0
              Width = 541
              Height = 190
              Align = alClient
              DataField = 'TEXTO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
              OnDragDrop = dbmemTextoDragDrop
              OnDragOver = dbmemTextoDragOver
            end
          end
        end
        object tabVisualizacao: TTabSheet
          Caption = 'Visualização'
          ImageIndex = 1
          object memVisualizacao: TMemo
            Left = 0
            Top = 0
            Width = 739
            Height = 190
            Align = alClient
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 747
      Height = 110
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblDescricao: TLabel
        Left = 10
        Top = 6
        Width = 62
        Height = 13
        Caption = 'Descrição:'
      end
      object lblObs: TLabel
        Left = 10
        Top = 52
        Width = 73
        Height = 13
        Caption = 'Observação:'
      end
      object lblCodigo: TLabel
        Left = 674
        Top = 6
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Código:'
      end
      object dbedtDescricao: TDBEdit
        Left = 10
        Top = 21
        Width = 647
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object dbmemObs: TDBMemo
        Left = 10
        Top = 67
        Width = 725
        Height = 34
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OBS'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object dbedtCodigo: TDBEdit
        Left = 674
        Top = 21
        Width = 55
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        DataField = 'IDMSGPREDEF'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 749
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230090
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 546
    Top = 7
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 488
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterClose = CdsAfterClose
    AfterCancel = CdsAfterCancel
    Left = 436
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MSGPREDEF.DESCRICAO'
      'MODULO.NOMEMODULO'
      'MSGCONTEXTO.DESCRICAO'
      'MSGPREDEF.IDMSGCONTEXTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Módulo'
      'Contexto'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MSGPREDEF'
      'MSGCONTEXTO'
      'MODULO')
    CamposChave.Strings = (
      'MSGPREDEF.IDMSGPREDEF'
      'MSGCONTEXTO.DESCRICAO')
    Filtro.Strings = (
      'MSGCONTEXTO.IDMODULO = MODULO.IDMODULO'
      'MSGPREDEF.IDMSGCONTEXTO = MSGCONTEXTO.IDMSGCONTEXTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '37'
      '25'
      '25'
      '7')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 376
    Top = 7
  end
  object cdsContexto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 612
    Top = 7
  end
  object cdsTags: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsTagsAfterOpen
    AfterClose = cdsTagsAfterClose
    Left = 268
    Top = 63
  end
  object dtsTags: TDataSource
    DataSet = cdsTags
    Left = 321
    Top = 64
  end
  object cdsTagsView: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsTagsAfterOpen
    AfterClose = cdsTagsAfterClose
    Left = 428
    Top = 247
  end
  object msContexto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona contexto...'
    Colunas.Strings = (
      'MSGCONTEXTO.DESCRICAO'
      'DECODE( MSGCONTEXTO.FLGCONFIGPROPRIA, 1, '#39'SIM'#39', '#39'NÃO'#39' )'
      'MSGCONTEXTO.IDMSGCONTEXTO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Contexto'
      'Config. Própria'
      'Id.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MSGCONTEXTO')
    CamposChave.Strings = (
      'MSGCONTEXTO.IDMSGCONTEXTO'
      'MSGCONTEXTO.DESCRICAO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '20'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 241
    Top = 222
  end
end
