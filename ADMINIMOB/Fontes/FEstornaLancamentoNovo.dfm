inherited frmEstornaLancNovo: TfrmEstornaLancNovo
  Left = 335
  Top = 254
  HelpContext = 640024
  Caption = 'Estorno / Exclusão de Lançamentos'
  ClientHeight = 439
  ClientWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 762
    Height = 369
    object Panel1: TPanel
      Left = 1
      Top = 41
      Width = 760
      Height = 327
      Align = alClient
      TabOrder = 1
      object Label22: TLabel
        Left = 16
        Top = 6
        Width = 155
        Height = 13
        Caption = 'Tipo de Receita / Despesa'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 86
        Width = 721
        Height = 3
        Shape = bsTopLine
      end
      object Label5: TLabel
        Left = 600
        Top = 44
        Width = 101
        Height = 13
        Caption = 'Nº do Documento'
      end
      object Label15: TLabel
        Left = 16
        Top = 223
        Width = 74
        Height = 13
        Caption = 'Competência'
      end
      object lblDataVencimento: TLabel
        Left = 248
        Top = 223
        Width = 75
        Height = 13
        Caption = 'Data Lancto.'
      end
      object Label3: TLabel
        Left = 16
        Top = 44
        Width = 103
        Height = 13
        Caption = 'Credor / Debitado'
      end
      object Label8: TLabel
        Left = 16
        Top = 271
        Width = 217
        Height = 13
        Caption = 'Usuário responsável pelo Lançamento'
      end
      object Label4: TLabel
        Left = 488
        Top = 271
        Width = 40
        Height = 13
        Caption = 'Origem'
      end
      object Label7: TLabel
        Left = 320
        Top = 6
        Width = 195
        Height = 13
        Caption = 'Conta-Caixa X Forma de Cobrança'
      end
      object Label2: TLabel
        Left = 344
        Top = 223
        Width = 76
        Height = 13
        Caption = 'Data Vencto.'
      end
      object Label11: TLabel
        Left = 440
        Top = 223
        Width = 63
        Height = 13
        Caption = 'Data Baixa'
      end
      object Label12: TLabel
        Left = 656
        Top = 271
        Width = 80
        Height = 13
        Caption = 'Data Inclusão'
      end
      object Label1: TLabel
        Left = 592
        Top = 223
        Width = 63
        Height = 13
        Caption = 'Valor Total'
      end
      object Bevel3: TBevel
        Left = 16
        Top = 265
        Width = 721
        Height = 3
        Shape = bsTopLine
      end
      object Label13: TLabel
        Left = 16
        Top = 92
        Width = 76
        Height = 13
        Caption = 'Lançamentos'
      end
      object Label9: TLabel
        Left = 624
        Top = 6
        Width = 73
        Height = 13
        Caption = 'Nº do Boleto'
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 20
        Width = 289
        Height = 21
        DataField = 'DESCCUSTORECIMO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 248
        Top = 58
        Width = 337
        Height = 21
        DataField = 'RS_FORCLI'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 600
        Top = 58
        Width = 137
        Height = 21
        Color = 12648447
        DataField = 'DOC_CAPCAR'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit11: TDBEdit
        Left = 16
        Top = 237
        Width = 153
        Height = 21
        DataField = '_MESCOMPETENCIA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 168
        Top = 237
        Width = 65
        Height = 21
        DataField = 'ANOCOMPETENCIA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 5
      end
      object DBedtNomeUsuario: TDBEdit
        Left = 16
        Top = 285
        Width = 121
        Height = 21
        DataField = 'LOGIN_USUARIO'
        DataSource = dsLancamentos
        ReadOnly = True
        TabOrder = 9
      end
      object DBedtNomeExtenso: TDBEdit
        Left = 136
        Top = 285
        Width = 337
        Height = 21
        DataField = 'NF_USUARIO'
        DataSource = dsLancamentos
        ReadOnly = True
        TabOrder = 10
      end
      object DBedtOrigem: TDBEdit
        Left = 488
        Top = 285
        Width = 153
        Height = 21
        DataField = '_ORIGEMLANC'
        DataSource = ds
        ReadOnly = True
        TabOrder = 11
      end
      object DBedtPortadorForma: TDBEdit
        Left = 320
        Top = 20
        Width = 289
        Height = 21
        DataField = 'PORTADOR_FORMA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit16: TDBEdit
        Left = 248
        Top = 237
        Width = 81
        Height = 21
        DataField = 'DATALANCAMENTO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit17: TDBEdit
        Left = 344
        Top = 237
        Width = 81
        Height = 21
        DataField = 'DATAVENCIMENTO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit18: TDBEdit
        Left = 440
        Top = 237
        Width = 81
        Height = 21
        DataField = 'DATA_BAIXA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit19: TDBEdit
        Left = 656
        Top = 285
        Width = 81
        Height = 21
        DataField = 'TRGDTINCLUSAO'
        DataSource = dsLancamentos
        ReadOnly = True
        TabOrder = 12
      end
      object DBEdit9: TDBEdit
        Left = 592
        Top = 237
        Width = 145
        Height = 21
        Color = 12648447
        DataField = 'VALOR_TOTAL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 13
      end
      object DBgrdReajuste: TwwDBGrid
        Left = 15
        Top = 107
        Width = 723
        Height = 111
        Selected.Strings = (
          'IMOVEL_EXTENSO'#9'44'#9'Imovel'
          'IMOCODIGO'#9'15'#9'Código'
          'CONTRATO_EXTENSO'#9'40'#9'Contrato'
          'VALOR_LANC'#9'13'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        DataSource = dsLancamentos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 14
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Small Fonts'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        OnCalcCellColors = DBgrdReajusteCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = DBgrdReajusteTopRowChanged
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 58
        Width = 233
        Height = 21
        DataField = 'NF_FORCLI'
        DataSource = ds
        ReadOnly = True
        TabOrder = 15
      end
      object DBEdit2: TDBEdit
        Left = 624
        Top = 20
        Width = 113
        Height = 21
        Color = 12648447
        DataField = 'NOSSONUMERO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 16
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 40
      Align = alTop
      TabOrder = 0
      object Label6: TLabel
        Left = 530
        Top = 14
        Width = 101
        Height = 13
        Caption = 'Data do Estorno: '
      end
      object Label14: TLabel
        Left = 264
        Top = 14
        Width = 47
        Height = 13
        Caption = 'Nº AP:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataEstorno: TCMDateTimePicker
        Left = 632
        Top = 10
        Width = 105
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
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 308
        Top = 10
        Width = 89
        Height = 21
        Color = 12648447
        DataField = 'NUMAPGR'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
    Height = 35
    object lblRecPag: TLabel [0]
      Left = 528
      Top = 5
      Width = 102
      Height = 24
      Alignment = taRightJustify
      Caption = 'a Receber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblEstornado: TLabel [1]
      Left = 637
      Top = 5
      Width = 105
      Height = 24
      Alignment = taRightJustify
      Caption = 'Estornado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 289
        Width = 25
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
        Width = 25
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 25
        Width = 85
        Height = 29
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
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 119
        Width = 85
        Height = 29
        Caption = 'E&xcluir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        Layout = blGlyphLeft
        Spacing = 4
      end
      object ToolbarSep973: TToolbarSep97
        Left = 110
        Top = 0
        SizeHorz = 9
      end
      object sbtnEstornar: TToolbarButton97
        Left = 204
        Top = 0
        Width = 85
        Height = 29
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Estornar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
        Opaque = False
        OnClick = sbtnEstornarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 762
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 579
      DockPos = 579
      inherited sep1: TToolbarSep97
        Left = 0
      end
      inherited sep3: TToolbarSep97
        Left = 176
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 88
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 3
        Width = 85
        Height = 29
        Caption = 'Sair'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 91
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 402
      DockPos = 402
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 29
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 85
        Height = 29
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 392
    Top = 0
  end
  inherited upd: TUpdateSQL
    Left = 328
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 448
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '   DESCCUSTORECIMO, RECPAG,'
      ''
      '   FORCLI_DOC, STATUS_DOC,'
      '   PLNPLANIL, PLNCODIGO,'
      '   CODDOCUMENTO, IDDOCUMENTO, NODOCUMENTO,'
      '   PORTADOR_FORMA, CODTIPIMOVEL,'
      ''
      '   IDTIPOCUSTORECIMO, FLGDIARIO,'
      ''
      '   MOEDA_LANC, COD_MOEDA,'
      '   SUM(VALOR_OM_LANC) AS VALOR_OM_TOTAL,'
      '   SUM(VALOR_LANC) AS VALOR_TOTAL,'
      ''
      '   IDFORCLI, NF_FORCLI, RS_FORCLI,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   FLGORIGEMLANC, FLGESTORNADO, FLGINTEGRADO,'
      ''
      '   DOC_CAPCAR, NUMAPGR, NOSSONUMERO'
      ''
      'FROM'
      '   VWLANCAMENTO'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDEMPRESAPROP )'
      '   AND ( IDDOCUMENTO =:PIDDOCUMENTO )'
      ''
      'GROUP BY'
      '   DESCCUSTORECIMO, RECPAG,'
      ''
      '   FORCLI_DOC, STATUS_DOC,'
      '   PLNPLANIL, PLNCODIGO,'
      '   CODDOCUMENTO, IDDOCUMENTO, NODOCUMENTO,'
      '   PORTADOR_FORMA, CODTIPIMOVEL,'
      '   IDTIPOCUSTORECIMO, FLGDIARIO,   '
      ''
      '   MOEDA_LANC, COD_MOEDA,'
      ''
      '   IDFORCLI, NF_FORCLI, RS_FORCLI,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   FLGORIGEMLANC, FLGESTORNADO, FLGINTEGRADO,'
      ''
      '   DOC_CAPCAR, NUMAPGR, NOSSONUMERO'
      ''
      ''
      ' ')
    Left = 360
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qry_ORIGEMLANC: TStringField
      FieldKind = fkCalculated
      FieldName = '_ORIGEMLANC'
      Visible = False
      Size = 25
      Calculated = True
    end
    object qry_MESCOMPETENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = '_MESCOMPETENCIA'
      Visible = False
      Size = 15
      Calculated = True
    end
    object qryDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'VWLANCAMENTO.DESCCUSTORECIMO'
      ReadOnly = True
      Size = 60
    end
    object qryFORCLI_DOC: TFloatField
      FieldName = 'FORCLI_DOC'
      Origin = 'VWLANCAMENTO.FORCLI_DOC'
      ReadOnly = True
    end
    object qrySTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Origin = 'VWLANCAMENTO.STATUS_DOC'
      ReadOnly = True
      Size = 1
    end
    object qryPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      Origin = 'VWLANCAMENTO.PLNPLANIL'
      ReadOnly = True
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'VWLANCAMENTO.PLNCODIGO'
      ReadOnly = True
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'VWLANCAMENTO.CODDOCUMENTO'
      ReadOnly = True
    end
    object qryNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = 'VWLANCAMENTO.NODOCUMENTO'
      ReadOnly = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qryPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Origin = 'VWLANCAMENTO.PORTADOR_FORMA'
      ReadOnly = True
      Size = 50
    end
    object qryMOEDA_LANC: TStringField
      FieldName = 'MOEDA_LANC'
      Origin = 'VWLANCAMENTO.MOEDA_LANC'
      ReadOnly = True
      Size = 10
    end
    object qryCOD_MOEDA: TFloatField
      FieldName = 'COD_MOEDA'
      Origin = 'VWLANCAMENTO.COD_MOEDA'
      ReadOnly = True
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VWLANCAMENTO.IDFORCLI'
      ReadOnly = True
    end
    object qryNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Origin = 'VWLANCAMENTO.NF_FORCLI'
      ReadOnly = True
      Size = 60
    end
    object qryRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Origin = 'VWLANCAMENTO.RS_FORCLI'
      ReadOnly = True
      Size = 60
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'VWLANCAMENTO.DATALANCAMENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'VWLANCAMENTO.DATAVENCIMENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = 'VWLANCAMENTO.DATA_BAIXA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'VWLANCAMENTO.MESCOMPETENCIA'
      ReadOnly = True
    end
    object qryANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'VWLANCAMENTO.ANOCOMPETENCIA'
      ReadOnly = True
    end
    object qryFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      Origin = 'VWLANCAMENTO.FLGORIGEMLANC'
      ReadOnly = True
      Size = 1
    end
    object qryFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
      Origin = 'VWLANCAMENTO.FLGESTORNADO'
      ReadOnly = True
    end
    object qryFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
      Origin = 'VWLANCAMENTO.FLGINTEGRADO'
      ReadOnly = True
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'VWLANCAMENTO.RECPAG'
      ReadOnly = True
      Size = 1
    end
    object qryVALOR_OM_TOTAL: TFloatField
      FieldName = 'VALOR_OM_TOTAL'
      Origin = '"CM.VWLANCAMENTO".VALOR_OM_LANC'
      ReadOnly = True
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"CM.VWLANCAMENTO".VALOR_LANC'
      ReadOnly = True
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryDOC_CAPCAR: TFloatField
      FieldName = 'DOC_CAPCAR'
      Origin = 'VWLANCAMENTO.DOC_CAPCAR'
      DisplayFormat = '#0'
    end
    object qryNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
      Origin = 'VWLANCAMENTO.NUMAPGR'
      DisplayFormat = '#0'
    end
    object qryNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'VWLANCAMENTO.NOSSONUMERO'
    end
    object qryCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODTIPIMOVEL'
      Size = 5
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object qryFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      FixedChar = True
      Size = 1
    end
  end
  object dsLancamentos: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qryLancImovel
    Left = 661
    Top = 232
  end
end
