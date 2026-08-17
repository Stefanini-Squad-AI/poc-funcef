inherited frmEntCompromissoEspecialMT: TfrmEntCompromissoEspecialMT
  Left = 178
  Top = 175
  Caption = 'Compromisso Orçamentário - Especial'
  ClientHeight = 459
  ClientWidth = 626
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 626
    Height = 420
    object dbgrdConta: TwwDBGrid
      Left = 1
      Top = 193
      Width = 624
      Height = 118
      TabStop = False
      Selected.Strings = (
        'DATAR'#9'10'#9'Data Ref.'
        'CODCENTROCUSTO'#9'10'#9'Código~C Custo'
        'NOME'#9'30'#9'Centro de Custo'
        'CODCENTRORESPON'#9'10'#9'Código~C Responsabilidade'
        'CRESP'#9'30'#9'Centro de Responsabilidade'
        'VLRCOMPROMISSO'#9'10'#9'Valor~Compromisso')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsConta
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = dbgrdContaCalcCellColors
      OnEnter = dbgrdContaEnter
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdContaTopRowChanged
      OnUpdateFooter = dbgrdContaUpdateFooter
    end
    object pnlValores: TPanel
      Left = 1
      Top = 311
      Width = 624
      Height = 108
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label6: TLabel
        Left = 336
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label12: TLabel
        Left = 464
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Valor Compromisso'
      end
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label2: TLabel
        Left = 464
        Top = 54
        Width = 66
        Height = 13
        Caption = 'Saldo Atual'
      end
      object Label3: TLabel
        Left = 15
        Top = 54
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object edtCCusto: TEdit
        Left = 16
        Top = 24
        Width = 305
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object redSaldo: TRealEdit
        Left = 464
        Top = 70
        Width = 145
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redValor: TDBRealEdit
        Left = 464
        Top = 24
        Width = 146
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        OnExit = dbeDataRefExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRCOMPROMISSO'
        DataSource = dsConta
      end
      object dbeDataRef: TCMDateTimePicker
        Left = 336
        Top = 24
        Width = 113
        Height = 21
        AutoSize = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAR'
        DataSource = dsConta
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
        TabOrder = 3
        UnboundDataType = wwDTEdtDate
        OnExit = dbeDataRefExit
      end
      object edtCentroResp: TEdit
        Left = 15
        Top = 70
        Width = 303
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 624
      Height = 192
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblCodigoConta: TLabel
        Left = 16
        Top = 10
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object lblNome: TLabel
        Left = 168
        Top = 10
        Width = 114
        Height = 13
        Caption = 'Descrição do Grupo'
      end
      object Label21: TLabel
        Left = 16
        Top = 50
        Width = 105
        Height = 13
        Caption = 'Plano de Trabalho'
        OnClick = bbtnBuscaGrupoClick
      end
      object Label22: TLabel
        Left = 16
        Top = 90
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label23: TLabel
        Left = 16
        Top = 130
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblCriterio: TLabel
        Left = 327
        Top = 90
        Width = 100
        Height = 13
        Caption = 'Critério de Rateio'
      end
      object lblValBase: TLabel
        Left = 328
        Top = 130
        Width = 100
        Height = 13
        Caption = 'Valor para Rateio'
      end
      object dbeCodigoGrupo: TEdit
        Left = 16
        Top = 24
        Width = 111
        Height = 21
        TabOrder = 0
        OnChange = ZeraConta
        OnExit = dbeCodigoGrupoExit
      end
      object bbtnBuscaGrupo: TBitBtn
        Left = 128
        Top = 24
        Width = 25
        Height = 21
        Hint = 'Procura o Grupo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = bbtnBuscaGrupoClick
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
      object edtNomeGrupo: TEdit
        Left = 168
        Top = 24
        Width = 320
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object dblcPlanoParamConta: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPLANO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnExit = dblcPlanoParamContaExit
      end
      object dblcPatroParamConta: TwwDBLookupCombo
        Left = 16
        Top = 144
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsPatrocinadora
        LookupField = 'IDPESSOA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnCloseUp = dblcPatroParamContaCloseUp
        OnExit = dblcPatroParamContaExit
      end
      object bbtnCCusto: TBitBtn
        Left = 513
        Top = 16
        Width = 95
        Height = 29
        Caption = 'Seleciona'
        Enabled = False
        TabOrder = 9
        TabStop = False
        OnClick = bbtnCCustoClick
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
        Spacing = 3
      end
      object dblcPlanoTrabalho: TwwDBLookupCombo
        Tag = 888
        Left = 16
        Top = 64
        Width = 593
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição'#9'F'
          'IDPLANOTRABALHO'#9'5'#9'Código'#9'F'
          'NOMECR'#9'15'#9'Centro de Responsabilidade'#9'F'
          'NOMEUN'#9'12'#9'Nome da Atividade/Projeto'#9'F')
        LookupTable = cdsPlanoTrabalho
        LookupField = 'IDPLANOTRABALHO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnExit = dblcPlanoTrabalhoExit
      end
      object dblcCriterio: TCMDBLookupCombo
        Tag = 888
        Left = 327
        Top = 104
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F')
        LookupTable = cdsCriterio
        LookupField = 'IDCRITERIORATORC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
      end
      object redValorBase: TRealEdit
        Tag = 888
        Left = 328
        Top = 144
        Width = 160
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object BtCalc: TBitBtn
        Tag = 888
        Left = 513
        Top = 136
        Width = 95
        Height = 29
        Caption = '&Calcular'
        TabOrder = 6
        OnClick = BtCalcClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 626
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 135
      DockPos = 135
      inherited bbtnConfirmar: TBitBtn
        Tag = 888
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 999
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 976
    Top = 18
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsConta: TwwDataSource
    DataSet = cdsConta
    Left = 64
    Top = 212
  end
  object MontaSelectGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.FLGANALSINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'A/S')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.IDGRUPOORCAMEN')
    Filtro.Strings = (
      'FLGANALSINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 368
    Top = 8
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'Select'
      '  NOMEGRUPOORCAMEN, IDGRUPOORCAMEN'
      'From'
      '  GRUPOORCAMEN'
      'Where'
      '  CODGRUPOORC    = :CODGRUPOORC AND'
      '  IDPLANOORCAMEN = :iPlanoOrc'
      ' ')
    ClientDataSet = cdsGrupo
    Left = 169
    Top = 20
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 201
    Top = 20
  end
  object SqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME AS NOMEPLANO'
      'FROM'
      '   PLANPREVCONTABIL'
      '')
    ClientDataSet = cdsPlano
    Left = 17
    Top = 148
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 73
    Top = 148
  end
  object sqlPatrocinadora: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    ClientDataSet = cdsPatrocinadora
    Left = 105
    Top = 100
  end
  object cdsPatrocinadora: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 137
    Top = 100
  end
  object sqlConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCONTAORCAMEN,                                             ' +
        '                                       '
      '  /*Cátia Azevedo p 15419 16/01/2006*/'
      '  R.CODEXTERNO  AS CODCENTRORESPON ,'
      ''
      '  R.NOME AS CRESP,'
      ''
      '  /*Cátia Azevedo p 15419 16/01/2006*/'
      '  CC.CODEXTERNO AS CODCENTROCUSTO, CC.NOME AS NOME,'
      ''
      ''
      '  (0) AS VLRCOMPROMISSO, :DATAREFERENCIA'
      'FROM'
      '  CONTASORCAMEN C, CENTRESPON R, CENTCUST CC'
      'WHERE'
      '  (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND'
      '  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (C.CODCENTRORESPON IN'
      '       (SELECT CODCENTRORESPON'
      '        FROM PESSOAXCRESP'
      '        WHERE IDPESSOAACESSO = :IDPESSOAACESSO)) AND'
      '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (CC.ATIVO = '#39'S'#39') AND'
      '  (CC.IDEMPRESA = :IDPESSOA) AND'
      '  (C.IDPESSOA = :IDPESSOA) AND'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      '  '
      ''
      ''
      ''
      ''
      ' ')
    OnFormartParam = sqlContaFormartParam
    ClientDataSet = cdsConta
    Left = 113
    Top = 196
  end
  object cdsConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    AfterScroll = cdsContaAfterScroll
    Left = 160
    Top = 193
    object cdsContaDATAR: TDateTimeField
      DisplayLabel = 'Data Ref.'
      DisplayWidth = 10
      FieldName = 'DATAR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1; '
    end
    object cdsContaCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código~C Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object cdsContaNOME: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object cdsContaCODCENTRORESPON: TStringField
      DisplayLabel = 'Código~C Responsabilidade'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object cdsContaCRESP: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 30
      FieldName = 'CRESP'
      Size = 30
    end
    object cdsContaVLRCOMPROMISSO: TCurrencyField
      DisplayLabel = 'Valor~Compromisso'
      DisplayWidth = 10
      FieldName = 'VLRCOMPROMISSO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsContaIDCONTAORCAMEN: TStringField
      DisplayWidth = 25
      FieldName = 'IDCONTAORCAMEN'
      Visible = False
      Size = 25
    end
  end
  object cdsProxReserva: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 465
    Top = 12
  end
  object sqlPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DISTINCT O.DESCRICAO, O.IDPLANOTRABALHO, O.UNIDNEGOC, U.NOME A' +
        'S NOMEUN,'
      '  CR.NOME AS NOMECR'
      'FROM'
      
        '  PLANOTRABALHOORC O, PESSOAXCRESP C, CENTRESPON CR, UNIDNEGOCIO' +
        ' U'
      'WHERE'
      
        '  (O.CODCENTRORESPON = C.CODCENTRORESPON ) AND (O.IDPESSOA = C.I' +
        'DPESSOA) AND'
      
        '  (C.IDPESSOAACESSO = :IDUSUARIO) AND (C.IDPESSOA = :IDPESSOA) A' +
        'ND'
      
        '  (CR.CODCENTRORESPON = O.CODCENTRORESPON) AND (CR.IDPESSOA = O.' +
        'IDPESSOA) AND'
      '  (U.UNIDNEGOC = O.UNIDNEGOC) AND (U.IDPESSOA = O.IDPESSOA)'
      'ORDER BY'
      '  O.DESCRICAO'
      ''
      ' '
      ' ')
    ClientDataSet = cdsPlanoTrabalho
    Left = 480
    Top = 56
  end
  object cdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 512
    Top = 56
  end
  object sqlCriterio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCRITERIORATORC, C.DESCRICAO, C.TIPORATEIO, C.IDDATAVIEW, C' +
        '.PERNUMERO,'
      '  C.PEREXERCICIO, P.PERDATINI, P.PERDATFIM'
      'FROM'
      '  CRITERIORATORC C, PERIODO P'
      'WHERE'
      
        '  (C.IDPESSOA = :IDPESSOA) AND (C.PERNUMERO = P.PERNUMERO(+)) AN' +
        'D'
      
        '  (C.PEREXERCICIO = P.PEREXERCICIO(+)) AND (C.IDPESSOA = P.IDPES' +
        'SOA(+))'
      'ORDER BY'
      '  C.DESCRICAO'
      '')
    ClientDataSet = cdsCriterio
    Left = 584
    Top = 168
  end
  object cdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 584
    Top = 192
  end
  object sqlCompOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DISTINCT CC.PLACONTA'
      'FROM'
      '  CONTASORCAMEN C, COMPCONTASORCAMEN CC'
      'WHERE'
      
        '  (CC.PLACONTA IS NOT NULL) AND (C.IDCONTAORCAMEN = CC.IDCONTAOR' +
        'CAMEN) AND'
      '  (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      '')
    ClientDataSet = cdsCompOrcamen
    Left = 120
    Top = 352
  end
  object cdsCompOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 352
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  ABS(SUM(PLSCREDITOCOR - PLSDEBITOCORRENTE)) AS SALDOCONTAB'
      'FROM'
      '  PLANOSALDO'
      'WHERE'
      
        '  (PERNUMERO = :PERNUMERO) AND (PEREXERCICIO = :PEREXERCICIO) AN' +
        'D'
      '  (IDPESSOA = :IDPESSOA) AND'
      '   '
      ''
      ' ')
    ClientDataSet = cdsSaldoContabil
    Left = 272
    Top = 336
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 336
  end
  object cdsValorCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 232
  end
  object sqlValorCentCust: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRCRIRATORC) AS VLRCRIRATORC'
      ''
      'FROM'
      '   VALORCRIRATORC'
      ''
      'WHERE'
      '       (IDPESSOA           =:IDPESSOA)'
      '   AND (EXERCICIO          =:EXERCICIO)'
      '   AND (PERIODO            =:PERIODO)'
      '   AND (CODCENTROCUSTO     =:CODCENTROCUSTO)'
      '   AND (IDEMPRESA          =:IDEMPRESA)'
      '   AND (IDCRITERIORATORC   =:IDCRITERIORATORC)')
    ClientDataSet = cdsValorCentCust
    Left = 264
    Top = 232
  end
  object cdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 440
    Top = 240
  end
  object sqlDataView: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NAME, IDDATAVIEW, CLASSNAME, ORIGEMCMDV, TEMPLATE, DESCRIPTION'
      'FROM'
      '  DATAVIEW'
      'WHERE'
      '  (IDDATAVIEW = :IDDATAVIEW) AND (ORIGEMCMDV = '#39'0'#39')'
      '')
    ClientDataSet = cdsDataView
    Left = 400
    Top = 232
  end
  object cdsValorCCustAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 288
  end
  object sqlValorCCustAux: TCMSqlParams
    ClientDataSet = cdsValorCCustAux
    Left = 120
    Top = 288
  end
end
