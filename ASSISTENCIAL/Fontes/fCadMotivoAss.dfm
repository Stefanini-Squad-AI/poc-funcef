inherited frmCadMotivoAss: TfrmCadMotivoAss
  Caption = 'Cadastro de Motivos (Assistencial)'
  ClientHeight = 245
  ClientWidth = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 159
    inherited pnlControles: TPanel
      Width = 398
      Height = 149
      object lblmotivo: TLabel
        Left = 46
        Top = 24
        Width = 43
        Height = 13
        Caption = 'Motivo '
      end
      object Label1: TLabel
        Left = 46
        Top = 72
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBMotivo: TDBEdit
        Left = 46
        Top = 40
        Width = 305
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 46
        Top = 88
        Width = 67
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDMOTIVO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 398
      Height = 149
      Selected.Strings = (
        'DESCRICAO'#9'45'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 408
  end
  inherited Dock971: TDock97
    Top = 206
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 238
      DockPos = 238
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 70
      DockPos = 70
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDMOTIVO,DESCRICAO,FLGTIPO'
      'FROM MOTIVO'
      'WHERE (FLGTIPO  = '#39'A'#39')'
      'ORDER BY DESCRICAO')
    Left = 272
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGTIPO = :FLGTIPO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  FLGTIPO = :OLD_FLGTIPO')
    InsertSQL.Strings = (
      'insert into MOTIVO'
      '  (IDMOTIVO, DESCRICAO, FLGTIPO)'
      'values'
      '  (:IDMOTIVO, :DESCRICAO, :FLGTIPO)')
    DeleteSQL.Strings = (
      'delete from MOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  FLGTIPO = :OLD_FLGTIPO')
    Left = 244
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOTIVO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO')
    Filtro.Strings = (
      'FLGTIPO = '#39'A'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '97')
  end
  inherited ds: TwwDataSource
    Left = 300
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryAux: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPRODASS,NOME,DESCRICAO'
      'FROM PRODASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 328
    Top = 8
  end
end
