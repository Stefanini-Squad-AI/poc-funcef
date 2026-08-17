inherited frmExpPosadasMT: TfrmExpPosadasMT
  Left = 171
  Top = 91
  Caption = 'Exporta Arquivos para Posadas'
  ClientHeight = 409
  ClientWidth = 471
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    Height = 370
    object Label3: TLabel
      Left = 24
      Top = 24
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
      Top = 24
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
    object lblCaminho: TLabel
      Left = 24
      Top = 72
      Width = 183
      Height = 13
      Caption = 'Diretório para Gerar os Arquivos'
    end
    object lblMensagens: TLabel
      Left = 8
      Top = 226
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
    object lblEmpresa: TLabel
      Left = 376
      Top = 24
      Width = 49
      Height = 13
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkExercicioCloseUp
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 128
      Top = 40
      Width = 241
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
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object prbExportar: TProgressBar
      Left = 5
      Top = 348
      Width = 461
      Height = 17
      Align = alBottom
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 248
      Top = 116
      Width = 206
      Height = 107
      Caption = 'TNV'
      TabOrder = 5
      object Label1: TLabel
        Left = 8
        Top = 78
        Width = 53
        Height = 13
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbGeraTNV: TCheckBox
        Left = 8
        Top = 18
        Width = 190
        Height = 17
        Caption = 'Gera este Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbConsideraCorTNV: TCheckBox
        Left = 8
        Top = 42
        Width = 192
        Height = 17
        Caption = 'Gera Contas Correspondentes'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object edCodEmpTNV: TEdit
        Left = 67
        Top = 70
        Width = 124
        Height = 21
        TabOrder = 2
      end
    end
    object edCaminho: TEdit
      Left = 24
      Top = 88
      Width = 425
      Height = 21
      TabOrder = 3
    end
    object mmStatus: TRichEdit
      Left = 5
      Top = 243
      Width = 461
      Height = 105
      TabStop = False
      Align = alBottom
      Color = clBtnFace
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object gbBalancete: TGroupBox
      Left = 24
      Top = 116
      Width = 218
      Height = 107
      Caption = 'Balancete'
      TabOrder = 4
      object lblHoraIniBalM: TLabel
        Left = 256
        Top = 37
        Width = 105
        Height = 13
        AutoSize = False
      end
      object cbSoAnalitica: TCheckBox
        Left = 8
        Top = 50
        Width = 207
        Height = 17
        Caption = 'Gera somente Contas Analíticas'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbDesconsideraEstatistica: TCheckBox
        Left = 8
        Top = 32
        Width = 207
        Height = 17
        Caption = 'Não Inclui Contas Estatísticas'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbConsideraCorBalan: TCheckBox
        Left = 8
        Top = 68
        Width = 207
        Height = 17
        Caption = 'Gera Contas Correspondentes'
        TabOrder = 3
      end
      object cbGeraBalancete: TCheckBox
        Left = 8
        Top = 14
        Width = 207
        Height = 17
        Caption = 'Gera este Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbGeraLanc: TCheckBox
        Left = 8
        Top = 86
        Width = 192
        Height = 17
        Caption = 'Gera Lançamentos do Perído'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object edCodEmp: TEdit
      Left = 376
      Top = 40
      Width = 75
      Height = 21
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 471
    inherited tb97Fundo: TToolbar97
      Left = 128
      DockPos = 128
      inherited sep1: TToolbarSep97
        Left = 219
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 137
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 139
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 221
      end
      object btnExportar: TBitBtn
        Left = 0
        Top = 0
        Width = 137
        Height = 33
        Cancel = True
        Caption = '&Exportar'
        TabOrder = 2
        OnClick = btnExportarClick
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
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 356
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 259
    Top = 57
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 302
    Top = 54
  end
  object cdsExportaBal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 363
    Top = 49
  end
end
