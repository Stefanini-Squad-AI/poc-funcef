object frmLocalizaUnitPacote: TfrmLocalizaUnitPacote
  Left = 205
  Top = 99
  Width = 859
  Height = 525
  Caption = 'CGC - Controle e Gerência de Compilação'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalvar: TSpeedButton
    Left = 637
    Top = 22
    Width = 161
    Height = 58
    Caption = 'Salvar resultado'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    OnClick = btnSalvarClick
  end
  object Label1: TLabel
    Left = 9
    Top = 3
    Width = 27
    Height = 13
    Caption = 'Unit:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 101
    Height = 12
    Caption = 'Somente arquivo .PAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 105
    Width = 1266
    Height = 18
    Caption = 
      'DPK - BPL'#39's e seus programas                                    ' +
      '        DPR - Projetos                                          ' +
      '                       Unit'#39's                                 '
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object mmResultDPR: TMemo
    Left = 516
    Top = 126
    Width = 506
    Height = 508
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object edtUnit: TEdit
    Left = 9
    Top = 19
    Width = 337
    Height = 21
    TabOrder = 0
    OnKeyPress = edtUnitKeyPress
  end
  object btnAdicionar: TButton
    Left = 354
    Top = 13
    Width = 93
    Height = 29
    Caption = 'Adicionar'
    TabOrder = 1
    OnClick = btnAdicionarClick
  end
  object btnLocaliza: TButton
    Left = 353
    Top = 57
    Width = 95
    Height = 30
    Caption = 'Localiza'
    TabOrder = 2
    OnClick = btnLocalizaClick
  end
  object rgTipoBPL: TRadioGroup
    Left = 454
    Top = 6
    Width = 176
    Height = 92
    Caption = ' Tipo de BPL '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Negócio'
      'Padrão')
    TabOrder = 4
  end
  object mmResult: TMemo
    Left = 7
    Top = 126
    Width = 506
    Height = 507
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object mmUnit: TMemo
    Left = 1025
    Top = 126
    Width = 247
    Height = 508
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 408
    Top = 315
    Width = 409
    Height = 120
    TabOrder = 3
    object pnPas: TPanel
      Left = 8
      Top = 10
      Width = 393
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'PAS:'
      TabOrder = 0
    end
    object pnPacote: TPanel
      Left = 8
      Top = 37
      Width = 393
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'BPL:'
      TabOrder = 1
    end
    object pnCFG: TPanel
      Left = 8
      Top = 64
      Width = 393
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'CFG:'
      TabOrder = 2
    end
    object pnDPR: TPanel
      Left = 8
      Top = 90
      Width = 393
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'DPK:'
      TabOrder = 3
    end
  end
  object rgTipoArquivo: TRadioGroup
    Left = 8
    Top = 61
    Width = 338
    Height = 37
    Caption = ' Tipo de arquivo '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'DPK - BPL'#39's'
      'DPR - Projetos')
    TabOrder = 7
    OnClick = rgTipoArquivoClick
  end
  object btnInicializa: TButton
    Left = 1120
    Top = 27
    Width = 145
    Height = 41
    Caption = 'Inicializa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnInicializaClick
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 24
    object DPKBPL1: TMenuItem
      Caption = 'DPK - BPL'
      OnClick = DPKBPL1Click
    end
    object DPRProjetos1: TMenuItem
      Caption = 'DPR - Projetos'
      OnClick = DPRProjetos1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 768
    Top = 24
  end
end
