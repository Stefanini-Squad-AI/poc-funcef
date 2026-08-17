inherited frmCadTipSent: TfrmCadTipSent
  Left = 225
  Top = 152
  Caption = 'Tipos de Sentença em Processos'
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 412
      Height = 204
      object Label1: TLabel
        Left = 56
        Top = 40
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 56
        Top = 119
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 55
        Width = 64
        Height = 21
        DataField = 'CODTIPOSENT'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 56
        Top = 134
        Width = 300
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 412
      Height = 204
      Selected.Strings = (
        'CODTIPOSENT'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 420
  end
  inherited Dock971: TDock97
    Width = 420
    inherited tb97Fundo: TToolbar97
      Left = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPOSENT, DESCRICAO'
      'FROM'
      '  TIPOSENTENCA'
      'ORDER BY'
      '  CODTIPOSENT')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 360
    Top = 70
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSENTENCA'
      'set'
      '  CODTIPOSENT = :CODTIPOSENT,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTIPOSENT = :OLD_CODTIPOSENT')
    InsertSQL.Strings = (
      'insert into TIPOSENTENCA'
      '  (CODTIPOSENT, DESCRICAO)'
      'values'
      '  (:CODTIPOSENT, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOSENTENCA'
      'where'
      '  CODTIPOSENT = :OLD_CODTIPOSENT')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Sentença'
    Colunas.Strings = (
      'TIPOSENTENCA.CODTIPOSENT'
      'TIPOSENTENCA.DESCRICAO')
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
      'TIPOSENTENCA')
    CamposChave.Strings = (
      'TIPOSENTENCA.CODTIPOSENT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 296
    Top = 69
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 360
    Top = 57
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 296
    Top = 57
  end
end
