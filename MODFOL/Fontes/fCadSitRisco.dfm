inherited frmCadSitRisco: TfrmCadSitRisco
  Left = 74
  Top = 193
  Width = 695
  Height = 345
  BorderStyle = bsSizeable
  Caption = 'Situações de Risco para FGTS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 687
    Height = 232
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 679
      Height = 224
      object Label1: TLabel
        Left = 17
        Top = 55
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 17
        Top = 123
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 17
        Top = 76
        Width = 84
        Height = 21
        DataField = 'IDSITRISCO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 17
        Top = 145
        Width = 643
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 679
      Height = 224
      Selected.Strings = (
        'IDSITRISCO'#9'10'#9'Código'
        'DESCRICAO'#9'80'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 687
  end
  inherited Dock971: TDock97
    Top = 279
    Width = 687
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDSITRISCO,'
      '  DESCRICAO'
      'FROM'
      '  SITRISCOFGTS'
      'ORDER BY'
      '  IDSITRISCO')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITRISCOFGTS'
      'set'
      '  IDSITRISCO = :IDSITRISCO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDSITRISCO = :OLD_IDSITRISCO')
    InsertSQL.Strings = (
      'insert into SITRISCOFGTS'
      '  (IDSITRISCO, DESCRICAO)'
      'values'
      '  (:IDSITRISCO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from SITRISCOFGTS'
      'where'
      '  IDSITRISCO = :OLD_IDSITRISCO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situações de Risco para FGTS'
    Colunas.Strings = (
      'SITRISCOFGTS.IDSITRISCO'
      'SITRISCOFGTS.DESCRICAO')
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
      'SITRISCOFGTS')
    CamposChave.Strings = (
      'SITRISCOFGTS.IDSITRISCO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
