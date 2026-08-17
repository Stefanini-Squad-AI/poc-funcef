inherited FrmPedeOpcoesPatro: TFrmPedeOpcoesPatro
  Left = 25
  Top = 38
  BorderIcons = [biSystemMenu]
  Caption = 'Especificar características das opções da Patrocinadora'
  ClientHeight = 486
  ClientWidth = 752
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 447
    object pnlTitulo: TPanel
      Left = 5
      Top = 5
      Width = 742
      Height = 61
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblPlano: TLabel
        Left = 10
        Top = 10
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblnumopcoes: TLabel
        Left = 519
        Top = 10
        Width = 109
        Height = 13
        Caption = 'Número de Opções'
      end
      object edPatro: TEdit
        Left = 10
        Top = 25
        Width = 384
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object spedNumOpcoes: TSpinEdit
        Left = 519
        Top = 25
        Width = 112
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 6
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1
        OnChange = spedNumOpcoesChange
      end
    end
    object ScrollBox1: TScrollBox
      Left = 5
      Top = 66
      Width = 742
      Height = 206
      Align = alTop
      TabOrder = 1
      object grpRegraValida: TGroupBox
        Left = 31
        Top = 3
        Width = 322
        Height = 245
        Caption = 'Regras de validação'
        TabOrder = 0
        object lblOp1: TLabel
          Left = 7
          Top = 19
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 1'
        end
        object lblOp2: TLabel
          Left = 7
          Top = 55
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 2'
        end
        object lblOp3: TLabel
          Left = 7
          Top = 92
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 3'
        end
        object lblOp4: TLabel
          Left = 7
          Top = 130
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 4'
        end
        object lblOp5: TLabel
          Left = 7
          Top = 166
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 5'
        end
        object lblOp6: TLabel
          Left = 7
          Top = 203
          Width = 183
          Height = 13
          Caption = 'Regra de Validação da Opção 6'
        end
        object dblkpcmbRegraValidaOp1: TwwDBLookupCombo
          Left = 7
          Top = 32
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp1CloseUp
          OnExit = dblkpcmbRegraValidaOp1Exit
        end
        object dblkpcmbRegraValidaOp2: TwwDBLookupCombo
          Left = 7
          Top = 68
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp2CloseUp
          OnExit = dblkpcmbRegraValidaOp2Exit
        end
        object dblkpcmbRegraValidaOp3: TwwDBLookupCombo
          Left = 7
          Top = 105
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp3CloseUp
          OnExit = dblkpcmbRegraValidaOp3Exit
        end
        object dblkpcmbRegraValidaOp4: TwwDBLookupCombo
          Left = 7
          Top = 143
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp4CloseUp
          OnExit = dblkpcmbRegraValidaOp4Exit
        end
        object dblkpcmbRegraValidaOp5: TwwDBLookupCombo
          Left = 7
          Top = 179
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp5CloseUp
          OnExit = dblkpcmbRegraValidaOp5Exit
        end
        object dblkpcmbRegraValidaOp6: TwwDBLookupCombo
          Left = 7
          Top = 216
          Width = 306
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraValidaOp6CloseUp
          OnExit = dblkpcmbRegraValidaOp6Exit
        end
      end
      object grpRegraCalculo: TGroupBox
        Left = 380
        Top = 3
        Width = 295
        Height = 245
        Caption = 'Regras de Cálculo'
        TabOrder = 1
        object Label4: TLabel
          Left = 7
          Top = 20
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 1'
        end
        object Label5: TLabel
          Left = 7
          Top = 56
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 2'
        end
        object Label6: TLabel
          Left = 7
          Top = 91
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 3'
        end
        object Label1: TLabel
          Left = 7
          Top = 129
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 4'
        end
        object Label2: TLabel
          Left = 7
          Top = 165
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 5'
        end
        object Label3: TLabel
          Left = 7
          Top = 202
          Width = 169
          Height = 13
          Caption = 'Regra de Cálculo da Opção 6'
        end
        object dblkpcmbRegraCalcOp1: TwwDBLookupCombo
          Left = 7
          Top = 33
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp1CloseUp
          OnExit = dblkpcmbRegraCalcOp1Exit
        end
        object dblkpcmbRegraCalcOp2: TwwDBLookupCombo
          Left = 7
          Top = 69
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp2CloseUp
          OnExit = dblkpcmbRegraCalcOp2Exit
        end
        object dblkpcmbRegraCalcOp3: TwwDBLookupCombo
          Left = 7
          Top = 104
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp3CloseUp
          OnExit = dblkpcmbRegraCalcOp3Exit
        end
        object dblkpcmbRegraCalcOp4: TwwDBLookupCombo
          Left = 7
          Top = 142
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp4CloseUp
        end
        object dblkpcmbRegraCalcOp5: TwwDBLookupCombo
          Left = 7
          Top = 178
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp5CloseUp
          OnExit = dblkpcmbRegraCalcOp5Exit
        end
        object dblkpcmbRegraCalcOp6: TwwDBLookupCombo
          Left = 7
          Top = 215
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'NOMEREGRA')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbRegraCalcOp6CloseUp
          OnExit = dblkpcmbRegraCalcOp6Exit
        end
      end
    end
    object ScrollBox2: TScrollBox
      Left = 5
      Top = 272
      Width = 742
      Height = 170
      Align = alClient
      TabOrder = 2
      object Label7: TLabel
        Left = 6
        Top = 11
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 1'
      end
      object Label8: TLabel
        Left = 6
        Top = 38
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 2'
      end
      object Label9: TLabel
        Left = 6
        Top = 64
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 3'
      end
      object Label10: TLabel
        Left = 6
        Top = 91
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 4'
      end
      object Label11: TLabel
        Left = 6
        Top = 117
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 5'
      end
      object Label12: TLabel
        Left = 6
        Top = 143
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 6'
      end
      object edNomeValorBase1: TEdit
        Left = 143
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
        Left = 143
        Top = 34
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edNomeValorBase3: TEdit
        Left = 143
        Top = 60
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ckFlgObrigaOp1: TCheckBox
        Left = 554
        Top = 9
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 3
      end
      object ckFlgObrigaOp2: TCheckBox
        Left = 554
        Top = 35
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 4
      end
      object ckFlgObrigaOp3: TCheckBox
        Left = 554
        Top = 63
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 5
      end
      object ckAlteraOp1: TCheckBox
        Left = 433
        Top = 9
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 6
      end
      object ckAlteraOp2: TCheckBox
        Left = 433
        Top = 35
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 7
      end
      object ckAlteraOp3: TCheckBox
        Left = 433
        Top = 63
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 8
      end
      object edNomeValorBase4: TEdit
        Left = 143
        Top = 87
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object ckFlgObrigaOp4: TCheckBox
        Left = 554
        Top = 90
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 10
      end
      object ckAlteraOp4: TCheckBox
        Left = 433
        Top = 90
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 11
      end
      object edNomeValorBase5: TEdit
        Left = 143
        Top = 113
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object ckFlgObrigaOp5: TCheckBox
        Left = 554
        Top = 116
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 13
      end
      object ckAlteraOp5: TCheckBox
        Left = 433
        Top = 116
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 14
      end
      object edNomeValorBase6: TEdit
        Left = 143
        Top = 139
        Width = 274
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
        Top = 142
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 16
      end
      object ckAlteraOp6: TCheckBox
        Left = 433
        Top = 142
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 17
      end
    end
  end
  inherited Dock971: TDock97
    Top = 447
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 474
      DockPos = 474
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 306
      DockPos = 306
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 123
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idregra, nomeregra from regra order by nomeregra')
    ValidateWithMask = True
    Left = 40
    Top = 141
  end
end
