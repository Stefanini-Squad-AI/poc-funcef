inherited FrmSuplememPorGrupoMT: TFrmSuplememPorGrupoMT
  Left = 140
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'FrmSuplememPorGrupoMT'
  ClientHeight = 397
  ClientWidth = 714
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 714
    Height = 166
    Align = alTop
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Grupo orçamentário'
    end
    object btBuscGrupoOrigem: TSpeedButton
      Left = 265
      Top = 22
      Width = 91
      Height = 24
      Hint = 'Procurar por um grupo de contas orçamentárias'
      Caption = 'Procurar...'
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
      OnClick = btBuscGrupoOrigemClick
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 101
      Height = 13
      Caption = 'Plano de trabalho'
    end
    object Label5: TLabel
      Left = 16
      Top = 104
      Width = 91
      Height = 13
      Caption = 'Centro de custo'
    end
    object Label6: TLabel
      Left = 195
      Top = 104
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label4: TLabel
      Left = 384
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label3: TLabel
      Left = 384
      Top = 56
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label20: TLabel
      Left = 384
      Top = 104
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label22: TLabel
      Left = 456
      Top = 104
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object edtDescGrupo: TEdit
      Left = 16
      Top = 24
      Width = 241
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object cboPlanoTrab: TCMDBLookupCombo
      Left = 16
      Top = 72
      Width = 341
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'20'#9'Descrição'#9'F'
        'IDPLANOTRABALHO'#9'8'#9'Código'#9'F'
        'NOMECR'#9'20'#9'Centro Respon.'#9'F'
        'NOMEUN'#9'20'#9'Atividade/Projeto'#9'F')
      LookupTable = CdsPlanoTrab
      LookupField = 'IDPLANOTRABALHO'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboCCusto: TwwDBLookupCombo
      Left = 16
      Top = 117
      Width = 161
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Descrição'#9'F'
        'CODEXTERNO'#9'10'#9'Código'#9'F')
      LookupTable = CdsCCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = False
    end
    object cboCentroRespon: TwwDBLookupCombo
      Left = 195
      Top = 117
      Width = 161
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Descrição'#9'F'
        'CODCENTRORESPON'#9'10'#9'Código'#9'F')
      LookupTable = CdsCRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = False
    end
    object cboPatroOrigem: TCMDBLookupCombo
      Left = 384
      Top = 24
      Width = 312
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPATRO'#9'40'#9'Descrição'#9'F')
      LookupTable = CdsPatro
      LookupField = 'IDPATRO'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = cboPatroOrigemEnter
    end
    object cboPlanoOrigem: TCMDBLookupCombo
      Left = 384
      Top = 72
      Width = 312
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPLANO'#9'40'#9'Descrição'#9'F')
      LookupTable = CdsPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = cboPlanoOrigemEnter
    end
    object edtPeriodo: TDBRealEdit
      Left = 384
      Top = 117
      Width = 47
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 6
      WordWrap = False
      IntDigits = 2
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object edtExercicio: TDBRealEdit
      Left = 456
      Top = 117
      Width = 57
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 7
      WordWrap = False
      IntDigits = 4
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object btSelContas: TBitBtn
      Left = 536
      Top = 106
      Width = 158
      Height = 33
      Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
      Caption = 'Selecionar contas'
      TabOrder = 8
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
  end
  inherited Dock972: TDock97
    Width = 714
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 714
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object Grid: TwwDBGrid [3]
    Left = 0
    Top = 213
    Width = 714
    Height = 145
    Selected.Strings = (
      'DATAREFERENCIA'#9'18'#9'Data~Referência'
      'PERIODO'#9'7'#9'Período'
      'EXERCICIO'#9'8'#9'Exercício'
      'IDCONTAORCAMEN'#9'27'#9'Conta ~Orçamentária'
      'NOMECONTAORCAMEN'#9'29'#9'Nome da Conta~Orçamentária'
      'CENTROCUSTO'#9'28'#9'Centro de ~Custo'
      'CENTRORESPON'#9'25'#9'Centro de~Responsabilidade'
      'VLRSUPLEMEM'#9'13'#9'Valor da~Suplementação'
      'SALDO'#9'12'#9'Saldo~Disponível')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = GridRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = dsContas
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = False
    OnCalcCellColors = GridCalcCellColors
    OnExit = GridExit
    IndicatorColor = icBlack
    OnTopRowChanged = GridTopRowChanged
    OnUpdateFooter = GridUpdateFooter
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65522
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
    Left = 65528
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 328
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsContasAfterOpen
    Left = 292
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 400
    Top = 7
  end
  object CdsPlanoTrab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 777
    Top = 57
  end
  object CdsCRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 774
    Top = 113
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 777
    Top = 161
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 881
    Top = 113
  end
  object CdsContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasAfterOpen
    BeforePost = CdsContasBeforePost
    Left = 664
    Top = 255
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 822
    Top = 153
  end
  object msGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'C.IDCONTAORCAMEN'
      'C.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo'
      'Conta orçamentária'
      'Nome da conta orçamentária')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G'
      'CONTASORCAMEN C')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC')
    Filtro.Strings = (
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN (+)  ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '30'
      '40')
    OperComparador.Strings = (
      '-1'
      '7'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 481
    Top = 9
  end
  object dsContas: TDataSource
    DataSet = CdsContas
    Left = 584
    Top = 256
  end
end
