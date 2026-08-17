inherited frmSelRelCurso: TfrmSelRelCurso
  Left = 333
  Top = 151
  Caption = 'Seleção da Listagem da Tabela de Cursos'
  ClientHeight = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 302
    inherited PageControl1: TPageControl
      Height = 292
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgSelTudo: TRadioGroup
          Left = 16
          Top = 2
          Width = 360
          Height = 45
          Caption = 'Listar'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todos os Cursos'
            'A Selecionar')
          TabOrder = 0
          OnClick = rgSelTudoClick
        end
        object gbxGrupo: TGroupBox
          Left = 16
          Top = 47
          Width = 360
          Height = 170
          Caption = 'Grupos de Treinamento'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Visible = False
          object dblcGrupo: TwwDBLookupCombo
            Left = 30
            Top = 15
            Width = 295
            Height = 21
            Hint = 'Informe Grupo(s) Desejado(s)'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCGRPTREIN'#9'40'#9'DESCGRPTREIN')
            LookupTable = qryGrupo
            LookupField = 'DESCGRPTREIN'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = False
            OnCloseUp = dblcGrupoCloseUp
          end
          object lstGrupo: TListBox
            Left = 30
            Top = 39
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
            TabOrder = 1
            OnKeyDown = lstGrupoKeyDown
          end
        end
        object rgSequencia: TRadioGroup
          Left = 15
          Top = 218
          Width = 178
          Height = 43
          Caption = 'Sequência'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Por Código'
            'Alfabética')
          TabOrder = 2
        end
        object rgImprDescr: TRadioGroup
          Left = 198
          Top = 218
          Width = 178
          Height = 43
          Caption = 'Imprime a Observação ?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
        end
        object lstCodGrupo: TListBox
          Left = 297
          Top = 100
          Width = 40
          Height = 30
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          IntegralHeight = True
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          Visible = False
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 91
          Top = 137
        end
        inherited BitBtn2: TBitBtn
          Left = 91
          Top = 77
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 302
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
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODGRPTREIN, DESCGRPTREIN from GRPTREIN'
      'order by DESCGRPTREIN')
    ValidateWithMask = True
    Left = 221
    Top = 142
  end
end
