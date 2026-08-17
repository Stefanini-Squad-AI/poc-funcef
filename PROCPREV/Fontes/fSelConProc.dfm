inherited frmSelConProc: TfrmSelConProc
  Left = 134
  Top = 136
  HelpContext = 1100017
  Caption = 'Consulta Geral de Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited qryProcesso: TwwQuery
    ControlType.Strings = (
      'FLGSITPROC;CheckBox;1;0')
  end
end
