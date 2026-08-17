object frmAnimacao: TfrmAnimacao
  Left = 374
  Top = 380
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'frmAnimacao'
  ClientHeight = 138
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlInformacoes: TPanel
    Left = 0
    Top = 88
    Width = 229
    Height = 50
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object PnlProgressBar: TPanel
      Left = 11
      Top = 16
      Width = 125
      Height = 34
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PrgrssBrBarra: TProgressBar
        Left = 0
        Top = 0
        Width = 125
        Height = 15
        Align = alTop
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 229
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object PnlCancelar: TPanel
      Left = 136
      Top = 16
      Width = 93
      Height = 34
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object BtBtnCancelar: TBitBtn
        Left = 10
        Top = 0
        Width = 75
        Height = 25
        Cursor = crArrow
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtBtnCancelarClick
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 16
      Width = 11
      Height = 34
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object AnmtAnimacao: TAnimate
    Left = 30
    Top = 0
    Width = 111
    Height = 88
    Align = alLeft
    Active = False
    StopFrame = 26
  end
  object PnlEspacoEsqueda: TPanel
    Left = 0
    Top = 0
    Width = 30
    Height = 88
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object PnlEspacoDireita: TPanel
    Left = 189
    Top = 0
    Width = 40
    Height = 88
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
  end
end
