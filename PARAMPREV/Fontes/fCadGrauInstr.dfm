inherited frmCadGrauInstr: TfrmCadGrauInstr
  Left = 261
  Top = 136
  HelpContext = 160173
  Caption = 'Tabela dos Graus de Instrução'
  ClientHeight = 314
  ClientWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 354
    Height = 228
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 2
      Top = 2
      Width = 350
      Height = 224
      object Label1: TLabel
        Left = 18
        Top = 24
        Width = 28
        Height = 13
        Caption = 'Grau'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 18
        Top = 78
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 18
        Top = 39
        Width = 84
        Height = 21
        DataField = 'IDGRINSTR'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 18
        Top = 93
        Width = 306
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 2
      Top = 2
      Width = 350
      Height = 224
      Selected.Strings = (
        'IDGRINSTR'#9'4'#9'Grau'
        'DESCRICAO'#9'46'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 354
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 354
    inherited tb97Fundo: TToolbar97
      Left = 182
      DockPos = 186
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 13
      DockPos = 17
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 267
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 80
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRINSTR'
      'set'
      '  IDGRINSTR = :IDGRINSTR,'
      '  DESCRICAO = :DESCRICAO,'
      '  CODRAIS = :CODRAIS'
      'where'
      '  IDGRINSTR = :OLD_IDGRINSTR')
    InsertSQL.Strings = (
      'insert into GRINSTR'
      '  (IDGRINSTR, DESCRICAO, CODRAIS)'
      'values'
      '  (:IDGRINSTR, :DESCRICAO, :CODRAIS)')
    DeleteSQL.Strings = (
      'delete from GRINSTR'
      'where'
      '  IDGRINSTR = :OLD_IDGRINSTR')
    Left = 185
    Top = 80
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Graus de Instrução'
    Colunas.Strings = (
      'GRINSTR.IDGRINSTR'
      'GRINSTR.DESCRICAO')
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
      'GRINSTR')
    CamposChave.Strings = (
      'GRINSTR.IDGRINSTR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 293
    Top = 80
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 222
    Top = 138
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDGRINSTR, DESCRICAO, CODRAIS'
      'FROM'
      '  GRINSTR'
      'ORDER BY'
      '  IDGRINSTR')
    Left = 215
    Top = 80
  end
end
