inherited frmCadContasOrcEmLote2MT: TfrmCadContasOrcEmLote2MT
  Left = 50
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'frmCadContasOrcPorGrupoMT'
  ClientHeight = 473
  ClientWidth = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 601
    Height = 387
    object PageControl2: TPageControl
      Left = 15
      Top = 122
      Width = 578
      Height = 260
      ActivePage = TabSheet4
      TabOrder = 0
      object TabSheet4: TTabSheet
        Caption = 'Código'
        object GroupBox1: TGroupBox
          Left = 28
          Top = 16
          Width = 513
          Height = 157
          Caption = 'Regra de formação do código da nova conta'
          TabOrder = 0
          object Label5: TLabel
            Left = 15
            Top = 30
            Width = 35
            Height = 13
            Caption = 'Inicial'
          end
          object Label7: TLabel
            Left = 72
            Top = 30
            Width = 42
            Height = 13
            Caption = 'Dígitos'
          end
          object Label8: TLabel
            Left = 326
            Top = 28
            Width = 59
            Height = 13
            Caption = 'Para cada'
          end
          object Label9: TLabel
            Left = 215
            Top = 30
            Width = 88
            Height = 13
            Caption = 'Fixo/a partir de'
          end
          object sePosIni1: TwwDBSpinEdit
            Left = 15
            Top = 44
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object sePosIni2: TwwDBSpinEdit
            Left = 15
            Top = 72
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object sePosIni3: TwwDBSpinEdit
            Left = 15
            Top = 100
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object sePosIni4: TwwDBSpinEdit
            Left = 15
            Top = 128
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object sePosFim1: TwwDBSpinEdit
            Left = 72
            Top = 44
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object sePosFim2: TwwDBSpinEdit
            Left = 72
            Top = 72
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object sePosFim3: TwwDBSpinEdit
            Left = 72
            Top = 100
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object sePosFim4: TwwDBSpinEdit
            Left = 72
            Top = 128
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object edConteudo1: TEdit
            Left = 215
            Top = 44
            Width = 79
            Height = 21
            TabOrder = 8
          end
          object edConteudo2: TEdit
            Left = 215
            Top = 72
            Width = 79
            Height = 21
            TabOrder = 9
          end
          object edConteudo3: TEdit
            Left = 215
            Top = 100
            Width = 79
            Height = 21
            TabOrder = 10
          end
          object edConteudo4: TEdit
            Left = 215
            Top = 128
            Width = 79
            Height = 21
            TabOrder = 11
          end
          object CheckBox1: TCheckBox
            Left = 126
            Top = 48
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 12
          end
          object CheckBox2: TCheckBox
            Left = 126
            Top = 76
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 13
          end
          object CheckBox3: TCheckBox
            Left = 126
            Top = 104
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 14
          end
          object CheckBox4: TCheckBox
            Left = 126
            Top = 132
            Width = 86
            Height = 17
            Caption = 'Sequencial'
            TabOrder = 15
          end
          object dbcboTipoCalcReal: TwwDBComboBox
            Left = 324
            Top = 44
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 0
            Sorted = False
            TabOrder = 16
            UnboundDataType = wwDefault
          end
          object wwDBComboBox1: TwwDBComboBox
            Left = 324
            Top = 72
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 1
            Sorted = False
            TabOrder = 17
            UnboundDataType = wwDefault
          end
          object wwDBComboBox2: TwwDBComboBox
            Left = 324
            Top = 100
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 2
            Sorted = False
            TabOrder = 18
            UnboundDataType = wwDefault
          end
          object wwDBComboBox3: TwwDBComboBox
            Left = 324
            Top = 128
            Width = 169
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Grupo Orçamentário'#9'GO'
              'Centro de Custo'#9'CC'
              'Atividade/Projeto'#9'UN'
              'Plano Previdenciário'#9'PP'
              'Patrocinadora'#9'PT')
            ItemIndex = 3
            Sorted = False
            TabOrder = 19
            UnboundDataType = wwDefault
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Centro de Custo'
        ImageIndex = 1
        object ltvCCDisponiveis: TListView
          Left = 0
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object ltvCCSelecionados: TListView
          Left = 288
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object ToolBar1: TToolBar
          Left = 250
          Top = 38
          Width = 30
          Height = 129
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
          end
          object ToolButton2: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
          end
          object ToolButton3: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
          end
          object ToolButton4: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
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
      object TabSheet6: TTabSheet
        Caption = 'Atividade/Projeto'
        ImageIndex = 2
        object ltvAPDisponiveis: TListView
          Left = 0
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object ltvapSelecionados: TListView
          Left = 288
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object ToolBar2: TToolBar
          Left = 250
          Top = 38
          Width = 30
          Height = 129
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
          end
          object ToolButton7: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
          end
          object ToolButton8: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
          end
          object ToolButton9: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
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
      object TabSheet7: TTabSheet
        Caption = 'Plano Previdênciário'
        ImageIndex = 3
        object ltvPPDisponiveis: TListView
          Left = 0
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object ltvPPSelecionados: TListView
          Left = 288
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object ToolBar3: TToolBar
          Left = 250
          Top = 38
          Width = 30
          Height = 129
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object ToolButton11: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
          end
          object ToolButton12: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
          end
          object ToolButton13: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
          end
          object ToolButton14: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
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
      object TabSheet8: TTabSheet
        Caption = 'Patrocinadora'
        ImageIndex = 4
        object ltvPTDisponiveis: TListView
          Left = 0
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Disponíveis'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object ltvPTSelecionados: TListView
          Left = 288
          Top = 4
          Width = 240
          Height = 250
          Columns = <
            item
              Caption = 'Selecionados'
              Width = 220
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object ToolBar4: TToolBar
          Left = 250
          Top = 38
          Width = 30
          Height = 129
          Align = alNone
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 2
          object ToolButton16: TToolButton
            Left = 2
            Top = 2
            Caption = 'ToolButton1'
            ImageIndex = 0
            Wrap = True
          end
          object ToolButton17: TToolButton
            Left = 2
            Top = 26
            Caption = 'ToolButton2'
            ImageIndex = 1
            Wrap = True
          end
          object ToolButton18: TToolButton
            Left = 2
            Top = 50
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
          end
          object ToolButton19: TToolButton
            Left = 2
            Top = 74
            Caption = 'ToolButton4'
            ImageIndex = 3
            Wrap = True
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
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 591
      Height = 111
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 68
        Width = 148
        Height = 13
        Caption = 'Campo que será replicado'
      end
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 82
        Height = 13
        Caption = 'Conta espelho'
      end
      object Edit1: TEdit
        Left = 10
        Top = 23
        Width = 105
        Height = 21
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 117
        Top = 23
        Width = 25
        Height = 21
        Hint = 'Procura a Conta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
      object dbeGrupo: TCMProcuraMask
        Left = 162
        Top = 4
        Width = 408
        Height = 64
        Caption = ' Grupo '
        TabOrder = 2
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CODGRUPOORC'
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        Mensagens.Sintetica = 'Grupo não pode ser sintético'
        Mensagens.Analitica = 'Grupo não pode ser analítico'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        LookupQuery = Cds
        LookupSQLParams = sqlGrupo
        LookupParam = 'CODGRUPOORC'
        LookupChave = 'CODGRUPOORC'
        LookupTipo = 'FLGANALSINT'
        LookupDescricao = 'NOMEGRUPOORCAMEN'
      end
      object wwDBComboBox4: TwwDBComboBox
        Left = 10
        Top = 83
        Width = 560
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Grupo Orçamentário'#9'GO'
          'Centro de Custo'#9'CC'
          'Atividade/Projeto'#9'UN'
          'Plano Previdenciário'#9'PP'
          'Patrocinadora'#9'PT')
        ItemIndex = 0
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 601
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 601
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 360
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 398
    Top = 95
  end
  inherited ImlPadrao: TImageList
    Left = 328
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 392
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 95
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Pesquisa de Conta Orçamentária'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '100')
    Left = 424
    Top = 7
  end
  object imgBotoes: TImageList
    AllocBy = 8
    Left = 456
    Top = 7
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000010421002100210021002
      1002100210021002100200000000000000000000000010421002100210021002
      1002100210021002100200000000000000000000000010421002100210021002
      1002100210021002100200000000000000000000000010421002100210021002
      10021002100210021002000000000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF03100210021002FF7F
      10021002100210021002100200000000000000001042FF031002100210021002
      1002FF7F100210021002100200000000000000001042FF031002FF7F10021002
      1002FF7F100210021002100200000000000000001042FF03100210021002FF7F
      100210021002FF7F100210020000000000001042FF031002100210021002FF7F
      FF7F100210021002100210021002000000001042FF0310021002100210021002
      FF7FFF7F10021002100210021002000000001042FF0310021002FF7FFF7F1002
      1002FF7FFF7F1002100210021002000000001042FF03100210021002FF7FFF7F
      10021002FF7FFF7F100210021002000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000001042FF0310021002FF7FFF7FFF7F
      1002FF7FFF7FFF7F100210021002000000001042FF0310021002FF7FFF7FFF7F
      1002FF7FFF7FFF7F100210021002000000001042FF031002100210021002FF7F
      FF7FFF7FFF7F1002100210021002000000001042FF03100210021002FF7FFF7F
      FF7FFF7F10021002100210021002000000001042FF0310021002FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10021002000000001042FF031002FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F100210021002000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000001042FF0310021002FF7FFF7FFF7F
      1002FF7FFF7FFF7F100210021002000000001042FF0310021002FF7FFF7FFF7F
      1002FF7FFF7FFF7F100210021002000000001042FF031002100210021002FF7F
      FF7F100210021002100210021002000000001042FF0310021002100210021002
      FF7FFF7F10021002100210021002000000001042FF0310021002FF7FFF7F1002
      1002FF7FFF7F1002100210021002000000001042FF03100210021002FF7FFF7F
      10021002FF7FFF7F1002100210020000000000001042FF03100210021002FF7F
      10021002100210021002100200000000000000001042FF031002100210021002
      1002FF7F100210021002100200000000000000001042FF031002FF7F10021002
      1002FF7F100210021002100200000000000000001042FF03100210021002FF7F
      100210021002FF7F1002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      10021002100210021002100200000000000000001042FF031002100210021002
      100210021002100210021002000000000000000000001042FF03FF0310021002
      100210021002100210020000000000000000000000001042FF03FF0310021002
      100210021002100210020000000000000000000000001042FF03FF0310021002
      100210021002100210020000000000000000000000001042FF03FF0310021002
      10021002100210021002000000000000000000000000000010421042FF03FF03
      FF03FF03FF0310421042000000000000000000000000000010421042FF03FF03
      FF03FF03FF0310421042000000000000000000000000000010421042FF03FF03
      FF03FF03FF0310421042000000000000000000000000000010421042FF03FF03
      FF03FF03FF031042104200000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000010421042
      104210421042000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00780038003800380038003800380038003
      0001000100010001000100010001000100010001000100010001000100010001
      000100010001000180038003800380038003800380038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, FLGANALSINT, CODGRUPOORC, FL' +
        'GSINALGRUPO'
      'FROM'
      '  GRUPOORCAMEN'
      'WHERE'
      '  (RTRIM(CODGRUPOORC) = :CODGRUPOORC) ')
    ClientDataSet = Cds
    Left = 344
    Top = 96
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 264
  end
  object CdsCentroDeCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 216
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 312
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 360
  end
end
