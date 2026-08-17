inherited FrmCadRegraxRubrica: TFrmCadRegraxRubrica
  Left = 202
  Top = 203
  HelpContext = 180026
  Caption = 'Associação de Rubricas Por Regra'
  ClientHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 275
    inherited pnlMestre: TPanel
      Height = 76
      object LblRegraFolha: TLabel
        Left = 14
        Top = 16
        Width = 94
        Height = 13
        Caption = 'Regras da Folha'
      end
      object dblkRegraFolha: TwwDBLookupCombo
        Left = 14
        Top = 34
        Width = 459
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra da Folha'#9'F')
        LookupTable = qry
        LookupField = 'IDREGRA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkRegraFolhaCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 81
      Height = 189
      inherited pgctrlDetalhe: TPageControl
        Height = 130
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Height = 102
            object LblRubricas: TLabel
              Left = 11
              Top = 29
              Width = 133
              Height = 13
              Caption = 'Rubricas Para Associar'
            end
            object EdtRubrica: TEdit
              Left = 11
              Top = 44
              Width = 326
              Height = 21
              TabOrder = 0
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Height = 102
            Selected.Strings = (
              'CODPROVDESC'#9'10'#9'Cód. Rubrica'
              'DESCRICAO'#9'40'#9'Descrição da Rubrica')
          end
        end
      end
      inherited Dock974: TDock97
        Height = 130
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 322
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA,'
      '  R.NOMEREGRA'
      ''
      'FROM'
      '  REGRA R,'
      '  TIPOREGRA TR,'
      '  GRUPOREGRA GR'
      ''
      'WHERE'
      '  R.IDTIPOREGRA   = TR.IDTIPOREGRA  AND'
      '  TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '  GR.IDGRUPOREGRA = :PIDGRUPOREGRA'
      ''
      'ORDER BY'
      '  UPPER(R.NOMEREGRA)'
      '')
    Left = 249
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPOREGRA'
        ParamType = ptUnknown
      end>
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Size = 60
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 385
    Top = 163
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 393
  end
  inherited upd: TUpdateSQL
    Left = 290
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Regra'
      'Nome da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA'
      'GRUPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'TIPOREGRA.IDTIPOREGRA'
      'GRUPOREGRA.IDGRUPOREGRA'
      'REGRA.NOMEREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA'
      'TIPOREGRA.IDGRUPOREGRA = GRUPOREGRA.IDGRUPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 371
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 330
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 57
    Top = 393
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 444
    Top = 3
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 442
    Top = 163
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RR.IDREGRA,'
      '  RR.IDRUBRICA,'
      '  P.CODPROVDESC,'
      '  P.DESCRICAO,'
      '  P.DESCRPROVDESC'
      ''
      'FROM'
      '  REGRAXRUBRICA RR,'
      '  PROVDESC P'
      '  '
      'WHERE RR.IDREGRA   = :PIDREGRA'
      '  AND RR.IDRUBRICA = P.IDPROVENTO'
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 341
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptUnknown
      end>
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO,'
      
        '  DECODE(PRM.FLGUSACODRUBEXT, 0, P.DESCRICAO, P.DESCRPROVDESC) A' +
        'S DESCRICAO'
      ''
      'FROM'
      '  PROVDESC P,'
      '  PARAMAPREV PRM'
      ''
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 197
    Top = 301
    object qryRubricasDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryRubricasIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.REGRAXRUBRICA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into CM.REGRAXRUBRICA'
      '  (IDREGRA, IDRUBRICA)'
      'values'
      '  (:IDREGRA, :IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from CM.REGRAXRUBRICA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 298
    Top = 163
  end
  object MS1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição Interna'
      'Código Externo'
      'Descrição Externa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC')
    Filtro.Strings = (
      'P.FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '15'
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 234
    Top = 169
  end
end
