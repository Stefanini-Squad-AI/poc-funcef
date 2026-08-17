inherited FrmConfigCheqMT: TFrmConfigCheqMT
  Left = 450
  Top = 158
  HelpContext = 30075
  Caption = 'Configuração de Cheque'
  ClientHeight = 455
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 369
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 426
      Height = 96
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 2
        Width = 100
        Height = 13
        Caption = 'Nome do Modelo:'
      end
      object dbedlayoutCheque: TwwDBEdit
        Left = 11
        Top = 15
        Width = 246
        Height = 21
        DataField = 'LAYOUT'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbgAno: TDBRadioGroup
        Left = 11
        Top = 58
        Width = 246
        Height = 35
        Caption = ' Formato do Ano: '
        Columns = 3
        DataField = 'QTDEDIGITOSANO'
        DataSource = ds
        Items.Strings = (
          '9'
          '99'
          '9999')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2'
          '4')
      end
      object CkbFonteReduzida: TDBCheckBox
        Left = 11
        Top = 40
        Width = 225
        Height = 17
        Caption = 'Imprime com fonte condensada'
        DataField = 'FLGIMPCONDENSADO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object GpLinhas: TGroupBox
        Left = 263
        Top = 5
        Width = 153
        Height = 88
        Caption = ' Salto de linhas fixo '
        TabOrder = 3
        object Label2: TLabel
          Left = 11
          Top = 25
          Width = 68
          Height = 13
          Caption = 'Nº Cheques'
        end
        object Label3: TLabel
          Left = 11
          Top = 58
          Width = 74
          Height = 13
          Caption = 'Nº de Linhas'
        end
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 93
          Top = 21
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99
          DataField = 'NUMCHQSALTO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit2: TwwDBSpinEdit
          Left = 94
          Top = 53
          Width = 49
          Height = 21
          Increment = 1
          MaxValue = 99
          DataField = 'NUMLINHASSALTO'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
    end
    object LbldocEscluidos: TPanel
      Left = 5
      Top = 101
      Width = 426
      Height = 30
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Configuração'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 131
      Width = 426
      Height = 233
      Selected.Strings = (
        'DESCRICAO'#9'27'#9'Descrição'#9'T'
        'LINHACHEQUE'#9'10'#9'Linha'#9'F'
        'COLUNACHEQUE'#9'10'#9'Coluna'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDet
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock972: TDock97
    Width = 436
    inherited Toolbar971: TToolbar97
      object BtnTestaImpressao: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprime'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
          000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
          0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
          0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
          0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
          0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
          0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = BtnTestaImpressaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 436
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30075
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
    end
  end
  inherited ds: TwwDataSource
    Left = 251
    Top = 221
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 358
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 148
    Top = 79
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TEMPLCHEQUE.LAYOUT')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome Modelo')
    Tabelas.Strings = (
      'TEMPLCHEQUE')
    CamposChave.Strings = (
      'TEMPLCHEQUE.IDTEMPLCHEQUE')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 285
    Top = 221
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 318
    Top = 221
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    OnNewRecord = CdsDetNewRecord
    OnPostError = CdsDetPostError
    Left = 100
    Top = 271
  end
  object dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 137
    Top = 269
  end
end
