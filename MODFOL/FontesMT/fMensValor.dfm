inherited frmMensValor: TfrmMensValor
  Left = 223
  Top = 184
  ActiveControl = mkedValor
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = '[Aviso]'
  ClientHeight = 199
  ClientWidth = 392
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 392
    Height = 160
    BorderWidth = 2
    object Label1: TLabel
      Left = 24
      Top = 128
      Width = 27
      Height = 13
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 5
      Top = 5
      Width = 382
      Height = 108
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object mkedValor: TMaskEdit
      Left = 64
      Top = 124
      Width = 57
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 160
    Width = 392
    inherited tb97Fundo: TToolbar97
      Left = 222
      DockPos = 222
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 54
      DockPos = 54
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 13
    Top = 154
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
