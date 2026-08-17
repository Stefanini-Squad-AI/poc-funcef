inherited frmCadEventoContratoLojaMT: TfrmCadEventoContratoLojaMT
  Left = 296
  Top = 87
  HelpContext = 4390015
  Caption = 'Cadastro de Eventos por Contrato de Lojas'
  ClientHeight = 427
  ClientWidth = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 341
    inherited dbGrd: TwwDBGrid [0]
      Top = 53
      Width = 449
      Height = 287
      Selected.Strings = (
        'EVIDATA'#9'11'#9'Data'#9'F'
        'EVICABECALHO'#9'46'#9'Cabeçalho'#9'F')
      object dbGrdIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 13
        Height = 22
        AllowAllUp = True
      end
    end
    inherited pnlControles: TPanel [1]
      Top = 53
      Width = 449
      Height = 287
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 90
        Height = 13
        Caption = 'Data do Evento'
      end
      object Label4: TLabel
        Left = 16
        Top = 50
        Width = 61
        Height = 13
        Caption = 'Cabeçalho'
      end
      object Label6: TLabel
        Left = 16
        Top = 90
        Width = 78
        Height = 13
        Caption = 'Valor Anterior'
      end
      object Label7: TLabel
        Left = 184
        Top = 90
        Width = 63
        Height = 13
        Caption = 'Valor Atual'
      end
      object Label8: TLabel
        Left = 352
        Top = 90
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Bevel2: TBevel
        Left = 16
        Top = 218
        Width = 409
        Height = 3
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 16
        Top = 226
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object DBedtDataHistorico: TCMDateTimePicker
        Left = 16
        Top = 24
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
        Top = 64
        Width = 409
        Height = 21
        DataField = 'EVICABECALHO'
        DataSource = ds
        TabOrder = 1
      end
      object DBedtVlrAnterior: TDBEdit
        Left = 16
        Top = 104
        Width = 121
        Height = 21
        DataField = 'EVIVLRANTERIOR'
        DataSource = ds
        TabOrder = 2
      end
      object DBedtVlrAjustado: TDBEdit
        Left = 184
        Top = 104
        Width = 121
        Height = 21
        DataField = 'EVIVLRAJUSTADO'
        DataSource = ds
        TabOrder = 3
      end
      object DBedtPercent: TDBEdit
        Left = 352
        Top = 104
        Width = 73
        Height = 21
        DataField = 'EVIPERCENT'
        DataSource = ds
        TabOrder = 4
      end
      object DBmemDescricao: TDBMemo
        Left = 16
        Top = 144
        Width = 409
        Height = 65
        DataField = 'EVIDESCRICAO'
        DataSource = ds
        MaxLength = 1750
        TabOrder = 5
      end
      object DBedtUsuario: TDBEdit
        Left = 16
        Top = 240
        Width = 409
        Height = 21
        DataField = 'USUARIO_EXTENSO'
        DataSource = ds
        Enabled = False
        TabOrder = 6
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 449
      Height = 52
      Align = alTop
      TabOrder = 2
      inline molContratoLoja1: TmolContratoLoja
        Left = 24
        Top = 5
        Width = 409
        inherited edtContrato: TEdit
          Width = 337
        end
        inherited btnBuscaContrato: TBitBtn
          Left = 344
          OnClick = molContratoLoja1btnBuscaContratoClick
        end
        inherited btnLimpaContrato: TBitBtn
          Left = 368
          Enabled = False
          Visible = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 451
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 279
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 110
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
        Name = 'EVIDATA'
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
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
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
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
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
        Name = 'IDHISTCARTINV'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO_EXTENSO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'CdsIndex3'
        Fields = 'EVIDATA'
      end
      item
        Name = 'CdsIndex4'
        Fields = 'EVICABECALHO'
      end>
    IndexFieldNames = 'EVIDATA'
    StoreDefs = True
    Top = 15
    object CdsEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'EVIDATA'
    end
    object CdsEVICABECALHO: TStringField
      DisplayLabel = 'Cabeçalho'
      DisplayWidth = 46
      FieldName = 'EVICABECALHO'
      Size = 60
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
    object CdsEVIVLRAJUSTADO: TFloatField
      DisplayLabel = 'Valor Reajustado'
      DisplayWidth = 13
      FieldName = 'EVIVLRAJUSTADO'
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
      FixedChar = True
      Size = 83
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO'
      'E.EVIDATA'
      'E.EVICABECALHO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Nr. do Contrato'
      'Nome do Contrato'
      'Data do Evento'
      'Cabeçalho')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOIMOVEL E'
      'IMOVEL I'
      'IMOVEL IM'
      'INDCONTRATOLOJA CL'
      'USUARIOSISTEMA US')
    CamposChave.Strings = (
      'E.IDEVENTOIMOVEL'
      'E.IDCONTRATOLOJA'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO')
    Filtro.Strings = (
      'E.IDCONTRATOLOJA = CL.IDCONTRATO'
      'CL.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'E.IDUSUARIO = US.IDUSUARIO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '20'
      '60'
      '18'
      '60')
  end
end
