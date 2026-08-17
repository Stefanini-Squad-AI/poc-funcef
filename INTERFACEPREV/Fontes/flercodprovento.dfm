inherited frmLerCodProvento: TfrmLerCodProvento
  Left = 180
  Top = 141
  Caption = 'Associar Rubrica à Patrocianadora'
  ClientHeight = 175
  ClientWidth = 462
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
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
      Left = 327
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
      Left = 327
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edDescProvento: TEdit
      Left = 21
      Top = 96
      Width = 296
      Height = 21
      TabOrder = 1
      Text = 'edDescProvento'
    end
  end
  inherited Dock971: TDock97
    Top = 136
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 124
      DockPos = 124
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
end
