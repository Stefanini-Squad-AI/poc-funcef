inherited frmCadVara: TfrmCadVara
  Left = 177
  Top = 155
  HelpContext = 1100003
  Caption = 'Tabela das Varas de Justiça'
  ClientHeight = 287
  ClientWidth = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 509
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 501
      Height = 193
      object Label1: TLabel
        Left = 69
        Top = 52
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 69
        Top = 103
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 67
        Width = 64
        Height = 21
        DataField = 'IDVARAJUSTICA'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 69
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
      Width = 501
      Height = 193
      Selected.Strings = (
        'IDVARAJUSTICA'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 509
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 509
    inherited tb97Fundo: TToolbar97
      Left = 340
      DockPos = 391
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 174
      DockPos = 225
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '  IDVARAJUSTICA, DESCRICAO'
      'FROM'
      '   VARAJUSTICA'
      'ORDER BY'
      '  IDVARAJUSTICA')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 353
    Top = 14
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
    Caption = 'Seleciona Varas de Justiça'
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
    Left = 420
    Top = 13
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 353
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 420
    Top = 1
  end
end
