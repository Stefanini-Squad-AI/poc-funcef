inherited frmImportaDinamicaMT: TfrmImportaDinamicaMT
  Left = 164
  Top = 109
  Caption = 'Importação da Folha da Dinâmica'
  ClientHeight = 389
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 350
    object Panel4: TPanel
      Left = 5
      Top = 5
      Width = 498
      Height = 340
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel2: TBevel
        Left = 11
        Top = 131
        Width = 466
        Height = 2
        Style = bsRaised
      end
      object Label4: TLabel
        Left = 7
        Top = 279
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
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Arquivo Selecionado'
      end
      object lblPlano: TLabel
        Left = 16
        Top = 52
        Width = 112
        Height = 13
        Caption = 'Plano para Importar'
      end
      object Label5: TLabel
        Left = 275
        Top = 52
        Width = 101
        Height = 13
        Caption = 'Tipo de operação'
      end
      object Panel1: TPanel
        Left = 12
        Top = 149
        Width = 468
        Height = 123
        TabOrder = 0
        object mmLog: TRichEdit
          Left = 3
          Top = 3
          Width = 462
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
      object prbImportar: TProgressBar
        Left = 0
        Top = 319
        Width = 498
        Height = 21
        Align = alBottom
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 1
      end
      object Animate1: TAnimate
        Left = 4
        Top = 312
        Width = 18
        Height = 16
        Active = False
        AutoSize = False
        CommonAVI = aviFindFile
        StopFrame = 8
        Visible = False
      end
      object edtPath: TEdit
        Left = 16
        Top = 23
        Width = 430
        Height = 21
        TabStop = False
        Color = 14876158
        ReadOnly = True
        TabOrder = 3
      end
      object btnSelecionar: TBitBtn
        Left = 449
        Top = 20
        Width = 29
        Height = 25
        TabOrder = 4
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
      object dblkTipoOper: TwwDBLookupCombo
        Left = 275
        Top = 68
        Width = 203
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
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkPlano: TwwDBLookupCombo
        Left = 16
        Top = 68
        Width = 246
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANO'#9'20'#9'Descrição'
          'PLANO'#9'10'#9'Código')
        LookupTable = cdsPlanoConta
        LookupField = 'PLANO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object chkHist: TCheckBox
        Left = 16
        Top = 100
        Width = 489
        Height = 17
        Caption = 
          'Concatenar os Históricos Importados com os Históricos cadastrado' +
          's'
        TabOrder = 7
      end
    end
  end
  inherited Dock971: TDock97
    Top = 350
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 257
      DockPos = 286
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
    Top = 411
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object opdlgtxt: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Textos|*.txt'
    Left = 56
    Top = 400
  end
  object cdsPlanoConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 227
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 110
    Top = 227
  end
end
