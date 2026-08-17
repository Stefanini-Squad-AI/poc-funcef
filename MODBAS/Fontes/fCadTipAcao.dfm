inherited frmCadTipAcao: TfrmCadTipAcao
  Left = 194
  Top = 194
  HelpContext = 1100005
  Caption = 'Cadastro de Tipos de Ação em Processos'
  ClientHeight = 287
  ClientWidth = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 573
      Height = 193
      object Label1: TLabel
        Left = 61
        Top = 52
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 61
        Top = 103
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 61
        Top = 67
        Width = 49
        Height = 21
        DataField = 'IDTIPOACAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 61
        Top = 118
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
      Width = 573
      Height = 193
      Selected.Strings = (
        'IDTIPOACAO'#9'10'#9'Código'
        'DESCRICAO'#9'70'#9'Descrição'#9'F')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 581
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 411
      DockPos = 425
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 244
      DockPos = 255
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '  IDTIPOACAO, DESCRICAO'
      'FROM'
      '  TIPOACAOPROCJUR'
      'ORDER BY'
      '  IDTIPOACAO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 376
    Top = 14
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
    Left = 485
    Top = 13
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 376
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 485
    Top = 1
  end
end
