inherited frmCadTabGener: TfrmCadTabGener
  Left = 100
  Top = 106
  HelpContext = 210055
  Caption = 'Cadastro de Tabelas Genéricas'
  ClientHeight = 428
  ClientWidth = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 619
    Height = 342
    BorderWidth = 2
    object pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 611
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 4
        Width = 94
        Height = 13
        Caption = 'Nome da Tabela'
      end
      object Label2: TLabel
        Left = 135
        Top = 4
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedNome: TwwDBEdit
        Left = 7
        Top = 18
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTABELA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 135
        Top = 18
        Width = 469
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pgctrlDetalhe: TPageControl
      Left = 4
      Top = 57
      Width = 611
      Height = 281
      ActivePage = tbshDet
      Align = alClient
      HotTrack = True
      TabOrder = 1
      OnChanging = pgctrlDetalheChanging
      object tbshDet: TTabSheet
        Caption = 'Linhas'
        object sgdrLinhas: TStringGrid
          Left = 0
          Top = 0
          Width = 603
          Height = 253
          Align = alClient
          ColCount = 1
          DefaultColWidth = 100
          DefaultRowHeight = 17
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goTabs]
          ParentFont = False
          PopupMenu = pmnuLinhas
          TabOrder = 0
          OnDrawCell = sgdrLinhasDrawCell
          OnGetEditMask = sgdrLinhasGetEditMask
          OnKeyPress = sgdrLinhasKeyPress
          OnSelectCell = sgdrLinhasSelectCell
        end
      end
      object tbshCampos: TTabSheet
        Caption = 'Campos'
        object pnlControlesCampos: TPanel
          Left = 0
          Top = 31
          Width = 513
          Height = 222
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 100
            Height = 13
            Caption = 'Codigo do Campo'
          end
          object Label4: TLabel
            Left = 8
            Top = 48
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label5: TLabel
            Left = 8
            Top = 90
            Width = 78
            Height = 13
            Caption = 'Tipo de Dado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedCodigoCampo: TwwDBEdit
            Left = 8
            Top = 24
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODCAMPO'
            DataSource = dsCampos
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDescrCampo: TwwDBEdit
            Left = 8
            Top = 64
            Width = 369
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = dsCampos
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblkcmbTipoCampo: TwwDBLookupCombo
            Left = 8
            Top = 106
            Width = 225
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMETIPODADO'#9'60'#9'Tipo de Dado')
            DataField = 'IDTIPODADO'
            DataSource = dsCampos
            LookupTable = qryTipoDado
            LookupField = 'IDTIPODADO'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object dbgrdCampos: TwwDBGrid
          Left = 0
          Top = 31
          Width = 513
          Height = 222
          Selected.Strings = (
            'CODCAMPO'#9'15'#9'Código'#9'F'
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'TIPODADO'#9'15'#9'Tipo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCampos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
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
          OnDblClick = dbgrdCamposDblClick
          IndicatorColor = icBlack
        end
        object dc97Col: TDock97
          Left = 0
          Top = 0
          Width = 603
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97Col: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInserirDet: TToolbarButton97
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir campo'
              AllowAllUp = True
              GroupIndex = 2
              ImageIndex = 0
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnInserirDetClick
            end
            object sbtnAlterarDet: TToolbarButton97
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar campo atual'
              AllowAllUp = True
              GroupIndex = 2
              ImageIndex = 1
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAlterarDetClick
            end
            object sbtnExcluirDet: TToolbarButton97
              Left = 50
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Excluir campo Atual'
              AllowAllUp = True
              GroupIndex = 2
              ImageIndex = 2
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnExcluirDetClick
            end
          end
        end
        object dc97OkCancel: TDock97
          Left = 513
          Top = 31
          Width = 90
          Height = 222
          AllowDrag = False
          BoundLines = [blLeft]
          Position = dpRight
          Visible = False
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
          end
        end
      end
      object tbshFormulas: TTabSheet
        Caption = 'Fórmulas'
        object dbrgFormulas: TwwDBGrid
          Left = 0
          Top = 0
          Width = 603
          Height = 253
          Selected.Strings = (
            'IDFORMULA'#9'10'#9'Identificador'
            'DESCRICAOFORMULA'#9'60'#9'Descrição'
            'EXPRESSAOREAL'#9'255'#9'Expressão')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFormulas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
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
      object tbshRegras: TTabSheet
        Caption = 'Regras'
        object dbgrRegras: TwwDBGrid
          Left = 0
          Top = 0
          Width = 603
          Height = 253
          Selected.Strings = (
            'IDREGRA'#9'10'#9'Identificador'
            'NOMEREGRA'#9'60'#9'Nome da Regra')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRegras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
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
  end
  inherited Dock972: TDock97
    Width = 619
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 619
    inherited tb97Fundo: TToolbar97
      Left = 450
      DockPos = 616
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 284
      DockPos = 284
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      object sbtnExportar: TSpeedButton
        Left = 36
        Top = 0
        Width = 33
        Height = 33
        Hint = 'Exportar Tabela Genérica'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888811888
          88888888888778F88888888888199188888888888878878F8888888881999918
          8888888887888878F888888819999991888888887FFF88F7F888888811199111
          88888888777F8777888888888819918888888888887F87F88888888888199188
          888888FFFF7F87FFFFF880000019910000888777777FF77777FF777777111177
          7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
          87707F777777777787F778888888888887707F888888888887F7788888888882
          87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
          8870878FFFFFFFFFFFF788777777777777788877777777777778}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnImportarClick
      end
      object sbtnImportar: TSpeedButton
        Left = 0
        Top = 0
        Width = 33
        Height = 33
        Hint = 'Importar Tabela Genérica anteriormente Exportada'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888444488
          88888888887777F888888888884CC48888888888887F87F888888888884CC488
          88888888887F87F888888888884CC48888888888887F87FFF8888888444CC444
          8888888877788777F88888884CCCCCC48888888878F888878888888884CCCC48
          888888FFF78F887FFFF88000004CC400008887777778F77777FF777777744777
          7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
          87707F777777777787F778888888888887707F888888888887F7788888888882
          87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
          8870878FFFFFFFFFFFF788777777777777788877777777777778}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnImportarClick
      end
      object ToolbarSep973: TToolbarSep97
        Left = 33
        Top = 0
        Blank = True
        SizeHorz = 3
      end
    end
  end
  object pnlIE: TPanel [3]
    Left = 266
    Top = 92
    Width = 353
    Height = 259
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object bvFundo1: TBevel
      Left = 3
      Top = 3
      Width = 347
      Height = 213
      Style = bsRaised
    end
    object Bevel1: TBevel
      Left = 7
      Top = 45
      Width = 311
      Height = 23
    end
    object bvFundo2: TBevel
      Left = 3
      Top = 212
      Width = 347
      Height = 44
      Style = bsRaised
    end
    object lblTituloIE: TLabel
      Left = 7
      Top = 6
      Width = 338
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Exportação de Tabela Genérica'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object tbbtSelArq: TToolbarButton97
      Left = 320
      Top = 44
      Width = 25
      Height = 25
      Hint = 'Selecionar arquivo'
      AllowAllUp = True
      GroupIndex = 2
      Glyph.Data = {
        5A010000424D5A01000000000000760000002800000013000000130000000100
        040000000000E400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCCCCCCCCCCC
        CCCCCCC00000C70000000000000CCCC00000C008B8B8B8B8B8B0CCC00000C0F0
        8B8B8B8B8B80CCC00000C0B0B8B8B8B8B8B80CC00000C0FB0B8B8B8B8B8B0CC0
        0000C0BF08B8B8B8B8B8B0C00000C0FBF000008B8B8B80C00000C0BFB0FFFF00
        00000CC00000C0FBF0FFFFFFFFFF0CC00000C0BFB0FF000000FF0CC00000C0FB
        F0FFFFFFFFFF0CC00000CC0000F00000FFFF0CC00000CCCCC0FFFFFFF0000CC0
        0000CCCCC0F00000F0FF0CC00000CCCCC0FFFFFFF0F0CCC00000CCCCC0FFFFFF
        F00CCCC00000CCCCC000000000CCCCC00000CCCCCCCCCCCCCCCCCCC00000}
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = tbbtSelArqClick
    end
    object lblDescrArqIE: TLabel
      Left = 8
      Top = 31
      Width = 109
      Height = 13
      Caption = 'Arquivo de Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 73
      Width = 45
      Height = 13
      Caption = 'Campos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblArquivoSel: TLabel
      Left = 8
      Top = 46
      Width = 309
      Height = 21
      AutoSize = False
      Caption = 'C:\'
      Color = 12648447
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object btnOk: TBitBtn
      Left = 183
      Top = 219
      Width = 80
      Height = 33
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
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
      Spacing = 2
    end
    object btnSair: TBitBtn
      Left = 266
      Top = 219
      Width = 80
      Height = 33
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
        88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
        B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
        BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
        BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
        BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
        B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
    object chklstCampos: TCheckListBox
      Left = 7
      Top = 88
      Width = 338
      Height = 101
      OnClickCheck = chklstCamposClickCheck
      Columns = 1
      Flat = False
      ItemHeight = 13
      Style = lbOwnerDrawFixed
      TabOrder = 2
      OnDrawItem = chklstCamposDrawItem
      OnKeyDown = chklstCamposKeyDown
    end
    object pbProgresso: TProgressBar
      Left = 7
      Top = 192
      Width = 338
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 3
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTABELA, DESCRICAO'
      'FROM'
      '  TABGENER'
      'WHERE'
      '  (CODTABELA = :COD)')
    Left = 274
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    InsertSQL.Strings = (
      'insert into TABGENER'
      '  (CODTABELA, DESCRICAO)'
      'values'
      '  (:CODTABELA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    Left = 246
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tabela Genérica'
    Colunas.Strings = (
      'TABGENER .CODTABELA'
      'TABGENER .DESCRICAO')
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
      'TABGENER ')
    CamposChave.Strings = (
      'TABGENER .CODTABELA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    Left = 569
    Top = 2
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 302
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 444
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 503
    Top = 2
  end
  object qryTipoDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPODADO, NOMETIPODADO'
      'FROM'
      '  TIPODADO')
    ValidateWithMask = True
    Left = 270
    Top = 318
  end
  object dsCampos: TwwDataSource
    DataSet = qryCampos
    Left = 85
    Top = 330
  end
  object qryCampos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CT.CODTABELA, CT.CODCAMPO, CT.DESCRICAO, CT.IDTIPODADO,'
      '  RTRIM(NOMETIPODADO) AS TIPODADO'
      'FROM'
      '  CAMPOTABGENER CT, TIPODADO TD'
      'WHERE'
      '  (CT.CODTABELA  = :COD) AND'
      '  (CT.IDTIPODADO = TD.IDTIPODADO(+))'
      'ORDER BY'
      '  CT.CODCAMPO')
    UpdateObject = updCampos
    ValidateWithMask = True
    Left = 85
    Top = 316
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object updCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update CAMPOTABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  CODCAMPO = :CODCAMPO,'
      '  IDTIPODADO = :IDTIPODADO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    InsertSQL.Strings = (
      'insert into CAMPOTABGENER'
      '  (CODTABELA, CODCAMPO, IDTIPODADO, DESCRICAO)'
      'values'
      '  (:CODTABELA, :CODCAMPO, :IDTIPODADO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CAMPOTABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    Left = 85
    Top = 303
  end
  object qryLinhas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LIN.NUMLINHA, LIN.VALOR, COL.DESCRICAO, COL.CODCAMPO'
      'FROM'
      '   VALTABGENER LIN, CAMPOTABGENER COL'
      'WHERE'
      '  (COL.CODTABELA = :COD)          AND'
      '  (COL.CODTABELA = LIN.CODTABELA) AND'
      '  (COL.CODCAMPO  = LIN.CODCAMPO)'
      'ORDER BY'
      '  LIN.NUMLINHA, LIN.CODCAMPO')
    ValidateWithMask = True
    Left = 25
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object dsFormulas: TwwDataSource
    DataSet = qryFormulas
    Left = 149
    Top = 317
  end
  object qryFormulas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFORMULA, DESCRICAOFORMULA, EXPRESSAOREAL'
      'FROM'
      '  FORMULA'
      'WHERE'
      '  ((EXPRESSAOREAL LIKE '#39'TABGENERICA%'#39') OR'
      '   (EXPRESSAOREAL LIKE '#39'CONSULTA%'#39')) AND'
      '  (EXPRESSAOREAL LIKE :COD)'
      'GROUP BY'
      '  IDFORMULA, DESCRICAOFORMULA, EXPRESSAOREAL'
      'ORDER BY'
      '  DESCRICAOFORMULA')
    ValidateWithMask = True
    Left = 149
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object dsRegras: TwwDataSource
    DataSet = qryRegras
    Left = 209
    Top = 317
  end
  object qryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA'
      'FROM'
      '  REGRA R,'
      '  (SELECT'
      '     A.IDREGRA'
      '   FROM'
      '     ALGREGRA A, (SELECT IDFORMULA, DESCRICAOFORMULA'
      '                  FROM   FORMULA'
      '                  WHERE  ((EXPRESSAOREAL LIKE '#39'TABGENERICA%'#39') OR'
      '                          (EXPRESSAOREAL LIKE '#39'CONSULTA%'#39')) AND'
      '                          (EXPRESSAOREAL LIKE :COD)'
      '                  GROUP BY IDFORMULA, DESCRICAOFORMULA) F'
      '   WHERE'
      '     (A.TIPOCAMPO2 = 4) AND'
      '     (A.FORMULA1   = F.IDFORMULA)'
      '   GROUP BY A.IDREGRA) X'
      'WHERE'
      '  (X.IDREGRA = R.IDREGRA)'
      'ORDER BY'
      '  R.NOMEREGRA')
    ValidateWithMask = True
    Left = 209
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object Sd: TSaveDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos Texto|*.TXT'
    InitialDir = 'C:\'
    Title = 'Exportação de dados da Tabela Genérica'
    Left = 349
    Top = 2
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 270
    Top = 304
  end
  object pmnuLinhas: TPopupMenu
    MenuAnimation = [maTopToBottom]
    TrackButton = tbLeftButton
    Left = 336
    Top = 305
    object mnuiInserirAntes: TMenuItem
      Caption = 'Inserir Antes'
      OnClick = mnuiInserirAntesClick
    end
    object mnuiInserirDepois: TMenuItem
      Caption = 'Inserir Depois'
      OnClick = mnuiInserirDepoisClick
    end
    object mnuiLine: TMenuItem
      Caption = '-'
    end
    object mnuiExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = mnuiExcluirClick
    end
  end
end
