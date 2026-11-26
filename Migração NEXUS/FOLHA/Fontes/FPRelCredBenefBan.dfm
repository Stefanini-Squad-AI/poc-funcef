inherited frmPRelCredBenefBan: TfrmPRelCredBenefBan
  Left = 185
  Top = 177
  HelpContext = 180093
  Caption = 'Relação de Crédito de Beneficiários por banco'
  ClientHeight = 260
  ClientWidth = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 221
    inherited RdoTipoFolha: TRadioGroup
      Left = 1
      Top = 1
      Width = 572
      Align = alTop
    end
    inherited RdoTipoFiltro: TRadioGroup
      Left = 1
      Top = 34
      Width = 572
      Align = alTop
      Enabled = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Left = 1
      Top = 67
      Width = 572
      Height = 65
      Align = alTop
      inherited PnlMesPagto: TPanel
        Left = 2
        Top = 2
        Width = 560
        Visible = False
      end
      inherited PnlLoteouVersao: TPanel
        Left = 2
        Top = 2
        Width = 568
        Height = 61
        Align = alClient
        inherited LblLoteouVersao: TLabel
          Top = 16
        end
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Left = 74
          Top = 14
          Width = 360
        end
      end
    end
    object pnlAssinatura: TPanel
      Left = 1
      Top = 142
      Width = 572
      Height = 78
      Align = alBottom
      TabOrder = 3
      object gbPrimeiraAss: TGroupBox
        Left = 1
        Top = 1
        Width = 235
        Height = 76
        Align = alLeft
        Caption = '1ª Assinatura'
        TabOrder = 0
        object edtAssina1: TEdit
          Left = 6
          Top = 21
          Width = 217
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object gbSegundaAss: TGroupBox
        Left = 236
        Top = 1
        Width = 235
        Height = 76
        Align = alLeft
        Caption = '2ª Assinatura'
        TabOrder = 1
        object edtAssina2: TEdit
          Left = 10
          Top = 20
          Width = 213
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 471
        Top = 1
        Width = 91
        Height = 76
        Align = alLeft
        Caption = 'Escolha a Côr'
        TabOrder = 2
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
    Top = 221
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
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
    Left = 440
    Top = 13
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 376
    Top = 13
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 517
    Top = 12
  end
end
