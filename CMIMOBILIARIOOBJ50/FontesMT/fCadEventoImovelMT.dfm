inherited frmCadEventoImovelMT: TfrmCadEventoImovelMT
  Left = 314
  Top = 170
  HelpContext = 640070
  Caption = 'Cadastro de Eventos por Imóvel'
  ClientHeight = 541
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 455
    inherited pnlControles: TPanel
      Top = 53
      Width = 692
      Height = 243
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 90
        Height = 13
        Caption = 'Data do Evento'
      end
      object Label4: TLabel
        Left = 16
        Top = 111
        Width = 61
        Height = 13
        Caption = 'Cabeçalho'
      end
      object lblValAnterior: TLabel
        Left = 16
        Top = 163
        Width = 78
        Height = 13
        Caption = 'Valor Anterior'
      end
      object lblValAtual: TLabel
        Left = 184
        Top = 163
        Width = 63
        Height = 13
        Caption = 'Valor Atual'
      end
      object lblPercent: TLabel
        Left = 352
        Top = 163
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label1: TLabel
        Left = 16
        Top = 208
        Width = 113
        Height = 13
        Caption = 'Usuário de inclusão'
      end
      object Label5: TLabel
        Left = 210
        Top = 16
        Width = 71
        Height = 13
        Caption = 'Nº Processo'
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 88
        Height = 13
        Caption = 'Tipo de Evento'
      end
      object DBedtDataHistorico: TCMDateTimePicker
        Left = 16
        Top = 30
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'EVIDATA'
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
        TabOrder = 0
      end
      object DBedtHistorico: TDBEdit
        Left = 16
        Top = 125
        Width = 657
        Height = 21
        DataField = 'EVICABECALHO'
        DataSource = ds
        TabOrder = 2
      end
      object DBedtVlrAnterior: TDBEdit
        Left = 16
        Top = 177
        Width = 121
        Height = 21
        DataField = 'EVIVLRANTERIOR'
        DataSource = ds
        TabOrder = 4
      end
      object DBedtVlrAjustado: TDBEdit
        Left = 184
        Top = 177
        Width = 121
        Height = 21
        DataField = 'EVIVLRAJUSTADO'
        DataSource = ds
        TabOrder = 5
      end
      object DBedtPercent: TDBEdit
        Left = 352
        Top = 177
        Width = 73
        Height = 21
        DataField = 'EVIPERCENT'
        DataSource = ds
        TabOrder = 6
      end
      object DBedtUsuario: TDBEdit
        Left = 16
        Top = 222
        Width = 409
        Height = 21
        DataField = 'USUARIO_EXTENSO'
        DataSource = ds
        Enabled = False
        TabOrder = 7
      end
      object DBedtNumProcesso: TDBEdit
        Left = 210
        Top = 30
        Width = 121
        Height = 21
        DataField = 'NUMPROCESSO'
        DataSource = ds
        TabOrder = 1
      end
      object wwDBcmbTipoEvento: TwwDBLookupCombo
        Left = 16
        Top = 78
        Width = 657
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
        DataField = 'IDTIPOEVENTOIMOB'
        DataSource = ds
        LookupTable = cdsTipoEventoUsuario
        LookupField = 'IDTIPOEVENTOIMOB'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 53
      Width = 692
      Height = 243
      PictureMasks.Strings = (
        'EVIVLRAJUSTADO'#9'#,0.00'#9'T'#9'T')
      Selected.Strings = (
        'EVIDATA'#9'11'#9'Data'#9'F'
        'NUMPROCESSO'#9'12'#9'Nº Processo'#9'F'
        'EVICABECALHO'#9'31'#9'Cabeçalho'#9'F'
        'DESCTIPOIMOVEL'#9'34'#9'Tipo Evento'#9'F'
        'EVIVLRAJUSTADO'#9'13'#9'Valor Ajustado'#9'F')
      object dbGrdIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 13
        Height = 22
        AllowAllUp = True
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 692
      Height = 52
      Align = alTop
      TabOrder = 2
      inline molImovel1: TmolImovel
        Left = 21
        Top = 5
        Width = 404
        inherited edtImovel: TEdit
          Width = 337
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 344
          OnClick = molImovel1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 368
          Enabled = False
          Visible = False
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 296
      Width = 692
      Height = 158
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object lblDescricao: TLabel
        Left = 8
        Top = 14
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object DBmemDescricao: TDBMemo
        Left = 0
        Top = 32
        Width = 692
        Height = 126
        Align = alBottom
        DataField = 'EVIDESCRICAO'
        DataSource = ds
        MaxLength = 1750
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 694
  end
  inherited Dock971: TDock97
    Top = 502
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 276
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyEdit
  end
  inherited Cds: TCMClientDataSet
    FieldDefs = <
      item
        Name = 'IDEVENTOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
      end
      item
        Name = 'EVICABECALHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EVIDESCRICAO'
        DataType = ftMemo
        Size = 2000
      end
      item
        Name = 'EVIDATA'
        DataType = ftDateTime
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EVIPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'EVIINDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGAVISO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIASAVISO'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO_EXTENSO'
        DataType = ftString
        Size = 112
      end
      item
        Name = 'DSC_INDICE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMPROCESSO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDTIPOEVENTOIMOB'
        DataType = ftFloat
      end
      item
        Name = 'DESCTIPOIMOVEL'
        DataType = ftString
        Size = 60
      end>
    IndexFieldNames = 'EVIDATA'
    StoreDefs = True
    Top = 39
    object CdsEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'EVIDATA'
    end
    object CdsNUMPROCESSO: TStringField
      DisplayLabel = 'Nº Processo'
      DisplayWidth = 12
      FieldName = 'NUMPROCESSO'
      Size = 30
    end
    object CdsEVICABECALHO: TStringField
      DisplayLabel = 'Cabeçalho'
      DisplayWidth = 31
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object CdsDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo Evento'
      DisplayWidth = 34
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object CdsEVIVLRAJUSTADO: TFloatField
      DisplayLabel = 'Valor Ajustado'
      DisplayWidth = 13
      FieldName = 'EVIVLRAJUSTADO'
    end
    object CdsEVIDESCRICAO: TMemoField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'EVIDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object CdsIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object CdsIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object CdsFLGTIPOEVENTO: TStringField
      DisplayWidth = 14
      FieldName = 'FLGTIPOEVENTO'
      Visible = False
      Size = 2
    end
    object CdsEVIVLRANTERIOR: TFloatField
      DisplayLabel = 'Valor Anterior'
      DisplayWidth = 11
      FieldName = 'EVIVLRANTERIOR'
      Visible = False
    end
    object CdsEVIDATAPROX: TDateTimeField
      DisplayLabel = 'Data do Próximo Evento'
      DisplayWidth = 19
      FieldName = 'EVIDATAPROX'
      Visible = False
    end
    object CdsEVIPERCENT: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'EVIPERCENT'
      Visible = False
    end
    object CdsEVIINDICEREAJUSTE: TFloatField
      DisplayLabel = 'Indice'
      DisplayWidth = 10
      FieldName = 'EVIINDICEREAJUSTE'
      Visible = False
    end
    object CdsIDCONTRATOLOJA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDCONTRATOLOJA'
      Visible = False
    end
    object CdsIDEVENTOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOIMOVEL'
      Visible = False
    end
    object CdsIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object CdsUSUARIO_EXTENSO: TStringField
      DisplayWidth = 83
      FieldName = 'USUARIO_EXTENSO'
      Visible = False
      FixedChar = True
      Size = 83
    end
    object CdsIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'E.EVIDATA'
      'E.EVICABECALHO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Data do Evento'
      'Cabeçalho')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOIMOVEL E'
      'IMOVEL I'
      'IMOVEL IM'
      'USUARIOSISTEMA US')
    CamposChave.Strings = (
      'E.IDEVENTOIMOVEL'
      'E.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'E.IDUSUARIO = US.IDUSUARIO(+)'
      'E.IDIMOVEL = I.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '60')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT E.IDEVENTOIMOVEL'
      '     , E.IDIMOVEL'
      '     , E.IDCONTRATOIMOVEL'
      '     , E.IDUSUARIO'
      '     , E.IDCONTRATOLOJA'
      '     , E.EVIDATAPROX'
      '     , E.EVICABECALHO'
      '     , E.EVIDESCRICAO'
      '     , E.EVIDATA'
      '     , E.FLGTIPOEVENTO'
      '     , E.EVIPERCENT'
      '     , E.EVIINDICEREAJUSTE'
      '     , E.EVIVLRANTERIOR'
      '     , E.EVIVLRAJUSTADO'
      '     , E.CODDOCUMENTO'
      '     , E.FLGAVISO'
      '     , E.DIASAVISO'
      '     , RTRIM(U.NOMEUSUARIO)||'#39' - '#39'||PU.NOME AS USUARIO_EXTENSO'
      '     , M.MOESIGLA AS DSC_INDICE'
      '     , U.NOMEUSUARIO'
      '     , E.NUMPROCESSO'
      '     , E.IDTIPOEVENTOIMOB'
      '     , T.DESCRICAO AS DESCTIPOIMOVEL'
      '  FROM EVENTOIMOVEL E'
      '     , PESSOA PU'
      '     , USUARIOSISTEMA U'
      '     , MOEDA M'
      '     , TIPOEVENTOIMOB T'
      'WHERE 1=2'
      '  AND E.EVIINDICEREAJUSTE = M.MOECODIGO(+)'
      '  AND E.IDUSUARIO         = U.IDUSUARIO(+)'
      '  AND U.IDUSUARIO         = PU.IDPESSOA(+)'
      '  AND E.IDTIPOEVENTOIMOB  = T.IDTIPOEVENTOIMOB'
      ''
      'ORDER BY E.EVIDATA'
      ''
      ' ')
    ClientDataSet = Cds
    Left = 489
    Top = 112
  end
  object dsTipoEventoUsuario: TwwDataSource
    DataSet = cdsTipoEventoUsuario
    Left = 540
    Top = 1
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOEVENTOIMOB'
      '     , DESCRICAO'
      '     , FLGRAD'
      '     , FLGTIPOEVENTO'
      '     , DECODE(FLGTIPOEVENTO,'
      '              '#39'AC'#39', '#39'Acréscimo de Valores'#39','
      '              '#39'AD'#39', '#39'Aditivo Contratual'#39','
      '              '#39'AR'#39', '#39'Alteração Cadastral'#39','
      '              '#39'AQ'#39', '#39'Aquisição do Imóvel'#39','
      '              '#39'BB'#39', '#39'Baixa de Bem'#39','
      '              '#39'BD'#39', '#39'Baixa por Desmembramento'#39','
      '              '#39'BO'#39', '#39'Baixa por Encerramento de Obra'#39','
      '              '#39'BR'#39', '#39'Baixa por Remembramento'#39','
      '              '#39'CS'#39', '#39'Cancelamento da Suspensão'#39','
      '              '#39'CC'#39', '#39'Carta de Cobrança'#39','
      '              '#39'CD'#39', '#39'Confissão de Dívidas'#39','
      '              '#39'CA'#39', '#39'Contrato de Alienação'#39','
      '              '#39'DP'#39', '#39'Depreciação Inicial'#39','
      '              '#39'DM'#39', '#39'Desmembramento de Imóvel'#39','
      '              '#39'EC'#39', '#39'Encerramento Contratual'#39','
      '              '#39'ED'#39', '#39'Entrada por Desmembramento'#39','
      '              '#39'EO'#39', '#39'Entrada por Encerramento de Obra'#39','
      '              '#39'US'#39', '#39'Evento do Usuário'#39','
      '              '#39'PC'#39', '#39'Prorrogação Contratual'#39','
      '              '#39'RJ'#39', '#39'Reajuste Contratual'#39','
      '              '#39'RV'#39', '#39'Reavaliação Oficial do Imovel'#39','
      '              '#39'VM'#39', '#39'Reavaliação Valor de Mercado'#39','
      '              '#39'RD'#39', '#39'Recálculo de Cobrança'#39','
      '              '#39'RM'#39', '#39'Remembramento de Imóvel'#39','
      '              '#39'RE'#39', '#39'Renegociação Contratual'#39','
      '              '#39'RN'#39', '#39'Renovação Contratual'#39','
      '              '#39'RC'#39', '#39'Rescisão Contratual'#39','
      '              '#39'SU'#39', '#39'Suspensão Contratual'#39','
      '              '#39'TT'#39', '#39'Transferência de Tipo de Imóvel'#39
      '                   ) AS DESCTIPOINTERNO'
      '  FROM TIPOEVENTOIMOB'
      ' WHERE FLGTIPOEVENTO = '#39'US'#39
      '')
    ClientDataSet = cdsTipoEventoUsuario
    Left = 409
    Top = 64
  end
  object cdsTipoEventoUsuario: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 55
    Data = {
      340100009619E0BD010000001800000005000200000003000000CB0010494454
      49504F4556454E544F494D4F4208000400000000000944455343524943414F01
      00490000000100055749445448020002003C0006464C47524144080004000000
      00000D464C475449504F4556454E544F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020002000F444553
      435449504F494E5445524E4F0100490000000100055749445448020002002000
      0100044C43494404000100090800000000000000000000002A40097573756172
      696F20310000000000000000025553114576656E746F20646F20557375E17269
      6F0000000000000000002C400E7573756172696F203220787878780000000000
      000000025553114576656E746F20646F20557375E172696F}
    object cdsTipoEventoUsuarioIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
    end
    object cdsTipoEventoUsuarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
end
