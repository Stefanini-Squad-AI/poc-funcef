inherited FrmSelTipoImpressaoCPMF: TFrmSelTipoImpressaoCPMF
  Left = 342
  Top = 213
  Caption = 'Impressão CPMF'
  ClientHeight = 237
  ClientWidth = 352
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 198
    object Bevel1: TBevel
      Left = 24
      Top = 144
      Width = 305
      Height = 27
      Shape = bsFrame
    end
    object RgTipoRelat: TRadioGroup
      Left = 24
      Top = 17
      Width = 305
      Height = 74
      Caption = ' Tipo de Relatório '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sintético'
        'Analítico'
        'Analítico Incons.'
        'Analítico por Data')
      TabOrder = 0
    end
    object RgSaidaRelat: TRadioGroup
      Left = 24
      Top = 93
      Width = 305
      Height = 46
      Caption = ' Saída '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Tela'
        '&Impressora')
      TabOrder = 1
    end
    object CkbRateio: TCheckBox
      Left = 80
      Top = 149
      Width = 193
      Height = 17
      Caption = 'Imprime Rateio do Documento'
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 198
    Width = 352
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 299
    Top = 211
  end
end
