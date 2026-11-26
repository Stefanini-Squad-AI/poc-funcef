inherited frmAssocLayoutEntxsaida: TfrmAssocLayoutEntxsaida
  Left = 96
  Top = 150
  HelpContext = 180041
  Caption = 'Associação de Layout de Entrada e Layout de Saída'
  ClientHeight = 337
  ClientWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    Height = 251
    object lblDescricaoLayout: TLabel
      Left = 8
      Top = 8
      Width = 184
      Height = 13
      Caption = 'Descrição de Layout de Entrada'
    end
    object lblLayoutSaida: TLabel
      Left = 12
      Top = 96
      Width = 174
      Height = 13
      Caption = 'Descrição de Layout de Saída'
    end
    object lblNomeArq: TLabel
      Left = 12
      Top = 147
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 50
      Width = 612
      Height = 4
    end
    object edtNomeArq: TEdit
      Left = 12
      Top = 160
      Width = 335
      Height = 21
      TabOrder = 0
    end
    object dblkLayoutSaida: TwwDBLookupCombo
      Left = 12
      Top = 112
      Width = 337
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Layout de Saída'#9'F')
      DataField = 'IDLAYOUTSAIDA'
      DataSource = ds
      LookupTable = qryLayoutSaida
      LookupField = 'IDLAYOUTSAIDA'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object edtdescLayoutEntrada: TEdit
      Left = 10
      Top = 24
      Width = 335
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 630
  end
  inherited Dock971: TDock97
    Top = 298
    Width = 630
  end
  inherited qry: TwwQuery
    AfterPost = qryAfterPost
    AfterDelete = qryAfterDelete
    SQL.Strings = (
      'SELECT'
      '  L.IDLAYOUTENT,'
      '  L.IDLAYOUTSAIDA,'
      '  L.NOMEARQ,'
      '  LD.DESCRICAO AS DESCRENTRADA,'
      '  LDS.DESCRICAO AS DESCRSAIDA'
      ''
      'FROM'
      '  LAYOUTENTRXSAIDA L,'
      '  LAYOUTDESCONTO LD,'
      '  LAYOUTDESCONTOSAIDA LDS'
      ''
      'WHERE'
      '  L.IDLAYOUTENT   = :IDLAYOUTENT      AND'
      '  L.IDLAYOUTENT   = LD.IDLAYOUT       AND'
      '  L.IDLAYOUTSAIDA = LDS.IDLAYOUTSAIDA'
      ' '
      ' ')
    Left = 314
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENT'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTENTRXSAIDA'
      'set'
      '  IDLAYOUTENT = :IDLAYOUTENT,'
      '  IDLAYOUTSAIDA = :IDLAYOUTSAIDA,'
      '  NOMEARQ = :NOMEARQ'
      'where'
      '  IDLAYOUTENT = :OLD_IDLAYOUTENT')
    InsertSQL.Strings = (
      'insert into LAYOUTENTRXSAIDA'
      '  (IDLAYOUTENT, IDLAYOUTSAIDA, NOMEARQ)'
      'values'
      '  (:IDLAYOUTENT, :IDLAYOUTSAIDA, :NOMEARQ)')
    DeleteSQL.Strings = (
      'delete from LAYOUTENTRXSAIDA'
      'where'
      '  IDLAYOUTENT = :OLD_IDLAYOUTENT')
    Left = 379
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'L.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'LAYOUTDESCONTO L')
    CamposChave.Strings = (
      'L.IDLAYOUT')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    Left = 453
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 347
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 281
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 412
    Top = 6
  end
  object updEntradaxSaida: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTENTRXSAIDA'
      'set'
      '  IDLAYOUTENT = :IDLAYOUTENT,'
      '  IDLAYOUTSAIDA = :IDLAYOUTSAIDA,'
      '  NOMEARQ = :NOMEARQ'
      'where'
      '  IDLAYOUTENT = :OLD_IDLAYOUTENT')
    InsertSQL.Strings = (
      'insert into LAYOUTENTRXSAIDA'
      '  (IDLAYOUTENT, IDLAYOUTSAIDA, NOMEARQ)'
      'values'
      '  (:IDLAYOUTENT, :IDLAYOUTSAIDA, :NOMEARQ)')
    DeleteSQL.Strings = (
      'delete from LAYOUTENTRXSAIDA'
      'where'
      '  IDLAYOUTENT = :OLD_IDLAYOUTENT')
    Left = 560
    Top = 295
  end
  object qryLayoutSaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDLAYOUTSAIDA,'
      '  DESCRICAO'
      ''
      'FROM '
      '  LAYOUTDESCONTOSAIDA')
    ValidateWithMask = True
    Left = 501
    Top = 4
  end
  object qryLayout: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDLAYOUT,'
      '  DESCRICAO'
      ''
      'FROM'
      '  LAYOUTDESCONTO'
      ''
      'WHERE'
      '  IDLAYOUT = :IDLAYOUT'
      ' ')
    UpdateObject = updEntradaxSaida
    Left = 552
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
  end
end
