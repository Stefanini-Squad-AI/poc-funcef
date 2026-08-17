inherited frmCadVincEmpr: TfrmCadVincEmpr
  Left = 116
  Top = 190
  Width = 641
  BorderStyle = bsSizeable
  Caption = 'Vínculo Empregatício (Padrão RAIS)'
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
        Top = 88
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 10
        Top = 45
        Width = 71
        Height = 21
        DataField = 'IDVINCEMPREG'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TwwDBEdit
        Left = 10
        Top = 105
        Width = 602
        Height = 40
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
        'IDVINCEMPREG'#9'8'#9'Código'
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
      '  IDVINCEMPREG,'
      '  DESCRICAO'
      'FROM'
      '  VINCEMPREGRAIS'
      'ORDER BY'
      ' IDVINCEMPREG')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update VINCEMPREGRAIS'
      'set'
      '  IDVINCEMPREG = :IDVINCEMPREG,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDVINCEMPREG = :OLD_IDVINCEMPREG')
    InsertSQL.Strings = (
      'insert into VINCEMPREGRAIS'
      '  (IDVINCEMPREG, DESCRICAO)'
      'values'
      '  (:IDVINCEMPREG, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from VINCEMPREGRAIS'
      'where'
      '  IDVINCEMPREG = :OLD_IDVINCEMPREG')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Vínculo Empregatício (Padrão RAIS)'
    Colunas.Strings = (
      'VINCEMPREGRAIS.IDVINCEMPREG'
      'VINCEMPREGRAIS.DESCRICAO')
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
      'VINCEMPREGRAIS')
    CamposChave.Strings = (
      'VINCEMPREGRAIS.IDVINCEMPREG')
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
