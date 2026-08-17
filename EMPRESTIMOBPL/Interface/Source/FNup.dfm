inherited frmNup: TfrmNup
  Left = 437
  Top = 63
  Anchors = []
  BorderIcons = []
  Caption = 'NUP'
  ClientHeight = 208
  ClientWidth = 419
  FormStyle = fsMDIForm
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 419
    Height = 169
    object lbl1: TLabel
      Left = 80
      Top = 24
      Width = 261
      Height = 24
      Caption = 'Número Único de Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNumNup: TMaskEdit
      Left = 112
      Top = 72
      Width = 169
      Height = 28
      EditMask = '99999.999999/9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 17
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 169
    Width = 419
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 398
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 3
  end
  object Qry: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 48
    Top = 112
  end
end
