inherited frmSelSimul: TfrmSelSimul
  Left = 193
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Simulação de Aumentos'
  ClientHeight = 379
  ClientWidth = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    Height = 340
    BorderWidth = 2
    object gbxValores: TGroupBox
      Left = 11
      Top = 118
      Width = 435
      Height = 211
      Hint = 'Valores Limites e Respectivos % de Aumento'
      Caption = 'Faixas Salariais'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      object Label2: TLabel
        Left = 33
        Top = 30
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 1'
        ParentShowHint = False
        ShowHint = False
      end
      object Label3: TLabel
        Left = 33
        Top = 51
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 2'
        ParentShowHint = False
        ShowHint = False
      end
      object Label4: TLabel
        Left = 33
        Top = 74
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 3'
        ParentShowHint = False
        ShowHint = False
      end
      object Label5: TLabel
        Left = 33
        Top = 95
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 4'
        ParentShowHint = False
        ShowHint = False
      end
      object Label6: TLabel
        Left = 33
        Top = 118
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 5'
        ParentShowHint = False
        ShowHint = False
      end
      object Label7: TLabel
        Left = 33
        Top = 140
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 6'
        ParentShowHint = False
        ShowHint = False
      end
      object Label8: TLabel
        Left = 33
        Top = 162
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 7'
        ParentShowHint = False
        ShowHint = False
      end
      object Label9: TLabel
        Left = 33
        Top = 183
        Width = 76
        Height = 13
        AutoSize = False
        Caption = 'Faixa 8'
        ParentShowHint = False
        ShowHint = False
      end
      object Label10: TLabel
        Left = 138
        Top = 12
        Width = 20
        Height = 13
        Caption = 'Até'
        ParentShowHint = False
        ShowHint = False
      end
      object Label11: TLabel
        Left = 195
        Top = 12
        Width = 62
        Height = 13
        Caption = 'Percentual'
        ParentShowHint = False
        ShowHint = False
      end
      object Label12: TLabel
        Left = 285
        Top = 12
        Width = 48
        Height = 13
        Caption = 'A Somar'
        ParentShowHint = False
        ShowHint = False
      end
      object Label13: TLabel
        Left = 372
        Top = 12
        Width = 25
        Height = 13
        Caption = 'Piso'
        ParentShowHint = False
        ShowHint = False
      end
      object rednMax1: TRealEdit
        Left = 114
        Top = 26
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer1: TRealEdit
        Left = 195
        Top = 26
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc1: TRealEdit
        Left = 276
        Top = 26
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso1: TRealEdit
        Left = 357
        Top = 26
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax2: TRealEdit
        Left = 114
        Top = 48
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer2: TRealEdit
        Left = 195
        Top = 48
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc2: TRealEdit
        Left = 276
        Top = 48
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso2: TRealEdit
        Left = 357
        Top = 48
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax3: TRealEdit
        Left = 114
        Top = 70
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer3: TRealEdit
        Left = 195
        Top = 70
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc3: TRealEdit
        Left = 276
        Top = 70
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso3: TRealEdit
        Left = 357
        Top = 70
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax4: TRealEdit
        Left = 114
        Top = 92
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 12
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer4: TRealEdit
        Left = 195
        Top = 92
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc4: TRealEdit
        Left = 276
        Top = 92
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 14
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso4: TRealEdit
        Left = 357
        Top = 92
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax5: TRealEdit
        Left = 114
        Top = 114
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 16
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer5: TRealEdit
        Left = 195
        Top = 114
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 17
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc5: TRealEdit
        Left = 276
        Top = 114
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 18
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso5: TRealEdit
        Left = 357
        Top = 114
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 19
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax6: TRealEdit
        Left = 114
        Top = 136
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 20
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer6: TRealEdit
        Left = 195
        Top = 136
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 21
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc6: TRealEdit
        Left = 276
        Top = 136
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 22
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso6: TRealEdit
        Left = 357
        Top = 136
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 23
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax7: TRealEdit
        Left = 114
        Top = 158
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 24
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer7: TRealEdit
        Left = 195
        Top = 158
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 25
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc7: TRealEdit
        Left = 276
        Top = 158
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 26
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso7: TRealEdit
        Left = 357
        Top = 158
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 27
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednMax8: TRealEdit
        Left = 114
        Top = 180
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 28
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPer8: TRealEdit
        Left = 195
        Top = 180
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 29
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParc8: TRealEdit
        Left = 276
        Top = 180
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 30
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPiso8: TRealEdit
        Left = 357
        Top = 180
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 31
        WordWrap = False
        OnChange = rednMax1Change
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object rgTipoSimul: TRadioGroup
      Left = 11
      Top = 6
      Width = 172
      Height = 110
      Caption = 'Percentual de Aumento'
      ItemIndex = 0
      Items.Strings = (
        'Único'
        'Em Função do Salário')
      TabOrder = 0
      OnClick = rgTipoSimulClick
    end
    object rgTipoArre: TRadioGroup
      Left = 225
      Top = 6
      Width = 220
      Height = 110
      Caption = 'Arredondamento'
      ItemIndex = 0
      Items.Strings = (
        'Nenhum'
        'Próxima Dezena de Centavo'
        'Próxima Unidade'
        'Próxima Dezena'
        'Próxima Centena')
      TabOrder = 1
    end
    object gbxUnico: TGroupBox
      Left = 64
      Top = 175
      Width = 334
      Height = 105
      Caption = 'Valores a Considerar'
      TabOrder = 2
      object Label14: TLabel
        Left = 39
        Top = 30
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label15: TLabel
        Left = 141
        Top = 30
        Width = 48
        Height = 13
        Caption = 'A Somar'
      end
      object Label16: TLabel
        Left = 258
        Top = 30
        Width = 25
        Height = 13
        Caption = 'Piso'
      end
      object rednPercUn: TRealEdit
        Left = 39
        Top = 45
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        OnChange = rednPercUnChange
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednParcUn: TRealEdit
        Left = 135
        Top = 45
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        OnChange = rednPercUnChange
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rednPisoUn: TRealEdit
        Left = 237
        Top = 45
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        OnChange = rednPercUnChange
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 340
    Width = 457
    inherited tb97Fundo: TToolbar97
      Left = 209
      DockPos = 286
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        Enabled = False
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
    Left = 59
    Top = 331
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
