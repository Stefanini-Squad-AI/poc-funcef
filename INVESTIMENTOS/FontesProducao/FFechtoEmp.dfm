inherited frmFechtoEmp: TfrmFechtoEmp
  Left = 353
  Top = 156
  HelpContext = 790403
  BorderIcons = []
  Caption = ''
  ClientHeight = 447
  ClientWidth = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 418
    Height = 408
    inherited bvlSepTit: TBevel
      Width = 416
    end
    inherited pnlTitulo: TPanel
      Width = 416
      inherited lbNomDescricao: TfcLabel
        Width = 369
        Caption = 'Empréstimo de Ações (Fechamento)'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 416
      Height = 172
      Align = alTop
      TabOrder = 1
      object lblDtInicio: TLabel
        Left = 32
        Top = 11
        Width = 87
        Height = 13
        Caption = 'Data de Início '
      end
      object lblDtFinal: TLabel
        Left = 188
        Top = 12
        Width = 63
        Height = 13
        Caption = 'Data Final '
      end
      object Label1: TLabel
        Left = 32
        Top = 101
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lbPlanPrev: TLabel
        Left = 32
        Top = 58
        Width = 127
        Height = 13
        Caption = 'Plano e Patrocinadora'
      end
      object dteDataInicio: TCMDateTimePicker
        Left = 32
        Top = 28
        Width = 112
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
        Left = 188
        Top = 28
        Width = 112
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
      object cbxDepurar: TCheckBox
        Left = 32
        Top = 147
        Width = 145
        Height = 17
        Caption = 'Depurar investimento'
        TabOrder = 4
        OnClick = cbxDepurarClick
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 32
        Top = 117
        Width = 354
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F'
          
            'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro  |  Investimento  | Operação' +
            '  | Vencimento  |  Quantidade'#9'F'
          'DATAOPERACAO'#9'10'#9'Operação'#9'F'
          'DATAVENCOPER'#9'10'#9'Vencimento'#9'F'
          'QTDOPERACAO'#9'15'#9'Quantidade'#9'F'
          'TAXAOPERACAO'#9'8'#9'Taxa'#9'F')
        LookupTable = qryInvestimentos
        LookupField = 'IDOPEREMPACOESAP'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkPlanPrev: TwwDBLookupCombo
        Left = 32
        Top = 73
        Width = 354
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        DataField = 'IDPLANPREVCTBPATR'
        LookupTable = qryPlanPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblkPlanPrevExit
      end
    end
    object pgcFechtoEmp: TPageControl
      Left = 1
      Top = 217
      Width = 416
      Height = 190
      ActivePage = tbsProcesso
      Align = alClient
      MultiLine = True
      TabOrder = 2
      TabPosition = tpRight
      object tbsProcesso: TTabSheet
        Caption = 'Processo'
        object lblInvestimento: TLabel
          Left = 96
          Top = 84
          Width = 283
          Height = 13
          AutoSize = False
          WordWrap = True
        end
        object lblAtualizaDia: TLabel
          Left = 13
          Top = 38
          Width = 28
          Height = 13
          Caption = 'Dia: '
        end
        object lblAtualizaInv: TLabel
          Left = 13
          Top = 84
          Width = 81
          Height = 13
          Caption = 'Investimento: '
        end
        object lblInvProc: TLabel
          Left = 90
          Top = 96
          Width = 5
          Height = 13
        end
        object lblDia: TLabel
          Left = 41
          Top = 38
          Width = 338
          Height = 13
          AutoSize = False
        end
        object lblMensagem: TfcLabel
          Left = 14
          Top = 7
          Width = 366
          Height = 19
          AutoSize = False
          Caption = 'Atualizando...'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object prbDatas: TProgressBar
          Left = 13
          Top = 59
          Width = 367
          Height = 16
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
        object prbHistorico: TProgressBar
          Left = 13
          Top = 105
          Width = 367
          Height = 16
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 1
        end
      end
      object tbsDepurar: TTabSheet
        Caption = 'Depurar'
        ImageIndex = 1
        object pnlDepurarDados: TPanel
          Left = 0
          Top = 0
          Width = 391
          Height = 22
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object cbxPassoPasso: TCheckBox
            Left = 8
            Top = 3
            Width = 177
            Height = 17
            Caption = 'Executa Passo-a-Passo ?'
            TabOrder = 0
            OnClick = cbxPassoPassoClick
          end
        end
        object pnlDepurarGrid: TPanel
          Left = 0
          Top = 22
          Width = 391
          Height = 158
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object dbgHistEmpAcoes: TwwDBGrid
            Left = 1
            Top = 1
            Width = 389
            Height = 156
            Selected.Strings = (
              'DATAHISTEMPACOES'#9'10'#9'Data'
              'DESCTIPOOPERACAO'#9'40'#9'Operação'
              'VLRHISTEMPACOES'#9'10'#9'Valor Movimentado'
              'SLDHISTEMPACOES'#9'10'#9'Saldo Financeiro'
              'QTDHISTEMPACOES'#9'10'#9'Qtde. Movimentada'
              'SLDQTDHISTEMPACOE'#9'10'#9'Saldo de Quantidade'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHistEmpAcoes
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 418
    inherited tb97Fundo: TToolbar97
      Left = 277
      DockPos = 467
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited ToolbarSep971: TToolbarSep97
        Left = 189
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 95
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 98
        Width = 91
        Caption = '&Confirmar'
        Enabled = False
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 192
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = '&Processar'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnProcessarClick
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
    Left = 45
    Top = 13
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 120
    Top = 360
  end
  object qryInvestimentos: TwwQuery
    Tag = -5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, OP.DATAOPERAC' +
        'AO, OP.DATAVENCOPER, OP.QTDOPERACAO,'
      
        '       IV.IDINVESTIMENTO, OP.IDOPEREMPACOESAP, OP.TAXAOPERACAO, ' +
        'OP.IDPLANPREVCTBPATR'
      'FROM INVESTIMENTO IV, VWPLANPREVCTBPATR PP,'
      
        '     (SELECT DISTINCT OPE.IDINVESTIMENTO, OPE.IDOPEREMPACOESAP, ' +
        'OPE.DATAOPERACAO, OPE.DATAVENCOPER, OPE.TAXAOPERACAO,'
      
        '             OPE.QTDOPERACAO, OPE.IDPLANPREVCTBPATR, OPE.NUMCONT' +
        'RATOCUSTODIA'
      '      FROM OPEREMPACOES OPE,'
      
        '           (SELECT DISTINCT H.IDPLANPREVCTBPATR, H.IDINVESTIMENT' +
        'O, H.IDOPEREMPACOESAP, H.NUMCONTRATOCUSTODIA'
      '            FROM HISTEMPACOES H'
      
        '            WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      
        '              AND (H.DATAHISTEMPACOES BETWEEN TO_DATE(:SDATAINI,' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE(:SDATAFIM,' +
        #39'DD/MM/YYYY'#39'))  ) HOP'
      '      WHERE (OPE.IDPLANPREVCTBPATR = HOP.IDPLANPREVCTBPATR)'
      '        AND (OPE.IDINVESTIMENTO = HOP.IDINVESTIMENTO)'
      
        '--//        AND (OPE.IDOPEREMPACOES is not null and OPE.IDOPEREM' +
        'PACOES = HOP.IDOPEREMPACOESAP(+))'
      
        '--//        AND (OPE.NUMCONTRATOCUSTODIA is not null and OPE.NUM' +
        'CONTRATOCUSTODIA = HOP.NUMCONTRATOCUSTODIA(+))'
      
        '        AND ((OPE.IDTIPOOPERACAO = -52) OR (OPE.IDTIPOOPERACAO =' +
        ' -10052))) OP'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (PP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, OP.DATAOPER' +
        'ACAO, OP.DATAVENCOPER, OP.IDOPEREMPACOESAP'
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'DESCINVESTIMENTO'#9'###.#0'#9'T'#9'T')
    ValidateWithMask = True
    Left = 345
    Top = 153
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
        DataType = ftString
        Name = 'SDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SDATAFIM'
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
      end>
  end
  object qryHistEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HE.DATAHISTEMPACOES, TP.DESCTIPOOPERACAO,'
      '       HE.VLRHISTEMPACOES, HE.SLDHISTEMPACOES, '
      '       HE.QTDHISTEMPACOES,  HE.SLDQTDHISTEMPACOE'
      'FROM HISTEMPACOES HE, TIPOOPERACAO TP'
      'WHERE HE.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND HE.IDOPEREMPACOESAP = :IDOPEREMPACOESAP'
      'ORDER BY DATAHISTEMPACOES, IDHISTEMPACOES')
    ValidateWithMask = True
    Left = 185
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPEREMPACOESAP'
        ParamType = ptResult
      end>
  end
  object dsHistEmpAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryHistEmpAcoes
    Left = 209
    Top = 357
  end
  object qryTipoOperacaoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = -54')
    ValidateWithMask = True
    Left = 331
    Top = 254
  end
  object qryVencEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE IDTIPOOPERACAO = -52'
      '  AND DATAVENCOPER   = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') '
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end>
  end
  object qryRevEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND IDTIPOOPERACAO = -53'
      '  AND IDOPEREMPACOESAP = :IDOPEREMPACOESAP'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 332
    Top = 341
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
  object qryConfEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPEREMPACOES'
      'WHERE TIPOCONFIRMADO = '#39'N'#39
      '  AND DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 40
    Top = 360
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
  object qryPlanPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 346
    Top = 109
  end
  object Regra: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 345
    Top = 45
  end
  object Cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 140
    Top = 111
    Data = {
      BB0000009619E0BD010000001800000004000000000003000000BB000C49444C
      414E43564947454D5008000400000000000B44415441564947454E5445080008
      0000000000085449504F4C414E43010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000100094445534352
      4943414F010049000000010005574944544802000200220002000D4445464155
      4C545F4F5244455202008200010000000280044C4349440400010009040000}
  end
end
