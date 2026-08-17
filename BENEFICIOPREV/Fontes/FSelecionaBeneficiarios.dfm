inherited frmSelecionaBeneficiarios: TfrmSelecionaBeneficiarios
  Left = 224
  Top = 131
  BorderIcons = []
  Caption = 'Selecione os Beneficiarios a serem cadastrados no beneficio  ...'
  ClientHeight = 332
  ClientWidth = 478
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 478
    Height = 293
    object Label1: TLabel
      Left = 5
      Top = 148
      Width = 468
      Height = 20
      Align = alBottom
      Alignment = taCenter
      Caption = 'Beneficiários não aprovados pela elegibilidade ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 5
      Width = 468
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Beneficiários aprovados pela elegibilidade ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object clbNaoAprovados: TCheckListBox
      Left = 5
      Top = 168
      Width = 468
      Height = 120
      Align = alBottom
      Color = clSilver
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
    object dbgrdBenefAprovados: TwwDBGrid
      Left = 5
      Top = 25
      Width = 468
      Height = 123
      Selected.Strings = (
        'FLGCONCEDE'#9'11'#9'Conceder'
        'NOME'#9'60'#9'Beneficiário')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsBenefAprovados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 478
    inherited tb97Fundo: TToolbar97
      Left = 263
      DockPos = 263
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
      DockPos = 95
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 475
    Top = 243
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME, D.DESCRICAO, DT.NUMSEQUENCIA,    DT.IDDEPENDENCIA' +
        ',DT.FLGCONTAIMPOSTOR,'
      
        '       DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO, BT.IDTITULAR, BT' +
        '.IDPESSJUR,'
      '       BT.IDPLANOPREV, BT.IDPESSOA,'
      
        '       BT.IDRESPONSAVEL, BT.IDBENEFICIO, BT.PRIORIDADE, BT.PERCE' +
        'NTUAL'
      'FROM   PESSOA P, DEPEN D, DEPENTIT DT, BFCIARIOTITPLAN BT'
      'WHERE   BT.IDTITULAR = :IDTITULAR'
      'AND    BT.IDPESSJUR = :IDPESSJUR'
      'AND    BT.IDPLANOPREV = :IDPLANOPREV'
      'AND    BT.IDBENEFICIO = :IDBENEFICIO'
      'AND    P.IDPESSOA = BT.IDPESSOA'
      'AND    DT.IDPESSOA = BT.IDPESSOA'
      'AND    DT.IDTITULAR = BT.IDTITULAR'
      'AND    D.IDDEPENDENCIA = DT.IDDEPENDENCIA'
      'AND    DT.DATACANCELA IS NULL'
      'ORDER BY P.NOME'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 60
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
    object qryBeneficiarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBeneficiarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DEPEN.DESCRICAO'
      Size = 15
    end
    object qryBeneficiarioNUMSEQUENCIA: TFloatField
      FieldName = 'NUMSEQUENCIA'
      Origin = 'DEPENTIT.NUMSEQUENCIA'
    end
    object qryBeneficiarioIDDEPENDENCIA: TStringField
      FieldName = 'IDDEPENDENCIA'
      Origin = 'DEPENTIT.IDDEPENDENCIA'
      Size = 3
    end
    object qryBeneficiarioFLGCONTAIMPOSTOR: TFloatField
      FieldName = 'FLGCONTAIMPOSTOR'
      Origin = 'DEPENTIT.FLGCONTAIMPOSTOR'
    end
    object qryBeneficiarioFLGCONTASALARIOF: TFloatField
      FieldName = 'FLGCONTASALARIOF'
      Origin = 'DEPENTIT.FLGCONTASALARIOF'
    end
    object qryBeneficiarioFLGBENEFICIARIO: TFloatField
      FieldName = 'FLGBENEFICIARIO'
      Origin = 'DEPENTIT.FLGBENEFICIARIO'
    end
    object qryBeneficiarioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BFCIARIOTITPLAN.IDTITULAR'
    end
    object qryBeneficiarioIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BFCIARIOTITPLAN.IDPESSJUR'
    end
    object qryBeneficiarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BFCIARIOTITPLAN.IDPLANOPREV'
    end
    object qryBeneficiarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BFCIARIOTITPLAN.IDPESSOA'
    end
    object qryBeneficiarioIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BFCIARIOTITPLAN.IDRESPONSAVEL'
    end
    object qryBeneficiarioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BFCIARIOTITPLAN.IDBENEFICIO'
    end
    object qryBeneficiarioPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
      Origin = 'BFCIARIOTITPLAN.PRIORIDADE'
    end
    object qryBeneficiarioPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BFCIARIOTITPLAN.PERCENTUAL'
    end
  end
  object dsBeneficiarios: TwwDataSource
    AutoEdit = False
    DataSet = qryBeneficiario
    Left = 60
    Top = 192
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Top = 312
  end
  object qryBenefAprovados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS FLGCONCEDE, IDPESSOA, NOME'
      'FROM   PESSOA'
      'WHERE  IDPESSOA = -1')
    UpdateObject = updAprovados
    ControlType.Strings = (
      'FLGCONCEDE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 320
    Top = 144
  end
  object updAprovados: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  FLGCONCEDE = :FLGCONCEDE,'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (FLGCONCEDE, IDPESSOA, NOME)'
      'values'
      '  (:FLGCONCEDE, :IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 232
    Top = 144
  end
  object dsBenefAprovados: TwwDataSource
    DataSet = qryBenefAprovados
    Left = 400
    Top = 136
  end
end
