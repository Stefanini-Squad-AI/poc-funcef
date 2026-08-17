object frmValorBaixaParcial: TfrmValorBaixaParcial
  Left = 478
  Top = 274
  BorderStyle = bsDialog
  Caption = 'Baixa de Documentos'
  ClientHeight = 105
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 139
    Height = 13
    Caption = 'Valor para baixa parcial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor: TRealEdit
    Left = 8
    Top = 29
    Width = 281
    Height = 21
    Alignment = taRightJustify
    Lines.Strings = (
      'R$ 0,00')
    TabOrder = 0
    WordWrap = False
    IntDigits = 10
    DecDigits = 2
    NumberFormat = fMoney
    Signal = False
  end
  object bbtnCancelar: TBitBtn
    Left = 154
    Top = 64
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
  object bbtnOk: TBitBtn
    Left = 50
    Top = 64
    Width = 89
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bbtnOkClick
  end
end
