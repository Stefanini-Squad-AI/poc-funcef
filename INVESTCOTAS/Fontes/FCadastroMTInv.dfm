inherited FrmCadastroMTInv: TFrmCadastroMTInv
  Caption = 'FrmCadastroMTInv'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object bvlSepTit: TBevel
      Left = 1
      Top = 42
      Width = 505
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomDescricao: TfcLabel
        Left = 16
        Top = 8
        Width = 128
        Height = 24
        Caption = 'Cadastro MT'
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 458
    Top = 71
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 248
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 384
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 316
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 456
    Top = 7
  end
  object CMSqlParams: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM caixa '
      '')
    Left = 321
    Top = 56
  end
end
