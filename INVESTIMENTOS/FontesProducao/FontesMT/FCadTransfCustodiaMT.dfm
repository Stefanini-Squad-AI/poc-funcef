inherited frmCadTransfCustodiaMT: TfrmCadTransfCustodiaMT
  Left = 265
  Top = 121
  HelpContext = 790304
  Caption = 'frmCadTransfCustodiaMT'
  ClientHeight = 476
  ClientWidth = 702
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 359
    inherited pnlControles: TPanel
      Width = 700
      Height = 357
      BevelInner = bvLowered
      BevelOuter = bvRaised
      object pnlOrigem: TPanel
        Left = 2
        Top = 27
        Width = 696
        Height = 208
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 6
          Width = 28
          Height = 13
          Anchors = [akLeft]
          Caption = 'Data'
        end
        object Label2: TLabel
          Left = 14
          Top = 46
          Width = 73
          Height = 13
          Anchors = [akLeft]
          Caption = 'Investimento'
        end
        object Label3: TLabel
          Left = 14
          Top = 154
          Width = 131
          Height = 13
          Anchors = [akLeft]
          Caption = 'Quantidade a transferir'
        end
        object Label9: TLabel
          Left = 14
          Top = 110
          Width = 103
          Height = 13
          Anchors = [akLeft]
          Caption = 'Tipo de Operação'
        end
        object dblTipoOperacao: TwwDBLookupCombo
          Left = 14
          Top = 125
          Width = 176
          Height = 21
          Anchors = [akLeft]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDTIPOOPERACAO'
          DataSource = ds
          LookupTable = cdsTipoOperacao
          LookupField = 'IDTIPOOPERACAO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblInvestimentoCloseUp
          OnExit = dblInvestimentoExit
        end
        object dbdDataOperacao: TCMDateTimePicker
          Left = 14
          Top = 19
          Width = 176
          Height = 21
          Anchors = [akLeft]
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAMOVCUSTOD'
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
          DisplayFormat = 'dd/mm/yyyy'
          OnExit = dbdDataOperacaoExit
        end
        object dbgSaldosOrigem: TwwDBGrid
          Left = 200
          Top = 1
          Width = 495
          Height = 206
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alRight
          DataSource = dsSaldosOrigem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
          ParentFont = False
          PopupMenu = pmnuFixaColunas
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgSaldosOrigemCalcCellColors
          IndicatorColor = icBlack
        end
        object dbeQuantidade: TDBRealEdit
          Left = 14
          Top = 169
          Width = 176
          Height = 21
          Alignment = taRightJustify
          Anchors = [akLeft]
          Lines.Strings = (
            '1.000')
          TabOrder = 4
          WordWrap = False
          IntDigits = 16
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'QUANTIDADE'
          DataSource = ds
        end
        object pnlSepQtd: TPanel
          Left = 15
          Top = 94
          Width = 174
          Height = 6
          Anchors = [akLeft]
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 5
        end
        object dblInvestimento: TwwDBLookupCombo
          Left = 14
          Top = 60
          Width = 176
          Height = 21
          Anchors = [akLeft]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'40'#9'Investimento')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = cdsInvestimentos
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblInvestimentoCloseUp
          OnExit = dblInvestimentoExit
        end
      end
      object pnlDestino: TPanel
        Left = 2
        Top = 260
        Width = 696
        Height = 95
        Align = alBottom
        TabOrder = 1
        object Label5: TLabel
          Left = 14
          Top = 9
          Width = 68
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Custodiante'
        end
        object Label6: TLabel
          Left = 14
          Top = 49
          Width = 110
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Motivo de Bloqueio'
        end
        object Label4: TLabel
          Left = 356
          Top = 10
          Width = 37
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Boleta'
          FocusControl = dbeBoleta
        end
        object btnGeraBoleta: TSpeedButton
          Left = 576
          Top = 24
          Width = 101
          Height = 22
          Anchors = [akLeft, akBottom]
          Caption = '&Gera Boleta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
            3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
            700077337F3333373777887007333337007733F773F333337733700070333333
            077037773733333F7F37703707333300080737F373333377737F003333333307
            78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
            078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
            70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
            3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
            33337F73FF737773333307800077033333337337773373333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnGeraBoletaClick
        end
        object dbeBoleta: TDBEdit
          Left = 356
          Top = 24
          Width = 221
          Height = 21
          Anchors = [akLeft, akBottom]
          DataField = 'IDBOLETA'
          DataSource = ds
          TabOrder = 2
        end
        object dblCustodiante: TwwDBLookupCombo
          Left = 14
          Top = 23
          Width = 323
          Height = 21
          Anchors = [akLeft, akBottom]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCUSTODIANTE'#9'10'#9'Sigla'#9'F')
          DataField = 'IDCUSTODIANTEDEST'
          DataSource = ds
          LookupTable = cdsCustodiante
          LookupField = 'IDCUSTODIANTE'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblMotBlq: TwwDBLookupCombo
          Left = 14
          Top = 63
          Width = 323
          Height = 21
          Anchors = [akLeft, akBottom]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
          DataField = 'IDMOTIVOBLOQDEST'
          DataSource = ds
          LookupTable = cdsMotivoBloq
          LookupField = 'IDMOTIVOBLOQUEIO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 696
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        Caption = '   Origem'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 2
        Top = 235
        Width = 696
        Height = 25
        Align = alBottom
        Alignment = taLeftJustify
        Caption = '   Destino'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 700
      Height = 357
      Selected.Strings = (
        'IDBOLETA'#9'12'#9'Boleta'#9'F'
        'DATAMOVCUSTOD'#9'10'#9'Data'#9'F'
        'INVESTIMENTO'#9'30'#9'Investimento'#9'F'
        'DESCCARTINVEST'#9'40'#9'Carteira'#9'F'
        'QUANTIDADE'#9'10'#9'Quantidade'#9'F'
        'CUSTODIANTEORIG'#9'10'#9'Custodiante Origem'#9'F'
        'CUSTODIANTEDEST'#9'10'#9'Custodiante Destino'#9'F'
        'MOTIVOBLOQORIG'#9'30'#9'Mot. de Bloq. Origem'#9'F'
        'MOTIVOBLOQDEST'#9'30'#9'Mot. de Bloq. Destino'#9'F')
      FixedCols = 2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited Dock972: TDock97
    Width = 702
  end
  inherited Dock971: TDock97
    Top = 437
    Width = 702
    inherited tb97Fundo: TToolbar97
      Left = 530
      DockPos = 655
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 361
      DockPos = 486
    end
  end
  inherited pnlTitulo: TPanel
    Width = 702
    inherited lbNomItem: TfcLabel
      Width = 266
      Caption = 'Transferência de Custodia'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 298
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 301
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 436
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OC.IDBOLETA'
      'OC.DATAMOVCUSTOD'
      'IV.DESCINVESTIMENTO'
      'CA.DESCCARTINVEST')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Boleta'
      'Data da operação'
      'Investimento'
      'Carteira')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERCUSTODIA OC'
      'INVESTIMENTO IV'
      'CARTEIRAINVEST CA'
      'CUSTODIANTE CO'
      'CUSTODIANTE CD'
      'MOTIVOBLOQUEIO MO'
      'MOTIVOBLOQUEIO MD')
    CamposChave.Strings = (
      'OC.IDOPERCUSTODIA')
    Filtro.Strings = (
      'OC.IDCARTEIRAORIG = OC.IDCARTEIRADEST'
      
        '((OC.IDCUSTODIANTEORIG <> OC.IDCUSTODIANTEDEST) OR (OC.IDMOTIVOB' +
        'LOQORIG <> OC.IDMOTIVOBLOQDEST) OR (OC.FLGTIPOCONTAORIG <> OC.FL' +
        'GTIPOCONTADEST))'
      'OC.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      'OC.IDCARTEIRAORIG = CA.IDCARTEIRAINVEST'
      'OC.IDCUSTODIANTEORIG = CO.IDCUSTODIANTE'
      'OC.IDCUSTODIANTEDEST = CD.IDCUSTODIANTE'
      'OC.IDMOTIVOBLOQORIG = MO.IDMOTIVOBLOQUEIO'
      'OC.IDMOTIVOBLOQDEST = MD.IDMOTIVOBLOQUEIO')
    Mascaras.Strings = (
      ''
      'dd/mm/yyyy'
      ''
      '')
    Larguras.Strings = (
      '30'
      '18'
      '60'
      '60')
    OperComparador.Strings = (
      '0'
      '0'
      '0'
      '0')
    Left = 256
  end
  inherited CdsAux: TCMClientDataSet
    Left = 596
    Top = 7
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 302
    Top = 7
  end
  object CMSqlParamsCds: TCMSqlParams
    SQL.Strings = (
      'SELECT O.IDBOLETA, O.DATAMOVCUSTOD,'
      ''
      
        '--       CASE WHEN (O.IDCUSTODIANTEORIG <> O.IDCUSTODIANTEDEST) ' +
        'THEN '#39'TRANSFERENCIA DE CUSTODIANTE'#39' ELSE'
      
        '--       CASE WHEN (O.IDMOTIVOBLOQORIG <> O.IDMOTIVOBLOQDEST)   ' +
        'THEN '#39'TRANSFERENCIA DE MOTIVO DE BLOQUEIO'#39' ELSE'
      
        '--       CASE WHEN (O.FLGTIPOCONTAORIG <> O.FLGTIPOCONTADEST)   ' +
        'THEN '#39'TRANSFERENCIA DE TIPO DE CONTA INVESTIMENTO'#39' ELSE'
      
        '--                                                              ' +
        '     '#39'TRANSFERENCIA NÃO IDENTIFICADA'#39
      '--       END END END AS DESCTIPOOPERACAO,'
      ''
      
        '       I.DESCINVESTIMENTO AS INVESTIMENTO, C.DESCCARTINVEST, O.Q' +
        'UANTIDADE,'
      
        '       CO.SGLCUSTODIANTE AS CUSTODIANTEORIG, CD.SGLCUSTODIANTE A' +
        'S CUSTODIANTEDEST,'
      
        '       MO.DESCMOTBLOQ AS MOTIVOBLOQORIG, MD.DESCMOTBLOQ AS MOTIV' +
        'OBLOQDEST,'
      
        '--       DECODE(NVL(O.FLGTIPOCONTAORIG,0), 0, '#39'CONTA CORRENTE'#39','#39 +
        'CONTA INVESTIMENTO'#39') AS CONTAORIGEM,'
      
        '--       DECODE(NVL(O.FLGTIPOCONTADEST,0), 0, '#39'CONTA CORRENTE'#39','#39 +
        'CONTA INVESTIMENTO'#39') AS CONTADESTINO,'
      
        '       O.IDOPERCUSTODIA, O.IDINVESTIMENTO, O.IDCARTEIRAORIG, O.I' +
        'DCARTEIRADEST,'
      
        '       O.IDCUSTODIANTEORIG, O.IDCUSTODIANTEDEST, O.IDMOTIVOBLOQO' +
        'RIG, O.IDMOTIVOBLOQDEST,'
      
        '       NVL(O.FLGTIPOCONTAORIG,0) AS FLGTIPOCONTAORIG, NVL(O.FLGT' +
        'IPOCONTADEST,0) AS FLGTIPOCONTADEST,'
      '       O.IDPLANPREVCTBPATR, O.IDPLANPREVCTBDEST, O.IDLOTE,'
      
        '       O.IDHISTCARTINVORIG, O.IDHISTCARTINVDEST, O.IDCUSTODIAORI' +
        'G, O.IDCUSTODIADEST,'
      
        '       O.IDTIPOINVEST, O.IDTIPOOPERACAO, O.IDTIPOOPERORIG, O.IDT' +
        'IPOOPERDEST'
      ''
      
        'FROM OPERCUSTODIA O, INVESTIMENTO I, CARTEIRAINVEST C, CUSTODIAN' +
        'TE CO, CUSTODIANTE CD, TIPOOPERACAO TP,'
      '     MOTIVOBLOQUEIO MO, MOTIVOBLOQUEIO MD'
      ''
      'WHERE O.IDCARTEIRAORIG = O.IDCARTEIRADEST'
      '  AND ((O.IDCUSTODIANTEORIG <> O.IDCUSTODIANTEDEST) OR'
      '       (O.IDMOTIVOBLOQORIG <> O.IDMOTIVOBLOQDEST) OR'
      '       (O.FLGTIPOCONTAORIG <> O.FLGTIPOCONTADEST) )'
      '  AND (O.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (O.IDTIPOINVEST = TP.IDTIPOINVEST)'
      '  AND (O.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      '  AND (O.IDCARTEIRAORIG = C.IDCARTEIRAINVEST)'
      '  AND (O.IDCUSTODIANTEORIG = CO.IDCUSTODIANTE)'
      '  AND (O.IDCUSTODIANTEDEST = CD.IDCUSTODIANTE)'
      '  AND (O.IDMOTIVOBLOQORIG = MO.IDMOTIVOBLOQUEIO)'
      '  AND (O.IDMOTIVOBLOQDEST = MD.IDMOTIVOBLOQUEIO)'
      'ORDER BY O.DATAMOVCUSTOD, IDBOLETA'
      ' ')
    Left = 464
    Top = 7
  end
  object cdsSaldosOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsSaldosOrigemAfterScroll
    Left = 604
    Top = 247
    object cdsSaldosOrigemPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 28
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object cdsSaldosOrigemDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 37
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object cdsSaldosOrigemSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 16
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object cdsSaldosOrigemDESCMOTBLOQ: TStringField
      DisplayLabel = 'Mot. Bloqueio'
      DisplayWidth = 36
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object cdsSaldosOrigemSALDOTOTAL: TFloatField
      DisplayLabel = 'Saldo Total'
      DisplayWidth = 10
      FieldName = 'SALDOTOTAL'
      DisplayFormat = '#,##0'
    end
    object cdsSaldosOrigemSALDOCC: TFloatField
      DisplayLabel = 'Saldo CC'
      DisplayWidth = 10
      FieldName = 'SALDOCC'
      Visible = False
    end
    object cdsSaldosOrigemSALDOCCI: TFloatField
      DisplayLabel = 'Saldo CCI'
      DisplayWidth = 10
      FieldName = 'SALDOCCI'
      Visible = False
    end
    object cdsSaldosOrigemIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
      Visible = False
    end
    object cdsSaldosOrigemIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object cdsSaldosOrigemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object cdsSaldosOrigemIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object cdsSaldosOrigemIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object cdsSaldosOrigemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object cdsSaldosOrigemFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Visible = False
    end
    object cdsSaldosOrigemORDEM: TFloatField
      FieldName = 'ORDEM'
      Visible = False
    end
  end
  object dsSaldosOrigem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSaldosOrigem
    Left = 574
    Top = 247
  end
  object cdsInvestimentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 148
  end
  object cdsCustodiante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 294
    Top = 343
    object cdsCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object cdsCustodianteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object cdsCustodianteFLGCODATIVOCUST: TStringField
      FieldName = 'FLGCODATIVOCUST'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsMotivoBloq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 295
    Top = 383
  end
  object sqpSaldosOrigem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODIAN' +
        'TE, MB.DESCMOTBLOQ, '
      
        '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0), ' +
        'NVL(HC.SALDOBLOQUEADO,0)) AS SALDOTOTAL, '
      '       HC.SALDOQTDECPMF AS SALDOCC, '
      
        '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0)-N' +
        'VL(HC.SALDOQTDECPMF,0), NVL(HC.SALDOBLOQUEADO,0)-NVL(HC.SALDOQTD' +
        'ECPMF,0)) AS SALDOCCI, '
      
        '       HC.IDCUSTODIA, HC.IDINVESTIMENTO, HC.IDCARTEIRAINVEST, HC' +
        '.IDCUSTODIANTE, HC.IDMOTIVOBLOQUEIO, HC.IDPLANPREVCTBPATR, '
      '       NVL(HC.FLGCONTAINVEST,0) AS FLGCONTAINVEST, '
      '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, 0, 1) AS ORDEM '
      ' '
      
        'FROM HISTCUSTODIA HC, CARTEIRAINVEST CA, CUSTODIANTE CT, MOTIVOB' +
        'LOQUEIO MB, VWPLANPREVCTBPATR PP '
      ' '
      'WHERE HC.IDCUSTODIA IN '
      '         (SELECT MAX(H2.IDCUSTODIA) '
      '          FROM HISTCUSTODIA H2 '
      
        '          WHERE (H2.DATAMOVCUSTOD <= TO_DATE('#39'10/09/2006'#39', '#39'DD/M' +
        'M/YYYY'#39'))'
      '            AND (H2.IDINVESTIMENTO = 2020) '
      '            AND (H2.IDLOTE IS NULL) '
      
        '            AND (H2.DATAMOVCUSTOD || H2.IDPLANPREVCTBPATR || H2.' +
        'IDCARTEIRAINVEST || H2.IDINVESTIMENTO || H2.IDCUSTODIANTE || H2.' +
        'IDMOTIVOBLOQUEIO || H2.IDLOTE) IN'
      
        '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDPLANP' +
        'REVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDINVESTIMENTO || H3.IDC' +
        'USTODIANTE || H3.IDMOTIVOBLOQUEIO || H3.IDLOTE'
      '                      FROM HISTCUSTODIA H3 '
      
        '                      WHERE H3.DATAMOVCUSTOD <= TO_DATE('#39'10/09/2' +
        '006'#39', '#39'DD/MM/YYYY'#39')'
      '                        AND (H3.IDINVESTIMENTO = 2020) '
      '                        AND (H3.IDLOTE IS NULL) '
      
        '                      GROUP BY H3.IDPLANPREVCTBPATR, H3.IDCARTEI' +
        'RAINVEST, H3.IDINVESTIMENTO, H3.IDCUSTODIANTE, H3.IDMOTIVOBLOQUE' +
        'IO, H3.IDLOTE) '
      
        '          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2' +
        '.IDINVESTIMENTO, H2.IDCUSTODIANTE, H2.IDMOTIVOBLOQUEIO, H2.IDLOT' +
        'E ) '
      '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) '
      '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)'
      '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO) '
      '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) '
      
        '  AND (((HC.IDMOTIVOBLOQUEIO = -1) AND (HC.SALDOLIBERADO > 0)) O' +
        'R '
      
        '       ((HC.IDMOTIVOBLOQUEIO <> -1) AND (HC.SALDOBLOQUEADO > 0))' +
        ') '
      ' '
      
        'ORDER BY PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODI' +
        'ANTE, ORDEM')
    Left = 634
    Top = 247
  end
  object CMSqlParamsMotBloq: TCMSqlParams
    SQL.Strings = (
      'SELECT                           '
      '   IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ  '
      'FROM                             '
      '   MOTIVOBLOQUEIO                '
      'ORDER BY DESCMOTBLOQ   ')
    Left = 328
    Top = 382
  end
  object cdsBoleta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 540
    Top = 7
  end
  object cdsTipoOperacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 235
  end
end
