inherited frmAcertaCusto: TfrmAcertaCusto
  Left = 156
  Top = 168
  ActiveControl = bbtnConfirmar
  Caption = 'Verificação e Acerto do Custo dos Processos'
  ClientHeight = 288
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 249
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 518
      Height = 83
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 19
        Top = 10
        Width = 480
        Height = 64
        Alignment = taCenter
        Caption = 
          'Atenção !  Este procedimento varre todos os processos cadastrado' +
          's no sistema e corrige seu custo caso alguma divergência seja en' +
          'contrada. Utilize-o apenas se e quando forem detectadas tais div' +
          'ergências, ou desejar efetivamente se assegurar de sua ausência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
    object rgHonor: TRadioGroup
      Left = 122
      Top = 97
      Width = 284
      Height = 42
      Caption = 'Inclui os Custos Advocatícios (Honorários) ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
    end
    object prgBar: TProgressBar
      Left = 122
      Top = 204
      Width = 284
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 2
      Visible = False
    end
    object rgDespe: TRadioGroup
      Left = 123
      Top = 148
      Width = 284
      Height = 42
      Caption = 'Inclui as Despesas e Depósitos Judiciais ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 249
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 81
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = tblProcesso
    Left = 24
    Top = 195
  end
  object tblProcesso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB'
    TableName = 'CM.PROCESSOTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 75
    Top = 195
    object tblProcessoNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Required = True
    end
    object tblProcessoCUSTOPROC: TFloatField
      FieldName = 'CUSTOPROC'
    end
    object tblProcessoFLGSITPROC: TFloatField
      FieldName = 'FLGSITPROC'
      Required = True
    end
    object tblProcessoDESPESAPROC: TFloatField
      FieldName = 'DESPESAPROC'
    end
  end
  object tblObjeto: TwwTable
    OnCalcFields = tblObjetoCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = ds
    TableName = 'CM.OBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 149
    Top = 193
    object tblObjetoVALORRECL: TFloatField
      DisplayLabel = 'Valor Reclamado'
      DisplayWidth = 16
      FieldName = 'VALORRECL'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoPERCPROB: TFloatField
      DisplayLabel = 'Probabilidade (%)'
      DisplayWidth = 17
      FieldName = 'PERCPROB'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoValorEsperado: TFloatField
      DisplayLabel = 'Valor Estimado'
      DisplayWidth = 12
      FieldName = 'ValorEsperado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object tblObjetoVALORSENTENCA: TFloatField
      DisplayLabel = 'Valor Real'
      FieldName = 'VALORSENTENCA'
      DisplayFormat = '0.00'
    end
    object tblObjetoNUMPROCTRAB: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPROCTRAB'
      Required = True
      Visible = False
    end
    object tblObjetoCODTIPOOBJETO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOOBJETO'
      Required = True
      Visible = False
    end
  end
  object tblHonor: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;DATAPAGTOHONOR;IDFORNSERV'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = ds
    TableName = 'CM.HONORARIOS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 231
    Top = 192
    object tblHonorVALORHONOR: TFloatField
      DisplayLabel = 'Valor do Honorário'
      DisplayWidth = 10
      FieldName = 'VALORHONOR'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblHonorNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Required = True
      Visible = False
    end
    object tblHonorIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Required = True
    end
  end
  object tblEtapa: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;DATAREALOCOR'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = ds
    TableName = 'CM.ETAPAPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 327
    Top = 192
    object tblEtapaNUMSEQ: TFloatField
      DisplayLabel = 'Num.Seq.'
      DisplayWidth = 7
      FieldName = 'NUMSEQ'
      Required = True
    end
    object tblEtapaDATAREALOCOR: TDateTimeField
      DisplayLabel = 'Data Prevista ou Real'
      DisplayWidth = 16
      FieldName = 'DATAREALOCOR'
    end
    object tblEtapaNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Required = True
      Visible = False
    end
    object tblEtapaVALORREC: TFloatField
      FieldName = 'VALORREC'
      Visible = False
    end
  end
end
