object frmExibeItensContrato: TfrmExibeItensContrato
  Left = 736
  Top = 218
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Itens do Contrato'
  ClientHeight = 212
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbCabecalho: TLabel
    Left = 0
    Top = 0
    Width = 484
    Height = 16
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 208
    Top = 176
    Width = 41
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object lvGradeDados: TListView
    Left = 0
    Top = 16
    Width = 484
    Height = 150
    Align = alTop
    Columns = <
      item
        AutoSize = True
        Caption = 'Data Base'
      end
      item
        AutoSize = True
        Caption = 'Nome do Contrato'
      end
      item
        AutoSize = True
        Caption = 'Valor'
      end>
    GridLines = True
    TabOrder = 1
    ViewStyle = vsReport
  end
end
