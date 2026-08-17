inherited frmCadCID: TfrmCadCID
  Left = 170
  Top = 165
  Caption = 'Tabela CID (Código Internacional de Doenças)'
  ClientHeight = 333
  ClientWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 247
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 600
      Height = 239
      object Label1: TLabel
        Left = 51
        Top = 11
        Width = 22
        Height = 13
        Caption = 'CID'
        FocusControl = dbedCodCid
      end
      object Label2: TLabel
        Left = 51
        Top = 62
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodCid: TDBEdit
        Left = 51
        Top = 26
        Width = 78
        Height = 21
        DataField = 'CODCID'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescrCID: TwwDBEdit
        Left = 51
        Top = 76
        Width = 493
        Height = 149
        AutoSize = False
        DataField = 'DESCRCID'
        DataSource = ds
        ShowVertScrollBar = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 600
      Height = 239
      Selected.Strings = (
        'CODCID'#9'10'#9'Código'
        'DESCRICAO'#9'100'#9'Descrição Abreviada (100 caracteres)')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 608
  end
  inherited Dock971: TDock97
    Top = 294
    Width = 608
    inherited tb97Fundo: TToolbar97
      Left = 438
      DockPos = 450
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 271
      DockPos = 283
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODCID, DESCRCID, SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'FROM'
      '  CID'
      'ORDER BY'
      '  CODCID')
    Left = 272
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 560
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CID'
      'set'
      '  CODCID = :CODCID,'
      '  DESCRCID = :DESCRCID'
      'where'
      '  CODCID = :OLD_CODCID')
    InsertSQL.Strings = (
      'insert into CID'
      '  (CODCID, DESCRCID)'
      'values'
      '  (:CODCID, :DESCRCID)')
    DeleteSQL.Strings = (
      'delete from CID'
      'where'
      '  CODCID = :OLD_CODCID')
    Left = 244
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CID'
    Colunas.Strings = (
      'CODCID'
      'SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'DESCRCID')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição Abreviada'
      'Descrição Completa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CID')
    CamposChave.Strings = (
      'CODCID')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '100'
      '1000')
    Left = 341
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 300
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 496
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 420
    Top = 1
  end
end
