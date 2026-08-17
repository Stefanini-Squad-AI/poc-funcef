inherited frmCadAfastRAIS: TfrmCadAfastRAIS
  Left = 130
  Top = 191
  Width = 641
  BorderStyle = bsSizeable
  Caption = 'Situações de Afastamento (Padrão RAIS)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 633
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 625
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
        Top = 79
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 10
        Top = 45
        Width = 71
        Height = 21
        DataField = 'IDAFASTRAIS'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TwwDBEdit
        Left = 10
        Top = 96
        Width = 602
        Height = 73
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 625
      Height = 204
      Selected.Strings = (
        'IDAFASTRAIS'#9'8'#9'Código'
        'DESCRICAO'#9'200'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 633
  end
  inherited Dock971: TDock97
    Width = 633
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDAFASTRAIS,'
      '  DESCRICAO'
      'FROM'
      '  AFASTRAIS'
      'ORDER BY'
      ' IDAFASTRAIS')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update AFASTRAIS'
      'set'
      '  IDAFASTRAIS = :IDAFASTRAIS,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDAFASTRAIS = :OLD_IDAFASTRAIS')
    InsertSQL.Strings = (
      'insert into AFASTRAIS'
      '  (IDAFASTRAIS, DESCRICAO)'
      'values'
      '  (:IDAFASTRAIS, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from AFASTRAIS'
      'where'
      '  IDAFASTRAIS = :OLD_IDAFASTRAIS')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situações de Afastamento (Padrão RAIS)'
    Colunas.Strings = (
      'AFASTRAIS.IDAFASTRAIS'
      'AFASTRAIS.DESCRICAO')
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
      'AFASTRAIS')
    CamposChave.Strings = (
      'AFASTRAIS.IDAFASTRAIS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '200')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
