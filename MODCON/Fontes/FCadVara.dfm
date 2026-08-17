inherited frmCadVara: TfrmCadVara
  Caption = 'Tabela de Varas do Trabalho'
  ClientHeight = 287
  ClientWidth = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 467
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 459
      Height = 193
      object Label1: TLabel
        Left = 58
        Top = 44
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 58
        Top = 103
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 58
        Top = 59
        Width = 64
        Height = 21
        DataField = 'IDVARAJUSTICA'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 58
        Top = 118
        Width = 350
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 459
      Height = 193
      Selected.Strings = (
        'IDVARAJUSTICA'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 467
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 467
    inherited tb97Fundo: TToolbar97
      Left = 297
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 130
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDVARAJUSTICA, DESCRICAO'
      'FROM'
      '  VARAJUSTICA'
      'ORDER BY'
      '  IDVARAJUSTICA')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 348
    Top = 26
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update VARAJUSTICA'
      'set'
      '  IDVARAJUSTICA = :IDVARAJUSTICA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDVARAJUSTICA = :OLD_IDVARAJUSTICA')
    InsertSQL.Strings = (
      'insert into VARAJUSTICA'
      '  (IDVARAJUSTICA, DESCRICAO)'
      'values'
      '  (:IDVARAJUSTICA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from VARAJUSTICA'
      'where'
      '  IDVARAJUSTICA = :OLD_IDVARAJUSTICA')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Varas do Trabalho'
    Colunas.Strings = (
      'VARAJUSTICA.IDVARAJUSTICA'
      'VARAJUSTICA.DESCRICAO')
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
      'VARAJUSTICA')
    CamposChave.Strings = (
      'VARAJUSTICA.IDVARAJUSTICA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 419
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 348
    Top = 13
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 1
  end
end
