inherited frmCadTamanho: TfrmCadTamanho
  Left = 209
  Top = 161
  Caption = 'Cadastro de Tamanho'
  ClientWidth = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 478
    inherited pnlControles: TPanel
      Width = 468
      object Label1: TLabel
        Left = 33
        Top = 59
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodTamanho
      end
      object Label2: TLabel
        Left = 15
        Top = 101
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescTamanho
      end
      object dbedCodTamanho: TDBEdit
        Left = 78
        Top = 54
        Width = 58
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTAMANHO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescTamanho: TDBEdit
        Left = 78
        Top = 99
        Width = 208
        Height = 21
        DataField = 'DESCTAMANHO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 468
      Selected.Strings = (
        'CODTAMANHO'#9'9'#9'Código'
        'DESCTAMANHO'#9'42'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 478
  end
  inherited Dock971: TDock97
    Width = 478
    inherited tb97Fundo: TToolbar97
      Left = 302
      DockPos = 302
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
      DockPos = 134
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '    CODTAMANHO,'
      '    DESCTAMANHO'
      'FROM '
      '    TAMANHO')
    Left = 327
    Top = 11
    object qryCODTAMANHO: TStringField
      FieldName = 'CODTAMANHO'
      Origin = 'TAMANHO.CODTAMANHO'
      Size = 3
    end
    object qryDESCTAMANHO: TStringField
      FieldName = 'DESCTAMANHO'
      Origin = 'TAMANHO.DESCTAMANHO'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TAMANHO'
      'set'
      '  CODTAMANHO = :CODTAMANHO,'
      '  DESCTAMANHO = :DESCTAMANHO'
      'where'
      '  rtrim(CODTAMANHO) = rtrim(:OLD_CODTAMANHO)')
    InsertSQL.Strings = (
      'insert into TAMANHO'
      '  (CODTAMANHO, DESCTAMANHO)'
      'values'
      '  (:CODTAMANHO, :DESCTAMANHO)')
    DeleteSQL.Strings = (
      'delete from TAMANHO'
      'where'
      '  rtrim(CODTAMANHO) = rtrim(:OLD_CODTAMANHO)')
    Left = 291
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TAMANHO.CODTAMANHO'
      'TAMANHO.DESCTAMANHO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TAMANHO')
    CamposChave.Strings = (
      'TAMANHO.CODTAMANHO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '3'
      '20')
    Left = 375
  end
  inherited ds: TwwDataSource
    Left = 258
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
