inherited frmCadPrograma: TfrmCadPrograma
  Left = 166
  Top = 142
  Caption = 'Programa Previdenciário'
  ClientHeight = 260
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 174
    inherited pnlControles: TPanel
      Width = 516
      Height = 164
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 16
        Top = 72
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object DebCodigo: TwwDBEdit
        Left = 16
        Top = 40
        Width = 121
        Height = 21
        DataField = 'CODPROGRAMA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbeDesc: TwwDBEdit
        Left = 16
        Top = 88
        Width = 481
        Height = 21
        DataField = 'DESCPROGRAMA'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 516
      Height = 164
      Selected.Strings = (
        'CODPROGRAMA'#9'2'#9'Código'
        'DESCPROGRAMA'#9'60'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 526
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 221
    Width = 526
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA'
      'ORDER BY CODPROGRAMA')
    object qryCODPROGRAMA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 2
      FieldName = 'CODPROGRAMA'
      Origin = 'PROGRAMA.CODPROGRAMA'
      Size = 2
    end
    object qryDESCPROGRAMA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROGRAMA'
      'set'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  CODPROGRAMA = :CODPROGRAMA,'
      '  DESCPROGRAMA = :DESCPROGRAMA'
      'where'
      '  IDPROGRAMA = :OLD_IDPROGRAMA')
    InsertSQL.Strings = (
      'insert into PROGRAMA'
      '  (IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA)'
      'values'
      '  (:IDPROGRAMA, :CODPROGRAMA, :DESCPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from PROGRAMA'
      'where'
      '  IDPROGRAMA = :OLD_IDPROGRAMA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROGRAMA.DESCPROGRAMA'
      'PROGRAMA.CODPROGRAMA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Programa'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROGRAMA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '2')
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 58
  end
end
