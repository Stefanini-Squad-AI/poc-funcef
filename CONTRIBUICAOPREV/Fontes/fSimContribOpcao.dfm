inherited frmSimContribOpcao: TfrmSimContribOpcao
  Caption = 'Opções de Contribuição'
  ClientHeight = 249
  ClientWidth = 418
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 418
    Height = 210
    object grbContrib: TGroupBox
      Left = 23
      Top = 17
      Width = 369
      Height = 169
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 21
        Width = 49
        Height = 13
        Caption = 'Opção 1'
      end
      object Label2: TLabel
        Left = 32
        Top = 71
        Width = 49
        Height = 13
        Caption = 'Opção 2'
      end
      object Label3: TLabel
        Left = 32
        Top = 121
        Width = 49
        Height = 13
        Caption = 'Opção 3'
      end
      object edtOpcao1: TEdit
        Left = 32
        Top = 35
        Width = 129
        Height = 21
        TabOrder = 0
      end
      object edtOpcao2: TEdit
        Left = 32
        Top = 85
        Width = 129
        Height = 21
        TabOrder = 1
      end
      object edtOpcao3: TEdit
        Left = 32
        Top = 135
        Width = 129
        Height = 21
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 210
    Width = 418
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 357
      Visible = False
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 515
  end
end
