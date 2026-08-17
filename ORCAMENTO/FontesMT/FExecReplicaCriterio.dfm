inherited frmExecReplicaCriterio: TfrmExecReplicaCriterio
  Top = 328
  HelpContext = 520061
  Caption = ''
  ClientHeight = 161
  ClientWidth = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 472
    Height = 122
    object lblCriterio: TLabel
      Left = 24
      Top = 18
      Width = 100
      Height = 13
      Caption = 'Critério de Rateio'
    end
    object lblExercicio: TLabel
      Left = 368
      Top = 18
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 64
      Width = 425
      Height = 2
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 211
      Top = 83
      Width = 150
      Height = 13
      Alignment = taRightJustify
      Caption = 'Replicar para o Exercício:'
    end
    object DBcboRateio: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 322
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
      LookupTable = cdsCriterio
      LookupField = 'IDCRITERIORATORC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = DBcboRateioCloseUp
    end
    object DBcboExercicioOri: TCMDBLookupCombo
      Left = 368
      Top = 32
      Width = 80
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'Exercício'#9'F')
      LookupTable = cdsExercicioOri
      LookupField = 'EXERCICIO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboExercicioFim: TCMDBLookupCombo
      Left = 368
      Top = 80
      Width = 80
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'Exercício'#9'F')
      LookupTable = cdsExercicioFim
      LookupField = 'EXERCICIO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 122
    Width = 472
    inherited tb97Fundo: TToolbar97
      Left = 300
      inherited sep1: TToolbarSep97
        Left = 166
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 83
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 2
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 85
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 563
    Top = 11
  end
  object cdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 24
    object cdsCriterioDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCriterioIDCRITERIORATORC: TFloatField
      FieldName = 'IDCRITERIORATORC'
      Visible = False
    end
  end
  object cdsExercicioFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 68
  end
  object sqlExercicioFim: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   EXERCICIO'
      'FROM'
      '   PERIODOORCAMEN PER'
      'WHERE'
      '   PER.IDPESSOA =:PIDEMPRESAPROP'
      'ORDER BY'
      '   EXERCICIO')
    ClientDataSet = cdsExercicioFim
    Left = 32
    Top = 56
  end
  object sqlExercicioOri: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CRI.EXERCICIO'
      'FROM'
      '   VALORCRIRATORC CRI,'
      '   PERIODOORCAMEN PER'
      'WHERE'
      '       CRI.IDCRITERIORATORC =:PIDCRITERIORATORC'
      '   AND CRI.IDPESSOA         =:PIDEMPRESAPROP'
      '   AND CRI.IDPESSOA         = PER.IDPESSOA'
      '   AND PER.EXERCICIO        = CRI.EXERCICIO'
      'ORDER BY'
      '   EXERCICIO')
    ClientDataSet = cdsExercicioOri
    Left = 112
    Top = 68
  end
  object cdsExercicioOri: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 56
    object cdsExercicioOriEXERCICIO: TFloatField
      FieldName = 'EXERCICIO'
    end
  end
  object sqlTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  IDCRITERIORATORC,'
      '  DESCRICAO'
      'FROM'
      '  CRITERIORATORC'
      'WHERE'
      '  TIPORATEIO = '#39'M'#39
      'ORDER BY'
      '  DESCRICAO')
    ClientDataSet = cdsCriterio
    Left = 288
    Top = 8
  end
  object cdsExistencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 24
  end
end
