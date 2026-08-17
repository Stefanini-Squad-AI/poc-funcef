inherited frmConsSaldoOpcInd: TfrmConsSaldoOpcInd
  Left = 299
  Top = 283
  HelpContext = 790556
  Caption = 'Consulta'
  ClientHeight = 528
  ClientWidth = 788
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    Height = 489
    inherited bvlSepTit: TBevel
      Width = 786
    end
    object Splitter1: TSplitter [1]
      Left = 1
      Top = 255
      Width = 786
      Height = 3
      Cursor = crVSplit
      Align = alTop
      AutoSnap = False
      Beveled = True
    end
    inherited pnlTitulo: TPanel
      Width = 786
      inherited lbNomDescricao: TfcLabel
        Width = 293
        Caption = 'Saldos de Opções de Índices'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 786
      Height = 50
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 17
        Top = 6
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object Label3: TLabel
        Left = 403
        Top = 6
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label2: TLabel
        Left = 139
        Top = 6
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object dtDataRef: TCMDateTimePicker
        Left = 17
        Top = 22
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
        OnChange = dtDataRefChange
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 403
        Top = 22
        Width = 262
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Investimento'#9'F'
          'TIPO'#9'15'#9'Tipo'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblInvestimentoCloseUp
      end
      object chkExpandido: TCheckBox
        Left = 683
        Top = 23
        Width = 83
        Height = 17
        Caption = 'Expandido'
        TabOrder = 3
      end
      object dblPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 139
        Top = 22
        Width = 254
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblPlanPrevCtbPatrChange
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 95
      Width = 786
      Height = 160
      Align = alTop
      TabOrder = 2
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 784
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Saldos'
        Color = clNavy
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgHistorico: TwwDBGrid
        Left = 1
        Top = 26
        Width = 784
        Height = 133
        Selected.Strings = (
          'DATAHISTOPCIND'#9'11'#9'Data do Saldo'
          'DESCINVESTIMENTO'#9'38'#9'Investimento'
          'IDBOLETA'#9'10'#9'Boleta'
          'IDLOTE'#9'5'#9'Lote'
          'SLDQTDHISTOPCIND'#9'18'#9'Saldo Quantidade'
          'SLDVLRHISTOPCIND'#9'19'#9'Saldo Valor'
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'
          'DESCCARTINVEST'#9'30'#9'Carteira de Investimenot')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelOpcIndSaldo.dsHistOpcInd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 258
      Width = 786
      Height = 230
      Align = alClient
      TabOrder = 3
      object dbgItens: TwwDBGrid
        Left = 1
        Top = 26
        Width = 784
        Height = 203
        Selected.Strings = (
          'DESITEMOPCIND'#9'32'#9'Item'
          'NOMEREGRA'#9'34'#9'Regra'
          'VLRHISTOPCIND'#9'19'#9'Valor do Item'
          'SLDHISTOPCIND'#9'18'#9'Saldo do Item')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelOpcIndSaldo.dsItenOpcInd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 784
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Itens dos Saldos'
        Color = clNavy
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 489
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 616
      DockPos = 734
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 363
      DockPos = 481
      inherited ToolbarSep971: TToolbarSep97
        Left = 165
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 595
    Top = 3
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 353
    Top = 63
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IDINVESTIMENTO, I.DESCINVESTIMENTO, '
      
        '       DECODE(STAOPCCOMPRA,'#39'S'#39','#39'OPÇÃO DE COMPRA'#39', '#39'OPÇÃO DE VEND' +
        'A'#39') AS TIPO'
      'FROM INVESTIMENTO I, OPCOES O,'
      
        '     (SELECT DISTINCT IDINVESTIMENTO FROM ORDEMOPCIND ORDER BY I' +
        'DINVESTIMENTO) IV'
      'WHERE I.IDTIPOINVEST = 2'
      '  AND I.STAOPCAO = '#39'S'#39
      '  AND I.FLGATIVO = '#39'S'#39
      '  AND I.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND I.IDINVESTIMENTO = O.IDINVESTIMENTO'
      ''
      'ORDER BY I.DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 625
    Top = 63
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 50
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 15
      FieldName = 'TIPO'
      Size = 15
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
end
