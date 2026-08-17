inherited frmSelRelNeces: TfrmSelRelNeces
  Left = 281
  Top = 203
  Caption = 'Seleção para Relatório das Necessidades de Treinamento'
  ClientHeight = 207
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 168
    inherited PageControl1: TPageControl
      Width = 452
      Height = 158
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgFormaRel: TRadioGroup
          Left = 0
          Top = 0
          Width = 121
          Height = 130
          Align = alLeft
          Caption = 'Forma do Relatório'
          ItemIndex = 0
          Items.Strings = (
            'Por Treinando'
            'Por Curso')
          TabOrder = 0
        end
        object rgTipoRel: TRadioGroup
          Left = 128
          Top = 0
          Width = 316
          Height = 130
          Caption = 'Tipo de Relatório'
          ItemIndex = 0
          Items.Strings = (
            'Analítico'
            'Sintético')
          TabOrder = 1
        end
        object rgPrograma: TRadioGroup
          Left = 243
          Top = 8
          Width = 194
          Height = 48
          Caption = 'Inclui Cursos Já Programados ?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object rgTipoCargo: TRadioGroup
          Left = 243
          Top = 65
          Width = 194
          Height = 54
          Caption = 'Considera os Cargos'
          ItemIndex = 0
          Items.Strings = (
            'Básicos'
            'Alternativos (Função)')
          TabOrder = 3
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 110
          Top = 66
        end
        inherited BitBtn2: TBitBtn
          Left = 110
          Top = 6
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 168
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 132
      DockPos = 140
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
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 189
    Top = 89
  end
end
