inherited frmCadTpPeriodicidade: TfrmCadTpPeriodicidade
  Left = 220
  Top = 134
  HelpContext = 160165
  Caption = 'Cadastro de Periodicidade'
  ClientHeight = 329
  ClientWidth = 449
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 243
    inherited pnlControles: TPanel
      Width = 447
      Height = 241
      object Label1: TLabel
        Left = 29
        Top = 19
        Width = 78
        Height = 13
        Caption = 'Periodicidade'
      end
      object Label2: TLabel
        Left = 29
        Top = 74
        Width = 174
        Height = 13
        Caption = 'Periodicidade em Nº de Meses'
      end
      object dbedDesc: TwwDBEdit
        Left = 29
        Top = 34
        Width = 238
        Height = 21
        DataField = 'NOME'
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
      object dbedQtdeMeses: TwwDBEdit
        Left = 29
        Top = 89
        Width = 121
        Height = 21
        DataField = 'QTDEMESES'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 447
      Height = 241
      Selected.Strings = (
        'IDTPPERIODICIDADE'#9'10'#9'Código'
        'NOME'#9'38'#9'Descrição'
        'QTDEMESES'#9'8'#9'Qtde. de ~Meses'#9'F')
      FixedCols = 1
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 449
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 277
      DockPos = 319
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
      DockPos = 150
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 292
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPPERIODICIDADE'
      'set'
      '  NOME = :NOME,'
      '  QTDEMESES = :QTDEMESES'
      'where'
      '  IDTPPERIODICIDADE = :OLD_IDTPPERIODICIDADE')
    InsertSQL.Strings = (
      'insert into TPPERIODICIDADE'
      '  (IDTPPERIODICIDADE, NOME, QTDEMESES)'
      'values'
      '  (:IDTPPERIODICIDADE, :NOME, :QTDEMESES)')
    DeleteSQL.Strings = (
      'delete from TPPERIODICIDADE'
      'where'
      '  IDTPPERIODICIDADE = :OLD_IDTPPERIODICIDADE')
    Left = 343
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Periodicidade'
    Colunas.Strings = (
      'IDTPPERIODICIDADE'
      'NOME'
      'QTDEMESES')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Qtde. Meses')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TPPERIODICIDADE')
    CamposChave.Strings = (
      'IDTPPERIODICIDADE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10')
    ExibePergunta = False
    Left = 378
    Top = 172
  end
  inherited ImlPadrao: TImageList
    Left = 50
    Top = 292
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 411
    Top = 65531
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDTPPERIODICIDADE, NOME, QTDEMESES'
      'FROM   TPPERIODICIDADE'
      'ORDER BY NOME'
      ' ')
    Left = 298
    Top = 4
  end
end
