inherited frmLerCodProvento: TfrmLerCodProvento
  Left = 180
  Top = 141
  Caption = 'Associar Rubrica à Patrocinadora'
  ClientHeight = 175
  ClientWidth = 421
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 136
    object lblPatrocinadora: TLabel
      Left = 21
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object lblProvento: TLabel
      Left = 21
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Rubrica'
    end
    object Label3: TLabel
      Left = 279
      Top = 81
      Width = 106
      Height = 13
      Caption = 'Código da Rubrica'
    end
    object Label1: TLabel
      Left = 21
      Top = 81
      Width = 124
      Height = 13
      Caption = 'Descrição da Rubrica'
    end
    object edCodProvento: TEdit
      Left = 279
      Top = 96
      Width = 121
      Height = 21
      MaxLength = 7
      TabOrder = 0
    end
    object edDescProvento: TEdit
      Left = 21
      Top = 96
      Width = 247
      Height = 21
      TabOrder = 1
      Text = 'edDescProvento'
    end
  end
  inherited Dock971: TDock97
    Top = 136
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 251
      DockPos = 251
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
end
