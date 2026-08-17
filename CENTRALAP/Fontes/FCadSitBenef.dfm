inherited FrmCadSitBenef: TFrmCadSitBenef
  Left = 106
  Top = 160
  HelpContext = 190023
  Caption = 'Cadastro de Situações do Benefiício na RUB'
  ClientHeight = 234
  ClientWidth = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 531
    Height = 148
    inherited pnlControles: TPanel
      Width = 521
      Height = 138
      object Label2: TLabel
        Left = 34
        Top = 37
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object EdtDescricao: TwwDBEdit
        Left = 34
        Top = 57
        Width = 449
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 521
      Height = 138
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição da Situação')
    end
  end
  inherited Dock972: TDock97
    Width = 531
  end
  inherited Dock971: TDock97
    Top = 195
    Width = 531
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDSITBENEF, DESCRICAO'
      'FROM SITBENEF '
      'ORDER BY  DESCRICAO')
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição da Situação'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'SITBENEF.DESCRICAO'
      Required = True
      Size = 60
    end
    object qryIDSITBENEF: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDSITBENEF'
      Origin = 'SITBENEF.IDSITBENEF'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITBENEF'
      'set'
      '  IDSITBENEF = :IDSITBENEF,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDSITBENEF = :OLD_IDSITBENEF')
    InsertSQL.Strings = (
      'insert into SITBENEF'
      '  (IDSITBENEF, DESCRICAO)'
      'values'
      '  (:IDSITBENEF, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from SITBENEF'
      'where'
      '  IDSITBENEF = :OLD_IDSITBENEF')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SITBENEF.IDSITBENEF'
      'SITBENEF.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição da Situação')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SITBENEF')
    CamposChave.Strings = (
      'SITBENEF.IDSITBENEF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
