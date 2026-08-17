inherited frmCadDeposGRE: TfrmCadDeposGRE
  Left = 130
  Top = 184
  Caption = 'Depósitos para a GRE (Guia de Recolhimento de Empregados)'
  ClientWidth = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 588
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 580
      Height = 204
      object Label1: TLabel
        Left = 24
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 24
        Top = 57
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 24
        Top = 26
        Width = 84
        Height = 21
        DataField = 'IDDEPOSGRE'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 24
        Top = 71
        Width = 530
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbrgTipContra: TDBRadioGroup
        Left = 24
        Top = 101
        Width = 353
        Height = 72
        Caption = 'Tipo de Contrato Padrão para este Tipo de Depósito'
        Columns = 3
        DataField = 'TIPOCONTRATO'
        DataSource = ds
        Items.Strings = (
          'Efetivo'
          'Temporário'
          'Estagiário'
          'Terceiro'
          'Prop/Dir s/ Vinc'
          'Autônomo')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'E'
          'T'
          'G'
          '3'
          'P'
          'A')
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 580
      Height = 204
      Selected.Strings = (
        'IDDEPOSGRE'#9'7'#9'Código'
        'DESCRICAO'#9'60'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 588
  end
  inherited Dock971: TDock97
    Width = 588
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDDEPOSGRE,'
      '  DESCRICAO,'
      '  TIPOCONTRATO'
      'FROM'
      '  DEPOSGRE'
      'ORDER BY'
      '  IDDEPOSGRE')
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPOSGRE'
      'set'
      '  IDDEPOSGRE = :IDDEPOSGRE,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPOCONTRATO = :TIPOCONTRATO'
      'where'
      '  IDDEPOSGRE = :OLD_IDDEPOSGRE')
    InsertSQL.Strings = (
      'insert into DEPOSGRE'
      '  (IDDEPOSGRE, DESCRICAO, TIPOCONTRATO)'
      'values'
      '  (:IDDEPOSGRE, :DESCRICAO, :TIPOCONTRATO)')
    DeleteSQL.Strings = (
      'delete from DEPOSGRE'
      'where'
      '  IDDEPOSGRE = :OLD_IDDEPOSGRE')
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Depósitos para a GRE'
    Colunas.Strings = (
      'DEPOSGRE.IDDEPOSGRE'
      'DEPOSGRE.DESCRICAO')
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
      'DEPOSGRE')
    CamposChave.Strings = (
      'DEPOSGRE.IDDEPOSGRE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Top = 1
  end
  inherited ds: TwwDataSource
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
