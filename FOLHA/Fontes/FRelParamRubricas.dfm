inherited FrmRelParamRubricas: TFrmRelParamRubricas
  Left = 319
  Top = 171
  HelpContext = 180082
  Caption = 'Confirmação'
  ClientHeight = 122
  ClientWidth = 423
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 423
    Height = 83
    object Label1: TLabel
      Left = 120
      Top = 16
      Width = 197
      Height = 13
      Caption = 'Confirma a Impressão do relatório?'
    end
  end
  inherited Dock971: TDock97
    Top = 83
    Width = 423
    inherited tb97Fundo: TToolbar97
      Left = 251
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 82
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
end
