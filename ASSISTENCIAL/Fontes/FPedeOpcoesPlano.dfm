inherited FrmPedeOpcoesPlano: TFrmPedeOpcoesPlano
  Left = 203
  Top = 44
  Caption = 'Especificar Opções do Plano Assistencial'
  ClientHeight = 419
  ClientWidth = 763
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 380
    object pnlRegras: TPanel
      Left = 1
      Top = 1
      Width = 761
      Height = 176
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object grpRegraValida: TGroupBox
        Left = 0
        Top = 0
        Width = 377
        Height = 176
        Align = alLeft
        Caption = 'Regras de Validação'
        TabOrder = 0
        object lblOp1: TLabel
          Left = 7
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Opção 1'
        end
        object lblOp2: TLabel
          Left = 191
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Opção 2'
        end
        object lblOp3: TLabel
          Left = 7
          Top = 54
          Width = 49
          Height = 13
          Caption = 'Opção 3'
        end
        object Label7: TLabel
          Left = 191
          Top = 54
          Width = 49
          Height = 13
          Caption = 'Opção 4'
        end
        object Label8: TLabel
          Left = 7
          Top = 93
          Width = 49
          Height = 13
          Caption = 'Opção 5'
        end
        object Label9: TLabel
          Left = 191
          Top = 93
          Width = 49
          Height = 13
          Caption = 'Opção 6'
        end
        object Label10: TLabel
          Left = 7
          Top = 131
          Width = 49
          Height = 13
          Caption = 'Opção 7'
        end
        object Label11: TLabel
          Left = 191
          Top = 131
          Width = 49
          Height = 13
          Caption = 'Opção 8'
        end
        object dblkpcmbRegraValidaOp1: TwwDBLookupCombo
          Left = 7
          Top = 29
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp2: TwwDBLookupCombo
          Left = 191
          Top = 29
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp3: TwwDBLookupCombo
          Left = 7
          Top = 67
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp4: TwwDBLookupCombo
          Left = 191
          Top = 67
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp5: TwwDBLookupCombo
          Left = 7
          Top = 106
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp6: TwwDBLookupCombo
          Left = 191
          Top = 106
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp7: TwwDBLookupCombo
          Left = 7
          Top = 144
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraValidaOp8: TwwDBLookupCombo
          Left = 191
          Top = 144
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object grpRegraCalculo: TGroupBox
        Left = 384
        Top = 0
        Width = 377
        Height = 176
        Align = alRight
        Caption = 'Regras de Cálculo'
        TabOrder = 1
        object Label12: TLabel
          Left = 7
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Opção 1'
        end
        object Label13: TLabel
          Left = 191
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Opção 2'
        end
        object Label4: TLabel
          Left = 7
          Top = 54
          Width = 49
          Height = 13
          Caption = 'Opção 3'
        end
        object Label5: TLabel
          Left = 191
          Top = 54
          Width = 49
          Height = 13
          Caption = 'Opção 4'
        end
        object Label6: TLabel
          Left = 7
          Top = 93
          Width = 49
          Height = 13
          Caption = 'Opção 5'
        end
        object Label14: TLabel
          Left = 191
          Top = 93
          Width = 49
          Height = 13
          Caption = 'Opção 6'
        end
        object Label15: TLabel
          Left = 7
          Top = 131
          Width = 49
          Height = 13
          Caption = 'Opção 7'
        end
        object Label16: TLabel
          Left = 191
          Top = 131
          Width = 49
          Height = 13
          Caption = 'Opção 8'
        end
        object dblkpcmbRegraCalcOp1: TwwDBLookupCombo
          Left = 7
          Top = 29
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp2: TwwDBLookupCombo
          Left = 191
          Top = 29
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp3: TwwDBLookupCombo
          Left = 7
          Top = 67
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp4: TwwDBLookupCombo
          Left = 191
          Top = 67
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp5: TwwDBLookupCombo
          Left = 7
          Top = 106
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp6: TwwDBLookupCombo
          Left = 191
          Top = 106
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp7: TwwDBLookupCombo
          Left = 7
          Top = 144
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkpcmbRegraCalcOp8: TwwDBLookupCombo
          Left = 191
          Top = 144
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Regra')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
    object pnlDescricoes: TPanel
      Left = 1
      Top = 177
      Width = 761
      Height = 202
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 7
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 1'
      end
      object Label2: TLabel
        Left = 6
        Top = 31
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 2'
      end
      object Label3: TLabel
        Left = 6
        Top = 55
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 3'
      end
      object Label17: TLabel
        Left = 6
        Top = 79
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 4'
      end
      object Label18: TLabel
        Left = 6
        Top = 103
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 5'
      end
      object Label19: TLabel
        Left = 6
        Top = 127
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 6'
      end
      object Label20: TLabel
        Left = 6
        Top = 151
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 7'
      end
      object Label21: TLabel
        Left = 6
        Top = 175
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 8'
      end
      object edNomeValorBase1: TEdit
        Left = 138
        Top = 7
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edNomeValorBase2: TEdit
        Left = 138
        Top = 31
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edNomeValorBase3: TEdit
        Left = 138
        Top = 55
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object ckFlgObrigaOp3: TCheckBox
        Left = 554
        Top = 55
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 7
      end
      object ckAlteraOp3: TCheckBox
        Left = 657
        Top = 55
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 8
      end
      object ckFlgObrigaOp2: TCheckBox
        Left = 554
        Top = 31
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 4
      end
      object ckAlteraOp2: TCheckBox
        Left = 657
        Top = 31
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 5
      end
      object ckAlteraOp1: TCheckBox
        Left = 657
        Top = 7
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 2
      end
      object ckFlgObrigaOp1: TCheckBox
        Left = 554
        Top = 7
        Width = 88
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 1
      end
      object edNomeValorBase4: TEdit
        Left = 138
        Top = 79
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edNomeValorBase5: TEdit
        Left = 138
        Top = 103
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object edNomeValorBase6: TEdit
        Left = 138
        Top = 127
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object ckFlgObrigaOp6: TCheckBox
        Left = 554
        Top = 127
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 16
      end
      object ckAlteraOp6: TCheckBox
        Left = 657
        Top = 127
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 17
      end
      object ckFlgObrigaOp5: TCheckBox
        Left = 554
        Top = 103
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 13
      end
      object ckAlteraOp5: TCheckBox
        Left = 657
        Top = 103
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 14
      end
      object ckAlteraOp4: TCheckBox
        Left = 657
        Top = 79
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 11
      end
      object ckFlgObrigaOp4: TCheckBox
        Left = 554
        Top = 79
        Width = 88
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 10
      end
      object edNomeValorBase7: TEdit
        Left = 138
        Top = 151
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object edNomeValorBase8: TEdit
        Left = 138
        Top = 175
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
      end
      object ckFlgObrigaOp8: TCheckBox
        Left = 554
        Top = 175
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 22
      end
      object ckAlteraOp8: TCheckBox
        Left = 657
        Top = 175
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 23
      end
      object ckFlgObrigaOp7: TCheckBox
        Left = 554
        Top = 151
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 19
      end
      object ckAlteraOp7: TCheckBox
        Left = 657
        Top = 151
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 20
      end
    end
  end
  inherited Dock971: TDock97
    Top = 380
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 364
      DockPos = 364
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 195
      DockPos = 195
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from regra order by nomeregra')
    ValidateWithMask = True
    Left = 421
    Top = 65517
  end
end
