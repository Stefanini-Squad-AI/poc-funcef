inherited frmApurTipoOper: TfrmApurTipoOper
  Caption = 'frmApurTipoOper'
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    inherited pnlControles: TPanel
      Top = 42
      Width = 530
      Height = 158
    end
    inherited dbGrd: TwwDBGrid
      Top = 42
      Width = 530
      Height = 158
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 530
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 532
  end
  inherited Dock971: TDock97
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 360
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65530
    Top = 65519
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 304
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 276
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Left = 344
    Top = 65535
  end
end
