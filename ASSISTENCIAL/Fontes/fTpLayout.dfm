inherited FrmTpLayout: TFrmTpLayout
  Left = 145
  Top = 167
  Caption = 'Tipos de Lay-Out'
  ClientHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 251
    inherited dbGrd: TwwDBGrid [0]
      Height = 241
      Selected.Strings = (
        'IDLAYOUT'#9'10'#9'IDLAYOUT'
        'DESCRICAO'#9'61'#9'DESCRICAO')
    end
    inherited pnlControles: TPanel [1]
      Height = 241
      object Label3: TLabel
        Left = 12
        Top = 59
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 12
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBNome: TDBEdit
        Left = 12
        Top = 74
        Width = 261
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBLayout: TDBEdit
        Left = 12
        Top = 26
        Width = 75
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDLAYOUT'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 298
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 214
      DockPos = 214
    end
  end
  inherited qry: TwwQuery
    Active = True
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT'
      'ORDER BY DESCRICAO')
    Left = 386
    Top = 14
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPLAYOUT'
      'set'
      '  IDLAYOUT = :IDLAYOUT,'
      '   DESCRICAO = :DESCRICAO'
      ' '
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'insert into TPLAYOUT  (IDLAYOUT, DESCRICAO)'
      'values'
      '  (:IDLAYOUT, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TPLAYOUT where'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  DESCRICAO = :OLD_DESCRICAO')
    Left = 467
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TPLAYOUT.IDLAYOUT'
      'TPLAYOUT.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'CÓDIGO'
      'DESCRIÇÃO')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TPLAYOUT')
    CamposChave.Strings = (
      'TPLAYOUT.IDLAYOUT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 429
  end
  inherited ds: TwwDataSource
    Left = 427
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 337
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
    Top = 10
  end
  object qryCpLayout: TwwQuery
    Tag = 5
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CPLAYOUT')
    ValidateWithMask = True
    Left = 367
    Top = 8
  end
  object qryAux: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CPLAYOUT')
    ValidateWithMask = True
    Left = 375
    Top = 48
  end
end
