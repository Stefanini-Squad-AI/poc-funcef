inherited frmOkCancelarInv: TfrmOkCancelarInv
  Caption = 'frmOkCancelarInv'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object bvlSepTit: TBevel
      Left = 1
      Top = 42
      Width = 526
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 526
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomDescricao: TfcLabel
        Left = 16
        Top = 8
        Width = 192
        Height = 24
        Caption = 'Descrição do Form'
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
end
