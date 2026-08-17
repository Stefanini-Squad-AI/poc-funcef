inherited frmCadHist: TfrmCadHist
  Left = 190
  Top = 141
  Caption = 'Histórico Padrão'
  ClientWidth = 526
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    inherited pnlControles: TPanel
      Width = 516
      object Label1: TLabel
        Left = 45
        Top = 54
        Width = 55
        Height = 13
        Caption = 'Histórico '
      end
      object dbedHistorico: TwwDBEdit
        Left = 45
        Top = 69
        Width = 430
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 516
      Selected.Strings = (
        'DESCRICAO'#9'68'#9'Histórico')
      TitleAlignment = taCenter
    end
  end
  inherited Dock972: TDock97
    Width = 526
  end
  inherited Dock971: TDock97
    Width = 526
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM HISTORICOFINAN'
      'ORDER BY DESCRICAO')
    Left = 138
    Top = 78
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 70
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTORICOFINAN'
      'set'
      '  HISTPADFINAN = :HISTPADFINAN,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  HISTPADFINAN = :OLD_HISTPADFINAN')
    InsertSQL.Strings = (
      'insert into HISTORICOFINAN'
      '  (HISTPADFINAN, DESCRICAO)'
      'values'
      '  (:HISTPADFINAN, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from HISTORICOFINAN'
      'where'
      '  HISTPADFINAN = :OLD_HISTPADFINAN')
    Left = 195
    Top = 78
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'HISTORICOFINAN.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Histórico')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'HISTORICOFINAN')
    CamposChave.Strings = (
      'HISTORICOFINAN.HISTPADFINAN')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 333
    Top = 134
  end
  inherited ds: TwwDataSource
    Left = 253
    Top = 77
  end
  inherited ImlPadrao: TImageList
    Left = 89
    Top = 78
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 336
    Top = 80
  end
end
