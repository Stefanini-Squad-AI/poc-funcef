inherited FrmEntDadosPorGrupoMT: TFrmEntDadosPorGrupoMT
  Left = 105
  Top = 58
  HelpContext = 520010
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Entrada de Dados - Especial'
  ClientHeight = 557
  ClientWidth = 991
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel [0]
    Left = 0
    Top = 455
    Width = 991
    Height = 63
    Align = alBottom
    TabOrder = 4
    object Label7: TLabel
      Left = 16
      Top = 9
      Width = 106
      Height = 13
      Caption = 'Critério para rateio'
    end
    object Label8: TLabel
      Left = 296
      Top = 9
      Width = 124
      Height = 13
      Caption = 'Valor total para rateio'
    end
    object btCalcularRat: TSpeedButton
      Left = 440
      Top = 23
      Width = 95
      Height = 23
      Hint = 'Calcular critérios para rateio'
      Caption = 'Calcular'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777700000000000000766444444444444406E6666666666
        66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
        66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
        EE60766666666666666777777777777777777777777777777777}
      OnClick = btCalcularRatClick
    end
    object Shape1: TShape
      Left = 555
      Top = 41
      Width = 27
      Height = -13
      Brush.Color = 14996162
    end
    object Label9: TLabel
      Left = 586
      Top = 28
      Width = 185
      Height = 13
      Caption = 'Conta Orçamentaria possui valor'
    end
    object cboRatCriter: TCMDBLookupCombo
      Left = 16
      Top = 25
      Width = 257
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição'#9'F'
        'DESCTIPORAT'#9'19'#9'Tipo de Rateio'#9'F')
      LookupTable = CdsRatCriter
      LookupField = 'IDCRITERIORATORC'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtVlrRateio: TDBRealEdit
      Left = 296
      Top = 25
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
    end
  end
  inherited pnlFundo: TPanel
    Width = 991
    Height = 178
    Align = alTop
    BevelOuter = bvRaised
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Grupo orçamentário'
    end
    object Label4: TLabel
      Left = 280
      Top = 56
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object btBuscGrupo: TSpeedButton
      Left = 216
      Top = 22
      Width = 41
      Height = 24
      Hint = 'Procurar por um grupo de contas orçamentárias'
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
      NumGlyphs = 2
      OnClick = btBuscGrupoClick
    end
    object Label2: TLabel
      Left = 544
      Top = 56
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label5: TLabel
      Left = 681
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label6: TLabel
      Left = 544
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label10: TLabel
      Left = 16
      Top = 105
      Width = 54
      Height = 13
      Caption = 'Programa'
    end
    object Label11: TLabel
      Left = 280
      Top = 105
      Width = 97
      Height = 13
      Caption = 'Tipo de Despesa'
    end
    object lbl1: TLabel
      Left = 848
      Top = 56
      Width = 98
      Height = 13
      Caption = 'Atividade Projeto'
    end
    object Label12: TLabel
      Left = 280
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Plano Orçamentário'
    end
    object Label13: TLabel
      Left = 544
      Top = 105
      Width = 165
      Height = 13
      Caption = 'Fornecedores/Sub-Despesas'
    end
    object btBuscFornecedor: TSpeedButton
      Left = 796
      Top = 116
      Width = 28
      Height = 24
      Hint = 'Procurar por um fornecedor'
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
      NumGlyphs = 2
      OnClick = btBuscFornecedorClick
    end
    object edtDescGrupo: TEdit
      Left = 16
      Top = 24
      Width = 193
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object cboPatro: TCMDBLookupCombo
      Left = 280
      Top = 72
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'#9'F')
      LookupTable = CdsPatro
      LookupField = 'IDPATRO'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboPlano: TCMDBLookupCombo
      Left = 16
      Top = 72
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome'#9'F')
      LookupTable = CdsPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboCCusto: TCMDBLookupCombo
      Left = 544
      Top = 72
      Width = 282
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Centro de Custo'#9'F')
      LookupTable = cdsCCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = cboCCustoChange
    end
    object btSelContas: TBitBtn
      Left = 848
      Top = 108
      Width = 241
      Height = 33
      Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
      Caption = 'Selecionar contas orçamentárias'
      TabOrder = 11
      OnClick = btSelContasClick
      Glyph.Data = {
        DA060000424DDA06000000000000360000002800000016000000190000000100
        180000000000A406000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFF837272684C4C999596FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        F7FBE6EAF5E5E9F4F8F8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF64585848333386827FEBEBF2EBEBF2F6F7FBDEE0ED
        A9B0D37286C24D77C84E86D77893CCBDC3DFF4F5FAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFF606161393938A9A59E7081B97081B96E89
        C74D87D71E69D4124DBA1243AE2068CF3899F553A3ED7B9ED3C3C6DDC3C6DDFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF707171525352B0A9A680CAF280
        CAF277CFFF5ABDFF4FA7F5438ED8438BCE5186C56C95CA8CBBDC7DB9E279AEDC
        79AEDCFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF8182827B7A7ABDB8B7
        A7E7F1A7E7F1B7FAFFB3EEFFB2EBFBA8E0F1AEDDEEB7D1E5D9DBE5E3DDDEA7AD
        B790AFC990AFC9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9191918787
        86A6A5A2B0B7D0B0B7D0A9B1D2B9C0D1D1D6DDD3D6DBE8E3E3EFEAEAFBF9F9FF
        FFFFEEE9E4C2C0C6C2C0C6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE5
        E5E5DBDBDBEDEDECFFFFFFFFFFFFEBEAF1C4C0C6F1EDECFFFFFFFFFFFFFFFFFF
        FFFFFFF0F0F0FFFFFECFCECBCFCECBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEED7D7D5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2D3D0D1A49C9A7A80936B789F
        164CFFBF8577164CFF493328574238786861A39A96CAC6C5FFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAAACCF1164CFF164CFF164C
        FF3784FFEEBF9EBF8577C4B0B53784FF5A50524D382E6B5A53928884A9A2A1FF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE8F0F63884FFDBBEA9FF
        DCAFFDE0B8FEECC8FDEBD5ECB081FFE1B9F8F1EA7CA7FF63718E4630265F4D45
        6F605DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFCFCFCA9CCF54181F0
        FFDFB9FADDBAFDEECFFEF5E6ECC2A8F8C997FFE2C1FFF7EFFFFFFF7CA6FF80B3
        FF493A3252433DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF8F8F9439C
        F9439CF9FFECD3FFEEDBFFFBF6FFFEFDDD9F75FEDBAFFFECD7FFF8F1FFFDFCFF
        FFFF4E9CFF506D9052423BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDB
        E8F44092FAF8E0C8FFF2E2FFFBF6FFFEFEF2DCCCF5C899FFE9CCFFFBF7FFFEFE
        FFFFFFEDF5FF3091FF4D525F63534EFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF9CC9F1439CF9FFF8F2FFFAF5FFF9F4FDF9F6EBC2A3FEDCAFFFF3E3FFFD
        FCFFFFFFFFFFFF8CC3FF5BACFF5A483F81746FFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFF439CF9E1C9B5FFF3E7FFF3E8FFFCF9F3EAE5EEC8A5FFE8C9FF
        F4E8FFFAF5FFFFFFF9FCFF3A9DFF7D8EA272635CA49C98FFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF439CF9FFEEDDFFFFFFFFFFFFCCDDFF9DBAFFB2BCD9
        F8EDDFFFFEFDFFFFFFFFFFFFA5D2FF52ADFE5B4941918782C6C1BFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFF3695FF7FC5FFB7C7E1B9C9E2CCC7C6D8D5
        D4D2D8E6C7DDFEC3DEFFFFFFFFFFFFFF53B0FF90AAC280746FB4AFACE0DEDEFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDBEBFBF0F0F1EBEBEBEEEDEDF3
        F2F2F8F7F7FBFBFBFCFBFBD9E9FAAAD4FF7FC5FF65C2FFA3A3A4B2AEADD7D6D5
        F2F1F1FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF2F7FB7FC5FFBEDBF1DDDCDCE2E1
        E1F1F1F1FBFBFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF8F8F8F9
        F9F9FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    end
    object edtExercicio: TDBRealEdit
      Left = 680
      Top = 24
      Width = 70
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      MaxLength = 4
      TabOrder = 3
      WordWrap = False
      OnClick = edtExercicioClick
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object chkSobrescreve: TCheckBox
      Left = 16
      Top = 155
      Width = 409
      Height = 17
      Caption = 
        'Sobrescrever as dotações já efetuadas pelo o valor novo informad' +
        'o'
      TabOrder = 12
    end
    object cboPeriodo: TwwDBComboBox
      Left = 544
      Top = 24
      Width = 121
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'ANUAL'#9'0'
        'JANEIRO'#9'1'
        'FEVEREIRO'#9'2'
        'MARÇO'#9'3'
        'ABRIL'#9'4'
        'MAIO'#9'5'
        'JUNHO'#9'6'
        'JULHO'#9'7'
        'AGOSTO'#9'8'
        'SETEMBRO'#9'9'
        'OUTUBRO'#9'10'
        'NOVEMBRO'#9'11'
        'DEZEMBRO'#9'12')
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
      OnChange = edtExercicioClick
    end
    object cboPrograma: TCMDBLookupCombo
      Left = 16
      Top = 120
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PROGRAMA'#9'20'#9'Programa'#9'F')
      LookupTable = cdsPrograma
      LookupField = 'IDPROGRAMAORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboTipoDespesa: TCMDBLookupCombo
      Left = 280
      Top = 120
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPODESPESA'#9'15'#9'Tipo Despesa'#9'F')
      LookupTable = cdsTipoDespesa
      LookupField = 'IDTIPO_DEPESAORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboAtividadeProjeto: TCMDBLookupCombo
      Left = 848
      Top = 72
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Atividade de Projeto'#9'F'
        'UNIDNEGOC'#9'8'#9'Código'#9'F')
      LookupTable = cdsAtividadeProj
      LookupField = 'UNIDNEGOC'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboPlanoOrc: TCMDBLookupCombo
      Left = 280
      Top = 24
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPLANOORC'#9'25'#9'Plano Orçamentário'#9'F'
        'ANO'#9'3'#9'Ano'#9'F')
      LookupTable = cdsPlanoOrc
      LookupField = 'IDPLANOORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = cboPlanoOrcChange
    end
    object edtFornDesp: TEdit
      Left = 544
      Top = 120
      Width = 249
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
  end
  inherited Dock972: TDock97
    Width = 991
  end
  inherited Dock971: TDock97
    Top = 518
    Width = 991
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520010
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object Grid: TwwDBGrid [4]
    Left = 0
    Top = 251
    Width = 991
    Height = 204
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    Selected.Strings = (
      'SELECIONADO'#9'4'#9' '
      'CENTROCUSTO'#9'28'#9'Centro de Custo'
      'SUBDESPESA'#9'28'#9'Fornecedor / Sub-Despesa'
      'ATIVPROJ'#9'14'#9'Atividade / ~Projeto'
      'PROGRAMA'#9'15'#9'Programa'
      'TIPODESPESA'#9'15'#9'Tipo de Despesa'
      'PLANO'#9'40'#9'Plano'
      'PATRO'#9'18'#9'Patrocinadora'
      'PERIODO'#9'10'#9'Período'
      'EXERCICIO'#9'10'#9'Exercício'
      'VALOR'#9'15'#9'Valor'
      'VLRORCADO'#9'15'#9'Valor de dotação ~já efetuado'
      'NOMECRITERIO'#9'39'#9'Critério de ~Rateio utilizado')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = GridRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Color = clWhite
    DataSource = ds
    ImeMode = imHanguel
    KeyOptions = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = True
    OnCalcCellColors = GridCalcCellColors
    OnTitleButtonClick = GridTitleButtonClick
    OnExit = GridExit
    IndicatorColor = icBlack
    OnTopRowChanged = GridTopRowChanged
    OnUpdateFooter = GridUpdateFooter
  end
  object pnlTotalContas: TPanel [5]
    Left = 0
    Top = 225
    Width = 991
    Height = 26
    Align = alTop
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 650
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 584
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 720
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    Left = 292
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'S.PERIODO'
      'S.EXERCICIO'
      'D.SUBDESPESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Cód. Grupo'
      'Nome'
      'Período'
      'Exercício'
      'Sub-Despesa')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N'
      'S')
    Tabelas.Strings = (
      'SALDOORCADO S'
      'GRUPOORCAMEN G'
      'CONTASORCAMEN C'
      'PLANOORCAMENTARIO P'
      'DESPESAORCAMENTARIA D')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'S.PERIODO'
      'S.EXERCICIO'
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'S.IDPLANOORCAMEN'
      'NVL(D.IDDESPESAORC, -1)')
    Filtro.Strings = (
      'C.IDCONTAORCAMEN = S.IDCONTAORCAMEN'
      'C.IDPESSOA = S.IDPESSOA'
      'C.IDPLANOORCAMEN = S.IDPLANOORCAMEN'
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN'
      'C.FLGATIVA = '#39'A'#39
      'C.IDPLANOORCAMEN = P.IDPLANOORCAMEN'
      'G.IDPLANOORCAMEN = P.IDPLANOORCAMEN'
      'S.IDDESPESAORC = D.IDDESPESAORC(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '0'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    BeforeOpenCds = MontaSelectBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 368
    Top = 7
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 649
    Top = 297
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 721
    Top = 297
  end
  object cdsPlanoTrab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 33
    Top = 361
  end
  object msGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'P.NOMEPLANOORC'
      'P.ANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo'
      'Plano Orçamentário'
      'Ano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G'
      'CONTASORCAMEN C'
      'PLANOORCAMENTARIO P')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC'
      'G.IDPLANOORCAMEN')
    Filtro.Strings = (
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN'
      'G.IDPLANOORCAMEN = P.IDPLANOORCAMEN'
      'C.FLGATIVA = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 777
    Top = 9
  end
  object CdsRatCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 288
  end
  object qryAcesso: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select distinct G.CODGRUPOORC,'
      '                      G.NOMEGRUPOORCAMEN,'
      '                      UXA.IDPESSOAACESSO,'
      '                      UXA.CODCENTRORESPON,'
      '                      UXA.IDPESSOA'
      '        From GRUPOORCAMEN G, PESSOAXCRESP UXA, CONTASORCAMEN C'
      '       where (UXA.Codcentrorespon = C.codcentrorespon)'
      '         and (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '         and (UXA.IDPESSOAACESSO =:idusuario)'
      '         and (G.IDGRUPOORCAMEN   =:idgrupo)'
      ' ')
    Left = 320
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idgrupo'
        ParamType = ptUnknown
      end>
  end
  object CdsDadosAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAfterOpen
    Left = 236
    Top = 343
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 297
  end
  object cdsTipoDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 561
    Top = 297
  end
  object cdsAtividadeProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 801
    Top = 297
  end
  object cdsPlanoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 961
    Top = 297
  end
  object cdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 889
    Top = 297
  end
  object msDespesa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'D.SUBDESPESA'
      'DECODE(D.NATUREZA, '#39'ND'#39', '#39'NOVA DEMANDA'#39', '#39'OPERACIONAL'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Fornecedor'
      'Sub-Despesa'
      'Natureza')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DESPESAORCAMENTARIA D'
      'PESSOA P')
    CamposChave.Strings = (
      'D.IDDESPESAORC'
      'D.IDFORNECEDOR'
      'D.SUBDESPESA'
      'P.NOME')
    Filtro.Strings = (
      'D.IDFORNECEDOR = P.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '50'
      '15')
    OperComparador.Strings = (
      '0'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 848
    Top = 7
  end
end
