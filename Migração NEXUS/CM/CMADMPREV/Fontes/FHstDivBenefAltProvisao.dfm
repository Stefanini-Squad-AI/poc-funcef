inherited FrmHstDivBenefAltProvisao: TFrmHstDivBenefAltProvisao
  Left = 456
  Top = 280
  Caption = 'Histórico de Dívida de Benefício - Ajusta Provisões'
  ClientHeight = 283
  ClientWidth = 627
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 627
    Height = 244
    object Label3: TLabel
      Left = 20
      Top = 10
      Width = 118
      Height = 13
      Caption = 'Mês Cobrança........:'
    end
    object lbl5: TLabel
      Left = 18
      Top = 62
      Width = 123
      Height = 13
      Caption = 'Saldo Devedor Inicial'
    end
    object lbl6: TLabel
      Left = 485
      Top = 62
      Width = 118
      Height = 13
      Caption = 'Saldo Devedor Atual'
    end
    object Label1: TLabel
      Left = 177
      Top = 62
      Width = 141
      Height = 13
      Caption = 'Saldo Provisão de Perda'
    end
    object Label2: TLabel
      Left = 334
      Top = 62
      Width = 126
      Height = 13
      Caption = 'Saldo Baixa Definitiva'
    end
    object Label9: TLabel
      Left = 20
      Top = 28
      Width = 120
      Height = 13
      Caption = 'Situação da Parcela:'
    end
    object lblSitParcela: TLabel
      Left = 150
      Top = 28
      Width = 72
      Height = 13
      Caption = 'lblSitParcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMesCobranca: TLabel
      Left = 150
      Top = 10
      Width = 46
      Height = 13
      Caption = 'Label10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 12
      Top = 50
      Width = 605
      Height = 57
    end
    object edtsaldoinici: TEdit
      Left = 20
      Top = 77
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtSaldoAtu: TEdit
      Left = 487
      Top = 77
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtSldProvisao: TEdit
      Left = 179
      Top = 77
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object edtSldBaixa: TEdit
      Left = 334
      Top = 77
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 116
      Width = 605
      Height = 121
      Caption = '  Ajustes para Saldos / Contabilização '
      TabOrder = 5
      object Label4: TLabel
        Left = 12
        Top = 22
        Width = 120
        Height = 13
        Caption = 'Valor Provisão Perda'
      end
      object Label5: TLabel
        Left = 157
        Top = 22
        Width = 126
        Height = 13
        Caption = 'Reversão de Provisão'
      end
      object Label6: TLabel
        Left = 12
        Top = 63
        Width = 123
        Height = 13
        Caption = 'Valor Baixa Definitiva'
      end
      object Label7: TLabel
        Left = 157
        Top = 63
        Width = 108
        Height = 13
        Caption = 'Reversão de Baixa'
      end
      object Label10: TLabel
        Left = 308
        Top = 42
        Width = 169
        Height = 13
        Caption = 'Saldo de Provisão (simulado):'
      end
      object Label11: TLabel
        Left = 308
        Top = 65
        Width = 167
        Height = 13
        Caption = 'Saldo de Baixa (simulado)....:'
      end
      object lblSaldoProv: TLabel
        Left = 482
        Top = 43
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
      end
      object lblSaldoBaixa: TLabel
        Left = 482
        Top = 63
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
      end
      object Label12: TLabel
        Left = 308
        Top = 87
        Width = 166
        Height = 13
        Caption = 'Saldo Devedor (simulado)....:'
      end
      object lblSaldoDev: TLabel
        Left = 482
        Top = 85
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
      end
      object edProvPerda: TEdit
        Left = 12
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyPress = edProvPerdaKeyPress
        OnKeyUp = edProvPerdaKeyUp
      end
      object edRevProvisao: TEdit
        Left = 157
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = edRevProvisaoChange
        OnKeyPress = edRevProvisaoKeyPress
      end
      object edBaixaDef: TEdit
        Left = 12
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyPress = edBaixaDefKeyPress
        OnKeyUp = edBaixaDefKeyUp
      end
      object edRevBaixa: TEdit
        Left = 157
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 3
        OnKeyPress = edRevBaixaKeyPress
        OnKeyUp = edRevBaixaKeyUp
      end
    end
    object medtanomescob: TMaskEdit
      Left = 214
      Top = 4
      Width = 68
      Height = 21
      EditMask = '9999/99;1;_'
      MaxLength = 7
      TabOrder = 0
      Text = '    /  '
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 627
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 571
    Top = 7
  end
end
