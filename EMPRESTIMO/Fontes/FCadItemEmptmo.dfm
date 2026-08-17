inherited frmCadItemEmptmo: TfrmCadItemEmptmo
  Left = 415
  Top = 220
  HelpContext = 150063
  Caption = 'Itens de Empréstimo'
  ClientHeight = 266
  ClientWidth = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 474
    Height = 198
    inherited pnlControles: TPanel
      Width = 472
      Height = 196
      object Label1: TLabel
        Left = 24
        Top = 66
        Width = 104
        Height = 13
        Caption = 'Descrição do Item'
      end
      object DBedtDescricao: TDBEdit
        Left = 24
        Top = 80
        Width = 369
        Height = 21
        DataField = 'IteDescricao'
        DataSource = ds
        MaxLength = 30
        TabOrder = 0
      end
      object dbchkAbateNeg: TDBCheckBox
        Left = 26
        Top = 114
        Width = 387
        Height = 17
        Caption = 'Recebe abatimento de valores negativos no Envio'
        DataField = 'FLGABATENEGATIVO'
        DataSource = ds
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 472
      Height = 196
      Selected.Strings = (
        'IDITEMEMPTMO'#9'4'#9' '#9'F'
        'ITEDESCRICAO'#9'57'#9'Item de Empréstimo'#9'F')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      UseTFields = False
    end
  end
  inherited Dock972: TDock97
    Width = 474
    inherited Toolbar971: TToolbar97
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Width = 13
      end
    end
  end
  inherited Dock971: TDock97
    Top = 233
    Width = 474
    inherited tb97Fundo: TToolbar97
      Left = 302
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 130
    end
  end
  inherited ds: TwwDataSource
    Left = 368
    Top = 48
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMEMPTMO'
      'set'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  FLGABATENEGATIVO = :FLGABATENEGATIVO'
      'where'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO and'
      '  ITEDESCRICAO = :OLD_ITEDESCRICAO'
      ' ')
    InsertSQL.Strings = (
      'insert into ITEMEMPTMO'
      '  (IDITEMEMPTMO, ITEDESCRICAO, FLGABATENEGATIVO)'
      'values'
      '  (:IDITEMEMPTMO, :ITEDESCRICAO, :FLGABATENEGATIVO)')
    DeleteSQL.Strings = (
      'delete from ITEMEMPTMO'
      'where'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO and'
      '  ITEDESCRICAO = :OLD_ITEDESCRICAO')
    Left = 304
    Top = 48
  end
  inherited MontaSelect: TMontaSelect
    Left = 968
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 969
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 376
    Top = 0
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO, ITEDESCRICAO, FLGABATENEGATIVO'
      ''
      'FROM'
      '   ITEMEMPTMO'
      ''
      'ORDER BY'
      '   ITEDESCRICAO')
    Left = 336
    Top = 48
    object qryITEDESCRICAO: TStringField
      DisplayLabel = 'Item de Empréstimo'
      DisplayWidth = 60
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
    object qryFLGABATENEGATIVO: TFloatField
      FieldName = 'FLGABATENEGATIVO'
      Origin = 'BASEDADOS.ITEMEMPTMO.FLGABATENEGATIVO'
      Visible = False
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO, ITEDESCRICAO'
      ''
      'FROM'
      '   ITEMEMPTMO'
      ''
      'WHERE'
      '  ( LOWER(ITEDESCRICAO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 120
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaOcorrenciaRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO, ITEDESCRICAO'
      ''
      'FROM'
      '   ITEMEMPTMO'
      ''
      'WHERE'
      '  ( LOWER(ITEDESCRICAO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 120
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PROVDESC'
      '('
      'IDPROVENTO, FLGDESCONTO, DESCRICAO,'
      'FLGATRASODEVOL, FLGINTERNO, FLGESPECIAL, FLGTPRUBRICA'
      ')'
      'VALUES'
      '('
      ':PIDPROVENTO, :PFLGDESCONTO, :PDESCRICAO,'
      ':PFLGATRASODEVOL, 1, 0, '#39'BEP'#39
      ')')
    ValidateWithMask = True
    Left = 336
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGATRASODEVOL'
        ParamType = ptInput
      end>
  end
end
