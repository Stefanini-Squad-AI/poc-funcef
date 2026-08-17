inherited frmcadTabelaGenerica: TfrmcadTabelaGenerica
  Left = 144
  Top = 67
  HelpContext = 450015
  Caption = 'Cadastro de Tabelas Genericas'
  ClientHeight = 428
  ClientWidth = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 619
    Height = 342
    inherited pnlMestre: TPanel
      Width = 617
      Height = 53
      object Label1: TLabel
        Left = 5
        Top = 4
        Width = 101
        Height = 13
        Caption = 'Código da Tabela'
      end
      object Label2: TLabel
        Left = 133
        Top = 4
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dedCodigo: TwwDBEdit
        Left = 5
        Top = 18
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTABELA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dedCodigoExit
      end
      object dedDescricao: TwwDBEdit
        Left = 133
        Top = 18
        Width = 469
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Width = 617
      Height = 287
      Tabs.Strings = (
        'Linhas'
        'Campos'
        'Formulas'
        'Regras')
      TabIndex = 1
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdCampos'
        'dbrgFormulas'
        'dbrgRegras')
      inherited pgctrlDetalhe: TPageControl
        Width = 519
        Height = 228
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 511
            Height = 200
            Selected.Strings = (
              'NUMLINHA'#9'10'#9'Registro'
              'CODCAMPO'#9'15'#9'Campo'
              'VALOR'#9'60'#9'Valor')
            DataSource = dsDetalhe
          end
          inherited pnlControlesDet: TPanel
            Width = 511
            Height = 200
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 32
              Height = 13
              Caption = 'Linha'
            end
            object DBText1: TDBText
              Left = 8
              Top = 24
              Width = 42
              Height = 13
              AutoSize = True
              DataField = 'NUMLINHA'
              DataSource = dsDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 182
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Campo'
            end
            object DBText2: TDBText
              Left = 182
              Top = 24
              Width = 42
              Height = 13
              AutoSize = True
              DataField = 'CODCAMPO'
              DataSource = dsDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Top = 64
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label9: TLabel
              Left = 72
              Top = 8
              Width = 86
              Height = 13
              Caption = 'Tipo de Campo'
            end
            object DBText3: TDBText
              Left = 72
              Top = 24
              Width = 42
              Height = 13
              AutoSize = True
              DataField = 'NOMETIPODADO'
              DataSource = dsTpDado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dedValor: TwwDBEdit
              Left = 8
              Top = 80
              Width = 289
              Height = 21
              DataField = 'VALOR'
              DataSource = dsDetalhe
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsCampos: TTabSheet
          Caption = 'Campos'
          object pnlControlesCampos: TPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 200
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label3: TLabel
              Left = 8
              Top = 8
              Width = 100
              Height = 13
              Caption = 'Codigo do Campo'
            end
            object Label4: TLabel
              Left = 8
              Top = 48
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label5: TLabel
              Left = 8
              Top = 90
              Width = 78
              Height = 13
              Caption = 'Tipo de Dado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object wwDBEdit1: TwwDBEdit
              Left = 8
              Top = 24
              Width = 153
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCAMPO'
              DataSource = dsCampos
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit2: TwwDBEdit
              Left = 8
              Top = 64
              Width = 369
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsCampos
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkcmbTipo: TwwDBLookupCombo
              Left = 8
              Top = 106
              Width = 225
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMETIPODADO'#9'60'#9'Tipo de Dado')
              DataField = 'IDTIPODADO'
              DataSource = dsCampos
              LookupTable = qryTpDado
              LookupField = 'IDTIPODADO'
              Options = [loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object dbgrdCampos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 511
            Height = 200
            Selected.Strings = (
              'CODCAMPO'#9'17'#9'Código do Campo'
              'DESCRICAO'#9'60'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCampos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsFormulas: TTabSheet
          Caption = 'Formulas'
          object dbrgFormulas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 508
            Height = 152
            Selected.Strings = (
              'IDFORMULA'#9'10'#9'Identificador'
              'DESCRICAOFORMULA'#9'60'#9'Descrição'
              'EXPRESSAOREAL'#9'255'#9'Expressão')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFormulas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsRegras: TTabSheet
          Caption = 'Regras'
          object dbgrRegras: TwwDBGrid
            Left = 0
            Top = 0
            Width = 508
            Height = 152
            Selected.Strings = (
              'IDREGRA'#9'10'#9'Identificador'
              'NOMEREGRA'#9'60'#9'Nome da Regra')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRegras
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 609
        object Toolbar972: TToolbar97
          Left = 79
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 79
          TabOrder = 1
          object SbtnAtualizar: TSpeedButton
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Atualizar dados na Tabela'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000014000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777888888
              7777777700007487784444448877777700007448844444444487777700007444
              444CCCCC444877770000744444C77777C444877700007444447777777C448777
              00007444444777777C88877700007CCCCCCC7777777777770000777777777777
              7777777700007777777777778888887700007C888777777C4444487700007C44
              87777777C4444877000077C44877777884444877000077C44488888444444877
              0000777C4444444444CC487700007777CC444444CC77C7770000777777CCCCCC
              777777770000777777777777777777770000}
            Layout = blGlyphTop
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = SbtnAtualizarClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 523
        Height = 228
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
          end
        end
      end
      object nbk: TNotebook
        Left = 4
        Top = 55
        Width = 519
        Height = 228
        Align = alClient
        TabOrder = 3
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object dbgrTabela: TDBGrid
            Left = 0
            Top = 0
            Width = 519
            Height = 228
            Align = alClient
            Ctl3D = True
            DataSource = dsLinhas
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 619
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 619
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 450015
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
  end
  inherited dsDet: TwwDataSource
    Left = 487
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDMODULO = :IDMODULO,  '
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    InsertSQL.Strings = (
      'insert into TABGENER'
      '  (CODTABELA, DESCRICAO, IDMODULO, IDPESSOA)'
      'values'
      '  (:CODTABELA, :DESCRICAO, :IDMODULO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from TABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TABGENER .CODTABELA'
      'TABGENER .DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Codigo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TABGENER '
      'TABGENERUSUARIO')
    CamposChave.Strings = (
      'TABGENER .CODTABELA')
    Filtro.Strings = (
      'TABGENER .CODTABELA = TABGENERUSUARIO.CODTABELA'
      'TABGENERUSUARIO.FLGPROCURAR = 1')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    ExibePergunta = False
    Left = 381
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  T.CODTABELA, T.DESCRICAO, T.IDMODULO, T.IDPESSOA,'
      '  TU.FLGALTERAR, TU.FLGEXCLUIR, TU.FLGPROCURAR'
      'FROM'
      '  TABGENER T, TABGENERUSUARIO TU'
      'WHERE'
      '  T.CODTABELA = :COD AND'
      '  T.CODTABELA = TU.CODTABELA'
      '')
    Left = 312
    Top = 0
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update VALTABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  NUMLINHA = :NUMLINHA,'
      '  CODCAMPO = :CODCAMPO,'
      '  VALOR = :VALOR'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  NUMLINHA = :OLD_NUMLINHA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    InsertSQL.Strings = (
      'insert into VALTABGENER'
      '  (CODTABELA, NUMLINHA, CODCAMPO, VALOR)'
      'values'
      '  (:CODTABELA, :NUMLINHA, :CODCAMPO, :VALOR)')
    DeleteSQL.Strings = (
      'delete from VALTABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  NUMLINHA = :OLD_NUMLINHA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    Left = 309
    Top = 204
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTABELA, NUMLINHA, CODCAMPO, VALOR'
      'FROM'
      '    VALTABGENER'
      'WHERE'
      '     CODTABELA = :COD'
      'ORDER BY'
      '      NUMLINHA, CODCAMPO')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 277
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object QryCampos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTABELA, CODCAMPO, DESCRICAO, IDTIPODADO'
      'FROM'
      '    CAMPOTABGENER'
      'WHERE'
      '     CODTABELA = :COD'
      'ORDER BY'
      '      CODCAMPO')
    UpdateObject = updCampos
    ValidateWithMask = True
    Left = 85
    Top = 295
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object updCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update CAMPOTABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  CODCAMPO = :CODCAMPO,'
      '  IDTIPODADO = :IDTIPODADO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    InsertSQL.Strings = (
      'insert into CAMPOTABGENER'
      '  (CODTABELA, CODCAMPO, IDTIPODADO, DESCRICAO)'
      'values'
      '  (:CODTABELA, :CODCAMPO, :IDTIPODADO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CAMPOTABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  CODCAMPO = :OLD_CODCAMPO')
    Left = 117
    Top = 295
  end
  object dsCampos: TwwDataSource
    DataSet = QryCampos
    Left = 149
    Top = 295
  end
  object qryTpDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPODADO, NOMETIPODADO'
      'FROM'
      '    TIPODADO'
      '')
    ValidateWithMask = True
    Left = 86
    Top = 224
  end
  object dsTpDado: TwwDataSource
    DataSet = qryTpDado
    Left = 121
    Top = 224
  end
  object dsDetalhe: TwwDataSource
    DataSet = QryDetalhe
    OnDataChange = dsDetalheDataChange
    Left = 341
    Top = 204
  end
  object QryLinhas: TwwQuery
    CachedUpdates = True
    AfterInsert = QryLinhasAfterInsert
    AfterPost = QryLinhasAfterPost
    DatabaseName = 'BaseDados'
    UpdateObject = updLinha
    ValidateWithMask = True
    Left = 269
    Top = 295
  end
  object dsLinhas: TwwDataSource
    DataSet = QryLinhas
    OnDataChange = dsLinhasDataChange
    Left = 301
    Top = 295
  end
  object updLinha: TUpdateSQL
    Left = 237
    Top = 295
  end
  object QryFormulas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDFORMULA, DESCRICAOFORMULA, EXPRESSAOREAL'
      'FROM'
      '  FORMULA'
      'WHERE'
      '  ('
      '   (EXPRESSAOREAL LIKE '#39'TABGENERICA%'#39') OR'
      '   (EXPRESSAOREAL LIKE '#39'CONSULTA%'#39')'
      '  ) AND'
      '  (EXPRESSAOREAL LIKE :COD)'
      'ORDER BY'
      '  DESCRICAOFORMULA'
      '')
    ValidateWithMask = True
    Left = 461
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object QryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      #9'R.IDREGRA, R.NOMEREGRA'
      'FROM'
      #9'REGRA R,'
      '        (SELECT'
      '               A.IDREGRA'
      '        FROM'
      '            ALGREGRA A, ( SELECT'
      '                               IDFORMULA, DESCRICAOFORMULA'
      '                          FROM'
      '                              FORMULA'
      '                          WHERE'
      
        '                               ((EXPRESSAOREAL LIKE '#39'TABGENERICA' +
        '%'#39') OR'
      
        '                               (EXPRESSAOREAL LIKE '#39'CONSULTA%'#39'))' +
        ' AND'
      '                               (EXPRESSAOREAL LIKE :COD)'
      '                          GROUP BY'
      '                                IDFORMULA, DESCRICAOFORMULA) F'
      '        WHERE'
      '             (A.FORMULA1 = F.IDFORMULA) AND (A.TIPOCAMPO2 = 4)'
      '        GROUP BY'
      '              A.IDREGRA) X'
      'WHERE'
      #9'X.IDREGRA = R.IDREGRA'
      'ORDER BY'
      #9'R.NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 413
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object dsRegras: TwwDataSource
    DataSet = QryRegras
    Left = 413
    Top = 228
  end
  object dsFormulas: TwwDataSource
    DataSet = QryFormulas
    Left = 493
    Top = 268
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 300
    Top = 58
  end
  object dsAux: TwwDataSource
    AutoEdit = False
    DataSet = qryAux
    Left = 328
    Top = 58
  end
end
