inherited frmQuantBenefPlanoSaude: TfrmQuantBenefPlanoSaude
  Left = 302
  Top = 245
  Caption = 'Quantitativo Beneficiário Plano de Saúde'
  ClientHeight = 148
  ClientWidth = 338
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 338
    Height = 109
    object GroupBox1: TGroupBox
      Left = 45
      Top = 21
      Width = 247
      Height = 55
      Caption = 'Mês de Referência'
      TabOrder = 0
      object CbMes: TComboBox
        Left = 15
        Top = 21
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'CbMes'
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro '
          'Novembro'
          'Dezembro')
      end
      object dbseano: TwwDBSpinEdit
        Left = 168
        Top = 21
        Width = 61
        Height = 21
        Increment = 1
        Value = 1999
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 338
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
