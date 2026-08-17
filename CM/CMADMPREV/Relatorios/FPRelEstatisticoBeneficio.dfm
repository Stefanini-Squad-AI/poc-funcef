inherited frmEstatisticoBeneficio: TfrmEstatisticoBeneficio
  Left = 347
  Top = 238
  Caption = 'Estatístico de Benefícios Pagos'
  ClientHeight = 154
  ClientWidth = 358
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 115
    object grpMesAnoRef: TGroupBox
      Left = 36
      Top = 13
      Width = 273
      Height = 80
      TabOrder = 0
      object Label3: TLabel
        Left = 13
        Top = 21
        Width = 146
        Height = 13
        Caption = 'Mês e Ano de Pagamento'
      end
      object cmbMesRef: TComboBox
        Left = 13
        Top = 36
        Width = 187
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro'
          'Contribuição sobre 13º')
      end
      object spedAnoRef: TSpinEdit
        Left = 205
        Top = 36
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
      end
    end
  end
  inherited Dock971: TDock97
    Top = 115
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 186
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 17
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 15
    Top = 241
  end
end
