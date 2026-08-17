inherited frmCadLocalAtend: TfrmCadLocalAtend
  Left = 150
  Top = 164
  HelpContext = 190013
  Caption = 'Cadastro de Locais de Atendimento'
  ClientHeight = 266
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 180
    object Label1: TLabel
      Left = 75
      Top = 35
      Width = 124
      Height = 13
      Caption = 'Local de Atendimento'
    end
    object Label13: TLabel
      Left = 75
      Top = 84
      Width = 127
      Height = 13
      Caption = 'Forma de Atendimento'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 75
      Top = 50
      Width = 377
      Height = 21
      DataField = 'DESCLOCALATEND'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkFormaAtend: TwwDBLookupCombo
      Left = 75
      Top = 98
      Width = 294
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryFormaAtend
      LookupField = 'IDTIPOATEND'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 227
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDLOCALATEND, DESCLOCALATEND, IDTIPOATEND'
      'FROM LOCALATEND'
      'WHERE IDLOCALATEND = :IDLOCALATEND'
      'ORDER BY DESCLOCALATEND')
    Left = 330
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOCALATEND'
        ParamType = ptInput
      end>
    object qryIDLOCALATEND: TFloatField
      FieldName = 'IDLOCALATEND'
      Origin = 'BASEDADOS.LOCALATEND.IDLOCALATEND'
    end
    object qryDESCLOCALATEND: TStringField
      FieldName = 'DESCLOCALATEND'
      Origin = 'BASEDADOS.LOCALATEND.DESCLOCALATEND'
      Size = 60
    end
    object qryIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.LOCALATEND.IDTIPOATEND'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LOCALATEND'
      'set'
      '  IDLOCALATEND = :IDLOCALATEND,'
      '  DESCLOCALATEND = :DESCLOCALATEND,'
      '  IDTIPOATEND = :IDTIPOATEND'
      'where'
      '  IDLOCALATEND = :OLD_IDLOCALATEND')
    InsertSQL.Strings = (
      'insert into LOCALATEND'
      '  (IDLOCALATEND, DESCLOCALATEND, IDTIPOATEND)'
      'values'
      '  (:IDLOCALATEND, :DESCLOCALATEND, :IDTIPOATEND)')
    DeleteSQL.Strings = (
      'delete from LOCALATEND'
      'where'
      '  IDLOCALATEND = :OLD_IDLOCALATEND')
    Left = 411
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LOCALATEND.DESCLOCALATEND'
      'TIPOATEND.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Local de Atendimento'
      'Forma de Atendimento')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALATEND'
      'TIPOATEND')
    CamposChave.Strings = (
      'LOCALATEND.IDLOCALATEND'
      'LOCALATEND.DESCLOCALATEND'
      'LOCALATEND.IDTIPOATEND'
      'TIPOATEND.NOME')
    Filtro.Strings = (
      'LOCALATEND.IDTIPOATEND = TIPOATEND.IDTIPOATEND(+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '45'
      '45')
    Left = 493
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 371
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 452
    Top = 14
  end
  object qryFormaAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 384
    Top = 144
    object qryFormaAtendNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOATEND.NOME'
      Size = 60
    end
    object qryFormaAtendIDTIPOATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.TIPOATEND.IDTIPOATEND'
      Visible = False
    end
    object qryFormaAtendFLGEMITERUBS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGEMITERUBS'
      Origin = 'BASEDADOS.TIPOATEND.FLGEMITERUBS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
