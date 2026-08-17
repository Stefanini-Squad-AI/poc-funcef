inherited frmVariavel: TfrmVariavel
  Left = 123
  Top = 90
  HelpContext = 40304
  ActiveControl = DBEdit1
  Caption = 'Variável'
  ClientHeight = 395
  ClientWidth = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 569
    Height = 309
    object Label2: TLabel
      Left = 15
      Top = 49
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label7: TLabel
      Left = 16
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label1: TLabel
      Left = 328
      Top = 9
      Width = 68
      Height = 13
      Caption = 'Valor Inicial'
    end
    object PageControl: TPageControl
      Left = 1
      Top = 144
      Width = 567
      Height = 164
      ActivePage = TabSheet1
      Align = alBottom
      HotTrack = True
      TabOrder = 5
      object TabSheet1: TTabSheet
        Caption = 'Campo Base de Dados'
        object DBMemo1: TDBMemo
          Left = 19
          Top = 0
          Width = 328
          Height = 85
          DataField = 'DS_SQL_CAMPO_BANCO'
          DataSource = ds
          TabOrder = 0
          Visible = False
        end
        object BtBtnFormula: TBitBtn
          Left = 394
          Top = 95
          Width = 146
          Height = 31
          Hint = 'Associa variável a base'
          Caption = 'Associa Variável >>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BtBtnFormulaClick
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
        object DBMemoCampoBase: TDBMemo
          Left = 5
          Top = 0
          Width = 554
          Height = 86
          DataField = 'NO_CAMPO_BANCO'
          DataSource = ds
          Enabled = False
          TabOrder = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Fórmulas'
        object DbGrdDet: TwwDBGrid
          Left = 0
          Top = 0
          Width = 559
          Height = 136
          Selected.Strings = (
            'NO_FORMULA'#9'40'#9'Fórmula'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFormula
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
    object DBEdit4: TDBEdit
      Left = 16
      Top = 64
      Width = 549
      Height = 21
      DataField = 'DS_VARIAVEL'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 24
      Width = 275
      Height = 21
      AutoSelect = False
      DataField = 'NO_VARIAVEL'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 314
      Top = 24
      Width = 92
      Height = 21
      DataField = 'VL_DEFAULT'
      DataSource = ds
      TabOrder = 1
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 15
      Top = 91
      Width = 196
      Height = 45
      Caption = 'Variável Indexada'
      Columns = 2
      DataField = 'IR_TABUA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
      Values.Strings = (
        'S'
        'N')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 215
      Top = 91
      Width = 194
      Height = 45
      Caption = 'Memória de Cálculo'
      Columns = 2
      DataField = 'IR_OCOR_CALC_ATUARIAL'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      Values.Strings = (
        'S'
        'N')
    end
  end
  inherited Dock972: TDock97
    Width = 569
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
        Caption = '&Gerar Variáveis'
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
    Top = 356
    Width = 569
    inherited tb97Fundo: TToolbar97
      Left = 255
      DockPos = 255
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 86
      DockPos = 86
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 157
    Top = 66
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 185
    Top = 94
  end
  inherited ImlPadrao: TImageList
    Left = 158
    Top = 38
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 185
    Top = 66
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 184
    Top = 38
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 213
    Top = 38
  end
  object dsFormula: TwwDataSource
    AutoEdit = False
    DataSet = qryFormula
    Left = 185
    Top = 122
  end
  object qryFormula: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select b.NO_FORMULA, a.NO_VARIAVEL'
      'from FI_VARIAVEL a, FI_FORMULA b, FI_VARIAVEL_FORMULA c'
      'where RTRIM(c.NO_VARIAVEL) = :NO_VARIAVEL'
      '   and c.CD_FORMULA = b.CD_FORMULA'
      '   and c.NO_VARIAVEL = a.NO_VARIAVEL   '
      'order by NO_FORMULA')
    ValidateWithMask = True
    Left = 157
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'NO_VARIAVEL'
        ParamType = ptUnknown
      end>
    object qryFormulaNO_FORMULA: TStringField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 40
      FieldName = 'NO_FORMULA'
      Origin = '"CM.FI_FORMULA".NO_FORMULA'
      Size = 80
    end
    object qryFormulaNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = '"CM.FI_VARIAVEL".NO_VARIAVEL'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VARIAVEL'
      'set'
      '  DS_VARIAVEL = :DS_VARIAVEL,'
      '  IM_VARIAVEL = :IM_VARIAVEL,'
      '  VL_DEFAULT = :VL_DEFAULT,'
      '  DS_SQL_CAMPO_BANCO = :DS_SQL_CAMPO_BANCO,'
      '  NO_FUNCAO = :NO_FUNCAO,'
      '  IR_OCOR_CALC_ATUARIAL = :IR_OCOR_CALC_ATUARIAL,'
      '  IR_TABUA = :IR_TABUA,'
      '  IR_DOMINIO_SISTEMA = :IR_DOMINIO_SISTEMA,'
      '  NO_CAMPO_BANCO = :NO_CAMPO_BANCO'
      'where'
      '  RTRIM(NO_VARIAVEL) = :OLD_NO_VARIAVEL')
    InsertSQL.Strings = (
      'insert into FI_VARIAVEL'
      '  (NO_VARIAVEL, DS_VARIAVEL, IM_VARIAVEL, VL_DEFAULT, '
      '   DS_SQL_CAMPO_BANCO, NO_FUNCAO, IR_OCOR_CALC_ATUARIAL, '
      '   IR_TABUA, IR_DOMINIO_SISTEMA, NO_CAMPO_BANCO)'
      'values'
      '  (:NO_VARIAVEL, :DS_VARIAVEL, :IM_VARIAVEL, :VL_DEFAULT,    '
      '   :DS_SQL_CAMPO_BANCO, :NO_FUNCAO, :IR_OCOR_CALC_ATUARIAL, '
      '   :IR_TABUA, :IR_DOMINIO_SISTEMA, :NO_CAMPO_BANCO)')
    DeleteSQL.Strings = (
      'delete from FI_VARIAVEL'
      'where'
      '  RTRIM(NO_VARIAVEL) = :OLD_NO_VARIAVEL')
    Left = 213
    Top = 94
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforeEdit = QryPrincipalBeforeEdit
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    AfterDelete = QryPrincipalAfterDelete
    OnDeleteError = QryPrincipalDeleteError
    OnPostError = QryPrincipalPostError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_VARIAVEL'
      'order by NO_VARIAVEL')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 157
    Top = 94
    object QryPrincipalNO_VARIAVEL: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_VARIAVEL.NO_VARIAVEL'
    end
    object QryPrincipalDS_VARIAVEL: TStringField
      FieldName = 'DS_VARIAVEL'
      Origin = 'BASEDADOS.FI_VARIAVEL.DS_VARIAVEL'
      Size = 200
    end
    object QryPrincipalVL_DEFAULT: TFloatField
      DisplayLabel = 'Valor Inicial'
      DisplayWidth = 10
      FieldName = 'VL_DEFAULT'
      Origin = 'FI_VARIAVEL.VL_DEFAULT'
      DisplayFormat = '##,##0.0000'
    end
    object QryPrincipalIM_VARIAVEL: TStringField
      DisplayWidth = 20
      FieldName = 'IM_VARIAVEL'
      Origin = 'FI_VARIAVEL.IM_VARIAVEL'
      Visible = False
    end
    object QryPrincipalDS_SQL_CAMPO_BANCO: TMemoField
      DisplayWidth = 10
      FieldName = 'DS_SQL_CAMPO_BANCO'
      Origin = 'FI_VARIAVEL.DS_SQL_CAMPO_BANCO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object QryPrincipalNO_FUNCAO: TStringField
      DisplayWidth = 30
      FieldName = 'NO_FUNCAO'
      Origin = 'FI_VARIAVEL.NO_FUNCAO'
      Visible = False
      Size = 30
    end
    object QryPrincipalIR_OCOR_CALC_ATUARIAL: TStringField
      DisplayWidth = 1
      FieldName = 'IR_OCOR_CALC_ATUARIAL'
      Origin = 'FI_VARIAVEL.IR_OCOR_CALC_ATUARIAL'
      Visible = False
      Size = 1
    end
    object QryPrincipalIR_TABUA: TStringField
      DisplayWidth = 1
      FieldName = 'IR_TABUA'
      Origin = 'FI_VARIAVEL.IR_TABUA'
      Visible = False
      Size = 1
    end
    object QryPrincipalIR_DOMINIO_SISTEMA: TStringField
      DisplayWidth = 3
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_VARIAVEL.IR_DOMINIO_SISTEMA'
      Visible = False
      Size = 3
    end
    object QryPrincipalNO_CAMPO_BANCO: TStringField
      DisplayWidth = 200
      FieldName = 'NO_CAMPO_BANCO'
      Origin = 'FI_VARIAVEL.NO_CAMPO_BANCO'
      Visible = False
      Size = 200
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_VARIAVEL.NO_VARIAVEL'
      'FI_VARIAVEL.DS_VARIAVEL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_VARIAVEL')
    CamposChave.Strings = (
      'FI_VARIAVEL.NO_VARIAVEL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 213
    Top = 66
  end
end
