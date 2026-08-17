inherited frmCadTRT: TfrmCadTRT
  Left = 201
  Top = 165
  Caption = 'Tabela de TRTs'
  ClientWidth = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 449
      Height = 204
      object Label1: TLabel
        Left = 53
        Top = 22
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 53
        Top = 73
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 53
        Top = 136
        Width = 41
        Height = 13
        Caption = 'Região'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 53
        Top = 37
        Width = 64
        Height = 21
        DataField = 'CODIGOTRT'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 53
        Top = 88
        Width = 350
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 53
        Top = 151
        Width = 61
        Height = 21
        DataField = 'REGIAOTRT'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 449
      Height = 204
      Selected.Strings = (
        'CODIGOTRT'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição'
        'REGIAOTRT'#9'10'#9'Região')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 457
  end
  inherited Dock971: TDock97
    Width = 457
    inherited tb97Fundo: TToolbar97
      Left = 287
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 120
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODIGOTRT, REGIAOTRT, DESCRICAO'
      'FROM'
      '  TRT'
      'ORDER BY'
      '  CODIGOTRT')
    Left = 271
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 343
    Top = 26
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TRT'
      'set'
      '  CODIGOTRT = :CODIGOTRT,'
      '  REGIAOTRT = :REGIAOTRT,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGOTRT = :OLD_CODIGOTRT')
    InsertSQL.Strings = (
      'insert into TRT'
      '  (CODIGOTRT, REGIAOTRT, DESCRICAO)'
      'values'
      '  (:CODIGOTRT, :REGIAOTRT, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TRT'
      'where'
      '  CODIGOTRT = :OLD_CODIGOTRT')
    Left = 243
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona TRTs'
    Colunas.Strings = (
      'TRT.CODIGOTRT'
      'TRT.DESCRICAO'
      'TRT.REGIAOTRT')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Região')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TRT')
    CamposChave.Strings = (
      'TRT.CODIGOTRT')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10')
    ExibePergunta = False
    Left = 409
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 299
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 343
    Top = 13
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 343
    Top = 1
  end
end
