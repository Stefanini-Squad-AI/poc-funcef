inherited frmCadTabLonga: TfrmCadTabLonga
  Left = 74
  Top = 112
  HelpContext = 210056
  Caption = 'Cadastro de Tabela Longa'
  ClientHeight = 400
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 314
    BorderWidth = 2
    object Label1: TLabel
      Left = 97
      Top = 5
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 9
      Top = 5
      Width = 76
      Height = 13
      Caption = 'Nº da Tabela'
    end
    object Label3: TLabel
      Left = 513
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Colunas'
    end
    object dedNome: TwwDBEdit
      Left = 97
      Top = 21
      Width = 409
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 9
      Top = 21
      Width = 81
      Height = 21
      Color = clGray
      DataField = 'IDTABELA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Spin: TSpinEdit
      Left = 513
      Top = 20
      Width = 111
      Height = 22
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 0
    end
    object Panel1: TPanel
      Left = 4
      Top = 48
      Width = 632
      Height = 262
      BevelInner = bvLowered
      TabOrder = 3
      object sbtnInsDet: TToolbarButton97
        Left = 2
        Top = 2
        Width = 26
        Height = 26
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
        Left = 28
        Top = 2
        Width = 26
        Height = 26
        Hint = 'Alterar'
        AllowAllUp = True
        GroupIndex = 2
        ImageIndex = 1
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAltDetClick
      end
      object sbtnExcDet: TToolbarButton97
        Left = 54
        Top = 2
        Width = 26
        Height = 26
        Hint = 'Excluir'
        AllowAllUp = True
        ImageIndex = 2
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnExcDetClick
      end
      object lblOBS: TLabel
        Left = 112
        Top = 10
        Width = 347
        Height = 13
        Caption = 'Botão Direito --> Menu de Manutenção de Nome dos Campos'
      end
      object ntbDetalhes: TNotebook
        Left = 2
        Top = 28
        Width = 628
        Height = 232
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Valores'
          object dbgrdDet: TwwDBGrid
            Left = 5
            Top = 4
            Width = 617
            Height = 223
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDet
            EditCalculated = True
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
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
        object TPage
          Left = 0
          Top = 0
          Caption = 'Campos'
          object dbgdCmp: TwwDBGrid
            Left = 5
            Top = 4
            Width = 617
            Height = 223
            Selected.Strings = (
              'IDCAMPO'#9'10'#9'Número do Campo'
              'DESCRICAO'#9'60'#9'Nome do Campo'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsCmp
            EditCalculated = True
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
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
  inherited Dock972: TDock97
    Width = 640
    inherited Toolbar971: TToolbar97
      object sbtnCopiar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000055555550005555555000000055800850B058005550000000553B
          03033000330550000000553B0333F0B3330550000000700BB0338303F8005000
          000003303FFBBFBB3033000000000333FB000008B033000000003F3FB77F7703
          FBFB000000003333F77F8707B800500000005503FF7F770FB30550000000553F
          BB7F8703FB05500000005553377877073755500000005555557FF80555555000
          0000555555577755555550000000555555555555555550000000}
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 640
    inherited tb97Fundo: TToolbar97
      Left = 470
      DockPos = 499
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 303
      DockPos = 332
    end
    object bbtnExportar: TBitBtn
      Left = 0
      Top = 0
      Width = 88
      Height = 37
      Caption = '&Exportar'
      TabOrder = 2
      OnClick = bbtnExportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 409
    Top = 1
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    OnStateChange = dsStateChange
    Left = 392
    Top = 231
  end
  inherited ImlPadrao: TImageList
    Left = 354
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    Left = 546
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 364
    Top = 231
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LONGTABGENER.IDTABELA'
      'LONGTABGENER.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Nº da Tabela'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LONGTABGENER')
    CamposChave.Strings = (
      'LONGTABGENER.IDTABELA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 470
    Top = 1
  end
  object dsCmp: TwwDataSource
    AutoEdit = False
    DataSet = CdsCmp
    Left = 546
    Top = 231
  end
  object ppmTab: TPopupMenu
    Left = 245
    Top = 231
    object mnuIncluirCampo: TMenuItem
      Caption = '&Incluir Tipo de Campo'
      OnClick = mnuIncluirCampoClick
    end
    object mnuAlterarCampo: TMenuItem
      Caption = '&Alterar Tipo de Campo'
      OnClick = mnuAlterarCampoClick
    end
    object mnuExcluirCampo: TMenuItem
      Caption = '&Excluir Tipo de Campo'
      OnClick = mnuExcluirCampoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuVisualizarCampos: TMenuItem
      Caption = '&Visualizar Campos'
      OnClick = mnuVisualizarCamposClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos Texto|*.Txt'
    InitialDir = 'c:\'
    Title = 'Arquivo para Exportar'
    Left = 296
    Top = 231
  end
  object CdsCmp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 231
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = CdsDet
    Left = 464
    Top = 231
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 430
    Top = 231
  end
end
