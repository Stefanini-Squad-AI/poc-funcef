inherited frmDivergFinanINSS: TfrmDivergFinanINSS
  Left = 185
  Top = 170
  Caption = 'Divergênci Financeira - INSS '
  ClientHeight = 217
  ClientWidth = 446
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 446
    Height = 178
    object GroupBox1: TGroupBox
      Left = 72
      Top = 48
      Width = 313
      Height = 81
      Caption = 'Período'
      TabOrder = 0
      object lblAnoMes: TLabel
        Left = 33
        Top = 23
        Width = 27
        Height = 13
        Caption = 'Ano '
      end
      object lblMes: TLabel
        Left = 150
        Top = 23
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object seAno: TSpinEdit
        Left = 31
        Top = 36
        Width = 89
        Height = 22
        MaxValue = 3000
        MinValue = 2000
        TabOrder = 0
        Value = 2001
      end
      object cboxMes: TComboBox
        Left = 149
        Top = 37
        Width = 145
        Height = 21
        ItemHeight = 13
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
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 178
    Width = 446
    inherited tb97Fundo: TToolbar97
      Left = 276
      DockPos = 276
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
      DockPos = 108
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 408
    Top = 8
  end
end
GRUPO = :IDGRUPO$AND    L.IDFILIALPESSOA = P.IDPESSOA
