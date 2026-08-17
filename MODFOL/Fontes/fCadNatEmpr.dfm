inherited frmCadNatEmpr: TfrmCadNatEmpr
  Left = 175
  Top = 178
  Width = 575
  BorderStyle = bsSizeable
  Caption = 'Natureza Empresarial (Padrão RAIS)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 559
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
        DataField = 'IDNATEMPRE'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 10
        Top = 117
        Width = 535
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 559
      Height = 204
      Selected.Strings = (
        'IDNATEMPRE'#9'8'#9'Código'
        'DESCRICAO'#9'120'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 567
  end
  inherited Dock971: TDock97
    Width = 567
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDNATEMPRE,'
      '  DESCRICAO'
      'FROM'
      '  NATEMPRESA'
      'ORDER BY'
      ' IDNATEMPRE')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update NATEMPRESA'
      'set'
      '  IDNATEMPRE = :IDNATEMPRE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDNATEMPRE = :OLD_IDNATEMPRE')
    InsertSQL.Strings = (
      'insert into NATEMPRESA'
      '  (IDNATEMPRE, DESCRICAO)'
      'values'
      '  (:IDNATEMPRE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from NATEMPRESA'
      'where'
      '  IDNATEMPRE = :OLD_IDNATEMPRE')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Natureza Empresarial (Padrão RAIS)'
    Colunas.Strings = (
      'NATEMPRESA.IDNATEMPRE'
      'NATEMPRESA.DESCRICAO')
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
      'NATEMPRESA')
    CamposChave.Strings = (
      'NATEMPRESA.IDNATEMPRE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '120')
  end
end
