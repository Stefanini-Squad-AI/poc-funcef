inherited FrmFiltroGraficoSuplDescFolha: TFrmFiltroGraficoSuplDescFolha
  Left = 119
  Top = 161
  Caption = 'FrmFiltroGraficoSuplDescFolha'
  ClientHeight = 158
  ClientWidth = 524
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 524
    Height = 119
    object Label2: TLabel [0]
      Left = 12
      Top = 19
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    inherited RdoTipoFolha: TRadioGroup
      Top = 157
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Top = 149
      ItemIndex = 1
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 34
      Width = 508
      Height = 66
      inherited PnlLoteouVersao: TPanel [0]
        Top = 22
        Height = 30
        Visible = False
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Visible = False
        end
      end
      inherited PnlMesPagto: TPanel [1]
        Left = 4
        Top = 5
        Width = 500
        Height = 57
        inherited LblMesPagto: TLabel
          Left = 9
          Top = 4
          Width = 62
          Caption = 'Mês Inicial'
        end
        object Label1: TLabel [1]
          Left = 275
          Top = 4
          Width = 55
          Height = 13
          Caption = 'Mês Final'
        end
        inherited CmbMes: TComboBox
          Left = 7
          Top = 21
        end
        inherited SpnedAno: TSpinEdit
          Left = 160
          Top = 21
        end
        object SpinEdit1: TSpinEdit
          Left = 426
          Top = 21
          Width = 66
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 2
          Value = 0
        end
        object ComboBox1: TComboBox
          Left = 273
          Top = 21
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 119
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 354
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 187
    end
  end
end
