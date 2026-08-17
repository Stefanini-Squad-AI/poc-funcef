inherited FrmCadTipoAcao: TFrmCadTipoAcao
  Left = 372
  Top = 146
  HelpContext = 790066
  ClientHeight = 299
  ClientWidth = 395
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 280
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Label1'
  end
  inherited pnlFundo: TPanel
    Width = 395
    Height = 213
    inherited Bevel2: TBevel
      Width = 393
    end
    inherited pnlTitulo: TPanel
      Width = 393
      TabOrder = 1
      inherited lbNomItem: TfcLabel
        Width = 145
        Caption = 'Tipos de Ação'
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 56
      Width = 361
      Height = 145
      Caption = ' Tipo de Ação '
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 59
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbeCodigo
      end
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Descrição '
        FocusControl = dbeDescricao
      end
      object Label20: TLabel
        Left = 100
        Top = 59
        Width = 198
        Height = 13
        Caption = 'Indicador de Quantidade de Ações'
      end
      object dbeCodigo: TDBEdit
        Left = 8
        Top = 75
        Width = 57
        Height = 21
        DataField = 'CODTIPOACAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbeDescricao: TDBEdit
        Left = 8
        Top = 32
        Width = 342
        Height = 21
        DataField = 'DESCTIPOACAO'
        DataSource = ds
        TabOrder = 0
      end
      object DblkcIndicador: TwwDBLookupCombo
        Left = 99
        Top = 75
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPARAMEMISSOR'#9'40'#9'Indicadores')
        DataField = 'IDPARAMEMISSOR'
        DataSource = ds
        LookupTable = qryIndicador
        LookupField = 'IDPARAMEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object DbCkVoto: TDBCheckBox
        Left = 8
        Top = 112
        Width = 113
        Height = 17
        Caption = 'Direito a Voto'
        DataField = 'FLGVOTO'
        DataSource = ds
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 395
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 223
      DockPos = 226
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 54
      DockPos = 57
    end
    object dbnav: TDBNavigator
      Left = 9
      Top = 3
      Width = 112
      Height = 31
      DataSource = ds
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 229
    Top = 56
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOACAO'
      'set'
      '  CODTIPOACAO = :CODTIPOACAO,'
      '  DESCTIPOACAO = :DESCTIPOACAO,'
      '  IDPARAMEMISSOR = :IDPARAMEMISSOR,'
      '  FLGVOTO = :FLGVOTO'
      'where'
      '  CODTIPOACAO = :OLD_CODTIPOACAO')
    InsertSQL.Strings = (
      'insert into TIPOACAO'
      '  (CODTIPOACAO, DESCTIPOACAO, IDPARAMEMISSOR, FLGVOTO)'
      'values'
      '  (:CODTIPOACAO, :DESCTIPOACAO, :IDPARAMEMISSOR, :FLGVOTO)')
    DeleteSQL.Strings = (
      'delete from TIPOACAO'
      'where'
      '  CODTIPOACAO = :OLD_CODTIPOACAO')
    Left = 257
    Top = 56
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DESCTIPOACAO'
      'CODTIPOACAO'
      'FLGVOTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição '
      'Código'
      'Voto')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOACAO')
    CamposChave.Strings = (
      'CODTIPOACAO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '0'
      '0'
      '0')
    Left = 301
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 241
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
    Top = 1
  end
  inherited qry: TwwQuery
    Tag = 0
    RequestLive = True
    SQL.Strings = (
      'SELECT CODTIPOACAO,DESCTIPOACAO, IDPARAMEMISSOR, FLGVOTO'
      'FROM TIPOACAO '
      'WHERE CODTIPOACAO = :pCODTIPOACAO'
      'ORDER BY DESCTIPOACAO ')
    Left = 285
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODTIPOACAO'
        ParamType = ptUnknown
      end>
    object QryTipoAcaoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'TIPOACAO.CODTIPOACAO'
      Size = 5
    end
    object QryTipoAcaoDESCTIPOACAO: TStringField
      FieldName = 'DESCTIPOACAO'
      Origin = 'TIPOACAO.DESCTIPOACAO'
      Size = 60
    end
    object QryTipoAcaoIDPARAMEMISSOR: TFloatField
      FieldName = 'IDPARAMEMISSOR'
      Origin = 'TIPOACAO.IDPARAMEMISSOR'
    end
    object QryTipoAcaoFLGVOTO: TStringField
      FieldName = 'FLGVOTO'
      Origin = 'TIPOACAO.FLGVOTO'
      Size = 1
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 318
    Top = 56
  end
  object qryIndicador: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select          PE.IdparamEmissor,'
      '                   PE.DescParamEmissor'
      'from            paramemissor PE'
      'order by  PE.DescParamEmissor')
    ValidateWithMask = True
    Left = 322
    Top = 170
    object qryIndicadorIDPARAMEMISSOR: TFloatField
      FieldName = 'IDPARAMEMISSOR'
      Origin = 'PARAMEMISSOR.IDPARAMEMISSOR'
    end
    object qryIndicadorDESCPARAMEMISSOR: TStringField
      FieldName = 'DESCPARAMEMISSOR'
      Origin = 'PARAMEMISSOR.DESCPARAMEMISSOR'
      Size = 60
    end
  end
  object srchdlgProcura: TwwSearchDialog
    GridTitleAlignment = taLeftJustify
    GridColor = clWhite
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    Caption = 'Search'
    MaxWidth = 0
    MaxHeight = 209
    CharCase = ecNormal
    Left = 365
    Top = 1
  end
  object seldlgProcuraQry: TcmSelectDlg
    SearchControls = False
    AlwaysShow = False
    HelpContext = 0
    Left = 333
    Top = 1
  end
end
