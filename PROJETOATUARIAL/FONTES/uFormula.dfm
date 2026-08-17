inherited frmFormula: TfrmFormula
  Left = 114
  Top = 97
  HelpContext = 40301
  ActiveControl = DBEdit1
  Caption = 'Fórmula'
  ClientHeight = 512
  ClientWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 426
    object Label7: TLabel
      Left = 22
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 24
      Top = 48
      Width = 83
      Height = 13
      Caption = 'Grupo Fórmula'
    end
    object DBEdit1: TDBEdit
      Left = 22
      Top = 24
      Width = 618
      Height = 21
      AutoSelect = False
      DataField = 'NO_FORMULA'
      DataSource = ds
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 22
      Top = 97
      Width = 195
      Height = 47
      Caption = 'Variável de Resultado: '
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 156
        Top = 16
        Width = 25
        Height = 25
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object DBEdtVarResult: TDBEdit
        Left = 12
        Top = 17
        Width = 138
        Height = 21
        DataField = 'NO_VARIAVEL_RESULT'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = DBEdtVarResultKeyDown
      end
    end
    object GroupBox2: TGroupBox
      Left = 241
      Top = 97
      Width = 270
      Height = 117
      Caption = 'Variáveis de Somatório'
      TabOrder = 2
      object Label1: TLabel
        Left = 13
        Top = 53
        Width = 54
        Height = 13
        Caption = 'Inicial 1: '
      end
      object Label2: TLabel
        Left = 31
        Top = 21
        Width = 36
        Height = 13
        Caption = 'Final: '
      end
      object SpeedButton2: TSpeedButton
        Left = 219
        Top = 47
        Width = 25
        Height = 25
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 219
        Top = 16
        Width = 25
        Height = 25
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 13
        Top = 83
        Width = 54
        Height = 13
        Caption = 'Inicial 2: '
      end
      object SpeedButton4: TSpeedButton
        Left = 219
        Top = 77
        Width = 25
        Height = 25
        Caption = '...'
        OnClick = SpeedButton4Click
      end
      object DBEdtVarInicial: TDBEdit
        Left = 68
        Top = 49
        Width = 141
        Height = 21
        DataField = 'NO_VARIAVEL_INICIAL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = DBEdtVarResultKeyDown
      end
      object DBEdtVarFinal: TDBEdit
        Left = 68
        Top = 17
        Width = 141
        Height = 21
        DataField = 'NO_VARIAVEL_FINAL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = DBEdtVarResultKeyDown
      end
      object DBEdtVarInicial2: TDBEdit
        Left = 68
        Top = 79
        Width = 141
        Height = 21
        DataField = 'NO_VARIAVEL_INICIAL2'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
        OnKeyDown = DBEdtVarResultKeyDown
      end
    end
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 215
      Width = 648
      Height = 210
      ActivePage = TbShExrpessao
      Align = alBottom
      HotTrack = True
      TabOrder = 3
      object TbShExrpessao: TTabSheet
        Caption = 'Expressão'
        object DBMmExpressao: TDBMemo
          Left = 11
          Top = 13
          Width = 617
          Height = 120
          DataField = 'DS_FORMULA'
          DataSource = ds
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btbtnExpressao: TBitBtn
          Left = 481
          Top = 141
          Width = 107
          Height = 35
          Hint = 
            'Assistente para construção da condição de enquadramento do parti' +
            'cipante'
          Caption = 'Expressão >>'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btbtnExpressaoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
            1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
            1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
            193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
            11155557F755F777777555000755033305555577755F75F77F55555555503335
            0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
            05555757F75F75557F5505000333555505557F777FF755557F55000000355557
            07557777777F55557F5555000005555707555577777FF5557F55553000075557
            0755557F7777FFF5755555335000005555555577577777555555}
          NumGlyphs = 2
        end
      end
      object TbShRotinas: TTabSheet
        Caption = 'Rotinas de Cálculo'
        object DbGrdDet: TwwDBGrid
          Left = 0
          Top = 0
          Width = 640
          Height = 182
          Selected.Strings = (
            'DS_GRUPO_FORMULA'#9'50'#9'Rotina de Cálculo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRotina
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
    object DBLkpCmbBxGrupoFormula: TDBLookupComboBox
      Left = 22
      Top = 66
      Width = 427
      Height = 21
      DataField = 'IR_GRUPO_FORMULA'
      DataSource = ds
      KeyField = 'IR_GRUPO_FORMULA'
      ListField = 'DS_GRUPO_FORMULA'
      ListSource = DtSrcGrupoFormula
      TabOrder = 4
      OnKeyDown = DBLkpCmbBxGrupoFormulaKeyDown
    end
  end
  inherited Dock972: TDock97
    Width = 650
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 244
      TabOrder = 1
      object SBtnGerar: TToolbarButton97
        Left = 8
        Top = 0
        Width = 97
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Gerar Fórmulas'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SBtnGerarClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 650
    inherited tb97Fundo: TToolbar97
      Left = 305
      DockPos = 305
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 136
      DockPos = 136
    end
    inherited dbnav: TDBNavigator
      Left = 14
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 317
    Top = 15
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 261
    Top = 43
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 233
    Top = 15
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 345
    Top = 16
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 373
    Top = 16
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    BeforeDelete = QryPrincipalBeforeDelete
    OnDeleteError = QryPrincipalDeleteError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_FORMULA'
      'order by NO_FORMULA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 233
    Top = 43
    object QryPrincipalCD_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_FORMULA'
      Origin = 'FI_FORMULA.CD_FORMULA'
      Visible = False
    end
    object QryPrincipalDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object QryPrincipalNO_VARIAVEL_RESULT: TStringField
      DisplayLabel = 'Variável de Resultado'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'FI_FORMULA.NO_VARIAVEL_RESULT'
    end
    object QryPrincipalNO_VARIAVEL_INICIAL: TStringField
      DisplayLabel = 'Variável Inici'
      DisplayWidth = 10
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_INICIAL'
      Visible = False
    end
    object QryPrincipalNO_VARIAVEL_FINAL: TStringField
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_FINAL'
      Visible = False
    end
    object QryPrincipalIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      FixedChar = True
      Size = 1
    end
    object QryPrincipalNO_VARIAVEL_INICIAL2: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL2'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL2'
      FixedChar = True
    end
    object QryPrincipalNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      Size = 200
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_FORMULA'
      'set'
      '  CD_FORMULA = :CD_FORMULA,'
      '  NO_FORMULA = :NO_FORMULA,'
      '  DS_FORMULA = :DS_FORMULA,'
      '  NO_VARIAVEL_RESULT = :NO_VARIAVEL_RESULT,'
      '  NO_VARIAVEL_INICIAL = :NO_VARIAVEL_INICIAL,'
      '  NO_VARIAVEL_FINAL = :NO_VARIAVEL_FINAL,'
      '  IR_GRUPO_FORMULA = :IR_GRUPO_FORMULA,'
      '  NO_VARIAVEL_INICIAL2 = :NO_VARIAVEL_INICIAL2'
      'where'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    InsertSQL.Strings = (
      'insert into FI_FORMULA'
      
        '  (CD_FORMULA, NO_FORMULA, DS_FORMULA, NO_VARIAVEL_RESULT, NO_VA' +
        'RIAVEL_INICIAL, '
      '   NO_VARIAVEL_FINAL, IR_GRUPO_FORMULA, NO_VARIAVEL_INICIAL2)'
      'values'
      
        '  (:CD_FORMULA, :NO_FORMULA, :DS_FORMULA, :NO_VARIAVEL_RESULT, :' +
        'NO_VARIAVEL_INICIAL, '
      '   :NO_VARIAVEL_FINAL, :IR_GRUPO_FORMULA, :NO_VARIAVEL_INICIAL2)')
    DeleteSQL.Strings = (
      'delete from FI_FORMULA'
      'where'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    Left = 289
    Top = 43
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_FORMULA) as Max_CD'
      'from FI_FORMULA')
    ValidateWithMask = True
    Left = 317
    Top = 43
  end
  object qryVariavelFormula: TwwQuery
    CachedUpdates = True
    AfterPost = qryVariavelFormulaAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_VARIAVEL_FORMULA '
      'where CD_FORMULA = :CD_FORMULA'
      'order by NO_VARIAVEL')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 233
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_FORMULA'
        ParamType = ptInput
      end>
    object qryVariavelFormulaCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'FI_VARIAVEL_FORMULA.CD_FORMULA'
    end
    object qryVariavelFormulaNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_VARIAVEL_FORMULA.NO_VARIAVEL'
    end
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VARIAVEL_FORMULA'
      'set'
      '  CD_FORMULA = :CD_FORMULA,'
      '  NO_VARIAVEL = :NO_VARIAVEL'
      'where'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    InsertSQL.Strings = (
      'insert into FI_VARIAVEL_FORMULA'
      '  (CD_FORMULA, NO_VARIAVEL)'
      'values'
      '  (:CD_FORMULA, :NO_VARIAVEL)')
    DeleteSQL.Strings = (
      'delete from FI_VARIAVEL_FORMULA'
      'where'
      '  CD_FORMULA = :OLD_CD_FORMULA')
    Left = 261
    Top = 71
  end
  object qryRotina: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select b.DS_GRUPO_FORMULA'
      'from FI_FORMULA a, FI_GRUPO_FORMULA b, FI_SEQUENCIA_FORMULA c'
      'where c.CD_FORMULA = :CD_FORMULA'
      '   and a.CD_FORMULA = c.CD_FORMULA'
      '   and b.CD_GRUPO_FORMULA = c.CD_GRUPO_FORMULA'
      'order by b.DS_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 289
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_FORMULA'
        ParamType = ptUnknown
      end>
    object qryRotinaDS_GRUPO_FORMULA: TStringField
      DisplayLabel = 'Rotina de Cálculo'
      DisplayWidth = 50
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = 'FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      Size = 80
    end
  end
  object dsRotina: TwwDataSource
    AutoEdit = False
    DataSet = qryRotina
    Left = 317
    Top = 71
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_FORMULA.NO_FORMULA'
      'FI_FORMULA.NO_VARIAVEL_RESULT')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Variável de Resultado')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_FORMULA')
    CamposChave.Strings = (
      'FI_FORMULA.CD_FORMULA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '80'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 261
    Top = 15
  end
  object QryExcluiVariaveisFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FI_VARIAVEL_FORMULA '
      'WHERE CD_FORMULA = :CD_FORMULA')
    ValidateWithMask = True
    Left = 345
    Top = 43
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_FORMULA'
        ParamType = ptUnknown
      end>
  end
  object ClntDtStGrupoFormula: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IR_GRUPO_FORMULA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DS_GRUPO_FORMULA'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 345
    Top = 71
    object ClntDtStGrupoFormulaIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Visible = False
      Size = 1
    end
    object ClntDtStGrupoFormulaDS_GRUPO_FORMULA: TStringField
      DisplayLabel = 'Grupo Fórmula'
      DisplayWidth = 50
      FieldName = 'DS_GRUPO_FORMULA'
      Size = 50
    end
  end
  object DtSrcGrupoFormula: TDataSource
    DataSet = ClntDtStGrupoFormula
    Left = 373
    Top = 71
  end
end
