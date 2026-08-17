inherited frmImportaExcelMT: TfrmImportaExcelMT
  Left = 301
  Top = 200
  Caption = 'Importação de Lançamentos Externos - Planilhas Excel'
  ClientHeight = 387
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 504
    Height = 348
    object Bevel2: TBevel
      Left = 1
      Top = 153
      Width = 502
      Height = 3
      Align = alTop
      Style = bsRaised
    end
    object Label4: TLabel
      Left = 14
      Top = 290
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
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 502
      Height = 152
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 99
        Width = 101
        Height = 13
        Caption = 'Tipo de operação'
      end
      object Label5: TLabel
        Left = 15
        Top = 7
        Width = 63
        Height = 13
        Caption = 'Linha Final'
      end
      object Label2: TLabel
        Left = 15
        Top = 52
        Width = 118
        Height = 13
        Caption = 'Arquivo Selecionado'
      end
      object Label3: TLabel
        Left = 136
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Col. Inicial'
      end
      object Label6: TLabel
        Left = 230
        Top = 7
        Width = 54
        Height = 13
        Caption = 'Col. Final'
      end
      object Label7: TLabel
        Left = 354
        Top = 98
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object btnSelecionar: TBitBtn
        Left = 463
        Top = 67
        Width = 30
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
      object edtPath: TEdit
        Left = 15
        Top = 67
        Width = 442
        Height = 21
        TabStop = False
        Color = 14876158
        ReadOnly = True
        TabOrder = 4
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 15
        Top = 115
        Width = 323
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
      object edData: TCMDateTimePicker
        Left = 351
        Top = 115
        Width = 144
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 3
      end
      object edtLinhaFinal: TwwDBSpinEdit
        Left = 15
        Top = 23
        Width = 90
        Height = 21
        Increment = 1
        MaxValue = 10000
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
    object prbImportar: TProgressBar
      Left = 1
      Top = 331
      Width = 502
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object Anim: TAnimate
      Left = 4
      Top = 311
      Width = 18
      Height = 17
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 156
      Width = 502
      Height = 126
      Align = alTop
      TabOrder = 3
      object mmLog: TRichEdit
        Left = 3
        Top = 4
        Width = 491
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
    object edtColIni: TEdit
      Left = 136
      Top = 23
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = 'B'
    end
    object edtColFinal: TEdit
      Left = 229
      Top = 23
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      Text = 'M'
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 251
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 227
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 141
  end
  object opdlgtxt: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Arquivos Excel|*.xls|Todos|*.*'
    Left = 168
    Top = 176
  end
end
