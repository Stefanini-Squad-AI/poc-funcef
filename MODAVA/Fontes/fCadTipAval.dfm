inherited frmCadTipAval: TfrmCadTipAval
  Left = 262
  Top = 178
  Caption = 'Tipos de Avaliação'
  ClientHeight = 287
  ClientWidth = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 362
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 354
      Height = 193
      object Label1: TLabel
        Left = 32
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 32
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object DBEdit1: TDBEdit
        Left = 32
        Top = 21
        Width = 64
        Height = 21
        DataField = 'CODTIPOAVAL'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 32
        Top = 63
        Width = 290
        Height = 21
        DataField = 'DESCRTIPOAVAL'
        DataSource = ds
        TabOrder = 1
      end
      object dbrgCategoria: TDBRadioGroup
        Left = 32
        Top = 96
        Width = 290
        Height = 75
        Caption = 'Categoria'
        DataField = 'FLGTIPOAVAL'
        DataSource = ds
        Items.Strings = (
          'Avaliação de Desempenho'
          'Acompanhamento de Desempenho'
          'Outros Tipos de Avaliação')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2')
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 354
      Height = 193
      Selected.Strings = (
        'CODTIPOAVAL'#9'10'#9'Código'
        'DESCRTIPOAVAL'#9'30'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 362
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 362
    inherited tb97Fundo: TToolbar97
      Left = 192
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 25
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPOAVAL, DESCRTIPOAVAL, FLGTIPOAVAL'
      'FROM'
      '  TIPOAVAL'
      'ORDER BY'
      '  CODTIPOAVAL')
    Left = 287
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 116
    Top = 54
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAVAL'
      'set'
      '  CODTIPOAVAL = :CODTIPOAVAL,'
      '  DESCRTIPOAVAL = :DESCRTIPOAVAL,'
      '  FLGTIPOAVAL = :FLGTIPOAVAL'
      'where'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL')
    InsertSQL.Strings = (
      'insert into TIPOAVAL'
      '  (CODTIPOAVAL, DESCRTIPOAVAL, FLGTIPOAVAL)'
      'values'
      '  (:CODTIPOAVAL, :DESCRTIPOAVAL, :FLGTIPOAVAL)')
    DeleteSQL.Strings = (
      'delete from TIPOAVAL'
      'where'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL')
    Left = 259
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Avaliação'
    Colunas.Strings = (
      'CODTIPOAVAL'
      'DESCRTIPOAVAL')
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
      'TIPOAVAL')
    CamposChave.Strings = (
      'CODTIPOAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 310
    Top = 54
  end
  inherited ds: TwwDataSource
    Left = 315
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 174
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 240
    Top = 54
  end
end
