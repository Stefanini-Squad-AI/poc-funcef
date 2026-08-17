inherited frmCadTipRec: TfrmCadTipRec
  Left = 223
  Top = 170
  Caption = 'Tipos de Etapa (Andamento) em Processos'
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 412
      Height = 204
      object Label1: TLabel
        Left = 47
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 47
        Top = 80
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 47
        Top = 134
        Width = 100
        Height = 13
        Caption = 'Honorário Padrão'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 47
        Top = 47
        Width = 64
        Height = 21
        DataField = 'CODTIPORECURSO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 47
        Top = 95
        Width = 322
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 47
        Top = 149
        Width = 100
        Height = 21
        DataField = 'VALORHONOR'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 412
      Height = 204
      Selected.Strings = (
        'CODTIPORECURSO'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Decrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 420
  end
  inherited Dock971: TDock97
    Width = 420
    inherited tb97Fundo: TToolbar97
      Left = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPORECURSO, DESCRICAO, VALORHONOR'
      'FROM'
      '  TIPORECTRAB'
      'ORDER BY'
      '  CODTIPORECURSO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 152
    Top = 70
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORECTRAB'
      'set'
      '  CODTIPORECURSO = :CODTIPORECURSO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALORHONOR = :VALORHONOR'
      'where'
      '  CODTIPORECURSO = :OLD_CODTIPORECURSO')
    InsertSQL.Strings = (
      'insert into TIPORECTRAB'
      '  (CODTIPORECURSO, DESCRICAO, VALORHONOR)'
      'values'
      '  (:CODTIPORECURSO, :DESCRICAO, :VALORHONOR)')
    DeleteSQL.Strings = (
      'delete from TIPORECTRAB'
      'where'
      '  CODTIPORECURSO = :OLD_CODTIPORECURSO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Etapa (Andamento)'
    Colunas.Strings = (
      'TIPORECTRAB.CODTIPORECURSO'
      'TIPORECTRAB.DESCRICAO')
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
      'TIPORECTRAB')
    CamposChave.Strings = (
      'TIPORECTRAB.CODTIPORECURSO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 228
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 152
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
end
