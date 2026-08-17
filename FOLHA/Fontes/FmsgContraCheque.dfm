inherited FrmMsgContraCheque: TFrmMsgContraCheque
  Left = 102
  Top = 120
  HelpContext = 180060
  Caption = 'Mensagem Para Contra Cheque'
  ClientHeight = 426
  ClientWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 340
    object Label1: TLabel
      Left = 24
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 24
      Top = 75
      Width = 35
      Height = 13
      Caption = 'Regra'
    end
    object Label3: TLabel
      Left = 24
      Top = 132
      Width = 61
      Height = 13
      Caption = 'Mensagem'
    end
    object mmMensagem: TDBMemo
      Left = 24
      Top = 156
      Width = 601
      Height = 89
      DataField = 'MSG'
      DataSource = ds
      MaxLength = 200
      TabOrder = 0
    end
    object DBEDescricao: TDBEdit
      Left = 24
      Top = 44
      Width = 601
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object DBLKREGRA: TwwDBLookupCombo
      Left = 24
      Top = 100
      Width = 602
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'NOMEREGRA'#9'F'
        'IDREGRA'#9'10'#9'IDREGRA'#9'F')
      DataField = 'IDREGRA'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cboxsubmsg: TDBCheckBox
      Left = 40
      Top = 290
      Width = 129
      Height = 17
      Caption = 'Mensagem  Ativa'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBRTipoRegra: TDBRadioGroup
      Left = 218
      Top = 267
      Width = 105
      Height = 66
      Caption = 'Tipo de Regra'
      DataField = 'FLGTIPOREGRA'
      DataSource = ds
      Items.Strings = (
        'Numérica'
        'Booleana')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
    end
  end
  inherited Dock972: TDock97
    Width = 645
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 645
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT  * FROM  MSGCONTRACHEQUE'
      'WHERE'
      ' IDMSG  = :IDMSG')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMSG'
        ParamType = ptUnknown
      end>
    object qryIDMSG: TFloatField
      FieldName = 'IDMSG'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.IDMSG'
    end
    object qryMSG: TStringField
      FieldName = 'MSG'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.MSG'
      Size = 200
    end
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.IDREGRA'
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.DESCRICAO'
      Size = 30
    end
    object qryFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.FLGATIVO'
    end
    object qryFLGTIPOREGRA: TFloatField
      FieldName = 'FLGTIPOREGRA'
      Origin = 'BASEDADOS.MSGCONTRACHEQUE.IDMSG'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MSGCONTRACHEQUE'
      'set'
      '  IDMSG = :IDMSG,'
      '  MSG = :MSG,'
      '  IDREGRA = :IDREGRA,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGTIPOREGRA = :FLGTIPOREGRA'
      'where'
      '  IDMSG = :OLD_IDMSG')
    InsertSQL.Strings = (
      'insert into MSGCONTRACHEQUE'
      
        '  (IDMSG, MSG, IDREGRA, TRGDTINCLUSAO, TRGUSERINCLUSAO, DESCRICA' +
        'O, FLGATIVO, '
      '   FLGTIPOREGRA)'
      'values'
      
        '  (:IDMSG, :MSG, :IDREGRA, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :DE' +
        'SCRICAO, '
      '   :FLGATIVO, :FLGTIPOREGRA)')
    DeleteSQL.Strings = (
      'delete from MSGCONTRACHEQUE'
      'where'
      '  IDMSG = :OLD_IDMSG')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MSGCONTRACHEQUE.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descricão')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MSGCONTRACHEQUE')
    CamposChave.Strings = (
      'MSGCONTRACHEQUE.IDMSG'
      'MSGCONTRACHEQUE.DESCRICAO'
      'MSGCONTRACHEQUE.FLGATIVO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
  inherited ds: TwwDataSource
    AutoEdit = False
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  object qryRegra: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA,'
      '  R.NOMEREGRA'
      'FROM'
      '  REGRA R'
      'ORDER BY'
      '  R.NOMEREGRA')
    Left = 424
    Top = 39
  end
  object DsRegra: TDataSource
    DataSet = qryRegra
    Left = 360
    Top = 41
  end
end
