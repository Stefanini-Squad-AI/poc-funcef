inherited frmImportaRMMT: TfrmImportaRMMT
  Left = 169
  Top = 117
  Caption = 'Importação dos dados da RM'
  ClientHeight = 377
  ClientWidth = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 550
    Height = 338
    object Label1: TLabel
      Left = 24
      Top = 57
      Width = 101
      Height = 13
      Caption = 'Tipo de operação'
    end
    object Label6: TLabel
      Left = 238
      Top = 57
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label5: TLabel
      Left = 432
      Top = 13
      Width = 64
      Height = 13
      Caption = 'N° Colunas'
    end
    object Label4: TLabel
      Left = 18
      Top = 257
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
    object Label7: TLabel
      Left = 24
      Top = 13
      Width = 118
      Height = 13
      Caption = 'Arquivo Selecionado'
    end
    object Bevel2: TBevel
      Left = 17
      Top = 112
      Width = 512
      Height = 2
      Style = bsRaised
    end
    object btnSelecionar: TBitBtn
      Left = 386
      Top = 25
      Width = 29
      Height = 25
      TabOrder = 0
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
    object edtPath: TEdit
      Left = 24
      Top = 27
      Width = 361
      Height = 21
      TabStop = False
      Color = 14876158
      ReadOnly = True
      TabOrder = 1
    end
    object dblkTipoOper: TwwDBLookupCombo
      Left = 24
      Top = 72
      Width = 201
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
      LookupTable = cdsTipoOper
      LookupField = 'TIPCODIGO'
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkAtivProj: TwwDBLookupCombo
      Left = 236
      Top = 72
      Width = 150
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'UNECODIGO'#9'10'#9'Codigo'
        'NOME'#9'25'#9'Atividade/Projeto')
      LookupTable = cdsAtivProj
      LookupField = 'UNIDNEGOC'
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object rgVersao: TRadioGroup
      Left = 402
      Top = 62
      Width = 128
      Height = 32
      Caption = ' Versão '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Antiga'
        '&Nova')
      TabOrder = 4
    end
    object prbImportar: TProgressBar
      Left = 5
      Top = 312
      Width = 540
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 5
    end
    object Anim: TAnimate
      Left = 12
      Top = 303
      Width = 18
      Height = 16
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
    object redNumColunas: TwwDBSpinEdit
      Left = 431
      Top = 27
      Width = 95
      Height = 21
      Increment = 1
      MaxValue = 10000
      TabOrder = 7
      UnboundDataType = wwDefault
    end
    object Panel1: TPanel
      Left = 17
      Top = 130
      Width = 514
      Height = 123
      TabOrder = 8
      object mmLog: TRichEdit
        Left = 3
        Top = 3
        Width = 508
        Height = 116
        Lines.Strings = (
          '')
        PlainText = True
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 550
    inherited tb97Fundo: TToolbar97
      Left = 299
      inherited sep1: TToolbarSep97
        Left = 165
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
        Left = 167
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
  inherited ivTradutor: TIvExtendedTranslator
    Top = 371
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 45
    Top = 77
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 88
  end
  object opdlgtxt: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Textos|*.txt'
    Left = 400
    Top = 32
  end
end
