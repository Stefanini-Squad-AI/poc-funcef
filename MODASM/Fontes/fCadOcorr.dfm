inherited frmCadOcorr: TfrmCadOcorr
  Left = 208
  Top = 171
  Caption = 'Tabela de Ocorrências e Exames Médicos'
  ClientHeight = 301
  ClientWidth = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 429
    Height = 215
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 421
      Height = 207
      object Label1: TLabel
        Left = 41
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 41
        Top = 58
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 41
        Top = 100
        Width = 75
        Height = 13
        Caption = 'Aval. Mínima'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 41
        Top = 31
        Width = 64
        Height = 21
        DataField = 'CODTIPOOCMED'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 41
        Top = 73
        Width = 343
        Height = 21
        DataField = 'DESCRTIPOOCMED'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 41
        Top = 115
        Width = 64
        Height = 21
        Hint = 'Mínimo para a Pessoa Estar Apta'
        DataField = 'AVALMIN'
        DataSource = ds
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbrgTipoOcor: TDBRadioGroup
        Left = 41
        Top = 149
        Width = 343
        Height = 40
        Caption = 'Tipo de Ocorrência'
        Columns = 2
        DataField = 'FLGTIPOCOR'
        DataSource = ds
        Items.Strings = (
          'Programável'
          'Aleatória')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 421
      Height = 207
      Selected.Strings = (
        'CODTIPOOCMED'#9'10'#9'Código'
        'DESCRTIPOOCMED'#9'40'#9'Descrição'
        'AVALMIN'#9'10'#9'Aval. Mínima')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 429
  end
  inherited Dock971: TDock97
    Top = 262
    Width = 429
    inherited tb97Fundo: TToolbar97
      Left = 259
      DockPos = 376
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
      DockPos = 209
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN, FLGTIPOCOR'
      'FROM'
      '  TIPOCMED'
      'ORDER BY'
      '  CODTIPOOCMED')
    Left = 273
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 360
    Top = 51
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCMED'
      'set'
      '  CODTIPOOCMED = :CODTIPOOCMED,'
      '  DESCRTIPOOCMED = :DESCRTIPOOCMED,'
      '  AVALMIN = :AVALMIN,'
      '  FLGTIPOCOR = :FLGTIPOCOR'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED')
    InsertSQL.Strings = (
      'insert into TIPOCMED'
      '  (CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN, FLGTIPOCOR)'
      'values'
      '  (:CODTIPOOCMED, :DESCRTIPOOCMED, :AVALMIN, :FLGTIPOCOR)')
    DeleteSQL.Strings = (
      'delete from TIPOCMED'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED')
    Left = 245
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Ocorrências e Exames Médicos'
    Colunas.Strings = (
      'CODTIPOOCMED'
      'DESCRTIPOOCMED')
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
      'TIPOCMED')
    CamposChave.Strings = (
      'CODTIPOOCMED')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 341
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 301
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 242
    Top = 51
  end
end
