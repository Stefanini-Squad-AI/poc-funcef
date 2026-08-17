inherited frmMTMovReavaliacao: TfrmMTMovReavaliacao
  Left = 61
  Top = 132
  HelpContext = 70037
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Reavaliação Patrimonial'
  ClientHeight = 336
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 297
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 690
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
      object Label2: TLabel
        Left = 360
        Top = 128
        Width = 83
        Height = 13
        Caption = 'Saldo Contábil'
      end
      object Label3: TLabel
        Left = 513
        Top = 147
        Width = 17
        Height = 13
        Caption = 'em'
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
        Width = 337
        Height = 21
        DataField = 'DESCGRUPO'
        DataSource = dsSelBem
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edValSaldoContabil: TRealEdit
        Left = 360
        Top = 144
        Width = 147
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edDtaSaldoContabil: TCMDateTimePicker
        Left = 535
        Top = 144
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
        ReadOnly = True
        ShowHint = True
        ShowButton = True
        TabOrder = 9
        OnExit = edDataExit
      end
    end
    object PnlDetalhe: TPanel
      Left = 1
      Top = 181
      Width = 690
      Height = 115
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label30: TLabel
        Left = 16
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vida Útil'
      end
      object Label9: TLabel
        Left = 80
        Top = 28
        Width = 37
        Height = 13
        Caption = 'Meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 16
        Top = 56
        Width = 87
        Height = 13
        Caption = 'Valor do Laudo'
      end
      object Label48: TLabel
        Left = 344
        Top = 8
        Width = 179
        Height = 13
        Caption = 'Informações relativas ao Laudo'
      end
      object edVidaUtil: TEditNum
        Left = 16
        Top = 24
        Width = 57
        Height = 21
        AutoSize = False
        MaxLength = 5
        TabOrder = 0
        IntDigits = 5
        Signal = False
        DecDigits = 0
        Numeric = True
        Alignment = taRightJustify
      end
      object edValLaudo: TRealEdit
        Left = 16
        Top = 72
        Width = 117
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rdgDepProRata: TRadioGroup
        Left = 152
        Top = 8
        Width = 174
        Height = 86
        Caption = ' Depreciação Pró-Rata '
        ItemIndex = 0
        Items.Strings = (
          'Data Movimentação - 1'
          'Data Movimentação')
        TabOrder = 2
      end
      object edObsReav: TMemo
        Left = 344
        Top = 24
        Width = 322
        Height = 71
        MaxLength = 60
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 692
    inherited tb97Fundo: TToolbar97
      Left = 502
      DockPos = 569
      inherited sep1: TToolbarSep97
        Left = 183
      end
      inherited sep3: TToolbarSep97
        Left = 90
      end
      inherited bbtnSair: TBitBtn
        Width = 90
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 90
        HelpContext = 70037
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 315
      DockPos = 382
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 730
    Top = 511
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
    Top = 26
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
      'BEM.PUBANO'
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
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
      'N'
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
      'Ano Publicação'
      'Controle'
      'Valor Residual')
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
      'BEM.BAIXATOTAL<>'#39'S'#39
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
      '10'
      '1'
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
  object cdsUltReav: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 155
    Top = 139
  end
  object sqlUltReav: TCMSqlParams
    SQL.Strings = (
      'SELECT R.DATAREAVALIACAO, RD.TAXADEP, RD.DATAULTDEP'
      'FROM REAVALIACAO R,'
      '     REAVALXDEP RD'
      'WHERE R.IDBEM = :IDBEM'
      '  AND R.IDPESSOA = :IDPESSOA'
      '  AND R.FLGULTREAVAL = 1'
      '  AND RD.MOECODIGO = :MOECODIGO'
      '  AND RD.IDREAVALXDEP = :IDTAXADEP'
      '  AND R.IDREAVALIACAO = RD.IDREAVALIACAO(+)'
      '')
    ClientDataSet = cdsUltReav
    Left = 155
    Top = 125
  end
  object cdsBemxDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 243
    Top = 139
  end
  object sqlBemxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT B.DATAINICIODEP, BD.TAXADEP, BD.DATAULTDEP'
      'FROM BEMXDEP BD,'
      '     BEM B'
      'WHERE B.IDBEM = :IDBEM'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND BD.MOECODIGO = :MOECODIGO'
      '  AND BD.IDBEMXDEP = :IDTAXADEP'
      '  AND B.IDBEM = BD.IDBEM'
      '  AND B.IDPESSOA = BD.IDPESSOA'
      '')
    ClientDataSet = cdsBemxDep
    Left = 243
    Top = 125
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 587
    Top = 139
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDBEM, SB.IDPESSOA, SB.DATASLDBEM, SB.MOEC' +
        'ODIGO, SB.IDSLDCTBBEMXDEP,'
      '       SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVEL,'
      '       SB.VALORG, SB.CMBEM, SB.DEPLANC, SB.CMDEP,'
      
        '       SB.REAVVALORG, SB.REAVCMBEM, SB.REAVDEPLANC, SB.REAVCMDEP' +
        ','
      
        '       SB.ULTREAVVALORG,  SB.ULTREAVCMBEM, SB.ULTREAVDEPLANC, SB' +
        '.ULTREAVCMDEP'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = MOECODIGO'
      '              AND :IDPESSOA = IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE :IDBEM = SCB1.IDBEM'
      '        AND :IDPESSOA = SCB1.IDPESSOA'
      '        AND :MOECODIGO = SCB1.MOECODIGO'
      '        AND :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = :IDBEM'
      '        AND SCD1.IDBEM = :IDBEM'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCD1.IDBEM = DTAMAX.IDBEM) SB'
      ''
      'WHERE :IDBEM = SB.IDBEM'
      '  AND :IDPESSOA = SB.IDPESSOA'
      '  AND :MOECODIGO = SB.MOECODIGO'
      '  AND :IDTAXADEP = SB.IDSLDCTBBEMXDEP'
      '')
    ClientDataSet = cdsSaldoContabil
    Left = 587
    Top = 125
  end
  object cdsSelTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 44
  end
  object dsSelTermo: TwwDataSource
    AutoEdit = False
    Left = 416
    Top = 30
  end
  object MSTermo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione Termo de Reavaliação'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Termo'
      'Processo'
      'Data do Termo'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA')
    CamposChave.Strings = (
      'SELBAIXA.IDSELBAIXA'
      'SELBAIXA.IDPESSOA')
    Filtro.Strings = (
      'SELBAIXA.SBTIPOMOV = 2'
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 416
    Top = 16
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 463
    Top = 165
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 152
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA,'
      
        '       SBB.VIDAUTIL, SBB.VALORLAUDO, SBB.TIPDEPPRORATA, SBB.OBSR' +
        'EAVAL,'
      '       B.PLACA, B.DESBEM, B.BAIXATOTAL, '
      '       L.NOME AS DESCLOCAL, G.NOME AS DESCGRUPO'
      'FROM SELBAIXABENS SBB,'
      '     BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     GRUPO G'
      'WHERE SBB.IDSELBAIXA = :IDSELBAIXA'
      '  AND SBB.IDPESSOA = :IDPESSOA'
      '  AND SBB.IDBEM = B.IDBEM'
      '  AND SBB.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      'ORDER BY B.PLACA  ')
    ClientDataSet = cdsDet
    Left = 464
    Top = 138
  end
end
