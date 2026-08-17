inherited frmCadastroDetalhe: TfrmCadastroDetalhe
  Left = 73
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Detalhe'
  ClientHeight = 339
  ClientWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 304
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 666
      Height = 60
      Align = alTop
      TabOrder = 0
    end
    object pgc: TPageControl
      Left = 5
      Top = 65
      Width = 666
      Height = 234
      ActivePage = tbs
      Align = alClient
      TabOrder = 1
      object tbs: TTabSheet
        Caption = 'Caption da Tela Aqui'
        TabVisible = False
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 658
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInserir: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                88B888888888888888888888888B888888888888888888888888}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnInserirClick
            end
            object sbtnAlterar: TSpeedButton
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                777777777787FF88777777777778887777777777777888777777}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAlterarClick
            end
            object sbtnApagar: TSpeedButton
              Left = 50
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnApagarClick
            end
          end
        end
        object pnlControles: TPanel
          Left = 0
          Top = 31
          Width = 658
          Height = 67
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
        end
        object pnlGrd: TPanel
          Left = 0
          Top = 98
          Width = 658
          Height = 126
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBgrd: TwwDBGrid
            Left = 16
            Top = 10
            Width = 625
            Height = 104
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = ds
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = DBgrdCalcCellColors
            OnDblClick = sbtnAlterarClick
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdTopRowChanged
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 676
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 85
      end
      inherited sep3: TToolbarSep97
        Left = 173
      end
      inherited bbtnSair: TBitBtn
        Width = 85
        Height = 29
        Caption = 'Sair'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 88
        Width = 85
        Height = 29
        Caption = 'Ajuda'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 29
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 85
        Height = 29
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object upd: TUpdateSQL
    Left = 344
    Top = 18
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = upd
    ValidateWithMask = True
    Left = 376
    Top = 18
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 408
    Top = 18
  end
  object CmeCadastro: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    DataSource = ds
    OpenDsAutomatico = False
    Left = 228
    Top = 102
  end
end
