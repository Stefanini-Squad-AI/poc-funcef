inherited frmCadSit: TfrmCadSit
  Left = 188
  Top = 141
  Caption = 'Situações Funcionais'
  ClientHeight = 335
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 249
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 429
      Height = 241
      object Label5: TLabel
        Left = 26
        Top = 31
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label6: TLabel
        Left = 26
        Top = 79
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label7: TLabel
        Left = 308
        Top = 79
        Width = 104
        Height = 13
        Caption = 'Código Mov.FGTS'
        FocusControl = DBEdit4
      end
      object Label8: TLabel
        Left = 308
        Top = 31
        Width = 86
        Height = 13
        Caption = 'Código CAGED'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 26
        Top = 46
        Width = 64
        Height = 21
        DataField = 'IDSITFUNC'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 26
        Top = 94
        Width = 235
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbrgTipoSit: TDBRadioGroup
        Left = 164
        Top = 127
        Width = 109
        Height = 82
        Caption = 'Tipo'
        DataField = 'TIPOSIT'
        DataSource = ds
        Items.Strings = (
          'Ativo(a)'
          'Afastado(a)'
          'Demitido(a)')
        TabOrder = 2
        Values.Strings = (
          'A'
          'F'
          'D')
      end
      object DBEdit4: TDBEdit
        Left = 308
        Top = 94
        Width = 64
        Height = 21
        DataField = 'CODMOVFGTS'
        DataSource = ds
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 308
        Top = 47
        Width = 64
        Height = 21
        DataField = 'CODCAGED'
        DataSource = ds
        TabOrder = 3
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 429
      Height = 241
      Selected.Strings = (
        'IDSITFUNC'#9'6'#9'Código'
        'DESCRICAO'#9'30'#9'Descrição'
        'TIPOSIT'#9'3'#9'Tipo'
        'CODCAGED'#9'3'#9'Cód.CAGED'
        'CODMOVFGTS'#9'3'#9'Mov.FGTS')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 437
  end
  inherited Dock971: TDock97
    Top = 296
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 274
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      DockPos = 106
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      '  IDSITFUNC, DESCRICAO, TIPOSIT, FLGINTERNO,'
      '  CODCAGED, CODMOVFGTS, FLGUSO'
      'FROM'
      '  SITFUNC'
      'WHERE'
      '  (FLGUSO IN ('#39'G'#39','#39'R'#39'))'
      'ORDER BY'
      '  IDSITFUNC')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITFUNC'
      'set'
      '  IDSITFUNC = :IDSITFUNC,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPOSIT = :TIPOSIT,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  CODCAGED = :CODCAGED,'
      '  CODMOVFGTS = :CODMOVFGTS,'
      '  FLGUSO = :FLGUSO'
      'where'
      '  IDSITFUNC = :OLD_IDSITFUNC')
    InsertSQL.Strings = (
      'insert into SITFUNC'
      
        '  (IDSITFUNC, DESCRICAO, TIPOSIT, FLGINTERNO, CODCAGED, CODMOVFG' +
        'TS, FLGUSO)'
      'values'
      
        '  (:IDSITFUNC, :DESCRICAO, :TIPOSIT, :FLGINTERNO, :CODCAGED, :CO' +
        'DMOVFGTS, '
      '   :FLGUSO)')
    DeleteSQL.Strings = (
      'delete from SITFUNC'
      'where'
      '  IDSITFUNC = :OLD_IDSITFUNC')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situações Funcionais'
    Colunas.Strings = (
      'SITFUNC.IDSITFUNC'
      'SITFUNC.DESCRICAO')
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
      'SITFUNC')
    CamposChave.Strings = (
      'SITFUNC.IDSITFUNC')
    Filtro.Strings = (
      'FLGUSO IN ('#39'G'#39','#39'R'#39')')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '35')
    ExibePergunta = False
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
