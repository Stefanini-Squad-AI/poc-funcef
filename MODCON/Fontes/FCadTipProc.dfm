inherited frmCadTipProc: TfrmCadTipProc
  Left = 182
  Top = 173
  Caption = 'Tipos de Processo'
  ClientHeight = 287
  ClientWidth = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 529
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 521
      Height = 193
      object Label1: TLabel
        Left = 35
        Top = 36
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 35
        Top = 111
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 35
        Top = 51
        Width = 49
        Height = 21
        DataField = 'IDTIPOPROC'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 35
        Top = 126
        Width = 452
        Height = 21
        DataField = 'NOMETIPOPROC'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 521
      Height = 193
      Selected.Strings = (
        'IDTIPOPROC'#9'10'#9'Código'
        'NOMETIPOPROC'#9'60'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 529
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 529
    inherited tb97Fundo: TToolbar97
      Left = 359
      DockPos = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 192
      DockPos = 200
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOPROC, NOMETIPOPROC'
      'FROM'
      '  TIPOPROCESSO'
      'ORDER BY'
      '  IDTIPOPROC')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 385
    Top = 27
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOPROCESSO'
      'set'
      '  IDTIPOPROC = :IDTIPOPROC,'
      '  NOMETIPOPROC = :NOMETIPOPROC'
      'where'
      '  IDTIPOPROC = :OLD_IDTIPOPROC')
    InsertSQL.Strings = (
      'insert into TIPOPROCESSO'
      '  (IDTIPOPROC, NOMETIPOPROC)'
      'values'
      '  (:IDTIPOPROC, :NOMETIPOPROC)')
    DeleteSQL.Strings = (
      'delete from TIPOPROCESSO'
      'where'
      '  IDTIPOPROC = :OLD_IDTIPOPROC')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Processo'
    Colunas.Strings = (
      'TIPOPROCESSO.IDTIPOPROC'
      'TIPOPROCESSO.NOMETIPOPROC')
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
      'TIPOPROCESSO')
    CamposChave.Strings = (
      'TIPOPROCESSO.IDTIPOPROC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
    Left = 461
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 385
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 385
    Top = 1
  end
end
