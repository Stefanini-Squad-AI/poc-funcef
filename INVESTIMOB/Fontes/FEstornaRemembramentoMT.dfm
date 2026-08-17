inherited frmEstornaRemembramentoMT: TfrmEstornaRemembramentoMT
  Left = 242
  Top = 163
  Caption = 'Estorna Remembramento'
  ClientHeight = 438
  ClientWidth = 506
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 506
    Height = 405
    object Panel5: TPanel
      Left = 7
      Top = 53
      Width = 488
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Imóveis Originais'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBgrdBemOriginal: TwwDBGrid
      Left = 8
      Top = 80
      Width = 487
      Height = 97
      Selected.Strings = (
        'NOMEIMOVEL'#9'123'#9'Nome do Imóvel'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsImoveisOriginais
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBgrdBemOriginalCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdBemOriginalTopRowChanged
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 185
      Width = 487
      Height = 189
      Caption = ' Evento Remembrado '
      Enabled = False
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 61
        Height = 13
        Caption = 'Cabeçalho'
      end
      object Label6: TLabel
        Left = 376
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label7: TLabel
        Left = 16
        Top = 59
        Width = 118
        Height = 13
        Caption = 'Descrição detalhada'
      end
      object Label2: TLabel
        Left = 16
        Top = 144
        Width = 121
        Height = 13
        Caption = 'Usuário Responsável'
      end
      object DBmemEvento: TDBMemo
        Left = 16
        Top = 73
        Width = 457
        Height = 65
        DataField = 'EVIDESCRICAO'
        DataSource = dsEventoImovel
        MaxLength = 2000
        TabOrder = 2
      end
      object DBedtCabecalhoEvento: TDBEdit
        Left = 16
        Top = 32
        Width = 345
        Height = 21
        DataField = 'EVICABECALHO'
        DataSource = dsEventoImovel
        TabOrder = 0
      end
      object DBedtUsuario: TDBEdit
        Left = 16
        Top = 158
        Width = 457
        Height = 21
        DataField = 'USUARIO_EXTENSO'
        DataSource = dsEventoImovel
        MaxLength = 60
        TabOrder = 3
      end
      object TDBEdit
        Left = 376
        Top = 32
        Width = 97
        Height = 21
        DataField = 'EVIDATA'
        DataSource = dsEventoImovel
        TabOrder = 1
      end
    end
    inline molImovelAtivo: TmolImovelAtivo
      Left = 1
      Top = 8
      Width = 494
      TabOrder = 3
      inherited Label5: TLabel
        Width = 115
        Caption = 'Imóvel Remembrado'
      end
      inherited edtImovel: TEdit
        Width = 435
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 444
        OnClick = molImovelAtivobtnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 468
        OnClick = molImovelAtivobtnLimpaImovelClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 506
    inherited tb97Fundo: TToolbar97
      Left = 334
      DockPos = 481
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 47
      inherited ToolbarSep974: TToolbarSep97
        Left = 281
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Width = 196
        Caption = 'Desfazer Remembramento'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object cdsImoveisOriginais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 96
  end
  object cdsEventoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 112
  end
  object dsImoveisOriginais: TDataSource
    DataSet = cdsImoveisOriginais
    Left = 104
    Top = 128
  end
  object dsEventoImovel: TDataSource
    DataSet = cdsEventoImovel
    Left = 384
    Top = 160
  end
  object cdsImovelXBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 144
  end
end
