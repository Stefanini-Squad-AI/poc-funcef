inherited FrmLancAlteradores: TFrmLancAlteradores
  Left = 272
  Top = 155
  Caption = 'Lançamento de Alteradores'
  ClientHeight = 442
  ClientWidth = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 656
    Height = 356
    object GpDocumento: TGroupBox
      Left = 20
      Top = 15
      Width = 620
      Height = 60
      Caption = ' Dados Do Documento '
      Enabled = False
      TabOrder = 0
      object Label3: TLabel
        Left = 143
        Top = 17
        Width = 158
        Height = 13
        Caption = 'Documento \ Complemento:'
      end
      object LblForne: TLabel
        Left = 143
        Top = 36
        Width = 69
        Height = 13
        Caption = 'Fornecedor:'
      end
      object Label5: TLabel
        Left = 419
        Top = 17
        Width = 103
        Height = 13
        Caption = 'Data Programada:'
      end
      object DBText1: TDBText
        Left = 303
        Top = 17
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'DOCCOMPL'
        DataSource = ds
      end
      object DBText2: TDBText
        Left = 216
        Top = 36
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataSource = ds
      end
      object DBText3: TDBText
        Left = 525
        Top = 17
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataSource = ds
      end
      object BtnSeleciona: TBitBtn
        Left = 11
        Top = 16
        Width = 127
        Height = 36
        Caption = 'Seleciona'
        TabOrder = 0
        OnClick = BtnSelecionaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777770000000000000007777777770999999000000007777
          7777709999990000000077777777700000000000000070000000007777777000
          000070FFFFFF007777777000000070F87777F07000077000000070FFFFFFF070
          AA077000000070F88777F000AA000000000070FFFFFFF0AAAAAA0000000070F8
          877770AAAAAA0000000070FFFF000000AA000000000070F887070770AA077000
          000070FFFF007770000770000000700000077777777770000000777777777777
          777770000000}
      end
    end
    object PnlDadosAlterador: TPanel
      Left = 15
      Top = 78
      Width = 632
      Height = 156
      BevelOuter = bvNone
      TabOrder = 1
      object lblAlterador: TLabel
        Left = 5
        Top = 6
        Width = 126
        Height = 13
        Caption = 'Alterador Selecionado'
      end
      object lblValOut: TLabel
        Left = 317
        Top = 6
        Width = 115
        Height = 13
        Caption = 'Valor (Outra Moeda)'
      end
      object lblValor: TLabel
        Left = 467
        Top = 6
        Width = 132
        Height = 13
        Caption = 'Valor (Moeda Corrente)'
      end
      object Label2: TLabel
        Left = 138
        Top = 93
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label1: TLabel
        Left = 4
        Top = 93
        Width = 101
        Height = 13
        Caption = 'Data Lançamento'
      end
      object Label4: TLabel
        Left = 475
        Top = 6
        Width = 77
        Height = 13
        Caption = 'Valor Líquido'
        Visible = False
      end
      object lblUnidNegoc: TLabel
        Left = 133
        Top = 9
        Width = 104
        Height = 13
        Caption = 'Atividade\Projeto:'
        Enabled = False
        Visible = False
      end
      object Label6: TLabel
        Left = 6
        Top = 47
        Width = 136
        Height = 13
        Caption = 'Observação  - Alterador'
      end
      object EdtHist: TDBEdit
        Left = 138
        Top = 111
        Width = 487
        Height = 21
        DataField = 'HISTORICOCOMPL'
        DataSource = ds
        TabOrder = 6
      end
      object DtLancto: TCMDateTimePicker
        Left = 4
        Top = 111
        Width = 120
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCTO'
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
        TabOrder = 5
      end
      object DbROutraMoeda: TDBRealEdit
        Left = 317
        Top = 24
        Width = 142
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOROUTRAMOEDA'
        DataSource = ds
      end
      object DbrValor: TDBRealEdit
        Left = 467
        Top = 24
        Width = 157
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        OnExit = DbrValorExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOR'
        DataSource = ds
      end
      object dblkAlterador: TwwDBLookupCombo
        Left = 5
        Top = 24
        Width = 304
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO'
          'ACRESDECRES'#9'1'#9'ACRESDECRES')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupTable = CdsAlteradores
        LookupField = 'CODALTERADOR'
        DropDownWidth = 400
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblkAlteradorChange
        OnCloseUp = dblkAlteradorCloseUp
      end
      object DbrValLiquido: TDBRealEdit
        Left = 493
        Top = 24
        Width = 130
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        Visible = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRLIQUIDO'
        DataSource = ds
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 237
        Top = 3
        Width = 166
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNETIPO'#9'1'#9'T'
          'UNECODIGO'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = CdsUnidNegocio
        LookupField = 'UNIDNEGOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 4
        Visible = False
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CkbContabiliza: TCheckBox
        Left = 5
        Top = 139
        Width = 622
        Height = 17
        Caption = 'Não Integrar Este lançamento com a Contabilidade'
        TabOrder = 7
      end
      object mmObsAlt: TMemo
        Left = 7
        Top = 62
        Width = 618
        Height = 27
        Color = clScrollBar
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 8
      end
    end
  end
  inherited Dock972: TDock97
    Width = 656
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      object sbtnEstornar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = 'Es&tornar'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnEstornarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 656
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  object PnlContab: TPanel [3]
    Left = 17
    Top = 285
    Width = 625
    Height = 111
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object LblContabilizacao: TLabel
      Left = 1
      Top = 1
      Width = 623
      Height = 17
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Contabilização do Lançamento'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GrdContabilizacao: TwwDBGrid
      Left = 1
      Top = 18
      Width = 623
      Height = 92
      Selected.Strings = (
        'PLACONTA'#9'15'#9'Conta Contábil'#9'F'
        'PLANOME'#9'20'#9'Nome da Conta Contábil'#9'F'
        'LACDEBCRE'#9'3'#9'D/C'#9'F'
        'LACVALOR'#9'15'#9'Valor'#9'F'
        'CODSUBCONTA'#9'8'#9'Sub-Conta'#9'F'
        'CODCENTROCUSTO'#9'12'#9'Cod Cent. Custo'#9'F'
        'NOME_1'#9'10'#9'Cent. Custo'#9'F'
        'NOME'#9'10'#9'Atividade'#9'F'
        'DESCPLANO'#9'50'#9'Plano'#9'F'
        'NOMEPATRO'#9'60'#9'Patrocinadora'#9'F'
        'LACVALHIST'#9'15'#9'Valor O.M'#9'F'
        'LACHIST1'#9'40'#9'Histórico'#9'F'
        'LACHIST2'#9'40'#9'Histórico'#9'F'
        'LACHIST3'#9'40'#9'Histórico'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsContabilizacao
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 442
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 163
  end
  inherited ImlPadrao: TImageList
    Left = 404
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 328
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    Left = 334
    Top = 115
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Alterador Para Consulta\Alteração\Exclusão'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'TIPOALTERADOR.DESCRICAO'
      'LANCTODOCUM.DATALANCTO'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Documento'
      'Complemento'
      'Alterador'
      'Data Lançamento Alterador'
      'Razão Social'
      'Nome Fantasia')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'DOCUMENTO'
      'LANCTODOCUM'
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.NUMLANCTO'
      'LANCTODOCUM.ESTORNO')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA'
      'LANCTODOCUM.CODALTERADOR = TIPOALTERADOR.CODALTERADOR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '3'
      '35'
      '10'
      '30'
      '30')
    Left = 367
    Top = 3
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     LC.CODDOCUMENTO,'
      '     LC.CODALTERADOR,'
      '     LC.ESTORNO,'
      '     LC.PLNCODIGO,'
      '     LC.NUMLANCTO,'
      '     A.DESCRICAO,'
      '     LC.DATALANCTO,'
      '     LC.VALOROUTRAMOEDA,'
      '     LC.VALOR,'
      '     LC.HISTORICOCOMPL,'
      '     LC.DEBCRE,'
      
        '     RTRIM(TO_CHAR(D.NODOCUMENTO)) || '#39' '#39' || D.COMPLDOCUMENTO AS' +
        ' DOCCOMPL,'
      '     D.DATAPROGRAMADA,'
      ''
      '     nvl( D.DATADISPONIB, D.DATAPROGRAMADA ) as DATADOC, '
      ''
      '     P.RAZAOSOCIAL,'
      '     D.MOECODIGO,'
      '     D.PLACONTA,'
      '     D.CODCENTROCUSTO,'
      '     D.CODSUBCONTA,'
      '     LC.VLRLIQUIDO,'
      '     LC.UNIDNEGOC,'
      '     LC.IDPESSOA,'
      '     C.CODEXTERNO'
      'FROM'
      '     LANCTODOCUM LC,'
      '     TIPOALTERADOR A,'
      '     DOCUMENTO D,'
      '     PESSOA P,'
      '     CENTCUST C'
      'WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (LC.NUMLANCTO = :NUMLANCTO) AND'
      '     (D.IDPESSOA = :IDPESSOA) AND'
      '     (D.RECPAG = :RECPAG) AND'
      '     (LC.CODALTERADOR = A.CODALTERADOR) AND'
      '     (D.CODDOCUMENTO = LC.CODDOCUMENTO) AND'
      '     (D.IDFORCLI = P.IDPESSOA) AND'
      '     (C.CODCENTROCUSTO(+) = D.CODCENTROCUSTO)'
      ''
      ''
      ' ')
    ClientDataSet = Cds
    Left = 318
    Top = 59
  end
  object MsDoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Documento Para Lançamento de Alterador'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAEMISSAO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'LANCTODOCUM.DATALANCTO'
      'CENTCUST.CODEXTERNO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Num. Documento'
      'Complemento'
      'Data Emissão'
      'Data Programada'
      'Razão Social'
      'Nome Fantasia'
      'Documento'
      'Data do Lançamento'
      '')
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
      'PESSOA'
      'DOCUMENTO'
      'LANCTODOCUM'
      'CENTCUST')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.PLACONTA'
      'DOCUMENTO.CODCENTROCUSTO'
      'DOCUMENTO.CODSUBCONTA'
      'LANCTODOCUM.PLNCODIGO'
      'LANCTODOCUM.OPERACAO'
      'LANCTODOCUM.DATALANCTO'
      'CENTCUST.CODEXTERNO')
    Filtro.Strings = (
      'DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA'
      
        '((RTRIM(DOCUMENTO.STATUS) <> '#39'2'#39')  or (DOCUMENTO.STATUS is null)' +
        ')'
      'LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO = DOCUMENTO.OPERACAO'
      'DOCUMENTO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)')
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
      '10'
      '3'
      '10'
      '10'
      '35'
      '35'
      '18'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 473
    Top = 4
  end
  object SqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CC.CODCENTROCUSTO, C.CODEXTERNO'
      'FROM'
      '  CONTASXCC CC,'
      '  CENTCUST  C'
      'WHERE'
      '  RTRIM(CC.PLACONTA) = RTRIM(:PLACONTA) AND'
      '  CC.IDEMPRESA  = :IDEMPRESA AND'
      '  CC.PLANO = :PLANO AND'
      '  CC.CODCENTROCUSTO = C.CODCENTROCUSTO(+)'
      ''
      ' ')
    ClientDataSet = CdsCentroCusto
    Left = 358
    Top = 59
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 382
    Top = 115
  end
  object SqlUnidNegocio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC,'
      '  NOME,'
      '  UNECODIGO,'
      '  UNETIPO'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  UNECODIGO,UNETIPO'
      ' ')
    ClientDataSet = CdsUnidNegocio
    Left = 421
    Top = 67
  end
  object CdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 421
    Top = 115
  end
  object SqlAlteradores: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODALTERADOR,'
      '  DESCRICAO,'
      '  ACRESDECRES,'
      '  PLACONTA,'
      '  CODCENTROCUSTO,'
      '  CONVERTE,'
      '  FLGCALCULAIMPOSTO'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '   (RECPAG = :RECPAG)  AND'
      '   (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '    DESCRICAO'
      ' ')
    ClientDataSet = CdsAlteradores
    Left = 493
    Top = 75
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 461
    Top = 115
  end
  object SqlContabilizacao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LC.PLACONTA,'
      '  LC.CODSUBCONTA,'
      '  LC.LACDEBCRE,'
      '  LC.LACVALOR,'
      '  LC.LACVALHIST,'
      '  LC.LACHIST1,'
      '  LC.LACHIST2,'
      '  LC.LACHIST3,'
      '  LC.PLNCODIGO,'
      '  LC.LACNUMLAN,'
      '  LC.HITCODHIST,'
      '  LC.IDPESSOA,'
      '  LC.IDEMPRESA,'
      '  LC.IDMODULO,'
      '  LC.UNIDNEGOC,'
      '  LC.IDUSUARIOINCLUSAO,'
      '  LC.PLANO,'
      '  LC.LACTIPO,'
      '  LC.LACNUMDOC,'
      '  LC.LACHIST4,'
      '  LC.LACHIST5,'
      '  LC.LACTIPCONVOFICIAL,'
      '  LC.LACVALOFICIAL,'
      '  LC.LACTIPCONVGER,'
      '  LC.LACVALGERENCIAL,'
      '  LC.LACTIPCONVGEREN1,'
      '  LC.LACVALGEREN1,'
      '  LC.LACTIPCONVGEREN2,'
      '  LC.LACVALGEREN2,'
      '  LC.LACATOUTMOEDA,'
      '  LC.LACORIGEMAPLIC,'
      '  LC.TIPCODIGO,'
      '  LC.IDELEMDEMONSTRAT,'
      '  U.NOME,'
      '  CC.NOME,'
      '  CC.CODEXTERNO AS CODCENTROCUSTO,'
      '  PC.PLANOME,'
      '  LC.IDPLANOPREV,'
      '  LC.IDPATRO,'
      '  PATRO.NOME AS NOMEPATRO,'
      '  PLANO.NOME AS DESCPLANO'
      'FROM'
      '  LANCAMENTO LC,'
      '  UNIDNEGOCIO U,'
      '  CENTCUST CC,'
      '  PLANOCONTA PC,'
      '  PESSOA PATRO,'
      '  PLANPREVCONTABIL PLANO'
      'WHERE'
      ' (LC.PLNCODIGO = :PLNCODIGO) AND'
      ' (CC.IDEMPRESA(+) = LC.IDEMPRESA) AND'
      ' (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      ' (LC.IDPESSOA = U.IDPESSOA(+)) AND'
      ' (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      ' (PC.PLANO = LC.PLANO) AND'
      ' (PC.PLACONTA = LC.PLACONTA) AND'
      ' (PLANO.IDPLANOPREV(+) = LC.IDPLANOPREV) AND'
      ' (PATRO.IDPESSOA(+) = LC.IDPATRO)'
      ''
      ''
      ''
      '')
    ClientDataSet = CdsContabillizacao
    Left = 500
    Top = 219
  end
  object CdsContabillizacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 444
    Top = 187
  end
  object DsContabilizacao: TwwDataSource
    DataSet = CdsContabillizacao
    Left = 500
    Top = 160
  end
  object CdsDel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 342
    Top = 219
  end
  object SqlAuxDocs: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DOCUMENTO.NODOCUMENTO,'
      '   DOCUMENTO.COMPLDOCUMENTO,'
      '   DOCUMENTO.DATAEMISSAO,'
      '   DOCUMENTO.DATAPROGRAMADA,'
      '   PESSOA.RAZAOSOCIAL,'
      '   PESSOA.NOME,'
      '   PESSOA.NUMDOCUMENTO,'
      '   LANCTODOCUM.DATALANCTO,'
      '   DOCUMENTO.CODDOCUMENTO,'
      '   DOCUMENTO.DATAPROGRAMADA,'
      '   DOCUMENTO.NODOCUMENTO,'
      '   DOCUMENTO.COMPLDOCUMENTO,'
      '   PESSOA.RAZAOSOCIAL,'
      '   DOCUMENTO.PLACONTA,'
      '   DOCUMENTO.CODCENTROCUSTO,'
      '   DOCUMENTO.CODSUBCONTA,'
      '   LANCTODOCUM.PLNCODIGO,'
      '   LANCTODOCUM.OPERACAO,'
      '   LANCTODOCUM.DATALANCTO,'
      '   CENTCUST.CODEXTERNO'
      'FROM'
      '   DOCUMENTO,'
      '   PESSOA,'
      '   LANCTODOCUM,'
      '   CENTCUST'
      'WHERE'
      '   ( DOCUMENTO.CODDOCUMENTO = :CODDOCUMENTO ) AND'
      '   ( DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA ) AND'
      
        '   ( ((RTRIM(DOCUMENTO.STATUS) <> '#39'2'#39')  or (DOCUMENTO.STATUS is ' +
        'null)) ) AND'
      '   ( LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO ) AND'
      '   ( LANCTODOCUM.OPERACAO = DOCUMENTO.OPERACAO ) AND'
      '   ( CENTCUST.CODCENTROCUSTO(+) = DOCUMENTO.CODCENTROCUSTO )'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAuxDocs
    Left = 572
    Top = 59
  end
  object CdsAuxDocs: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 540
    Top = 115
  end
  object sqlPodeEstornar: TCMSqlParams
    SQL.Strings = (
      'SELECT A.IDESPACESSO, U.IDUSUARIO, P.NOMEOBJETO'
      'FROM AUTORIZA A, USUARIOSISTEMA U,'
      '('
      '   SELECT FF.IDOPERFUNC, O.NOMEOBJETO'
      '   FROM FROBFNOP FF,'
      '     OPERFUNC OU,'
      '     OBJETO O'
      '   WHERE FF.IDOPERFUNC = OU.IDOPERFUNC'
      '      AND FF.IDOBJETO = O.IDOBJETO'
      '      AND OU.IDMODULO = :IDMODULO'
      '      AND O.IDOBJETO = (SELECT '
      '                                            IDOBJETO '
      '                                         FROM '
      '                                            OBJETO '
      
        '                                         WHERE UPPER(NOMEOBJETO)' +
        ' = '#39'SBTNESTORNAR'#39')'
      ') P'
      'WHERE P.IDOPERFUNC = A.IDOPERFUNC'
      'AND   U.IDESPACESSO = A.IDESPACESSO'
      'AND   U.IDUSUARIO = :IDUSUARIO'
      ' '
      ' ')
    ClientDataSet = cdsPodeEstornar
    Left = 62
    Top = 139
  end
  object cdsPodeEstornar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 62
    Top = 187
  end
end
