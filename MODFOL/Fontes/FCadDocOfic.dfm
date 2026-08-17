inherited frmCadDocOfic: TfrmCadDocOfic
  Left = 280
  Top = 166
  Width = 442
  Height = 314
  BorderStyle = bsSizeable
  Caption = 'Documentos Oficiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 426
      Height = 193
      object Label1: TLabel
        Left = 67
        Top = 14
        Width = 80
        Height = 13
        Caption = 'Código Oficial'
      end
      object Label2: TLabel
        Left = 67
        Top = 71
        Width = 115
        Height = 13
        Caption = 'Sigla do Documento'
      end
      object Label3: TLabel
        Left = 67
        Top = 133
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 67
        Top = 35
        Width = 52
        Height = 21
        DataField = 'CODDOCUMENTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 67
        Top = 92
        Width = 172
        Height = 21
        DataField = 'SIGLADOCUMENTO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcTipoDoc: TwwDBLookupCombo
        Left = 67
        Top = 154
        Width = 295
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
        DataField = 'IDDOCUMENTO'
        DataSource = ds
        LookupTable = qryTipoDoc
        LookupField = 'IDDOCUMENTO'
        Style = csDropDownList
        Frame.FocusStyle = efsFrameEtched
        Frame.NonFocusStyle = efsFrameSunken
        ImageList = ImlPadrao
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = []
        AllowClearKey = True
        OnChange = dblcTipoDocChange
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 426
      Height = 193
      Selected.Strings = (
        'CODDOCUMENTO'#9'3'#9'Código Oficial'
        'SIGLADOCUMENTO'#9'15'#9'Sigla'
        'NOMEDOCUMENTO'#9'30'#9'Tipo de Documento')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 434
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 264
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      DockPos = 96
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      '  TDO.CODDOCUMENTO,'
      '  TDO.IDDOCUMENTO,'
      '  TDO.SIGLADOCUMENTO,'
      '  DP.NOMEDOCUMENTO'
      'FROM'
      '  TIPODOCOFICIAL TDO, TIPODOCPESSOA DP'
      'WHERE'
      '  (TDO.IDDOCUMENTO = DP.IDDOCUMENTO(+))'
      'ORDER BY'
      '  TDO.CODDOCUMENTO')
    Left = 272
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCOFICIAL'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  SIGLADOCUMENTO = :SIGLADOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into TIPODOCOFICIAL'
      '  (CODDOCUMENTO, IDDOCUMENTO, SIGLADOCUMENTO)'
      'values'
      '  (:CODDOCUMENTO, :IDDOCUMENTO, :SIGLADOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from TIPODOCOFICIAL'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 244
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Documentos Oficiais'
    Colunas.Strings = (
      'TIPODOCOFICIAL.CODDOCUMENTO'
      'TIPODOCOFICIAL.SIGLADOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPODOCOFICIAL')
    CamposChave.Strings = (
      'TIPODOCOFICIAL.CODDOCUMENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '3'
      '15')
    Left = 149
  end
  inherited ds: TwwDataSource
    Left = 300
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM'
      '  TIPODOCPESSOA'
      'ORDER BY'
      '  UPPER(NOMEDOCUMENTO)')
    ValidateWithMask = True
    Left = 283
    Top = 54
  end
end
