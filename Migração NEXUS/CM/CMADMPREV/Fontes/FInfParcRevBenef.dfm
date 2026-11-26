inherited FrmInfParcRevBenef: TFrmInfParcRevBenef
  Left = 138
  Top = 216
  Caption = 'Informações para Parcelamento da Revisão de Benefícios ...'
  ClientHeight = 104
  ClientWidth = 1048
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 167
    Top = 86
    Width = 95
    Height = 13
    Caption = 'Acertos de INSS'
  end
  object Label13: TLabel [1]
    Left = 167
    Top = 139
    Width = 121
    Height = 13
    Caption = 'Acertos de Benefício'
  end
  object Label14: TLabel [2]
    Left = 167
    Top = 192
    Width = 137
    Height = 13
    Caption = 'Acertos de Contribuição'
  end
  inherited pnlFundo: TPanel
    Width = 1048
    Height = 65
    object lbl1: TLabel
      Left = 157
      Top = 11
      Width = 116
      Height = 13
      Caption = 'Saldo Revisão INSS'
    end
    object lbl2: TLabel
      Left = 298
      Top = 11
      Width = 77
      Height = 13
      Caption = 'Valor Parcela'
    end
    object lbl3: TLabel
      Left = 777
      Top = 11
      Width = 34
      Height = 13
      Caption = 'Início'
    end
    object lbl4: TLabel
      Left = 913
      Top = 11
      Width = 20
      Height = 13
      Caption = 'Fim'
    end
    object lbl5: TLabel
      Left = 409
      Top = 11
      Width = 62
      Height = 13
      Caption = 'Percentual'
    end
    object lbl6: TLabel
      Left = 512
      Top = 11
      Width = 81
      Height = 13
      Caption = 'Qtde Parcelas'
    end
    object lbl7: TLabel
      Left = 157
      Top = 12
      Width = 126
      Height = 13
      Caption = 'Saldo Revisão Funcef'
    end
    object lbl8: TLabel
      Left = 298
      Top = 12
      Width = 77
      Height = 13
      Caption = 'Valor Parcela'
    end
    object lbl9: TLabel
      Left = 777
      Top = 12
      Width = 34
      Height = 13
      Caption = 'Início'
    end
    object lbl10: TLabel
      Left = 913
      Top = 12
      Width = 20
      Height = 13
      Caption = 'Fim'
    end
    object lbl11: TLabel
      Left = 409
      Top = 12
      Width = 62
      Height = 13
      Caption = 'Percentual'
    end
    object lbl12: TLabel
      Left = 512
      Top = 12
      Width = 81
      Height = 13
      Caption = 'Qtde Parcelas'
    end
    object lbl13: TLabel
      Left = 11
      Top = 11
      Width = 122
      Height = 13
      Caption = 'Valor Benefício INSS'
    end
    object lbl14: TLabel
      Left = 11
      Top = 12
      Width = 132
      Height = 13
      Caption = 'Valor Benefício Funcef'
    end
    object lbl15: TLabel
      Left = 616
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Motivo'
    end
    object lbl16: TLabel
      Left = 616
      Top = 12
      Width = 39
      Height = 13
      Caption = 'Motivo'
    end
    object edtSaldoReviInss: TEdit
      Left = 157
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object sedQtParcInss: TSpinEdit
      Left = 512
      Top = 26
      Width = 86
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
      OnChange = sedQtParcInssChange
      OnExit = sedQtParcInssExit
      OnKeyPress = sedQtParcInssKeyPress
    end
    object edtSaldoRevFunc: TEdit
      Left = 157
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object sedQtParcFunc: TSpinEdit
      Left = 512
      Top = 26
      Width = 86
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 12
      Value = 0
      OnChange = sedQtParcFuncChange
      OnExit = sedQtParcFuncExit
      OnKeyPress = sedQtParcFuncKeyPress
    end
    object edtVlParcInss: TEdit
      Left = 300
      Top = 26
      Width = 86
      Height = 21
      TabOrder = 2
      Text = '0'
      OnExit = edtVlParcInssExit
      OnKeyPress = edtVlParcInssKeyPress
    end
    object edtVlParcFunc: TEdit
      Left = 300
      Top = 26
      Width = 86
      Height = 21
      TabOrder = 10
      Text = '0'
      OnExit = edtVlParcFuncExit
      OnKeyPress = edtVlParcFuncKeyPress
    end
    object edtPercParcInss: TEdit
      Left = 409
      Top = 26
      Width = 86
      Height = 21
      TabOrder = 3
      Text = '0'
      OnExit = edtPercParcInssExit
      OnKeyPress = edtPercParcInssKeyPress
    end
    object edtPercParcFunc: TEdit
      Left = 409
      Top = 26
      Width = 86
      Height = 21
      TabOrder = 11
      Text = '0'
      OnExit = edtPercParcFuncExit
      OnKeyPress = edtPercParcFuncKeyPress
    end
    object dtpDataInicioInss: TDateTimePicker
      Left = 777
      Top = 26
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41599.3634032407
      Time = 41599.3634032407
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
    end
    object dtpDataFimInss: TDateTimePicker
      Left = 913
      Top = 26
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41599.3634032407
      Time = 41599.3634032407
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
    end
    object dtpDataInicioFunc: TDateTimePicker
      Left = 777
      Top = 26
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41599.3634032407
      Time = 41599.3634032407
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 14
    end
    object dtpDataFimFunc: TDateTimePicker
      Left = 913
      Top = 26
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41599.3634032407
      Time = 41599.3634032407
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 15
    end
    object edtvlbeneficio: TEdit
      Left = 11
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '0,00'
    end
    object edtvlbeneficioFuncef: TEdit
      Left = 11
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object cbbInss: TComboBox
      Left = 616
      Top = 26
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
    object cbbcbmotivofuncef: TComboBox
      Left = 616
      Top = 26
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 13
    end
  end
  inherited Dock971: TDock97
    Top = 65
    Width = 1048
    inherited tb97Fundo: TToolbar97
      Left = 631
      DockPos = 631
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 446
      DockPos = 446
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 274
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
end
