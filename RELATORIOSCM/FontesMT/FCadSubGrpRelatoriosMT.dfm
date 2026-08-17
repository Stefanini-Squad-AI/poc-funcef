inherited frmCadSubGrpRelatorios: TfrmCadSubGrpRelatorios
  Left = 414
  Top = 174
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Seleciona'
  ClientHeight = 416
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 438
    Height = 377
    object TreeReports: TfcTreeView
      Left = 1
      Top = 1
      Width = 436
      Height = 325
      Align = alClient
      Indent = 19
      Items.StreamVersion = 1
      Items.Data = {00000000}
      TabOrder = 0
      OnChange = TreeReportsChange
      OnDblClick = TreeReportsDblClick
    end
    object memGrupoRelatorio: TMemo
      Left = 1
      Top = 326
      Width = 436
      Height = 50
      Align = alBottom
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 438
    inherited tb97Fundo: TToolbar97
      Left = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
