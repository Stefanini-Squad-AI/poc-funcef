inherited frmDivergPedeNovoMesCob: TfrmDivergPedeNovoMesCob
  Left = 491
  Top = 166
  Caption = 'Informe o novo mês de cobrança ...'
  ClientHeight = 157
  ClientWidth = 342
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    Height = 118
    object grpMesAnoRef: TGroupBox
      Left = 38
      Top = 22
      Width = 265
      Height = 75
      Caption = 'Mês e Ano de Cobrança (Competência)'
      TabOrder = 0
      object cmbMesCob: TComboBox
        Left = 6
        Top = 21
        Width = 187
        Height = 21
        ItemHeight = 13
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
          'dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 198
        Top = 21
        Width = 55
        Height = 22
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 2000
      end
    end
  end
  inherited Dock971: TDock97
    Top = 118
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 171
      DockPos = 171
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 3
      DockPos = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 147
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
