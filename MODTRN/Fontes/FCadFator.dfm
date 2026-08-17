inherited frmCadFator: TfrmCadFator
  Left = 92
  Top = 164
  Caption = 'Fatores de Avaliação dos Cursos'
  ClientHeight = 353
  ClientWidth = 674
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 674
    Height = 267
    BorderWidth = 2
    inherited dbGrd: TwwDBGrid [0]
      Left = 4
      Top = 4
      Width = 666
      Height = 259
      Selected.Strings = (
        'IDFATORAVAL'#9'10'#9'Código'
        'DESCRICAO'#9'200'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
    inherited pnlControles: TPanel [1]
      Left = 4
      Top = 4
      Width = 666
      Height = 259
      object Label1: TLabel
        Left = 10
        Top = 3
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 10
        Top = 54
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 115
        Width = 75
        Height = 13
        Caption = 'Observações'
        FocusControl = DBEdit2
      end
      object dbedCodigo: TDBEdit
        Left = 10
        Top = 18
        Width = 64
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDFATORAVAL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 69
        Width = 640
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 10
        Top = 130
        Width = 640
        Height = 119
        DataField = 'OBSERVACAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 674
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 674
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '  IDFATORAVAL, DESCRICAO, OBSERVACAO'
      'FROM'
      '  FATORAVALCURSO'
      'ORDER BY UPPER(DESCRICAO)')
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FATORAVALCURSO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
    InsertSQL.Strings = (
      'insert into FATORAVALCURSO'
      '  (IDFATORAVAL, DESCRICAO, OBSERVACAO)'
      'values'
      '  (:IDFATORAVAL, :DESCRICAO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from FATORAVALCURSO'
      'where'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fatores de Avaliação'
    Colunas.Strings = (
      'IDFATORAVAL'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'FATORAVALCURSO')
    CamposChave.Strings = (
      'IDFATORAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '200')
    ExibePergunta = False
    Left = 325
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryGrupoFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select DESCRICAO, IDGRUPOFATORAVAL '
      'from GRUPOFATORAVAL '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 299
    Top = 216
  end
end
