inherited frmParamRelEstSPC: TfrmParamRelEstSPC
  Caption = 'Parâmetros para o Relatórios de Estatísticas para SPC'
  ClientHeight = 160
  ClientWidth = 432
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 121
    object Gb: TGroupBox
      Left = 17
      Top = 15
      Width = 395
      Height = 91
      Caption = ' Informe o Mês de Referência desejado ...'
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 17
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 171
        Top = 17
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object mebMes: TComboBox
        Left = 12
        Top = 34
        Width = 154
        Height = 21
        ItemHeight = 13
        TabOrder = 0
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
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object mebAno: TSpinEdit
        Left = 171
        Top = 34
        Width = 98
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 121
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 262
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 268
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
