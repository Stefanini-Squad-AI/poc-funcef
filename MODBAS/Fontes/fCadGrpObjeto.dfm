inherited frmCadGrpObjeto: TfrmCadGrpObjeto
  Left = 254
  Top = 164
  HelpContext = 1100007
  Caption = 'Cadastro de Grupos de Objeto Reclamado em Processos'
  ClientHeight = 287
  ClientWidth = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 452
      Height = 193
      object Label1: TLabel
        Left = 43
        Top = 55
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 43
        Top = 103
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 43
        Top = 67
        Width = 49
        Height = 21
        DataField = 'IDGRUPOOBJETO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 43
        Top = 118
        Width = 365
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 452
      Height = 193
      Selected.Strings = (
        'IDGRUPOOBJETO'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 460
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 290
      DockPos = 396
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 226
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '  IDGRUPOOBJETO, DESCRICAO, CLASSEOBJ'
      'FROM'
      '  GRPOBJPROCJUR'
      'WHERE'
      '  (CLASSEOBJ = '#39'1'#39')'
      'ORDER BY'
      '  IDGRUPOOBJETO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 416
    Top = 13
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRPOBJPROCJUR'
      'set'
      '  IDGRUPOOBJETO = :IDGRUPOOBJETO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CLASSEOBJ = :CLASSEOBJ'
      'where'
      '  IDGRUPOOBJETO = :OLD_IDGRUPOOBJETO')
    InsertSQL.Strings = (
      'insert into GRPOBJPROCJUR'
      '  (IDGRUPOOBJETO, DESCRICAO, CLASSEOBJ)'
      'values'
      '  (:IDGRUPOOBJETO, :DESCRICAO, :CLASSEOBJ)')
    DeleteSQL.Strings = (
      'delete from GRPOBJPROCJUR'
      'where'
      '  IDGRUPOOBJETO = :OLD_IDGRUPOOBJETO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos de Objeto Reclamado em Processos'
    Colunas.Strings = (
      'GRPOBJPROCJUR.IDGRUPOOBJETO'
      'GRPOBJPROCJUR.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRPOBJPROCJUR')
    CamposChave.Strings = (
      'GRPOBJPROCJUR.IDGRUPOOBJETO')
    Filtro.Strings = (
      'CLASSEOBJ = '#39'1'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 348
    Top = 13
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 416
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 1
  end
end
