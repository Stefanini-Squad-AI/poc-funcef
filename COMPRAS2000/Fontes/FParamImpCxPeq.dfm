inherited FrmParamImpCxPeq: TFrmParamImpCxPeq
  Left = 228
  Top = 202
  Caption = 'Caixa Pequeno'
  ClientHeight = 174
  ClientWidth = 403
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 135
    Width = 403
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
  inherited pnlFundo: TPanel [1]
    Width = 403
    Height = 135
    object Label1: TLabel
      Left = 17
      Top = 25
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object Label5: TLabel
      Left = 17
      Top = 73
      Width = 81
      Height = 13
      Caption = 'Nº do Borderô'
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 17
      Top = 44
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'DESCCAIXAPEQ')
      DataField = 'IDCAIXAPEQUENO'
      LookupTable = qryCP
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCaixaPeqCloseUp
    end
    object edNumBord: TRealEdit
      Left = 17
      Top = 89
      Width = 185
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 6
  end
  object qryCP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CP.IDCAIXAPEQUENO,'
      '      CP.DESCCAIXAPEQ,'
      '      CP.VLRTOTCAIXAPEQ,'
      '      P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      CAIXAPEQUENO CP,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (CP.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO)'
      '    AND (CP.IDFORCLI = P.IDPESSOA)'
      'ORDER BY CP.DESCCAIXAPEQ')
    ValidateWithMask = True
    Left = 303
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryCPIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = '"CM.CAIXAPEQUENO".IDCAIXAPEQUENO'
    end
    object qryCPDESCCAIXAPEQ: TStringField
      FieldName = 'DESCCAIXAPEQ'
      Origin = '"CM.CAIXAPEQUENO".DESCCAIXAPEQ'
      Size = 60
    end
    object qryCPRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryCPVLRTOTCAIXAPEQ: TFloatField
      FieldName = 'VLRTOTCAIXAPEQ'
      Origin = '"CM.CAIXAPEQUENO".VLRTOTCAIXAPEQ'
    end
  end
  object qryBord: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      DISTINCT'
      '      L.IDCAIXAPEQUENO,'
      '      B.DATAEFETBORDERO'
      'FROM'
      '      LANCCAIXAPEQ L,'
      '      BORDEROCAIXAPEQ B,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (L.IDBORDEROCXPEQ = :pIDBORD)'
      '    AND (L.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = L.IDCAIXAPEQUENO)'
      '    AND (L.IDBORDEROCXPEQ = B.IDBORDEROCXPEQ)'
      '')
    ValidateWithMask = True
    Left = 345
    Top = 57
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDBORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryBordIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'LANCCAIXAPEQ.IDCAIXAPEQUENO'
    end
    object qryBordDATAEFETBORDERO: TDateTimeField
      FieldName = 'DATAEFETBORDERO'
      Origin = 'BORDEROCAIXAPEQ.DATAEFETBORDERO'
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
  object dsBord: TwwDataSource
    AutoEdit = False
    DataSet = qryBord
    Left = 345
    Top = 105
  end
  object dsCP: TwwDataSource
    AutoEdit = False
    DataSet = qryCP
    Left = 303
    Top = 105
  end
end
