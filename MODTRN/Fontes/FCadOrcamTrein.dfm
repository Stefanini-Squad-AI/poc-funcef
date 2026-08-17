inherited frmCadOrcamTrein: TfrmCadOrcamTrein
  Left = 217
  Top = 91
  Caption = 'Orçamento Anual por Curso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 489
      Height = 36
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 33
        Height = 13
        Caption = 'Curso'
      end
      object dbedDescricao: TwwDBEdit
        Left = 48
        Top = 7
        Width = 434
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 40
      Width = 489
      Height = 294
      Tabs.Strings = (
        'Orçamentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 391
        Height = 235
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 383
            Height = 207
            Selected.Strings = (
              'ANO'#9'10'#9'Ano'
              'CODCENTROCUSTO'#9'18'#9'Centro de Custo'#9'F'
              'OCORRENCIAS'#9'27'#9'Quantidade de Ocorrências')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 383
            Height = 207
            object Label3: TLabel
              Left = 38
              Top = 9
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object Label6: TLabel
              Left = 38
              Top = 90
              Width = 69
              Height = 13
              Caption = 'Ocorrências'
            end
            object Label2: TLabel
              Left = 38
              Top = 170
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
            object Label5: TLabel
              Left = 219
              Top = 9
              Width = 129
              Height = 13
              Caption = 'Carga Horária Prevista'
            end
            object Label4: TLabel
              Left = 219
              Top = 90
              Width = 83
              Height = 13
              Caption = 'Custo Previsto'
            end
            object dbspeAno: TwwDBSpinEdit
              Left = 38
              Top = 24
              Width = 69
              Height = 21
              Increment = 1
              DataField = 'ANO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dbedOcor: TDBRealEdit
              Left = 38
              Top = 105
              Width = 69
              Height = 21
              Hint = 'Número de Inscrições Previstas no Ano Acima'
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              OnChange = dbedOcorChange
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'OCORRENCIAS'
              DataSource = dsDet
            end
            object cmbCCusto: TwwDBLookupCombo
              Left = 38
              Top = 186
              Width = 313
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = qryCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object ednHoras: TEditNum
              Left = 219
              Top = 24
              Width = 129
              Height = 21
              TabStop = False
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              IntDigits = 0
              Signal = False
              DecDigits = 0
              Numeric = True
              Alignment = taRightJustify
            end
            object redCusto: TRealEdit
              Left = 219
              Top = 105
              Width = 129
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 481
      end
      inherited Dock974: TDock97
        Left = 395
        Height = 235
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 328
      DockPos = 335
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 161
      DockPos = 162
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDCURSO, DESCRICAO, DUR_TEOR,'
      '  DUR_PRAT, VALOR '
      'FROM'
      '  CURSO'
      'WHERE'
      '  (IDCURSO = :IDCURSO)'
      ' ')
    Left = 191
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 329
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 444
    Top = 51
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 163
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    Left = 444
    Top = 38
  end
  inherited ds: TwwDataSource
    Left = 219
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 444
    Top = 25
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 444
    Top = 13
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 444
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDORCAMTREIN, IDEMPRESA, CODCENTROCUSTO,'
      '  IDCURSO, ANO, OCORRENCIAS'
      'FROM'
      '  ORCAMTREIN'
      'WHERE'
      '  (IDCURSO = :IDCURSO)'
      'ORDER BY'
      '  ANO, CODCENTROCUSTO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 294
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ORCAMTREIN'
      'set'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDCURSO = :IDCURSO,'
      '  ANO = :ANO,'
      '  OCORRENCIAS = :OCORRENCIAS'
      'where'
      '  IDORCAMTREIN = :OLD_IDORCAMTREIN')
    InsertSQL.Strings = (
      'insert into ORCAMTREIN'
      '  (IDORCAMTREIN, IDEMPRESA, CODCENTROCUSTO, IDCURSO, ANO, '
      'OCORRENCIAS)'
      'values'
      '  (:IDORCAMTREIN, :IDEMPRESA, :CODCENTROCUSTO, :IDCURSO, :ANO, '
      ':OCORRENCIAS)')
    DeleteSQL.Strings = (
      'delete from ORCAMTREIN'
      'where'
      '  IDORCAMTREIN = :OLD_IDORCAMTREIN')
    Left = 258
    Top = 1
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NOME, CODCENTROCUSTO from CENTCUST'
      'where IDEMPRESA = :IdEmpresa'
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 380
    Top = 1
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
end
