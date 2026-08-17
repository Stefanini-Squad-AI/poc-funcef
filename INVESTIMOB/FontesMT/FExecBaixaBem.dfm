inherited frmExecBaixaBem: TfrmExecBaixaBem
  Left = 347
  Top = 226
  HelpContext = 540069
  Caption = 'Baixa Bens'
  ClientHeight = 301
  ClientWidth = 558
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 262
    object Label3: TLabel
      Left = 403
      Top = 111
      Width = 132
      Height = 13
      Caption = 'Data da Movimentação'
    end
    object Label1: TLabel
      Left = 21
      Top = 64
      Width = 25
      Height = 13
      Caption = 'Bem'
    end
    object Label2: TLabel
      Left = 21
      Top = 111
      Width = 92
      Height = 13
      Caption = 'Motivo da Baixa'
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 158
      Width = 267
      Height = 89
      Caption = 'Observações do Evento'
      TabOrder = 0
      object memEvento: TMemo
        Left = 14
        Top = 20
        Width = 237
        Height = 59
        MaxLength = 2000
        TabOrder = 0
      end
    end
    object rdgTipoMov: TRadioGroup
      Left = 21
      Top = 16
      Width = 519
      Height = 40
      Caption = ' Tipo de Movimentação '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Baixar bem'
        'Desfazer baixa')
      TabOrder = 1
    end
    object edtDataMovim: TCMDateTimePicker
      Left = 404
      Top = 127
      Width = 137
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 2
      DisplayFormat = 'dd/mm/yyyy'
    end
    object edContaDestino: TCMProcuraMaskContabil
      Left = 298
      Top = 158
      Width = 242
      Height = 89
      Caption = ' Conta Contábil - Destino '
      TabOrder = 3
      MostraMensagens = True
      MostraDescricao = True
      DataSource = dsContaDestino
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintética'
      Mensagens.Analitica = 'Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scSoAtiva
    end
    object edtBem: TEdit
      Left = 21
      Top = 80
      Width = 494
      Height = 21
      Color = 14155775
      ReadOnly = True
      TabOrder = 4
    end
    object spdPesquisa: TBitBtn
      Left = 517
      Top = 80
      Width = 21
      Height = 21
      TabOrder = 5
      OnClick = spdPesquisaClick
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
    object cmbMotivoBaixa: TwwDBLookupCombo
      Left = 21
      Top = 128
      Width = 372
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCMOTIVOBAIXA'#9'30'#9'Descrição')
      LookupTable = cdsMotivoBaixa
      LookupField = 'IDMOTIVOBAIXA'
      Options = [loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 262
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 443
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dsContaDestino: TwwDataSource
    AutoEdit = False
    DataSet = cdsContaDestino
    Left = 456
    Top = 192
  end
  object cdsContaDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 195
  end
  object sqlContaDestino: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDGRUPO, IDTIPOMOVIMENTACAO, TIPOLANCAMENTO, PLANO, PLACO' +
        'NTA'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE IDGRUPO = :IDGRUPO'
      '  AND IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      '  AND TIPOLANCAMENTO = :TIPOLANCAMENTO'
      '  AND PLANO = :PLANO'
      '')
    ClientDataSet = cdsContaDestino
    Left = 328
    Top = 189
  end
  object cdsMotivoBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 112
  end
  object sqlMotivoBaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT DESCMOTIVOBAIXA,IDMOTIVOBAIXA'
      'FROM MOTIVOBAIXA'
      'ORDER BY DESCMOTIVOBAIXA')
    ClientDataSet = cdsMotivoBaixa
    Left = 168
    Top = 114
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'GRUPO.NOME'
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Código do Imóvel'
      'Grupo Contábil'
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Classe')
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
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'IMOVELXBEM IXB'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO'
      'BEM.IDGRUPO'
      'I.IDIMOVEL')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'BEM.IDBEM = IXB.IDBEM'
      'IXB.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      'BEM.IDMODULO = 54'
      '1=1')
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
      '20'
      '20'
      '60'
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60')
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
    LookupSQL.Strings = (
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
    LookupCampoChave.Strings = (
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
    LookupCampoExibe.Strings = (
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
    Left = 376
    Top = 72
  end
end
