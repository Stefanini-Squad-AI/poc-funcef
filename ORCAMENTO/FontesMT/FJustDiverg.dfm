inherited FrmJustDiverg: TFrmJustDiverg
  Left = 264
  Top = 192
  HelpContext = 520084
  BorderIcons = [biSystemMenu]
  Caption = 'Justificativa de divergências entre saldos Orçados x Realizados'
  ClientHeight = 311
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 225
    object Label1: TLabel
      Left = 16
      Top = 168
      Width = 69
      Height = 13
      Caption = 'Justificativa'
    end
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 113
      Height = 13
      Caption = 'Conta Orçamentária'
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Período:'
    end
    object Label5: TLabel
      Left = 208
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object edtAno: TDBRealEdit
      Left = 208
      Top = 80
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Lines.Strings = (
        '0')
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
      DataField = 'EXERCICIO'
      DataSource = ds
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 120
      Width = 473
      Height = 89
      DataField = 'DESCRICAO'
      DataSource = ds
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 32
      Width = 425
      Height = 21
      Color = clBtnFace
      DataField = 'IDCONTAORCAMEN'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
    end
    object btProcurar: TBitBtn
      Left = 447
      Top = 30
      Width = 33
      Height = 26
      TabOrder = 3
      OnClick = btProcurarClick
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
    end
    object cboMes: TwwDBLookupCombo
      Left = 16
      Top = 80
      Width = 153
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'20'#9'Descrição'#9'F')
      DataField = 'PERIODO'
      DataSource = ds
      LookupTable = CdsPeriodo
      LookupField = 'PERIODO'
      Options = [loTitles]
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 272
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520084
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 442
    Top = 15
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 464
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 400
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 268
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'C.IDCONTAORCAMEN'
      'C.NOMECONTAORCAMEN'
      'D.PERIODO'
      'D.EXERCICIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Código Grupo'
      'Nome Grupo'
      'Código da Conta'
      'Nome da Conta'
      'Período'
      'Exercício')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DESCDIVERGORC D'
      'CONTASORCAMEN C'
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'D.IDDESCDIVERGORC')
    Filtro.Strings = (
      'D.IDCONTAORCAMEN = C.IDCONTAORCAMEN'
      'D.IDPLANOORCAMEN = C.IDPLANOORCAMEN'
      'G.IDPLANOORCAMEN = C.IDPLANOORCAMEN'
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '20'
      '30'
      '25'
      '7'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 320
    Top = 7
  end
  object MsContaOrc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'C.IDCONTAORCAMEN'
      'C.NOMECONTAORCAMEN'
      'CR.NOME'
      'CC.NOME'
      'U.NOME'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Grupo'
      'Nome do Grupo'
      'Código da conta'
      'Nome da conta'
      'Centro de Responsabilidade'
      'Centro de Custo'
      'Atividade/Projeto'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN C'
      'GRUPOORCAMEN G'
      'CENTRESPON CR'
      'CENTCUST CC'
      'UNIDNEGOCIO U'
      'PLANPREVCONTABIL PL'
      'PESSOA PT')
    CamposChave.Strings = (
      'C.IDCONTAORCAMEN'
      'C.IDPLANOORCAMEN')
    Filtro.Strings = (
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN'
      'G.IDPLANOORCAMEN = C.IDPLANOORCAMEN'
      'C.CODCENTRORESPON = CR.CODCENTRORESPON(+)'
      'C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      'C.UNIDNEGOC = U.UNIDNEGOC(+)'
      'C.IDPLANOPREV = PL.IDPLANOPREV(+)'
      'C.IDPATRO = PT.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '30'
      '40'
      '20'
      '20'
      '20'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 448
    Top = 111
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 111
  end
end
