inherited frmcadmotivo: Tfrmcadmotivo
  Left = 312
  Top = 145
  Caption = 'Cadastro de Motivo'
  ClientHeight = 286
  ClientWidth = 472
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 472
    Height = 200
    inherited dbGrd: TwwDBGrid [0]
      Width = 462
      Height = 190
      Selected.Strings = (
        'IDMOTIVO'#9'10'#9'Código'
        'DESCRICAO'#9'70'#9'Descrição')
      FixedCols = 1
    end
    inherited pnlControles: TPanel [1]
      Width = 462
      Height = 190
      object lblmotivo: TLabel
        Left = 16
        Top = 24
        Width = 43
        Height = 13
        Caption = 'Motivo '
      end
      object dbedDesc: TwwDBEdit
        Left = 16
        Top = 42
        Width = 304
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 88
        Width = 185
        Height = 85
        Caption = ' Tipo '
        DataField = 'FLGTIPO'
        DataSource = ds
        Items.Strings = (
          'Previdenciário'
          'Geral ')
        TabOrder = 1
        Values.Strings = (
          'P'
          'G')
      end
    end
  end
  inherited Dock972: TDock97
    Width = 472
  end
  inherited Dock971: TDock97
    Top = 247
    Width = 472
    inherited tb97Fundo: TToolbar97
      Left = 298
      DockPos = 298
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 130
      DockPos = 130
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO,  FLGTIPO '
      'FROM MOTIVO '
      'WHERE FLGTIPO = '#39'P'#39' OR FLGTIPO IS NULL OR FLGTIPO = '#39'G'#39' '
      'ORDER BY DESCRICAO'
      '')
    Left = 316
    Top = 65534
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 6
    Top = 256
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGTIPO = :FLGTIPO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    InsertSQL.Strings = (
      'insert into MOTIVO'
      '  (IDMOTIVO, DESCRICAO, FLGTIPO)'
      'values'
      '  (:IDMOTIVO, :DESCRICAO, :FLGTIPO)')
    DeleteSQL.Strings = (
      'delete from MOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    Left = 361
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Motivo'
    Colunas.Strings = (
      'IDMOTIVO'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'IDMOTIVO')
    Filtro.Strings = (
      '((FLGTIPO = '#39'P'#39') OR (FLGTIPO IS NULL))')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 425
    Top = 64
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 59
    Top = 250
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 420
    Top = 7
  end
end
