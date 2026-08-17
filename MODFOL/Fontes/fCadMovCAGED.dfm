inherited frmCadMovCAGED: TfrmCadMovCAGED
  Left = 209
  Top = 215
  Width = 508
  BorderStyle = bsSizeable
  Caption = 'Movimento Contratual (Padrão CAGED)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 492
      Height = 204
      object Label1: TLabel
        Left = 15
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 15
        Top = 93
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 15
        Top = 48
        Width = 70
        Height = 21
        DataField = 'IDMOVCONTRCAGED'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 15
        Top = 117
        Width = 460
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 492
      Height = 204
      Selected.Strings = (
        'IDMOVCONTRCAGED'#9'10'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 500
  end
  inherited Dock971: TDock97
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 330
      DockPos = 330
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 162
      DockPos = 162
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDMOVCONTRCAGED,'
      '  DESCRICAO'
      'FROM'
      '  MOVCONTRCAGED'
      'ORDER BY'
      '  IDMOVCONTRCAGED')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVCONTRCAGED'
      'set'
      '  IDMOVCONTRCAGED = :IDMOVCONTRCAGED,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDMOVCONTRCAGED = :OLD_IDMOVCONTRCAGED')
    InsertSQL.Strings = (
      'insert into MOVCONTRCAGED'
      '  (IDMOVCONTRCAGED, DESCRICAO)'
      'values'
      '  (:IDMOVCONTRCAGED, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from MOVCONTRCAGED'
      'where'
      '  IDMOVCONTRCAGED = :OLD_IDMOVCONTRCAGED')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Movimento Contratual (Padrão CAGED)'
    Colunas.Strings = (
      'MOVCONTRCAGED.IDMOVCONTRCAGED'
      'MOVCONTRCAGED.DESCRICAO')
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
      'MOVCONTRCAGED')
    CamposChave.Strings = (
      'MOVCONTRCAGED.IDMOVCONTRCAGED')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
  end
end
