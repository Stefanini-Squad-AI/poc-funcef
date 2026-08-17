inherited frmCadContasMovGrupo: TfrmCadContasMovGrupo
  Left = 36
  Top = 104
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
      object dblcGrupo: TwwDBLookupCombo
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
      object dblcTipoMovimento: TwwDBLookupCombo
        Left = 376
        Top = 24
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOMOVIMENTACAO'#9'40'#9'Descrição')
        DataField = 'IDTIPOMOVIMENTACAO'
        DataSource = ds
        LookupTable = qryMovimento
        LookupField = 'IDTIPOMOVIMENTACAO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcTipoMovimentoExit
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
              Left = 160
              Top = 120
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
              Top = 104
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object Label2: TLabel
              Left = 8
              Top = 48
              Width = 88
              Height = 13
              Caption = 'Plano de Conta'
            end
            object edPlanoConta: TEdit
              Left = 8
              Top = 64
              Width = 609
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object gbDescrConta: TGroupBox
              Left = 192
              Top = 104
              Width = 425
              Height = 40
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lbDescricaoConta: TLabel
                Left = 8
                Top = 16
                Width = 409
                Height = 17
                AutoSize = False
              end
            end
            object dbeContaContabil: TwwDBEdit
              Left = 8
              Top = 120
              Width = 153
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
              Width = 175
              Height = 41
              Caption = 'Lançamento à'
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
              Left = 192
              Top = 6
              Width = 425
              Height = 163
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
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 615
            Height = 168
            Selected.Strings = (
              'PLANO'#9'10'#9'Plano de Contas'
              'PLACONTA'#9'18'#9'Conta Contábil'
              'PLANOME'#9'42'#9'Descrição'
              'TIPOLANCAMENTO'#9'1'#9'Débito'
              'TIPOCREDITO'#9'1'#9'Crédito')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70018
      end
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
    Left = 248
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
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.TIPOSMOVIMENTOGRUPOS".IDPESSOA'
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.TIPOSMOVIMENTOGRUPOS".IDGRUPO'
    end
    object qryIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = '"CM.TIPOSMOVIMENTOGRUPOS".IDTIPOMOVIMENTACAO'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 552
    Top = 0
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
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selciona Parâmetro Contábil'
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
      'TIPOSMOVIMENTOGRUPOS')
    CamposChave.Strings = (
      'TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      'TIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO')
    Filtro.Strings = (
      'GRUPO.IDGRUPO = TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      
        'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO = TIPOSMOVIMENTOGRUPOS.IDTIP' +
        'OMOVIMENTACAO')
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
    Left = 408
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 312
    Top = 196
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDCONTASTIPOSMOV,'
      '       T.IDGRUPO,'
      '       T.IDTIPOMOVIMENTACAO,'
      '       T.IDPESSOA,'
      '       T.PLANO,'
      '       T.PLACONTA,'
      '       T.TIPOLANCAMENTO,'
      '       P.PLANOME'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS T,'
      '     PLANOCONTA P'
      'WHERE (T.IDPESSOA           = :PIDPESSOA)'
      '  AND (T.IDGRUPO            = :PIDGRUPO)'
      '  AND (T.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      '  AND (T.PLANO = P.PLANO)'
      '  AND (T.PLACONTA = P.PLACONTA)'
      '')
    UpdateObject = updDet
    ControlType.Strings = (
      'TIPOLANCAMENTO;CheckBox;D;C'
      'TIPOCREDITO;CheckBox;C;')
    ValidateWithMask = True
    Left = 504
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
    object qryDetPLANO: TFloatField
      DisplayLabel = 'Plano de Contas'
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".PLANO'
    end
    object qryDetPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".PLACONTA'
      Size = 18
    end
    object qryDetPLANOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 42
      FieldName = 'PLANOME'
      Origin = '"CM.PLANOCONTA".PLANOME'
      Size = 40
    end
    object qryDetTIPOLANCAMENTO: TStringField
      DisplayLabel = 'Débito'
      DisplayWidth = 1
      FieldName = 'TIPOLANCAMENTO'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".TIPOLANCAMENTO'
      Size = 1
    end
    object qryDetTIPOCREDITO: TStringField
      DisplayLabel = 'Crédito'
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'TIPOCREDITO'
      Size = 1
      Calculated = True
    end
    object qryDetIDCONTASTIPOSMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTASTIPOSMOV'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".IDCONTASTIPOSMOV'
      Visible = False
    end
    object qryDetIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".IDGRUPO'
      Visible = False
    end
    object qryDetIDTIPOMOVIMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".IDTIPOMOVIMENTACAO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.CONTASTIPOSMOVIMENTOGRUPOS".IDPESSOA'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASTIPOSMOVIMENTOGRUPOS'
      'set'
      '  IDCONTASTIPOSMOV = :IDCONTASTIPOSMOV,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  TIPOLANCAMENTO = :TIPOLANCAMENTO'
      'where'
      '  IDCONTASTIPOSMOV = :OLD_IDCONTASTIPOSMOV')
    InsertSQL.Strings = (
      'insert into CONTASTIPOSMOVIMENTOGRUPOS'
      
        '  (IDCONTASTIPOSMOV, IDGRUPO, IDTIPOMOVIMENTACAO, IDPESSOA, PLAN' +
        'O, PLACONTA, '
      '   TIPOLANCAMENTO)'
      'values'
      
        '  (:IDCONTASTIPOSMOV, :IDGRUPO, :IDTIPOMOVIMENTACAO, :IDPESSOA, ' +
        ':PLANO, '
      '   :PLACONTA, :TIPOLANCAMENTO)')
    DeleteSQL.Strings = (
      'delete from CONTASTIPOSMOVIMENTOGRUPOS'
      'where'
      '  IDCONTASTIPOSMOV = :OLD_IDCONTASTIPOSMOV')
    Left = 600
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
  object qryMovimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOMOVIMENTACAO,DESCTIPOMOVIMENTACAO,LANCAMENTO,IDCONT' +
        'AB'
      'FROM TIPOMOVIMENTACAO'
      'WHERE LANCAMENTO = '#39'S'#39
      'ORDER BY DESCTIPOMOVIMENTACAO'
      '')
    ValidateWithMask = True
    Left = 648
    Top = 56
    object qryMovimentoIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
    object qryMovimentoDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryMovimentoLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Size = 1
    end
    object qryMovimentoIDCONTAB: TFloatField
      FieldName = 'IDCONTAB'
    end
  end
  object dsContaContabil: TwwDataSource
    DataSet = qryContaContabil
    Left = 592
    Top = 112
  end
  object qryContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 504
    Top = 112
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
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOAREA')
    ValidateWithMask = True
    Left = 664
    Top = 264
  end
  object qryUpdNome: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE GRUPO SET NOME = UPPER(NOME) ')
    ValidateWithMask = True
    Left = 640
    Top = 449
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE (PLANO = :PPLANO)')
    ValidateWithMask = True
    Left = 432
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'PLANO.PLANO'
    end
    object qryPlanoDESCPLANO: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 20
      FieldName = 'DESCPLANO'
      Origin = 'PLANO.DESCPLANO'
    end
    object qryPlanoMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
  end
end
