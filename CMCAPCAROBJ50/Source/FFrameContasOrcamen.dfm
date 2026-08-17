object FrameContasOrcamen: TFrameContasOrcamen
  Left = 0
  Top = 0
  Width = 637
  Height = 100
  TabOrder = 0
  object gbMargem: TGroupBox
    Left = 0
    Top = 0
    Width = 637
    Height = 100
    Align = alClient
    TabOrder = 0
    object lblCodigoConta: TLabel
      Left = 5
      Top = 9
      Width = 79
      Height = 13
      Caption = 'Código da Conta'
    end
    object Label3: TLabel
      Left = 5
      Top = 53
      Width = 133
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label11: TLabel
      Left = 406
      Top = 53
      Width = 75
      Height = 13
      Caption = 'Grupo da Conta'
    end
    object lblNome: TLabel
      Left = 333
      Top = 9
      Width = 140
      Height = 13
      Caption = 'Nome da Conta Orçamentária'
    end
    object dbeCodigoConta: TwwDBEdit
      Left = 5
      Top = 23
      Width = 291
      Height = 21
      DataField = 'IDCONTAORCAMEN'
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtCentroResp: TEdit
      Left = 5
      Top = 68
      Width = 387
      Height = 21
      TabStop = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtGrupo: TEdit
      Left = 404
      Top = 68
      Width = 222
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtNomeConta: TEdit
      Left = 333
      Top = 23
      Width = 294
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object bbtnBuscaConta: TBitBtn
      Left = 298
      Top = 24
      Width = 25
      Height = 21
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnBuscaContaClick
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
    end
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CENTRESPON.CODEXTERNO AS CODCENTRORESPON'
      'CENTRESPON.NOME'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO'
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'CENTCUST.NOME'
      'CENTCUST.CODCENTROCUSTO')
    TipodeDado.Strings = (
      'C'
      'C'
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
      'Código da Conta'
      'Nome da Conta'
      'Cód.Cent.Resp.'
      'Centro de Responsabilidade'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado'
      'Tipo de Recebimento/Desembolso'
      'Descrição do Recebimento/Desembolso'
      'Nome do Centro de Custo'
      'Código Centro Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'CONTASORCAMEN'
      'TIPORECEBDESEMB'
      'CENTCUST'
      'COMPCONTASORCAMEN'
      'CENTRESPON')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.TIPOCALCREALIZADO')
    Filtro.Strings = (
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDRES(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDFIM(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDINI(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAREFREAL(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAREFORCAD' +
        'O(+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      'TIPORECEBDESEMB.IDPESSOA(+) = COMPCONTASORCAMEN.IDPESSOA'
      'TIPORECEBDESEMB.RECPAG(+) = COMPCONTASORCAMEN.RECPAG'
      'TIPORECEBDESEMB.CODTIPRECDES(+) = COMPCONTASORCAMEN.CODTIPRECDES'
      'CENTCUST.IDEMPRESA(+) = COMPCONTASORCAMEN.IDEMPRESA'
      'CENTCUST.CODCENTROCUSTO(+) = COMPCONTASORCAMEN.CODCENTROCUSTO'
      'CONTASORCAMEN.FLGATIVA = '#39'A'#39
      'CENTRESPON.CODCENTRORESPON = CONTASORCAMEN.CODCENTRORESPON')
    Mascaras.Strings = (
      ''
      ''
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
      '25'
      '60'
      '20'
      '40'
      '60'
      '1'
      '1'
      '15'
      '35'
      '30'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
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
    Left = 224
  end
end
