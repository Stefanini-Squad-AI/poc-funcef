inherited frmMudaLocalAtend: TfrmMudaLocalAtend
  Left = 214
  Top = 172
  Caption = 'Alteração do Local de Atendimento'
  ClientHeight = 184
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 422
    Height = 145
    object Label1: TLabel
      Left = 66
      Top = 48
      Width = 124
      Height = 13
      Caption = 'Local de Atendimento'
    end
    object DblkLocalAtend: TwwDBLookupCombo
      Left = 66
      Top = 64
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCLOCALATEND'#9'60'#9'DESCLOCALATEND'#9'F')
      LookupTable = qryLocalAtend
      LookupField = 'IDLOCALATEND'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DblkLocalAtendChange
    end
  end
  inherited Dock971: TDock97
    Top = 145
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 11
  end
  object qryLocalAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LA.IDLOCALATEND,'
      '  LA.DESCLOCALATEND  '
      'FROM LOCALATEND LA'
      'ORDER BY LA.DESCLOCALATEND  ')
    ValidateWithMask = True
    Left = 336
    Top = 8
    object qryLocalAtendDESCLOCALATEND: TStringField
      DisplayWidth = 60
      FieldName = 'DESCLOCALATEND'
      Origin = 'BASEDADOS.LOCALATEND.DESCLOCALATEND'
      Size = 60
    end
    object qryLocalAtendIDLOCALATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALATEND'
      Origin = 'BASEDADOS.LOCALATEND.IDLOCALATEND'
      Visible = False
    end
  end
  object qryLocalAtendXcpu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDLOCALATENDXCPU,'
      '  IDLOCALATEND'
      'FROM'
      'LOCALATENDXCPU'
      '')
    ValidateWithMask = True
    Left = 144
    Top = 88
    object qryLocalAtendXcpuIDLOCALATENDXCPU: TFloatField
      FieldName = 'IDLOCALATENDXCPU'
      Origin = 'BASEDADOS.LOCALATENDXCPU.IDLOCALATENDXCPU'
    end
    object qryLocalAtendXcpuIDLOCALATEND: TFloatField
      FieldName = 'IDLOCALATEND'
      Origin = 'BASEDADOS.LOCALATENDXCPU.IDLOCALATEND'
    end
  end
  object qryDeleteCPU: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from LOCALATENDXCPU'
      'where'
      '  IDLOCALATENDXCPU = :IDLOCALATENDXCPU')
    ValidateWithMask = True
    Left = 232
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLOCALATENDXCPU'
        ParamType = ptUnknown
      end>
  end
  object qryInsereCPU: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into LOCALATENDXCPU'
      '  (IDLOCALATENDXCPU, IDCPUATEND, IDLOCALATEND)'
      'values'
      '  (:IDLOCALATENDXCPU, :IDCPUATEND, :IDLOCALATEND)')
    ValidateWithMask = True
    Left = 272
    Top = 96
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'IDLOCALATENDXCPU'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'IDCPUATEND'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'IDLOCALATEND'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from localatendxcpu '
      'where idlocalatend = :idlocalatend and '
      '      idcpuatend   = :idcpuatend')
    ValidateWithMask = True
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idlocalatend'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idcpuatend'
        ParamType = ptInput
      end>
  end
end
