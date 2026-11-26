inherited FrmHstDivBenefAltOpcao: TFrmHstDivBenefAltOpcao
  Left = 426
  Top = 273
  Caption = 'Histórico de Dívidas de Benefícios'
  ClientHeight = 275
  ClientWidth = 628
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
    Width = 628
    Height = 236
    object lbl1: TLabel
      Left = 20
      Top = 57
      Width = 110
      Height = 13
      Caption = 'Início de Cobrança'
    end
    object lbl2: TLabel
      Left = 336
      Top = 57
      Width = 104
      Height = 13
      Caption = 'Final de Cobrança'
    end
    object lbl3: TLabel
      Left = 180
      Top = 116
      Width = 371
      Height = 13
      Caption = 'Forma de pagamento (Alterar somente para cobranças via boleto)'
    end
    object lbl4: TLabel
      Left = 487
      Top = 55
      Width = 62
      Height = 13
      Caption = 'Percentual'
    end
    object lbl5: TLabel
      Left = 20
      Top = 12
      Width = 123
      Height = 13
      Caption = 'Saldo Devedor Inicial'
    end
    object lbl6: TLabel
      Left = 487
      Top = 12
      Width = 118
      Height = 13
      Caption = 'Saldo Devedor Atual'
    end
    object lbl7: TLabel
      Left = 179
      Top = 57
      Width = 99
      Height = 13
      Caption = 'Qtde de Parcelas'
    end
    object lbl8: TLabel
      Left = 20
      Top = 116
      Width = 95
      Height = 13
      Caption = 'Valor da Parcela'
    end
    object lbl9: TLabel
      Left = 20
      Top = 183
      Width = 138
      Height = 13
      Caption = 'Atualizar Saldo Devedor'
    end
    object Label1: TLabel
      Left = 179
      Top = 12
      Width = 141
      Height = 13
      Caption = 'Saldo Provisão de Perda'
    end
    object Label2: TLabel
      Left = 336
      Top = 12
      Width = 126
      Height = 13
      Caption = 'Saldo Baixa Definitiva'
    end
    object edtperc: TRealEdit
      Left = 489
      Top = 69
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 7
      WordWrap = False
      OnChange = edtpercChange
      OnExit = edtpercExit
      OnKeyPress = edtpercKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtsaldoinici: TRealEdit
      Left = 22
      Top = 27
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '0,00')
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      OnKeyPress = edtsaldoiniciKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtSaldoAtu: TRealEdit
      Left = 489
      Top = 27
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 3
      WordWrap = False
      OnKeyPress = edtsaldoiniciKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtqtparc: TEdit
      Left = 181
      Top = 72
      Width = 100
      Height = 21
      TabOrder = 5
      OnChange = edtqtparcChange
      OnExit = edtqtparcExit
      OnKeyPress = edtqtparcKeyPress
    end
    object edtvlParcela: TRealEdit
      Left = 22
      Top = 130
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 8
      WordWrap = False
      OnChange = edtvlParcelaChange
      OnExit = edtvlParcelaExit
      OnKeyPress = edtvlParcelaKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object rgAtuSaldo: TRadioGroup
      Left = 179
      Top = 169
      Width = 168
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Não'
        'Sim')
      TabOrder = 10
    end
    object cboNCobra_D: TwwDBLookupCombo
      Left = 181
      Top = 130
      Width = 371
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição'#9'F'
        'CODPROVDESC'#9'15'#9'Código'#9'F'
        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
      DataField = 'FLGPORTFORMA'
      DataSource = FrmHstDividaBenef3.dscab
      LookupTable = FrmHstDividaBenef3.qryLkPORTADORFORMA
      LookupField = 'CODPORTFORMA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dtpDataInicioFunc: TDateTimePicker
      Left = 22
      Top = 72
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41599.3634032407
      Time = 41599.3634032407
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      OnExit = dtpDataInicioFuncExit
    end
    object dtpDataFimFunc: TDateTimePicker
      Left = 336
      Top = 72
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
    object edtSldProvisao: TRealEdit
      Left = 181
      Top = 27
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 1
      WordWrap = False
      OnExit = edtSldProvisaoExit
      OnKeyPress = edtsaldoiniciKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtSldBaixa: TRealEdit
      Left = 336
      Top = 27
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 2
      WordWrap = False
      OnKeyPress = edtsaldoiniciKeyPress
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 628
    inherited tb97Fundo: TToolbar97
      Left = 456
      DockPos = 631
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 287
      DockPos = 446
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
