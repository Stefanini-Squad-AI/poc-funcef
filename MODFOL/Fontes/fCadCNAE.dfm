inherited frmCadCNAE: TfrmCadCNAE
  Left = 33
  Caption = 'Classificação Nacional de Atividades Econômicas (CNAE)'
  ClientHeight = 395
  ClientWidth = 743
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 743
    Height = 309
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 735
      Height = 96
      object Label2: TLabel
        Left = 12
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 12
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object dbedCodigo: TDBEdit
        Left = 12
        Top = 20
        Width = 84
        Height = 21
        DataField = 'IDCATCNAE'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 12
        Top = 64
        Width = 708
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 100
      Width = 735
      Height = 205
      Tabs.Strings = (
        'Item CNAE')
      inherited pgctrlDetalhe: TPageControl
        Width = 642
        Height = 146
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 634
            Height = 118
            Selected.Strings = (
              'IDITEMCNAE'#9'10'#9'Código'
              'DESCRICAO'#9'180'#9'Descrição')
            Font.Height = -11
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 634
            Height = 118
            object Label3: TLabel
              Left = 12
              Top = 52
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label4: TLabel
              Left = 12
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Código'
              FocusControl = dbedCodigoDet
            end
            object dbedDescrDet: TDBEdit
              Left = 12
              Top = 68
              Width = 613
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedCodigoDet: TDBEdit
              Left = 12
              Top = 24
              Width = 84
              Height = 21
              DataField = 'IDITEMCNAE'
              DataSource = dsDet
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 727
      end
      inherited Dock974: TDock97
        Left = 646
        Height = 146
      end
    end
  end
  inherited Dock972: TDock97
    Width = 743
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 743
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDCATCNAE, DESCRICAO'
      ''
      'FROM'
      '  CATCNAE'
      'WHERE'
      '  (IDCATCNAE = :IDCATCNAE)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCATCNAE'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 535
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CATCNAE'
      'set'
      '  IDCATCNAE = :IDCATCNAE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCATCNAE = :OLD_IDCATCNAE')
    InsertSQL.Strings = (
      'insert into CATCNAE'
      '  (IDCATCNAE, DESCRICAO)'
      'values'
      '  (:IDCATCNAE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CATCNAE'
      'where'
      '  IDCATCNAE = :OLD_IDCATCNAE')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CNAE'
    Colunas.Strings = (
      'CATCNAE.IDCATCNAE'
      'CATCNAE.DESCRICAO')
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
      'CATCNAE')
    CamposChave.Strings = (
      'CATCNAE.IDCATCNAE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '180')
    Left = 357
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCATCNAE, IDITEMCNAE, DESCRICAO'
      'FROM'
      '  ITEMCNAE'
      'WHERE'
      '  (IDCATCNAE = :IDCATCNAE)')
    UpdateObject = updSQLDet
    ValidateWithMask = True
    Left = 501
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCATCNAE'
        ParamType = ptUnknown
      end>
  end
  object updSQLDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMCNAE'
      'set'
      '  IDCATCNAE = :IDCATCNAE,'
      '  IDITEMCNAE = :IDITEMCNAE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCATCNAE = :OLD_IDCATCNAE and'
      '  IDITEMCNAE = :OLD_IDITEMCNAE')
    InsertSQL.Strings = (
      'insert into ITEMCNAE'
      '  (IDCATCNAE, IDITEMCNAE, DESCRICAO)'
      'values'
      '  (:IDCATCNAE, :IDITEMCNAE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from ITEMCNAE'
      'where'
      '  IDCATCNAE = :OLD_IDCATCNAE and'
      '  IDITEMCNAE = :OLD_IDITEMCNAE')
    Left = 453
    Top = 7
  end
end
