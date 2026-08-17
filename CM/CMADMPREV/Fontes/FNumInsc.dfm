inherited frmNumInsc: TfrmNumInsc
  Left = 255
  Top = 136
  BorderIcons = []
  Caption = 'Número de Inscrição '
  ClientHeight = 165
  ClientWidth = 338
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 338
    Height = 126
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label2: TLabel
      Left = 11
      Top = 66
      Width = 118
      Height = 13
      Caption = 'Número de Inscrição'
    end
    object edNomePlano: TEdit
      Left = 11
      Top = 34
      Width = 319
      Height = 21
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edNumInsc: TRealEdit
      Left = 11
      Top = 82
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '            0')
      ParentFont = False
      TabOrder = 1
      WordWrap = False
      IntDigits = 13
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 126
    Width = 338
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 303
    Top = 99
  end
end
