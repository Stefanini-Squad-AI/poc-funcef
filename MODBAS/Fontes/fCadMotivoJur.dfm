inherited frmCadMotivoJur: TfrmCadMotivoJur
  Left = 262
  Top = 163
  HelpContext = 1100006
  Caption = 'Tabela de Motivos de Exclusão de Pessoas dos Processos'
  ClientHeight = 306
  ClientWidth = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 220
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 426
      Height = 212
      object Label1: TLabel
        Left = 32
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 32
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label5: TLabel
        Left = 32
        Top = 92
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dbedCodigo: TDBEdit
        Left = 32
        Top = 26
        Width = 84
        Height = 21
        DataField = 'IDMOTIVO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 32
        Top = 65
        Width = 361
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbedObs: TwwDBEdit
        Left = 32
        Top = 104
        Width = 361
        Height = 94
        AutoSize = False
        DataField = 'OBSERVACAO'
        DataSource = ds
        ShowVertScrollBar = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = True
        WordWrap = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 426
      Height = 212
      Selected.Strings = (
        'IDMOTIVO'#9'8'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 434
  end
  inherited Dock971: TDock97
    Top = 267
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 278
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 108
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO, OBSERVACAO,'
      '  GRUPOMOTIVO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO = '#39'O'#39')'
      'ORDER BY'
      '  IDMOTIVO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 384
    Top = 86
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  DESCRICAO = :DESCRICAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  GRUPOMOTIVO = :GRUPOMOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    InsertSQL.Strings = (
      'insert into MOTIVO'
      '  (IDMOTIVO, DESCRICAO, OBSERVACAO, GRUPOMOTIVO)'
      'values'
      '  (:IDMOTIVO, :DESCRICAO, :OBSERVACAO, :GRUPOMOTIVO)')
    DeleteSQL.Strings = (
      'delete from MOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tabela de Motivos de Exclusão de Pessoas dos Processos'
    Colunas.Strings = (
      'MOTIVO.IDMOTIVO'
      'MOTIVO.DESCRICAO')
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
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO')
    Filtro.Strings = (
      'GRUPOMOTIVO = '#39'O'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    ExibePergunta = False
    Left = 365
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 72
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 365
    Top = 1
  end
end
