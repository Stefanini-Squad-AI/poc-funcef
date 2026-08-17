inherited FrmFechtoRenVar: TFrmFechtoRenVar
  Left = 534
  Top = 92
  HelpContext = 790402
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 493
  ClientWidth = 450
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 450
    Height = 454
    object bevFundo: TBevel
      Left = 1
      Top = 42
      Width = 448
      Height = 3
      Align = alTop
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 448
      Height = 408
      Align = alClient
      TabOrder = 1
      object Label4: TLabel
        Left = 17
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label1: TLabel
        Left = 178
        Top = 9
        Width = 63
        Height = 13
        Caption = 'Data Final '
      end
      object lblCarteira: TLabel
        Left = 17
        Top = 89
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblInvestimento: TLabel
        Left = 17
        Top = 129
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblPlanoPatro: TLabel
        Left = 17
        Top = 49
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object dteDataInicio: TCMDateTimePicker
        Left = 17
        Top = 24
        Width = 134
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
        OnExit = dteDataInicioExit
      end
      object dteDataFinal: TCMDateTimePicker
        Left = 178
        Top = 24
        Width = 134
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
        OnExit = dteDataFinalExit
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 17
        Top = 143
        Width = 415
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Descrição'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblkInvestimentoExit
      end
      object grbRendaVariavel: TGroupBox
        Left = 17
        Top = 172
        Width = 414
        Height = 229
        Caption = ' Acompanhamento do Processo '
        TabOrder = 5
        object pnlMensagens: TPanel
          Left = 12
          Top = 118
          Width = 388
          Height = 85
          Alignment = taLeftJustify
          BevelInner = bvLowered
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object lblMensagem: TfcLabel
            Left = 6
            Top = 1
            Width = 381
            Height = 83
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.LineSpacing = 1
            TextOptions.VAlignment = vaVCenter
            TextOptions.WordWrap = True
          end
          object pnlEspacador: TPanel
            Left = 1
            Top = 1
            Width = 5
            Height = 83
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object prbReproc: TProgressBar
          Left = 12
          Top = 206
          Width = 388
          Height = 16
          Min = 0
          Max = 100
          Smooth = True
          Step = 1
          TabOrder = 5
        end
        object chkCalculaOpcInd: TCheckBox
          Left = 13
          Top = 75
          Width = 249
          Height = 17
          Caption = 'Calcular Opções de Índice'
          Enabled = False
          TabOrder = 3
        end
        object chkCustodia: TCheckBox
          Left = 13
          Top = 15
          Width = 164
          Height = 17
          Caption = 'Conciliação de Custódia'
          TabOrder = 0
        end
        object chkAtualizaRV: TCheckBox
          Left = 13
          Top = 54
          Width = 314
          Height = 17
          Caption = 'Atualizar Saldos dos Investimentos Renda Váriavel '
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chkCartGer: TCheckBox
          Left = 13
          Top = 35
          Width = 244
          Height = 17
          Caption = 'Conciliação de Carteiras Gerenciais'
          TabOrder = 1
        end
        object prbReprocDia: TProgressBar
          Left = 12
          Top = 98
          Width = 388
          Height = 16
          Min = 0
          Max = 100
          Smooth = True
          Step = 1
          TabOrder = 6
        end
      end
      object dblkCarteira: TwwDBLookupCombo
        Left = 17
        Top = 103
        Width = 415
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'50'#9'Descrição'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkCarteiraExit
      end
      object dblPlanoPatro: TwwDBLookupCombo
        Left = 17
        Top = 63
        Width = 415
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblPlanoPatroExit
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 448
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomDescricao: TfcLabel
        Left = 16
        Top = 8
        Width = 297
        Height = 24
        Caption = 'Renda Variável (Fechamento)'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited Dock971: TDock97
    Top = 454
    Width = 450
    inherited tb97Fundo: TToolbar97
      Left = 278
      DockPos = 920
      inherited sep1: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 9
      DockPos = 650
      inherited ToolbarSep971: TToolbarSep97
        Left = 181
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 100
        Enabled = False
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 184
        Cancel = False
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object BtProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = '&Processa'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = BtProcessarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
          5555555555000757755555575500005007555570058880000075570870088078
          007555787887087777755550880FF0800007708080888F7088077088F0708F78
          88077000F0778080005555508F0008800755557878FF88777075570870080088
          0755557075888070755555575500075555555555557775555555}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 421
    Top = 1
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object Inutil_QryDespesasOperacao: TwwQuery
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
      'FROM '#9'DESPOPERINVEST DOP, OPERACAOINVEST OI, '
      #9'TIPOOPERACAO TP, INVESTIMENTO IV, ACAO AC, '
      #9'TITRENFIXA TR '
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
    Left = 384
    Top = 380
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
    object Inutil_QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = '"DESPOPERINVEST".IDDESPOPERINVEST'
    end
    object Inutil_QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"DESPOPERINVEST".IDOPERACAOINVEST'
    end
    object Inutil_QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"DESPOPERINVEST".IDTIPOINVEST'
    end
    object Inutil_QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"DESPOPERINVEST".IDTIPOOPERACAO'
    end
    object Inutil_QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"DESPOPERINVEST".IDTIPODESPINVEST'
    end
    object Inutil_QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = '"DESPOPERINVEST".DATAVENCDESPOPER'
    end
    object Inutil_QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = '"DESPOPERINVEST".IDREGRACALCUSADA'
    end
    object Inutil_QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = '"DESPOPERINVEST".IDREGRAVENCUSADA'
    end
    object Inutil_QryDespesasOperacaoDESCDESP2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCDESP'
      LookupDataSet = Inutil_QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'DESCTIPODESPINV'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 40
      Lookup = True
    end
    object Inutil_QryDespesasOperacaoDESCCRED2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCCRED'
      LookupDataSet = Inutil_QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'IDFORCLI'
      Size = 40
      Lookup = True
    end
    object Inutil_QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object Inutil_QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,#0.00'
    end
    object Inutil_QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Required = True
      Size = 30
    end
    object Inutil_QryDespesasOperacaoFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      ReadOnly = True
      Size = 1
    end
    object Inutil_QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object Inutil_QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object Inutil_QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object Inutil_QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object Inutil_QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object Inutil_QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object Inutil_QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object Inutil_QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object Inutil_QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object Inutil_QryDespesasOperacaoTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 10
    end
    object Inutil_QryDespesasOperacaoNATOPERDESP: TStringField
      FieldKind = fkLookup
      FieldName = 'NATOPERDESP'
      LookupDataSet = Inutil_QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'NATUREZAOPERACAO'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 1
      Lookup = True
    end
  end
  object Inutil_DsDespesasOperacao: TwwDataSource
    DataSet = Inutil_QryDespesasOperacao
    Left = 385
    Top = 376
  end
  object Inutil_QryBuscaDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV, '
      #9'NATUREZAOPERACAO'
      ''
      'FROM TIPODESPINVEST')
    ValidateWithMask = True
    Left = 387
    Top = 377
    object Inutil_QryBuscaDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object Inutil_QryBuscaDespesaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TIPODESPINVEST.MOECODIGO'
    end
    object Inutil_QryBuscaDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object Inutil_QryBuscaDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object Inutil_QryBuscaCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM EMPRESAFORN EF, PESSOA PS'
      ''
      'WHERE EF.IDFORCLI = PS.IDPESSOA ')
    ValidateWithMask = True
    Left = 385
    Top = 376
    object Inutil_QryBuscaCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"PESSOA".IDPESSOA'
    end
    object Inutil_QryBuscaCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object Inutil_UpdDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update DESPOPERINVEST'
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
    Left = 386
    Top = 376
  end
  object Inutil_DsImpostosOperacao: TwwDataSource
    DataSet = Inutil_QryImpostosOperacao
    Left = 385
    Top = 376
  end
  object Inutil_QryImpostosOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IOP.IDIMPOSTOINVEST, IOP.IDPESSOA, IOP.IDOPERACAOINVEST,' +
        ' '
      #9'IOP.IDTIPOINVEST,  IOP.IDTIPOOPERACAO, IOP.VLRIMPOSTOOPER, '
      #9'IOP.DATAVENCIMPINVEST, IOP.IDREGRACALCUSADA, '
      #9'IOP.IDREGRAVENCUSADA, IOP.FLGCALCDIARIO'
      ''
      'FROM '#9'IMPOSTOSXOPERACAO IOP, OPERACAOINVEST OI'
      ''
      'WHERE '#9'(IOP.FLGCALCDIARIO    = 1) AND       '
      #9'(OI.DATAOPERACAO     <= :DATAPROC) AND       '
      #9'(IOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '')
    UpdateObject = Inutil_UpdImpostos
    ValidateWithMask = True
    Left = 386
    Top = 376
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAPROC'
        ParamType = ptUnknown
      end>
    object Inutil_QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField
      FieldName = 'IDIMPOSTOINVEST'
    end
    object Inutil_QryImpostosOperacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object Inutil_QryImpostosOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object Inutil_QryImpostosOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object Inutil_QryImpostosOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object Inutil_QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField
      FieldName = 'VLRIMPOSTOOPER'
    end
    object Inutil_QryImpostosOperacaoDESCCRED: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCCRED'
      LookupDataSet = Inutil_QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'NOME'
      KeyFields = 'IDPESSOA'
      Size = 40
      Lookup = True
    end
    object Inutil_QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField
      FieldName = 'DATAVENCIMPINVEST'
    end
    object Inutil_QryImpostosOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object Inutil_QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object Inutil_QryImpostosOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object Inutil_QryImpostosOperacaoDESCIMP: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCIMP'
      LookupDataSet = Inutil_QryBuscaImposto
      LookupKeyFields = 'IDIMPOSTOINVEST'
      LookupResultField = 'DESCIMPOSTOINVEST'
      KeyFields = 'IDIMPOSTOINVEST'
      Size = 40
      Lookup = True
    end
  end
  object Inutil_UpdImpostos: TUpdateSQL
    ModifySQL.Strings = (
      'update IMPOSTOSXOPERACAO'
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
    Left = 387
    Top = 376
  end
  object Inutil_QryBuscaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDIMPOSTOINVEST, DESCIMPOSTOINVEST'
      ''
      'FROM IMPOSTOINVEST ')
    ValidateWithMask = True
    Left = 385
    Top = 377
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 389
    Top = 302
  end
  object Inutil_qryTestaFechBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM OPERACAOINVEST'
      'WHERE'
      '   (FLGSTATUSFECHBOL <> '#39'F'#39')     AND'
      '   (IDTIPOINVEST  = 2)           AND'
      '   (DATAOPERACAO >= :DATAINICIO) AND'
      '   (DATAOPERACAO <= :DATAFIM)    AND'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST)) OR'
      '     (:IDCARTEIRAINVEST IS NULL) )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 377
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
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
  end
  object Inutil_QryConsulta: TwwQuery
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
      
        'FROM '#9'OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV' +
        ','
      #9'   INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC'
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
    Left = 386
    Top = 377
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object Inutil_QryConsultaSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object Inutil_QryConsultaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object Inutil_QryConsultaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object Inutil_QryConsultaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object Inutil_QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object Inutil_QryConsultaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object Inutil_QryConsultaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object Inutil_QryConsultaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object Inutil_QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object Inutil_QryConsultaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object Inutil_QryConsultaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object Inutil_QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object Inutil_QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object Inutil_QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object Inutil_QryConsultaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object Inutil_QryConsultaIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
    end
    object Inutil_QryConsultaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object Inutil_QryConsultaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object Inutil_QryConsultaCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object Inutil_QryConsultaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object Inutil_QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object Inutil_QryConsultaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object Inutil_QryConsultaRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object QryRegAtualizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      ''
      'FROM HISTCARTINV'
      ''
      'WHERE (IDTIPOINVEST = :IDTIPOINVEST)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (IDCARTEIRAINVEST = :IDCA' +
        'RTEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND (DATAMOVCARTINV >= :DATAMOVCARTINV)'
      '  AND (TIPMOVCARTINV  = '#39'ATU'#39')'
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Inutil_UpdDespesas
    ValidateWithMask = True
    Left = 160
    Top = 158
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end>
  end
  object Inutil_qryExcluiOperacoesCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDOPERCUSTODIA, IDHISTCARTINVORIG, IDHISTCARTINVDEST, IDCUSTO' +
        'DIAORIG, IDCUSTODIADEST'
      'FROM'
      '   OPERCUSTODIA'
      'WHERE'
      '   (DATAMOVCUSTOD > TO_DATE(:DATAMOVCUSTOD,'#39'DD/MM/YYYY'#39'))'
      
        '    AND ((( :IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR ( :IDINVESTIMENTO IS NULL))'
      
        '    AND (((( :IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAORIG ' +
        '= :IDCARTEIRAINVEST)) OR ( :IDCARTEIRAINVEST IS NULL)) OR'
      
        '         ((( :IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRADEST ' +
        '= :IDCARTEIRAINVEST)) OR ( :IDCARTEIRAINVEST IS NULL)))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 377
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
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
  end
  object Inutil_qryVencEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE IDTIPOOPERACAO = -52'
      '  AND DATAVENCOPER BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 385
    Top = 377
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
  object Inutil_qryRevEmpAcoes: TwwQuery
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
    Left = 386
    Top = 378
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
      'SELECT'
      '   *'
      'FROM'
      '   (SELECT'
      
        '         O.IDCORRETVALORES, O.IDINVESTIMENTO,O.PUORDMOVINV,SUM(O' +
        '.QTDEORDMOVINV) AS QTDEORDMOVINV,'
      
        '     SUM(O.QTDEORDENADA) AS QTDEORDENADA,O.NUMDOCMOVINV,O.STATMO' +
        'VINV,O.IDTIPOINVEST,O.IDTIPOOPERACAO,'
      
        '         O.IDCARTEIRAINVEST,O.IDCARTEIRAGERENC,O.IDLOTE,O.IDBOLS' +
        'AVALORES,O.IDCUSTODIANTE,'
      '         I.DESCINVESTIMENTO,O.IDPLANPREVCTBPATR'
      '    FROM'
      '       ORDMOVINV O,  INVESTIMENTO I'
      '    WHERE'
      '        (O.STATMOVINV <> '#39'L'#39') AND'
      
        '       (((:IDPLANPREVCTBPATR IS NOT NULL) AND (O.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL) ) AND'
      
        '       (((:IDCARTEIRAINVEST IS NOT NULL) AND (O.IDCARTEIRAINVEST' +
        ' = :IDCARTEIRAINVEST)) OR (:IDCARTEIRAINVEST IS NULL) ) AND'
      
        '  (TRUNC(O.DATAORDMOVINV)  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39 +
        ') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '        (O.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      '    GROUP BY'
      
        '         O.IDCORRETVALORES,O.IDINVESTIMENTO,O.PUORDMOVINV,O.NUMD' +
        'OCMOVINV,O.STATMOVINV,O.IDTIPOINVEST,'
      
        '         O.IDTIPOOPERACAO,O.IDCARTEIRAINVEST,O.IDCARTEIRAGERENC,' +
        'O.IDLOTE,O.IDBOLSAVALORES,'
      '         O.IDCUSTODIANTE,I.DESCINVESTIMENTO,O.IDPLANPREVCTBPATR'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '         O.IDCORRETVALORES,O.IDINVESTIMENTO,O.PUORDMOVINV,SUM(O.' +
        'QTDEORDMOVINV) As QTDEORDMOVINV,'
      
        '     SUM(O.QTDEORDENADA) AS QTDEORDENADA,O.NUMDOCMOVINV,O.STATMO' +
        'VINV,O.IDTIPOINVEST,O.IDTIPOOPERACAO,'
      
        '         O.IDCARTEIRAINVEST,0 AS IDCARTEIRAGERENC,O.IDLOTE,O.IDB' +
        'OLSAVALORES,O.IDCUSTODIANTE,I.DESCINVESTIMENTO,'
      '         O.IDPLANPREVCTBPATR'
      '    FROM'
      '       ORDMOVINV O,  INVESTIMENTO I'
      '    WHERE'
      '        (O.STATMOVINV <> '#39'L'#39') AND'
      
        '       (((:IDPLANPREVCTBPATR IS NOT NULL) AND (O.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL) )  AND'
      
        '       (((:IDCARTEIRAINVEST IS NOT NULL) AND (O.IDCARTEIRAINVEST' +
        ' = :IDCARTEIRAINVEST)) OR (:IDCARTEIRAINVEST IS NULL) ) AND'
      
        '  (TRUNC(O.DATAORDMOVINV)  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39 +
        ')  AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '        (O.IDINVESTIMENTO    = I.IDINVESTIMENTO) AND'
      '        (O.IDCARTEIRAGERENC IS NOT NULL)'
      '    GROUP BY'
      
        '        O.IDCORRETVALORES,O.IDINVESTIMENTO,O.PUORDMOVINV,O.NUMDO' +
        'CMOVINV,O.STATMOVINV,O.IDTIPOINVEST,O.IDTIPOOPERACAO,'
      
        '        O.IDCARTEIRAINVEST,O.IDCARTEIRAGERENC,O.IDLOTE,O.IDBOLSA' +
        'VALORES,O.IDCUSTODIANTE,I.DESCINVESTIMENTO,'
      '        O.IDPLANPREVCTBPATR'
      '   )'
      'ORDER BY'
      '   IDCARTEIRAINVEST, IDCARTEIRAGERENC DESC')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 136
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
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
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
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
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST,DESCCARTINVEST,DATAULTFECH, FLGCARTTERC'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   (IDTIPOINVEST = 2) AND'
      
        '   (((:FLGCARTTERC IS NOT NULL) AND (FLGCARTTERC = :FLGCARTTERC)' +
        ') OR (:FLGCARTTERC IS NULL))'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 388
    Top = 142
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCARTTERC'
        ParamType = ptUnknown
      end>
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraFLGCARTTERC: TStringField
      FieldName = 'FLGCARTTERC'
      Origin = 'CARTEIRAINVEST.FLGCARTTERC'
      FixedChar = True
      Size = 1
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM  INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
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
    Left = 388
    Top = 180
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object Inutil_qryBuscaTRCeOPE: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   ORDMOVINV'
      'WHERE'
      '   (IDTIPOINVEST = 2)   AND'
      '   (STATMOVINV   = '#39'L'#39') AND'
      
        '   (TRUNC(DATAORDMOVINV) > TO_DATE(:DDATAREF,'#39'DD/MM/YYYY'#39'))     ' +
        '                 AND'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST)) OR'
      
        '     (:IDCARTEIRAINVEST IS NULL) )                              ' +
        '                 AND'
      
        '   (((:IDINVESTIMENTO   IS NOT NULL) AND (IDINVESTIMENTO   = :ID' +
        'INVESTIMENTO))   OR'
      '     (:IDINVESTIMENTO   IS NULL) )'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 377
    ParamData = <
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
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
  object QryBuscaDireitos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAODIREITO'
      'FROM OPERACAODIREITO'
      'WHERE'
      
        '    (DATACOM  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO_DATE' +
        '(:DATAFIM,'#39'DD/MM/YYYY'#39')) '
      ' '
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 252
    Top = 302
    ParamData = <
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
  end
  object QryBuscaOperDireitos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '          (IDOPERACAODIREITO IN (SELECT IDOPERACAODIREITO'
      '                                 FROM OPERACAODIREITO'
      '                                 WHERE'
      '                                        (DATACOM  BETWEEN'
      
        '                                         TO_DATE(:DATAINI,'#39'DD/MM' +
        '/YYYY'#39')    AND'
      
        '                                         TO_DATE(:DATAFIM,'#39'DD/MM' +
        '/YYYY'#39')))) AND'
      
        '       (((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL) ) AND'
      
        '       (((:IDCARTEIRAINVEST  IS NOT NULL) AND (IDCARTEIRAINVEST ' +
        ' = :IDCARTEIRAINVEST))  OR (:IDCARTEIRAINVEST IS NULL) )'
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 316
    Top = 302
    ParamData = <
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
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
  end
  object qryBuscaOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NUMDOCUMENTO'
      'FROM OPERACAOINVEST'
      'WHERE (FLGSTATUSFECHBOL <> '#39'F'#39')'
      '  AND (IDTIPOINVEST = 2)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (IDCARTEIRAINVEST  = :IDC' +
        'ARTEIRAINVEST))'
      
        '  AND (DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND T' +
        'O_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      'ORDER BY 1')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 136
    Top = 302
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
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
  end
  object Inurtil_QryInsOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      
        '   (IDOPERACAOINVEST,   IDCORRETVALORES,  MOECODIGO,          ID' +
        'MODULO,'
      
        '    EMPRESAPROP,        IDINVESTIMENTO,   IDCARTEIRAINVEST,   ID' +
        'CARTEIRAGERENC,'
      '    IDTIPOINVEST,       IDTIPOOPERACAO,   DATAOPERACAO,'
      
        '    NUMDOCUMENTO,       QTDEOPERACAO,     PRECOUNITOPERACAO,  VL' +
        'ROPERACAO,'
      
        '    DATAVENCOPER,                         IDFORCLI,           ID' +
        'LOTE,'
      
        '    IDCUSTODIANTE,      VLRIR,            FLGSTATUSFECHBOL,   FL' +
        'GSTATUSORDMOV,'
      '    IDPLANPREVCTBPATR)'
      'VALUES'
      
        '   (:IDOPERACAOINVEST,  :IDCORRETVALORES,   :MOECODIGO,        :' +
        'IDMODULO,'
      
        '    :EMPRESAPROP,       :IDINVESTIMENTO,    :IDCARTEIRAINVEST, :' +
        'IDCARTEIRAGERENC,'
      
        '    :IDTIPOINVEST,      :IDTIPOOPERACAO,    TO_DATE(:DATAOPERACA' +
        'O,'#39'DD/MM/YYYY'#39') ,'
      
        '    :NUMDOCUMENTO,      :QTDEOPERACAO,      :PRECOUNITOPERACAO, ' +
        ':VLROPERACAO,'
      
        '    TO_DATE(:DATAVENCOPER,'#39'DD/MM/YYYY'#39'),    :IDFORCLI,          ' +
        ':IDLOTE,'
      
        '    :IDCUSTODIANTE,     :VLRIR,             :FLGSTATUSFECHBOL,  ' +
        ':FLGSTATUSORDMOV,'
      '    :IDPLANPREVCTBPATR)'
      ''
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 386
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVENCOPER'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
  end
  object qryPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, IDPLANOPREV, IDPAT' +
        'RO'
      'FROM VWPLANPREVCTBPATR'
      '')
    ValidateWithMask = True
    Left = 388
    Top = 86
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
    end
  end
end
