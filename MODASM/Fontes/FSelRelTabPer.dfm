inherited frmSelRelTabPer: TfrmSelRelTabPer
  Left = 316
  Top = 154
  Caption = 'Seleção para Listagem da Tabela de Periodicidades'
  ClientHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 289
    inherited PageControl1: TPageControl
      Height = 279
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgSelTudo: TRadioGroup
          Left = 16
          Top = 0
          Width = 360
          Height = 45
          Caption = 'Listar Exames e Testes de'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todos os Tipos'
            'A Selecionar')
          TabOrder = 0
          OnClick = rgSelTudoClick
        end
        object gbxOcorr: TGroupBox
          Left = 16
          Top = 46
          Width = 360
          Height = 205
          Caption = 'Seleção de Exames'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Visible = False
          object dblcOcorr: TwwDBLookupCombo
            Left = 30
            Top = 24
            Width = 295
            Height = 21
            Hint = 'Informe Exame(s) Desejado(s)'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED')
            LookupTable = qryTabOcorr
            LookupField = 'DESCRTIPOOCMED'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcOcorrCloseUp
          end
          object lstOcorr: TListBox
            Left = 30
            Top = 63
            Width = 295
            Height = 121
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            Sorted = True
            TabOrder = 1
            OnKeyDown = lstOcorrKeyDown
          end
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 91
          Top = 131
        end
        inherited BitBtn2: TBitBtn
          Left = 91
          Top = 71
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 289
    inherited tb97Fundo: TToolbar97
      Left = 80
      DockPos = 88
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  object qryTabOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct TIPOCMED.CODTIPOOCMED, '
      'TIPOCMED.DESCRTIPOOCMED, PEREXAME.CODTIPOOCMED '
      'from TIPOCMED, PEREXAME '
      'where TIPOCMED.CODTIPOOCMED = PEREXAME.CODTIPOOCMED '
      'order by TIPOCMED.DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 186
    Top = 134
  end
end
