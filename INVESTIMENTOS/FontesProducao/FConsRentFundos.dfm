inherited frmConsRentFundos: TfrmConsRentFundos
  Left = 24
  Top = 152
  HelpContext = 790513
  Caption = 'Consulta Rentabilidade dos Fundos'
  ClientHeight = 463
  ClientWidth = 936
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 503
    Top = 29
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  inherited pnlFundo: TPanel
    Width = 936
    Height = 424
    object Panel11: TPanel
      Left = 1
      Top = 48
      Width = 934
      Height = 25
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Rentabilidade dos Fundos'
      Color = clNavy
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnlTotal: TPanel
      Left = 1
      Top = 395
      Width = 934
      Height = 28
      Align = alBottom
      Enabled = False
      TabOrder = 0
      object Label5: TLabel
        Left = 540
        Top = 9
        Width = 41
        Height = 13
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object redtTotal: TRealEdit
        Left = 592
        Top = 4
        Width = 161
        Height = 21
        Alignment = taRightJustify
        Color = clBtnFace
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object dbGConsRentFundos: TwwDBGrid
      Left = 1
      Top = 73
      Width = 934
      Height = 322
      Hint = 'Clique com o botão direito para Fixar Colunas'
      Selected.Strings = (
        'BANCO'#9'23'#9'Banco'
        'FUNDO'#9'50'#9'Fundo'
        'CLASS'#9'10'#9'Categoria'
        'FIFFAQ'#9'9'#9'FIF / FAQ'
        'EXCLUSIVO'#9'7'#9'Exclusivo'
        'DATAAPLICACAO'#9'11'#9'Aplicação'
        'SALDOEM'#9'19'#9'Saldo na Data'
        'PATRIMONIO'#9'16'#9'Patrimônio'
        'PERPL'#9'11'#9'%  PL'
        'RENTAPLICA'#9'13'#9'Rent. Aplicação'
        'RENTANO'#9'12'#9'Rent. no Ano'
        'PERCDIANO'#9'13'#9'% Indice no Ano'
        'RENTMES'#9'10'#9'Rent. no Mês'
        'PERCDIMES'#9'13'#9'% Indice no Mês'
        'RENTDIA'#9'10'#9'Rent. Diária'
        'RESGATE'#9'7'#9'Resgate')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DmRelatoriosFundo.dsConsRentFundos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pmnuConsRentFundos
      ShowHint = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDrawDataCell = dbGConsRentFundosDrawDataCell
      IndicatorColor = icBlack
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 934
      Height = 47
      Align = alTop
      TabOrder = 3
      object Panel2: TPanel
        Left = 632
        Top = 3
        Width = 297
        Height = 42
        TabOrder = 0
        object lblPlanoPatro: TLabel
          Left = 27
          Top = 0
          Width = 126
          Height = 13
          Caption = 'Plano / Patrocinadora'
        end
        object dblPlanoPatro: TwwDBLookupCombo
          Left = 8
          Top = 14
          Width = 281
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
          LookupTable = qryPlanoPatro
          LookupField = 'IDPLANPREVCTBPATR'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
      object pnlConsulta: TPanel
        Left = 1
        Top = 3
        Width = 160
        Height = 42
        TabOrder = 1
        object Label2: TLabel
          Left = 26
          Top = 0
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object edData: TCMDateTimePicker
          Left = 26
          Top = 15
          Width = 110
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
          OnCloseUp = edDataCloseUp
          OnExit = edDataExit
        end
      end
      object PnlRegra: TPanel
        Left = 168
        Top = 3
        Width = 449
        Height = 42
        TabOrder = 2
        object Label1: TLabel
          Left = 18
          Top = 0
          Width = 167
          Height = 13
          Caption = 'Regra de Cálculo - Indexador'
        end
        object Label4: TLabel
          Left = 383
          Top = 0
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object dblkRegra: TwwDBLookupCombo
          Left = 21
          Top = 14
          Width = 356
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'30'#9'Nome da Regra'#9'F')
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loColLines, loRowLines, loTitles]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object spePercentual: TSpinEdit
          Left = 391
          Top = 14
          Width = 49
          Height = 22
          Hint = 'Percentual sobre a Moeda'
          MaxLength = 3
          MaxValue = 999
          MinValue = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 100
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 936
    inherited tb97Fundo: TToolbar97
      Left = 558
      DockPos = 558
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 304
      DockPos = 304
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
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
      object bt_Imprime: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
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
    Left = 881
    Top = 71
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 829
    Top = 173
  end
  object qryConsMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MO.MOEDESC, MO.MOECODIGO, TI.CODTRATAIND'
      'FROM MOEDA MO, TRATAINDICE TI'
      'WHERE MO.MOECODIGO = TI.MOECODIGO'
      'ORDER BY MOEDESC'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 821
    Top = 69
    object qryConsMoedaMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryConsMoedaCODTRATAIND: TStringField
      DisplayLabel = 'Tratamento'
      DisplayWidth = 5
      FieldName = 'CODTRATAIND'
      Origin = 'TRATAINDICE.CODTRATAIND'
      Size = 5
    end
    object qryConsMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object pmnuConsRentFundos: TPopupMenu
    OnPopup = pmnuConsRentFundosPopup
    Left = 880
    Top = 8
    object FixarColuna1: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = FixarColuna1Click
    end
    object LiberarColuna1: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = LiberarColuna1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LiberaTodasasColunas1: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = LiberaTodasasColunas1Click
    end
  end
  object QryVerSaldoFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '       (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                 ' +
        '        AND'
      
        '    (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST =:IDFUNDOI' +
        'NVEST)) OR'
      
        '      (:IDFUNDOINVEST IS NULL))                                 ' +
        '        AND'
      
        '       (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39')' +
        ')       AND'
      '       (IDTIPOINVEST      = :IDTIPOINVEST)'
      'GROUP BY IDFUNDOINVEST, DATAAPLICACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 823
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MAX(DATAULTFECH) AS DATAULTFECH FROM TIPOFUNDOINVEST WHER' +
        'E'
      '  (IDTIPOINVEST      = :IDTIPOINVEST)                      AND'
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )'
      ' ')
    ValidateWithMask = True
    Left = 153
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG'
      'WHERE RG.IDTIPOREGRA =  :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 491
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 30
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, IDPLANOPREV, IDPAT' +
        'RO'
      'FROM VWPLANPREVCTBPATR'
      ''
      '')
    ValidateWithMask = True
    Left = 822
    Top = 17
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object regRentabilidade: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 892
    Top = 147
  end
end
