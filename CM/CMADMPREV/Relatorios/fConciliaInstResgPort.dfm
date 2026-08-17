inherited frmConciliaInstResgPort: TfrmConciliaInstResgPort
  Caption = 'Parâmetros do Relatório Conciliação de Institutos'
  ClientHeight = 110
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 71
    object GroupBox1: TGroupBox
      Left = 41
      Top = 8
      Width = 456
      Height = 60
      Caption = 'Período'
      TabOrder = 0
      object Label1: TLabel
        Left = 224
        Top = 24
        Width = 8
        Height = 13
        Caption = 'e'
      end
      object cbDtInicial: TwwDBComboBox
        Left = 64
        Top = 24
        Width = 121
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        ShowMatchText = True
        DropDownCount = 8
        ItemHeight = 0
        LimitEditRect = True
        MaxLength = 7
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnExit = verificaCampo
      end
      object cbDtFinal: TwwDBComboBox
        Left = 272
        Top = 24
        Width = 121
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        ShowMatchText = True
        DropDownCount = 8
        ItemHeight = 0
        LimitEditRect = True
        MaxLength = 7
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnExit = verificaCampo
      end
    end
  end
  inherited Dock971: TDock97
    Top = 71
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 56
    Top = 72
  end
  inherited Cmp_Padrao: TCmParamReport
    Top = 72
  end
  object qryPeriodo: TwwQuery
    ObjectView = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 98
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPeriodo: TwwDataSource
    DataSet = qryPeriodo
    Left = 151
    Top = 72
  end
end
