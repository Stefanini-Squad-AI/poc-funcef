inherited frmCadItemOpcInd: TfrmCadItemOpcInd
  Left = 346
  Top = 218
  HelpContext = 790072
  ClientHeight = 266
  ClientWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 393
    Height = 180
    inherited Bevel2: TBevel
      Width = 391
    end
    object lblDescItem: TLabel [1]
      Left = 24
      Top = 69
      Width = 104
      Height = 13
      Caption = 'Descrição do Item'
    end
    object lblRegra: TLabel [2]
      Left = 24
      Top = 118
      Width = 99
      Height = 13
      Caption = 'Regra de Cálculo'
    end
    inherited pnlTitulo: TPanel
      Width = 391
      inherited lbNomItem: TfcLabel
        Width = 261
        Caption = 'Itens de Opções de Índice'
      end
    end
    object dbeDescItem: TwwDBEdit
      Left = 24
      Top = 85
      Width = 321
      Height = 21
      DataField = 'DESITEMOPCIND'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblRegra: TwwDBLookupCombo
      Left = 24
      Top = 131
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra'#9'F')
      DataField = 'IDREGRA'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 393
  end
  inherited Dock971: TDock97
    Top = 227
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 221
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMOPCIND'
      'set'
      '  DESITEMOPCIND = :DESITEMOPCIND,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDITEMOPCIND = :OLD_IDITEMOPCIND')
    InsertSQL.Strings = (
      'insert into ITEMOPCIND'
      '  (IDITEMOPCIND, DESITEMOPCIND, IDREGRA)'
      'values'
      '  (:IDITEMOPCIND, :DESITEMOPCIND, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from ITEMOPCIND'
      'where'
      '  IDITEMOPCIND = :OLD_IDITEMOPCIND')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ITEMOPCIND.DESITEMOPCIND')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'ITEMOPCIND')
    CamposChave.Strings = (
      'ITEMOPCIND.IDITEMOPCIND')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDITEMOPCIND,DESITEMOPCIND,IDREGRA'
      'FROM'
      '   ITEMOPCIND'
      'WHERE'
      
        '   (((:IDITEMOPCIND IS NOT NULL) AND (IDITEMOPCIND = :IDITEMOPCI' +
        'ND)) OR (:IDITEMOPCIND IS NULL)) '
      'ORDER BY DESITEMOPCIND'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end>
    object qryIDITEMOPCIND: TFloatField
      FieldName = 'IDITEMOPCIND'
      Origin = 'BASEDADOS.ITEMOPCIND.IDITEMOPCIND'
    end
    object qryDESITEMOPCIND: TStringField
      FieldName = 'DESITEMOPCIND'
      Origin = 'BASEDADOS.ITEMOPCIND.DESITEMOPCIND'
      Size = 60
    end
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.ITEMOPCIND.IDREGRA'
    end
  end
  object qryRegra: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      GR.DESCRICAO = '#39'INVESTIMENTO'#39' AND'
      
        '      (((:IDTIPOREGRA IS NOT NULL) AND (TR.IDTIPOREGRA = :IDTIPO' +
        'REGRA)) OR'
      '        (:IDTIPOREGRA IS NULL))'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 266
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end>
    object qryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
end
