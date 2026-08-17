inherited frmEncerraResultadosMT: TfrmEncerraResultadosMT
  Left = 235
  Top = 248
  Caption = 'Encerra Contas de Resultado'
  ClientHeight = 384
  ClientWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 401
    Height = 345
    object Label3: TLabel
      Left = 24
      Top = 0
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 0
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHistPadrao: TLabel
      Left = 24
      Top = 35
      Width = 95
      Height = 13
      Caption = 'Histórico Padrão'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 198
      Width = 65
      Height = 13
      Caption = 'Mensagens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCentroCusto: TLabel
      Left = 24
      Top = 75
      Width = 269
      Height = 13
      Caption = 'Centro de Custo para a Conta de Encerramento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 115
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtExercicio: TEdit
      Left = 24
      Top = 14
      Width = 89
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 128
      Top = 14
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PEREXERCI'
      LookupTable = CdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcHistPadrao: TCMDBLookupCombo
      Left = 24
      Top = 48
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'HITDESCR1'#9'200'#9'Descrição'
        'HITCODHIST'#9'4'#9'Código')
      LookupTable = CdsHistoPadrao
      LookupField = 'HITCODHIST'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object mmStatus: TRichEdit
      Left = 24
      Top = 212
      Width = 361
      Height = 121
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object prbImportar: TProgressBar
      Left = 24
      Top = 180
      Width = 361
      Height = 17
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 4
    end
    object Anim: TAnimate
      Left = 25
      Top = 180
      Width = 18
      Height = 16
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
    object cbAtualiza: TCheckBox
      Left = 24
      Top = 160
      Width = 328
      Height = 17
      Caption = 'Atualizar somente o Período Indicado'
      TabOrder = 6
    end
    object dblcCentroCusto: TCMDBLookupCombo
      Left = 24
      Top = 89
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'#9'F'
        'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
      LookupTable = cdsCentroCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdOper: TDBEdit
      Left = 24
      Top = 128
      Width = 358
      Height = 21
      Color = clBtnFace
      DataField = 'TIPDESCRICAO'
      DataSource = dsqryaux
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 401
    inherited tb97Fundo: TToolbar97
      Left = 148
      inherited sep1: TToolbarSep97
        Left = 166
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object btnEncerrar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Encerrar'
        TabOrder = 2
        OnClick = btnEncerrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F88887555555555088888788888888878F887D558855555
          508887F88FFF888887F887D5FFF8555550888788777FF888878F7D55FFFF8555
          55087F887777FF88887F7D55FFFFF85555087F8877777FF8887F7D55FF8FFF85
          55087F8877F777FF887F7D55FF85FFF855087F8877F8777F887F7D55FF555FF8
          550878F87788877FF87887D5555555FF508887F88888887787F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 323
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object CdsHistoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 45
    Top = 199
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 200
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 200
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 256
  end
  object dsqryaux: TDataSource
    DataSet = qryAux
    Left = 136
    Top = 280
  end
end
