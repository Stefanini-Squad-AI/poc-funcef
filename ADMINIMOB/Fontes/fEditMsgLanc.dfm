inherited frmEditMsgLanc: TfrmEditMsgLanc
  Left = 208
  Top = 137
  Caption = 'Editar Mensagem do Documento'
  ClientHeight = 276
  ClientWidth = 526
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 243
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 47
      Height = 13
      Caption = 'Linha 1:'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 47
      Height = 13
      Caption = 'Linha 2:'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 47
      Height = 13
      Caption = 'Linha 3:'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 47
      Height = 13
      Caption = 'Linha 4:'
    end
    object Label6: TLabel
      Left = 8
      Top = 116
      Width = 47
      Height = 13
      Caption = 'Linha 5:'
    end
    object Label7: TLabel
      Left = 8
      Top = 140
      Width = 47
      Height = 13
      Caption = 'Linha 6:'
    end
    object Label8: TLabel
      Left = 8
      Top = 164
      Width = 47
      Height = 13
      Caption = 'Linha 7:'
    end
    object Label9: TLabel
      Left = 8
      Top = 188
      Width = 47
      Height = 13
      Caption = 'Linha 8:'
    end
    object Label10: TLabel
      Left = 8
      Top = 212
      Width = 47
      Height = 13
      Caption = 'Linha 9:'
    end
    object edtLn1: TEdit
      Left = 64
      Top = 16
      Width = 449
      Height = 21
      TabOrder = 0
    end
    object edtLn2: TEdit
      Left = 64
      Top = 40
      Width = 449
      Height = 21
      TabOrder = 1
    end
    object edtLn3: TEdit
      Left = 64
      Top = 64
      Width = 449
      Height = 21
      TabOrder = 2
    end
    object edtLn4: TEdit
      Left = 64
      Top = 88
      Width = 449
      Height = 21
      TabOrder = 3
    end
    object edtLn5: TEdit
      Left = 64
      Top = 112
      Width = 449
      Height = 21
      TabOrder = 4
    end
    object edtLn6: TEdit
      Left = 64
      Top = 136
      Width = 449
      Height = 21
      TabOrder = 5
    end
    object edtLn7: TEdit
      Left = 64
      Top = 160
      Width = 449
      Height = 21
      TabOrder = 6
    end
    object edtLn8: TEdit
      Left = 64
      Top = 184
      Width = 449
      Height = 21
      TabOrder = 7
    end
    object edtLn9: TEdit
      Left = 64
      Top = 208
      Width = 449
      Height = 21
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 243
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 354
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 182
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
end
