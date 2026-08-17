inherited FrmPRelCredBenefAgen: TFrmPRelCredBenefAgen
  HelpContext = 180094
  Caption = 'Relação de Crédito de Beneficiários por agência'
  ClientHeight = 194
  ClientWidth = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 593
    Height = 155
    inherited RdoTipoFolha: TRadioGroup
      Width = 577
      Anchors = [akLeft, akTop, akRight]
    end
    inherited RdoTipoFiltro: TRadioGroup
      Width = 577
      Anchors = [akLeft, akTop, akRight]
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 42
      Width = 577
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      inherited PnlMesPagto: TPanel
        Visible = False
      end
      inherited PnlLoteouVersao: TPanel
        Width = 562
        Anchors = [akLeft, akTop, akRight]
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Width = 480
          Anchors = [akLeft, akTop, akRight]
        end
      end
    end
    object Panel1: TPanel
      Left = 10
      Top = 91
      Width = 576
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Label3: TLabel
        Left = 56
        Top = 5
        Width = 80
        Height = 13
        Caption = '1º Assinatura '
      end
      object Label1: TLabel
        Left = 323
        Top = 5
        Width = 76
        Height = 13
        Caption = '2º Assinatura'
      end
      object edtAssina1: TEdit
        Left = 50
        Top = 22
        Width = 194
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtAssina2: TEdit
        Left = 317
        Top = 22
        Width = 194
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 155
    Width = 593
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
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 296
    Top = 101
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 264
    Top = 101
  end
end
