inherited frmCadAutOrdemMovBmf: TfrmCadAutOrdemMovBmf
  Left = 1
  Top = 1
  Caption = 'Autorização de Ordem de Movimentação de BM&F'
  ClientHeight = 532
  ClientWidth = 953
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 953
    Height = 446
    object Panel4: TPanel
      Left = 1
      Top = 405
      Width = 951
      Height = 40
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object lblQtdOperada: TLabel
        Left = 406
        Top = 2
        Width = 84
        Height = 13
        Caption = 'Qtde. Operada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPosPrevista: TLabel
        Left = 542
        Top = 2
        Width = 96
        Height = 13
        Caption = 'Posição Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPosicaoTotal: TLabel
        Left = 269
        Top = 2
        Width = 94
        Height = 13
        Caption = 'Posição Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPosicaoTotalCV: TLabel
        Left = 391
        Top = 18
        Width = 11
        Height = 16
        Caption = 'C'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblPosPrevistaCV: TLabel
        Left = 664
        Top = 18
        Width = 11
        Height = 16
        Caption = 'C'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblQtdOperadaCV: TLabel
        Left = 527
        Top = 18
        Width = 11
        Height = 16
        Caption = 'C'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 141
        Top = 2
        Width = 96
        Height = 13
        Caption = 'PU Médio Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 706
        Top = 6
        Width = 80
        Height = 13
        Caption = 'C = Comprado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 706
        Top = 22
        Width = 70
        Height = 13
        Caption = 'V = Vendido'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 13
        Top = 2
        Width = 102
        Height = 13
        Caption = 'PU Médio Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rQtdOperada: TRealEdit
        Left = 406
        Top = 16
        Width = 119
        Height = 19
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 18
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object rQtdPrevista: TRealEdit
        Left = 542
        Top = 16
        Width = 119
        Height = 19
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 18
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object rQtdAtualTotal: TRealEdit
        Left = 270
        Top = 16
        Width = 119
        Height = 19
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 18
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object rPUMedioV: TRealEdit
        Left = 142
        Top = 16
        Width = 119
        Height = 19
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 3
        WordWrap = False
        IntDigits = 18
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object rPUMedioC: TRealEdit
        Left = 14
        Top = 16
        Width = 119
        Height = 19
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 4
        WordWrap = False
        IntDigits = 18
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 951
      Height = 116
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object lblDtaOperacao: TLabel
        Left = 10
        Top = 14
        Width = 105
        Height = 13
        Caption = 'Data de Operação'
      end
      object lblTpOper: TLabel
        Left = 10
        Top = 40
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
      end
      object lblTpContrato: TLabel
        Left = 10
        Top = 66
        Width = 78
        Height = 13
        Caption = 'Tipo Contrato'
      end
      object lblSerie: TLabel
        Left = 10
        Top = 92
        Width = 30
        Height = 13
        Caption = 'Série'
      end
      object lblCarteira: TLabel
        Left = 386
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblCorretora: TLabel
        Left = 386
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Corretora'
      end
      object lblLote: TLabel
        Left = 386
        Top = 92
        Width = 65
        Height = 13
        Caption = 'Documento'
      end
      object Label1: TLabel
        Left = 386
        Top = 66
        Width = 65
        Height = 13
        Caption = 'Autorizador'
      end
      object dblSerie: TwwDBLookupCombo
        Left = 125
        Top = 88
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'SÉRIE')
        LookupTable = QryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblSerieCloseUp
        OnExit = dblSerieExit
      end
      object dblTipoContrato: TwwDBLookupCombo
        Left = 125
        Top = 62
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCTINVEST'#9'60'#9'CONTRATO'#9'No')
        LookupTable = QryTipoContrInvest
        LookupField = 'IDTIPOCONTRINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblTipoContratoChange
        OnCloseUp = dblTipoContratoCloseUp
        OnExit = dblTipoContratoExit
      end
      object dblOperacao: TwwDBLookupCombo
        Left = 125
        Top = 36
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'OPERACÃO')
        LookupTable = QryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblOperacaoCloseUp
        OnExit = dblOperacaoExit
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 125
        Top = 10
        Width = 121
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
        OnCloseUp = dbDtaOperacaoExit
        OnExit = dbDtaOperacaoExit
      end
      object dbeNumDoc: TDBEdit
        Left = 460
        Top = 88
        Width = 153
        Height = 21
        DataField = 'NUMDOCMOVINV'
        DataSource = DsDetalhe
        TabOrder = 7
      end
      object dblCorretora: TwwDBLookupCombo
        Left = 460
        Top = 36
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCORRETVALORES'#9'10'#9'CORRETORA')
        LookupTable = QryCorretValores
        LookupField = 'IDCORRETVALORES'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblCorretoraCloseUp
        OnExit = dblCorretoraExit
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 460
        Top = 10
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'CARTEIRA')
        LookupTable = QryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblCarteiraChange
        OnCloseUp = dblCarteiraCloseUp
        OnExit = dblCarteiraExit
      end
      object dblAutorizador: TwwDBLookupCombo
        Left = 460
        Top = 62
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEUSUARIO'#9'20'#9'Autorizador'#9'F')
        LookupTable = QryAutorizador
        LookupField = 'IDUSUARIO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblCorretoraCloseUp
        OnExit = dblCorretoraExit
      end
      object dbeLote: TDBEdit
        Left = 620
        Top = 88
        Width = 153
        Height = 21
        DataField = 'IDLOTE'
        DataSource = DsDetalhe
        Enabled = False
        TabOrder = 8
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 117
      Width = 951
      Height = 288
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 949
        Height = 286
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Informações Contábeis '
          TabVisible = False
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 941
            Height = 276
            Align = alClient
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 1
              Width = 939
              Height = 64
              Align = alTop
              TabOrder = 0
              object Panel1: TPanel
                Left = 1
                Top = 41
                Width = 937
                Height = 22
                Align = alClient
                BevelInner = bvLowered
                Caption = 'Movimentação'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbgSelecao: TDBGrid
                Left = 1
                Top = 1
                Width = 937
                Height = 40
                Align = alTop
                Color = clInfoBk
                DataSource = DsDetalhe
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clGray
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SIGLATIPOOPER'
                    Title.Caption = 'Operação'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -9
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCTIPOCTINVEST'
                    Title.Alignment = taCenter
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -9
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 156
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCINVESTIMENTO'
                    Title.Alignment = taCenter
                    Title.Caption = 'Série'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -9
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 167
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SGLCORRETVALORES'
                    Title.Caption = 'Corretora'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -9
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 196
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCCARTINVEST'
                    Title.Alignment = taCenter
                    Title.Caption = 'Carteira'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -9
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 316
                    Visible = True
                  end>
              end
            end
            object Panel6: TPanel
              Left = 1
              Top = 65
              Width = 939
              Height = 210
              Align = alClient
              TabOrder = 1
              object dbgOperacao: TwwDBGrid
                Left = 1
                Top = 1
                Width = 937
                Height = 208
                Selected.Strings = (
                  'HORAMOV'#9'5'#9'Hora'#9'F'
                  'STACONFIRMA'#9'6'#9'Confirma'#9'F'
                  'STAAUTORIZA'#9'6'#9'Autoriza'#9'F'
                  'QTDEORDENADA'#9'16'#9'Quantidade'#9'F'
                  'PUORDMOVINV'#9'20'#9'Preço'#9'F'
                  'VALOR'#9'17'#9'Valor Negociado'#9'F'
                  
                    'OBSAUTMOV'#9'200'#9'Observação                                        ' +
                    '                                                                ' +
                    '                                                                ' +
                    '                                                                ' +
                    '                          '#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 2
                ShowHorzScrollBar = True
                Align = alClient
                Color = clWhite
                DataSource = DsDetalhe
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 0
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnEnter = dbgOperacaoEnter
                IndicatorColor = icYellow
              end
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 953
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 493
    Width = 953
    inherited tb97Fundo: TToolbar97
      inherited sep1: TToolbarSep97
        Left = 497
      end
      inherited sep3: TToolbarSep97
        Left = 246
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 413
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 329
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep974: TToolbarSep97 [4]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep975: TToolbarSep97 [5]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 332
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 416
      end
      object btnNenhuma: TBitBtn
        Left = 166
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Nenhuma'
        ModalResult = 8
        TabOrder = 2
        OnClick = btnNenhumaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        Spacing = 2
      end
      object BtnInverte: TBitBtn
        Left = 83
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Inverte'
        ModalResult = 8
        TabOrder = 3
        OnClick = BtnInverteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
          CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
          FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
          CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
          000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
          FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
          99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
          9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnTodas: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Todas'
        TabOrder = 4
        OnClick = btnTodasClick
        Kind = bkAll
        Spacing = 2
      end
      object BtAutConfirma: TBitBtn
        Left = 249
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Confirma'
        Enabled = False
        ModalResult = 8
        TabOrder = 5
        OnClick = BtAutConfirmaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 560
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 331
    Top = 6
  end
  inherited upd: TUpdateSQL
    DeleteSQL.Strings = (
      '')
    Left = 371
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TRUNC(ORDMOVINV.DATAORDMOVINV)'
      'TIPOOPERACAO.DESCTIPOOPERACAO '
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'CORRETVALORES.SGLCORRETVALORES'
      'ORDMOVINV.IDLOTE')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data Operação'
      'Operação'
      'Contrato'
      'Série'
      'Carteira'
      'Corretora'
      'Lote')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDMOVINV'
      'CARTEIRAINVEST'
      'CORRETVALORES'
      'INVESTIMENTO'
      'TIPOOPERACAO'
      'TIPOCONTRINVEST'
      'BOLSAVALORES'
      'SERIESBMF')
    CamposChave.Strings = (
      'TRUNC(ORDMOVINV.DATAORDMOVINV)'
      'ORDMOVINV.IDCARTEIRAINVEST'
      'ORDMOVINV.IDCORRETVALORES'
      'ORDMOVINV.IDTIPOOPERACAO'
      'ORDMOVINV.IDINVESTIMENTO'
      'ORDMOVINV.IDBOLSAVALORES '
      'TIPOCONTRINVEST.IDTIPOCONTRINVEST'
      'ORDMOVINV.IDCARTEIRAGERENC')
    Filtro.Strings = (
      
        '(ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVEST(+)' +
        ')'
      '(ORDMOVINV.IDCORRETVALORES  = CORRETVALORES.IDCORRETVALORES(+))'
      '(ORDMOVINV.IDINVESTIMENTO   = INVESTIMENTO.IDINVESTIMENTO(+))'
      '(ORDMOVINV.IDTIPOOPERACAO   = TIPOOPERACAO.IDTIPOOPERACAO(+))'
      '(ORDMOVINV.IDBOLSAVALORES   = BOLSAVALORES.IDBOLSAVALORES(+))'
      '(ORDMOVINV.IDINVESTIMENTO = SERIESBMF.IDINVESTIMENTO(+))'
      
        '(TIPOCONTRINVEST.IDTIPOCONTRINVEST = SERIESBMF.IDTIPOCONTRINVEST' +
        ')')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '20'
      '40'
      '20'
      '40'
      '20'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 453
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 417
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 518
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIP' +
        'OINVEST,'
      #9'IDTIPOOPERACAO, DATAOPERACAO, NUMDOCUMENTO,'
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      
        #9'MOECODIGO, IDCARTORIDEST, IDLOTE, IDMODULO, IDINVESTDEST,IDORDM' +
        'OVINV,'
      
        '               IDINSTFIN,DATAVENCOPER,IDCUSTORIG, IDCUSTDEST,VLR' +
        'IR'
      ''
      'FROM CM.OPERACAOINVEST'
      ''
      'WHERE IDOPERACAOINVEST = -1'
      '')
    Left = 290
    Top = 6
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object qryIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
      Origin = 'OPERACAOINVEST.IDINSTFIN'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object qryNUMDOCUMENTO2: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object qryQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object qryPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
    end
    object qryDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'OPERACAOINVEST.DATAVENCOPER'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'OPERACAOINVEST.EMPRESAPROP'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OPERACAOINVEST.IDFORCLI'
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'OPERACAOINVEST.IDCORRETVALORES'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'OPERACAOINVEST.MOECODIGO'
    end
    object qryIDCARTORIDEST: TFloatField
      FieldName = 'IDCARTORIDEST'
      Origin = 'OPERACAOINVEST.IDCARTORIDEST'
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'OPERACAOINVEST.IDLOTE'
      Size = 10
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'OPERACAOINVEST.IDMODULO'
    end
    object qryIDINVESTDEST: TFloatField
      FieldName = 'IDINVESTDEST'
      Origin = 'OPERACAOINVEST.IDINVESTDEST'
    end
    object qryIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
      Origin = 'OPERACAOINVEST.IDORDMOVINV'
    end
    object qryIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
      Origin = 'OPERACAOINVEST.IDCUSTORIG'
    end
    object qryIDCUSTDEST: TFloatField
      FieldName = 'IDCUSTDEST'
      Origin = 'OPERACAOINVEST.IDCUSTDEST'
    end
    object qryVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'OPERACAOINVEST.VLRIR'
    end
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCARTEIRAINVEST,'
      '     0 AS IDCARTEIRAGERENC,'
      '     DESCCARTINVEST'
      'FROM'
      '     CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 8'
      'ORDER BY DESCCARTINVEST ')
    ValidateWithMask = True
    Left = 68
    Top = 320
    object QryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'CARTEIRA'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCORRETVALORES,'
      '     SGLCORRETVALORES'
      'FROM'
      '     CORRETVALORES'
      'WHERE'
      '     FLGATIVABMF='#39'S'#39
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 69
    Top = 224
    object QryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'CORRETORA'
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IV.IDINVESTIMENTO,'
      '      IV.DESCINVESTIMENTO,'
      '      IV.IDTIPOINVEST,'
      '      IV.IDEMISSOR'
      'FROM '
      '      INVESTIMENTO IV,'
      '      SERIESBMF SB'
      'WHERE '
      '      (IV.IDTIPOINVEST = 8) AND'
      '      (IV.IDINVESTIMENTO = SB.IDINVESTIMENTO) AND'
      '      ('
      '       (TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39') IS NULL) OR'
      '       (SB.DATAVENCIMENTO >= TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39'))'
      '      )'
      'ORDER BY '
      '      DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptUnknown
      end>
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'SÉRIE'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
  end
  object QryTipoContrInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IDTIPOCONTRINVEST,'
      '      DESCTIPOCTINVEST'
      'FROM '
      '      TIPOCONTRINVEST'
      'WHERE '
      '      IDTIPOINVEST = 8'
      'ORDER BY '
      '      DESCTIPOCTINVEST')
    ValidateWithMask = True
    Left = 160
    Top = 280
    object QryTipoContrInvestDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'CONTRATO'
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
    object QryTipoContrInvestIDTIPOCONTRINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDTIPOCONTRINVEST'
      Visible = False
    end
  end
  object QryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9
      '      MOECODIGO'
      'FROM '
      'PARAMINVEST')
    ValidateWithMask = True
    Left = 156
    Top = 328
    object QryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'PARAMINVEST.MOECODIGO'
    end
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM CM.TIPOOPERACAO'
      'WHERE'
      '     (IDTIPOINVEST = 8)'
      
        '     AND ((IDTIPOOPERACAO > 0)  OR (IDTIPOOPERACAO IN(-102,-103)' +
        '))'
      
        '     AND ((:pIdTipoOperacao IS NULL) OR (IDTIPOOPERACAO = :pIdTi' +
        'poOperacao))'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 65
    Top = 283
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTipoOperacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdTipoOperacao'
        ParamType = ptUnknown
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'OPERACÃO'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDMOVINV'
      'set'
      '  IDORDMOVINV = :IDORDMOVINV,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  PUORDMOVINV = :PUORDMOVINV,'
      '  DATAORDMOVINV = :DATAORDMOVINV,'
      '  QTDEORDMOVINV = :QTDEORDMOVINV,'
      '  NUMDOCMOVINV = :NUMDOCMOVINV,'
      '  STATMOVINV = :STATMOVINV,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDAUTORIZACAO = :IDAUTORIZACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDLOTE = :IDLOTE,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  QTDEORDENADA = :QTDEORDENADA,'
      '  DATAAUTORIZACAO = :DATAAUTORIZACAO,'
      '  OBSAUTMOV = :OBSAUTMOV,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  STAAUTORIZA = :STAAUTORIZA'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into ORDMOVINV'
      '  (IDORDMOVINV, IDCORRETVALORES, IDINVESTIMENTO, PUORDMOVINV, '
      '   DATAORDMOVINV, QTDEORDMOVINV, NUMDOCMOVINV, STATMOVINV, '
      'IDUSUARIO, IDAUTORIZACAO, '
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDCARTEIRAINVEST, IDLOTE, '
      'IDBOLSAVALORES, '
      '   IDCUSTODIANTE, QTDEORDENADA, DATAAUTORIZACAO, OBSAUTMOV, '
      'IDPLANPREVCTBPATR,IDCARTEIRAGERENC)'
      'values'
      
        '  (:IDORDMOVINV, :IDCORRETVALORES, :IDINVESTIMENTO, :PUORDMOVINV' +
        ', '
      '   :DATAORDMOVINV, :QTDEORDMOVINV, :NUMDOCMOVINV, :STATMOVINV, '
      ':IDUSUARIO, '
      
        '   :IDAUTORIZACAO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDCARTEIRAIN' +
        'VEST, '
      ':IDLOTE, '
      '   :IDBOLSAVALORES, :IDCUSTODIANTE, :QTDEORDENADA, '
      ':DATAAUTORIZACAO,:OBSAUTMOV,:IDPLANPREVCTBPATR, '
      ':IDCARTEIRAGERENC)'
      ' ')
    DeleteSQL.Strings = (
      'delete from ORDMOVINV'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    Left = 338
    Top = 288
  end
  object QryDetalhe: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ORDMOVINV.IDORDMOVINV ,'
      '  ORDMOVINV.IDCORRETVALORES,'
      '  ORDMOVINV.IDINVESTIMENTO,'
      '  ORDMOVINV.PUORDMOVINV,'
      '  ORDMOVINV.DATAORDMOVINV,'
      '  ORDMOVINV.QTDEORDMOVINV,'
      '  ORDMOVINV.NUMDOCMOVINV,'
      '  ORDMOVINV.STATMOVINV,'
      '  ORDMOVINV.IDUSUARIO,'
      '  ORDMOVINV.IDAUTORIZACAO,'
      '  ORDMOVINV.IDTIPOINVEST,'
      '  ORDMOVINV.IDTIPOOPERACAO,'
      '  ORDMOVINV.IDCARTEIRAINVEST,'
      '  ORDMOVINV.IDLOTE,'
      '  ORDMOVINV.IDBOLSAVALORES,'
      '  ORDMOVINV.IDCUSTODIANTE,'
      '  ORDMOVINV.QTDEORDENADA,'
      '  ORDMOVINV.DATAAUTORIZACAO,'
      '  ORDMOVINV.OBSAUTMOV,'
      '  ORDMOVINV.OBSMOVINV,'
      '  ORDMOVINV.IDPLANPREVCTBPATR,'
      '  ORDMOVINV.IDCARTEIRAGERENC,'
      '  '#39'00:00'#39' AS HORAMOV,'
      '  0 AS VALOR,'
      '  ORDMOVINV.STACONFIRMA,'
      '  ORDMOVINV.STAAUTORIZA,'
      '  CARTEIRAINVEST.DESCCARTINVEST,'
      
        '  CORRETVALORES.SGLCORRETVALORES,                               ' +
        ' '
      '  TIPOOPERACAO.DESCTIPOOPERACAO,'
      
        '  TIPOOPERACAO.SIGLATIPOOPER,                                   ' +
        ' '
      
        '  TIPOOPERACAO.NATUREZAOPERACAO,                                ' +
        ' '
      
        '  INVESTIMENTO.DESCINVESTIMENTO,                                ' +
        ' '
      
        '  BOLSAVALORES.SGLBOLSAVALORES,                                 ' +
        ' '
      
        '  TIPOCONTRINVEST.DESCTIPOCTINVEST,                             ' +
        ' '
      
        '  TIPOCONTRINVEST.IDTIPOCONTRINVEST                             ' +
        ' '
      'FROM'
      
        '  ORDMOVINV, CARTEIRAINVEST, CORRETVALORES, INVESTIMENTO, BOLSAV' +
        'ALORES, TIPOOPERACAO,TIPOCONTRINVEST,SERIESBMF,'
      '  CARTEIRAGERENC'
      'WHERE'
      
        '(ORDMOVINV.DATAORDMOVINV LIKE TO_DATE(:DATAORDMOVINV,'#39'DD/MM/YYYY' +
        #39')) AND'
      
        '(((:IDCARTEIRAINVEST IS NOT NULL)  AND (ORDMOVINV.IDCARTEIRAINVE' +
        'ST = :IDCARTEIRAINVEST)) OR (:IDCARTEIRAINVEST IS NULL)) AND'
      
        '(((:IDCARTEIRAGERENC IS NOT NULL)  AND (ORDMOVINV.IDCARTEIRAGERE' +
        'NC = :IDCARTEIRAGERENC)) OR (:IDCARTEIRAGERENC IS NULL)) AND'
      
        '(((:IDCORRETVALORES IS NOT NULL)   AND (ORDMOVINV.IDCORRETVALORE' +
        'S = :IDCORRETVALORES))   OR (:IDCORRETVALORES IS NULL)) AND'
      
        '(((:IDTIPOOPERACAO IS NOT NULL)    AND (ORDMOVINV.IDTIPOOPERACAO' +
        ' = :IDTIPOOPERACAO))     OR (:IDTIPOOPERACAO IS NULL)) AND'
      
        '(((:IDINVESTIMENTO IS NOT NULL)    AND (ORDMOVINV.IDINVESTIMENTO' +
        ' = :IDINVESTIMENTO))     OR (:IDINVESTIMENTO IS NULL)) AND'
      
        '(((:IDTIPOCONTRINVEST IS NOT NULL) AND (TIPOCONTRINVEST.IDTIPOCO' +
        'NTRINVEST = :IDTIPOCONTRINVEST)) OR (:IDTIPOCONTRINVEST IS NULL)' +
        ') AND'
      
        '(CARTEIRAINVEST.IDCARTEIRAINVEST(+) = ORDMOVINV.IDCARTEIRAINVEST' +
        ') AND'
      
        '(CARTEIRAGERENC.IDCARTEIRAGERENC(+) = ORDMOVINV.IDCARTEIRAGERENC' +
        ') AND'
      
        '(INVESTIMENTO.IDINVESTIMENTO        = ORDMOVINV.IDINVESTIMENTO) ' +
        '  AND'
      
        '(BOLSAVALORES.IDBOLSAVALORES        = ORDMOVINV.IDBOLSAVALORES) ' +
        '  AND'
      
        '(TIPOOPERACAO.IDTIPOOPERACAO        = ORDMOVINV.IDTIPOOPERACAO) ' +
        '  AND'
      
        '(CORRETVALORES.IDCORRETVALORES      = ORDMOVINV.IDCORRETVALORES)' +
        '  AND'
      
        '(SERIESBMF.IDINVESTIMENTO           = ORDMOVINV.IDINVESTIMENTO) ' +
        '  AND'
      
        '(SERIESBMF.IDTIPOCONTRINVEST        = TIPOCONTRINVEST.IDTIPOCONT' +
        'RINVEST)'
      ' ORDER BY ORDMOVINV.IDORDMOVINV'
      ''
      ''
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
      ' ')
    UpdateObject = updDetalhe
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N'
      'STAAUTORIZA;CheckBox;A;P')
    ValidateWithMask = True
    Left = 384
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
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
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
    object QryDetalheHORAMOV: TStringField
      DisplayLabel = 'Hora'
      DisplayWidth = 5
      FieldName = 'HORAMOV'
      Size = 5
    end
    object QryDetalheSTACONFIRMA: TStringField
      DisplayLabel = 'Confirma'
      DisplayWidth = 6
      FieldName = 'STACONFIRMA'
      Size = 1
    end
    object QryDetalheSTAAUTORIZA: TStringField
      DisplayLabel = 'Autoriza'
      DisplayWidth = 6
      FieldName = 'STAAUTORIZA'
      OnChange = QryDetalheSTAAUTORIZAChange
      FixedChar = True
      Size = 1
    end
    object QryDetalheQTDEORDENADA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 16
      FieldName = 'QTDEORDENADA'
      Origin = 'ORDMOVINV.QTDEORDENADA'
      DisplayFormat = '###,###,###,###'
    end
    object QryDetalhePUORDMOVINV: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 20
      FieldName = 'PUORDMOVINV'
      Origin = 'ORDMOVINV.PUORDMOVINV'
      DisplayFormat = '#,#########0.000000000'
    end
    object QryDetalheVALOR: TFloatField
      DisplayLabel = 'Valor Negociado'
      DisplayWidth = 17
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryDetalheOBSAUTMOV: TStringField
      DisplayLabel = 
        'Observação                                                      ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '            '
      DisplayWidth = 200
      FieldName = 'OBSAUTMOV'
      Size = 200
    end
    object QryDetalheNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryDetalheIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryDetalheIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object QryDetalheSIGLATIPOOPER: TStringField
      DisplayLabel = 'Oper.'
      DisplayWidth = 8
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object QryDetalheDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCTINVEST'
      Visible = False
      Size = 60
    end
    object QryDetalheQTDEORDMOVINV: TFloatField
      DisplayLabel = 'Quantidade Negociada'
      DisplayWidth = 18
      FieldName = 'QTDEORDMOVINV'
      Origin = 'ORDMOVINV.QTDEORDMOVINV'
      Visible = False
    end
    object QryDetalheIDCUSTODIANTE: TFloatField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryDetalheIDORDMOVINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDMOVINV'
      Origin = 'ORDMOVINV.IDORDMOVINV'
      Visible = False
    end
    object QryDetalheIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'ORDMOVINV.IDCORRETVALORES'
      Visible = False
    end
    object v: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'ORDMOVINV.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheDATAORDMOVINV: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAORDMOVINV'
      Origin = 'ORDMOVINV.DATAORDMOVINV'
      Visible = False
    end
    object QryDetalheNUMDOCMOVINV: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCMOVINV'
      Origin = 'ORDMOVINV.NUMDOCMOVINV'
      Visible = False
      Size = 30
    end
    object QryDetalheSTATMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'STATMOVINV'
      Origin = 'ORDMOVINV.STATMOVINV'
      Visible = False
      Size = 1
    end
    object QryDetalheIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'ORDMOVINV.IDUSUARIO'
      Visible = False
    end
    object QryDetalheIDAUTORIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAUTORIZACAO'
      Origin = 'ORDMOVINV.IDAUTORIZACAO'
      Visible = False
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'ORDMOVINV.IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'ORDMOVINV.IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'ORDMOVINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Origin = 'ORDMOVINV.IDLOTE'
      Visible = False
      Size = 10
    end
    object QryDetalheDATAAUTORIZACAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAAUTORIZACAO'
      Origin = 'ORDMOVINV.DATAAUTORIZACAO'
      Visible = False
    end
    object QryDetalheIDBOLSAVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Visible = False
    end
    object QryDetalheDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object QryDetalheSGLCORRETVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Visible = False
      Size = 10
    end
    object QryDetalheDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryDetalheDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryDetalheSGLBOLSAVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLBOLSAVALORES'
      Visible = False
      Size = 10
    end
    object QryDetalheIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Visible = False
    end
    object QryDetalheOBSMOVINV: TStringField
      FieldName = 'OBSMOVINV'
      Visible = False
      Size = 200
    end
  end
  object DsDetalhe: TwwDataSource
    DataSet = QryDetalhe
    Left = 384
    Top = 312
  end
  object QryNumBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT                                                          ' +
        ' '
      
        '  NUMDOCMOVINV,                                                 ' +
        ' '
      
        '  IDLOTE                                                        ' +
        ' '
      
        'FROM                                                            ' +
        ' '
      
        '  ORDMOVINV                                                     ' +
        ' '
      
        'WHERE                                                           ' +
        ' '
      
        '(IDTIPOINVEST = 8) AND                                          ' +
        '                       '
      '(IDCORRETVALORES   = :pIdCorretvalores)')
    ValidateWithMask = True
    Left = 241
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdCorretvalores'
        ParamType = ptUnknown
      end>
    object QryNumBoletaNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Origin = 'BASEDADOS.ORDMOVINV.NUMDOCMOVINV'
      Size = 30
    end
    object QryNumBoletaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.ORDMOVINV.IDLOTE'
      Size = 10
    end
  end
  object QryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      FLGORDMOVINV,'
      '      IDBMF'
      'FROM  PARAMINVEST')
    ValidateWithMask = True
    Left = 243
    Top = 323
    object QryParamInvestFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'PARAMINVEST.FLGORDMOVINV'
      Size = 1
    end
    object QryParamInvestIDBMF: TFloatField
      FieldName = 'IDBMF'
    end
  end
  object updContratoInvestim: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOINVESTIM'
      'set'
      '  IDCONTRATOINVEST = :IDCONTRATOINVEST,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  SERIE = :SERIE,'
      '  IDLOTE = :IDLOTE,'
      '  IDCARTLASTRO = :IDCARTLASTRO'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CONTRATOINVESTIM'
      
        '  (IDCONTRATOINVEST, IDTIPOCONTRINVEST, IDEMISSOR, IDINVESTIMENT' +
        'O, '
      'IDCORRETVALORES, '
      '   IDBOLSAVALORES, SERIE, IDLOTE, IDCARTLASTRO)'
      'values'
      '  (:IDCONTRATOINVEST, :IDTIPOCONTRINVEST, :IDEMISSOR, '
      ':IDINVESTIMENTO, '
      
        '   :IDCORRETVALORES, :IDBOLSAVALORES, :SERIE, :IDLOTE, :IDCARTLA' +
        'STRO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 450
    Top = 336
  end
  object QryContratoInvestim: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCONTRATOINVEST,'
      '     IDTIPOCONTRINVEST,'
      '     IDEMISSOR,'
      '     IDINVESTIMENTO,'
      '     IDCORRETVALORES,'
      '     IDBOLSAVALORES,'
      '     SERIE,'
      '     IDLOTE,'
      '     IDCARTLASTRO'
      'FROM'
      '     CONTRATOINVESTIM'
      'WHERE'
      '     (IDINVESTIMENTO  =:IDINVESTIMENTO) AND'
      '     (IDCORRETVALORES =:IDCORRETVALORES) AND'
      '     (IDLOTE          =:IDLOTE) AND'
      '     (IDCARTLASTRO    =:IDCARTLASTRO)')
    UpdateObject = updContratoInvestim
    ValidateWithMask = True
    Left = 488
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTLASTRO'
        ParamType = ptUnknown
      end>
    object QryContratoInvestimIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOINVEST'
    end
    object QryContratoInvestimIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'CONTRATOINVESTIM.IDTIPOCONTRINVEST'
    end
    object QryContratoInvestimIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'CONTRATOINVESTIM.IDEMISSOR'
    end
    object QryContratoInvestimIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'CONTRATOINVESTIM.IDINVESTIMENTO'
    end
    object QryContratoInvestimIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CONTRATOINVESTIM.IDCORRETVALORES'
    end
    object QryContratoInvestimIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'CONTRATOINVESTIM.IDBOLSAVALORES'
    end
    object QryContratoInvestimSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'CONTRATOINVESTIM.SERIE'
      Size = 60
    end
    object QryContratoInvestimIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'CONTRATOINVESTIM.IDLOTE'
      Size = 10
    end
    object QryContratoInvestimIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
      Origin = 'CONTRATOINVESTIM.IDCARTLASTRO'
    end
  end
  object DsContratoInvestim: TwwDataSource
    AutoEdit = False
    DataSet = QryContratoInvestim
    Left = 528
    Top = 336
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDLOTE'
      'FROM'
      '     ORDMOVINV'
      'WHERE'
      '     (IDLOTE =:IDLOTE)')
    ValidateWithMask = True
    Left = 219
    Top = 227
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object QryAuxIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'ORDMOVINV.IDLOTE'
      Size = 10
    end
  end
  object QryVenda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDLOTE'
      'FROM'
      '     ORDMOVINV'
      'WHERE'
      '     (IDLOTE =:IDLOTE)')
    ValidateWithMask = True
    Left = 459
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'IDLOTE'
      Origin = 'ORDMOVINV.IDLOTE'
      Size = 10
    end
  end
  object QryParamContrBMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PA.PESOCONTRATO,'
      '      PA1.DATA'
      'FROM '
      '      PARAMCONTRATOBMF PA,'
      '      (SELECT MAX(DATAVIGENCIA) AS DATA FROM PARAMCONTRATOBMF '
      '       WHERE IDTIPOCONTRINVEST= :pIDTIPOCONTRINVEST) PA1'
      'WHERE '
      '     (PA.IDTIPOCONTRINVEST = :pIDTIPOCONTRINVEST) AND'
      '     (PA.DATAVIGENCIA = PA1.DATA)'
      '      ')
    ValidateWithMask = True
    Left = 320
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
    object QryParamContrBMFPESOCONTRATO: TFloatField
      FieldName = 'PESOCONTRATO'
    end
    object QryParamContrBMFDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object QryBuscaSaldoDiaAntCorret: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'D'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDCOMPRADA,'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'A'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDVENDIDA'
      'FROM'
      '       HISTCARTINV HI'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      '       (HI.IDTIPOOPERACAO NOT IN(-10,-11)) AND'
      '       (HI.IDLOTE = :IdLote ) AND'
      '       (HI.IDINVESTIMENTO = :IdInvestimento) AND'
      '       (HI.DATAMOVCARTINV < TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryBuscaSaldoDiaAntCorretQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryBuscaSaldoDiaAntCorretQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryBuscaSaldoDiaAntTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'D'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDCOMPRADA,'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'A'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDVENDIDA'
      'FROM'
      '       HISTCARTINV HI'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      '       (HI.IDTIPOOPERACAO NOT IN(-10,-11)) AND'
      '       (HI.IDINVESTIMENTO = :IdInvestimento) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (HI.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND   ' +
        '    '
      '       (HI.DATAMOVCARTINV < TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 520
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object FloatField2: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryTotalOperado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'D'#39',0,OD.QTDEORDENADA) )' +
        ' AS QTDCOMPRADA,'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'A'#39',0,OD.QTDEORDENADA) )' +
        ' AS QTDVENDIDA'
      'FROM'
      '       ORDMOVINV OD, TIPOOPERACAO TP'
      'WHERE'
      '       (OD.IDTIPOINVEST = 8) AND'
      '       (OD.IDINVESTIMENTO = :IdInvestimento) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OD.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND   ' +
        '    '
      
        '       (TRUNC(OD.DATAORDMOVINV) = TO_DATE(:dDataAtu, '#39'DD/MM/YYYY' +
        #39')) AND'
      '       (OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 520
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryTotalOperadoQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryTotalOperadoQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryAutorizador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9
      '     IDUSUARIO,'
      '     NOMEUSUARIO'
      'FROM '
      '     CM.AUTORIZAOPERACAO'
      'ORDER BY NOMEUSUARIO')
    ValidateWithMask = True
    Left = 64
    Top = 376
    object QryAutorizadorNOMEUSUARIO: TStringField
      DisplayLabel = 'Autorizador'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.NOMEUSUARIO'
    end
    object QryAutorizadorIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.IDUSUARIO'
      Visible = False
    end
  end
end
