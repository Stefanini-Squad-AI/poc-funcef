inherited frmCadCBO: TfrmCadCBO
  Left = 161
  Top = 193
  Width = 601
  BorderStyle = bsSizeable
  Caption = 'CBO - Código Brasileiro de Ocupações'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 593
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 585
      Height = 204
      object Label1: TLabel
        Left = 10
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 10
        Top = 93
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 10
        Top = 48
        Width = 84
        Height = 21
        DataField = 'IDCBO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 10
        Top = 115
        Width = 560
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 585
      Height = 204
      Selected.Strings = (
        'IDCBO'#9'10'#9'Código'
        'DESCRICAO'#9'80'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 593
  end
  inherited Dock971: TDock97
    Width = 593
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDCBO,'
      '  DESCRICAO'
      'FROM'
      '  CBO'
      'ORDER BY'
      '  IDCBO')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CBO'
      'set'
      '  IDCBO = :IDCBO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCBO = :OLD_IDCBO')
    InsertSQL.Strings = (
      'insert into CBO'
      '  (IDCBO, DESCRICAO)'
      'values'
      '  (:IDCBO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CBO'
      'where'
      '  IDCBO = :OLD_IDCBO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CBO'
    Colunas.Strings = (
      'CBO.IDCBO'
      'CBO.DESCRICAO')
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
      'CBO')
    CamposChave.Strings = (
      'CBO.IDCBO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
  end
end
