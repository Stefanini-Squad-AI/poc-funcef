inherited frmSelEstRecr: TfrmSelEstRecr
  Left = 76
  Top = 147
  Caption = 'Estatística por Fonte de Recrutamento'
  ClientWidth = 638
  Constraints.MinHeight = 399
  Constraints.MinWidth = 646
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 638
    inherited pnSelecao: TPanel
      Width = 630
      inherited pnResult: TPanel
        Width = 628
        object pgctrlGrafico: TPageControl
          Left = 1
          Top = 1
          Width = 626
          Height = 321
          ActivePage = tbshGrafico1
          Align = alClient
          TabOrder = 0
          object tbshGrafico1: TTabSheet
            Caption = 'Por Período'
            object Chart1: TChartfx
              Left = 0
              Top = 0
              Width = 618
              Height = 293
              Align = alClient
              TabOrder = 0
              ControlData = {
                DF3F0000481E00006000000000000102550200FFFFFFFF320032002800280002
                00000000000000080001000000000000000000000000000000020000FFFF00C0
                C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
                2008000060080000000800000008000000080000000800000008000000080000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000F0
                3F02000400000000000000000000000000000059400000000000000000000000
                000000000000000000}
            end
          end
          object tbshGrafico2: TTabSheet
            Caption = 'Resumido'
            ImageIndex = 1
            object Chart2: TChartfx
              Left = 0
              Top = 0
              Width = 602
              Height = 314
              Align = alClient
              TabOrder = 0
              ControlData = {
                383E0000742000006000000000000102550200FFFFFFFF320032002800280002
                00000000000000080001000000000000000000000000000000020000FFFF00C0
                C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
                2008000060080000000800000008000000080000000800000008000000080000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000F0
                3F02000400000000000000000000000000000059400000000000000000000000
                000000000000000000}
            end
          end
        end
      end
      inherited pgctrlPrincipal: TPageControl
        Width = 628
        ActivePage = tbshGrafico
        object tbshGrafico: TTabSheet [0]
          Caption = 'Gráfico'
          ImageIndex = 4
          object rgFreq: TRadioGroup
            Left = 31
            Top = 72
            Width = 265
            Height = 63
            Caption = 'Frequência da Análise'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Mensal'
              'Anual')
            TabOrder = 0
            OnClick = rgFreqClick
          end
          object gbxFaixaData: TGroupBox
            Left = 31
            Top = 142
            Width = 265
            Height = 54
            Caption = 'Faixa de Anos'
            TabOrder = 1
            object Label9: TLabel
              Left = 127
              Top = 22
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object spedAno1: TSpinEdit
              Left = 31
              Top = 19
              Width = 73
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = rgFreqClick
            end
            object spedAno2: TSpinEdit
              Left = 160
              Top = 19
              Width = 73
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 0
              OnChange = rgFreqClick
            end
          end
          object rgTipoEst: TRadioGroup
            Left = 322
            Top = 72
            Width = 265
            Height = 124
            Caption = 'Tipo de Estatística'
            ItemIndex = 0
            Items.Strings = (
              'Recrutamento de Candidatos (Eficiência)'
              'Admissão de Candidatos (Eficácia)')
            TabOrder = 2
            OnClick = rgTipoEstClick
          end
        end
        inherited tsDadosFunc: TTabSheet
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxEstab: TGroupBox [3]
          end
          inherited gbxCargo: TGroupBox [4]
          end
          inherited rgSelRamo: TRadioGroup [5]
          end
          inherited gbxRamo: TGroupBox [6]
          end
          inherited gbxSindi: TGroupBox [7]
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            Width = 620
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 638
    inherited tb97Fundo: TToolbar97
      Left = 376
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 224
    Top = 48
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
  object CdsFonteRecr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 319
    Top = 231
  end
end
