inherited frmCustomSelProcesso: TfrmCustomSelProcesso
  Left = 90
  Top = 101
  Caption = 'Seleção de Processos'
  ClientHeight = 405
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 366
    BorderWidth = 2
    object pnResult: TPanel
      Left = 4
      Top = 4
      Width = 615
      Height = 358
      Align = alClient
      TabOrder = 0
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 366
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 361
      DockPos = 461
      inherited sep1: TToolbarSep97
        Left = 175
      end
      inherited sep3: TToolbarSep97
        Left = 92
      end
      inherited bbtnSair: TBitBtn
        Left = 95
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 178
      end
      object bbtnOutraVez: TBitBtn
        Left = 0
        Top = 0
        Width = 92
        Height = 33
        Caption = '&De Novo'
        TabOrder = 2
        Visible = False
        OnClick = bbtnOutraVezClick
        Kind = bkOK
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 194
      DockPos = 294
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
end
