inherited frmPedeOpcoesTextoBenef: TfrmPedeOpcoesTextoBenef
  Left = 306
  Top = 116
  Caption = 'Especificar características das opções de Benefícios'
  ClientHeight = 414
  ClientWidth = 646
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 646
    Height = 375
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 644
      Height = 94
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblBeneficio: TLabel
        Left = 7
        Top = 50
        Width = 56
        Height = 13
        Caption = 'Benefício'
      end
      object lblPlano: TLabel
        Left = 7
        Top = 10
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object edPlano: TEdit
        Left = 7
        Top = 24
        Width = 316
        Height = 21
        TabOrder = 0
      end
      object edBeneficio: TEdit
        Left = 7
        Top = 63
        Width = 315
        Height = 21
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 95
      Width = 644
      Height = 55
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object lblnumopcoes: TLabel
        Left = 6
        Top = 5
        Width = 109
        Height = 13
        Caption = 'Número de Opções'
      end
      object spedNumOpcoesBenef: TSpinEdit
        Left = 6
        Top = 19
        Width = 112
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 3
        MinValue = 0
        ParentFont = False
        TabOrder = 0
        Value = 1
        OnChange = spedNumOpcoesBenefChange
      end
    end
    object pnlRegras: TPanel
      Left = 1
      Top = 150
      Width = 644
      Height = 135
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object grpRegraValida: TGroupBox
        Left = 6
        Top = 4
        Width = 322
        Height = 121
        TabOrder = 0
        object lblOp1: TLabel
          Left = 7
          Top = 8
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 1'
        end
        object lblOp2: TLabel
          Left = 7
          Top = 44
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 2'
        end
        object lblOp3: TLabel
          Left = 7
          Top = 81
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 3'
        end
        object dblkpcmbRegraValidaOp1: TwwDBLookupCombo
          Left = 7
          Top = 21
          Width = 306
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
          OnCloseUp = dblkpcmbRegraValidaOp1CloseUp
        end
        object dblkpcmbRegraValidaOp2: TwwDBLookupCombo
          Left = 7
          Top = 57
          Width = 306
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
          OnCloseUp = dblkpcmbRegraValidaOp2CloseUp
        end
        object dblkpcmbRegraValidaOp3: TwwDBLookupCombo
          Left = 7
          Top = 94
          Width = 306
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
          OnCloseUp = dblkpcmbRegraValidaOp3CloseUp
        end
      end
      object grpRegraCalculo: TGroupBox
        Left = 336
        Top = 4
        Width = 295
        Height = 121
        TabOrder = 1
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 1'
        end
        object Label5: TLabel
          Left = 7
          Top = 44
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 2'
        end
        object Label6: TLabel
          Left = 7
          Top = 79
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 3'
        end
        object dblkpcmbRegraCalcOp1: TwwDBLookupCombo
          Left = 7
          Top = 21
          Width = 280
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
          OnCloseUp = dblkpcmbRegraCalcOp1CloseUp
        end
        object dblkpcmbRegraCalcOp2: TwwDBLookupCombo
          Left = 7
          Top = 57
          Width = 280
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
          OnCloseUp = dblkpcmbRegraCalcOp2CloseUp
        end
        object dblkpcmbRegraCalcOp3: TwwDBLookupCombo
          Left = 7
          Top = 92
          Width = 280
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
          OnCloseUp = dblkpcmbRegraCalcOp3CloseUp
        end
      end
    end
    object pnlDescricoes: TPanel
      Left = 1
      Top = 285
      Width = 644
      Height = 89
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 3
      object Label1: TLabel
        Left = 6
        Top = 7
        Width = 86
        Height = 13
        Caption = 'Campo Texto 1'
      end
      object Label2: TLabel
        Left = 6
        Top = 31
        Width = 86
        Height = 13
        Caption = 'Campo Texto 2'
      end
      object Label3: TLabel
        Left = 6
        Top = 55
        Width = 86
        Height = 13
        Caption = 'Campo Texto 3'
      end
      object edNomeValorBase1: TEdit
        Left = 138
        Top = 7
        Width = 274
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
        Width = 274
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
        Width = 274
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
        Left = 426
        Top = 55
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 7
      end
      object ckAlteraOp3: TCheckBox
        Left = 529
        Top = 55
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 8
      end
      object ckFlgObrigaOp2: TCheckBox
        Left = 426
        Top = 31
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 4
      end
      object ckAlteraOp2: TCheckBox
        Left = 529
        Top = 31
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 5
      end
      object ckAlteraOp1: TCheckBox
        Left = 529
        Top = 7
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 2
      end
      object ckFlgObrigaOp1: TCheckBox
        Left = 426
        Top = 7
        Width = 88
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 646
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
    Top = 13
  end
end
