object FrmCriaEstrutura: TFrmCriaEstrutura
  Left = 346
  Top = 170
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cria / Altera estrutura para arquivo de saida da regra'
  ClientHeight = 249
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PrintScale = poNone
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 1
    Width = 79
    Height = 13
    Caption = 'Nome do Campo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 113
    Top = 1
    Width = 21
    Height = 13
    Caption = 'Tipo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Pbotoes: TPanel
    Left = 0
    Top = 211
    Width = 377
    Height = 41
    TabOrder = 8
  end
  object Ptamanho: TPanel
    Left = 186
    Top = 19
    Width = 65
    Height = 67
    Caption = ' '
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 4
      Width = 45
      Height = 13
      Caption = 'Tamanho'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Utamanho: TUpDown
      Left = 42
      Top = 24
      Width = 15
      Height = 23
      Associate = tamanho
      Min = 0
      Max = 25
      Position = 0
      TabOrder = 0
      Wrap = False
    end
    object tamanho: TEdit
      Left = 9
      Top = 24
      Width = 33
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnEnter = tamanhoEnter
      OnExit = tamanhoExit
    end
  end
  object nomecampo: TEdit
    Left = 8
    Top = 20
    Width = 100
    Height = 23
    Hint = 'Máximo de 12 caracteres'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnEnter = nomecampoEnter
    OnExit = nomecampoExit
  end
  object descricao: TListBox
    Left = 8
    Top = 99
    Width = 305
    Height = 97
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 4
  end
  object Binclui: TButton
    Left = 17
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Inclui novo registro no final'
    Caption = '&Inclui'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BincluiClick
  end
  object tipo: TListBox
    Left = 111
    Top = 19
    Width = 74
    Height = 67
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 15
    Items.Strings = (
      'Caracter'
      'Data'
      'Numérico')
    ParentFont = False
    TabOrder = 1
    OnClick = tipoClick
  end
  object PDecimal: TPanel
    Left = 251
    Top = 19
    Width = 64
    Height = 67
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 5
      Width = 38
      Height = 13
      Caption = 'Decimal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object decimal: TEdit
      Left = 8
      Top = 23
      Width = 32
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnExit = decimalExit
    end
    object Udecimal: TUpDown
      Left = 40
      Top = 23
      Width = 15
      Height = 23
      Associate = decimal
      Min = 0
      Max = 8
      Position = 0
      TabOrder = 0
      Wrap = False
    end
  end
  object Bexclui: TButton
    Left = 166
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Exclui registro'
    Caption = '&Exclui'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BexcluiClick
  end
  object Bsaida: TButton
    Left = 314
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Sai sem salvar estrutura'
    Caption = '&Saída'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BsaidaClick
  end
  object BOk: TButton
    Left = 215
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Conclui a criação da estrutura'
    Caption = '&Ok'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = BOkClick
  end
  object BCancela: TButton
    Left = 265
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Apaga os registros'
    Caption = '&Apaga'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = BCancelaClick
  end
  object BMeio: TButton
    Left = 67
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Inclui novo registro acima do registro selecionado'
    Caption = 'In&serir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = BMeioClick
  end
  object Button1: TButton
    Left = 117
    Top = 219
    Width = 50
    Height = 25
    Hint = 'Altera o registro selecionado'
    Caption = 'E&ditar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = Button1Click
  end
end
