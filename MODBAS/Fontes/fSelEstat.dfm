inherited frmSelEstat: TfrmSelEstat
  Left = 229
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estatísticas do Quadro de Pessoal'
  ClientWidth = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 492
    BorderWidth = 2
    object rgTipoEstat: TRadioGroup
      Left = 21
      Top = 20
      Width = 134
      Height = 190
      Hint = 'Escolha Uma das Opções'
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
      ShowHint = True
      TabOrder = 0
      OnClick = rgTipoEstatClick
    end
    object gbxValores: TGroupBox
      Left = 183
      Top = 20
      Width = 289
      Height = 190
      Caption = 'Faixas de Valores'
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 33
        Top = 18
        Width = 42
        Height = 13
        Caption = 'Faixa 1'
      end
      object Label2: TLabel
        Left = 33
        Top = 39
        Width = 42
        Height = 13
        Caption = 'Faixa 2'
      end
      object Label3: TLabel
        Left = 33
        Top = 60
        Width = 42
        Height = 13
        Caption = 'Faixa 3'
      end
      object Label4: TLabel
        Left = 33
        Top = 81
        Width = 42
        Height = 13
        Caption = 'Faixa 4'
      end
      object Label5: TLabel
        Left = 33
        Top = 102
        Width = 42
        Height = 13
        Caption = 'Faixa 5'
      end
      object Label6: TLabel
        Left = 33
        Top = 123
        Width = 42
        Height = 13
        Caption = 'Faixa 6'
      end
      object Label7: TLabel
        Left = 33
        Top = 144
        Width = 42
        Height = 13
        Caption = 'Faixa 7'
      end
      object Label8: TLabel
        Left = 33
        Top = 165
        Width = 42
        Height = 13
        Caption = 'Faixa 8'
      end
      object ednMin1: TEditNum
        Left = 114
        Top = 18
        Width = 64
        Height = 21
        TabOrder = 0
        Text = 'ednMin1'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax1: TEditNum
        Left = 195
        Top = 18
        Width = 64
        Height = 21
        TabOrder = 1
        Text = 'ednMax1'
        OnChange = ednMax1Change
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax2: TEditNum
        Left = 195
        Top = 39
        Width = 64
        Height = 21
        TabOrder = 3
        Text = 'ednMax2'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin2: TEditNum
        Left = 114
        Top = 39
        Width = 64
        Height = 21
        TabOrder = 2
        Text = 'ednMin2'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax3: TEditNum
        Left = 195
        Top = 60
        Width = 64
        Height = 21
        TabOrder = 5
        Text = 'ednMax3'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin3: TEditNum
        Left = 114
        Top = 60
        Width = 64
        Height = 21
        TabOrder = 4
        Text = 'ednMin3'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax4: TEditNum
        Left = 195
        Top = 81
        Width = 64
        Height = 21
        TabOrder = 7
        Text = 'ednMax4'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin4: TEditNum
        Left = 114
        Top = 81
        Width = 64
        Height = 21
        TabOrder = 6
        Text = 'ednMin4'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax5: TEditNum
        Left = 195
        Top = 102
        Width = 64
        Height = 21
        TabOrder = 9
        Text = 'ednMax5'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin5: TEditNum
        Left = 114
        Top = 102
        Width = 64
        Height = 21
        TabOrder = 8
        Text = 'ednMin5'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax6: TEditNum
        Left = 195
        Top = 123
        Width = 64
        Height = 21
        TabOrder = 11
        Text = 'ednMax6'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin6: TEditNum
        Left = 114
        Top = 123
        Width = 64
        Height = 21
        TabOrder = 10
        Text = 'ednMin6'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax7: TEditNum
        Left = 195
        Top = 144
        Width = 64
        Height = 21
        TabOrder = 13
        Text = 'ednMax7'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin7: TEditNum
        Left = 114
        Top = 144
        Width = 64
        Height = 21
        TabOrder = 12
        Text = 'ednMin7'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMax8: TEditNum
        Left = 195
        Top = 165
        Width = 64
        Height = 21
        TabOrder = 15
        Text = 'ednMax8'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednMin8: TEditNum
        Left = 114
        Top = 165
        Width = 64
        Height = 21
        TabOrder = 14
        Text = 'ednMin8'
        IntDigits = 8
        Signal = False
        DecDigits = 0
        Numeric = True
      end
    end
  end
  inherited Dock971: TDock97
    Width = 492
    inherited tb97Fundo: TToolbar97
      Left = 322
      DockPos = 322
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 154
      DockPos = 154
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
    end
  end
end
