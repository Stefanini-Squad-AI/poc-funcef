inherited frmPRelPagtoIndiv: TfrmPRelPagtoIndiv
  Left = 310
  Top = 334
  HelpContext = 180100
  Caption = 'Relatório de Pagamento Individual'
  ClientHeight = 192
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 153
    inherited RdoTipoFolha: TRadioGroup
      Width = 608
      Anchors = [akLeft, akTop, akRight]
    end
    inherited RdoTipoFiltro: TRadioGroup
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 40
      Width = 608
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      inherited PnlMesPagto: TPanel
        Visible = False
      end
      inherited PnlLoteouVersao: TPanel
        Width = 594
        Anchors = [akLeft, akTop, akRight]
        inherited LblLoteouVersao: TLabel
          Top = 11
        end
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Width = 512
          Anchors = [akLeft, akTop, akRight]
        end
      end
    end
    object Panel1: TPanel
      Left = 8
      Top = 91
      Width = 609
      Height = 52
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
    Top = 153
    Width = 624
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
    Left = 352
    Top = 21
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 320
    Top = 21
  end
end
