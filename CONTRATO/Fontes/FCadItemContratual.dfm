inherited frmCadItemContratual: TfrmCadItemContratual
  Left = 41
  Top = 239
  HelpContext = 120006
  Caption = 'Cadastro de Ítem Contratual'
  ClientHeight = 287
  ClientWidth = 689
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 689
    Height = 201
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Nome do Item'
    end
    object dbrdgrpTipoCobranca: TDBRadioGroup
      Left = 352
      Top = 16
      Width = 321
      Height = 169
      Caption = ' Tipo de Cobrança '
      DataField = 'TIPOCOBRANCA'
      DataSource = ds
      Items.Strings = (
        'Periódica sem medição de quantidade'
        'Periódica com medição de quantidade'
        'Periódica com medição de valor'
        'Eventual por apontamento de quantidade'
        'Eventual por apontamento de valor'
        'Ligado a atividade sem medição'
        'Ligado a atividade com medição de Quantidade'
        'Ligado a atividade com medição de Valor')
      TabOrder = 0
      Values.Strings = (
        'PS'
        'PQ'
        'PV'
        'EQ'
        'EV'
        'AS'
        'AQ'
        'AV')
    end
    object memItem: TDBMemo
      Left = 16
      Top = 32
      Width = 329
      Height = 153
      DataField = 'NOME_ITEM'
      DataSource = ds
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 689
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 689
    inherited tb97Fundo: TToolbar97
      Left = 517
      DockPos = 520
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 348
      DockPos = 351
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 104
    Top = 30
  end
  inherited ds: TwwDataSource
    Left = 309
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMCONTRATUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME_ITEM = :NOME_ITEM,'
      '  TIPOCOBRANCA = :TIPOCOBRANCA'
      'where'
      '  IDITEM = :OLD_IDITEM')
    InsertSQL.Strings = (
      'insert into ITEMCONTRATUAL'
      '  (IDITEM,IDPESSOA, NOME_ITEM, TIPOCOBRANCA)'
      'values'
      '  (:IDITEM,:IDPESSOA, :NOME_ITEM, :TIPOCOBRANCA)')
    DeleteSQL.Strings = (
      'delete from ITEMCONTRATUAL'
      'where'
      '  IDITEM = :OLD_IDITEM')
    Left = 249
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'I.NOME_ITEM'
      'I.TIPOCOBRANCA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Ítem Contratual'
      'Tipo de Cobrança')
    Tabelas.Strings = (
      'ITEMCONTRATUAL I')
    CamposChave.Strings = (
      'I.IDITEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '2')
    Left = 205
  end
  inherited ImlPadrao: TImageList
    Left = 145
    Top = 30
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      'IDITEM,'
      'IDPESSOA,'
      'NOME_ITEM,'
      'TIPOCOBRANCA'
      'FROM'
      'ITEMCONTRATUAL'
      'WHERE'
      '(IDITEM = :IDITEM)')
    Left = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryIDITEM: TFloatField
      FieldName = 'IDITEM'
      Origin = 'ITEMCONTRATUAL.IDITEM'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ITEMCONTRATUAL.IDPESSOA'
    end
    object qryNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Origin = 'ITEMCONTRATUAL.NOME_ITEM'
      Size = 200
    end
    object qryTIPOCOBRANCA: TStringField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'ITEMCONTRATUAL.TIPOCOBRANCA'
      Size = 2
    end
  end
end
