inherited frmIdCpuAtend: TfrmIdCpuAtend
  Left = 258
  Top = 165
  Caption = 'Cpu de atendimento'
  ClientHeight = 142
  ClientWidth = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 341
    Height = 103
    object Label_CPU: TLabel
      Left = 49
      Top = 46
      Width = 26
      Height = 13
      Caption = 'CPU'
    end
    object ComboBoxCPUAtend: TComboBox
      Left = 80
      Top = 40
      Width = 193
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxCPUAtendChange
    end
  end
  inherited Dock971: TDock97
    Top = 103
    Width = 341
    inherited tb97Fundo: TToolbar97
      Left = 171
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 4
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object wwQueryCPUAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  L.IdLocalAtendXCpu,'
      '  L.IdCpuAtend,'
      '  C.DescCpuAtend'
      'from  LocalAtendXcpu L, CpuAtend C'
      'where L.idcpuatend = C.Idcpuatend'
      'order by c.desccpuatend'
      '')
    ValidateWithMask = True
    Left = 288
    Top = 8
  end
end
