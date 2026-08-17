inherited frmFechtoRenFix: TfrmFechtoRenFix
  Left = 420
  Top = 116
  HelpContext = 790401
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = ''
  ClientHeight = 441
  ClientWidth = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 423
    Height = 402
    inherited bvlSepTit: TBevel
      Width = 421
    end
    inherited pnlTitulo: TPanel
      Width = 421
      inherited lbNomDescricao: TfcLabel
        Width = 350
        Caption = 'Atualização Renda Fixa  (Abertura)'
      end
    end
    object pnlDatas: TPanel
      Left = 1
      Top = 45
      Width = 421
      Height = 176
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label4: TLabel
        Left = 15
        Top = 4
        Width = 87
        Height = 13
        Caption = 'Data de Início '
      end
      object Label1: TLabel
        Left = 236
        Top = 6
        Width = 63
        Height = 13
        Caption = 'Data Final '
      end
      object lblEmissor: TLabel
        Left = 15
        Top = 86
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object Label5: TLabel
        Left = 15
        Top = 128
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblClasse: TLabel
        Left = 16
        Top = 47
        Width = 38
        Height = 13
        Caption = 'Classe'
      end
      object dtInicio: TCMDateTimePicker
        Left = 15
        Top = 20
        Width = 160
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
        OnExit = dtInicioExit
      end
      object dtFinal: TCMDateTimePicker
        Left = 235
        Top = 20
        Width = 160
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
      object dblkEmissor: TwwDBLookupCombo
        Left = 15
        Top = 100
        Width = 381
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'40'#9'Emissor'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkEmissorCloseUp
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 15
        Top = 142
        Width = 382
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Investimento - Data da Operação'#9'F'
          'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'#9'F'
          'PUOPERACAO'#9'15'#9'Preço'#9'F'
          'QTDEOPERACAO'#9'15'#9'Quantidade'#9'F'
          'VLROPERACAO'#9'15'#9'Valor'#9'F'
          'VENCOPERACAO'#9'12'#9'Vencimento'#9'F'
          'IDOPERRENFIXAPLIC'#9'10'#9'Ident. da Operação'#9'F'
          'IDINVESTIMENTO'#9'10'#9'Ident. do Investimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDOPERRENFIXAPLIC'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkClasseTit: TwwDBLookupCombo
        Left = 16
        Top = 61
        Width = 382
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Classe'#9'F')
        LookupTable = qryClasseTit
        LookupField = 'IDCLASSETIT'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkClasseTitCloseUp
      end
    end
    object pnlBarras: TPanel
      Left = 1
      Top = 221
      Width = 421
      Height = 180
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object pgcProcesso: TPageControl
        Left = 2
        Top = 2
        Width = 417
        Height = 176
        ActivePage = tbsProcesso
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object tbsProcesso: TTabSheet
          Caption = 'Processo'
          object lblInvestimento: TLabel
            Left = 10
            Top = 73
            Width = 366
            Height = 13
            AutoSize = False
            Color = clBtnFace
            ParentColor = False
            WordWrap = True
          end
          object Label2: TLabel
            Left = 10
            Top = 2
            Width = 98
            Height = 13
            Caption = 'Atualizando Dia: '
          end
          object Label3: TLabel
            Left = 10
            Top = 39
            Width = 127
            Height = 13
            Caption = 'Plano / Investimento: '
          end
          object lblInvProc: TLabel
            Left = 90
            Top = 96
            Width = 5
            Height = 13
          end
          object lblDia: TLabel
            Left = 112
            Top = 2
            Width = 105
            Height = 13
            AutoSize = False
          end
          object lblMensagem: TLabel
            Left = 10
            Top = 113
            Width = 366
            Height = 13
            AutoSize = False
            Color = clBtnFace
            ParentColor = False
            WordWrap = True
          end
          object lblPlanoPatro: TLabel
            Left = 10
            Top = 56
            Width = 366
            Height = 13
            AutoSize = False
            Color = clBtnFace
            ParentColor = False
            WordWrap = True
          end
          object prbDatas: TProgressBar
            Left = 10
            Top = 19
            Width = 367
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 0
          end
          object prbHistorico: TProgressBar
            Left = 10
            Top = 91
            Width = 367
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 1
          end
          object cbxDepurar: TCheckBox
            Left = 227
            Top = -1
            Width = 153
            Height = 17
            Caption = 'Depurar investimento ?'
            TabOrder = 2
            OnClick = cbxDepurarClick
          end
          object prbAguarde: TProgressBar
            Left = 10
            Top = 133
            Width = 367
            Height = 17
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 3
            Visible = False
          end
        end
        object tbsDepurar: TTabSheet
          Caption = 'Depurar'
          ImageIndex = 1
          object pnlDepurarDados: TPanel
            Left = 0
            Top = 0
            Width = 392
            Height = 22
            Align = alTop
            BevelInner = bvRaised
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
            Width = 392
            Height = 144
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object dbGrd: TwwDBGrid
              Left = 0
              Top = 0
              Width = 392
              Height = 144
              Selected.Strings = (
                'DESCCURVARENFIX'#9'40'#9'Perfil'#9'F'
                'DESCITEMRENFIX'#9'40'#9'Item'#9'F'
                'PUITEM'#9'10'#9'Valor'#9'F'
                'PUACUITEM'#9'10'#9'Valor Acumulado'#9'F'
                'NOMEREGRA'#9'40'#9'Regra Utilizada'#9'F'
                'SEQCALCULO'#9'10'#9'Seq. de Calculo'#9'F'
                'VLRITEM'#9'10'#9'Valor Contabilizado'#9'F'
                'VLRACUITEM'#9'10'#9'Valor Acumulado'#9'F'
                'SALDOVLRHISTRENFI'#9'10'#9'SALDOVLRHISTRENFI'#9'F'
                'TIPOITEM'#9'1'#9'TIPOITEM'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsHistRenFix
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
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 423
    inherited tb97Fundo: TToolbar97
      Left = 268
      DockPos = 526
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 167
        Width = 97
        Caption = '&Processa'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
          5555555555000757755555575500005007555570058880000075570870088078
          007555787887087777755550880FF0800007708080888F7088077088F0708F78
          88077000F0778080005555508F0008800755557878FF88777075570870080088
          0755557075888070755555575500075555555555557775555555}
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object bbtnCommita: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        Visible = False
        OnClick = bbtnCommitaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object lblTempo: TStaticText
      Left = 12
      Top = 10
      Width = 55
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'lblTempo'
      TabOrder = 2
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 3
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 13
  end
  object dsDMRqryBuscaSaldosItemsXCurvas: TwwDataSource
    DataSet = DMRendaFixa.qryBuscaSaldosItemsXCurvas
    Left = 316
    Top = 5
  end
  object dsDMRqryBuscaSaldosItems: TwwDataSource
    DataSet = DMRendaFixa.qryBuscaSaldosItems
    Left = 344
    Top = 6
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOINVEST=1 AND'
      '   IDTIPOOPERACAO = -2'
      ''
      ' ')
    ValidateWithMask = True
    Left = 84
    Top = 5
  end
  object qryProcuraAtualizacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HR.IDHISTRENFIX,HR.PLNCODIGO'
      'FROM'
      '   HISTRENFIX HR'
      'WHERE'
      '   (NATURMOVHISTRENFIX = '#39'D'#39') AND'
      '   (DATAHISTRENFIX = TO_DATE(:dDataProc,'#39'DD/MM/YYYY'#39'))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataProc'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaFluxos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   FX.IDINVESTIMENTO,FX.DATAFLUXO,FX.PERCFLUXO,FX.IDITEMRENFIX,F' +
        'X.IDCURVARENFIX,'
      '   IV.DESCINVESTIMENTO,IT.DESCITEMRENFIX,DataFluxoOriginal'
      'FROM'
      '   FLUXOINVESTRENFIX FX,'
      '   INVESTIMENTO IV,'
      '   ITEMRENFIX IT'
      'WHERE (FX.DATAFLUXO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      '  AND (FX.IDITEMRENFIX IN (29,30))'
      
        '  AND ((DECODE(:IDCLASSETIT,0,NULL,:IDCLASSETIT) IS NULL) OR (IV' +
        '.IDCLASSETIT = DECODE(:IDCLASSETIT,0,NULL,:IDCLASSETIT) ))'
      
        '  AND ((DECODE(:IDINVESTIMENTO,0,NULL,:IDINVESTIMENTO) IS NULL) ' +
        'OR (FX.IDINVESTIMENTO =DECODE(:IDINVESTIMENTO,0,NULL,:IDINVESTIM' +
        'ENTO)))'
      
        '  AND ( (DECODE(:IDEMISSOR,0,NULL,:IDEMISSOR) IS NULL) OR (IV.ID' +
        'EMISSOR=DECODE(:IDEMISSOR,0,NULL,:IDEMISSOR)))'
      '  AND (FX.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (FX.IDITEMRENFIX = IT.IDITEMRENFIX)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
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
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end>
  end
  object qryOperAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   O.IDOPERRENFIXAPLIC, O.DATAOPERACAO, PP.PLANPRVCONTABPATRO'
      'FROM'
      '   OPERRENFIX O,'
      '   HISTRENFIX H,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || P' +
        'L.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      ''
      'WHERE'
      '   (O.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (O.IDOPERRENFIX = O.IDOPERRENFIXAPLIC) AND'
      '   (O.VENCOPERACAO >= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '   (O.DATAOPERACAO < TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '   (H.DATAHISTRENFIX = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '   (H.IDTIPOOPERACAO = -2 ) AND'
      '   (H.IDINVESTIMENTO = O.IDINVESTIMENTO) AND'
      '   (H.IDOPERRENFIXAPLIC = O.IDOPERRENFIX) AND'
      '   (O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)) AND'
      '   (H.SALDOQTDHISTRENFI > 0 )'
      '')
    ValidateWithMask = True
    Left = 266
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object qryOperXFluxo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERRENFIX'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (IDTIPOOPERACAO = :IDTIPOOPERACAO) AND'
      '   (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) AND'
      '   (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 230
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT (IV.DESCINVESTIMENTO || '#39' - '#39' || OP.DATAOPERACAO) AS DESC' +
        'INVESTIMENTO,'
      
        '       OP.QTDEOPERACAO, OP.PUOPERACAO, OP.VLROPERACAO, OP.VENCOP' +
        'ERACAO,'
      '       OP.IDOPERRENFIXAPLIC, OP.IDINVESTIMENTO, IV.IDCLASSETIT,'
      '       PL.PLANPRVCONTABPATRO'
      'FROM  OPERRENFIX OP, PARAMINVEST PA,'
      '      (SELECT'
      '         PA.IDPLANPREVCTBPATR,'
      '         PA.IDPLANOPREV,'
      '         PA.IDPATRO,'
      '         (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '      FROM'
      '         PESSOA PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL PL'
      '      WHERE'
      '         (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '         (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL,'
      
        '      (SELECT IV1.IDINVESTIMENTO, IV1.DESCINVESTIMENTO, IV1.IDCL' +
        'ASSETIT'
      '       FROM INVESTIMENTO IV1'
      '       WHERE (IV1.IDTIPOINVEST = 1)'
      
        '         AND (((:IDEMISSOR IS NOT NULL) AND (IV1.IDEMISSOR = :ID' +
        'EMISSOR)) OR'
      '               (:IDEMISSOR IS NULL))'
      
        '         AND (((:IDCLASSETIT IS NOT NULL) AND (IV1.IDCLASSETIT =' +
        ' :IDCLASSETIT)) OR'
      '               (:IDCLASSETIT IS NULL))) IV'
      'WHERE (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      
        '  AND ((OP.VENCOPERACAO >= PA.DATAULTFECHRF) OR (OP.VENCOPERACAO' +
        ' IS NULL) OR (OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))' +
        ')'
      
        'ORDER BY IV.DESCINVESTIMENTO, OP.DATAOPERACAO, OP.IDOPERRENFIXAP' +
        'LIC'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 357
    Top = 183
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end>
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE EM.IDEMISSOR = IV.IDEMISSOR AND'
      '      IV.IDTIPOINVEST = 1'
      'ORDER BY SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 356
    Top = 141
  end
  object dsHistRenFix: TwwDataSource
    DataSet = qryHistRenfix
    Left = 102
    Top = 299
  end
  object qryHistRenfix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CR.DESCCURVARENFIX,'
      '   IT.DESCITEMRENFIX,'
      '   HI.PUITEM,HI.PUACUITEM,'
      '   HI.VLRITEM, HI.VLRACUITEM,'
      '   HR.SALDOVLRHISTRENFI,'
      '   RG.NOMEREGRA,'
      '   CI.SEQCALCULO,'
      '   IT.TIPOITEM,'
      '   HI.IDHISTRENFIX,HI.IDCURVARENFIX,HI.IDREGRACALCULO,'
      '   HI.IDITEMRENFIX'
      'FROM '
      '   HISTRENFIX HR,'
      '   HISTRENFIXXITENS HI,'
      '   REGRA RG,'
      '   ITEMRENFIX IT,'
      '   CURVASRENFIX CR,'
      '   CURVASXITEMRENFIX CI'
      'WHERE HR.IDHISTRENFIX = :IDHISTRENFIX'
      '  AND HI.IDHISTRENFIX = :IDHISTRENFIX'
      '  AND HI.IDCURVARENFIX = CR.IDCURVARENFIX'
      '  AND HI.IDITEMRENFIX = IT.IDITEMRENFIX'
      '  AND HI.IDREGRACALCULO = RG.IDREGRA(+)'
      '  AND HI.IDCURVARENFIX = CI.IDCURVARENFIX'
      '  AND HI.IDITEMRENFIX = CI.IDITEMRENFIX'
      'ORDER BY IDCURVARENFIX, SEQCALCULO'
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 299
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryClasseTit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDCLASSETIT,DESCCLASSETIT '
      'FROM '
      '   CLASSETITRENFIX'
      'ORDER BY DESCCLASSETIT  '
      ' ')
    ValidateWithMask = True
    Left = 358
    Top = 102
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 389
    Top = 5
  end
end
