inherited FrmCadClassInstFin: TFrmCadClassInstFin
  Left = 214
  Top = 176
  HelpContext = 790111
  ClientHeight = 252
  ClientWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 16
    Top = 112
    Width = 58
    Height = 13
    Caption = 'Descrição'
  end
  inherited pnlFundo: TPanel
    Width = 430
    Height = 166
    inherited Bevel2: TBevel
      Width = 428
    end
    object Label1: TLabel [1]
      Left = 22
      Top = 55
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDescricao
    end
    object Label6: TLabel [2]
      Left = 352
      Top = 107
      Width = 55
      Height = 13
      Caption = 'Limite (%)'
    end
    object Label3: TLabel [3]
      Left = 20
      Top = 107
      Width = 29
      Height = 13
      Caption = 'Sigla'
      FocusControl = edDescricao
    end
    inherited pnlTitulo: TPanel
      Width = 428
      TabOrder = 3
      inherited lbNomItem: TfcLabel
        Width = 386
        Caption = 'Classificação de Instituição Financeira'
      end
    end
    object edDescricao: TDBEdit
      Left = 20
      Top = 73
      Width = 388
      Height = 21
      DataField = 'DESCCLASSINSTFIN'
      DataSource = ds
      TabOrder = 0
    end
    object dbLimite: TDBRealEdit
      Left = 262
      Top = 123
      Width = 146
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERCLIMINSTFIN'
      DataSource = ds
    end
    object edSigla: TDBEdit
      Left = 20
      Top = 124
      Width = 220
      Height = 21
      DataField = 'SIGLACLASSINSTFIN'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 430
  end
  inherited Dock971: TDock97
    Top = 213
    Width = 430
    inherited tb97Fundo: TToolbar97
      Left = 258
      DockPos = 769
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 89
      DockPos = 600
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 371
  end
  inherited ds: TwwDataSource
    Left = 364
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSINSTFIN'
      'set'
      '  IDCLASSINSTFIN = :IDCLASSINSTFIN,'
      '  DESCCLASSINSTFIN = :DESCCLASSINSTFIN,'
      '  SIGLACLASSINSTFIN = :SIGLACLASSINSTFIN,'
      '  PERCLIMINSTFIN = :PERCLIMINSTFIN'
      'where'
      '  IDCLASSINSTFIN = :OLD_IDCLASSINSTFIN')
    InsertSQL.Strings = (
      'insert into CLASSINSTFIN'
      
        '  (IDCLASSINSTFIN, DESCCLASSINSTFIN, SIGLACLASSINSTFIN, PERCLIMI' +
        'NSTFIN)'
      'values'
      
        '  (:IDCLASSINSTFIN, :DESCCLASSINSTFIN, :SIGLACLASSINSTFIN, :PERC' +
        'LIMINSTFIN)')
    DeleteSQL.Strings = (
      'delete from CLASSINSTFIN'
      'where'
      '  IDCLASSINSTFIN = :OLD_IDCLASSINSTFIN')
    Left = 393
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSINSTFIN.SIGLACLASSINSTFIN'
      'CLASSINSTFIN.DESCCLASSINSTFIN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Descrição')
    Tabelas.Strings = (
      'CLASSINSTFIN')
    CamposChave.Strings = (
      'CLASSINSTFIN.IDCLASSINSTFIN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Left = 253
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 265
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 278
    Top = 10
  end
  inherited qry: TwwQuery
    Tag = 0
    SQL.Strings = (
      'SELECT IDCLASSINSTFIN, DESCCLASSINSTFIN, '
      
        '               SIGLACLASSINSTFIN, PERCLIMINSTFIN                ' +
        ' '
      'FROM CLASSINSTFIN'
      'WHERE IDCLASSINSTFIN = :CLASSIFICACAO')
    Left = 335
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLASSIFICACAO'
        ParamType = ptUnknown
      end>
    object qryIDCLASSINSTFIN: TFloatField
      FieldName = 'IDCLASSINSTFIN'
      Origin = 'CLASSINSTFIN.IDCLASSINSTFIN'
    end
    object qryDESCCLASSINSTFIN: TStringField
      FieldName = 'DESCCLASSINSTFIN'
      Origin = 'CLASSINSTFIN.DESCCLASSINSTFIN'
      Size = 30
    end
    object qrySIGLACLASSINSTFIN: TStringField
      FieldName = 'SIGLACLASSINSTFIN'
      Origin = 'CLASSINSTFIN.SIGLACLASSINSTFIN'
      Size = 6
    end
    object qryPERCLIMINSTFIN: TFloatField
      FieldName = 'PERCLIMINSTFIN'
      Origin = 'CLASSINSTFIN.PERCLIMINSTFIN'
    end
  end
end
