inherited frmEntSuplemenEspecialMT: TfrmEntSuplemenEspecialMT
  Left = 92
  Top = 179
  HelpContext = 520017
  Caption = 'Suplementação Orçamentária'
  ClientHeight = 435
  ClientWidth = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 639
    Height = 396
    object dbgrdConta: TwwDBGrid
      Left = 1
      Top = 149
      Width = 637
      Height = 151
      TabStop = False
      Selected.Strings = (
        'NOME'#9'30'#9'Centro de Custo'
        'DATAR'#9'18'#9'Data Ref.'
        'VLRSOLICITADO'#9'15'#9'Valor Suplementação')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsConta
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdContaCalcCellColors
      OnEnter = dbgrdContaEnter
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdContaTopRowChanged
    end
    object pnlValores: TPanel
      Left = 1
      Top = 300
      Width = 637
      Height = 95
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
      object Label6: TLabel
        Left = 322
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label12: TLabel
        Left = 474
        Top = 8
        Width = 121
        Height = 13
        Caption = 'Valor Suplementação'
      end
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label2: TLabel
        Left = 474
        Top = 49
        Width = 66
        Height = 13
        Caption = 'Saldo Atual'
      end
      object redValor: TRealEdit
        Left = 474
        Top = 24
        Width = 145
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edtCCusto: TEdit
        Left = 10
        Top = 24
        Width = 305
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object dbeDataRef: TCMDateTimePicker
        Left = 322
        Top = 24
        Width = 145
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
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
        ReadOnly = True
        ShowButton = True
        TabOrder = 1
        OnChange = dbeDataRefChange
      end
      object redSaldo: TRealEdit
        Left = 474
        Top = 65
        Width = 145
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 637
      Height = 148
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 0
      object lblCodigoConta: TLabel
        Left = 84
        Top = 11
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object lblNome: TLabel
        Left = 226
        Top = 11
        Width = 114
        Height = 13
        Caption = 'Descrição do Grupo'
      end
      object Label21: TLabel
        Left = 84
        Top = 51
        Width = 105
        Height = 13
        Caption = 'Plano de Trabalho'
        OnClick = bbtnBuscaGrupoClick
      end
      object Label22: TLabel
        Left = 324
        Top = 51
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label23: TLabel
        Left = 84
        Top = 89
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label3: TLabel
        Left = 324
        Top = 89
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object dbeCodigoGrupo: TEdit
        Left = 84
        Top = 27
        Width = 111
        Height = 21
        TabOrder = 0
        OnChange = ZeraConta
        OnExit = dbeCodigoGrupoExit
      end
      object bbtnBuscaGrupo: TBitBtn
        Left = 194
        Top = 27
        Width = 25
        Height = 21
        Hint = 'Procura o Grupo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
        Left = 226
        Top = 27
        Width = 199
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 2
      end
      object dblcPlanoParamConta: TwwDBLookupCombo
        Left = 324
        Top = 67
        Width = 222
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        LookupTable = cdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loColLines]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnExit = dblcPlanoParamContaExit
      end
      object dblcPatroParamConta: TwwDBLookupCombo
        Left = 84
        Top = 105
        Width = 222
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        LookupTable = cdsPatrocinadora
        LookupField = 'IDPESSOA'
        Options = [loColLines]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnExit = dblcPatroParamContaExit
      end
      object edtCentroResp: TEdit
        Left = 324
        Top = 105
        Width = 222
        Height = 21
        TabStop = False
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object bbtnCCusto: TBitBtn
        Left = 441
        Top = 19
        Width = 105
        Height = 29
        Caption = 'Seleciona'
        Enabled = False
        TabOrder = 7
        TabStop = False
        OnClick = bbtnCCustoClick
        NumGlyphs = 2
        Spacing = 8
      end
      object dblcPlanoTrabalho: TwwDBLookupCombo
        Tag = 888
        Left = 84
        Top = 67
        Width = 222
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição'#9'F'
          'IDPLANOTRABALHO'#9'5'#9'Código'#9'F'
          'NOMECR'#9'15'#9'Centro de Responsabilidade'#9'F'
          'NOMEUN'#9'12'#9'Nome da Atividade/Projeto'#9'F')
        LookupTable = cdsPlanoTrabalho
        LookupField = 'IDPLANOTRABALHO'
        Options = [loColLines]
        Style = csDropDownList
        DropDownCount = 5
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = ZeraConta
        OnExit = dblcPlanoTrabalhoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 639
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520017
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
    Left = 336
    Top = 10
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsConta: TwwDataSource
    AutoEdit = False
    DataSet = cdsConta
    Left = 424
    Top = 188
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
      '  CODGRUPOORC = :CODGRUPOORC')
    ClientDataSet = cdsGrupo
    Left = 225
    Top = 28
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 257
    Top = 28
  end
  object SqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME ')
    ClientDataSet = cdsPlano
    Left = 377
    Top = 76
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 409
    Top = 76
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
    Left = 97
    Top = 124
  end
  object cdsPatrocinadora: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 129
    Top = 124
  end
  object sqlConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCONTAORCAMEN, C.CODCENTRORESPON, R.NOME AS CRESP, C.CODCEN' +
        'TROCUSTO,'
      '  CC.NOME AS NOME, (0) AS VLRSOLICITADO, :DATAREFERENCIA'
      'FROM'
      '  CONTASORCAMEN C, CENTRESPON R, CENTCUST CC'
      'WHERE'
      '  (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND '
      '  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (C.CODCENTRORESPON IN'
      '       (SELECT CODCENTRORESPON'
      '        FROM PESSOAXCRESP'
      '        WHERE IDPESSOAACESSO = :IDPESSOAACESSO)) AND'
      '  (C.TIPOCALCREALIZADO = '#39'X'#39') AND'
      '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (CC.ATIVO = '#39'S'#39') AND'
      '  (CC.IDEMPRESA = :IDPESSOA) AND'
      '  (C.IDPESSOA = :IDPESSOA) AND'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV '
      '  :IDPATRO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = sqlContaFormartParam
    ClientDataSet = cdsConta
    Left = 209
    Top = 204
  end
  object cdsConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforeScroll = cdsContaBeforeScroll
    AfterScroll = cdsContaAfterScroll
    Left = 248
    Top = 209
    object cdsContaDATAR: TDateTimeField
      DisplayLabel = 'Data Ref.'
      FieldName = 'DATAR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1; '
    end
    object cdsContaVLRSOLICITADO: TCurrencyField
      FieldName = 'VLRSOLICITADO'
    end
    object cdsContaIDCONTAORCAMEN: TStringField
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
    object cdsContaCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object cdsContaNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsContaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object cdsContaCRESP: TStringField
      FieldName = 'CRESP'
      Size = 30
    end
  end
  object cdsProxSuplemen: TCMClientDataSet
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
      ' ')
    ClientDataSet = cdsPlanoTrabalho
    Left = 224
    Top = 80
  end
  object cdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 256
    Top = 80
  end
end
