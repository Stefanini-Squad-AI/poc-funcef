inherited frmMTInvRegResLocBem: TfrmMTInvRegResLocBem
  Left = 254
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar Bem - Resultado de Levantamento de Inventário'
  ClientHeight = 149
  ClientWidth = 465
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 465
    Height = 110
    BevelInner = bvLowered
    BevelOuter = bvRaised
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Placa'
    end
    object edtPlaca: TEdit
      Left = 16
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 0
      OnKeyPress = edtPlacaKeyPress
    end
    object edtDescricao: TEdit
      Left = 16
      Top = 72
      Width = 433
      Height = 21
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 110
    Width = 465
    inherited tb97Fundo: TToolbar97
      Left = 293
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 124
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 403
  end
end
