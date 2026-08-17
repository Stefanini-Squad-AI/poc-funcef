inherited frmParamListaPresenca: TfrmParamListaPresenca
  Left = 182
  Top = 216
  Caption = 'Opções para a Lista de Presença'
  ClientHeight = 175
  ClientWidth = 474
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 474
    Height = 136
    object rgTipoRelatorio: TRadioGroup
      Left = 17
      Top = 18
      Width = 441
      Height = 100
      Caption = 'Tipo de Relatório'
      ItemIndex = 0
      Items.Strings = (
        'Uma Lista por Dia para a Data de Realização Apontada'
        'Uma Lista por Dia a Partir da Data de Realização Apontada'
        
          'Uma Lista para Todos os Dias a partir da Data de Realização Apon' +
          'tada')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 136
    Width = 474
    inherited tb97Fundo: TToolbar97
      Left = 304
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 137
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
end
