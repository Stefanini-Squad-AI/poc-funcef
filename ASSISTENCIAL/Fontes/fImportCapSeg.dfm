inherited frmImportCapSeg: TfrmImportCapSeg
  Left = 159
  Top = 126
  BorderStyle = bsSingle
  Caption = 'Importação de Tabela de Capitais de Seguro'
  ClientHeight = 390
  ClientWidth = 564
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 564
    Height = 351
    TabOrder = 2
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 564
    Height = 351
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 18
      Width = 82
      Height = 15
      Caption = 'Tipo de Layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 184
      Width = 130
      Height = 15
      Caption = 'Associação Existentes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgTpLayout: TwwDBGrid
      Left = 10
      Top = 42
      Width = 423
      Height = 127
      Selected.Strings = (
        'IDLAYOUT'#9'9'#9'Código'
        'DESCRICAO'#9'45'#9'Descrição')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTpLayout
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object wwDBGrid1: TwwDBGrid
      Left = 18
      Top = 202
      Width = 423
      Height = 127
      Selected.Strings = (
        'IDLAYOUT'#9'9'#9'Código'
        'DESCRICAO'#9'45'#9'Descrição')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTpLayout
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 564
    inherited tb97Fundo: TToolbar97
      Left = 191
      DockPos = 191
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 395
  end
  object qryCpLayout: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CPLAYOUT'
      'ORDER BY IDCPLAYOUT, IDLAYOUT')
    ValidateWithMask = True
    Left = 316
    Top = 61
  end
  object dsCpLayout: TwwDataSource
    DataSet = qryCpLayout
    Left = 347
    Top = 61
  end
  object dsTpLayout: TwwDataSource
    DataSet = qryTpLayout
    Left = 346
    Top = 24
  end
  object qryTpLayout: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT'
      'ORDER BY IDLAYOUT')
    ValidateWithMask = True
    Left = 315
    Top = 24
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    InitialDir = 'c:\'
    Title = 'ABRIR ARQUIVO PARA IMPORTAÇÃO'
    Left = 376
    Top = 120
  end
  object qryIns: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 316
    Top = 136
  end
  object qryCapSegAss: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CAPSEGASS')
    ValidateWithMask = True
    Left = 316
    Top = 96
  end
end
