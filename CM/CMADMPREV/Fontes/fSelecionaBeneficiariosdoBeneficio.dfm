inherited frmSelecionaBeneficiariosdoBeneficio: TfrmSelecionaBeneficiariosdoBeneficio
  Left = 363
  Top = 118
  BorderIcons = []
  Caption = 'Selecione os Beneficiarios a serem cadastrados no beneficio '
  ClientHeight = 319
  ClientWidth = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 561
    Height = 280
    object Label1: TLabel
      Left = 1
      Top = 144
      Width = 559
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
      Left = 1
      Top = 1
      Width = 559
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
    object clbBeneficiarios: TCheckListBox
      Left = 1
      Top = 21
      Width = 559
      Height = 123
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
    object clbNaoAprovados: TCheckListBox
      Left = 1
      Top = 164
      Width = 559
      Height = 115
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
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 280
    Width = 561
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 264
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
      DockPos = 95
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
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
      'SELECT P.NOME, D.DESCRICAO,'
      '       DT.NUMSEQUENCIA, DT.IDDEPENDENCIA,DT.FLGCONTAIMPOSTOR,'
      '       DT.FLGCONTASALARIOF,DT.FLGBENEFICIARIO,'
      '       BT.IDTITULAR, BT.IDPESSJUR,BT.IDPLANOPREV, BT.IDPESSOA,'
      
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
      ' '
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 236
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
  object wwDtsBeneficiarios: TwwDataSource
    DataSet = qryBeneficiario
    Left = 43
    Top = 233
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Top = 240
  end
end
