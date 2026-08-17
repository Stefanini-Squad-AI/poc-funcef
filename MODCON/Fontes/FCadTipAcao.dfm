inherited frmCadTipAcao: TfrmCadTipAcao
  Left = 220
  Top = 163
  Caption = 'Tipos de Ação em Processos'
  ClientWidth = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 511
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 503
      Height = 204
      object Label1: TLabel
        Left = 26
        Top = 36
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 26
        Top = 119
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 26
        Top = 51
        Width = 49
        Height = 21
        DataField = 'IDTIPOACAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 26
        Top = 134
        Width = 452
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 503
      Height = 204
      Selected.Strings = (
        'IDTIPOACAO'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 511
  end
  inherited Dock971: TDock97
    Width = 511
    inherited tb97Fundo: TToolbar97
      Left = 341
      DockPos = 349
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 174
      DockPos = 182
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOACAO, DESCRICAO'
      'FROM'
      '  TIPOACAOPROCJUR'
      'ORDER BY'
      '  IDTIPOACAO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 364
    Top = 28
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOACAOPROCJUR'
      'set'
      '  IDTIPOACAO = :IDTIPOACAO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOACAO = :OLD_IDTIPOACAO')
    InsertSQL.Strings = (
      'insert into TIPOACAOPROCJUR'
      '  (IDTIPOACAO, DESCRICAO)'
      'values'
      '  (:IDTIPOACAO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOACAOPROCJUR'
      'where'
      '  IDTIPOACAO = :OLD_IDTIPOACAO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Ação em Processos'
    Colunas.Strings = (
      'TIPOACAOPROCJUR.IDTIPOACAO'
      'TIPOACAOPROCJUR.DESCRICAO')
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
      'TIPOACAOPROCJUR')
    CamposChave.Strings = (
      'TIPOACAOPROCJUR.IDTIPOACAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 453
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 364
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 364
    Top = 1
  end
end
