inherited frmCadTipCurso: TfrmCadTipCurso
  Left = 393
  Top = 176
  Caption = 'Cadastro de Tipos de Curso'
  ClientHeight = 287
  ClientWidth = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 365
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 357
      Height = 193
      object Label1: TLabel
        Left = 61
        Top = 45
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 61
        Top = 108
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 61
        Top = 60
        Width = 64
        Height = 21
        DataField = 'IDTIPOCURSO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 61
        Top = 123
        Width = 241
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 357
      Height = 193
      Selected.Strings = (
        'IDTIPOCURSO'#9'10'#9'Código'
        'DESCRICAO'#9'30'#9'Descrição'#9'F')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 365
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 365
    inherited tb97Fundo: TToolbar97
      Left = 195
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 28
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCURSO, DESCRICAO'
      'FROM'
      '  TIPCURSO'
      'ORDER BY'
      '  IDTIPOCURSO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 312
    Top = 126
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPCURSO'
      'set'
      '  IDTIPOCURSO = :IDTIPOCURSO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOCURSO = :OLD_IDTIPOCURSO')
    InsertSQL.Strings = (
      'insert into TIPCURSO'
      '  (IDTIPOCURSO, DESCRICAO)'
      'values'
      '  (:IDTIPOCURSO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPCURSO'
      'where'
      '  IDTIPOCURSO = :OLD_IDTIPOCURSO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Curso'
    Colunas.Strings = (
      'TIPCURSO.IDTIPOCURSO'
      'TIPCURSO.DESCRICAO')
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
      'TIPCURSO')
    CamposChave.Strings = (
      'TIPCURSO.IDTIPOCURSO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 308
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 312
    Top = 113
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 308
  end
end
