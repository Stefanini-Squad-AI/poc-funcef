inherited frmCadParamCAFxContab: TfrmCadParamCAFxContab
  Left = 43
  Top = 101
  HelpContext = 70018
  Caption = 'Parametrização Contábil do Ativo Fixo'
  ClientHeight = 411
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 325
    inherited pnlMestre: TPanel
      Width = 721
      Height = 60
      BevelInner = bvRaised
      object lblGrupo: TLabel
        Left = 8
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object lblTipoMov: TLabel
        Left = 376
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Tipo de Movimentação'
      end
      object dbcGrupo: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'#9'No'
          'CLASSE'#9'15'#9'CLASSE'#9'No')
        DataField = 'IDGRUPO'
        DataSource = ds
        LookupTable = qryGrupo
        LookupField = 'IDGRUPO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dbcTipoMovimentacao: TwwDBLookupCombo
        Left = 376
        Top = 24
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOMOVIMENTACAO'#9'40'#9'Descrição')
        DataField = 'IDTIPOMOVIMENTACAO'
        DataSource = ds
        LookupTable = qryTipoMovimentacao
        LookupField = 'IDTIPOMOVIMENTACAO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 65
      Width = 721
      Height = 255
      Tabs.Strings = (
        'Contas Contábeis')
      inherited pgctrlDetalhe: TPageControl
        Width = 623
        Height = 196
        inherited tbsDet: TTabSheet
          Caption = 'Contas Contábeis'
          inherited pnlControlesDet: TPanel [0]
            Width = 615
            Height = 168
            object spdContaContabil: TSpeedButton
              Left = 168
              Top = 72
              Width = 24
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilClick
            end
            object Label1: TLabel
              Left = 8
              Top = 56
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object Label2: TLabel
              Left = 200
              Top = 0
              Width = 94
              Height = 13
              Caption = 'Plano de Contas'
            end
            object lblTitCentroCusto: TLabel
              Left = 8
              Top = 112
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object bbtnSelCentroCusto: TSpeedButton
              Left = 168
              Top = 128
              Width = 24
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
              ParentFont = False
              OnClick = bbtnSelCentroCustoClick
            end
            object grbCentroCusto: TGroupBox
              Left = 200
              Top = 112
              Width = 408
              Height = 40
              Caption = ' Descrição do Centro de Custo '
              TabOrder = 6
              object lblCentroCusto: TLabel
                Left = 8
                Top = 16
                Width = 392
                Height = 17
                AutoSize = False
              end
            end
            object edPlanoConta: TEdit
              Left = 200
              Top = 16
              Width = 409
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object gbDescrConta: TGroupBox
              Left = 200
              Top = 56
              Width = 408
              Height = 40
              Caption = ' Descrição da Conta '
              TabOrder = 2
              object lblDescricaoConta: TLabel
                Left = 8
                Top = 16
                Width = 392
                Height = 17
                AutoSize = False
              end
            end
            object dbeContaContabil: TwwDBEdit
              Left = 8
              Top = 72
              Width = 159
              Height = 21
              DataField = 'PLACONTA'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeContaContabilExit
            end
            object dbTipoLanc: TDBRadioGroup
              Left = 8
              Top = 0
              Width = 185
              Height = 41
              Caption = ' Lançamento à '
              Columns = 2
              DataField = 'TIPOLANCAMENTO'
              DataSource = dsDet
              Items.Strings = (
                'Débito'
                'Crédito')
              TabOrder = 1
              Values.Strings = (
                'D'
                'C')
            end
            object treeContaContabil: TCMTreeView
              Left = 200
              Top = 42
              Width = 412
              Height = 183
              PodeNavegar = True
              Mascara = '9.9.99'
              DataSource = dsContaContabil
              CampoChave = qryContaContabilPLACONTA
              CampoDescricao = qryContaContabilPLANOME
              CampoTipo = qryContaContabilPLATIPO
              OnDblClick = treeContaContabilDblClick
              OnExit = treeContaContabilExit
              Visible = False
            end
            object dbeCentroCusto: TwwDBEdit
              Left = 8
              Top = 128
              Width = 159
              Height = 21
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeCentroCustoExit
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 615
            Height = 168
            Selected.Strings = (
              'TIPOLANCAMENTO'#9'12'#9'Lançamento'
              'PLANO'#9'11'#9'Plano Contas'
              'PLACONTA'#9'18'#9'Conta Contábil'
              'PLANOME'#9'40'#9'Descrição'#9'F'
              'CODCENTROCUSTO'#9'11'#9'Centro de Custo')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
          end
        end
      end
      inherited Dock973: TDock97
        Width = 713
      end
      inherited Dock974: TDock97
        Left = 627
        Height = 196
      end
    end
  end
  inherited Dock972: TDock97
    Width = 731
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 561
      DockPos = 673
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70018
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 394
      DockPos = 506
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA,IDGRUPO,IDTIPOMOVIMENTACAO'
      'FROM TIPOSMOVIMENTOGRUPOS'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (IDGRUPO  = :PIDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      '')
    Left = 264
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 592
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 728
    Top = 506
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSMOVIMENTOGRUPOS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    InsertSQL.Strings = (
      'insert into TIPOSMOVIMENTOGRUPOS'
      '  (IDPESSOA, IDGRUPO, IDTIPOMOVIMENTACAO)'
      'values'
      '  (:IDPESSOA, :IDGRUPO, :IDTIPOMOVIMENTACAO)')
    DeleteSQL.Strings = (
      'delete from TIPOSMOVIMENTOGRUPOS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    Left = 328
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Parâmetro Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME'
      'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Grupo'
      'Nome Grupo'
      'Desc. Movimentação'
      'ID Movimentação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'TIPOMOVIMENTACAO'
      'TIPOSMOVIMENTOGRUPOS'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      'TIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO')
    Filtro.Strings = (
      'PLANOGRUPO.IDPESSOA = TIPOSMOVIMENTOGRUPOS.IDPESSOA'
      'PLANOGRUPO.IDGRUPO = TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      
        'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO = TIPOSMOVIMENTOGRUPOS.IDTIP' +
        'OMOVIMENTACAO'
      'TIPOSMOVIMENTOGRUPOS.IDGRUPO = GRUPO.IDGRUPO ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '40'
      '10')
    Left = 392
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 296
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 632
    Top = 496
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 464
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 312
    Top = 104
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDCONTASTIPOSMOV,'
      '       T.IDPESSOA,'
      '       T.IDGRUPO,'
      '       T.IDTIPOMOVIMENTACAO,'
      '       T.TIPOLANCAMENTO,'
      '       T.PLANO,'
      '       T.PLACONTA,'
      '       P.PLANOME,'
      '       T.IDEMPRESA,'
      '       T.CODCENTROCUSTO,'
      '       C.NOME AS DESCCCUSTO'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS T,'
      '     PLANOCONTA P,'
      '     CENTCUST C'
      'WHERE (T.IDPESSOA           = :PIDPESSOA)'
      '  AND (T.IDGRUPO            = :PIDGRUPO)'
      '  AND (T.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      '  AND (T.PLANO = P.PLANO)'
      '  AND (T.PLACONTA = P.PLACONTA)'
      '  AND (T.CODCENTROCUSTO = C.CODCENTROCUSTO(+))'
      '  AND (T.IDEMPRESA = C.IDEMPRESA(+))'
      'ORDER BY T.TIPOLANCAMENTO,T.PLACONTA,T.CODCENTROCUSTO'
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end>
    object qryDetTIPOLANCAMENTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Lançamento'
      DisplayWidth = 12
      FieldName = 'TIPOLANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryDetPLANO: TFloatField
      DisplayLabel = 'Plano Contas'
      DisplayWidth = 11
      FieldName = 'PLANO'
    end
    object qryDetPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryDetPLANOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 11
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryDetIDCONTASTIPOSMOV: TFloatField
      FieldName = 'IDCONTASTIPOSMOV'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryDetIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Visible = False
      Size = 30
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASTIPOSMOVIMENTOGRUPOS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO,'
      '  TIPOLANCAMENTO = :TIPOLANCAMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO'
      'where'
      '  IDCONTASTIPOSMOV = :OLD_IDCONTASTIPOSMOV')
    InsertSQL.Strings = (
      'insert into CONTASTIPOSMOVIMENTOGRUPOS'
      
        '  (IDCONTASTIPOSMOV, IDPESSOA, IDGRUPO, IDTIPOMOVIMENTACAO, TIPO' +
        'LANCAMENTO, '
      '   PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO)'
      'values'
      
        '  (:IDCONTASTIPOSMOV, :IDPESSOA, :IDGRUPO, :IDTIPOMOVIMENTACAO, ' +
        ':TIPOLANCAMENTO, '
      '   :PLANO, :PLACONTA, :IDEMPRESA, :CODCENTROCUSTO)')
    DeleteSQL.Strings = (
      'delete from CONTASTIPOSMOVIMENTOGRUPOS'
      'where'
      '  IDCONTASTIPOSMOV = :OLD_IDCONTASTIPOSMOV')
    Left = 632
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO,G.NOME,G.CLASSE'
      'FROM GRUPO G,PLANOGRUPO P'
      'WHERE (G.TIPO = '#39'A'#39')'
      '  AND (G.STATUS = '#39'A'#39')'
      '  AND (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.IDGRUPO = P.IDGRUPO)'
      'ORDER BY G.CLASSE'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTipoMovimentacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOMOVIMENTACAO,DESCTIPOMOVIMENTACAO,LANCAMENTO,IDCONT' +
        'AB'
      'FROM TIPOMOVIMENTACAO'
      'WHERE LANCAMENTO = '#39'S'#39
      'ORDER BY DESCTIPOMOVIMENTACAO'
      '')
    ValidateWithMask = True
    Left = 624
    Top = 56
    object qryTipoMovimentacaoIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
    object qryTipoMovimentacaoDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryTipoMovimentacaoLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Size = 1
    end
    object qryTipoMovimentacaoIDCONTAB: TFloatField
      FieldName = 'IDCONTAB'
    end
  end
  object dsContaContabil: TwwDataSource
    DataSet = qryContaContabil
    Left = 400
    Top = 119
  end
  object qryContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST'
      'FROM PLANOCONTA'
      'WHERE (PLANO = :PLANO)'
      '  AND (PLAINATIVA = '#39'A'#39')'
      'ORDER BY PLACONTA ')
    ValidateWithMask = True
    Left = 400
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryContaContabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryContaContabilPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE (PLANO = :PPLANO)')
    ValidateWithMask = True
    Left = 400
    Top = 90
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
  end
  object MSCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODREDUZIDO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA'
      'CENTCUST.NOME')
    Filtro.Strings = (
      'CENTCUST.STATUSGRUPOCDC = '#39'A'#39
      'CENTCUST.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 496
    Top = 104
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, STATUSGRUPOCDC, CODREDUZIDO'
      'FROM CENTCUST'
      'WHERE (TRIM(CODCENTROCUSTO) = :CODCENTROCUSTO)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '  AND (ATIVO = '#39'S'#39')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 592
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
