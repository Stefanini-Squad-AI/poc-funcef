inherited frmRegTreinMetaAtuarial: TfrmRegTreinMetaAtuarial
  Left = 422
  Top = 294
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 102
  ClientWidth = 240
  Font.Style = [fsBold]
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbInfMetaAtuarial: TLabel [0]
    Left = 55
    Top = 14
    Width = 137
    Height = 13
    Caption = 'Informe a Meta Atuarial.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtMetaAtuarial: TEdit [1]
    Left = 72
    Top = 32
    Width = 103
    Height = 21
    TabOrder = 0
  end
  object btnOK: TBitBtn [2]
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object bbtnCancelar: TmaHelpBitBtn [3]
    Left = 128
    Top = 64
    Width = 73
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = bbtnCancelarClick
    NumGlyphs = 2
    ClickHelpContext = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 7
  end
end
