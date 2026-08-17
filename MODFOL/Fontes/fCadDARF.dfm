inherited frmCadDARF: TfrmCadDARF
  Left = 31
  Top = 148
  Caption = 'Tipos de Contribuição no DARF'
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
        DataField = 'IDCONTRIBDARF'
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
        'Item DARF')
      inherited pgctrlDetalhe: TPageControl
        Width = 642
        Height = 146
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 634
            Height = 118
            Selected.Strings = (
              'IDITEMDARF'#9'10'#9'Código'
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
              DataField = 'IDITEMDARF'
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
      '  IDCONTRIBDARF, DESCRICAO'
      'FROM'
      '  CONTRIBDARF'
      'WHERE'
      '  (IDCONTRIBDARF = :IDCONTRIBDARF)')
    Left = 322
    Top = 1
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'IDCONTRIBDARF'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 554
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBDARF'
      'set'
      '  IDCONTRIBDARF = :IDCONTRIBDARF,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCONTRIBDARF = :OLD_IDCONTRIBDARF')
    InsertSQL.Strings = (
      'insert into CONTRIBDARF'
      '  (IDCONTRIBDARF, DESCRICAO)'
      'values'
      '  (:IDCONTRIBDARF, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CONTRIBDARF'
      'where'
      '  IDCONTRIBDARF = :OLD_IDCONTRIBDARF')
    Left = 292
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Contribuição no DARF'
    Colunas.Strings = (
      'CONTRIBDARF.IDCONTRIBDARF'
      'CONTRIBDARF.DESCRICAO')
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
      'CONTRIBDARF')
    CamposChave.Strings = (
      'CONTRIBDARF.IDCONTRIBDARF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
    Left = 376
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 262
    Top = 1
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
      '  IDCONTRIBDARF, IDITEMDARF, DESCRICAO'
      'FROM'
      '  ITEMDARF'
      'WHERE'
      '  (IDCONTRIBDARF = :IDCONTRIBDARF)')
    UpdateObject = updSQLDet
    ValidateWithMask = True
    Left = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRIBDARF'
        ParamType = ptUnknown
      end>
  end
  object updSQLDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMDARF'
      'set'
      '  IDCONTRIBDARF = :IDCONTRIBDARF,'
      '  IDITEMDARF = :IDITEMDARF,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCONTRIBDARF = :OLD_IDCONTRIBDARF and'
      '  IDITEMDARF = :OLD_IDITEMDARF')
    InsertSQL.Strings = (
      'insert into ITEMDARF'
      '  (IDCONTRIBDARF, IDITEMDARF, DESCRICAO)'
      'values'
      '  (:IDCONTRIBDARF, :IDITEMDARF, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from ITEMDARF'
      'where'
      '  IDCONTRIBDARF = :OLD_IDCONTRIBDARF and'
      '  IDITEMDARF = :OLD_IDITEMDARF')
    Left = 472
  end
end
