inherited frmComparaVersoes: TfrmComparaVersoes
  Left = 74
  Top = 58
  HelpContext = 40156
  Caption = 'Comparação entre versões'
  ClientHeight = 475
  ClientWidth = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 690
    Height = 436
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 680
      Height = 91
      Align = alTop
      Caption = 'Versões a serem comparadas'
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 19
        Width = 73
        Height = 13
        Caption = 'Versão Atual'
      end
      object Label2: TLabel
        Left = 5
        Top = 46
        Width = 88
        Height = 13
        Caption = 'Versão Anterior'
      end
      object Label3: TLabel
        Left = 3
        Top = 70
        Width = 103
        Height = 13
        Caption = 'Grupo Exportação'
      end
      object DBLkpCmbBxVersaoAtu: TDBLookupComboBox
        Left = 111
        Top = 17
        Width = 251
        Height = 21
        KeyField = 'CD_VERSAO'
        ListField = 'DS_VERSAO'
        ListSource = wwDsVersaoAtu
        TabOrder = 0
      end
      object DBLkpCmbBxVersaoAnt: TDBLookupComboBox
        Left = 111
        Top = 41
        Width = 251
        Height = 21
        KeyField = 'CD_VERSAO'
        ListField = 'DS_VERSAO'
        ListSource = wwDsVersaoAnt
        TabOrder = 1
      end
      object DBEditVersaoAtu: TDBEdit
        Left = 377
        Top = 17
        Width = 161
        Height = 21
        DataField = 'DT_REFER_BASE'
        DataSource = wwDsVersaoAtu
        TabOrder = 2
      end
      object DBEditVersaoAnt: TDBEdit
        Left = 377
        Top = 41
        Width = 161
        Height = 21
        DataField = 'DT_REFER_BASE'
        DataSource = wwDsVersaoAnt
        TabOrder = 3
      end
      object DBLkpCmbBxGrupo: TDBLookupComboBox
        Left = 110
        Top = 65
        Width = 430
        Height = 21
        KeyField = 'CD_GRUPO_PARTIC'
        ListField = 'NO_GRUPO_PARTIC'
        ListSource = wwDSGrupo
        TabOrder = 4
      end
      object RadioGroupCompara: TRadioGroup
        Left = 542
        Top = 12
        Width = 132
        Height = 74
        Caption = 'Comparar por'
        ItemIndex = 0
        Items.Strings = (
          'Identif. TotalPrev'
          'Matrícula')
        TabOrder = 5
        OnClick = RadioGroupComparaClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 290
      Width = 680
      Height = 141
      Align = alBottom
      Caption = 'Condição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Memo1: TMemo
        Left = 210
        Top = 15
        Width = 351
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
      end
      object ListBoxCondicao: TListBox
        Left = 2
        Top = 15
        Width = 676
        Height = 124
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 243
      Width = 680
      Height = 47
      Align = alTop
      Caption = 'Valor'
      TabOrder = 2
      object BitBtn3: TBitBtn
        Left = 603
        Top = 15
        Width = 52
        Height = 20
        Hint = 'Seleciona condição'
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn3Click
        NumGlyphs = 2
      end
      object DBLkpCmbBxValor: TDBLookupComboBox
        Left = 10
        Top = 16
        Width = 256
        Height = 21
        Hint = 'Campos'
        KeyField = 'CD_TIPO_VALOR'
        ListField = 'DS_TIPO_VALOR'
        ListSource = wwDsValor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ComboBoxOper: TComboBox
        Left = 281
        Top = 16
        Width = 104
        Height = 21
        Hint = 'Operação'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Items.Strings = (
          'Subtração'
          'Soma'
          'Multiplicação'
          'Divisão'
          '')
      end
      object ComboBoxComparacao: TComboBox
        Left = 397
        Top = 15
        Width = 91
        Height = 21
        Hint = 'Comparação'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Items.Strings = (
          'Maior que'
          'Menor que'
          'Igual')
      end
      object EditValor: TEdit
        Left = 494
        Top = 14
        Width = 42
        Height = 21
        Hint = 'Valor a ser comparado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object EditPrecisao: TEdit
        Left = 544
        Top = 14
        Width = 42
        Height = 21
        Hint = 'Número de casas decimais para comparação'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = '2'
      end
    end
    object GroupBox4: TGroupBox
      Left = 5
      Top = 96
      Width = 680
      Height = 50
      Align = alTop
      Caption = 'Participante'
      TabOrder = 3
      object ComboBoxPartic: TComboBox
        Left = 280
        Top = 14
        Width = 206
        Height = 21
        Hint = 'Comparação'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Items.Strings = (
          'É diferente da versão anterior'
          'É igual a versão anterior'
          'Não existe na versão anterior'
          'Não existe na versão atual')
      end
      object DBLookupComboBoxPartic: TDBLookupComboBox
        Left = 8
        Top = 14
        Width = 258
        Height = 21
        Hint = 'Campos'
        KeyField = 'NO_ATRIBUTO_TABELA'
        ListField = 'DS_ATRIBUTO_TABELA'
        ListSource = dsGrupoAtributoPartic
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 601
        Top = 19
        Width = 48
        Height = 20
        Hint = 'Seleciona condição'
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn1Click
        NumGlyphs = 2
      end
    end
    object GroupBoxDep: TGroupBox
      Left = 5
      Top = 146
      Width = 680
      Height = 50
      Align = alTop
      Caption = 'Dependente'
      TabOrder = 4
      object ComboBoxDep: TComboBox
        Left = 280
        Top = 14
        Width = 206
        Height = 21
        Hint = 'Comparação'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Items.Strings = (
          'É diferente da versão anterior'
          'É igual a versão anterior'
          'Não existe na versão anterior'
          'Não existe na versão atual')
      end
      object DBLkpCmbBxDep: TDBLookupComboBox
        Left = 8
        Top = 14
        Width = 258
        Height = 21
        Hint = 'Campos'
        KeyField = 'NO_ATRIBUTO_TABELA'
        ListField = 'DS_ATRIBUTO_TABELA'
        ListSource = wwDsGrupoAtributoDep
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 601
        Top = 19
        Width = 49
        Height = 20
        Hint = 'Seleciona condição'
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn2Click
        NumGlyphs = 2
      end
    end
    object GroupBox7: TGroupBox
      Left = 5
      Top = 196
      Width = 680
      Height = 47
      Align = alTop
      Caption = 'Tempo'
      TabOrder = 5
      object BitBtn5: TBitBtn
        Left = 603
        Top = 16
        Width = 52
        Height = 20
        Hint = 'Seleciona condição'
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn5Click
        NumGlyphs = 2
      end
      object DBLkpCmbBxTempo: TDBLookupComboBox
        Left = 10
        Top = 15
        Width = 256
        Height = 21
        Hint = 'Campos'
        KeyField = 'CD_TIPO_TEMPO'
        ListField = 'DS_TIPO_TEMPO'
        ListSource = wwDsTempo
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ComboBoxTempo: TComboBox
        Left = 280
        Top = 16
        Width = 206
        Height = 21
        Hint = 'Comparação'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Items.Strings = (
          'É diferente da versão anterior'
          'É igual a versão anterior'
          'Não existe na versão anterior'
          'Não existe na versão atual')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 690
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    object BtBtnLimpar: TBitBtn
      Left = 93
      Top = 1
      Width = 88
      Height = 34
      Hint = 'Limpa condição'
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtBtnLimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 449
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object wwqryGrupoAtributoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_ATRIBUTO_TABELA'
      'WHERE CD_GRUPO = 1'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 205
    Top = 107
    object wwqryGrupoAtributoParticNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object wwqryGrupoAtributoParticNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwqryGrupoAtributoParticDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
    object wwqryGrupoAtributoParticTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".TP_ATRIBUTO'
      Size = 1
    end
    object wwqryGrupoAtributoParticNR_TAM_ATRIBUTO_TABELA: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NR_TAM_ATRIBUTO_TABELA'
    end
    object wwqryGrupoAtributoParticIR_MANDATORIO: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_MANDATORIO'
      Size = 1
    end
    object wwqryGrupoAtributoParticIR_CARGA_OBRIGATORIA: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_CARGA_OBRIGATORIA'
      Size = 1
    end
    object wwqryGrupoAtributoParticNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA_LOOKUP'
    end
    object wwqryGrupoAtributoParticNO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA_LOOKUP'
      Size = 60
    end
    object wwqryGrupoAtributoParticNO_ATRIBUTO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
      Size = 60
    end
    object wwqryGrupoAtributoParticCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
    end
  end
  object dsGrupoAtributoPartic: TwwDataSource
    DataSet = wwqryGrupoAtributoPartic
    Left = 230
    Top = 107
  end
  object wwqryGrupoAtributoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_ATRIBUTO_TABELA'
      'WHERE CD_GRUPO = 5'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 135
    Top = 192
    object StringField1: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".TP_ATRIBUTO'
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NR_TAM_ATRIBUTO_TABELA'
    end
    object StringField5: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_MANDATORIO'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_CARGA_OBRIGATORIA'
      Size = 1
    end
    object FloatField2: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA_LOOKUP'
    end
    object StringField7: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA_LOOKUP'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
      Size = 60
    end
    object FloatField3: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
    end
  end
  object wwDsGrupoAtributoBenef: TwwDataSource
    DataSet = wwqryGrupoAtributoBenef
    Left = 165
    Top = 192
  end
  object wwqryGrupoAtributoDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_ATRIBUTO_TABELA'
      'WHERE CD_GRUPO = 2'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 175
    Top = 147
    object StringField9: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object StringField10: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object StringField11: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
    object StringField12: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".TP_ATRIBUTO'
      Size = 1
    end
    object FloatField4: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NR_TAM_ATRIBUTO_TABELA'
    end
    object StringField13: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_MANDATORIO'
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_CARGA_OBRIGATORIA'
      Size = 1
    end
    object FloatField5: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA_LOOKUP'
    end
    object StringField15: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA_LOOKUP'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
      Size = 60
    end
    object FloatField6: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
    end
  end
  object wwDsGrupoAtributoDep: TwwDataSource
    DataSet = wwqryGrupoAtributoDep
    Left = 150
    Top = 147
  end
  object wwDsTempo: TwwDataSource
    DataSet = wwQryTempo
    Left = 245
    Top = 247
  end
  object wwQryTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_TIPO_TEMPO')
    ValidateWithMask = True
    Left = 220
    Top = 247
    object wwQryTempoCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
      Origin = 'FI_TIPO_TEMPO.CD_TIPO_TEMPO'
    end
    object wwQryTempoDS_TIPO_TEMPO: TStringField
      FieldName = 'DS_TIPO_TEMPO'
      Origin = 'FI_TIPO_TEMPO.DS_TIPO_TEMPO'
      Size = 60
    end
    object wwQryTempoIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_TIPO_TEMPO.IR_DOMINIO_SISTEMA'
      Size = 3
    end
  end
  object wwQryValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_TIPO_VALOR')
    ValidateWithMask = True
    Left = 200
    Top = 287
    object wwQryValorCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.CD_TIPO_VALOR'
    end
    object wwQryValorDS_TIPO_VALOR: TStringField
      FieldName = 'DS_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.DS_TIPO_VALOR'
      Size = 60
    end
  end
  object wwDsValor: TwwDataSource
    DataSet = wwQryValor
    Left = 225
    Top = 287
  end
  object wwQryVesaoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_VERSAO_BASE'
      'WHERE IR_BASE_HISTORICA = '#39'N'#39)
    ValidateWithMask = True
    Left = 185
    Top = 42
    object wwQryVesaoAntCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_VERSAO_BASE.CD_VERSAO'
    end
    object wwQryVesaoAntDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = 'FI_VERSAO_BASE.DS_VERSAO'
      Size = 60
    end
    object wwQryVesaoAntDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'FI_VERSAO_BASE.DT_GERACAO'
    end
    object wwQryVesaoAntLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'FI_VERSAO_BASE.LOGIN'
    end
    object wwQryVesaoAntDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = 'FI_VERSAO_BASE.DT_REFER_BASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wwQryVesaoAntIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'FI_VERSAO_BASE.IR_BASE_HISTORICA'
      Size = 1
    end
  end
  object wwDsVersaoAnt: TwwDataSource
    DataSet = wwQryVesaoAnt
    Left = 205
    Top = 42
  end
  object wwDsVersaoAtu: TwwDataSource
    DataSet = wwQryVesaoAtu
    Left = 275
    Top = 17
  end
  object wwQryVesaoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_VERSAO_BASE'
      'WHERE IR_BASE_HISTORICA = '#39'N'#39)
    ValidateWithMask = True
    Left = 250
    Top = 17
    object wwQryVesaoAtuCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_VERSAO_BASE.CD_VERSAO'
    end
    object wwQryVesaoAtuDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = 'FI_VERSAO_BASE.DS_VERSAO'
      Size = 60
    end
    object wwQryVesaoAtuDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'FI_VERSAO_BASE.DT_GERACAO'
    end
    object wwQryVesaoAtuLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'FI_VERSAO_BASE.LOGIN'
    end
    object wwQryVesaoAtuDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = 'FI_VERSAO_BASE.DT_REFER_BASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wwQryVesaoAtuIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'FI_VERSAO_BASE.IR_BASE_HISTORICA'
      Size = 1
    end
  end
  object wwQryVersoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_TIPO_TEMPO')
    ValidateWithMask = True
    Left = 490
    Top = 342
  end
  object qryCriaTemp: TwwQuery
    DatabaseName = 'dtbsTemporario'
    SQL.Strings = (
      'Create Table TempComparaVersao('
      '                    Condicao         Char(100),'
      '                    Partic           Integer,'
      '                    Matricula        Char(15),'
      '                    ValCampoAtual    Char(60),'
      '                    ValCampoAnterior Char(60))')
    ValidateWithMask = True
    Left = 557
    Top = 138
  end
  object qryDelTemp: TwwQuery
    DatabaseName = 'dtbsTemporario'
    SQL.Strings = (
      'Drop Table TempComparaVersao')
    ValidateWithMask = True
    Left = 557
    Top = 166
  end
  object qryInsTemp: TwwQuery
    DatabaseName = 'dtbsTemporario'
    SQL.Strings = (
      'Insert Into TempComparaVersao'
      '(Condicao, Partic, Matricula, ValCampoAtual, ValCampoAnterior)'
      'values'
      
        '(:Condicao, :Partic, :Matricula, :ValCampoAtual, :ValCampoAnteri' +
        'or)')
    ValidateWithMask = True
    Left = 557
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Partic'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ValCampoAtual'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ValCampoAnterior'
        ParamType = ptUnknown
      end>
  end
  object dtbsTemporario: TDatabase
    DatabaseName = 'dtbsTemporario'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 525
    Top = 166
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NR_MATRICULA '
      'from FI_PARTICIPANTE'
      'where CD_PARTIC = :CD_PARTIC'
      '  and CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 520
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object wwQryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC,'
      '       FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      'FROM FI_GRUPO_EXPORTACAO   FI_GRUPO_EXPORTACAO,'
      '     FI_GRUPO_PARTICIPANTE FI_GRUPO_PARTICIPANTE'
      'where'
      
        '    FI_GRUPO_EXPORTACAO.CD_GRUPO_PARTIC = FI_GRUPO_PARTICIPANTE.' +
        'CD_GRUPO_PARTIC'
      '')
    ValidateWithMask = True
    Left = 300
    Top = 67
    object wwQryGrupoCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC'
    end
    object wwQryGrupoNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object wwDSGrupo: TwwDataSource
    DataSet = wwQryGrupo
    Left = 320
    Top = 67
  end
  object wwQryTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DS_TIPO_BENEF'
      'FROM FI_TIPO_BENEFICIO'
      'where CD_TIPO_BENEF = :CD_TIPO_BENEF')
    ValidateWithMask = True
    Left = 235
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TIPO_BENEF'
        ParamType = ptUnknown
      end>
    object wwQryTipoBenefDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      Size = 60
    end
  end
end
