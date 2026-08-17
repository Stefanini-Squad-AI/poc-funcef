inherited frmSelRelSint: TfrmSelRelSint
  HelpContext = 760028
  Caption = 
    'Seleção de Processos para o Relatório de Análise Sintética dos P' +
    'rocessos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited gbxNumPr: TGroupBox
          Left = 519
          Width = 67
          Visible = False
          inherited EdnNum1: TEditNum
            Left = 6
          end
        end
        inherited rgTipoAcao: TRadioGroup
          TabOrder = 13
        end
        object grpMesRef: TGroupBox
          Left = 312
          Top = 2
          Width = 196
          Height = 43
          Caption = ' Mês e Ano de Referência '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object cmbMes: TComboBox
            Left = 4
            Top = 14
            Width = 118
            Height = 21
            Style = csDropDownList
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
          object spedAno: TSpinEdit
            Left = 128
            Top = 14
            Width = 63
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
end
