inherited frmPreSelec: TfrmPreSelec
  Left = 95
  Top = 93
  HelpContext = 730017
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Seleção de Potenciais Candidatos'
  ClientHeight = 440
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    Height = 401
    BorderWidth = 2
    object gbxAval: TGroupBox
      Left = 161
      Top = 218
      Width = 262
      Height = 107
      Caption = ' Testes, Entrevistas, etc. '
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
      Visible = False
      object Label4: TLabel
        Left = 270
        Top = 9
        Width = 44
        Height = 13
        Caption = 'Aval.Min.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 224
        Top = 7
        Width = 23
        Height = 13
        Caption = 'Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dblckTipAval: TwwDBLookupCombo
        Left = 8
        Top = 22
        Width = 190
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
        LookupTable = CdsTipAval
        LookupField = 'CODTIPOAVAL'
        Style = csDropDownList
        MaxLength = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnCloseUp = dblckTipAvalCloseUp
      end
      object lstbxAval: TListBox
        Left = 8
        Top = 43
        Width = 190
        Height = 56
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstbxAvalKeyDown
      end
      object lstbxAvalMin: TListBox
        Left = 224
        Top = 43
        Width = 30
        Height = 56
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
      end
      object ednAvalMin: TEditNum
        Left = 224
        Top = 22
        Width = 30
        Height = 21
        TabOrder = 3
        Text = '0'
        IntDigits = 3
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object lstbxSinalAval: TListBox
        Left = 201
        Top = 43
        Width = 20
        Height = 56
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
      end
    end
    object rgSelTudo: TRadioGroup
      Left = 12
      Top = 7
      Width = 307
      Height = 62
      Caption = ' Treinamento Requerido '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Padrão do Cargo'
        'Sem Exigência'
        'A Selecionar')
      TabOrder = 0
      OnClick = rgSelTudoClick
    end
    object cmbTrein: TComboBox
      Left = 265
      Top = 22
      Width = 44
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = '>='
      Items.Strings = (
        '<'
        '='
        '>=')
    end
    object rgSelTud2: TRadioGroup
      Left = 326
      Top = 7
      Width = 262
      Height = 102
      Caption = ' Experiências '
      ItemIndex = 0
      Items.Strings = (
        'Padrão do Cargo (Completo)'
        'Padrão do Cargo (Exigido)'
        'Padrão do Cargo (Desejável)'
        'Sem Exigência'
        'A Selecionar')
      TabOrder = 2
      OnClick = rgSelTud2Click
    end
    object cmbExper: TComboBox
      Left = 449
      Top = 82
      Width = 44
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = '>='
      Items.Strings = (
        '<'
        '='
        '>=')
    end
    object rgAprovacao: TRadioGroup
      Left = 12
      Top = 71
      Width = 307
      Height = 38
      Caption = ' Critério de Aprovação '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Padrão'
        'A Especificar')
      TabOrder = 4
      OnClick = rgAprovacaoClick
    end
    object gbxCurso: TGroupBox
      Left = 12
      Top = 111
      Width = 197
      Height = 105
      Caption = ' Cursos '
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      Visible = False
      object dblckCurso: TwwDBLookupCombo
        Left = 8
        Top = 22
        Width = 181
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        LookupTable = CdsCurso
        LookupField = 'IDCURSO'
        Style = csDropDownList
        MaxLength = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblckCursoCloseUp
      end
      object lstbxCurso: TListBox
        Left = 8
        Top = 43
        Width = 181
        Height = 56
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstbxCursoKeyDown
      end
    end
    object gbxNotas: TGroupBox
      Left = 215
      Top = 111
      Width = 104
      Height = 105
      TabOrder = 6
      Visible = False
      object lblTeor: TLabel
        Left = 30
        Top = 7
        Width = 30
        Height = 13
        Caption = 'Teoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPrat: TLabel
        Left = 63
        Top = 7
        Width = 33
        Height = 13
        Caption = 'Prática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ednTeor: TEditNum
        Left = 30
        Top = 22
        Width = 30
        Height = 21
        TabOrder = 0
        Text = '0'
        IntDigits = 3
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object ednPrat: TEditNum
        Left = 63
        Top = 22
        Width = 33
        Height = 21
        TabOrder = 1
        Text = '0'
        IntDigits = 3
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object lstbxTeorica: TListBox
        Left = 30
        Top = 43
        Width = 30
        Height = 56
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object lstbxPratica: TListBox
        Left = 63
        Top = 43
        Width = 33
        Height = 56
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object lstbxSinalTrein: TListBox
        Left = 8
        Top = 43
        Width = 20
        Height = 56
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
    end
    object gbxExper: TGroupBox
      Left = 326
      Top = 111
      Width = 262
      Height = 105
      Caption = ' Tipos '
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      Visible = False
      object Label3: TLabel
        Left = 223
        Top = 7
        Width = 31
        Height = 13
        Caption = 'Meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dblckExper: TwwDBLookupCombo
        Left = 8
        Top = 22
        Width = 190
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        LookupTable = CdsExper
        LookupField = 'IDEXPER'
        Style = csDropDownList
        MaxLength = 5
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnCloseUp = dblckExperCloseUp
      end
      object lstbxExper: TListBox
        Left = 8
        Top = 43
        Width = 190
        Height = 56
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstbxExperKeyDown
      end
      object ednMesesMin: TEditNum
        Left = 223
        Top = 22
        Width = 31
        Height = 21
        TabOrder = 2
        Text = '0'
        IntDigits = 3
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object lstbxMesesMin: TListBox
        Left = 223
        Top = 43
        Width = 31
        Height = 56
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
      end
      object lstbxSinalExper: TListBox
        Left = 201
        Top = 43
        Width = 20
        Height = 56
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
      end
    end
    object rgSelTud3: TRadioGroup
      Left = 12
      Top = 218
      Width = 143
      Height = 107
      Caption = ' Avaliações '
      ItemIndex = 0
      Items.Strings = (
        'Padrão do Cargo'
        'Sem Exigência'
        'Selecionar')
      TabOrder = 8
      OnClick = rgSelTud3Click
    end
    object cmbAval: TComboBox
      Left = 104
      Top = 293
      Width = 44
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      Text = '>='
      Items.Strings = (
        '<'
        '='
        '>=')
    end
    object rgSimula: TRadioGroup
      Left = 430
      Top = 218
      Width = 158
      Height = 31
      Caption = ' Simular Desempenho? '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 11
      OnClick = rgSimulaClick
    end
    object gbxSimula: TGroupBox
      Left = 430
      Top = 249
      Width = 158
      Height = 76
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      Visible = False
      object Label2: TLabel
        Left = 270
        Top = 9
        Width = 44
        Height = 13
        Caption = 'Aval.Min.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 52
        Width = 47
        Height = 13
        Caption = 'Avaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 9
        Width = 78
        Height = 13
        Caption = 'Grupo Funcional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dblckGrupo: TwwDBLookupCombo
        Left = 8
        Top = 23
        Width = 142
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCGRPFUNC'#9'40'#9'DESCGRPFUNC')
        LookupTable = CdsGrupoFunc
        LookupField = 'CODGRPFUNC'
        Style = csDropDownList
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object ednDesempMin: TEditNum
        Left = 107
        Top = 48
        Width = 43
        Height = 21
        TabOrder = 1
        Text = '0'
        IntDigits = 3
        Signal = False
        DecDigits = 0
        Numeric = True
      end
      object cmbDesemp: TComboBox
        Left = 58
        Top = 48
        Width = 44
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = '>='
        Items.Strings = (
          '<'
          '='
          '>=')
      end
    end
    object gbxRequi: TGroupBox
      Left = 12
      Top = 327
      Width = 576
      Height = 63
      Caption = ' Vinculação a uma Requisição de Pessoal '
      TabOrder = 13
      object sbtnProcurarRequis: TToolbarButton97
        Left = 139
        Top = 16
        Width = 125
        Height = 40
        AllowAllUp = True
        Caption = '&Procurar Requisição'
        Flat = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        ImageIndex = 0
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarRequisClick
      end
      object rgRequi: TRadioGroup
        Left = 8
        Top = 14
        Width = 124
        Height = 40
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 0
        OnClick = rgRequiClick
      end
      object gbxNumReq: TGroupBox
        Left = 271
        Top = 10
        Width = 146
        Height = 45
        Caption = 'Número da Requisição'
        TabOrder = 1
        object edNumReq: TEdit
          Left = 7
          Top = 16
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
          TabOrder = 0
        end
      end
      object rgCandAssoc: TRadioGroup
        Left = 424
        Top = 10
        Width = 144
        Height = 45
        Hint = 'Para Candidatos Externos, Retringe aos Associados à Requisição'
        Caption = ' Só Cand. Associados '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Sim'
          'Não')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 351
      DockPos = 423
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 115
    Top = 395
  end
  object MontaSelectReq: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Requisição'
    Colunas.Strings = (
      'R.NUMREQ'
      'R.DATAREQ'
      'R.DATAPLAN'
      'C.TITULO'
      'F1.MATRICULA'
      'P1.NOME'
      'F2.MATRICULA'
      'P2.NOME'
      'ESTAB.NOME'
      'CC.CODCENTROCUSTO'
      'CC.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Num.Requisição'
      'Data Requisição'
      'Data Desejada'
      'Cargo'
      'Matr.Substituído'
      'Nome Substituído'
      'Matr.Ocupante'
      'Nome Ocupante'
      'Estabelecimento'
      'Cod.Centro Custo'
      'Nome Centro Custo')
    Tabelas.Strings = (
      'REQUIPES R'
      'CARGO    C'
      'FUNCIONARIO F1'
      'PESSOA   P1'
      'FUNCIONARIO F2'
      'PESSOA   P2'
      'PESSOA   ESTAB'
      'CENTCUST CC')
    CamposChave.Strings = (
      'R.NUMREQ'
      'R.DATAREQ'
      'C.TITULO'
      'ESTAB.NOME'
      'CC.NOME'
      'R.SEXO'
      'R.SITUACAO')
    Filtro.Strings = (
      'R.IDCARGO = C.IDCARGO(+)'
      'R.IDSUBSTITUIDO = F1.IDPESSOA(+)'
      'R.IDSUBSTITUIDO = P1.IDPESSOA(+)'
      '(R.IDSUBSTITUIDO IS NULL OR P1.IDPESSOA = F1.IDPESSOA)'
      'R.IDNOVOOCUP = F2.IDPESSOA(+)'
      'R.IDNOVOOCUP = P2.IDPESSOA(+)'
      '(R.IDNOVOOCUP IS NULL OR P2.IDPESSOA = F2.IDPESSOA)'
      'R.IDESTAB = ESTAB.IDPESSOA(+)'
      'R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)')
    Larguras.Strings = (
      '10'
      '12'
      '12'
      '30'
      '10'
      '40'
      '10'
      '40'
      '40'
      '10'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 40
    Top = 395
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 30
    Top = 164
  end
  object CdsExper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 343
    Top = 164
  end
  object CdsTipAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 183
    Top = 271
  end
  object CdsGrupoFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 308
    Top = 271
  end
end
