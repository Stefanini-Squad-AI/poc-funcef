inherited frmCadProfi: TfrmCadProfi
  Left = 192
  Top = 189
  Caption = 'Tabela de Profissões'
  ClientHeight = 287
  ClientWidth = 571
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 571
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 563
      Height = 193
      object Label1: TLabel
        Left = 30
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 30
        Top = 93
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 30
        Top = 48
        Width = 84
        Height = 21
        DataField = 'IDPROFISS'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 30
        Top = 115
        Width = 502
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 563
      Height = 193
      Selected.Strings = (
        'IDPROFISS'#9'10'#9'Código'#9'F'
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 571
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 571
    inherited tb97Fundo: TToolbar97
      Left = 401
      DockPos = 409
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 234
      DockPos = 242
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDPROFISS,'
      '  DESCRICAO'
      'FROM'
      '  PROFISS'
      'ORDER BY'
      '  IDPROFISS')
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROFISS'
      'set'
      '  IDPROFISS = :IDPROFISS,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDPROFISS = :OLD_IDPROFISS')
    InsertSQL.Strings = (
      'insert into PROFISS'
      '  (IDPROFISS, DESCRICAO)'
      'values'
      '  (:IDPROFISS, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from PROFISS'
      'where'
      '  IDPROFISS = :OLD_IDPROFISS')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Profissões'
    Colunas.Strings = (
      'PROFISS.IDPROFISS'
      'PROFISS.DESCRICAO')
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
      'PROFISS')
    CamposChave.Strings = (
      'PROFISS.IDPROFISS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
