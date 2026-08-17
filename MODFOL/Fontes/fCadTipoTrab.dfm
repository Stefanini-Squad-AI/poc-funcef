inherited frmCadTipoTrab: TfrmCadTipoTrab
  Left = 218
  Top = 157
  Width = 461
  Height = 339
  BorderStyle = bsSizeable
  Caption = 'Tipo de Trabalhador (Padrão Ministério do Trabalho)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 453
    Height = 226
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 445
      Height = 218
      object Label1: TLabel
        Left = 29
        Top = 36
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 29
        Top = 106
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 29
        Top = 56
        Width = 63
        Height = 21
        DataField = 'IDTIPOTRAB'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 29
        Top = 125
        Width = 390
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 445
      Height = 218
      Selected.Strings = (
        'IDTIPOTRAB'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 453
  end
  inherited Dock971: TDock97
    Top = 273
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 250
      DockPos = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 82
      DockPos = 82
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOTRAB,'
      '  DESCRICAO'
      'FROM'
      ' TIPOTRABALHADOR'
      'ORDER BY'
      '  IDTIPOTRAB')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOTRABALHADOR'
      'set'
      '  IDTIPOTRAB = :IDTIPOTRAB,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOTRAB = :OLD_IDTIPOTRAB and'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'insert into TIPOTRABALHADOR'
      '  (IDTIPOTRAB, DESCRICAO)'
      'values'
      '  (:IDTIPOTRAB, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOTRABALHADOR'
      'where'
      '  IDTIPOTRAB = :OLD_IDTIPOTRAB and'
      '  DESCRICAO = :OLD_DESCRICAO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Trabalhador'
    Colunas.Strings = (
      'TIPOTRABALHADOR.IDTIPOTRAB'
      'TIPOTRABALHADOR.DESCRICAO')
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
      'TIPOTRABALHADOR')
    CamposChave.Strings = (
      'TIPOTRABALHADOR.IDTIPOTRAB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
