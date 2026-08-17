inherited frmAplicaDiferenca: TfrmAplicaDiferenca
  Left = 153
  Top = 165
  Caption = 'Aplicar Diferença entre Mês Anterior e Mês Corrente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 85
      Top = 64
      Width = 160
      Height = 13
      Caption = 'Mes Com Cobrança a Menor'
    end
    object Label2: TLabel
      Left = 298
      Top = 66
      Width = 185
      Height = 13
      Caption = 'Mes Para Cobrança da Dierença'
    end
    object CmbMesIni: TComboBox
      Left = 85
      Top = 80
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object CmbMesFin: TComboBox
      Left = 300
      Top = 80
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object ProgressBar: TProgressBar
      Left = 64
      Top = 184
      Width = 401
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryMeses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESCOBRANCA '
      'FROM HSTCONTRIBASS '
      'ORDER BY MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 216
    Top = 136
  end
  object qryValMesAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' * '
      'FROM HSTCONTRIBASS '
      'WHERE   MESCOBRANCA = :mes'
      'ORDER BY IDTITULAR ASC, IDPLANASS ASC, IDCONTASS ASC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'mes'
        ParamType = ptInput
      end>
  end
  object qryValMesPos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' * '
      'FROM HSTCONTRIBASS '
      'WHERE   MESCOBRANCA = :mes'
      '    AND SITRECEBIMENTO = 0'
      'ORDER BY IDTITULAR ASC, IDPLANASS ASC, IDCONTASS ASC')
    UpdateObject = UpdValMesPos
    ValidateWithMask = True
    Left = 349
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'mes'
        ParamType = ptInput
      end>
  end
  object UpdValMesPos: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBASS'
      'set'
      '  VALORESPERADO = :VALORESPERADO'
      'where'
      '  MES = :OLD_MES and'
      '  IDTITULAR = :OLD_IDTITULAR')
    Left = 432
    Top = 128
  end
end
