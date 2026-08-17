inherited frmParamRelatCompRendPessFis: TfrmParamRelatCompRendPessFis
  Left = 137
  Top = 169
  Caption = 
    'Comprovante de Rendimentos Pagos e de Retenção de I.R. - Pessoa ' +
    'Física'
  ClientHeight = 271
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 522
    Height = 232
    inherited CheckBox1: TCheckBox
      Left = 48
      Top = 112
    end
    inherited grpbxResponsavel: TGroupBox
      Left = 48
      Top = 128
    end
    object GroupBox1: TGroupBox
      Left = 48
      Top = 24
      Width = 417
      Height = 65
      TabOrder = 2
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
        Width = 15
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
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 522
    inherited tb97Fundo: TToolbar97
      Left = 352
      DockPos = 352
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 184
      DockPos = 184
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
end
