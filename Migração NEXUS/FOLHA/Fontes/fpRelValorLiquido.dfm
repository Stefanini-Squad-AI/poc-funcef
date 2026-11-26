inherited frmPRelValorLiquido: TfrmPRelValorLiquido
  Left = 517
  Top = 12
  HelpContext = 180090
  Caption = 'Relatório de Valor Líquido em Determinada Faixa'
  ClientWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 410
    inherited RdoTipoFiltro: TRadioGroup
      Top = 39
    end
    object pnlValorLiquido: TPanel
      Left = 1
      Top = 177
      Width = 408
      Height = 55
      Align = alBottom
      TabOrder = 3
      object gbFaixaInicial: TGroupBox
        Left = 1
        Top = 1
        Width = 198
        Height = 53
        Align = alLeft
        Caption = 'Faixa do Valor Líquido Inicial'
        TabOrder = 0
        object edFaixaInicial: TRealEdit
          Left = 26
          Top = 18
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 14
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object gbFaixaFinal: TGroupBox
        Left = 199
        Top = 1
        Width = 198
        Height = 53
        Align = alLeft
        Caption = 'Faixa do Valor Líquido Final'
        TabOrder = 1
        object edFaixaFinal: TRealEdit
          Left = 28
          Top = 17
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 14
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 232
      Width = 408
      Height = 54
      Align = alBottom
      TabOrder = 4
      object rdgOrdem: TRadioGroup
        Left = 1
        Top = 1
        Width = 294
        Height = 52
        Align = alLeft
        BiDiMode = bdLeftToRight
        Caption = 'Por ordem de'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Matrícula'
          'Nome do Recebedor')
        ParentBiDiMode = False
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 295
        Top = 1
        Width = 102
        Height = 52
        Align = alLeft
        Caption = 'Escolha a Côr'
        TabOrder = 1
        object fcColorCombo: TfcColorCombo
          Left = 21
          Top = 20
          Width = 37
          Height = 21
          ButtonStyle = cbsEllipsis
          ColorDialog = ColorDialog
          ColorListOptions.Font.Charset = DEFAULT_CHARSET
          ColorListOptions.Font.Color = clWindowText
          ColorListOptions.Font.Height = -11
          ColorListOptions.Font.Name = 'MS Sans Serif'
          ColorListOptions.Font.Style = []
          DropDownCount = 8
          ReadOnly = False
          SelectedColor = clWhite
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 238
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 69
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 360
    Top = 21
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 304
    Top = 21
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 221
    Top = 212
  end
end
