inherited frmCadCpuAtend: TfrmCadCpuAtend
  Left = 146
  Top = 154
  HelpContext = 190042
  Caption = 'Cadastro de CPU de Atendimentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 56
      Top = 39
      Width = 118
      Height = 13
      Caption = 'CPU de Atendimento'
    end
    object Label2: TLabel
      Left = 56
      Top = 102
      Width = 124
      Height = 13
      Caption = 'Local de Atendimento'
    end
    object DblkLocalAtend: TwwDBLookupCombo
      Left = 56
      Top = 117
      Width = 449
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCLOCALATEND'#9'40'#9'Local de Atendimento'#9'F')
      LookupTable = qryLocalAtend
      LookupField = 'IDLOCALATEND'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeCPU: TwwDBEdit
      Left = 56
      Top = 54
      Width = 449
      Height = 21
      DataField = 'DESCCPUATEND'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforeDelete = qryBeforeDelete
    AfterDelete = qryAfterDelete
    SQL.Strings = (
      'SELECT'
      '  IDCPUATEND, DESCCPUATEND'
      'FROM CPUATEND'
      'where '
      'IDCPUATEND = :IDCPUATEND'
      'ORDER BY DESCCPUATEND')
    Left = 338
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCPUATEND'
        ParamType = ptInput
      end>
    object qryIDCPUATEND: TFloatField
      FieldName = 'IDCPUATEND'
      Origin = 'BASEDADOS.CPUATEND.IDCPUATEND'
    end
    object qryDESCCPUATEND: TStringField
      FieldName = 'DESCCPUATEND'
      Origin = 'BASEDADOS.CPUATEND.DESCCPUATEND'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CPUATEND'
      'set'
      '  IDCPUATEND = :IDCPUATEND,'
      '  DESCCPUATEND = :DESCCPUATEND'
      'where'
      '  IDCPUATEND = :OLD_IDCPUATEND')
    InsertSQL.Strings = (
      'insert into CPUATEND'
      '  (IDCPUATEND, DESCCPUATEND)'
      'values'
      '  (:IDCPUATEND, :DESCCPUATEND)')
    DeleteSQL.Strings = (
      'delete from CPUATEND'
      'where'
      '  IDCPUATEND = :OLD_IDCPUATEND')
    Left = 419
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Caption = ' Seleciona CPU de Atendimento'
    Colunas.Strings = (
      'CPUATEND.DESCCPUATEND'
      'LOCALATEND.DESCLOCALATEND'
      'TIPOATEND.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPU de Atendimento'
      'Local de Atendimento'
      'Forma de Atendimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALATENDXCPU'
      'CPUATEND'
      'LOCALATEND'
      'TIPOATEND')
    CamposChave.Strings = (
      'LOCALATENDXCPU.IDLOCALATENDXCPU'
      'LOCALATENDXCPU.IDCPUATEND'
      'LOCALATENDXCPU.IDLOCALATEND'
      'CPUATEND.DESCCPUATEND'
      'LOCALATEND.DESCLOCALATEND'
      'LOCALATEND.IDLOCALATEND AS IDLOCAL'
      'TIPOATEND.NOME AS NOMETIPOATEND')
    Filtro.Strings = (
      'LOCALATENDXCPU.IDCPUATEND = CPUATEND.IDCPUATEND'
      'LOCALATENDXCPU.IDLOCALATEND(+) = LOCALATEND.IDLOCALATEND'
      'LOCALATEND.IDTIPOATEND =TIPOATEND .IDTIPOATEND(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '35'
      '35')
    ExibePergunta = False
    Left = 501
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 379
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 460
    Top = 14
  end
  object qryLocalAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDLOCALATEND, DESCLOCALATEND, IDTIPOATEND'
      'FROM'
      ' LOCALATEND'
      'ORDER BY'
      ' DESCLOCALATEND')
    ValidateWithMask = True
    Left = 496
    Top = 159
    object qryLocalAtendDESCLOCALATEND: TStringField
      DisplayLabel = 'Local de Atendimento'
      DisplayWidth = 40
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
    object qryLocalAtendIDTIPOATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.LOCALATEND.IDTIPOATEND'
      Visible = False
    end
  end
  object qryLocalAtendXcpu: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  X.IDLOCALATENDXCPU, '
      '  X.IDCPUATEND, '
      '  X.IDLOCALATEND'
      'FROM'
      '  LOCALATENDXCPU X, CPUATEND C, LOCALATEND L, TIPOATEND T'
      'WHERE'
      '  (X.IDCPUATEND = C.IDCPUATEND(+)) AND'
      '  (X.IDLOCALATEND(+) = L.IDLOCALATEND) AND'
      '  (L.IDTIPOATEND =T.IDTIPOATEND(+))'
      'ORDER BY'
      '  L.DESCLOCALATEND,'
      '  C.DESCCPUATEND')
    UpdateObject = UPDLocalAtendXCPU
    ValidateWithMask = True
    Left = 64
    Top = 207
    object qryLocalAtendXcpuIDLOCALATENDXCPU: TFloatField
      FieldName = 'IDLOCALATENDXCPU'
    end
    object qryLocalAtendXcpuIDCPUATEND: TFloatField
      FieldName = 'IDCPUATEND'
    end
    object qryLocalAtendXcpuIDLOCALATEND: TFloatField
      FieldName = 'IDLOCALATEND'
    end
  end
  object UPDLocalAtendXCPU: TUpdateSQL
    ModifySQL.Strings = (
      'update LOCALATENDXCPU'
      'set'
      '  IDLOCALATENDXCPU = :IDLOCALATENDXCPU,'
      '  IDCPUATEND = :IDCPUATEND,'
      '  IDLOCALATEND = :IDLOCALATEND'
      'where'
      '  IDLOCALATENDXCPU = :OLD_IDLOCALATENDXCPU')
    InsertSQL.Strings = (
      'insert into LOCALATENDXCPU'
      '  (IDLOCALATENDXCPU, IDCPUATEND, IDLOCALATEND)'
      'values'
      '  (:IDLOCALATENDXCPU, :IDCPUATEND, :IDLOCALATEND)')
    DeleteSQL.Strings = (
      'delete from LOCALATENDXCPU'
      'where'
      '  IDLOCALATENDXCPU = :OLD_IDLOCALATENDXCPU')
    Left = 184
    Top = 207
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DESCCPUATEND'
      'FROM CPUATEND'
      'WHERE UPPER(DESCCPUATEND) = :CPU'
      '')
    ValidateWithMask = True
    Left = 320
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'CPU'
        ParamType = ptInput
      end>
  end
end
