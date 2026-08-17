inherited frmParamRelatCompRendPessJur: TfrmParamRelatCompRendPessJur
  Left = 169
  Top = 171
  Caption = 
    'Comprovante de Rendimentos Pagos e de Retenção de I.R. - Pessoa ' +
    'Jurídica'
  ClientHeight = 293
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 522
    Height = 254
    inherited CheckBox1: TCheckBox
      Left = 48
      Top = 96
    end
    object GroupBox1: TGroupBox [1]
      Left = 48
      Top = 19
      Width = 417
      Height = 65
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 24
        Width = 59
        Height = 13
        Caption = 'Ano Base:'
      end
      object edtData: TEdit
        Left = 288
        Top = 24
        Width = 97
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object UpDown1: TUpDown
        Left = 385
        Top = 24
        Width = 16
        Height = 21
        Associate = edtData
        Min = 0
        Max = 3000
        Position = 0
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
    end
    object rgTipo: TRadioGroup [2]
      Left = 48
      Top = 198
      Width = 417
      Height = 46
      Caption = ' Tipo de Pessoa '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Jurídica'
        '&Física')
      TabOrder = 2
    end
    inherited grpbxResponsavel: TGroupBox
      Left = 48
      Top = 116
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 254
    Width = 522
    inherited tb97Fundo: TToolbar97
      Left = 350
      DockPos = 353
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 181
      DockPos = 184
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
end
