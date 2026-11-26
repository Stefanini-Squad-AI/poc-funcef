inherited FrmParamTransfBbMT: TFrmParamTransfBbMT
  Left = 367
  Top = 212
  Caption = 'Banco do Brasil Transferência'
  ClientHeight = 120
  ClientWidth = 370
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 81
    object Label1: TLabel
      Left = 18
      Top = 19
      Width = 91
      Height = 13
      Caption = 'Agência Central'
    end
    object Label2: TLabel
      Left = 146
      Top = 19
      Width = 78
      Height = 13
      Caption = 'Conta Central'
    end
    object EdtAgeCentral: TEdit
      Left = 18
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtContaCentral: TEdit
      Left = 146
      Top = 35
      Width = 209
      Height = 21
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 81
    Width = 370
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
