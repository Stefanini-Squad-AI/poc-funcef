inherited frmImportaOrcExcelMT: TfrmImportaOrcExcelMT
  Left = 144
  Top = 12
  Caption = 'Importação de Valores Orçados - Planilhas Excel'
  ClientHeight = 377
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 338
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 273
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
      object btnImportar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Importar'
        TabOrder = 2
        OnClick = btnImportarClick
        Glyph.Data = {
          CA010000424DCA01000000000000760000002800000022000000110000000100
          0400000000005401000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333344443
          3333333333337777F3333300000033333334CC433333333333337F87F3333300
          000033333334CC433333333333337F87F3333300000033333334CC4333333333
          33337F87FFF33300000033333444CC44433333333377788777F3330000003333
          34CCCCCC433333333378F8888733330000003333334CCCC433333333FFF78F88
          7FFFF300000033000004CC4000033337777778F77777FF000000377777774477
          7770337777777777777778000000378FFFFFFFFFF877037F8FFFFFFFFFF7F700
          00003787777777777877037F777777777787F70000003788888888888877037F
          888888888887F70000003788888888882877037FFFFFFFFFFFF7F700000037FF
          FFFFFFFFFF77037777777777777787000000337888888888888703378FFFFFFF
          FFFFF70000003337777777777777333377777777777778000000333333333333
          333333333333333333333F000000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 526
    Height = 338
    object Bevel1: TBevel
      Left = 19
      Top = 65
      Width = 494
      Height = 2
      Style = bsRaised
    end
    object Label1: TLabel
      Left = 18
      Top = 79
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Bevel2: TBevel
      Left = 17
      Top = 122
      Width = 495
      Height = 2
      Style = bsRaised
    end
    object Label2: TLabel
      Left = 133
      Top = 19
      Width = 120
      Height = 13
      Caption = 'Planilha Selecionada'
    end
    object Label4: TLabel
      Left = 18
      Top = 255
      Width = 476
      Height = 13
      Caption = 
        'Obs.: Será criado um arquivo de histórico com o mesmo nome do ar' +
        'quivo importado (extensão .LOG).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 19
      Top = 17
      Width = 63
      Height = 13
      Caption = 'Linha Final'
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 18
      Top = 93
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
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtPath: TEdit
      Left = 134
      Top = 33
      Width = 343
      Height = 21
      TabStop = False
      Color = 14876158
      ReadOnly = True
      TabOrder = 7
    end
    object btnSelecionar: TBitBtn
      Left = 480
      Top = 30
      Width = 29
      Height = 24
      TabOrder = 1
      OnClick = btnSelecionarClick
      Glyph.Data = {
        16010000424D1601000000000000760000002800000010000000140000000100
        040000000000A000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880088888888888880910888888888888089108888888888880890000088
        88888880800FFF088888888800FFFFF0888888880FFFFFFF0888870008888888
        0088800B0F8F8F8F0B088007B0F8F8F0B70880B07B0F8F0B7B0880F0B7B777B7
        B7B080BF0B7B7B7B7B7080FBF0000000000880BFBFBFBFBFB08880FBFBFBFBFB
        F08880BFB0000000078887000788888888888888888888888888}
    end
    object pnlPlanoPatroC: TPanel
      Left = 112
      Top = 80
      Width = 395
      Height = 34
      BevelOuter = bvNone
      TabOrder = 3
      object lblPlanoPrevC: TLabel
        Left = 17
        Top = 0
        Width = 37
        Height = 13
        Caption = 'Plano:'
      end
      object lblPatroC: TLabel
        Left = 192
        Top = 0
        Width = 84
        Height = 13
        Caption = 'Patrocinadora:'
      end
      object dblcPlanoPrevC: TwwDBLookupCombo
        Left = 16
        Top = 13
        Width = 173
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPLANOPREV'
        LookupTable = CdsPatro
        LookupField = 'IDPLANOPREV'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPatroC: TwwDBLookupCombo
        Left = 193
        Top = 13
        Width = 201
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPATRO'
        LookupTable = CdsPlanoPrev
        LookupField = 'IDPESSOA'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object prgBar: TProgressBar
      Left = 5
      Top = 311
      Width = 516
      Height = 21
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 4
    end
    object Anim: TAnimate
      Left = 9
      Top = 305
      Width = 19
      Height = 16
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
    object Panel1: TPanel
      Left = 17
      Top = 143
      Width = 494
      Height = 108
      TabOrder = 5
      object mmLog: TRichEdit
        Left = 2
        Top = 2
        Width = 490
        Height = 102
        Lines.Strings = (
          '')
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object spnLinhaFim: TSpinEdit
      Left = 19
      Top = 32
      Width = 93
      Height = 22
      MaxValue = 50000
      MinValue = 2
      TabOrder = 0
      Value = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 483
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object dlg: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Arquivos Excel|*.xls'
    Left = 136
    Top = 72
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 69
    Top = 93
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 24
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 24
  end
  object sqlPlanilha: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  ('#39'                  '#39') as PLACONTA,'
      '  ('#39'          '#39') as CODCENTROCUSTO,'
      '  (0) as UNIDNEGOC,'
      '  (0) as CODSUBCONTA,'
      '  ('#39' '#39') as DEBCRE,'
      '  (0) as VALOR_ORC1,'
      '  (0) as VALOR_ORC2,'
      '  (0) as VALOR_ORC3,'
      '  (0) as VALOR_ORC4,'
      '  (0) as VALOR_ORC5,'
      '  (0) as VALOR_ORC6,'
      '  (0) as VALOR_ORC7,'
      '  (0) as VALOR_ORC8,'
      '  (0) as VALOR_ORC9,'
      '  (0) as VALOR_ORC10,'
      '  (0) as VALOR_ORC11,'
      '  (0) as VALOR_ORC12'
      'FROM LANCAMENTO'
      'WHERE 1=2'
      ''
      '')
    ClientDataSet = cdsPlanilha
    Left = 464
    Top = 48
  end
  object cdsPlanilha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 64
  end
end
