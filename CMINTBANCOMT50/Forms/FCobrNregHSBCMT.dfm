inherited FrmCobrNregHSBCMT: TFrmCobrNregHSBCMT
  Left = 235
  Top = 117
  Caption = 'Cobrança Não Registrada (HSBC)'
  ClientHeight = 246
  ClientWidth = 583
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 583
    Height = 207
    object Bevel2: TBevel
      Left = 17
      Top = 16
      Width = 150
      Height = 57
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 26
      Top = 24
      Width = 124
      Height = 13
      Caption = 'Código do Formulário '
    end
    object Edtnuform: TEditNum
      Left = 27
      Top = 40
      Width = 127
      Height = 21
      TabOrder = 0
      IntDigits = 4
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object RadioGroup1: TRadioGroup
      Left = 174
      Top = 11
      Width = 265
      Height = 62
      Caption = ' Montagem dos Carnes '
      Columns = 2
      Items.Strings = (
        'Carne Montado'
        'Carne Sanfonado')
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 80
      Width = 550
      Height = 109
      Caption = ' Observações '
      TabOrder = 2
      object mskobs1: TMaskEdit
        Left = 10
        Top = 18
        Width = 529
        Height = 21
        MaxLength = 42
        TabOrder = 0
      end
      object mskobs2: TMaskEdit
        Left = 10
        Top = 47
        Width = 529
        Height = 21
        MaxLength = 42
        TabOrder = 1
      end
      object mskobs3: TMaskEdit
        Left = 10
        Top = 77
        Width = 529
        Height = 21
        MaxLength = 42
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 207
    Width = 583
    inherited tb97Fundo: TToolbar97
      Left = 276
      DockPos = 276
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
      DockPos = 108
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 325
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
