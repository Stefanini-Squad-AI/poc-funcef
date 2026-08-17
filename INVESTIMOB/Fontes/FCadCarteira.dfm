inherited frmCadCarteira: TfrmCadCarteira
  Left = 120
  Top = 147
  Caption = 'Cadastro de Carteiras de Investimento'
  ClientHeight = 251
  ClientWidth = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 405
    Height = 181
    inherited dbGrd: TwwDBGrid
      Width = 399
      Height = 175
    end
    inherited pnlControles: TPanel
      Width = 399
      Height = 175
      object Label2: TLabel
        Left = 16
        Top = 34
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label1: TLabel
        Left = 16
        Top = 90
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DBedtDescricao: TwwDBEdit
        Left = 16
        Top = 48
        Width = 361
        Height = 21
        DataField = 'DESCCARTINVEST'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBcboGestor: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        DataField = 'IDGESTORCARTEIRA'
        DataSource = ds
        LookupTable = qryLookGestor
        LookupField = 'IDGESTORCARTEIRA'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 405
    inherited Toolbar971: TToolbar97
      inherited btnTrazer: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 216
    Width = 405
    inherited tb97Fundo: TToolbar97
      Left = 225
      DockPos = 244
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 48
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA'
      'FROM'
      '   CARTEIRAINVEST'
      'ORDER BY'
      '   DESCCARTINVEST')
    Left = 112
    Top = 56
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDESCCARTINVEST: TStringField
      DisplayLabel = 'Nome da Carteira'
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65507
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARTEIRAINVEST'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  DESCCARTINVEST = :DESCCARTINVEST,'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    InsertSQL.Strings = (
      'insert into CARTEIRAINVEST'
      '  (IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA)'
      'values'
      '  (:IDCARTEIRAINVEST, :DESCCARTINVEST, :IDGESTORCARTEIRA)')
    DeleteSQL.Strings = (
      'delete from CARTEIRAINVEST'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    Left = 80
    Top = 56
  end
  inherited MontaSelect: TMontaSelect
    Left = 336
    Top = 56
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 144
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 350
    Top = 42
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM'
      '  CARTEIRAINVEST'
      'WHERE'
      '  ( LOWER(DESCCARTINVEST) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 232
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
    object qryVerificaOcorrenciaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object qryVerificaOcorrenciaDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
  end
  object qryLookGestor: TwwQuery
    Tag = 5
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   G.IDGESTORCARTEIRA, P.IDPESSOA, P.NOME'
      'FROM'
      '   GESTORCARTEIRA G, PESSOA P'
      'WHERE'
      '   ( G.IDGESTORCARTEIRA = P.IDPESSOA )'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 320
    Top = 148
    object qryLookGestorNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryLookGestorIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryLookGestorIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
end
