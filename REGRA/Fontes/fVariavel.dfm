inherited frmVariavel: TfrmVariavel
  Left = 163
  Top = 148
  HelpContext = 450013
  Caption = 'Cadastro de Variaveis'
  ClientHeight = 238
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    Height = 152
    inherited dbGrd: TwwDBGrid [0]
      Width = 490
      Height = 142
      Selected.Strings = (
        'IDCAMPO'#9'12'#9'Código'
        'DESCRICAODOCAMPO'#9'52'#9'Descrição da Variavel'#9'F')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
    inherited pnlControles: TPanel [1]
      Width = 490
      Height = 142
      object Label3: TLabel
        Left = 12
        Top = 73
        Width = 126
        Height = 13
        Caption = 'Descrição da Variável'
      end
      object Label1: TLabel
        Left = 12
        Top = 23
        Width = 167
        Height = 13
        Caption = 'Código Resumido da Variável'
      end
      object dbedIdCmp: TwwDBEdit
        Left = 12
        Top = 38
        Width = 197
        Height = 21
        CharCase = ecUpperCase
        DataField = 'IDCAMPO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDescCmp: TwwDBEdit
        Left = 12
        Top = 88
        Width = 467
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAODOCAMPO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 500
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      
        '   IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANC' +
        'O,'
      '   CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO'
      'FROM'
      '   CMPBD'
      'WHERE'
      '   CAMPODOBANCO = 0 '
      'ORDER BY IDCAMPO')
    Left = 250
    Top = 63
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 184
    Top = 63
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CMPBD'
      'set'
      '  IDCAMPO = :IDCAMPO,'
      '  ENTIDADE = :ENTIDADE,'
      '  NOMEDOCAMPO = :NOMEDOCAMPO,'
      '  DESCRICAODOCAMPO = :DESCRICAODOCAMPO,'
      '  CAMPODOBANCO = :CAMPODOBANCO,'
      '  CHAVE = :CHAVE,'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO,'
      '  APELIDO = :APELIDO,'
      '  IDTIPODADO = :IDTIPODADO'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into CMPBD'
      
        '  (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANC' +
        'O, CHAVE, '
      '   FLGOBRIGATORIO, APELIDO, IDTIPODADO)'
      'values'
      
        '  (:IDCAMPO, :ENTIDADE, :NOMEDOCAMPO, :DESCRICAODOCAMPO, :CAMPOD' +
        'OBANCO, '
      '   :CHAVE, :FLGOBRIGATORIO, :APELIDO, :IDTIPODADO)')
    DeleteSQL.Strings = (
      'delete from CMPBD'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
    Left = 315
    Top = 63
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Campo'
      'Descrição do Campo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO')
    Filtro.Strings = (
      'CAMPODOBANCO = 0 ')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '60')
    Left = 349
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 283
    Top = 63
  end
  inherited ImlPadrao: TImageList
    Left = 217
    Top = 63
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 382
    Top = 63
  end
end
