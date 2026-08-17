inherited frmCadProcessoRAD: TfrmCadProcessoRAD
  Left = 107
  Top = 131
  Width = 785
  Height = 487
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Tipos de Processo'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 785
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 367
    object pgctrlProcesso: TPageControl
      Left = 1
      Top = 1
      Width = 775
      Height = 365
      ActivePage = tbsDadosGerais
      Align = alClient
      TabOrder = 0
      OnChanging = pgctrlProcessoChanging
      object tbsDadosGerais: TTabSheet
        Caption = 'Dados Gerais'
        ImageIndex = 1
        object pnlDadosGerais: TPanel
          Left = 0
          Top = 0
          Width = 767
          Height = 337
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblNome: TLabel
            Left = 12
            Top = 6
            Width = 37
            Height = 13
            Caption = 'Nome:'
          end
          object lblGrupoProcessos: TLabel
            Left = 12
            Top = 212
            Width = 119
            Height = 13
            Caption = 'Grupo de Processos:'
          end
          object lblDescricao: TLabel
            Left = 12
            Top = 70
            Width = 62
            Height = 13
            Caption = 'Descrição:'
          end
          object lblPrazoRAD: TLabel
            Left = 394
            Top = 212
            Width = 182
            Height = 13
            Caption = 'Prazo estimado para conclusão:'
          end
          object lblhRAD: TLabel
            Left = 456
            Top = 231
            Width = 8
            Height = 13
            Caption = 'h'
          end
          object grEventoGerador: TGroupBox
            Left = 394
            Top = 81
            Width = 360
            Height = 104
            Caption = 'Evento Gerador'
            TabOrder = 0
            object memRef: TMemo
              Left = 8
              Top = 40
              Width = 345
              Height = 57
              TabStop = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              WantTabs = True
            end
            object dblkpEventoGerador: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 345
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREFERENCIA'#9'45'#9'Referência'#9'F'
                'IDREFERENCIA'#9'5'#9'Id.'#9'F')
              DataField = 'IDREFERENCIA'
              DataSource = ds
              LookupTable = cdsEventoGerador
              LookupField = 'IDREFERENCIA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object dbedtNomeProcesso: TDBEdit
            Left = 12
            Top = 23
            Width = 741
            Height = 21
            DataField = 'NOME'
            DataSource = ds
            TabOrder = 1
          end
          object dbmemDescricaoProcesso: TDBMemo
            Left = 12
            Top = 86
            Width = 360
            Height = 99
            DataField = 'DESCRICAO'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object dblkpGrupoProcessos: TwwDBLookupCombo
            Left = 12
            Top = 228
            Width = 360
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCGRUPOPROCESSO'#9'40'#9'Descrição'#9'F')
            DataField = 'IDGRUPOPROCESSO'
            DataSource = ds
            LookupTable = cdsGrupoProcesso
            LookupField = 'IDGRUPOPROCESSO'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dbedtPrazoRAD: TDBEdit
            Left = 394
            Top = 228
            Width = 60
            Height = 21
            DataField = 'PRAZOESTIMADO'
            DataSource = ds
            TabOrder = 4
            OnEnter = dbedtPrazoRADEnter
            OnExit = dbedtPrazoRADExit
          end
          object dbcbAtivo: TDBCheckBox
            Left = 704
            Top = 230
            Width = 51
            Height = 17
            Caption = 'Ativo'
            DataField = 'FLGATIVO'
            DataSource = ds
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tbsEtapas: TTabSheet
        Caption = 'Etapas'
        object dbgrdEtapas: TwwDBGrid
          Left = 0
          Top = 31
          Width = 767
          Height = 279
          Selected.Strings = (
            'NUMERO'#9'10'#9'Número'
            'DESCRICAO'#9'43'#9'Descrição'#9'F'
            'NOMEGRUPORESPON'#9'35'#9'Grupo de Responsabilidade'
            'PRAZOESTIMADO'#9'13'#9'Prazo Estimado')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsEtapas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgrdEtapasCalcCellColors
          OnDblClick = dbgrdEtapasDblClick
          IndicatorColor = icBlack
        end
        object dckEtapa: TDock97
          Left = 0
          Top = 0
          Width = 767
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInsEtapa: TToolbarButton97
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir'
              AllowAllUp = True
              ImageIndex = 0
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnInsEtapaClick
            end
            object sbtnAltEtapa: TToolbarButton97
              Left = 25
              Top = 0
              Width = 24
              Height = 25
              Hint = 'Alterar'
              AllowAllUp = True
              ImageIndex = 1
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAltEtapaClick
            end
            object sbtnExcluiEtapa: TToolbarButton97
              Left = 49
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Excluir'
              AllowAllUp = True
              ImageIndex = 2
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnExcluiEtapaClick
            end
            object sbtnRenumeraEtapas: TToolbarButton97
              Left = 80
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Renumerar etapas'
              AllowAllUp = True
              ImageIndex = 9
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnRenumeraEtapasClick
            end
            object ToolbarSep972: TToolbarSep97
              Left = 74
              Top = 0
            end
          end
        end
      end
      object tbsDetalhesEtapas: TTabSheet
        Caption = 'Detalhes da etapa selecionada'
        ImageIndex = 2
        object pnlControlesDet: TPanel
          Left = 0
          Top = 0
          Width = 767
          Height = 337
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DockOkCancEtapas: TDock97
            Left = 677
            Top = 0
            Width = 90
            Height = 337
            AllowDrag = False
            BoundLines = [blLeft]
            Position = dpRight
            object tb97Etapa: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97Etapa'
              DockPos = 0
              TabOrder = 0
              Visible = False
              object bbtnOkEtapa: TBitBtn
                Left = 0
                Top = 0
                Width = 85
                Height = 27
                Caption = 'OK'
                TabOrder = 0
                OnClick = bbtnOkEtapaClick
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
              object bbtnCancelarEtapa: TBitBtn
                Left = 0
                Top = 27
                Width = 85
                Height = 27
                Cancel = True
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = bbtnCancelarEtapaClick
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
            end
          end
          object pnlDetalhes: TPanel
            Left = 0
            Top = 0
            Width = 677
            Height = 337
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object pnlTopDetalhes: TPanel
              Left = 0
              Top = 0
              Width = 677
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object dbnvgtrEtapas: TDBNavigator
                Left = 625
                Top = 12
                Width = 40
                Height = 20
                DataSource = dsEtapas
                VisibleButtons = [nbPrior, nbNext]
                Flat = True
                Hints.Strings = (
                  'First record'
                  'Etapa anterior'
                  'Próxima etapa'
                  'Last record'
                  'Insert record'
                  'Delete record'
                  'Edit record'
                  'Post edit'
                  'Cancel edit'
                  'Refresh data')
                ParentShowHint = False
                ConfirmDelete = False
                ShowHint = True
                TabOrder = 0
              end
              object pnlTopEtapas: TPanel
                Left = 0
                Top = 0
                Width = 621
                Height = 34
                BevelOuter = bvNone
                TabOrder = 1
                object lblNumero: TLabel
                  Left = 2
                  Top = 0
                  Width = 48
                  Height = 13
                  Caption = 'Número:'
                end
                object lblDescEtapa: TLabel
                  Left = 64
                  Top = 0
                  Width = 62
                  Height = 13
                  Caption = 'Descrição:'
                end
                object lblGrupoRespon: TLabel
                  Left = 352
                  Top = 0
                  Width = 97
                  Height = 13
                  Caption = 'Grupo Aprovador'
                end
                object lblPrazoEtapa: TLabel
                  Left = 530
                  Top = 0
                  Width = 91
                  Height = 13
                  Caption = 'Prazo estimado:'
                end
                object lblhEtapa: TLabel
                  Left = 610
                  Top = 16
                  Width = 8
                  Height = 13
                  Caption = 'h'
                end
                object dbspnNumero: TwwDBSpinEdit
                  Left = 2
                  Top = 13
                  Width = 56
                  Height = 21
                  Increment = 1
                  MaxValue = 99999
                  DataField = 'NUMERO'
                  DataSource = dsEtapas
                  TabOrder = 0
                  UnboundDataType = wwDefault
                end
                object dbedtDescEtapa: TDBEdit
                  Left = 64
                  Top = 13
                  Width = 281
                  Height = 21
                  DataField = 'DESCRICAO'
                  DataSource = dsEtapas
                  TabOrder = 1
                end
                object dblkpGrupoRespon: TwwDBLookupCombo
                  Left = 353
                  Top = 13
                  Width = 170
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'18'#9'Nome do Grupo'#9'F')
                  DataField = 'IDGRPRESPON'
                  DataSource = dsEtapas
                  LookupTable = cdsGrupoRespon
                  LookupField = 'IDGRPRESPON'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dbedtPrazoEtapa: TDBEdit
                  Left = 530
                  Top = 12
                  Width = 79
                  Height = 21
                  DataField = 'PRAZOESTIMADO'
                  DataSource = dsEtapas
                  TabOrder = 3
                  OnEnter = dbedtPrazoEtapaEnter
                  OnExit = dbedtPrazoEtapaExit
                end
              end
            end
            object pnlDetalhesEtapa: TPanel
              Left = 0
              Top = 41
              Width = 677
              Height = 296
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 1
              object pnlAcoesEtapa: TPanel
                Left = 1
                Top = 1
                Width = 675
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object spdbtnAprovacao: TSpeedButton
                  Left = 2
                  Top = 2
                  Width = 89
                  Height = 22
                  GroupIndex = 1
                  Down = True
                  Caption = 'Aprovação'
                  Flat = True
                  Glyph.Data = {
                    32010000424D3201000000000000360000002800000009000000090000000100
                    180000000000FC00000000000000000000000000000000000000D8E9ECD8E9EC
                    004000004000004000004000004000D8E9ECD8E9EC00D8E9EC00400000800000
                    8000008000008000008000004000D8E9EC000080000080000080000080000080
                    0000800000800000800000400000008000008000008000D8E9ECFFFFFF008000
                    00800000800000400000008000008000008000FFFFFFD8E9ECD8E9EC00800000
                    800000400000008000008000008000D8E9EC008000FFFFFFFFFFFF0080000040
                    000000800000800000800000800000800000800000800000800000400000D8E9
                    EC008000008000008000008000008000008000004000D8E9EC00D8E9ECD8E9EC
                    008000008000008000008000008000D8E9ECD8E9EC00}
                  OnClick = spdbtnAprovacaoClick
                end
                object spdbtnRecusa: TSpeedButton
                  Left = 93
                  Top = 2
                  Width = 89
                  Height = 22
                  GroupIndex = 1
                  Caption = 'Recusa    '
                  Flat = True
                  Glyph.Data = {
                    32010000424D3201000000000000360000002800000009000000090000000100
                    180000000000FC00000000000000000000000000000000000000D8E9ECD8E9EC
                    000084000084000084000084000084D8E9ECD8E9EC00D8E9EC0000840000FF00
                    00FF0000FF0000FF0000FF000084D8E9EC000000FF0000FF0000FF0000FF0000
                    FF0000FF0000FF0000FF000084000000FF0000FFD8E9ECFFFFFF0000FFFFFFFF
                    FFFFFF0000FF000084000000FF0000FF0000FFD8E9ECFFFFFFFFFFFF0000FF00
                    00FF000084000000FF0000FF0000FFFFFFFFFFFFFFD8E9EC0000FF0000FF0000
                    84000000FF0000FFD8E9ECFFFFFF0000FFFFFFFFFFFFFF0000FF00008400D8E9
                    EC0000FF0000FF0000FF0000FF0000FF0000FF000084D8E9EC00D8E9ECD8E9EC
                    0000FF0000FF0000FF0000FF0000FFD8E9ECD8E9EC00}
                  OnClick = spdbtnAprovacaoClick
                end
                object spdbtnCondicoes: TSpeedButton
                  Left = 198
                  Top = 2
                  Width = 89
                  Height = 22
                  GroupIndex = 1
                  Caption = 'Condições'
                  Enabled = False
                  Flat = True
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080
                    8080808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0808080808080
                    808080808080808080808080C0C0C0C0C0C0C0C0C08080800000000000000000
                    00000000000000808080808080C0C0C0C0C0C080808000000000000000000000
                    0000000000808080808080C0C0C0C0C0C0000000FFFFB3FFFFB3FFFFB3FFFFB3
                    FFFFB3000000808080C0C0C0C0C0C0000000FFFFB3FFFFB3FFFFB3FFFFB3FFFF
                    B3000000808080C0C0C0C0C0C0000000FFFFB3FFFFB3FFFFB3FFFFB3FFFFB300
                    0000808080C0C0C0C0C0C0000000FFFFB3FFFFB3FFFFB3FFFFB3FFFFB3000000
                    808080C0C0C0C0C0C0808080000000000000000000000000000000808080C0C0
                    C0C0C0C0C0C0C0808080000000000000000000000000000000808080C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0000000000000000000000000000000000000000000000000000000000000
                    000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0808080000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
                    8080808080000000808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000000000
                    009D9DFF000000000000808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000009D9DFF9D9DFF9D9DFF
                    9D9DFF9D9DFF000000000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000000000009D9DFF00000000
                    0000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000000808080C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0}
                  OnClick = spdbtnAprovacaoClick
                end
                object bvlSeparador: TBevel
                  Left = 185
                  Top = 2
                  Width = 6
                  Height = 20
                  Shape = bsRightLine
                end
                object spdbtnAvisos: TSpeedButton
                  Left = 294
                  Top = 2
                  Width = 89
                  Height = 22
                  GroupIndex = 1
                  Caption = 'Avisos    '
                  Flat = True
                  Glyph.Data = {
                    EE030000424DEE03000000000000360000002800000012000000110000000100
                    180000000000B8030000000000000000000000000000000000008000FF8000FF
                    8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
                    FF8000FF8000FF8000FF8000FF8000FF00005353535656565454545454545454
                    545454545454545454545454545454545454545454545454545454545454545A
                    5A5A2B2B2B8000FF0000A1A1A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C8000FF
                    0000A6A6A6C0C0C0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1C0C0C05D5D5D8000FF0000A7A7A7FFFFFF
                    C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFF1F1F1C0C0C0FFFFFF5C5C5C8000FF0000A6A6A6FFFFFFFFFFFFC0C0C0FCFC
                    FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C0C0C0FFFFFFFF
                    FFFF5C5C5C8000FF0000A6A6A6FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFF
                    FFFFFEFEFEFEFEFEFFFFFFF6F6F6C0C0C0FFFFFFFFFFFFFFFFFF5C5C5C8000FF
                    0000A6A6A6FFFFFFFFFFFFC0C0C0CDCDCDC2C2C2C1C1C1C3C3C3CBCBCBCBCBCB
                    C3C3C3C2C2C2C2C2C2EEEEEEFFFFFFFFFFFF5C5C5C8000FF0000A7A7A7FFFFFF
                    C0C0C0CDCDCDDFDFDFE4E4E4E4E4E4E3E3E3DEDEDEDEDEDEE3E3E3E4E4E4E6E6
                    E6C0C0C0ECECECFFFFFF5C5C5C8000FF0000989898C0C0C0C0C0C0DFDFDFDCDC
                    DCDFDFDFDFDFDFDFDFDFDCDCDCDCDCDCDFDFDFDFDFDFDFDFDFE1E1E1C0C0C0E6
                    E6E65959598000FF0000A6A6A6C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04B4B4B8000FF
                    0000BEBEBEEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ABABAB8000FF00008000FFB4B4B4
                    E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFF9B9B9B9D9D9D8000FF8000FF00008000FF8000FFB2B2B2EFEFEFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C9C9C9C80
                    00FF8000FF8000FF00008000FF8000FF8000FFB0B0B0EAEAEAFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E9999998000FF8000FF8000FF8000FF
                    00008000FF8000FF8000FF8000FFB1B1B1F0F0F0FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFA2A2A29595958000FF8000FF8000FF8000FF8000FF00008000FF8000FF
                    8000FF8000FF8000FFB8B8B8A2A2A2A5A5A5A5A5A5A5A5A5A4A4A4AEAEAE8000
                    FF8000FF8000FF8000FF8000FF8000FF0000}
                  OnClick = spdbtnAprovacaoClick
                end
              end
              object ntbkEtapa: TNotebook
                Left = 1
                Top = 27
                Width = 675
                Height = 268
                Align = alClient
                PageIndex = 2
                TabOrder = 1
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Aprovacao'
                  object pnlAprovacao: TPanel
                    Left = 0
                    Top = 0
                    Width = 675
                    Height = 268
                    Align = alClient
                    TabOrder = 0
                    object grpProxEtapa: TGroupBox
                      Left = 8
                      Top = 5
                      Width = 645
                      Height = 140
                      Caption = 'Ao aprovar esta etapa...'
                      TabOrder = 0
                      object rbProximaEtapa: TRadioButton
                        Left = 10
                        Top = 19
                        Width = 257
                        Height = 17
                        Caption = 'avança para a próxima etapa.'
                        Checked = True
                        TabOrder = 0
                        TabStop = True
                        OnClick = rbProximaEtapaClick
                      end
                      object rbEtapaEspecifica: TRadioButton
                        Left = 10
                        Top = 51
                        Width = 116
                        Height = 17
                        Caption = 'vai para a etapa'
                        TabOrder = 1
                        OnClick = rbProximaEtapaClick
                      end
                      object rbAprovaFinaliza: TRadioButton
                        Left = 10
                        Top = 82
                        Width = 257
                        Height = 17
                        Caption = 'aprova o processo inteiro, finalizando-o.'
                        TabOrder = 2
                        OnClick = rbProximaEtapaClick
                      end
                      object rbAvancaCondicoes: TRadioButton
                        Left = 10
                        Top = 114
                        Width = 342
                        Height = 17
                        Caption = 'avança etapa ou aprova processo conforme condições.'
                        TabOrder = 3
                        OnClick = rbProximaEtapaClick
                      end
                      object dblkpNumProxEtapa: TwwDBLookupCombo
                        Left = 128
                        Top = 49
                        Width = 61
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NUMERO'#9'7'#9'Número'#9'F'
                          'DESCRICAO'#9'32'#9'Descrição'#9'F')
                        DataField = 'NUMETAPADEST'
                        DataSource = dsEtapas
                        LookupTable = cdsEtapasAux
                        LookupField = 'NUMERO'
                        Options = [loColLines]
                        TabOrder = 4
                        AutoDropDown = False
                        ShowButton = True
                        AllowClearKey = False
                      end
                    end
                    object dbrdgrpQtdeAprova: TDBRadioGroup
                      Left = 8
                      Top = 157
                      Width = 250
                      Height = 72
                      Caption = 'Quantidade necessária de aprovações'
                      DataField = 'FLGQTDEAUTORIZA'
                      DataSource = dsEtapas
                      Items.Strings = (
                        ''
                        'Todas do grupo.')
                      TabOrder = 1
                      Values.Strings = (
                        '1'
                        '2')
                      OnClick = dbrdgrpQtdeAprovaClick
                    end
                    object dbspnQtdeAutoriza: TwwDBSpinEdit
                      Left = 36
                      Top = 174
                      Width = 56
                      Height = 21
                      Increment = 1
                      MaxValue = 99999
                      MinValue = 1
                      Value = 1
                      DataField = 'QTDEAUTORIZA'
                      DataSource = dsEtapas
                      TabOrder = 2
                      UnboundDataType = wwDefault
                    end
                  end
                end
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Recusa'
                  object pnlRecusa: TPanel
                    Left = 0
                    Top = 0
                    Width = 675
                    Height = 268
                    Align = alClient
                    TabOrder = 0
                    object grpRecusa: TGroupBox
                      Left = 8
                      Top = 5
                      Width = 645
                      Height = 156
                      Caption = 'Ao recusar esta etapa, será possível...'
                      TabOrder = 0
                      object dbchkbxRetorna: TDBCheckBox
                        Left = 12
                        Top = 23
                        Width = 161
                        Height = 17
                        Caption = 'retornar para etapa...'
                        DataField = 'FLGPODERETORNAR'
                        DataSource = dsEtapas
                        TabOrder = 0
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                        OnClick = dbchkbxRetornaClick
                      end
                      object dbchkbxRecusa: TDBCheckBox
                        Left = 12
                        Top = 124
                        Width = 261
                        Height = 17
                        Caption = 'recusar o processo inteiro, finalizando-o.'
                        DataField = 'FLGPODERECUSAR'
                        DataSource = dsEtapas
                        TabOrder = 3
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                      object dbrdgrpRetorno: TDBRadioGroup
                        Left = 32
                        Top = 37
                        Width = 185
                        Height = 63
                        DataField = 'FLGETAPARETORNO'
                        DataSource = dsEtapas
                        Items.Strings = (
                          'executada anteriormente.'
                          'número')
                        TabOrder = 1
                        Values.Strings = (
                          '1'
                          '2')
                        OnClick = dbrdgrpRetornoClick
                      end
                      object dblkpNumEtapaRetorno: TwwDBLookupCombo
                        Left = 105
                        Top = 74
                        Width = 61
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NUMERO'#9'7'#9'Número'#9'F'
                          'DESCRICAO'#9'32'#9'Descrição'#9'F')
                        DataField = 'NUMETAPARET'
                        DataSource = dsEtapas
                        LookupTable = cdsEtapasAux
                        LookupField = 'NUMERO'
                        Options = [loColLines]
                        TabOrder = 2
                        AutoDropDown = False
                        ShowButton = True
                        AllowClearKey = False
                      end
                    end
                  end
                end
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Condicoes'
                  object pnlCondicoes: TPanel
                    Left = 0
                    Top = 0
                    Width = 675
                    Height = 268
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    object pnlElse: TPanel
                      Left = 0
                      Top = 241
                      Width = 675
                      Height = 27
                      Align = alBottom
                      TabOrder = 0
                      object lblElse: TLabel
                        Left = 7
                        Top = 6
                        Width = 274
                        Height = 17
                        AutoSize = False
                        Caption = 'Se nenhuma das condições acima for atendida, '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        WordWrap = True
                      end
                      object dblkpEtapaElse: TwwDBLookupCombo
                        Left = 474
                        Top = 3
                        Width = 61
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NUMERO'#9'7'#9'Número'#9'F'
                          'DESCRICAO'#9'32'#9'Descrição'#9'F')
                        DataField = 'NUMETAPAELSE'
                        DataSource = dsEtapas
                        LookupTable = cdsEtapasAux
                        LookupField = 'NUMERO'
                        Options = [loColLines]
                        TabOrder = 1
                        AutoDropDown = False
                        ShowButton = True
                        AllowClearKey = False
                      end
                      object cmbElse: TComboBox
                        Left = 281
                        Top = 3
                        Width = 188
                        Height = 21
                        Style = csDropDownList
                        ItemHeight = 13
                        TabOrder = 0
                        OnChange = cmbElseChange
                        Items.Strings = (
                          'aprova e finaliza o processo.'
                          'vai para a etapa')
                      end
                    end
                  end
                end
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Avisos'
                  object pnlAvisos: TPanel
                    Left = 0
                    Top = 0
                    Width = 675
                    Height = 268
                    Align = alClient
                    TabOrder = 0
                    object lblAvisos: TLabel
                      Left = 12
                      Top = 10
                      Width = 42
                      Height = 13
                      Caption = 'Avisos:'
                    end
                    object cmbAvisos: TComboBox
                      Left = 12
                      Top = 25
                      Width = 639
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      TabOrder = 0
                      OnChange = cmbAvisosChange
                      Items.Strings = (
                        'Não enviar.'
                        'Enviar por e-mail.'
                        'Enviar por mensagem CM.'
                        'Enviar por e-mail e mensagem CM.')
                    end
                    object grpAvisos: TGroupBox
                      Left = 12
                      Top = 59
                      Width = 639
                      Height = 169
                      Caption = 'Destinatários'
                      TabOrder = 1
                      object pnlOutrosDestinatarios: TPanel
                        Left = 16
                        Top = 72
                        Width = 605
                        Height = 80
                        BevelInner = bvLowered
                        BevelOuter = bvNone
                        TabOrder = 2
                        object btnIncluiDest: TSpeedButton
                          Left = 563
                          Top = 1
                          Width = 20
                          Height = 20
                          Hint = 'Adiciona remetente'
                          Anchors = [akTop, akRight]
                          Flat = True
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clMaroon
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          Glyph.Data = {
                            36040000424D3604000000000000360000002800000010000000100000000100
                            2000000000000004000000000000000000000000000000000000FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
                            FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFF00848484008484
                            8400FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
                            FF0000FFFF0000FFFF00FF00FF00FF00FF000000000000000000FFFFFF000000
                            0000FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                            FF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
                            000000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                            FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF000000000000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
                            FF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
                            FF00FFFFFF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                            0000FFFFFF000000000000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0000FF
                            FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                            FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF00FF00FF00FF00
                            FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                            FF00FF00FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00
                            FF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
                            FF00848484008484840000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                            FF0000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0084848400848484008484
                            8400FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF0000FF
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                          ParentFont = False
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = btnIncluiDestClick
                        end
                        object btnExcluiDest: TSpeedButton
                          Left = 583
                          Top = 1
                          Width = 20
                          Height = 20
                          Hint = 'Remove remetente'
                          Anchors = [akTop, akRight]
                          Flat = True
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clMaroon
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          Glyph.Data = {
                            36040000424D3604000000000000360000002800000010000000100000000100
                            2000000000000004000000000000000000000000000000000000FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
                            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
                            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
                            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                            0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF000000840000008400000084000000840000008400FF000000FF000000FFFF
                            FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                            84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
                            FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
                            FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
                            0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
                            FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
                            FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
                            FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
                            0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
                            FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
                            FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
                            FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
                            FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
                            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                          ParentFont = False
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = btnExcluiDestClick
                        end
                        object sttctxtOutrosDestinatarios: TStaticText
                          Left = 2
                          Top = 4
                          Width = 295
                          Height = 16
                          AutoSize = False
                          Caption = 'Outros usuários (quando a etapa for aprovada):'
                          TabOrder = 0
                        end
                        object dbgrdEtapaDest: TwwDBGrid
                          Left = 1
                          Top = 21
                          Width = 603
                          Height = 58
                          Selected.Strings = (
                            'NOME'#9'45'#9'Nome'
                            'EMAIL'#9'35'#9'E-mail'#9'F')
                          IniAttributes.Delimiter = ';;'
                          TitleColor = clBtnFace
                          FixedCols = 0
                          ShowHorzScrollBar = True
                          Align = alBottom
                          DataSource = dsEtapaDest
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
                          TabOrder = 1
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
                      object dbchkAvisoGrupo: TDBCheckBox
                        Left = 16
                        Top = 19
                        Width = 505
                        Height = 17
                        Caption = 
                          'Usuários do grupo aprovador (quando o processo entrar nesta etap' +
                          'a).'
                        DataField = 'FLGAVISOGRUPO'
                        DataSource = dsEtapas
                        TabOrder = 0
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                      object dbchkAvisoSolic: TDBCheckBox
                        Left = 16
                        Top = 45
                        Width = 505
                        Height = 17
                        Caption = 'Usuário solicitante (quando a etapa for aprovada ou recusada).'
                        DataField = 'FLGAVISOSOLIC'
                        DataSource = dsEtapas
                        TabOrder = 1
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      object tbsTextos: TTabSheet
        Caption = 'Textos de Avisos'
        ImageIndex = 3
        object pnlTextos: TPanel
          Left = 0
          Top = 0
          Width = 767
          Height = 310
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblTxtAprovaRAD: TLabel
            Left = 3
            Top = 2
            Width = 246
            Height = 13
            Caption = 'Texto padrão para aprovação do processo:'
          end
          object lblTxtAprovaEtapa: TLabel
            Left = 3
            Top = 98
            Width = 233
            Height = 13
            Caption = 'Texto padrão para aprovação de etapas:'
          end
          object lblTxtAprovaRADRes: TLabel
            Left = 387
            Top = 97
            Width = 319
            Height = 13
            Caption = 'Texto padrão para aprovação de etapa com ressalva(s):'
          end
          object lblTxtRecusaRAD: TLabel
            Left = 387
            Top = 1
            Width = 220
            Height = 13
            Caption = 'Texto padrão para recusa do processo'
          end
          object lblTxtRecusaEtapa: TLabel
            Left = 3
            Top = 189
            Width = 213
            Height = 13
            Caption = 'Texto padrão para retorno de etapas:'
          end
          object lblTxtSolicAprova: TLabel
            Left = 387
            Top = 190
            Width = 246
            Height = 13
            Caption = 'Texto padrão para solitação de aprovação:'
          end
          object btnTags: TSpeedButton
            Left = 387
            Top = 280
            Width = 375
            Height = 22
            Caption = 'Palavras-chave disponíveis'
            Glyph.Data = {
              AA040000424DAA04000000000000360000002800000013000000130000000100
              1800000000007404000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFF0000FF0000FFFFFF
              FF0000FF0000FFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFF000080000080FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FFFFFFFFFFFF000080000080FFFFFFFFFFFF000000FFFFFF000080
              000080FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FFFFFFFFFFFFFFFFFF000080000080FFFFFF000000000080000080FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000080000080000000FFFFFF000080000080FFFFFFFFFF
              FFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFF
              FFFF000080000080FFFFFF000000FFFFFFFFFFFF000080000080FFFFFFFFFFFF
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFF0000800000
              80FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFF
              0000FF0000FFFFFFFF0000FF0000FFFFFFFFFFFF000080000080FFFFFFFFFFFF
              FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000}
            OnClick = btnTagsClick
          end
          object btnAvisosPadroes: TSpeedButton
            Left = 3
            Top = 280
            Width = 375
            Height = 22
            Caption = 'Preencher avisos com conteúdo padrão.'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400008400
              00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000840000840000840000840000FF
              FFFFFFFFFFFFFFFFFFFFFF840000840000840000FFFFFFFFFFFFFFFFFFFFFFFF
              840000840000840000840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400
              00840000840000FFFFFFFFFFFFFFFFFF840000840000840000840000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000840000FFFFFFFFFFFFFFFFFF
              840000840000840000840000840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF840000840000FFFFFFFFFFFFFFFFFF840000FFFFFFFFFFFF84000084000084
              0000FFFFFFFFFFFFFFFFFFFFFFFF840000840000840000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF840000840000840000FFFFFFFFFFFF8400008400
              00840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84
              0000840000840000840000840000840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000840000840000840000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = btnAvisosPadroesClick
          end
          object dbMemTxtAprovaRAD: TDBMemo
            Left = 3
            Top = 18
            Width = 375
            Height = 65
            DataField = 'TXTAPROVARAD'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbMemTxtAprovaRADRes: TDBMemo
            Left = 387
            Top = 114
            Width = 375
            Height = 65
            DataField = 'TXTAPROVARADRES'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object dbMemTxtRecusaRAD: TDBMemo
            Left = 387
            Top = 18
            Width = 375
            Height = 65
            DataField = 'TXTRECUSARAD'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbMemTxtAprovaEtapa: TDBMemo
            Left = 3
            Top = 114
            Width = 375
            Height = 65
            DataField = 'TXTAPROVAETAPA'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object dbMemTxtRecusaEtapa: TDBMemo
            Left = 3
            Top = 206
            Width = 375
            Height = 65
            DataField = 'TXTRECUSAETAPA'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object dbMemTxtSolicAprova: TDBMemo
            Left = 387
            Top = 206
            Width = 375
            Height = 65
            DataField = 'TXTSOLICAPROV'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 777
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = 'Inserir'
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = 'Alterar'
      end
      inherited sbtnProcurar: TToolbarButton97
        Caption = 'Procurar'
      end
      inherited sbtnApagar: TToolbarButton97
        Caption = 'Excluir'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 777
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Caption = 'Ajuda'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Ok'
        Default = False
      end
      inherited bbtnCancelar: TBitBtn
        Cancel = False
        Caption = 'Cancelar'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 498
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
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 12
  end
  inherited ImlPadrao: TImageList
    Left = 688
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFF800300000000FFFF800300000000
      FFFF800300000000FFFFFFFF00000000FFFFFEFF00000000FFFFFC7F00000000
      E007FEFF00000000F00FFEFF00000000F81FFEFF00000000FC3FFEFF00000000
      FE7FFFFF00000000FFFF800300000000FFFF800300000000FFFF800300000000
      FFFF800300000000FFFF800300000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
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
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    StoreDefs = True
    AfterInsert = CdsAfterInsert
    Left = 252
    Top = 15
    object CdsIDRADTIPOPROC: TFloatField
      FieldName = 'IDRADTIPOPROC'
    end
    object CdsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsIDREFERENCIA: TFloatField
      FieldName = 'IDREFERENCIA'
      OnChange = CdsIDREFERENCIAChange
    end
    object CdsFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object CdsIDGRUPOPROCESSO: TFloatField
      FieldName = 'IDGRUPOPROCESSO'
    end
    object CdsDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftBlob
      Size = 500
    end
    object CdsPRAZOESTIMADO: TStringField
      DisplayWidth = 7
      FieldName = 'PRAZOESTIMADO'
      EditMask = '!9999:99;1; '
      Size = 7
    end
    object CdsTXTAPROVARAD: TMemoField
      FieldName = 'TXTAPROVARAD'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsTXTAPROVARADRES: TMemoField
      FieldName = 'TXTAPROVARADRES'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsTXTRECUSARAD: TMemoField
      FieldName = 'TXTRECUSARAD'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsTXTAPROVAETAPA: TMemoField
      FieldName = 'TXTAPROVAETAPA'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsTXTRECUSAETAPA: TMemoField
      FieldName = 'TXTRECUSAETAPA'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsTXTSOLICAPROV: TMemoField
      FieldName = 'TXTSOLICAPROV'
      BlobType = ftMemo
      Size = 1000
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROC.NOME'
      'RADREFERENCIA.IDREFERENCIA'
      'RADREFERENCIA.DESCREFERENCIA'
      'DECODE( RADTIPOPROC.FLGATIVO, 1, '#39'SIM'#39', '#39'NÃO'#39' ) AS FLGATIVO'
      'RADGRUPOPROCESSO.DESCGRUPOPROCESSO'
      'RADTIPOPROC.PRAZOESTIMADO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Nome'
      'Id. Evento'
      'Evento Gerador'
      'Ativo'
      'Grupo'
      'Prazo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RADTIPOPROC'
      'RADGRUPOPROCESSO'
      'RADREFERENCIA')
    CamposChave.Strings = (
      'RADTIPOPROC.IDRADTIPOPROC')
    Filtro.Strings = (
      'RADTIPOPROC.IDREFERENCIA = RADREFERENCIA.IDREFERENCIA (+)'
      'RADTIPOPROC.IDGRUPOPROCESSO = RADGRUPOPROCESSO.IDGRUPOPROCESSO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '10'
      '27'
      '6'
      '15'
      '7')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    Left = 456
    Top = 15
  end
  object cdsEtapas: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'NUMERO'
    Params = <>
    StoreDefs = True
    AfterInsert = cdsEtapasAfterInsert
    AfterScroll = cdsEtapasAfterScroll
    Left = 382
    Top = 4
    object cdsEtapasNUMERO: TFloatField
      DisplayLabel = 'Número'
      DisplayWidth = 10
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.RADETAPA.NUMERO'
      Required = True
    end
    object cdsEtapasDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 43
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.RADETAPA.DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsEtapasNOMEGRUPORESPON: TStringField
      DisplayLabel = 'Grupo de Responsabilidade'
      DisplayWidth = 35
      FieldName = 'NOMEGRUPORESPON'
      Origin = 'BASEDADOS.RADGRPRESPON.NOME'
      Size = 30
    end
    object cdsEtapasPRAZOESTIMADO: TStringField
      DisplayLabel = 'Prazo Estimado'
      DisplayWidth = 13
      FieldName = 'PRAZOESTIMADO'
      Origin = 'BASEDADOS.RADETAPA.PRAZOESTIMADO'
      EditMask = '!9999:99;1; '
      Size = 7
    end
    object cdsEtapasIDRADETAPA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRADETAPA'
      Origin = 'BASEDADOS.RADETAPA.IDRADETAPA'
      Visible = False
    end
    object cdsEtapasIDRADTIPOPROC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRADTIPOPROC'
      Origin = 'BASEDADOS.RADETAPA.IDRADTIPOPROC'
      Visible = False
    end
    object cdsEtapasIDGRPRESPON: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPRESPON'
      Origin = 'BASEDADOS.RADETAPA.IDGRPRESPON'
      Visible = False
    end
    object cdsEtapasFLGACAOAPROVA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGACAOAPROVA'
      Origin = 'BASEDADOS.RADETAPA.FLGACAOAPROVA'
      Visible = False
    end
    object cdsEtapasFLGQTDEAUTORIZA: TFloatField
      FieldName = 'FLGQTDEAUTORIZA'
    end
    object cdsEtapasQTDEAUTORIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEAUTORIZA'
      Origin = 'BASEDADOS.RADETAPA.QTDEAUTORIZA'
      Visible = False
    end
    object cdsEtapasNUMETAPADEST: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMETAPADEST'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPADEST'
      Visible = False
    end
    object cdsEtapasFLGPODERETORNAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPODERETORNAR'
      Origin = 'BASEDADOS.RADETAPA.FLGPODERETORNAR'
      Visible = False
    end
    object cdsEtapasFLGETAPARETORNO: TFloatField
      DisplayWidth = 18
      FieldName = 'FLGETAPARETORNO'
      Origin = 'BASEDADOS.RADETAPA.FLGETAPARETORNO'
      Visible = False
    end
    object cdsEtapasNUMETAPARET: TFloatField
      DisplayWidth = 18
      FieldName = 'NUMETAPARET'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPARET'
      Visible = False
    end
    object cdsEtapasFLGPODERECUSAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPODERECUSAR'
      Origin = 'BASEDADOS.RADETAPA.FLGPODERECUSAR'
      Visible = False
    end
    object cdsEtapasFLGELSE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGELSE'
      Origin = 'BASEDADOS.RADETAPA.FLGELSE'
      Visible = False
    end
    object cdsEtapasNUMETAPAELSE: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMETAPAELSE'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPAELSE'
      Visible = False
    end
    object cdsEtapasFLGAVISOS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOS'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOS'
      Visible = False
    end
    object cdsEtapasFLGAVISOGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOGRUPO'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOGRUPO'
      Visible = False
    end
    object cdsEtapasFLGAVISOSOLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOSOLIC'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOSOLIC'
      Visible = False
    end
    object cdsEtapasAVISOOUTROS: TStringField
      DisplayWidth = 100
      FieldName = 'AVISOOUTROS'
      Origin = 'BASEDADOS.RADETAPA.AVISOOUTROS'
      Visible = False
      Size = 100
    end
  end
  object dsEtapas: TwwDataSource
    AutoEdit = False
    DataSet = cdsEtapas
    Left = 414
    Top = 7
  end
  object cdsCondicoes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'IDRADETAPA;ORDEM'
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    AfterOpen = cdsCondicoesAfterOpen
    AfterInsert = cdsCondicoesAfterInsert
    Left = 555
    Top = 11
  end
  object cdsGrupoProcesso: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 197
    Top = 288
    object cdsGrupoProcessoDESCGRUPOPROCESSO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOPROCESSO'
      Size = 60
    end
    object cdsGrupoProcessoIDGRUPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOPROCESSO'
      Visible = False
    end
  end
  object cdsEventoGerador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 661
    Top = 160
    object cdsEventoGeradorDESCREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 45
      FieldName = 'DESCREFERENCIA'
      Size = 50
    end
    object cdsEventoGeradorIDREFERENCIA: TFloatField
      DisplayLabel = 'Id.'
      DisplayWidth = 5
      FieldName = 'IDREFERENCIA'
    end
    object cdsEventoGeradorDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Visible = False
      Size = 100
    end
  end
  object cdsGrupoRespon: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 477
    Top = 88
    object cdsGrupoResponNOME: TStringField
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 30
    end
    object cdsGrupoResponIDGRPRESPON: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPRESPON'
      Visible = False
    end
    object cdsGrupoResponNIVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'NIVEL'
      Visible = False
    end
  end
  object msDestAviso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um destinatário de aviso:'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.EMAIL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'E-Mail')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.EMAIL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '55'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 43
    Top = 297
  end
  object cdsEtapaDest: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    AfterInsert = cdsEtapaDestAfterInsert
    Left = 461
    Top = 304
    object cdsEtapaDestNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 45
      FieldName = 'NOME'
      Size = 60
    end
    object cdsEtapaDestEMAIL: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 35
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsEtapaDestIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsEtapaDestIDRADETAPA: TFloatField
      FieldName = 'IDRADETAPA'
      Visible = False
    end
  end
  object dsEtapaDest: TDataSource
    DataSet = cdsEtapaDest
    Left = 523
    Top = 305
  end
  object cdsEtapasAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'NUMERO'
    Params = <>
    StoreDefs = True
    Left = 622
    Top = 12
    object cdsEtapasAuxNUMERO: TFloatField
      DisplayLabel = 'Número'
      DisplayWidth = 10
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.RADETAPA.NUMERO'
      Required = True
    end
    object cdsEtapasAuxDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 43
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.RADETAPA.DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsEtapasAuxNOMEGRUPORESPON: TStringField
      DisplayLabel = 'Grupo de Responsabilidade'
      DisplayWidth = 35
      FieldName = 'NOMEGRUPORESPON'
      Origin = 'BASEDADOS.RADGRPRESPON.NOME'
      Size = 30
    end
    object cdsEtapasAuxPRAZOESTIMADO: TStringField
      DisplayLabel = 'Prazo Estimado'
      DisplayWidth = 13
      FieldName = 'PRAZOESTIMADO'
      Origin = 'BASEDADOS.RADETAPA.PRAZOESTIMADO'
      EditMask = '!9999:99;1; '
      Size = 7
    end
    object cdsEtapasAuxIDRADETAPA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRADETAPA'
      Origin = 'BASEDADOS.RADETAPA.IDRADETAPA'
      Visible = False
    end
    object cdsEtapasAuxIDRADTIPOPROC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRADTIPOPROC'
      Origin = 'BASEDADOS.RADETAPA.IDRADTIPOPROC'
      Visible = False
    end
    object cdsEtapasAuxIDGRPRESPON: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPRESPON'
      Origin = 'BASEDADOS.RADETAPA.IDGRPRESPON'
      Visible = False
    end
    object cdsEtapasAuxFLGACAOAPROVA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGACAOAPROVA'
      Origin = 'BASEDADOS.RADETAPA.FLGACAOAPROVA'
      Visible = False
    end
    object cdsEtapasAuxFLGQTDEAUTORIZA: TFloatField
      FieldName = 'FLGQTDEAUTORIZA'
    end
    object cdsEtapasAuxQTDEAUTORIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEAUTORIZA'
      Origin = 'BASEDADOS.RADETAPA.QTDEAUTORIZA'
      Visible = False
    end
    object cdsEtapasAuxNUMETAPADEST: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMETAPADEST'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPADEST'
      Visible = False
    end
    object cdsEtapasAuxFLGPODERETORNAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPODERETORNAR'
      Origin = 'BASEDADOS.RADETAPA.FLGPODERETORNAR'
      Visible = False
    end
    object cdsEtapasAuxFLGETAPARETORNO: TFloatField
      DisplayWidth = 18
      FieldName = 'FLGETAPARETORNO'
      Origin = 'BASEDADOS.RADETAPA.FLGETAPARETORNO'
      Visible = False
    end
    object cdsEtapasAuxNUMETAPARET: TFloatField
      DisplayWidth = 18
      FieldName = 'NUMETAPARET'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPARET'
      Visible = False
    end
    object cdsEtapasAuxFLGPODERECUSAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPODERECUSAR'
      Origin = 'BASEDADOS.RADETAPA.FLGPODERECUSAR'
      Visible = False
    end
    object cdsEtapasAuxFLGELSE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGELSE'
      Origin = 'BASEDADOS.RADETAPA.FLGELSE'
      Visible = False
    end
    object cdsEtapasAuxNUMETAPAELSE: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMETAPAELSE'
      Origin = 'BASEDADOS.RADETAPA.NUMETAPAELSE'
      Visible = False
    end
    object cdsEtapasAuxFLGAVISOS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOS'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOS'
      Visible = False
    end
    object cdsEtapasAuxFLGAVISOGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOGRUPO'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOGRUPO'
      Visible = False
    end
    object cdsEtapasAuxFLGAVISOSOLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAVISOSOLIC'
      Origin = 'BASEDADOS.RADETAPA.FLGAVISOSOLIC'
      Visible = False
    end
    object cdsEtapasAuxAVISOOUTROS: TStringField
      DisplayWidth = 100
      FieldName = 'AVISOOUTROS'
      Origin = 'BASEDADOS.RADETAPA.AVISOOUTROS'
      Visible = False
      Size = 100
    end
  end
end
