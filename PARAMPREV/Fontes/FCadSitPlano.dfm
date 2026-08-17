inherited frmCadSitPlano: TfrmCadSitPlano
  Left = 196
  Top = 94
  HelpContext = 160171
  Caption = 'Cadastro da Situação do Participante no Plano'
  ClientHeight = 385
  ClientWidth = 477
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 477
    Height = 299
    inherited pnlControles: TPanel
      Width = 475
      Height = 297
      object Label3: TLabel
        Left = 18
        Top = 22
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 18
        Top = 82
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
      end
      object Label2: TLabel
        Left = 414
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedDescricao: TwwDBEdit
        Left = 18
        Top = 36
        Width = 391
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
      object cbFlgInterno: TComboBox
        Left = 18
        Top = 96
        Width = 279
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'Normal'
          'Cancelado'
          'Suspenso'
          'Inadimplente'
          'Desligado'
          'Cancelado por Inadimplência'
          'Transferência de Plano'
          'Pendente')
      end
      object DBEdit1: TDBEdit
        Left = 414
        Top = 36
        Width = 46
        Height = 21
        Color = clSilver
        DataField = 'IDSITPLANOPREV'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 475
      Height = 297
      Selected.Strings = (
        'IDSITPLANOPREV'#9'10'#9'Código'
        'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
    end
  end
  inherited Dock972: TDock97
    Width = 477
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 477
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 136
      DockPos = 194
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 305
      DockPos = 363
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 307
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 4
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITPLANOPREV'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGINTERNO = :FLGINTERNO'
      'where'
      '  IDSITPLANOPREV = :OLD_IDSITPLANOPREV')
    InsertSQL.Strings = (
      'insert into SITPLANOPREV'
      '  (IDSITPLANOPREV, DESCRICAO, FLGINTERNO)'
      'values'
      '  (:IDSITPLANOPREV, :DESCRICAO, :FLGINTERNO)')
    DeleteSQL.Strings = (
      'delete from SITPLANOPREV'
      'where'
      '  IDSITPLANOPREV = :OLD_IDSITPLANOPREV')
    Left = 352
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situação do Participante no Plano'
    Colunas.Strings = (
      'IDSITPLANOPREV'
      'DESCRICAO')
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
      'SITPLANOPREV')
    CamposChave.Strings = (
      'IDSITPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 455
    Top = 4
  end
  inherited ImlPadrao: TImageList
    Left = 44
    Top = 307
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 417
    Top = 1
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDSITPLANOPREV, DESCRICAO, FLGINTERNO'
      'FROM   SITPLANOPREV'
      'ORDER BY DESCRICAO ')
    Left = 307
    Top = 4
  end
end
