inherited frmMTMovAcrescimoValor: TfrmMTMovAcrescimoValor
  Left = 321
  Top = 180
  HelpContext = 70037
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Acréscimo/Decréscimo de Valor'
  ClientHeight = 356
  ClientWidth = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 675
    Height = 317
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 673
      Height = 180
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Data: TLabel
        Left = 16
        Top = 8
        Width = 132
        Height = 13
        Caption = 'Data da Movimentação'
      end
      object Label26: TLabel
        Left = 160
        Top = 8
        Width = 127
        Height = 13
        Caption = 'Placa de Tombamento'
      end
      object Label22: TLabel
        Left = 330
        Top = 8
        Width = 104
        Height = 13
        Caption = 'Descrição do Bem'
      end
      object Label1: TLabel
        Left = 330
        Top = 88
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label17: TLabel
        Left = 16
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Label8: TLabel
        Left = 16
        Top = 128
        Width = 85
        Height = 13
        Caption = 'Grupo Contábil'
      end
      object edData: TCMDateTimePicker
        Left = 16
        Top = 24
        Width = 132
        Height = 21
        Hint = 'Data Programada para Pagamento'
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
        ParentShowHint = False
        ShowHint = True
        ShowButton = True
        TabOrder = 0
        OnExit = edDataExit
      end
      object edPlaca: TEdit
        Left = 160
        Top = 24
        Width = 138
        Height = 21
        TabOrder = 1
        OnExit = edPlacaExit
      end
      object bbtnSelBem: TBitBtn
        Left = 298
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = bbtnSelBemClick
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
      object dbeDesBem: TDBMemo
        Left = 330
        Top = 24
        Width = 336
        Height = 62
        DataField = 'DESBEM'
        DataSource = dsSelBem
        TabOrder = 3
      end
      object dbeNomeResp: TwwDBEdit
        Left = 16
        Top = 104
        Width = 306
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = dsSelBem
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDescLocalizacao: TwwDBEdit
        Left = 16
        Top = 64
        Width = 306
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsSelBem
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeConjunto: TwwDBEdit
        Left = 330
        Top = 104
        Width = 336
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsSelBem
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edDescGrupo: TwwDBEdit
        Left = 16
        Top = 144
        Width = 651
        Height = 21
        DataField = 'DESCGRUPO'
        DataSource = dsSelBem
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object PnlDetalhe: TPanel
      Left = 1
      Top = 181
      Width = 673
      Height = 135
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label46: TLabel
        Left = 16
        Top = 48
        Width = 195
        Height = 13
        Caption = 'Tipo Específico de Movimentação'
      end
      object Label15: TLabel
        Left = 16
        Top = 88
        Width = 134
        Height = 13
        Caption = 'Valor da Movimentação'
      end
      object Label25: TLabel
        Left = 344
        Top = 8
        Width = 258
        Height = 13
        Caption = 'Descrição do Fato Gerador da Movimentação'
      end
      object lblTipoMov: TLabel
        Left = 16
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Movimentação'
      end
      object cmbTipoDespesa: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESTIPODESPESA'#9'50'#9'Descrição')
        LookupTable = cdsTipoDespesa
        LookupField = 'IDTIPODESPESA'
        Options = [loTitles]
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object edValAcres: TRealEdit
        Left = 16
        Top = 104
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edObsAcres: TMemo
        Left = 344
        Top = 24
        Width = 323
        Height = 62
        MaxLength = 60
        TabOrder = 3
      end
      object dblcTipoMovimento: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOMOVIMENTACAO'#9'40'#9'Descrição')
        LookupTable = cdsMovimento
        LookupField = 'IDTIPOMOVIMENTACAO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblcTipoMovimentoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 317
    Width = 675
    inherited tb97Fundo: TToolbar97
      Left = 489
      DockPos = 565
      inherited sep1: TToolbarSep97
        Left = 179
      end
      inherited sep3: TToolbarSep97
        Left = 88
      end
      inherited bbtnSair: TBitBtn
        Width = 88
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 91
        Width = 88
        HelpContext = 70037
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 306
      DockPos = 382
      inherited ToolbarSep971: TToolbarSep97
        Left = 88
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 88
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 91
        Width = 88
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 482
    Top = 399
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 528
    Top = 40
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 34
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação')
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
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.CONTROLE='#39'T'#39
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 527
    Top = 12
  end
  object dsTipoDespesa: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 260
    Top = 264
  end
  object cdsTipoDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 315
    Top = 259
  end
  object sqlTipoDespesa: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPODESPESA,DESTIPODESPESA '
      'FROM TIPODESPESAAV'
      'ORDER BY DESTIPODESPESA')
    ClientDataSet = cdsTipoDespesa
    Left = 379
    Top = 237
  end
  object cdsMovimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 156
  end
end
