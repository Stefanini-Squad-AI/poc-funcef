inherited frmDesvioPadrao: TfrmDesvioPadrao
  Left = 265
  Top = 165
  Caption = 'Desvio Padrão'
  ClientHeight = 215
  ClientWidth = 396
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 145
    Top = 83
    Width = 86
    Height = 13
    Caption = 'Início de Faixa'
  end
  inherited pnlFundo: TPanel
    Width = 396
    Height = 176
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Ativo'
    end
    object Label4: TLabel
      Left = 145
      Top = 137
      Width = 5
      Height = 13
    end
    object ComboBox1: TComboBox
      Left = 32
      Top = 32
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'VALE MAIS RENDA'
    end
    object CheckBox1: TCheckBox
      Left = 32
      Top = 84
      Width = 169
      Height = 17
      Caption = 'Monitorar início de faixa'
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 207
      Top = 82
      Width = 67
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object ComboBox2: TComboBox
      Left = 288
      Top = 82
      Width = 81
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Percentual'
        'Valor')
    end
    object CheckBox3: TCheckBox
      Left = 32
      Top = 135
      Width = 177
      Height = 17
      Caption = 'Monitorar final de faixa'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 176
    Width = 396
    inherited tb97Fundo: TToolbar97
      Left = 224
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 55
    end
  end
  object ComboBox4: TComboBox [3]
    Left = 288
    Top = 132
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Percentual'
      'Valor')
  end
  object Edit3: TEdit [4]
    Left = 207
    Top = 132
    Width = 67
    Height = 21
    TabOrder = 3
    Text = '5'
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65531
    Top = 65531
  end
end
