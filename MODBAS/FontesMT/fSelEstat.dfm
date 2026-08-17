inherited frmSelEstat: TfrmSelEstat
  Left = 179
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estatísticas do Quadro de Pessoal'
  ClientWidth = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    BorderWidth = 2
    object rgTipoEstat: TRadioGroup
      Left = 17
      Top = 11
      Width = 134
      Height = 207
      Caption = 'Tipo de Estatística'
      ItemIndex = 0
      Items.Strings = (
        'Sexo'
        'Estado Civil'
        'Escolaridade'
        'Tempo de Casa'
        'Faixa de CEP'
        'Faixa Etária'
        'Faixa de Salário'
        'Sindicato'
        'Tipo de Função')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = rgTipoEstatClick
    end
    object gbxValores: TGroupBox
      Left = 165
      Top = 11
      Width = 289
      Height = 207
      Caption = 'Faixas de Valores'
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 33
        Top = 19
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 1'
      end
      object Label2: TLabel
        Left = 33
        Top = 42
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 2'
      end
      object Label3: TLabel
        Left = 33
        Top = 65
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 3'
      end
      object Label4: TLabel
        Left = 33
        Top = 88
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 4'
      end
      object Label5: TLabel
        Left = 33
        Top = 111
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 5'
      end
      object Label6: TLabel
        Left = 33
        Top = 134
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 6'
      end
      object Label7: TLabel
        Left = 33
        Top = 157
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 7'
      end
      object Label8: TLabel
        Left = 33
        Top = 180
        Width = 72
        Height = 13
        AutoSize = False
        Caption = 'Faixa 8'
      end
      object ednMin1: TRealEdit
        Left = 114
        Top = 15
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax1: TRealEdit
        Left = 195
        Top = 15
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        OnChange = ednMax1Change
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax2: TRealEdit
        Left = 195
        Top = 38
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin2: TRealEdit
        Left = 114
        Top = 38
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax3: TRealEdit
        Left = 195
        Top = 61
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin3: TRealEdit
        Left = 114
        Top = 61
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax4: TRealEdit
        Left = 195
        Top = 84
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin4: TRealEdit
        Left = 114
        Top = 84
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax5: TRealEdit
        Left = 195
        Top = 107
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 9
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin5: TRealEdit
        Left = 114
        Top = 107
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax6: TRealEdit
        Left = 195
        Top = 130
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 11
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin6: TRealEdit
        Left = 114
        Top = 130
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 10
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax7: TRealEdit
        Left = 195
        Top = 153
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 13
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin7: TRealEdit
        Left = 114
        Top = 153
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 12
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMax8: TRealEdit
        Left = 195
        Top = 176
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 15
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object ednMin8: TRealEdit
        Left = 114
        Top = 176
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 14
        WordWrap = False
        IntDigits = 8
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 471
    inherited tb97Fundo: TToolbar97
      Left = 222
      DockPos = 322
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 228
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
end
