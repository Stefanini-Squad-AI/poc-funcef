inherited frmMTLancCaixaPeq: TfrmMTLancCaixaPeq
  Left = 0
  Top = 43
  HelpContext = 1130018
  Caption = 'Lançamento de Caixa Pequeno'
  ClientHeight = 401
  ClientWidth = 747
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 747
    Height = 315
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object btnSCI: TSpeedButton
      Left = 308
      Top = 52
      Width = 29
      Height = 23
      Hint = 'Seleciona SCI'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSCIClick
    end
    object btnApaga: TSpeedButton
      Left = 308
      Top = 75
      Width = 29
      Height = 23
      Hint = 'Remove a Seleção da SCI'
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000012000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888000000888888078888888888000000888880D078888888880000008888
        0DD507888888880000008880DD705078888888000000880DD7DD050788888800
        000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
        607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
        0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
        000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
        E0888800000088888888880E0888880000008888888888808888880000008888
        88888888888888000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnApagaClick
    end
    object Label5: TLabel
      Left = 352
      Top = 9
      Width = 101
      Height = 13
      Caption = 'Nº do Documento'
    end
    object Label2: TLabel
      Left = 496
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 624
      Top = 9
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label6: TLabel
      Left = 352
      Top = 47
      Width = 51
      Height = 13
      Caption = 'Histórico'
    end
    object Label8: TLabel
      Left = 16
      Top = 178
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label11: TLabel
      Left = 16
      Top = 139
      Width = 54
      Height = 13
      Caption = 'Programa'
    end
    object Label10: TLabel
      Left = 16
      Top = 101
      Width = 116
      Height = 13
      Caption = 'Tipo de Desembolso'
    end
    object Label7: TLabel
      Left = 16
      Top = 219
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object lblSubConta: TLabel
      Left = 352
      Top = 258
      Width = 60
      Height = 13
      Caption = 'Sub-Conta'
    end
    object Label23: TLabel
      Left = 16
      Top = 260
      Width = 113
      Height = 13
      Caption = 'Sub-Despesa (FDO)'
    end
    object Label9: TLabel
      Left = 352
      Top = 150
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 16
      Top = 25
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'Descrição'#9'No')
      DataField = 'IDCAIXAPEQUENO'
      DataSource = ds
      LookupTable = cdsCxPeq
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcCaixaPeqChange
    end
    object memSCI: TMemo
      Left = 16
      Top = 53
      Width = 291
      Height = 45
      TabStop = False
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'SCI Nº   :'
        'ARTIGO :')
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object edNumDoc: TDBEdit
      Left = 352
      Top = 25
      Width = 137
      Height = 21
      DataField = 'NODOCUMENTO'
      DataSource = ds
      TabOrder = 6
    end
    object edDatalanc: TCMDateTimePicker
      Left = 496
      Top = 25
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATALANC'
      DataSource = ds
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
      TabOrder = 7
    end
    object edValLanc: TDBRealEdit
      Left = 624
      Top = 25
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0.00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRLANC'
      DataSource = ds
    end
    object memHist: TDBMemo
      Left = 354
      Top = 65
      Width = 385
      Height = 40
      DataField = 'HISTLANCAMENTO'
      DataSource = ds
      MaxLength = 200
      TabOrder = 9
    end
    object dblcCentCust: TCMDBLookupCombo
      Left = 16
      Top = 194
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTROCUSTO'#9'10'#9'Código')
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = cdsCentroCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCentCustCloseUp
    end
    object dblcPrograma: TCMDBLookupCombo
      Left = 16
      Top = 155
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPROGRAMA'#9'30'#9'Descrição'
        'CODPROGRAMA'#9'2'#9'Código')
      DataField = 'IDPROGRAMA'
      DataSource = ds
      LookupTable = cdsPrograma
      LookupField = 'IDPROGRAMA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcProgramaCloseUp
    end
    object dblcTipoRecDeb: TCMDBLookupCombo
      Left = 16
      Top = 117
      Width = 320
      Height = 21
      Hint = 'Escolha um caixa pequeno.'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = cdsTipoDesemb
      LookupField = 'CODTIPRECDES'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcTipoRecDebCloseUp
    end
    object dblcCentResp: TCMDBLookupCombo
      Left = 16
      Top = 235
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = cdsCentroRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcSubConta: TwwDBLookupCombo
      Left = 352
      Top = 274
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMESUBCONTA'#9'60'#9'Descrição')
      DataField = 'CODSUBCONTA'
      DataSource = ds
      LookupTable = cdsSubConta
      LookupField = 'CODSUBCONTA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 14
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcUnNegoc: TCMDBLookupCombo
      Left = 352
      Top = 166
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = cdsAtivProj
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cmpContab: TCMProcuraMaskContabil
      Left = 352
      Top = 188
      Width = 390
      Height = 64
      Caption = ' Conta Contábil '
      TabOrder = 12
      OnExit = cmpContabExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
      Mensagens.NaoExiste = 'Conta Contábil não existe'
      Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
      Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Mascara = '9.9.9.9.99.99.99'
      Plano = 2
      Status = scSoAtiva
    end
    object CboSubDespesa: TCMDBLookupCombo
      Left = 16
      Top = 276
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SUBDESPESA'#9'15'#9'Sub-Despesa'#9'F')
      DataField = 'IDDESPESAORC'
      DataSource = ds
      LookupField = 'IDDESPESAORC'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object grbFornecedor: TGroupBox
      Left = 352
      Top = 106
      Width = 385
      Height = 44
      Caption = 'Fornecedor'
      TabOrder = 10
      object CmpFornecedor: TCMProcura
        Left = 4
        Top = 13
        Width = 377
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        DataSource = ds
        DataField = 'IDFORNECEDOR'
        LookupChave = 'IDPESSOA'
        LookupDescricao = 'RAZAOSOCIAL'
        MontaSelect = MSFornecedor
        LookupTabela = 'PESSOA'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 747
  end
  inherited Dock971: TDock97
    Top = 362
    Width = 747
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130018
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 374
    Top = 8
  end
  inherited Cds: TCMClientDataSet
    Left = 490
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LANCCAIXAPEQ.IDLANCCXPEQ'
      'LANCCAIXAPEQ.NODOCUMENTO'
      'CAIXAPEQUENO.DESCCAIXAPEQ'
      'LANCCAIXAPEQ.DATALANC'
      'LANCCAIXAPEQ.VLRLANC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Nº do Lançamentto'
      'Nº do Documento'
      'Caixa Pequeno'
      'Data'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LANCCAIXAPEQ'
      'CAIXAPEQUENO'
      'USUARIOXCAIXAPEQ')
    CamposChave.Strings = (
      'LANCCAIXAPEQ.IDLANCCXPEQ')
    Filtro.Strings = (
      'LANCCAIXAPEQ.IDBORDEROCXPEQ IS NULL'
      'CAIXAPEQUENO.IDCAIXAPEQUENO = USUARIOXCAIXAPEQ.IDCAIXAPEQUENO'
      'CAIXAPEQUENO.IDCAIXAPEQUENO = LANCCAIXAPEQ.IDCAIXAPEQUENO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '10'
      '20'
      '60'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
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
    Left = 594
    Top = 8
  end
  object cdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 414
    Top = 37
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 587
    Top = 28
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 135
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 279
    Top = 7
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 455
    Top = 15
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 555
    Top = 12
  end
  object msSCI: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ITEMSOLI.NUMSOLCOMPRA'
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'ITEMSOLI.QTDEPEDIDA'
      'ITEMSOLI.QTDEPENDENTE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Nº da SCI'
      'Código do Artigo'
      'Descrição do Artigo'
      'Quantidade Pedida'
      'Quantidade Pendente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMSOLI'
      'ARTIGO'
      'PRODUTO'
      'SOLICOMP'
      'GRUPPROD')
    CamposChave.Strings = (
      'ITEMSOLI.NUMSOLCOMPRA'
      'ITEMSOLI.CODARTIGO'
      'PRODUTO.DESCPROD'
      'SOLICOMP.CODCENTROCUSTO'
      'SOLICOMP.CODCENTRORESPON'
      'SOLICOMP.UNIDNEGOC'
      'ITEMSOLI.IDITEMSOLI'
      'PRODUTO.CODGRUPOPROD'
      'SOLICOMP.CODALMOXARIFADO'
      'GRUPPROD.CODTIPRECDES')
    Filtro.Strings = (
      'SOLICOMP.CUSTOESTOQUE = '#39'C'#39
      'ITEMSOLI.QTDEPENDENTE > 0'
      'ITEMSOLI.CODARTIGO = ARTIGO.CODARTIGO'
      'ITEMSOLI.NUMSOLCOMPRA = SOLICOMP.NUMSOLCOMPRA'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'ITEMSOLI.IDCOMPRADOR IS NULL'
      'GRUPPROD.CODGRUPOPROD = PRODUTO.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,####0.0000'
      '#,####0.0000')
    Larguras.Strings = (
      '10'
      '14'
      '40'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 624
    Top = 9
  end
  object cdsCxPeq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 327
    Top = 15
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      '')
    ClientDataSet = cdsAux
    Left = 658
    Top = 9
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 518
    Top = 136
  end
  object MSFornecedor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cliente'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO'
      'FORNSERV.CODCORRESP'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Número do Documento'
      'Código Correspondente'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=FORNSERV.IDPESSOA'
      'PESSOA.IDPESSOA=EMPRESAFORN.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '30'
      '10')
    OperComparador.Strings = (
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
    Left = 708
    Top = 19
  end
end
