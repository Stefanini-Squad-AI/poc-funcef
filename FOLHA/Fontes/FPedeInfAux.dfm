inherited frmPedeInfAux: TfrmPedeInfAux
  Left = 220
  Top = 178
  Caption = 'Informe '
  ClientHeight = 137
  ClientWidth = 441
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 441
    Height = 98
    object lblTitulo1: TLabel
      Left = 18
      Top = 18
      Width = 53
      Height = 13
      Caption = 'lblTitulo1'
    end
    object edInf1: TMaskEdit
      Left = 18
      Top = 34
      Width = 201
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 98
    Width = 441
    inherited tb97Fundo: TToolbar97
      Left = 265
      DockPos = 265
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 97
    end
  end
end
