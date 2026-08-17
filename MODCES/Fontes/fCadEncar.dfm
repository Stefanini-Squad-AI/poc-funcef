inherited frmCadEncar: TfrmCadEncar
  Left = 311
  Top = 186
  Caption = 'Encargos Sociais'
  ClientHeight = 287
  ClientWidth = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 417
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 409
      Height = 193
      object Label1: TLabel
        Left = 50
        Top = 30
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 50
        Top = 72
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 50
        Top = 114
        Width = 62
        Height = 13
        Caption = 'Percentual'
        FocusControl = DBRealEdit1
      end
      object DBEdit1: TDBEdit
        Left = 50
        Top = 45
        Width = 64
        Height = 21
        DataField = 'IDENCARGO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 50
        Top = 87
        Width = 319
        Height = 21
        DataField = 'DESCRENCARGO'
        DataSource = ds
        TabOrder = 1
      end
      object DBRealEdit1: TDBRealEdit
        Left = 50
        Top = 129
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENCARGO'
        DataSource = ds
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 409
      Height = 193
      Selected.Strings = (
        'IDENCARGO'#9'10'#9'Código'
        'DESCRENCARGO'#9'40'#9'Descrição'
        'PERCENCARGO'#9'10'#9'Percentual')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 417
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 417
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 247
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
      DockPos = 79
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDENCARGO, DESCRENCARGO, PERCENCARGO'
      'FROM'
      '  ENCARGO'
      'ORDER BY'
      '  IDENCARGO')
    Left = 287
    Top = 2
    object qryIDENCARGO: TFloatField
      FieldName = 'IDENCARGO'
      Origin = 'ENCARGO.IDENCARGO'
    end
    object qryDESCRENCARGO: TStringField
      FieldName = 'DESCRENCARGO'
      Origin = 'ENCARGO.DESCRENCARGO'
      Size = 40
    end
    object qryPERCENCARGO: TFloatField
      FieldName = 'PERCENCARGO'
      Origin = 'ENCARGO.PERCENCARGO'
      DisplayFormat = '0.00'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 247
    Top = 53
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ENCARGO'
      'set'
      '  IDENCARGO = :IDENCARGO,'
      '  DESCRENCARGO = :DESCRENCARGO,'
      '  PERCENCARGO = :PERCENCARGO'
      'where'
      '  IDENCARGO = :OLD_IDENCARGO')
    InsertSQL.Strings = (
      'insert into ENCARGO'
      '  (IDENCARGO, DESCRENCARGO, PERCENCARGO)'
      'values'
      '  (:IDENCARGO, :DESCRENCARGO, :PERCENCARGO)')
    DeleteSQL.Strings = (
      'delete from ENCARGO'
      'where'
      '  IDENCARGO = :OLD_IDENCARGO')
    Left = 257
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Encargos Sociais'
    Colunas.Strings = (
      'IDENCARGO'
      'DESCRENCARGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'ENCARGO')
    CamposChave.Strings = (
      'IDENCARGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 365
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 317
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 53
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 354
    Top = 53
  end
end
