inherited frmSelEstObj: TfrmSelEstObj
  Left = 65
  Top = 121
  Caption = 'Estatística de Objetos Reclamados nos Processos'
  ClientWidth = 662
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    inherited pnResult: TPanel
      Width = 654
      object pgctrlGrafico: TPageControl
        Left = 1
        Top = 1
        Width = 652
        Height = 356
        ActivePage = tbshQuantidade
        Align = alClient
        TabOrder = 0
        object tbshQuantidade: TTabSheet
          Caption = 'Quantidade'
          object Chart1: TChartfx
            Left = 0
            Top = 0
            Width = 644
            Height = 328
            Align = alClient
            TabOrder = 0
            ControlData = {
              8F420000E62100006000000000000105550200FFFFFFFF320032002800280002
              00000000000000080001000000000000000000000000000000020000FFFF00C0
              C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
              2008000060080000000800000008000000080000000800000008000000080000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000F0
              3F02000400000000000000000000000000000059400000000000000000000000
              000000000000000000}
          end
        end
        object tbshValor: TTabSheet
          Caption = 'Valor'
          ImageIndex = 1
          object Chart2: TChartfx
            Left = 0
            Top = 0
            Width = 644
            Height = 340
            Align = alClient
            TabOrder = 0
            ControlData = {
              8F420000242300006000000000000105550200FFFFFFFF320032002800280002
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
      Width = 654
      ActivePage = tbshGrafico
      object tbshGrafico: TTabSheet [0]
        Caption = 'Gráfico'
        ImageIndex = 4
        object rgValor: TRadioGroup
          Left = 9
          Top = 16
          Width = 250
          Height = 113
          Caption = 'Valores'
          ItemIndex = 0
          Items.Strings = (
            'Reclamados'
            'Estimados ou Reais')
          TabOrder = 0
        end
        object rgSelTudo: TRadioGroup
          Left = 9
          Top = 140
          Width = 250
          Height = 183
          Caption = 'Selecionar Reclamações'
          ItemIndex = 0
          Items.Strings = (
            'Todas por Tipo'
            'Todas por Grupo'
            'A Selecionar Por Tipo'
            'A Selecionar Por Grupo')
          TabOrder = 1
          OnClick = rgSelTudoClick
        end
        object gbxPercMin: TGroupBox
          Left = 274
          Top = 16
          Width = 360
          Height = 47
          TabOrder = 2
          object Label16: TLabel
            Left = 344
            Top = 19
            Width = 10
            Height = 13
            Caption = '%'
          end
          object cbxPercMin: TCheckBox
            Left = 10
            Top = 18
            Width = 290
            Height = 17
            Caption = 'Incluir como '#39'Demais Objetos'#39' os com menos de'
            TabOrder = 0
          end
          object spedPercMin: TSpinEdit
            Left = 303
            Top = 15
            Width = 38
            Height = 22
            MaxValue = 100
            MinValue = 0
            TabOrder = 1
            Value = 10
          end
        end
        object gbxDemaisObjetos: TGroupBox
          Left = 274
          Top = 66
          Width = 360
          Height = 257
          Caption = 'Objetos'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Visible = False
          object cbxIncluirDemaisObjetos: TCheckBox
            Left = 10
            Top = 17
            Width = 297
            Height = 17
            Caption = 'Incluir Não Selecionados como '#39'Demais Objetos'#39
            TabOrder = 0
          end
          object chklstDemaisObjetos: TColorCheckListBox
            Left = 10
            Top = 40
            Width = 341
            Height = 171
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 1
          end
          object bbtnSelTodos: TBitBtn
            Left = 10
            Top = 216
            Width = 148
            Height = 32
            Caption = '   Seleciona Todos'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnSelTodosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSel: TBitBtn
            Left = 203
            Top = 216
            Width = 148
            Height = 32
            Caption = '   Inverte Seleção'
            TabOrder = 3
            TabStop = False
            OnClick = bbtnInverteSelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 400
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 233
    end
  end
  object CdsTipObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 343
    Top = 149
  end
  object CdsGrpObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 343
    Top = 205
  end
  object CdsObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 343
    Top = 253
  end
end
