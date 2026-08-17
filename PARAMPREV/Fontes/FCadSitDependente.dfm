inherited frmCadSitDependente: TfrmCadSitDependente
  Left = 230
  Top = 138
  HelpContext = 160172
  Caption = 'Cadastro de Situação de Dependentes'
  ClientHeight = 282
  ClientWidth = 417
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 417
    Height = 196
    inherited pnlControles: TPanel
      Width = 415
      Height = 194
      object Label1: TLabel
        Left = 28
        Top = 22
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 28
        Top = 70
        Width = 51
        Height = 13
        Caption = 'Situação'
      end
      object dbedCodigo: TwwDBEdit
        Left = 28
        Top = 36
        Width = 121
        Height = 21
        DataField = 'IDSITDEPENDENTE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 28
        Top = 84
        Width = 331
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 415
      Height = 194
      Selected.Strings = (
        'IDSITDEPENDENTE'#9'9'#9'Código'
        'DESCRICAO'#9'43'#9'Situação')
      Ctl3D = False
      ParentCtl3D = False
    end
  end
  inherited Dock972: TDock97
    Width = 417
  end
  inherited Dock971: TDock97
    Top = 243
    Width = 417
    inherited tb97Fundo: TToolbar97
      Left = 233
      DockPos = 233
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 64
      DockPos = 64
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 226
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITDEPENDENTE'
      'set'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDSITDEPENDENTE = :OLD_IDSITDEPENDENTE')
    InsertSQL.Strings = (
      'insert into SITDEPENDENTE'
      '  (IDSITDEPENDENTE, DESCRICAO)'
      'values'
      '  (:IDSITDEPENDENTE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from SITDEPENDENTE'
      'where'
      '  IDSITDEPENDENTE = :OLD_IDSITDEPENDENTE')
    Left = 346
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situação de Dependentes'
    Colunas.Strings = (
      'IDSITDEPENDENTE'
      'DESCRICAO')
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
      'SITDEPENDENTE')
    CamposChave.Strings = (
      'IDSITDEPENDENTE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 368
    Top = 61
  end
  inherited ImlPadrao: TImageList
    Left = 35
    Top = 238
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 387
    Top = 118
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDSITDEPENDENTE, DESCRICAO'
      'FROM SITDEPENDENTE'
      'ORDER BY DESCRICAO')
    Left = 295
    Top = 1
  end
end
