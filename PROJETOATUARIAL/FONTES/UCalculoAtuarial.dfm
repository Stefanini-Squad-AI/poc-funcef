inherited frmCalculoAtuarial: TfrmCalculoAtuarial
  Left = 334
  Top = 302
  Caption = 'Cálculo Atuarial'
  ClientHeight = 381
  ClientWidth = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 563
    Height = 342
    object GrpBxGrupos: TGroupBox
      Left = 1
      Top = 64
      Width = 561
      Height = 277
      Align = alBottom
      Caption = 'Grupo de Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object SpdBttnGrupoPart: TSpeedButton
        Left = 4
        Top = 17
        Width = 26
        Height = 25
        Hint = 'Seleciona todos os grupos de participantes'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpdBttnGrupoPartClick
      end
      object ChckLstBxGrupoPart: TCheckListBox
        Left = 40
        Top = 15
        Width = 519
        Height = 260
        Align = alRight
        Color = clBtnFace
        Columns = 2
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object GroupBoxHipotese: TGroupBox
      Left = 5
      Top = 5
      Width = 436
      Height = 54
      Caption = 'Hipótese Atuarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object DBLkpCmbBxHipotese: TDBLookupComboBox
        Left = 25
        Top = 20
        Width = 386
        Height = 21
        DropDownRows = 10
        DropDownWidth = 500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'CD_HIPOTESE'
        ListField = 'DS_HIPOTESE'
        ListSource = wwDtSrcHipotese
        ParentFont = False
        TabOrder = 0
        OnCloseUp = DBLkpCmbBxHipoteseCloseUp
      end
    end
    object RadioGroupTipoCalculo: TRadioGroup
      Left = 441
      Top = 5
      Width = 113
      Height = 54
      Caption = 'Cálculo'
      ItemIndex = 1
      Items.Strings = (
        'Individual'
        'Grupo')
      TabOrder = 2
      OnClick = RadioGroupTipoCalculoClick
    end
  end
  inherited Dock971: TDock97
    Top = 342
    Width = 563
    object SpeedButton1: TSpeedButton [0]
      Left = 5
      Top = 1
      Width = 151
      Height = 36
      Caption = 'Memória de Cálculo'
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
      NumGlyphs = 2
    end
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
  end
  object wwQryHipotese: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FI_HIPOTESE'
      '')
    ValidateWithMask = True
    Left = 149
    Top = 21
    object wwQryHipoteseCD_HIPOTESE: TFloatField
      FieldName = 'CD_HIPOTESE'
      Origin = 'FI_HIPOTESE.CD_HIPOTESE'
    end
    object wwQryHipoteseDS_HIPOTESE: TStringField
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
    object wwQryHipoteseDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'FI_HIPOTESE.DT_GERACAO'
    end
    object wwQryHipoteseNR_IDADE_MIN_TB_SERV: TFloatField
      FieldName = 'NR_IDADE_MIN_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MIN_TB_SERV'
    end
    object wwQryHipoteseNR_IDADE_MAX_TB_SERV: TFloatField
      FieldName = 'NR_IDADE_MAX_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MAX_TB_SERV'
    end
  end
  object wwDtSrcHipotese: TwwDataSource
    DataSet = wwQryHipotese
    Left = 125
    Top = 21
  end
  object wwQryGrupoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct'
      '       a.CD_GRUPO_PARTIC, a.NO_GRUPO_PARTIC'
      'FROM  FI_grupo_participante a,'
      '      FI_grupo_calculo b'
      '  where '
      '       a.cd_grupo_partic   = b.cd_grupo_partic'
      ' and   b.cd_pessoa_entid   = :cd_pessoa_entid'
      ' and   b.cd_pessoa_patroc  = :cd_pessoa_patroc'
      ' and   b.cd_plano          = :cd_plano'
      ''
      'order by a.no_grupo_partic'
      '')
    ValidateWithMask = True
    Left = 45
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end>
    object wwQryGrupoParticCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
    end
    object wwQryGrupoParticNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object wwQryPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT PARTICIPANTE.*, BENEFICIO_CONCEDIDO.CD_TIPO_BENE' +
        'F'
      'FROM FI_PARTICIPANTE PARTICIPANTE,'
      '     FI_BENEFICIARIO BENEFICIO_CONCEDIDO'
      'WHERE PARTICIPANTE.CD_VERSAO  = :CD_VERSAO'
      
        '  AND PARTICIPANTE.CD_VERSAO  = BENEFICIO_CONCEDIDO.CD_VERSAO (+' +
        ')'
      
        '  AND PARTICIPANTE.CD_PARTIC  = BENEFICIO_CONCEDIDO.CD_PARTIC (+' +
        ')'
      ''
      ''
      ''
      ''
      '/* linha alterada [10] */'
      '/* linha alterada [11] */'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 45
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object wwQryParticCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_PARTICIPANTE".CD_VERSAO'
    end
    object wwQryParticCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = '"CM.FI_PARTICIPANTE".CD_PARTIC'
    end
    object wwQryParticCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_PARTICIPANTE".CD_PESSOA_PATROC'
    end
    object wwQryParticCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_PARTICIPANTE".CD_PESSOA_ENTID'
    end
    object wwQryParticCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_PARTICIPANTE".CD_PLANO'
    end
    object wwQryParticCD_TIPO_CAT_PROF_ESP: TFloatField
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = '"CM.FI_PARTICIPANTE".NR_MATRICULA'
    end
    object wwQryParticNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = '"CM.FI_PARTICIPANTE".NO_PESSOA'
      Size = 15
    end
    object wwQryParticNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PARTICIPANTE".CD_ESTADO_CIVIL'
      Size = 60
    end
    object wwQryParticIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = '"CM.FI_PARTICIPANTE".CD_TIPO_CAT_PROF_ESP'
      Size = 1
    end
    object wwQryParticIR_CONDICAO_TRABALHO: TStringField
      FieldName = 'IR_CONDICAO_TRABALHO'
      Origin = '"CM.FI_PARTICIPANTE".CD_TIPO_GRUPO_PARTIC'
      Size = 1
    end
    object wwQryParticCD_GRUPO_CALCULO: TFloatField
      FieldName = 'CD_GRUPO_CALCULO'
      Origin = '"CM.FI_PARTICIPANTE".IR_CONDICAO_TRABALHO'
    end
    object wwQryParticTP_PARTICIPANTE: TStringField
      FieldName = 'TP_PARTICIPANTE'
      Origin = '"CM.FI_PARTICIPANTE".IR_CONDICAO_TRABALHO'
      Size = 1
    end
    object wwQryParticCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = '"CM.FI_PARTICIPANTE".IR_CONDICAO_TRABALHO'
    end
  end
  object wwQryCalcBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT a.*, b.*'
      'FROM  fi_composicao_calculo_benef a,'
      '      fi_sequencia_formula b'
      'where'
      '        a.cd_grupo_formula = b.cd_grupo_formula'
      '   and  a.cd_pessoa_patroc = :cd_pessoa_patroc'
      '   and  a.cd_pessoa_entid  = :cd_pessoa_entid'
      '   and  a.cd_plano         = :cd_plano'
      '   and  a.cd_tipo_benef    = :cd_tipo_benef'
      '   and  a.cd_grupo_partic  = :cd_grupo_partic'
      'order by'
      '   b.nr_ordem_formula, b.cd_formula'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 85
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tipo_benef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_grupo_partic'
        ParamType = ptUnknown
      end>
  end
  object wwQryCompHipotese: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT a.*, b.*, c.ir_dominio_sistema'
      'FROM fi_composicao_hipotese a,'
      '     fi_item_hipotese b,'
      '     fi_tipo_tabua c'
      ''
      'where'
      '        a.cd_hipotese         = :cd_hipotese'
      '   and  a.cd_item_hipotese    = b.cd_item_hipotese'
      '   and  b.cd_tipo_tabua       = c.cd_tipo_tabua (+)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 125
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_hipotese'
        ParamType = ptUnknown
      end>
    object wwQryCompHipoteseCD_HIPOTESE: TFloatField
      FieldName = 'CD_HIPOTESE'
    end
    object wwQryCompHipoteseCD_ITEM_HIPOTESE: TFloatField
      FieldName = 'CD_ITEM_HIPOTESE'
    end
    object wwQryCompHipoteseCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
    end
    object wwQryCompHipoteseVL_HIPOTESE: TFloatField
      FieldName = 'VL_HIPOTESE'
    end
    object wwQryCompHipoteseIR_GERA_TAB_SERVICO: TStringField
      FieldName = 'IR_GERA_TAB_SERVICO'
      Size = 1
    end
    object wwQryCompHipoteseCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
    end
    object wwQryCompHipoteseDS_ITEM_HIPOTESE: TStringField
      FieldName = 'DS_ITEM_HIPOTESE'
      Size = 50
    end
    object wwQryCompHipoteseIR_ITEM_HIPOTESE: TStringField
      FieldName = 'IR_ITEM_HIPOTESE'
      Size = 1
    end
    object wwQryCompHipoteseNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
    end
    object wwQryCompHipoteseIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Size = 3
    end
  end
  object wwQryInsOcorCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into fi_ocor_calculo_atuarial'
      
        '  (DT_GERACAO, CD_VERSAO, CD_PESSOA_ENTID, CD_PESSOA_PATROC, CD_' +
        'PLANO, SQ_OCOR_CALCULO,'
      
        '   CD_PARTIC, CD_TIPO_BENEF, CD_FORMULA, NO_VARIAVEL, CD_GRUPO_P' +
        'ARTIC,'
      '   VL_CALCULO_ATUARIAL)'
      'values'
      
        '  (:DT_GERACAO, :CD_VERSAO, :CD_PESSOA_ENTID, :CD_PESSOA_PATROC,' +
        ' :CD_PLANO, :SQ_OCOR_CALCULO,'
      
        '   :CD_PARTIC, :CD_TIPO_BENEF, :CD_FORMULA, :NO_VARIAVEL, :CD_GR' +
        'UPO_PARTIC,'
      '   :VL_CALCULO_ATUARIAL)'
      '')
    ValidateWithMask = True
    Left = 165
    Top = 126
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SQ_OCOR_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_BENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_FORMULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NO_VARIAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VL_CALCULO_ATUARIAL'
        ParamType = ptUnknown
      end>
  end
  object wwQryOpcaoGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into fi_opcao_calculo_grupo_partic'
      
        '  (DT_GERACAO, CD_VERSAO, CD_PESSOA_ENTID, CD_PESSOA_PATROC, CD_' +
        'PLANO, CD_GRUPO_PARTIC)'
      'values'
      
        '  (:DT_GERACAO, :CD_VERSAO, :CD_PESSOA_ENTID, :CD_PESSOA_PATROC,' +
        ' :CD_PLANO, :CD_GRUPO_PARTIC)'
      '')
    ValidateWithMask = True
    Left = 205
    Top = 126
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object wwQryInsReferCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into fi_refer_calculo_atuarial'
      
        '  (DT_GERACAO, CD_VERSAO, CD_PESSOA_ENTID, CD_PESSOA_PATROC, CD_' +
        'PLANO, CD_HIPOTESE,'
      '   DT_REFER_CALCULO, IR_CALCULO_EFETIVADO)'
      'values'
      
        '  (:DT_GERACAO, :CD_VERSAO, :CD_PESSOA_ENTID, :CD_PESSOA_PATROC,' +
        ' :CD_PLANO, :CD_HIPOTESE, '
      '   :DT_REFER_CALCULO, :IR_CALCULO_EFETIVADO)'
      '')
    ValidateWithMask = True
    Left = 165
    Top = 166
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_REFER_CALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IR_CALCULO_EFETIVADO'
        ParamType = ptUnknown
      end>
  end
  object wwQryVariavelFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select distinct  b.*'
      '    from'
      #9'fi_variavel_formula a,'
      #9'fi_variavel b,'
      #9'fi_sequencia_formula c'
      '    where'
      #9'a.no_variavel           = b.no_variavel'
      ' and '#9'a.cd_formula            = c.cd_formula'
      ' and    c.cd_grupo_formula      = :cd_grupo_formula'
      '')
    ValidateWithMask = True
    Left = 241
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_grupo_formula'
        ParamType = ptUnknown
      end>
    object wwQryVariavelFormulaNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = '"CM.FI_VARIAVEL".NO_VARIAVEL'
    end
    object wwQryVariavelFormulaDS_VARIAVEL: TStringField
      FieldName = 'DS_VARIAVEL'
      Origin = '"CM.FI_VARIAVEL".DS_VARIAVEL'
      Size = 80
    end
    object wwQryVariavelFormulaIM_VARIAVEL: TStringField
      FieldName = 'IM_VARIAVEL'
      Origin = '"CM.FI_VARIAVEL".IM_VARIAVEL'
    end
    object wwQryVariavelFormulaVL_DEFAULT: TFloatField
      FieldName = 'VL_DEFAULT'
      Origin = '"CM.FI_VARIAVEL".VL_DEFAULT'
    end
    object wwQryVariavelFormulaDS_SQL_CAMPO_BANCO: TMemoField
      FieldName = 'DS_SQL_CAMPO_BANCO'
      Origin = '"CM.FI_VARIAVEL".DS_SQL_CAMPO_BANCO'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQryVariavelFormulaNO_FUNCAO: TStringField
      FieldName = 'NO_FUNCAO'
      Origin = '"CM.FI_VARIAVEL".NO_CAMPO_BANCO'
      Size = 30
    end
    object wwQryVariavelFormulaIR_OCOR_CALC_ATUARIAL: TStringField
      FieldName = 'IR_OCOR_CALC_ATUARIAL'
      Origin = '"CM.FI_VARIAVEL".NO_FUNCAO'
      Size = 1
    end
    object wwQryVariavelFormulaIR_TABUA: TStringField
      FieldName = 'IR_TABUA'
      Origin = '"CM.FI_VARIAVEL".IR_OCOR_CALC_ATUARIAL'
      Size = 1
    end
    object wwQryVariavelFormulaIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = '"CM.FI_VARIAVEL".IR_TABUA'
      Size = 3
    end
    object wwQryVariavelFormulaNO_CAMPO_BANCO: TStringField
      FieldName = 'NO_CAMPO_BANCO'
      Origin = '"CM.FI_VARIAVEL".IR_DOMINIO_SISTEMA'
      Size = 200
    end
  end
  object wwQryVariavelHipotese: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM fi_composicao_hipotese a,'
      '            fi_item_hipotese b'
      '            '
      'where    a.cd_item_hipotese  = b.cd_item_hipotese'
      '     and   a.cd_hipotese            = :cd_hipotese'
      '     and   b.no_variavel             = :no_variavel'
      '      ')
    ValidateWithMask = True
    Left = 281
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_hipotese'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'no_variavel'
        ParamType = ptUnknown
      end>
    object wwQryVariavelHipoteseCD_HIPOTESE: TFloatField
      FieldName = 'CD_HIPOTESE'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".CD_HIPOTESE'
    end
    object wwQryVariavelHipoteseCD_ITEM_HIPOTESE: TFloatField
      FieldName = 'CD_ITEM_HIPOTESE'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".CD_ITEM_HIPOTESE'
    end
    object wwQryVariavelHipoteseCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".CD_TABUA'
    end
    object wwQryVariavelHipoteseVL_HIPOTESE: TFloatField
      FieldName = 'VL_HIPOTESE'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".VL_HIPOTESE'
    end
    object wwQryVariavelHipoteseIR_GERA_TAB_SERVICO: TStringField
      FieldName = 'IR_GERA_TAB_SERVICO'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
      Size = 1
    end
    object wwQryVariavelHipoteseCD_ITEM_HIPOTESE_1: TFloatField
      FieldName = 'CD_ITEM_HIPOTESE_1'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
    end
    object wwQryVariavelHipoteseCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
    end
    object wwQryVariavelHipoteseDS_ITEM_HIPOTESE: TStringField
      FieldName = 'DS_ITEM_HIPOTESE'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
      Size = 50
    end
    object wwQryVariavelHipoteseIR_ITEM_HIPOTESE: TStringField
      FieldName = 'IR_ITEM_HIPOTESE'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
      Size = 1
    end
    object wwQryVariavelHipoteseNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = '"CM.FI_COMPOSICAO_HIPOTESE".IR_GERA_TAB_SERVICO'
    end
  end
  object wwQryCalcFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT a.*, b.ir_ocor_calc_atuarial'
      'FROM    fi_formula a,'
      '        fi_variavel b'
      'where '
      '   a.no_variavel_result   = b.no_variavel'
      'order by'
      '   a.cd_formula    ')
    ValidateWithMask = True
    Left = 319
    Top = 126
    object wwQryCalcFormulaCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = '"CM.FI_FORMULA".CD_FORMULA'
    end
    object wwQryCalcFormulaNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = '"CM.FI_FORMULA".NO_FORMULA'
      Size = 80
    end
    object wwQryCalcFormulaDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = '"CM.FI_FORMULA".DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQryCalcFormulaNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = '"CM.FI_FORMULA".NO_VARIAVEL_RESULT'
    end
    object wwQryCalcFormulaNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = '"CM.FI_FORMULA".NO_VARIAVEL_INICIAL'
    end
    object wwQryCalcFormulaNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = '"CM.FI_FORMULA".NO_VARIAVEL_FINAL'
    end
    object wwQryCalcFormulaIR_OCOR_CALC_ATUARIAL: TStringField
      FieldName = 'IR_OCOR_CALC_ATUARIAL'
      Origin = '"CM.FI_VARIAVEL".IR_OCOR_CALC_ATUARIAL'
      Size = 1
    end
  end
  object wwQryOcorrTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from  fi_tabua a,'
      '                      fi_ocorr_tabua b'
      '             where '
      '                        a.cd_tabua = b.cd_tabua  '
      '                 and b.cd_tabua = :cd_tabua'
      '                 and b.cd_tabua = :cd_tabua'
      '                 and b.nr_idade  = :nr_idade')
    ValidateWithMask = True
    Left = 353
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_tabua'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_tabua'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'nr_idade'
        ParamType = ptUnknown
      end>
    object wwQryOcorrTabuaCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = '"CM.FI_TABUA".CD_TABUA'
    end
    object wwQryOcorrTabuaSG_TABUA: TStringField
      FieldName = 'SG_TABUA'
      Origin = '"CM.FI_TABUA".SG_TABUA'
      Size = 15
    end
    object wwQryOcorrTabuaDS_TABUA: TStringField
      FieldName = 'DS_TABUA'
      Origin = '"CM.FI_TABUA".DS_TABUA'
      Size = 50
    end
    object wwQryOcorrTabuaDT_REF_TABUA: TDateTimeField
      FieldName = 'DT_REF_TABUA'
      Origin = '"CM.FI_TABUA".DT_REF_TABUA'
    end
    object wwQryOcorrTabuaCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_IDADE: TFloatField
      FieldName = 'NR_IDADE'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_L_X: TFloatField
      FieldName = 'NR_L_X'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_P_X: TFloatField
      FieldName = 'NR_P_X'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_D_X: TFloatField
      FieldName = 'NR_D_X'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_Q_X: TFloatField
      FieldName = 'NR_Q_X'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
    object wwQryOcorrTabuaNR_I_X: TFloatField
      FieldName = 'NR_I_X'
      Origin = '"CM.FI_TABUA".CD_TIPO_TABUA'
    end
  end
  object wwQryProcura: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 85
    Top = 165
  end
  object wwQryRotinaAtivos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      a.cd_grupo_partic,'
      '      a.cd_grupo_formula,'
      '      b.cd_formula,'
      '      b.nr_ordem_formula'
      ''
      'FROM  fi_composicao_calculo a,'
      '      fi_sequencia_formula b'
      'where'
      '        a.cd_grupo_formula = b.cd_grupo_formula'
      '   and  a.cd_pessoa_patroc = :cd_pessoa_patroc'
      '   and  a.cd_pessoa_entid  = :cd_pessoa_entid'
      '   and  a.cd_plano         = :cd_plano'
      ''
      '   and  a.cd_grupo_partic  = :cd_grupo_partic'
      ''
      'order by'
      '      a.cd_grupo_partic,'
      '      a.cd_grupo_formula,'
      '      b.nr_ordem_formula'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 70
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_grupo_partic'
        ParamType = ptUnknown
      end>
  end
  object wwQryRotinaBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      a.cd_grupo_partic,'
      '      a.cd_grupo_formula,'
      '      a.cd_tipo_benef,'
      '      b.cd_formula,'
      '      b.nr_ordem_formula'
      ''
      'FROM  fi_composicao_calculo_benef a,'
      '      fi_sequencia_formula b'
      'where'
      '        a.cd_grupo_formula = b.cd_grupo_formula'
      '   and  a.cd_pessoa_patroc = :cd_pessoa_patroc'
      '   and  a.cd_pessoa_entid  = :cd_pessoa_entid'
      '   and  a.cd_plano         = :cd_plano'
      '   and  a.cd_grupo_partic  = :cd_grupo_partic'
      ''
      'order by'
      '      a.cd_grupo_partic,'
      '      a.cd_grupo_formula,'
      '      a.cd_tipo_benef,'
      '      b.nr_ordem_formula'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 135
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa_patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_pessoa_entid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_grupo_partic'
        ParamType = ptUnknown
      end>
  end
end
