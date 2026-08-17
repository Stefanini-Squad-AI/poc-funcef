inherited frmParcelamentoRevisao: TfrmParcelamentoRevisao
  Left = 216
  Top = 156
  Caption = 'Informações para Parcelamento da Revisão de Benefícios ...'
  ClientHeight = 302
  ClientWidth = 552
  FormStyle = fsNormal
  Visible = False
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
    Width = 552
    Height = 263
    object Label1: TLabel
      Left = 11
      Top = 86
      Width = 95
      Height = 13
      Caption = 'Acertos de INSS'
    end
    object Label2: TLabel
      Left = 11
      Top = 139
      Width = 121
      Height = 13
      Caption = 'Acertos de Benefício'
    end
    object Label3: TLabel
      Left = 11
      Top = 192
      Width = 137
      Height = 13
      Caption = 'Acertos de Contribuição'
    end
    object Label5: TLabel
      Left = 322
      Top = 86
      Width = 83
      Height = 13
      Caption = 'Num. Parcelas'
    end
    object Label9: TLabel
      Left = 322
      Top = 139
      Width = 83
      Height = 13
      Caption = 'Num. Parcelas'
    end
    object Label10: TLabel
      Left = 322
      Top = 192
      Width = 83
      Height = 13
      Caption = 'Num. Parcelas'
    end
    object Label4: TLabel
      Left = 11
      Top = 22
      Width = 174
      Height = 13
      Caption = 'Regra de Margem Consignável'
    end
    object Label11: TLabel
      Left = 419
      Top = 22
      Width = 119
      Height = 13
      Caption = 'Margem de desconto'
    end
    object Label15: TLabel
      Left = 159
      Top = 86
      Width = 91
      Height = 13
      Caption = 'INSS a parcelar'
    end
    object Label16: TLabel
      Left = 159
      Top = 138
      Width = 117
      Height = 13
      Caption = 'Benefício a parcelar'
    end
    object Label17: TLabel
      Left = 158
      Top = 192
      Width = 133
      Height = 13
      Caption = 'Contribuição a parcelar'
    end
    object Label18: TLabel
      Left = 473
      Top = 86
      Width = 67
      Height = 13
      Caption = 'Vlr. Parcela'
    end
    object Label19: TLabel
      Left = 473
      Top = 138
      Width = 67
      Height = 13
      Caption = 'Vlr. Parcela'
    end
    object Label20: TLabel
      Left = 473
      Top = 192
      Width = 67
      Height = 13
      Caption = 'Vlr. Parcela'
    end
    object redINSS: TRealEdit
      Left = 12
      Top = 102
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redBeneficio: TRealEdit
      Left = 12
      Top = 155
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redContribuicao: TRealEdit
      Left = 12
      Top = 208
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object edRegraMargem: TEdit
      Left = 11
      Top = 40
      Width = 389
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object sedNumParcInss: TSpinEdit
      Left = 322
      Top = 102
      Width = 86
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 4
      Value = 0
      OnChange = sedNumParcInssChange
    end
    object sedNumParcBenef: TSpinEdit
      Left = 322
      Top = 155
      Width = 86
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = sedNumParcBenefChange
    end
    object sedNumParcContrib: TSpinEdit
      Left = 322
      Top = 207
      Width = 86
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 6
      Value = 0
      OnChange = sedNumParcContribChange
    end
    object redMargem: TRealEdit
      Left = 419
      Top = 39
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redINSSParc: TRealEdit
      Left = 159
      Top = 102
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redBeneficioParc: TRealEdit
      Left = 159
      Top = 155
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redContribuicaoParc: TRealEdit
      Left = 159
      Top = 208
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 10
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redVlrParcINSS: TRealEdit
      Left = 449
      Top = 102
      Width = 91
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redVlrParcBenef: TRealEdit
      Left = 449
      Top = 155
      Width = 91
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 12
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
    object redVlrParcContrib: TRealEdit
      Left = 449
      Top = 208
      Width = 91
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '0,00')
      TabOrder = 13
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
  end
  inherited Dock971: TDock97
    Top = 263
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 380
      DockPos = 631
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 211
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
