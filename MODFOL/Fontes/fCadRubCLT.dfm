inherited frmCadRubCLT: TfrmCadRubCLT
  Left = 281
  Top = 154
  Width = 369
  Height = 365
  BorderStyle = bsSizeable
  Caption = 'Rubricas Padrão CLT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 361
    Height = 252
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 353
      Height = 244
      object Label1: TLabel
        Left = 13
        Top = 63
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 13
        Top = 121
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 13
        Top = 80
        Width = 68
        Height = 21
        DataField = 'CODRUBCLT'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 13
        Top = 138
        Width = 324
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 353
      Height = 244
      Selected.Strings = (
        'CODRUBCLT'#9'5'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 361
  end
  inherited Dock971: TDock97
    Top = 299
    Width = 361
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODRUBCLT,'
      '  DESCRICAO'
      'FROM'
      '  RUBRICACLT'
      'ORDER BY'
      '  CODRUBCLT')
    Left = 298
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICACLT'
      'set'
      '  CODRUBCLT = :CODRUBCLT,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODRUBCLT = :OLD_CODRUBCLT')
    InsertSQL.Strings = (
      'insert into RUBRICACLT'
      '  (CODRUBCLT, DESCRICAO)'
      'values'
      '  (:CODRUBCLT, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from RUBRICACLT'
      'where'
      '  CODRUBCLT = :OLD_CODRUBCLT')
    Left = 268
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubricas Padrão CLT'
    Colunas.Strings = (
      'RUBRICACLT.CODRUBCLT'
      'RUBRICACLT.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICACLT')
    CamposChave.Strings = (
      'RUBRICACLT.CODRUBCLT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '5'
      '40')
    Left = 301
    Top = 64
  end
  inherited ds: TwwDataSource
    Left = 328
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
