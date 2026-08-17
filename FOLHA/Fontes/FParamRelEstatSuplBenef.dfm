inherited FRMParamRelEstatSuplBenef: TFRMParamRelEstatSuplBenef
  Left = 166
  Top = 168
  HelpContext = 180077
  Caption = 
    'Parâmetros do Relatório Estatístico de Suplementação por Benefíc' +
    'io'
  ClientHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 171
    inherited Patrocinadora: TLabel
      Left = 8
      Top = 388
      Visible = False
    end
    inherited Bevel1: TBevel [1]
      Top = 79
      Width = 503
      Height = 74
    end
    inherited Beneficio: TLabel
      Left = 19
      Top = 92
    end
    inherited Plano: TLabel [3]
      Left = 40
      Top = 445
      Visible = False
    end
    inherited cmbPatrocinadora: TwwDBLookupCombo [4]
      Left = 113
      Top = 368
      Visible = False
    end
    inherited cmbPlano: TwwDBLookupCombo [5]
      Left = 113
      Top = 440
      Visible = False
    end
    inherited grpMesRef: TGroupBox [6]
      Width = 503
      Height = 65
      Caption = 'Período'
      object Label1: TLabel [0]
        Left = 8
        Top = 21
        Width = 62
        Height = 13
        Caption = 'Mês Inicial'
      end
      object Label2: TLabel [1]
        Left = 135
        Top = 21
        Width = 61
        Height = 13
        Caption = 'Ano Inicial'
      end
      object Label3: TLabel [2]
        Left = 287
        Top = 21
        Width = 55
        Height = 13
        Caption = 'Mês Final'
      end
      object Label4: TLabel [3]
        Left = 414
        Top = 21
        Width = 54
        Height = 13
        Caption = 'Ano Final'
      end
      inherited cbMes: TComboBox
        Top = 36
        Width = 115
      end
      inherited dbseAno: TwwDBSpinEdit
        Left = 132
        Top = 36
      end
    end
    inherited cmbBeneficio: TwwDBLookupCombo
      Left = 19
      Top = 109
      OnChange = cmbBeneficioChange
    end
  end
  inherited Dock971: TDock97
    Top = 171
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
    end
  end
  object CbMesFinal: TComboBox [2]
    Left = 297
    Top = 44
    Width = 115
    Height = 21
    ItemHeight = 13
    TabOrder = 2
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
  object dbSEAnoFinal: TwwDBSpinEdit [3]
    Left = 423
    Top = 44
    Width = 84
    Height = 21
    Increment = 1
    TabOrder = 3
    UnboundDataType = wwDefault
  end
  inherited QryPatrocinadora: TwwQuery
    Left = 451
    Top = 109
  end
  inherited dsPatrocinadora: TwwDataSource
    Left = 443
    Top = 113
  end
  inherited QryBeneficio: TwwQuery
    SQL.Strings = (
      'SELECT distinct BE.IDBENEFICIO, BE.NOME '
      'FROM BENEFICIO BE, BENEFPLANPATRO BP '
      'WHERE BE.IDBENEFICIO = BP.IDBENEFICIO ')
    Left = 43
    Top = 149
  end
  inherited dsBeneficio: TwwDataSource
    Left = 107
    Top = 145
  end
end
