inherited frmCadGrupoArquivo: TfrmCadGrupoArquivo
  Left = 146
  Top = 132
  Caption = 'Grupo de Arquivos'
  ClientHeight = 236
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 150
    inherited dbGrd: TwwDBGrid [0]
      Width = 478
      Height = 140
      Selected.Strings = (
        'CODGRUPOARQUIVO'#9'6'#9'Código'
        'DESCGRUPOARQUIVO'#9'40'#9'Descrição'
        'SETORGRUPOS'#9'12'#9'Setor')
    end
    inherited pnlControles: TPanel [1]
      Width = 478
      Height = 140
      object Label3: TLabel
        Left = 10
        Top = 87
        Width = 99
        Height = 13
        Caption = 'Setor dos Grupos'
      end
      object Label2: TLabel
        Left = 10
        Top = 48
        Width = 189
        Height = 13
        Caption = 'Descrição do Grupo de Arquivos '
      end
      object Label1: TLabel
        Left = 10
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object EdtCodigo: TEdit
        Left = 10
        Top = 24
        Width = 121
        Height = 21
        MaxLength = 6
        TabOrder = 0
      end
      object EdtDescricao: TEdit
        Left = 10
        Top = 63
        Width = 459
        Height = 21
        MaxLength = 40
        TabOrder = 1
      end
      object EdtSetor: TEdit
        Left = 10
        Top = 102
        Width = 185
        Height = 21
        MaxLength = 12
        TabOrder = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 488
  end
  inherited Dock971: TDock97
    Top = 197
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 318
      DockPos = 318
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 150
      DockPos = 150
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS'
      'FROM'
      '    GRPARQUIVO'
      'ORDER BY'
      '      DESCGRUPOARQUIVO')
  end
  inherited ivTradutor: TIvExtendedTranslator
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
      'update GRPARQUIVO'
      'set'
      '  CODGRUPOARQUIVO = :CODGRUPOARQUIVO,'
      '  DESCGRUPOARQUIVO = :DESCGRUPOARQUIVO,'
      '  SETORGRUPOS = :SETORGRUPOS'
      'where'
      '  CODGRUPOARQUIVO = :OLD_CODGRUPOARQUIVO')
    InsertSQL.Strings = (
      'insert into GRPARQUIVO'
      '  (CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS)'
      'values'
      '  (:CODGRUPOARQUIVO, :DESCGRUPOARQUIVO, :SETORGRUPOS)')
    DeleteSQL.Strings = (
      'delete from GRPARQUIVO'
      'where'
      '  CODGRUPOARQUIVO = :OLD_CODGRUPOARQUIVO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO'
      'GRPARQUIVO.DESCGRUPOARQUIVO'
      'GRPARQUIVO.SETORGRUPOS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Setor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRPARQUIVO')
    CamposChave.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '40'
      '12')
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 9
  end
end
