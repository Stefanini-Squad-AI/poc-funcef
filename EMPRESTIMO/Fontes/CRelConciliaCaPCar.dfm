inherited cfgRelConciliaCapCar: TcfgRelConciliaCapCar
  Left = 85
  Top = 127
  Caption = 'Conciliação de Recebimentos - Financeiro - por Documento'
  ClientHeight = 363
  ClientWidth = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 584
    Height = 330
    object GroupBox2: TGroupBox
      Left = 216
      Top = 240
      Width = 353
      Height = 73
      TabOrder = 6
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 38
        Width = 87
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 408
      Top = 8
      Width = 161
      Height = 65
      Caption = ' Forma(s) de Envio '
      TabOrder = 1
      object chkCaP: TCheckBox
        Left = 16
        Top = 18
        Width = 105
        Height = 17
        Caption = 'A Pagar'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkCaR: TCheckBox
        Left = 16
        Top = 39
        Width = 105
        Height = 17
        Caption = 'A Receber'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object chkSintetico: TCheckBox
      Left = 32
      Top = 192
      Width = 537
      Height = 17
      Caption = 'Relatório Sintético'
      TabOrder = 4
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 8
      Width = 377
      Height = 65
      Caption = ' Período de Datas '
      TabOrder = 0
      object Label1: TLabel
        Left = 56
        Top = 18
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 216
        Top = 18
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label3: TLabel
        Left = 180
        Top = 36
        Width = 16
        Height = 13
        Caption = ' a '
      end
      object edtDataFim: TCMDateTimePicker
        Left = 216
        Top = 32
        Width = 105
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
        TabOrder = 1
      end
      object edtDataIni: TCMDateTimePicker
        Left = 56
        Top = 32
        Width = 105
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
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 80
      Width = 249
      Height = 97
      Caption = ' Exibir apenas Documento (Financeiro): '
      TabOrder = 2
      object chkValorDivergCapCar: TCheckBox
        Left = 16
        Top = 16
        Width = 169
        Height = 17
        Hint = 'Valor Recebido <> Valor Enviado'
        Caption = 'Com divergência de valor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object chkValorZeroCapCar: TCheckBox
        Left = 16
        Top = 56
        Width = 169
        Height = 17
        Hint = 'Valor Recebido = 0'
        Caption = 'Com valor recebido ZERO'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object chkValorNAOZeroCapCar: TCheckBox
        Left = 16
        Top = 36
        Width = 89
        Height = 17
        Hint = 'Valor Recebido > 0'
        Caption = 'Recebidos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chkNaoProcessadoCapCar: TCheckBox
        Left = 16
        Top = 76
        Width = 193
        Height = 17
        Caption = 'Ainda não recebidos'
        Color = clBtnFace
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 280
      Top = 80
      Width = 289
      Height = 97
      Caption = ' Exibir apenas Itens (Emprestimo): '
      TabOrder = 3
      object chkValorDivergEP: TCheckBox
        Left = 16
        Top = 16
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo não nulo e Valor Efetivo <> Valor Previsto'
        Caption = 'Com divergência de valor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object chkValorZeroEP: TCheckBox
        Left = 16
        Top = 56
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo nulo'
        Caption = 'Não recebidos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object chkValorNAOZeroEP: TCheckBox
        Left = 16
        Top = 36
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo não nulo'
        Caption = 'Recebidos '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chkDivergCapCarEP: TCheckBox
        Left = 16
        Top = 76
        Width = 265
        Height = 17
        Hint = 'Valor Efetivo (Empréstimo) <> Valor Recebido (Folha)'
        Caption = 'Com divergência de valor (para Financeiro)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object chkNaoEnviado: TCheckBox
      Left = 32
      Top = 216
      Width = 537
      Height = 17
      Caption = 'NÃO exibir itens não enviados'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 584
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
