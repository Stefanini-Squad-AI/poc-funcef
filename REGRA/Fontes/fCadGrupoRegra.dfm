inherited frmCadGrupoRegra: TfrmCadGrupoRegra
  Left = 73
  Top = 194
  HelpContext = 450009
  Caption = 'Grupos de Regras'
  ClientHeight = 190
  ClientWidth = 440
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 440
    Height = 104
    object Label1: TLabel
      Left = 14
      Top = 11
      Width = 72
      Height = 13
      Caption = 'Identificador'
    end
    object Label2: TLabel
      Left = 14
      Top = 51
      Width = 114
      Height = 13
      Caption = 'Descrição do Grupo'
    end
    object dedDescricao: TwwDBEdit
      Left = 14
      Top = 67
      Width = 412
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 25
      Width = 121
      Height = 21
      Color = clBtnFace
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      Enabled = False
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 440
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 440
    inherited tb97Fundo: TToolbar97
      Left = 270
      DockPos = 270
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
      DockPos = 102
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOREGRA, DESCRICAO'
      'FROM'
      '    GRUPOREGRA'
      'WHERE'
      '     IDGRUPOREGRA = :ID')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOREGRA'
      'set'
      '  IDGRUPOREGRA = :IDGRUPOREGRA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDGRUPOREGRA = :OLD_IDGRUPOREGRA')
    InsertSQL.Strings = (
      'insert into GRUPOREGRA'
      '  (IDGRUPOREGRA, DESCRICAO)'
      'values'
      '  (:IDGRUPOREGRA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from GRUPOREGRA'
      'where'
      '  IDGRUPOREGRA = :OLD_IDGRUPOREGRA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPOREGRA.IDGRUPOREGRA'
      'GRUPOREGRA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOREGRA')
    CamposChave.Strings = (
      'GRUPOREGRA.IDGRUPOREGRA')
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
