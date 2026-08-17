inherited frmCadRegCondenacao: TfrmCadRegCondenacao
  Left = 366
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 
    'Informação dos Valores de Condenação Correspondentes a Cada Part' +
    'e'
  ClientHeight = 318
  ClientWidth = 571
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 571
    Height = 279
    BorderWidth = 2
    object Label17: TLabel
      Left = 227
      Top = 13
      Width = 69
      Height = 13
      Caption = 'Nosso Valor'
    end
    object Label1: TLabel
      Left = 24
      Top = 13
      Width = 63
      Height = 13
      Caption = 'Valor Total'
    end
    object dbredNossoValor: TDBRealEdit
      Left = 227
      Top = 29
      Width = 116
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
      DataField = 'VALORCONDENACAO'
      DataSource = ds
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 66
      Width = 529
      Height = 193
      Caption = 'Valor(es) do(s) Nosso(s) Litisconsorte(s)'
      TabOrder = 1
      object dbgdCondenacao: TwwDBGrid
        Left = 2
        Top = 15
        Width = 525
        Height = 176
        Selected.Strings = (
          'NOME'#9'60'#9'Litisconsorte'
          'VALORCONDENACAO'#9'16'#9'Valor Condenação'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLitis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
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
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    object redValorTotal: TDBRealEdit
      Left = 24
      Top = 29
      Width = 116
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '0,00')
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
  end
  inherited Dock971: TDock97
    Top = 279
    Width = 571
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 9
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 530
    Top = 9
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 489
    Top = 9
  end
  object dsLitis: TwwDataSource
    DataSet = CdsLitis
    Left = 449
    Top = 137
  end
  object CdsLitis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 490
    Top = 137
  end
end
