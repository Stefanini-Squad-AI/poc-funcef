inherited frmCadFormFGTS: TfrmCadFormFGTS
  Left = 196
  Top = 174
  Width = 471
  Height = 314
  BorderStyle = bsSizeable
  Caption = 'Formas de Rescisão (Padrão FGTS)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 463
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 455
      Height = 193
      object Label1: TLabel
        Left = 41
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 41
        Top = 71
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 41
        Top = 34
        Width = 70
        Height = 21
        DataField = 'IDFORMARESC'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 41
        Top = 83
        Width = 370
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 41
        Top = 127
        Width = 370
        Height = 45
        Caption = 'Aplica-se a'
        Columns = 3
        DataField = 'FLGOPTANTE'
        DataSource = ds
        Items.Strings = (
          'Optantes'
          'Não Optantes'
          'Retratação')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3')
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 455
      Height = 193
      Selected.Strings = (
        'IDFORMARESC'#9'10'#9'Código'#9'No'
        'DESCRICAO'#9'50'#9'Descrição'#9'No'
        'FLGOPTANTE'#9'6'#9'Optante'#9'No')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 463
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 463
    inherited tb97Fundo: TToolbar97
      Left = 291
      DockPos = 291
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 123
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDFORMARESC,'
      '  DESCRICAO,'
      '  FLGOPTANTE'
      'FROM'
      '  FORMARESCFGTS'
      'ORDER BY'
      '  IDFORMARESC')
    ControlType.Strings = (
      'FLGOPTANTE;CheckBox;1;2')
    Left = 359
    Top = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
    Top = 54
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FORMARESCFGTS'
      'set'
      '  IDFORMARESC = :IDFORMARESC,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGOPTANTE = :FLGOPTANTE'
      'where'
      '  IDFORMARESC = :OLD_IDFORMARESC')
    InsertSQL.Strings = (
      'insert into FORMARESCFGTS'
      '  (IDFORMARESC, DESCRICAO, FLGOPTANTE)'
      'values'
      '  (:IDFORMARESC, :DESCRICAO, :FLGOPTANTE)')
    DeleteSQL.Strings = (
      'delete from FORMARESCFGTS'
      'where'
      '  IDFORMARESC = :OLD_IDFORMARESC')
    Left = 331
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Formas de Rescisão (Padrão FGTS)'
    Colunas.Strings = (
      'FORMARESCFGTS.IDFORMARESC'
      'FORMARESCFGTS.DESCRICAO')
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
      'FORMARESCFGTS')
    CamposChave.Strings = (
      'FORMARESCFGTS.IDFORMARESC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 387
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 97
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 205
    Top = 54
  end
end
