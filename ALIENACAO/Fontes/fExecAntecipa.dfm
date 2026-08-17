inherited frmExecAntecipa: TfrmExecAntecipa
  Left = 248
  Top = 105
  HelpContext = 1350013
  Caption = 'Antecipação de Parcelas'
  ClientHeight = 392
  ClientWidth = 647
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 647
    Height = 359
    object lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 647
      Height = 24
      Align = alTop
      Caption = 'Antecipação de Parcelas [ Seleção ]'
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
    object ntbAntecipa: TNotebook
      Left = 0
      Top = 24
      Width = 647
      Height = 335
      Align = alClient
      TabOrder = 0
      OnPageChanged = ntbAntecipaPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object GroupBox1: TGroupBox
          Left = 417
          Top = 240
          Width = 177
          Height = 50
          Caption = 'Nova Data de Vencimento'
          TabOrder = 3
          object cmDtVencto: TCMDateTimePicker
            Left = 32
            Top = 20
            Width = 113
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
        end
        object gbContrato: TGroupBox
          Left = 24
          Top = 9
          Width = 570
          Height = 162
          Caption = 'Contrato'
          TabOrder = 0
          object Label3: TLabel
            Left = 14
            Top = 57
            Width = 61
            Height = 13
            Caption = 'Comprador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 14
            Top = 105
            Width = 139
            Height = 13
            Caption = 'Condição de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtComprador: TEdit
            Left = 14
            Top = 73
            Width = 499
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 1
          end
          object dblcbCondPag: TCMDBLookupCombo
            Left = 14
            Top = 121
            Width = 499
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DSCCOND'#9'10'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
            LookupTable = qryCondPag
            LookupField = 'IDCONDPAGIMOVEL'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          inline molProposta1: TmolProposta
            Left = 7
            Top = 14
            Width = 554
            inherited Label1: TLabel
              Width = 44
              Caption = 'Número'
            end
            inherited Label2: TLabel
              Width = 58
              Caption = 'Descrição'
            end
            inherited btnBuscaProp: TBitBtn
              OnClick = molProposta1btnBuscaPropClick
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 23
          Top = 184
          Width = 370
          Height = 106
          Caption = 'Tipo de Parcela'
          TabOrder = 1
          object cbGerada: TCheckBox
            Left = 17
            Top = 46
            Width = 121
            Height = 16
            Caption = 'Parcela Gerada'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbSinal: TCheckBox
            Left = 17
            Top = 22
            Width = 121
            Height = 16
            Caption = 'Sinal'
            TabOrder = 0
          end
          object cbAmort: TCheckBox
            Left = 193
            Top = 18
            Width = 121
            Height = 20
            Caption = 'Amortização Extra'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object cbVista: TCheckBox
            Left = 193
            Top = 42
            Width = 136
            Height = 20
            Caption = 'Pagamento a Vista'
            TabOrder = 4
          end
          object cbProj: TCheckBox
            Left = 17
            Top = 71
            Width = 121
            Height = 16
            Caption = 'Parcela Projetada'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 416
          Top = 184
          Width = 177
          Height = 50
          Caption = 'Nr. de Parcelas a Antecipar'
          TabOrder = 2
          object DBSpnQtde: TwwDBSpinEdit
            Left = 68
            Top = 21
            Width = 75
            Height = 21
            Increment = 1
            Value = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Parcelas'
        object Panel4: TPanel
          Left = 48
          Top = 8
          Width = 545
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas Restantes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdParc: TwwDBGrid
          Left = 48
          Top = 35
          Width = 545
          Height = 242
          Selected.Strings = (
            'CHKANTECIPA'#9'5'#9#9'F'
            'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'T'
            'NUMPARCELA'#9'10'#9'Parcela'#9'T'
            'DESCPARCELA'#9'35'#9'Tipo Parcela'#9'T'
            'VLRPRESTACAO'#9'18'#9'Valor da Parcela'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsParc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = grdParcCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = grdParcTopRowChanged
        end
        object Panel1: TPanel
          Left = 0
          Top = 287
          Width = 645
          Height = 46
          Align = alBottom
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 359
    Width = 647
    inherited tb97Fundo: TToolbar97
      Left = 230
      DockPos = 320
      inherited sep1: TToolbarSep97
        Left = 328
      end
      inherited ToolbarSep971: TToolbarSep97
        Left = 245
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 411
      end
      object ToolbarSep974: TToolbarSep97 [3]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 247
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 330
      end
      object btnContinuar: TfcShapeBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Continuar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
          BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
          BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
          BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        ShowHint = True
        TabOrder = 2
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnContinuarClick
      end
      object btnVoltar: TfcShapeBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Voltar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
          BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
          BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        ShowHint = True
        TabOrder = 3
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnVoltarClick
      end
      object btnConfirmar: TfcShapeBtn
        Left = 164
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Confirmar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        ShowHint = True
        TabOrder = 4
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnConfirmarClick
      end
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       CP.FLGREAJMENSAL,'
      '       CP.FORMACALCULO,'
      '       CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMP' +
        'ARCELAS,'#39'999'#39')),'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMPA' +
        'RCELAS,'#39'999'#39')) )  AS DSCCOND'
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN('#39'P'#39','#39'R'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      'ORDER BY DSCCOND'
      '')
    ValidateWithMask = True
    Left = 386
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
    end
    object qryCondPagDSCCOND: TStringField
      FieldName = 'DSCCOND'
      Size = 34
    end
    object qryCondPagFLGREAJMENSAL: TStringField
      FieldName = 'FLGREAJMENSAL'
      FixedChar = True
      Size = 1
    end
    object qryCondPagFORMACALCULO: TFloatField
      FieldName = 'FORMACALCULO'
    end
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (0) CHKANTECIPA,'
      '     '#39'                              '#39' AS DESCPARCELA,'
      '     P.IDCONDPAGIMOVEL,  P.IDPARCFINANCIMOV,'
      '     P.NUMPARCELA,'
      ''
      '     DECODE(NVL(P.FLGVERIFATRASO,'#39'N'#39'),'#39'N'#39','
      
        '            DECODE(P.FLGTIPOLANC,9,P.VLRAMORTIZACAO,P.VLRPRESTAC' +
        'AO),'
      
        '            DECODE(P.FLGTIPOLANC,9,(P.VLRAMORTIZACAO+P.VLRRESIDU' +
        'O),(P.VLRPRESTACAO+P.VLRRESIDUO)) ) AS VLRPRESTACAO,'
      ''
      '     P.DATAVENCIMENTO,   P.FLGTIPOLANC,'
      '     P.CODDOCUMENTO,     P.PLNCODIGO,'
      '     P.FLGLANCINTEGRA,   P.DATALANCINTEGRA,'
      '     P.DATAPAGAMENTO,'
      
        '     DECODE(NVL(C.FLGREAJMENSAL,'#39'N'#39'),'#39'N'#39',P.VLRJUROS,0)  AS VLR_D' +
        'ESCONTO,'
      ''
      '     DECODE(NVL(C.FLGREAJMENSAL,'#39'N'#39'),'#39'N'#39',P.VLRAMORTIZACAO,'
      
        '            DECODE(P.FLGTIPOLANC,9,P.VLRAMORTIZACAO,P.VLRPRESTAC' +
        'AO)) AS VLR_PARCANTECIPADA'
      ''
      'FROM'
      '     PARCFINANCIMOV P, CONDPAGIMOVEL C'
      'WHERE'
      '       (P.IDCONDPAGIMOVEL = C.IDCONDINICIAL)'
      '   AND (P.FLGTIPOLANC IN(2,3,4,5,7,8))'
      '--   AND (P.DATAPAGAMENTO IS NULL)'
      '--   AND (P.DATAVENCIMENTO > SYSDATE)'
      '   AND P.DATAVENCIMENTO BETWEEN C.DATAINI AND C.DATAFIM'
      '   AND C.IDCONDINICIAL IS NOT NULL'
      '   AND ( P.DATAVENCIMENTO  > TO_DATE(:PDTLIMITE,'#39'DD/MM/YYYY'#39') )'
      
        '   AND ((:pIDCONDPAGIMOVEL  IS NULL) OR (P.IDCONDPAGIMOVEL  = :p' +
        'IDCONDPAGIMOVEL))'
      '   AND (   ((:pSINAL = '#39'S'#39') AND (P.FLGTIPOLANC = 2))'
      '        OR ((:pGERA  = '#39'S'#39') AND (P.FLGTIPOLANC = 3))'
      '        OR ((:pPROJ  = '#39'S'#39') AND (P.FLGTIPOLANC = 4))'
      '        OR ((:pAMORT = '#39'S'#39') AND (P.FLGTIPOLANC = 5))'
      '        OR ((:pVISTA = '#39'S'#39') AND (P.FLGTIPOLANC = 7)) )'
      ''
      'ORDER BY P.DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdParc
    ControlType.Strings = (
      'CHKANTECIPA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 544
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PDTLIMITE'
        ParamType = ptUnknown
        Value = '01/01/2000'
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSINAL'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pGERA'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pPROJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pAMORT'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pVISTA'
        ParamType = ptUnknown
        Value = 'S'
      end>
    object qryParcDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 13
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcCHKANTECIPA: TFloatField
      DisplayWidth = 10
      FieldName = 'CHKANTECIPA'
    end
    object qryParcNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 6
      FieldName = 'NUMPARCELA'
      Visible = False
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcDESCPARCELA: TStringField
      DisplayLabel = 'Tipo Parcela'
      FieldName = 'DESCPARCELA'
      FixedChar = True
      Size = 30
    end
    object qryParcVLR_DESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLR_PARCANTECIPADA: TFloatField
      DisplayLabel = 'Novo Valor'
      FieldName = 'VLR_PARCANTECIPADA'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryParcDATALANCINTEGRA: TDateTimeField
      FieldName = 'DATALANCINTEGRA'
    end
    object qryParcDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 544
    Top = 96
  end
  object UpdParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  VLRJUROS = :VLRJUROS,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  FLGTIPOLANC = :FLGTIPOLANC'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      '')
    Left = 544
    Top = 81
  end
end
