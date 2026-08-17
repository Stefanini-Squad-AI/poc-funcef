inherited FrmCadastroMTInv: TFrmCadastroMTInv
  Left = 325
  Top = 215
  Caption = 'FrmCadastroMTInv'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 205
        Height = 24
        Caption = 'Descrição da Tabela'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 232
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 124
    Top = 135
  end
end
