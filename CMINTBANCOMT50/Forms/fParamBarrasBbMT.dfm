inherited FrmParamBarrasBbMT: TFrmParamBarrasBbMT
  Left = 212
  Top = 165
  Caption = 'Banco do Brasil Código de Barras'
  ClientHeight = 114
  ClientWidth = 370
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 75
    object Label25: TLabel
      Left = 119
      Top = 17
      Width = 132
      Height = 13
      Caption = 'Espécie do Documento'
      Color = clScrollBar
      ParentColor = False
    end
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 45
      Height = 13
      Caption = 'Carteira'
      Color = clScrollBar
      ParentColor = False
    end
    object EdtEspecie: TEdit
      Left = 119
      Top = 35
      Width = 132
      Height = 21
      MaxLength = 40
      TabOrder = 1
    end
    object EdtCarteiraDoc: TEdit
      Left = 15
      Top = 35
      Width = 98
      Height = 21
      MaxLength = 40
      TabOrder = 0
    end
    object RgAceite: TRadioGroup
      Left = 261
      Top = 9
      Width = 92
      Height = 49
      Caption = ' Aceite '
      Columns = 2
      Items.Strings = (
        'S'
        'N')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 75
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
