inherited FrmCadGrupoRelatorio: TFrmCadGrupoRelatorio
  Left = 201
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Grupo de Relatórios'
  ClientWidth = 517
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    inherited pnlControles: TPanel
      Width = 507
      object GroupBox1: TGroupBox
        Left = 16
        Top = 48
        Width = 473
        Height = 73
        Caption = ' Descrição'
        TabOrder = 0
        object EdtGrupo: TwwDBEdit
          Left = 13
          Top = 28
          Width = 449
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 507
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição')
      Options = [dgTitles, dgColumnResize, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited Dock972: TDock97
    Width = 517
  end
  inherited Dock971: TDock97
    Width = 517
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDGRUPORELATORIO, ORIGEMCMGR, DESCRICAO '
      'FROM GRUPORELATORIO ORDER BY DESCRICAO')
    Left = 95
    Top = 128
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'GRUPORELATORIO.DESCRICAO'
      Size = 60
    end
    object qryIDGRUPORELATORIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPORELATORIO'
      Origin = 'GRUPORELATORIO.IDGRUPORELATORIO'
      Visible = False
    end
    object qryORIGEMCMGR: TFloatField
      DisplayWidth = 10
      FieldName = 'ORIGEMCMGR'
      Origin = 'GRUPORELATORIO.ORIGEMCMGR'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPORELATORIO'
      'set'
      '  IDGRUPORELATORIO = :IDGRUPORELATORIO,'
      '  ORIGEMCMGR = :ORIGEMCMGR,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDGRUPORELATORIO = :OLD_IDGRUPORELATORIO')
    InsertSQL.Strings = (
      'insert into GRUPORELATORIO'
      '  (IDGRUPORELATORIO, ORIGEMCMGR, DESCRICAO)'
      'values'
      '  (:IDGRUPORELATORIO, :ORIGEMCMGR, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from GRUPORELATORIO'
      'where'
      '  IDGRUPORELATORIO = :OLD_IDGRUPORELATORIO')
    Left = 65
    Top = 128
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPORELATORIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'GRUPORELATORIO')
    CamposChave.Strings = (
      'GRUPORELATORIO.IDGRUPORELATORIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 173
    Top = 128
  end
  inherited ds: TwwDataSource
    Left = 125
    Top = 128
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
