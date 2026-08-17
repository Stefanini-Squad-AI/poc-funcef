inherited frmCadOrcamTrein1: TfrmCadOrcamTrein1
  Left = 303
  Top = 145
  Width = 439
  Height = 418
  Caption = 'Orçamento Anual por Curso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 431
  end
  inherited Dock971: TDock97 [1]
    Top = 352
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 261
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 94
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 431
    Height = 305
    inherited pnlControles: TPanel
      Top = 64
      Width = 421
      Height = 236
      object Label5: TLabel
        Left = 235
        Top = 6
        Width = 129
        Height = 13
        Caption = 'Carga Horária Prevista'
      end
      object Label3: TLabel
        Left = 54
        Top = 6
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object Label4: TLabel
        Left = 235
        Top = 90
        Width = 83
        Height = 13
        Caption = 'Custo Previsto'
      end
      object Label6: TLabel
        Left = 54
        Top = 90
        Width = 69
        Height = 13
        Caption = 'Ocorrências'
      end
      object Label1: TLabel
        Left = 54
        Top = 182
        Width = 152
        Height = 13
        Caption = 'Centro de Custo (opcional)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbCCusto: TwwDBLookupCombo
        Left = 54
        Top = 200
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTROCUSTO'#9'10'#9'Código')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = qryCCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbspeAno: TwwDBSpinEdit
        Left = 54
        Top = 24
        Width = 69
        Height = 21
        Increment = 1
        Value = 2000
        DataField = 'ANO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object ednHoras: TEditNum
        Left = 235
        Top = 24
        Width = 129
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        IntDigits = 0
        Signal = False
        DecDigits = 0
        Numeric = True
        Alignment = taRightJustify
      end
      object redCusto: TRealEdit
        Left = 235
        Top = 108
        Width = 129
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbedOcor: TDBRealEdit
        Left = 54
        Top = 108
        Width = 69
        Height = 21
        Hint = 'Número de Inscrições Previstas no Ano Acima'
        Alignment = taRightJustify
        Lines.Strings = (
          '         1')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        WordWrap = False
        OnChange = dbedOcorChange
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'OCORRENCIAS'
        DataSource = ds
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 64
      Width = 421
      Height = 236
      Selected.Strings = (
        'ANO'#9'9'#9'Ano'
        'CODCENTROCUSTO'#9'13'#9'Centro de Custo'
        'OCORRENCIAS'#9'24'#9'Quantidade de Ocorrências')
      TabOrder = 2
      UseTFields = False
    end
    object gbxGrupoFunc: TGroupBox
      Left = 5
      Top = 5
      Width = 421
      Height = 59
      Align = alTop
      Caption = 'Curso'
      TabOrder = 1
      object dbedDescricao: TwwDBEdit
        Left = 11
        Top = 22
        Width = 400
        Height = 21
        TabStop = False
        DataField = 'DESCRICAO'
        DataSource = ds2
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = tblOrcamTrein
    Left = 257
    Top = 11
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 273
    Top = 64
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 360
    Top = 60
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = tblCurso
    Left = 147
    Top = 126
  end
  object tblCurso: TwwTable
    AfterScroll = tblCursoAfterScroll
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 183
    Top = 124
  end
  object tblOrcamTrein: TwwTable
    AfterInsert = tblOrcamTreinAfterInsert
    AfterScroll = tblOrcamTreinAfterScroll
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = ds2
    TableName = 'CM.ORCAMTREIN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 303
    Top = 10
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NOME, CODCENTROCUSTO from CENTCUST'
      'where IDEMPRESA = :IdEmpresa'
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 372
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresa'
        ParamType = ptUnknown
      end>
    object qryCCustoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object qryCCustoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 368
    Top = 1
  end
end
