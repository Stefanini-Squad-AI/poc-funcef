inherited FrmFechamentoDiario: TFrmFechamentoDiario
  Left = 70
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Renda Variável (Fechamento)'
  ClientHeight = 340
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 301
    object pgcFechamento: TPageControl
      Left = 5
      Top = 5
      Width = 684
      Height = 291
      ActivePage = tbsFechamento
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object tbsFechamento: TTabSheet
        Caption = 'Dados do Processamento'
        object bevFundo: TBevel
          Left = 0
          Top = 0
          Width = 676
          Height = 263
          Align = alClient
        end
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 87
          Height = 13
          Caption = 'Data de Início '
          Enabled = False
        end
        object Label1: TLabel
          Left = 200
          Top = 9
          Width = 63
          Height = 13
          Caption = 'Data Final '
        end
        object grbRendaVariavel: TGroupBox
          Left = 7
          Top = 88
          Width = 522
          Height = 161
          Caption = ' Acompanhamento do Processo - Renda Variável '
          TabOrder = 2
          object prbVencContr: TProgressBar
            Left = 8
            Top = 129
            Width = 504
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 3
          end
          object prbCalculaCotacao: TProgressBar
            Left = 8
            Top = 42
            Width = 504
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 4
          end
          object prbAtualizaRV: TProgressBar
            Left = 8
            Top = 84
            Width = 504
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 5
          end
          object ChkVencContr: TCheckBox
            Left = 8
            Top = 110
            Width = 401
            Height = 17
            Caption = 'Vencimento de Contratos'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object chkCalculaCotacao: TCheckBox
            Left = 8
            Top = 23
            Width = 401
            Height = 17
            Caption = 'Calcular Cotação dos Investimentos '
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkAtualizaRV: TCheckBox
            Left = 8
            Top = 65
            Width = 401
            Height = 17
            Caption = 'Atualizar Saldos dos Investimentos Renda Váriavel '
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object grbRendaFixa: TGroupBox
          Left = 7
          Top = 90
          Width = 521
          Height = 69
          Caption = ' Acompanhamento do Processo - Renda Fixa '
          TabOrder = 5
          object chkAtualizaRF: TCheckBox
            Left = 8
            Top = 20
            Width = 289
            Height = 17
            Caption = 'Atualizar Saldos dos Investimentos Renda Fixa'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object prbAtualizaRF: TProgressBar
            Left = 9
            Top = 39
            Width = 504
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 1
          end
        end
        object BtProcessar: TBitBtn
          Left = 539
          Top = 122
          Width = 130
          Height = 88
          Caption = 'Processar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = BtProcessarClick
          Glyph.Data = {
            76060000424D7606000000000000760000002800000060000000200000000100
            0400000000000006000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777778777777777777777777777777777777
            0777777777777777777777777777777707777777777777777777777777777777
            7887777777777777777777777777777700777777777777777777777777777777
            0077777777777777777777777777777078887777777777777777777777777777
            0B0777777777777777777777777777770B077777777777777777777777777770
            0888877777777777777777777777777770B07777777777777777777777777777
            70B07777777777777777777777777770B0888877777777777777777777777777
            70BB077777777777777777777777777770BB0777777777777777777777777777
            0B088887777777777777777777777777770BB077777777777777777777777777
            770BB0777777777777777777777777770BB08888777777777777777777777777
            770BBB07777777777777777777777777770BBB07777777777777777777777777
            70BB08888777777777777777777777777770BBB0777777777777777777777777
            7770BBB077777777777777777777777880BBB088887777777777777777777770
            0000BBBB0777777777777777777777700000BBBB077777777777777777777777
            880BBB088887777777777777777777770BBBB000007777777777777777777777
            0BBBB000007777777777777777777700000BBBB0777777777777777777777777
            0BFBBB077777777777777777777777770BFBBB07777777777777777777777770
            BBBB000007777777777777777777777770BFBFB0777777777777777777777777
            70BFBFB0777777777777777777777770BFBBB088887777777777777777777777
            70BBBFBB07777777777777777777777770BBBFBB077777777777777777777777
            0BFBFB08888777777777777777777777770BFBBFB07777777777777777777777
            770BFBBFB077777777777777777777880BBBFBB0888877777777777777777000
            000BBFBBFB0777777777777777777000000BBFBBFB0777777777777777777778
            80BFBBFB08888777777777777777770FBBBFB00000007777777777777777770F
            BBBFB00000007777777777777777000000BBFBBFB0777777777777777777770B
            FFFBFB0777777777777777777777770BFFFBFB077777777777777777777770FB
            BBFB0000000777777777777777777770BFFBBFB0777777777777777777777770
            BFFBBFB07777777777777777777770BFFFBFB088887777777777777777777770
            BFFFFFFF077777777777777777777770BFFFFFFF07777777777777777777770B
            FFBBFB088887777777777777777777770BFBFFFFF07777777777777777777777
            0BFBFFFFF0777777777777777777770BFFFFFFF0888877777777777777777777
            0FFBFFFBFF07777777777777777777770FFBFFFBFF0777777777777777777770
            BFBFFFFF08888777777777777777777770BFBBFBFBB077777777777777777777
            70BFBBFBFBB077777777777777777770FFBFFFBFF08888777777777777777777
            7000000000000777777777777777777770000000000007777777777777777777
            0BFBBFBFBB077777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777700000000000077777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          Layout = blGlyphTop
          NumGlyphs = 3
        end
        object dteDataInicio: TCMDateTimePicker
          Left = 7
          Top = 24
          Width = 140
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
          Enabled = False
          ShowButton = True
          TabOrder = 0
          OnExit = dteDataInicioExit
        end
        object dteDataFinal: TCMDateTimePicker
          Left = 202
          Top = 24
          Width = 140
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
          TabOrder = 1
        end
        object pnlMensagens: TPanel
          Left = 392
          Top = 21
          Width = 229
          Height = 25
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object chkIRLitigio: TCheckBox
          Left = 8
          Top = 60
          Width = 401
          Height = 17
          Caption = 'Atualizar IR Litígio'
          TabOrder = 6
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 524
      DockPos = 817
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 357
      DockPos = 650
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Cancel = False
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 8
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDFORCLI, DOP.IDOPERACAOINVEST' +
        ', '
      
        #9'DOP.IDTIPOINVEST,  DOP.IDTIPOOPERACAO, DOP.VLRDESPOPER, OI.DATA' +
        'OPERACAO,'
      
        #9'DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER, DOP.IDREGRACALCUSAD' +
        'A, '
      #9'DOP.IDREGRAVENCUSADA, OI.NUMDOCUMENTO, OI.IDINVESTIMENTO, '
      
        #9'OI.IDCARTEIRAINVEST, OI.VLROPERACAO, OI.QTDEOPERACAO, OI.MOECOD' +
        'IGO,'
      
        #9'DECODE(DOP.FLGCALCDIARIO,0, '#39'N'#39', '#39'S'#39') AS FLGCALCDIARIO, TP.DESC' +
        'TIPOOPERACAO,'
      #9'IV.DESCINVESTIMENTO, TP.NATUREZAOPERACAO, '
      #9'CONCAT(TR.CODTIPRENFIXA, AC.CODTIPOACAO) AS TIPOTITULO'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP, CM.OPERACAOINVEST OI, '
      #9'CM.TIPOOPERACAO TP, CM.INVESTIMENTO IV, CM.ACAO AC, '
      #9'CM.TITRENFIXA TR '
      ''
      'WHERE '#9'(OI.DATAOPERACAO     >= :DATAINIPROC) AND       '
      #9'(OI.DATAOPERACAO     <= :DATAFIMPROC) AND       '
      #9'(DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND '
      #9'(OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)     AND '
      #9'(OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)        AND '
      #9'(IV.IDINVESTIMENTO = AC.IDACAO(+))                    AND '
      #9'(IV.IDINVESTIMENTO = TR.IDTITRENFIXA(+))      '
      #9
      'ORDER BY OI.NUMDOCUMENTO')
    ValidateWithMask = True
    Left = 432
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINIPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIMPROC'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = '"CM.DESPOPERINVEST".IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.DESPOPERINVEST".IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = '"CM.DESPOPERINVEST".DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoDESCDESP2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'DESCTIPODESPINV'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 40
      Lookup = True
    end
    object QryDespesasOperacaoDESCCRED2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCCRED'
      LookupDataSet = QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'IDFORCLI'
      Size = 40
      Lookup = True
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,#0.00'
    end
    object QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Required = True
      Size = 30
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      ReadOnly = True
      Size = 1
    end
    object QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryDespesasOperacaoTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 10
    end
    object QryDespesasOperacaoNATOPERDESP: TStringField
      FieldKind = fkLookup
      FieldName = 'NATOPERDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'NATUREZAOPERACAO'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 1
      Lookup = True
    end
  end
  object DsDespesasOperacao: TwwDataSource
    DataSet = QryDespesasOperacao
    Left = 462
    Top = 64
  end
  object QryBuscaDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV, '
      #9'NATUREZAOPERACAO'
      ''
      'FROM CM.TIPODESPINVEST')
    ValidateWithMask = True
    Left = 500
    Top = 8
    object QryBuscaDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object QryBuscaDespesaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TIPODESPINVEST.MOECODIGO'
    end
    object QryBuscaDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object QryBuscaDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object QryBuscaCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM EMPRESAFORN EF, PESSOA PS'
      ''
      'WHERE EF.IDFORCLI = PS.IDPESSOA ')
    ValidateWithMask = True
    Left = 532
    Top = 8
    object QryBuscaCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object QryBuscaCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object UpdDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.DESPOPERINVEST'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  VLRDESPOPER = :VLRDESPOPER,'
      '  DATAVENCDESPOPER = :DATAVENCDESPOPER'
      'where'
      '  IDDESPOPERINVEST = :OLD_IDDESPOPERINVEST')
    InsertSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    DeleteSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    Left = 402
    Top = 64
  end
  object DsImpostosOperacao: TwwDataSource
    DataSet = QryImpostosOperacao
    Left = 552
    Top = 64
  end
  object QryImpostosOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IOP.IDIMPOSTOINVEST, IOP.IDPESSOA, IOP.IDOPERACAOINVEST,' +
        ' '
      #9'IOP.IDTIPOINVEST,  IOP.IDTIPOOPERACAO, IOP.VLRIMPOSTOOPER, '
      #9'IOP.DATAVENCIMPINVEST, IOP.IDREGRACALCUSADA, '
      #9'IOP.IDREGRAVENCUSADA, IOP.FLGCALCDIARIO'
      ''
      'FROM '#9'CM.IMPOSTOSXOPERACAO IOP, CM.OPERACAOINVEST OI'
      ''
      'WHERE '#9'(IOP.FLGCALCDIARIO    = 1) AND       '
      #9'(OI.DATAOPERACAO     <= :DATAPROC) AND       '
      #9'(IOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '')
    UpdateObject = UpdImpostos
    ValidateWithMask = True
    Left = 522
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAPROC'
        ParamType = ptUnknown
      end>
    object QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField
      FieldName = 'IDIMPOSTOINVEST'
    end
    object QryImpostosOperacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryImpostosOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryImpostosOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryImpostosOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField
      FieldName = 'VLRIMPOSTOOPER'
    end
    object QryImpostosOperacaoDESCCRED: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCCRED'
      LookupDataSet = QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'NOME'
      KeyFields = 'IDPESSOA'
      Size = 40
      Lookup = True
    end
    object QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField
      FieldName = 'DATAVENCIMPINVEST'
    end
    object QryImpostosOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object QryImpostosOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object QryImpostosOperacaoDESCIMP: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCIMP'
      LookupDataSet = QryBuscaImposto
      LookupKeyFields = 'IDIMPOSTOINVEST'
      LookupResultField = 'DESCIMPOSTOINVEST'
      KeyFields = 'IDIMPOSTOINVEST'
      Size = 40
      Lookup = True
    end
  end
  object UpdImpostos: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.IMPOSTOSXOPERACAO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  VLRIMPOSTOOPER = :VLRIMPOSTOOPER,'
      '  DATAVENCIMPINVEST = :DATAVENCIMPINVEST'
      'where'
      '  IDIMPOSTOINVEST = :OLD_IDIMPOSTOINVEST and'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST and'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'SELECT * FROM IMPOSTOSXOPERACAO'
      'WHERE 1=2')
    Left = 492
    Top = 64
  end
  object QryBuscaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDIMPOSTOINVEST, DESCIMPOSTOINVEST'
      ''
      'FROM CM.IMPOSTOINVEST ')
    ValidateWithMask = True
    Left = 565
    Top = 8
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 599
    Top = 8
  end
  object qryTestaFechBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM OPERACAOINVEST'
      'WHERE FLGSTATUSFECHBOL<>'#39'F'#39' AND IDTIPOINVEST=2 AND '
      '      DATAOPERACAO >= :DATAINICIO AND'
      '      DATAOPERACAO <= :DATAFIM')
    ValidateWithMask = True
    Left = 376
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
  object QryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.' +
        'QTDEOPERACAO, OI.IDOPERACAOINVEST,'
      
        #9'    OI.PRECOUNITOPERACAO, OI.VLROPERACAO, SUBSTR(ME.DESCMERCADO' +
        ',1,10) AS DESCMERCADO,'
      
        #9'    PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMEN' +
        'TO, TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,'
      
        '       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,'
      
        '       AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOT' +
        'E, TI.RECPAG'
      ''
      
        'FROM '#9'CM.OPERACAOINVEST OI, CM.OPRACAO OA,  PESSOA PS, BOLSAVALO' +
        'RES BV,'
      
        #9'   CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.AC' +
        'AO AC'
      ''
      'WHERE (OI.NUMDOCUMENTO     = :NUMDOC) '#9#9'            AND'
      #9'   (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)'#9'   AND'
      #9'   (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9#9'   AND'
      #9'   (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)'#9'      AND'
      #9'   (OA.IDACAO '#9'         = IV.IDINVESTIMENTO) '#9'   AND'
      #9'   (TI.IDMERCADO '#9'      = ME.IDMERCADO)'#9#9'      AND'
      #9'   (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)  AND'
      '           (OI.IDINVESTIMENTO   = AC.IDACAO)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 600
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object QryConsultaSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object QryConsultaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryConsultaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryConsultaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryConsultaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object QryConsultaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryConsultaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryConsultaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object QryConsultaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryConsultaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryConsultaIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
    end
    object QryConsultaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryConsultaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryConsultaCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object QryConsultaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryConsultaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryConsultaRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object qryContabOperDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NUMDOCUMENTO'
      'FROM OPERACAOINVEST '
      'WHERE FLGSTATUSFECHBOL<>'#39'F'#39' AND '
      '      IDOPERACAODIREITO IS NOT NULL AND '
      '      DATAOPERACAO >= :DATAINICIO AND'
      '      DATAOPERACAO <= :DATAFIM ')
    ValidateWithMask = True
    Left = 600
    Top = 136
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryContabOperDireitoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
  end
  object QryExcluiFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODDOCUMENTO,PLANO,PLNCODIGO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDCARTEIRAINVEST = :iCarteira ) AND'
      '   (IDINVESTIMENTO   = :iInvestimento ) AND'
      '   (TIPMOVCARTINV    = '#39'OPE'#39') AND'
      '   (IDTIPOOPERACAO   = :iTipoOperacao ) AND'
      '   (DATAMOVCARTINV   = TO_DATE(:DataProc,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 599
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCarteira'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTipoOperacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataProc'
        ParamType = ptUnknown
      end>
  end
  object QryDelExcluiFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDCARTEIRAINVEST = :iCarteira ) AND'
      '   (IDINVESTIMENTO   = :iInvestimento ) AND'
      '   (TIPMOVCARTINV    = '#39'OPE'#39') AND'
      '   (IDTIPOOPERACAO   = :iTipoOperacao ) AND'
      '   (DATAMOVCARTINV   = TO_DATE(:DataProc,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 272
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCarteira'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTipoOperacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataProc'
        ParamType = ptUnknown
      end>
  end
  object QryInsFluxoTitulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCORRETVALORES, MOECODIGO, IDMODULO, EMPRE' +
        'SAPROP,'
      
        '   IDINVESTIMENTO, IDCARTEIRAINVEST, IDTIPOINVEST, IDTIPOOPERACA' +
        'O,'
      '   DATAOPERACAO, NUMDOCUMENTO, VLROPERACAO, DATAVENCOPER,'
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, IDORDMOVINV)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDCORRETVALORES, :MOECODIGO, :IDMODULO, :' +
        'EMPRESAPROP,'
      
        '   :IDINVESTIMENTO, :IDCARTEIRAINVEST, :IDTIPOINVEST, :IDTIPOOPE' +
        'RACAO,'
      '   :DATAOPERACAO, :NUMDOCUMENTO, :VLROPERACAO, :DATAVENCOPER,'
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :IDORDMOVINV)'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORDMOVINV'
        ParamType = ptUnknown
      end>
    object QryInsFluxoTituloIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryInsFluxoTituloIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryInsFluxoTituloIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryInsFluxoTituloIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryInsFluxoTituloIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryInsFluxoTituloIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object QryInsFluxoTituloDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryInsFluxoTituloNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryInsFluxoTituloQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryInsFluxoTituloPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object QryInsFluxoTituloVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryInsFluxoTituloDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryInsFluxoTituloIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryInsFluxoTituloEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object QryInsFluxoTituloIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryInsFluxoTituloIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryInsFluxoTituloMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryInsFluxoTituloIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryInsFluxoTituloOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object QryInsFluxoTituloFLGCUSTODIA: TStringField
      FieldName = 'FLGCUSTODIA'
      Size = 1
    end
    object QryInsFluxoTituloVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
  end
  object QryDelOperInvFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   (IDCARTEIRAINVEST = :iCarteira ) AND'
      '   (IDINVESTIMENTO   = :iInvestimento ) AND'
      '   (IDTIPOOPERACAO   = :iTipoOperacao ) AND'
      '   (DATAOPERACAO   = TO_DATE(:DataProc,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 272
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCarteira'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTipoOperacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataProc'
        ParamType = ptUnknown
      end>
  end
  object QryRegAtualizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM '
      '      HISTCARTINV'
      'WHERE'
      '      DATAMOVCARTINV >= :DATAMOVCARTINV AND'
      '      TIPMOVCARTINV  = '#39'ATU'#39'            AND'
      '      IDTIPOINVEST   = :IDTIPOINVEST    AND'
      
        '  (((:IDINVESTIMENTO IS NOT NULL)    AND (IDINVESTIMENTO =:IDINV' +
        'ESTIMENTO)) OR'
      '    (:IDINVESTIMENTO IS NULL))'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpdDespesas
    ValidateWithMask = True
    Left = 272
    Top = 96
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryInsBetaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTBETACARTEIRA'
      
        '(IDHISTBETA, IDPARAMIMPEXCEL, IDCARTEIRAINVEST, IDCARTEIRAGERENC' +
        ', IDPLANPREVCTBPATR, DATAHISTBETA, VLRBETA)'
      'VALUES'
      
        '(:IDHISTBETA, :IDPARAMIMPEXCEL, :IDCARTEIRAINVEST, :IDCARTEIRAGE' +
        'RENC, :IDPLANPREVCTBPATR, TO_DATE(:DATAHISTBETA,'#39'DD/MM/YYYY'#39'), :' +
        'VLRBETA)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 247
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTBETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPARAMIMPEXCEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTBETA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRBETA'
        ParamType = ptInput
      end>
  end
  object qryExcluiOperacoesRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.NUMDOCUMENTO, HI.IDTIPOINVEST, HI.IDOPERACAOINVEST, HI' +
        '.DATAMOVCARTINV'
      'FROM HISTCARTINV HI, OPERACAOINVEST OP'
      'WHERE HI.IDTIPOINVEST = 1 AND'
      
        '      HI.DATAMOVCARTINV >= TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')' +
        ' AND'
      '      HI.TIPMOVCARTINV = '#39'OPE'#39' AND'
      '      HI.IDOPERACAOINVEST = OP.IDOPERACAOINVEST'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 45
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end>
    object qryExcluiOperacoesRFNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryExcluiOperacoesRFIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryExcluiOperacoesRFIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryExcluiOperacoesRFDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
  end
  object QryBuscaDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       DATAULTFECH'
      'FROM'
      '       TIPOFUNDOINVEST'
      'WHERE'
      '       IDTIPOINVEST = 5'
      'ORDER BY DATAULTFECH DESC  ')
    ValidateWithMask = True
    Left = 103
    Top = 124
  end
  object qryExcluiOperacoesRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        'OP.NUMDOCUMENTO, HI.IDTIPOINVEST, HI.IDOPERACAOINVEST, HI.DATAMO' +
        'VCARTINV, HI.TIPMOVCARTINV,'
      'HI.IDHISTCARTINV, IDOPERACAODIREITO'
      'FROM'
      'HISTCARTINV HI, OPERACAOINVEST OP'
      'WHERE'
      'HI.IDTIPOINVEST = 2                                       AND'
      
        '((HI.IDTIPOOPERACAO NOT IN (8,5)) OR (HI.IDTIPOOPERACAO IS NULL)' +
        ') AND'
      'HI.DATAMOVCARTINV > TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39') AND'
      
        '((( :IDINVESTIMENTO IS NOT NULL) AND (HI.IDINVESTIMENTO = :IDINV' +
        'ESTIMENTO)) OR'
      '( :IDINVESTIMENTO IS NULL))                               AND'
      'HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'TRF'#39','#39'TRC'#39')                   AND'
      'HI.IDOPERACAOINVEST = OP.IDOPERACAOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
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
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 45
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryExcluiOperacoesRVNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryExcluiOperacoesRVIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryExcluiOperacoesRVIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryExcluiOperacoesRVDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryExcluiOperacoesRVTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryExcluiOperacoesRVIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryExcluiOperacoesRVIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
  end
  object qryExcluiOperacoesCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERCUSTODIA,'
      ''
      '       IDHISTCARTINVORIG,'
      ''
      '       IDHISTCARTINVDEST,'
      ''
      '       IDCUSTODIAORIG,'
      ''
      '       IDCUSTODIADEST'
      ''
      'FROM OPERCUSTODIA'
      ''
      'WHERE (DATAMOVCUSTOD > TO_DATE(:DATAMOVCUSTOD,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '  AND ((( :IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO = :ID' +
        'INVESTIMENTO)) OR'
      ''
      '        ( :IDINVESTIMENTO IS NULL))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 60
    Top = 45
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryVencEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE IDTIPOOPERACAO = -52'
      '  AND DATAVENCOPER BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 520
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
        Value = '13/01/2003'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
        Value = '13/01/2003'
      end>
  end
  object qryRevEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE IDINVESTIMENTO   = :IDINVESTIMENTO'
      '  AND IDTIPOOPERACAO   = -53'
      '  AND IDOPEREMPACOESAP = :IDOPEREMPACOESAP'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 620
    Top = 245
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPEREMPACOESAP'
        ParamType = ptResult
      end>
  end
  object QryBuscaOrdem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM ('
      'SELECT'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  sum(O.QTDEORDMOVINV) As QTDEORDMOVINV,'
      '  sum(O.QTDEORDENADA) As QTDEORDENADA,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.IDCARTEIRAINVEST,'
      '  O.IDCARTEIRAGERENC,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  I.DESCINVESTIMENTO,'
      '  O.IDPLANPREVCTBPATR'
      'FROM'
      '  ORDMOVINV O,  INVESTIMENTO I'
      'WHERE'
      '  O.STATMOVINV        = '#39'A'#39'                           AND'
      ''
      '(((:IDPLANPREVCTBPATR IS NOT NULL)                    AND'
      '  (O.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))         OR'
      '  (:IDPLANPREVCTBPATR IS NULL) )                      AND'
      ''
      
        ' (TRUNC(O.DATAORDMOVINV)  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        '  AND'
      
        '                                  TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ') AND'
      '  O.IDINVESTIMENTO      = I.IDINVESTIMENTO'
      'group by'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.IDCARTEIRAINVEST,'
      '  O.IDCARTEIRAGERENC,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  I.DESCINVESTIMENTO,'
      '  O.IDPLANPREVCTBPATR'
      ''
      'UNION'
      ''
      'SELECT'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  sum(O.QTDEORDMOVINV) As QTDEORDMOVINV,'
      '  sum(O.QTDEORDENADA) As QTDEORDENADA,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.IDCARTEIRAINVEST,'
      '  0 AS IDCARTEIRAGERENC,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  I.DESCINVESTIMENTO,'
      '  O.IDPLANPREVCTBPATR'
      'FROM'
      '  ORDMOVINV O,  INVESTIMENTO I'
      'WHERE'
      '  O.STATMOVINV        = '#39'A'#39'                           AND'
      '  O.IDTIPOINVEST = 2 AND'
      '(((:IDPLANPREVCTBPATR IS NOT NULL)                    AND'
      '  (O.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))         OR'
      '  (:IDPLANPREVCTBPATR IS NULL) )                      AND'
      ''
      
        ' (TRUNC(O.DATAORDMOVINV)  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        '  AND'
      
        '                                  TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')' +
        ') AND'
      ''
      '  O.IDINVESTIMENTO    = I.IDINVESTIMENTO              AND'
      '  O.IDCARTEIRAGERENC IS NOT NULL'
      'group by'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.IDCARTEIRAINVEST,'
      '  O.IDCARTEIRAGERENC,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  I.DESCINVESTIMENTO,'
      '  O.IDPLANPREVCTBPATR)'
      'ORDER BY IDCARTEIRAINVEST, IDCARTEIRAGERENC DESC'
      ''
      ''
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 98
    Top = 169
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object QryBuscaOrdemIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryBuscaOrdemIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBuscaOrdemPUORDMOVINV: TFloatField
      FieldName = 'PUORDMOVINV'
    end
    object QryBuscaOrdemQTDEORDMOVINV: TFloatField
      FieldName = 'QTDEORDMOVINV'
    end
    object QryBuscaOrdemQTDEORDENADA: TFloatField
      FieldName = 'QTDEORDENADA'
    end
    object QryBuscaOrdemNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
    object QryBuscaOrdemSTATMOVINV: TStringField
      FieldName = 'STATMOVINV'
      Size = 1
    end
    object QryBuscaOrdemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryBuscaOrdemIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryBuscaOrdemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaOrdemIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaOrdemIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryBuscaOrdemIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryBuscaOrdemDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaOrdemIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
end
