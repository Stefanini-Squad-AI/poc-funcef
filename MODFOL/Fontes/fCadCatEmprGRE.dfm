inherited frmCadCatEmprGRE: TfrmCadCatEmprGRE
  Width = 438
  BorderStyle = bsSizeable
  Caption = 'Categoria de Empregado para FGTS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 430
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 422
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
        Width = 84
        Height = 21
        DataField = 'IDCATEMPRGRE'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 15
        Top = 117
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
      Width = 422
      Height = 204
      Selected.Strings = (
        'IDCATEMPRGRE'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 430
  end
  inherited Dock971: TDock97
    Width = 430
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 260
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
      DockPos = 92
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDCATEMPRGRE,'
      '  DESCRICAO'
      'FROM'
      '  CATEMPRGRE')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CATEMPRGRE'
      'set'
      '  IDCATEMPRGRE = :IDCATEMPRGRE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCATEMPRGRE = :OLD_IDCATEMPRGRE')
    InsertSQL.Strings = (
      'insert into CATEMPRGRE'
      '  (IDCATEMPRGRE, DESCRICAO)'
      'values'
      '  (:IDCATEMPRGRE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CATEMPRGRE'
      'where'
      '  IDCATEMPRGRE = :OLD_IDCATEMPRGRE')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Categoria de Empregado para FGTS'
    Colunas.Strings = (
      'CATEMPRGRE.IDCATEMPRGRE'
      'CATEMPRGRE.DESCRICAO')
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
      'CATEMPRGRE')
    CamposChave.Strings = (
      'CATEMPRGRE.IDCATEMPRGRE')
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
