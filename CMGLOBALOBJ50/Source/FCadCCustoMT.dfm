inherited frmCadCCusto: TfrmCadCCusto
  Left = 365
  Top = 202
  HelpContext = 20009
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Centro de Custo'
  ClientHeight = 479
  ClientWidth = 1097
  PixelsPerInch = 96
  TextHeight = 13
  object lbPlanoCC: TLabel [0]
    Left = 264
    Top = 20
    Width = 150
    Height = 13
    Caption = 'Plano de Centro de Custo '
  end
  inherited pnlFundo: TPanel
    Width = 1097
    Height = 393
    object pnlArvore: TPanel
      Left = 1
      Top = 1
      Width = 313
      Height = 391
      Align = alLeft
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      TabStop = True
      object TreeCCusto: TTreeView
        Left = 5
        Top = 5
        Width = 303
        Height = 381
        Align = alClient
        Images = imgTreeView
        Indent = 19
        TabOrder = 0
        OnChange = TreeCCustoChange
      end
    end
    object PageContabil: TPageControl
      Left = 314
      Top = 1
      Width = 782
      Height = 391
      ActivePage = TbsGeral
      Align = alClient
      TabOrder = 1
      OnChanging = PageContabilChanging
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        object PnlGeral: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 363
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 2
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label3: TLabel
            Left = 8
            Top = 40
            Width = 58
            Height = 13
            Caption = 'Descrição'
            FocusControl = dbedDescricao
          end
          object Label5: TLabel
            Left = 144
            Top = 2
            Width = 97
            Height = 13
            Caption = 'Código Reduzido'
          end
          object Label6: TLabel
            Left = 273
            Top = 125
            Width = 133
            Height = 13
            Caption = 'Código Correspondente'
          end
          object Label9: TLabel
            Left = 288
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Código de Área'
          end
          object dbedDescricao: TDBEdit
            Left = 8
            Top = 54
            Width = 401
            Height = 21
            DataField = 'NOME'
            DataSource = ds
            TabOrder = 2
          end
          object pnAnaSint: TPanel
            Left = 8
            Top = 82
            Width = 250
            Height = 36
            AutoSize = True
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 3
            object sbtnAnalitico: TSpeedButton
              Left = 1
              Top = 1
              Width = 124
              Height = 34
              GroupIndex = 1
              Caption = '&Analítico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
                0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
                0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
                0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
                0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
                0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
                5555557FFFFF7755555555500000005555555577777775555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbtnAnaliticoClick
            end
            object sbtnSintetico: TSpeedButton
              Left = 125
              Top = 1
              Width = 124
              Height = 34
              GroupIndex = 1
              Caption = '&Sintético'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbtnSinteticoClick
            end
          end
          object dbedCod: TwwDBEdit
            Left = 8
            Top = 16
            Width = 121
            Height = 21
            DataField = 'CODEXTERNO'
            DataSource = ds
            MaxLength = 8
            TabOrder = 0
            UnboundDataType = wwDefault
            UnboundAlignment = taCenter
            WantReturns = False
            WordWrap = False
            OnExit = dbedCodExit
          end
          object DbeCodReduz: TwwDBEdit
            Left = 144
            Top = 16
            Width = 137
            Height = 21
            DataField = 'CODREDUZIDO'
            DataSource = ds
            MaxLength = 8
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DbeCodCorresp: TwwDBEdit
            Left = 273
            Top = 140
            Width = 137
            Height = 21
            DataField = 'CODCORRESP'
            DataSource = ds
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = 276
            Top = 100
            Width = 53
            Height = 17
            Caption = '&Ativo'
            DataField = 'ATIVO'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object PnlPrograma: TPanel
            Left = 6
            Top = 128
            Width = 257
            Height = 41
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 5
            object Label13: TLabel
              Left = 9
              Top = -1
              Width = 54
              Height = 13
              Caption = 'Programa'
              FocusControl = CmbPrograma
            end
            object CmbPrograma: TCMDBLookupCombo
              Left = 10
              Top = 13
              Width = 243
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Descrição'
                'CODPROGRAMA'#9'2'#9'Código')
              DataField = 'IDPROGRAMA'
              DataSource = ds
              LookupTable = CdsPrograma
              LookupField = 'IDPROGRAMA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object dbedCodArea: TDBEdit
            Left = 288
            Top = 16
            Width = 121
            Height = 21
            DataField = 'CODAREA'
            DataSource = ds
            TabOrder = 8
          end
          object dbchkTI: TDBCheckBox
            Left = 276
            Top = 83
            Width = 143
            Height = 17
            Hint = 
              'Indica que o centro de custo é responsável pelo inventário dos b' +
              'ens de TI (CAF)'
            Caption = 'Inventário de TI'
            DataField = 'FLGINVENTARIOTI'
            DataSource = ds
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object tbcDetalhe: TTabControlDetalhe
            Left = 0
            Top = 172
            Width = 774
            Height = 191
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 7
            Tabs.Strings = (
              'Gestores'
              'Substitutos'
              'Movimentação')
            TabIndex = 0
            OnChange = tbcDetalheChange
            OnChanging = tbcDetalheChanging
            detdbGrids.Strings = (
              'dbgrdDet'
              'dbgrdSub'
              'dbgrdMovimentacao')
            object Dock973: TDock97
              Left = 4
              Top = 24
              Width = 766
              Height = 31
              AllowDrag = False
              BoundLines = [blTop, blBottom, blLeft, blRight]
              object tb97BotoesDetalhe: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97BotoesDetalhe'
                DockPos = 0
                TabOrder = 0
                object sbtnInsDet: TToolbarButton97
                  Left = 0
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Inserir'
                  AllowAllUp = True
                  GroupIndex = 2
                  ImageIndex = 0
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnInsDetClick
                end
                object sbtnAltDet: TToolbarButton97
                  Left = 25
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Alterar'
                  AllowAllUp = True
                  GroupIndex = 2
                  ImageIndex = 1
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnAltDetClick
                end
                object sbtnExcluiDet: TToolbarButton97
                  Left = 50
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Excluir'
                  AllowAllUp = True
                  ImageIndex = 2
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnExcluiDetClick
                end
              end
            end
            object PageDetalhe: TPageControl
              Left = 4
              Top = 55
              Width = 676
              Height = 132
              ActivePage = tbsGestores
              Align = alClient
              Style = tsButtons
              TabOrder = 2
              TabStop = False
              object tbsGestores: TTabSheet
                Caption = 'tbsGestores'
                TabVisible = False
                object dbgrdDet: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 122
                  Selected.Strings = (
                    'MATRICULA'#9'9'#9'Matrícula'#9'F'
                    'NOME'#9'50'#9'Nome'#9'F'
                    'DTINICIOVIG'#9'18'#9'Início Vig.'#9'F'
                    'DTFIMVIG'#9'18'#9'Término Vig.'#9'F'
                    'PORTARIA'#9'15'#9'Portaria'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsDet
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                  TabOrder = 0
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
                object pnlControlesDet: TPanel
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 122
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object lblGestor: TLabel
                    Left = 12
                    Top = -1
                    Width = 38
                    Height = 13
                    Caption = 'Gestor'
                  end
                  object lblIniVig: TLabel
                    Left = 12
                    Top = 42
                    Width = 105
                    Height = 13
                    Caption = 'Início de Vigência'
                  end
                  object lblTerVig: TLabel
                    Left = 218
                    Top = 42
                    Width = 117
                    Height = 13
                    Caption = 'Término de Vigência'
                  end
                  object lblPort: TLabel
                    Left = 11
                    Top = 80
                    Width = 45
                    Height = 13
                    Caption = 'Portaria'
                  end
                  object cmpPessoa: TCMProcura
                    Left = 12
                    Top = 15
                    Width = 293
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    MostraMensagens = True
                    Mensagens.EmBranco = 'Chave não pode estar em branco'
                    Mensagens.NaoExiste = 'Chave não existe'
                    PermiteChaveInvalida = False
                    PermiteChaveEmBranco = False
                    DataSource = dsDet
                    DataField = 'IDPESSOA'
                    LookupChave = 'IDPESSOA'
                    LookupDescricao = 'NOME'
                    MontaSelect = msPessoa
                    LookupTabela = 'PESSOA'
                    DataBaseName = 'BaseDados'
                    ReadOnly = False
                  end
                  object dtIniVig: TwwDBDateTimePicker
                    Left = 12
                    Top = 58
                    Width = 181
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    DataField = 'DTINICIOVIG'
                    DataSource = dsDet
                    Epoch = 1950
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dtFimVig: TwwDBDateTimePicker
                    Left = 218
                    Top = 58
                    Width = 175
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    DataField = 'DTFIMVIG'
                    DataSource = dsDet
                    Epoch = 1950
                    ShowButton = True
                    TabOrder = 2
                  end
                  object GroupBox1: TGroupBox
                    Left = 11
                    Top = 91
                    Width = 182
                    Height = 30
                    TabOrder = 3
                    object DbePortaria: TwwDBEdit
                      Left = 3
                      Top = 7
                      Width = 175
                      Height = 21
                      DataField = 'PORTARIA'
                      DataSource = dsDet
                      MaxLength = 20
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                    end
                  end
                end
              end
              object tbsSubstitutos: TTabSheet
                Caption = 'tbsSubstitutos'
                ImageIndex = 1
                TabVisible = False
                object pnlControleSub: TPanel
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 122
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object lblSub: TLabel
                    Left = 12
                    Top = -1
                    Width = 58
                    Height = 13
                    Caption = 'Substituto'
                  end
                  object lblIniVigSub: TLabel
                    Left = 12
                    Top = 42
                    Width = 105
                    Height = 13
                    Caption = 'Início de Vigência'
                  end
                  object lblTerVigSub: TLabel
                    Left = 218
                    Top = 42
                    Width = 117
                    Height = 13
                    Caption = 'Término de Vigência'
                  end
                  object lblPortSub: TLabel
                    Left = 11
                    Top = 80
                    Width = 45
                    Height = 13
                    Caption = 'Portaria'
                  end
                  object lblOrdem: TLabel
                    Left = 218
                    Top = 80
                    Width = 129
                    Height = 13
                    Caption = 'Ordem de Substituição'
                  end
                  object cmpPessoaSub: TCMProcura
                    Left = 12
                    Top = 15
                    Width = 293
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    MostraMensagens = True
                    Mensagens.EmBranco = 'Chave não pode estar em branco'
                    Mensagens.NaoExiste = 'Chave não existe'
                    PermiteChaveInvalida = False
                    PermiteChaveEmBranco = False
                    DataSource = dsSub
                    DataField = 'IDPESSOA'
                    LookupChave = 'IDPESSOA'
                    LookupDescricao = 'NOME'
                    MontaSelect = msPessoa
                    LookupTabela = 'PESSOA'
                    DataBaseName = 'BaseDados'
                    ReadOnly = False
                  end
                  object dtIniVigSub: TwwDBDateTimePicker
                    Left = 12
                    Top = 58
                    Width = 181
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    DataField = 'DTINICIOVIG'
                    DataSource = dsSub
                    Epoch = 1950
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dtFimVigSub: TwwDBDateTimePicker
                    Left = 218
                    Top = 58
                    Width = 181
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    DataField = 'DTFIMVIG'
                    DataSource = dsSub
                    Epoch = 1950
                    ShowButton = True
                    TabOrder = 2
                  end
                  object grbPortSub: TGroupBox
                    Left = 11
                    Top = 91
                    Width = 120
                    Height = 30
                    TabOrder = 3
                    object DbePortSub: TwwDBEdit
                      Left = 3
                      Top = 7
                      Width = 114
                      Height = 21
                      DataField = 'PORTARIA'
                      DataSource = dsSub
                      MaxLength = 20
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                    end
                  end
                  object dbEdtOrdem: TdxDBSpinEdit
                    Left = 218
                    Top = 98
                    Width = 51
                    Hint = 'Ordem de Substituição'
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    DataField = 'ORDEM'
                    DataSource = dsSub
                    HideSelection = False
                    MaxValue = 99
                    MinValue = 1
                    StoredValues = 48
                  end
                end
                object dbgrdSub: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 122
                  Selected.Strings = (
                    'MATRICULA'#9'9'#9'Matrícula'#9'F'
                    'NOME'#9'50'#9'Nome'#9'F'
                    'DTINICIOVIG'#9'18'#9'Início Vig.'#9'F'
                    'DTFIMVIG'#9'18'#9'Término Vig.'#9'F'
                    'PORTARIA'#9'15'#9'Portaria'#9'F'
                    'ORDEM'#9'7'#9'Ordem'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsSub
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 1
                  TitleButtons = False
                  OnDblClick = dbgrdSubDblClick
                  IndicatorColor = icBlack
                end
              end
              object tbsMovimentacao: TTabSheet
                Caption = 'tbsMovimentacao'
                ImageIndex = 2
                TabVisible = False
                object dbgrdMovimentacao: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 122
                  Selected.Strings = (
                    'CODIGO_EXT'#9'10'#9'Código'#9'F'
                    'DESC_CC_ORIGEM'#9'30'#9'Origem'#9'F'
                    'DATA_INICIO'#9'12'#9'Data Início'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsMovimentacao
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            end
            object Dock974: TDock97
              Left = 680
              Top = 55
              Width = 90
              Height = 132
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
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
        end
      end
      object TbsContasXCC: TTabSheet
        Caption = 'Integração Contábil'
        object Panel3: TPanel
          Left = 0
          Top = 336
          Width = 774
          Height = 27
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object BtnApagar: TBitBtn
            Left = 341
            Top = 1
            Width = 75
            Height = 25
            Hint = 'Exclui contas relacionadas ao centro de custo atual'
            Cancel = True
            Caption = 'Apagar'
            TabOrder = 0
            OnClick = BtnApagarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
          end
          object BtnReplicar: TBitBtn
            Left = 263
            Top = 1
            Width = 75
            Height = 25
            Hint = 'Copia o relacionamento contas X cc de outro centro de custo'
            Cancel = True
            Caption = 'Replicar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BtnReplicarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            NumGlyphs = 2
          end
        end
        object PgIntContabil: TPageControl
          Left = 0
          Top = 0
          Width = 774
          Height = 336
          ActivePage = TbsContasCC
          Align = alClient
          TabOrder = 1
          object TbsContasCC: TTabSheet
            Caption = 'Contas X Centro de Custo'
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 766
              Height = 308
              Selected.Strings = (
                'PLACONTA'#9'18'#9'Conta Contábil'
                'PLANOME'#9'40'#9'Descrição')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsContasXCc
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
          object TbsAranha: TTabSheet
            Caption = 'Parametrização Contábil Predominante'
            ImageIndex = 1
            object wwDBGrid2: TwwDBGrid
              Left = 0
              Top = 0
              Width = 766
              Height = 308
              Selected.Strings = (
                'PLACONTA'#9'13'#9'Conta Débito'#9'F'
                'PLACONTAPASS'#9'18'#9'Conta Crédito'#9'F'
                'PLANOME'#9'15'#9'Descrição'
                'CODTIPRECDES'#9'20'#9'Código Tipo Desembolso'#9'F'
                'DESCRICAO'#9'35'#9'Tipo Desembolso'#9'F'
                'DESCPROGRAMA'#9'15'#9'Programa'#9'F'
                'PATROCINADORA'#9'15'#9'Patrocinadora'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsAranha
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97 [2]
    Top = 440
    Width = 1097
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited Dock972: TDock97 [3]
    Width = 1097
    object Label8: TLabel [0]
      Left = 449
      Top = 6
      Width = 128
      Height = 13
      Caption = 'Plano Centro de Custo'
    end
    object DbLcbPlanoCC: TwwDBLookupCombo
      Left = 448
      Top = 19
      Width = 281
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPLANCENTCUST'#9'60'#9'Plano'#9'F')
      LookupTable = CdsPlanoCC
      LookupField = 'IDPLANCENTCUST'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = DbLcbPlanoCCCloseUp
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 974
    Top = 67
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 264
    Top = 70
  end
  inherited ImlPadrao: TImageList
    Left = 968
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 248
    Top = 216
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 216
    Top = 72
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CCU.CODEXTERNO'
      'CCU.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST CCU')
    CamposChave.Strings = (
      'CCU.CODCENTROCUSTO'
      'CCU.IDEMPRESA'
      'CCU.CODAREA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '35')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 248
    Top = 8
  end
  object CdsContasXCc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
  object DsContasXCc: TwwDataSource
    AutoEdit = False
    DataSet = CdsContasXCc
    Left = 96
    Top = 160
  end
  object CdsAranha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 64
  end
  object DsAranha: TwwDataSource
    AutoEdit = False
    DataSet = CdsAranha
    Left = 96
    Top = 64
  end
  object MsCentrodeCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo Para Replicação'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODREDUZIDO'
      'CENTCUST.CODCORRESP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido'
      'Código Correspondente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST'
      'CONTASXCC')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA'
      'CENTCUST.CODAREA')
    Filtro.Strings = (
      'CONTASXCC.CODCENTROCUSTO=CENTCUST.CODCENTROCUSTO'
      'CONTASXCC.IDEMPRESA=CENTCUST.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '3'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
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
    Left = 576
  end
  object MsAranha: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo Para Replicação'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODREDUZIDO'
      'CENTCUST.CODCORRESP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido'
      'Código Correspondente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST'
      'TIPORDXCCXCONTA')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA'
      'CENTCUST.CODAREA')
    Filtro.Strings = (
      'CENTCUST.CODCENTROCUSTO=TIPORDXCCXCONTA.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA=TIPORDXCCXCONTA.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '3'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
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
    Left = 496
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 208
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 320
  end
  object CdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 112
  end
  object DsPrograma: TwwDataSource
    AutoEdit = False
    DataSet = CdsPrograma
    Left = 96
    Top = 112
  end
  object CmeDetalhe: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnInsert = CmeDetalheInsert
    OnDelete = CmeDetalheDelete
    OnEdit = CmeDetalheEdit
    OnCancel = CmeDetalheCancel
    OnConfirma = CmeDetalheConfirma
    OnAtualizaBotoes = AtualizaBotoes
    OpenDsAutomatico = False
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 246
    Top = 259
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 510
    Top = 239
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDRESPCENTCUST'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DTINICIOVIG'
        DataType = ftDateTime
      end
      item
        Name = 'DTFIMVIG'
        DataType = ftDateTime
      end
      item
        Name = 'PORTARIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TIPORESPCENTCUST'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDCHEFE'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
        Fields = 'DTINICIOVIG'
        Options = [ixDescending]
      end>
    IndexName = 'cdsDetIndex1'
    Params = <>
    StoreDefs = True
    Left = 470
    Top = 240
  end
  object msPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOAFISICA'
      'FUNCIONARIO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'FUNCIONARIO.MATRICULA')
    Filtro.Strings = (
      'PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '13')
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
    Left = 862
    Top = 157
  end
  object CdsPlanoCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 264
  end
  object DsPlanoCC: TDataSource
    AutoEdit = False
    DataSet = CdsPlanoCC
    Left = 97
    Top = 264
  end
  object DsAux: TwwDataSource
    AutoEdit = False
    DataSet = CdsAux
    Left = 96
    Top = 208
  end
  object DsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = CdsCentroCusto
    Left = 104
    Top = 320
  end
  object imgTreeView: TImageList
    Left = 232
    Top = 160
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000084
      A50042C6C6000084A50042C6C6000084A50042C6C6000084A50042C6C6000084
      A500000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF000000
      00000084A50042C6C6000084A50042C6C6000084A50042C6C6000084A50042C6
      C6000084A5000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF00000000000084A50042C6C6000084A50042C6C6000084A50042C6C6000084
      A50042C6C6000084A50000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000084A50042C6C6000084A50042C6C6000084A50042C6
      C6000084A50042C6C6000084A500000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF00000000000084A50042C6C6000084A50042C6C6000084
      A50042C6C6000084A50042C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000084A50042C6C6000084A50042C6
      C6000084A50042C6C6000084A50000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF00848484008484840000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFF1FFEFFC001C00FFC0FBC3D
      80018007F00FCC3380018003E00FC00380018001E007C00780018000F007C00F
      80018000C003C00780018000C001C00380018000C000000080018001E001C003
      80018001E007E00180038003F003E003C07FC0FFF001C003C07FC0FFF803CC33
      C07FC0FFFC0FBEFDFFFFFFFFFE3FFEFF00000000000000000000000000000000
      000000000000}
  end
  object sqlaranha: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      T.IDTIPORDXCCXCONTA,'
      '      T.CODTIPRECDES,'
      '      T.RECPAG,'
      '      T.IDPESSOA,'
      '      T.PLANO,'
      '      T.PLACONTA,'
      '      T.PLACONTAPASS,'
      '      T.CODCENTROCUSTO,'
      '      T.IDEMPRESA,'
      '      T.IDPROGRAMA,'
      '      C.PLANOME,'
      '      P.DESCPROGRAMA,'
      '      R.DESCRICAO,'
      '      PP.NOME AS PATROCINADORA '
      'FROM'
      '      TIPORDXCCXCONTA T,'
      '      PLANOCONTA C,'
      '      TIPORECEBDESEMB R,'
      '      PROGRAMA P,'
      '      PATRO PT,'
      '    PESSOA PP '
      'WHERE T.IDEMPRESA =-1 '
      'AND RTRIM(T.CODCENTROCUSTO) = '#39'-1'#39' '
      'AND T.PLANO = C.PLANO '
      'AND T.PLACONTA = C.PLACONTA  '
      'AND T.RECPAG = R.RECPAG '
      'AND T.IDPESSOA = R.IDPESSOA '
      'AND T.CODTIPRECDES = R.CODTIPRECDES '
      'AND T.IDPESSOA = PT.IDPESSOA    '
      'AND T.IDPATRO = PP.IDPESSOA    '
      'AND T.IDPROGRAMA = P.IDPROGRAMA(+)')
    ClientDataSet = CdsAranha
    Left = 162
    Top = 72
  end
  object cdsSub: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 578
    Top = 240
  end
  object dsSub: TDataSource
    DataSet = cdsSub
    Left = 622
    Top = 240
  end
  object CmeSubstitutos: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnInsert = CmeSubstitutosInsert
    OnDelete = CmeSubstitutosDelete
    OnEdit = CmeSubstitutosEdit
    OnCancel = CmeSubstitutosCancel
    OnConfirma = CmeSubstitutosConfirma
    OnAtualizaBotoes = AtualizaBotoes
    OpenDsAutomatico = False
    BeforeConfirma = CmeSubstitutosBeforeConfirma
    Left = 245
    Top = 303
  end
  object dsMovimentacao: TwwDataSource
    DataSet = CdsMovimentacao
    Left = 105
    Top = 384
  end
  object CdsMovimentacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 384
  end
end
