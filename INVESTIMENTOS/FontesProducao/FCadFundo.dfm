inherited frmCadFundo: TfrmCadFundo
  Left = 259
  Top = 148
  HelpContext = 790055
  Caption = 'Instituição Financeira'
  ClientHeight = 442
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 134
    Top = 301
    Width = 87
    Height = 13
    Caption = 'Prazo Carência'
  end
  object Label12: TLabel [1]
    Left = 11
    Top = 9
    Width = 79
    Height = 13
    Caption = 'Código Fundo'
  end
  object Label4: TLabel [2]
    Left = 11
    Top = 59
    Width = 67
    Height = 13
    Caption = 'Contraparte'
  end
  inherited pnlFundo: TPanel
    Width = 696
    Height = 356
    inherited Bevel2: TBevel
      Width = 694
    end
    inherited pnlTitulo: TPanel
      Width = 694
      TabOrder = 1
      inherited lbNomItem: TfcLabel
        Width = 245
        Caption = 'Fundos de Investimento'
        OnClick = bbtnCancelarClick
      end
    end
    object pgcDetalhes: TPageControl
      Left = 1
      Top = 45
      Width = 694
      Height = 310
      ActivePage = tbsCaracteristicas
      Align = alClient
      TabOrder = 0
      OnChange = pgcDetalhesChange
      object tbsHistorico: TTabSheet
        Caption = 'Histórico'
        ImageIndex = 2
        object dbgHistoricoFundo: TwwDBGrid
          Left = 0
          Top = 0
          Width = 686
          Height = 282
          Selected.Strings = (
            'DTAVIGENCIA'#9'22'#9'Data de Vigência'
            'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento'
            'NomeGestor'#9'26'#9'Gestor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnCellChanged = dbgHistoricoFundoCellChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          IndicatorColor = icBlack
        end
      end
      object tbsCaracteristicas: TTabSheet
        Caption = 'Fundo'
        object pnlCadFundo: TPanel
          Left = 0
          Top = 0
          Width = 686
          Height = 282
          Align = alClient
          TabOrder = 0
          object pgcFundo: TPageControl
            Left = 1
            Top = 1
            Width = 684
            Height = 280
            ActivePage = tbsParametros
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Style = tsFlatButtons
            TabOrder = 0
            object tbsPrincipal: TTabSheet
              Caption = 'Principal'
              object pnlPrincipal: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 249
                Align = alClient
                TabOrder = 0
                object pgcPrincipal: TPageControl
                  Left = 1
                  Top = 1
                  Width = 674
                  Height = 247
                  ActivePage = tbsGeral
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  object tbsGeral: TTabSheet
                    Caption = 'Geral'
                    object pnlGeral: TPanel
                      Left = 0
                      Top = 0
                      Width = 666
                      Height = 216
                      Align = alClient
                      BevelOuter = bvLowered
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object lblVigencia: TLabel
                        Left = 168
                        Top = 137
                        Width = 50
                        Height = 13
                        Caption = 'Vigência'
                      end
                      object lblTipoFundo: TLabel
                        Left = 14
                        Top = 48
                        Width = 83
                        Height = 13
                        Caption = 'Tipo de Fundo'
                      end
                      object lblCNPJ: TLabel
                        Left = 14
                        Top = 92
                        Width = 32
                        Height = 13
                        Caption = 'CNPJ'
                      end
                      object lblNome: TLabel
                        Left = 14
                        Top = 5
                        Width = 37
                        Height = 13
                        Caption = 'Nome '
                      end
                      object Label14: TLabel
                        Left = 14
                        Top = 137
                        Width = 69
                        Height = 13
                        Caption = 'Código ISIN'
                      end
                      object Label24: TLabel
                        Left = 331
                        Top = 48
                        Width = 86
                        Height = 13
                        Caption = 'Nível de Risco'
                        Visible = False
                      end
                      object dbckExclusivo: TDBCheckBox
                        Left = 331
                        Top = 154
                        Width = 97
                        Height = 17
                        Caption = 'Exclusivo'
                        DataField = 'STAEXCLUSIVO'
                        DataSource = ds
                        TabOrder = 5
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object dtpDtaVigencia: TCMDateTimePicker
                        Left = 168
                        Top = 151
                        Width = 153
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        CalendarAttributes.PopupYearOptions.ShowEditYear = True
                        ButtonStyle = cbsCustom
                        DataField = 'DTAVIGENCIA'
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
                        TabOrder = 4
                        DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
                      end
                      object dbeCNPJ: TwwDBEdit
                        Left = 14
                        Top = 106
                        Width = 130
                        Height = 21
                        DataField = 'CNPJFUNDO'
                        DataSource = ds
                        MaxLength = 18
                        TabOrder = 3
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                        OnExit = dbeCNPJExit
                      end
                      object dblTipoFundo: TwwDBLookupCombo
                        Left = 14
                        Top = 63
                        Width = 306
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCTIPOFUNDOINV'#9'20'#9'Descrição'#9'F')
                        DataField = 'IDTIPOFUNDOINVEST'
                        DataSource = ds
                        LookupTable = qryTipoFundo
                        LookupField = 'IDTIPOFUNDOINVEST'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                      end
                      object DBENomeCarteira: TwwDBEdit
                        Left = 14
                        Top = 19
                        Width = 538
                        Height = 21
                        DataField = 'DESCFUNDOINVEST'
                        DataSource = ds
                        TabOrder = 0
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object dbeCodIsin: TwwDBEdit
                        Left = 14
                        Top = 151
                        Width = 143
                        Height = 21
                        DataField = 'CODISIN'
                        DataSource = ds
                        TabOrder = 6
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object dblcNivelRisco: TwwDBLookupCombo
                        Left = 331
                        Top = 63
                        Width = 231
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMERISCOFUNDO'#9'60'#9'Descrição'#9'F')
                        DataSource = ds
                        LookupTable = qryNivelRisco
                        LookupField = 'IDRISCOFUNDOINVES'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 2
                        Visible = False
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                      end
                    end
                  end
                  object tbsresponsaveis: TTabSheet
                    Caption = 'Responsáveis'
                    ImageIndex = 1
                    object pnlResponsaveis: TPanel
                      Left = 0
                      Top = 0
                      Width = 666
                      Height = 216
                      Align = alClient
                      BevelOuter = bvLowered
                      TabOrder = 0
                      object lblGestor: TLabel
                        Left = 14
                        Top = 7
                        Width = 38
                        Height = 13
                        Caption = 'Gestor'
                      end
                      object lblAdmFdo: TLabel
                        Left = 14
                        Top = 48
                        Width = 77
                        Height = 13
                        Caption = 'Administrador'
                      end
                      object Label15: TLabel
                        Left = 14
                        Top = 88
                        Width = 68
                        Height = 13
                        Caption = 'Custodiante'
                      end
                      object dblGestor: TwwDBLookupCombo
                        Left = 14
                        Top = 21
                        Width = 387
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOME'#9'50'#9'Descrição'#9'F')
                        DataField = 'IDGESTORCARTEIRA'
                        DataSource = ds
                        LookupTable = qryGestorCart
                        LookupField = 'IDPESSOA'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                        OnChange = dblGestorChange
                        OnCloseUp = dblGestorCloseUp
                      end
                      object dbeCNPJGestor: TwwDBEdit
                        Left = 414
                        Top = 21
                        Width = 130
                        Height = 21
                        Color = clSilver
                        DataField = 'NUMDOCUMENTO'
                        DataSource = dsGestorCart
                        Enabled = False
                        TabOrder = 1
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object dblkAdmFdo: TwwDBLookupCombo
                        Left = 14
                        Top = 62
                        Width = 387
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESADMFDOINVEST'#9'40'#9'Descrição'#9'F')
                        DataField = 'IDADMFDOINVEST'
                        DataSource = ds
                        LookupTable = qryAdmFdoInvest
                        LookupField = 'IDADMFDOINVEST'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                        OnChange = dblkAdmFdoChange
                        OnCloseUp = dblkAdmFdoCloseUp
                      end
                      object dbeCNPJAdm: TwwDBEdit
                        Left = 414
                        Top = 62
                        Width = 130
                        Height = 21
                        Color = clSilver
                        DataField = 'NUMDOCUMENTO'
                        DataSource = dsAdmFdoInvest
                        Enabled = False
                        TabOrder = 3
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object dblkCustodiante: TwwDBLookupCombo
                        Left = 14
                        Top = 102
                        Width = 298
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'SGLCUSTODIANTE'#9'30'#9'Descrição'#9'F')
                        DataField = 'IDCUSTODIANTE'
                        DataSource = ds
                        LookupTable = QryCustodiante
                        LookupField = 'IDCUSTODIANTE'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 4
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                        OnChange = dblkCustodianteChange
                        OnCloseUp = dblkCustodianteCloseUp
                      end
                      object dbeCustodiante: TwwDBEdit
                        Left = 414
                        Top = 102
                        Width = 130
                        Height = 21
                        Color = clSilver
                        DataField = 'NUMDOCUMENTO'
                        DataSource = dsCustodiante
                        Enabled = False
                        TabOrder = 5
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                    end
                  end
                end
              end
            end
            object tbsParametros: TTabSheet
              Caption = 'Parâmetros'
              ImageIndex = 1
              object pnlParametros: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 249
                Align = alClient
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object pnlDetalhesGeral: TPanel
                  Left = 1
                  Top = 1
                  Width = 273
                  Height = 247
                  Align = alLeft
                  TabOrder = 0
                  object pnlPrazoCot: TPanel
                    Left = 1
                    Top = 125
                    Width = 271
                    Height = 62
                    Align = alTop
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    TabOrder = 2
                    object sttPrzCot: TStaticText
                      Left = 15
                      Top = 3
                      Width = 114
                      Height = 17
                      Caption = 'Prazo de Cotização'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object pnlPrazoCotDet: TPanel
                      Left = 2
                      Top = 18
                      Width = 267
                      Height = 42
                      Align = alBottom
                      BevelOuter = bvLowered
                      Color = clSilver
                      TabOrder = 1
                      object Label26: TLabel
                        Left = 13
                        Top = 15
                        Width = 57
                        Height = 13
                        Caption = 'Aplicação'
                      end
                      object Label27: TLabel
                        Left = 141
                        Top = 15
                        Width = 48
                        Height = 13
                        Caption = 'Resgate'
                      end
                      object dbePzCotAplicacao: TDBEdit
                        Left = 81
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOCOTAPLIC'
                        DataSource = ds
                        TabOrder = 0
                      end
                      object dbePzCotResgate: TDBEdit
                        Left = 210
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOCOTRESG'
                        DataSource = ds
                        TabOrder = 1
                      end
                    end
                  end
                  object pnlPrazo: TPanel
                    Left = 1
                    Top = 1
                    Width = 271
                    Height = 62
                    Align = alTop
                    BevelInner = bvSpace
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object sttPrazo: TStaticText
                      Left = 16
                      Top = 3
                      Width = 36
                      Height = 17
                      Caption = 'Prazo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object pnlPrazoDet: TPanel
                      Left = 2
                      Top = 18
                      Width = 267
                      Height = 42
                      Align = alBottom
                      BevelOuter = bvLowered
                      Color = clSilver
                      TabOrder = 1
                      object Label1: TLabel
                        Left = 13
                        Top = 15
                        Width = 51
                        Height = 13
                        Caption = 'Carência'
                      end
                      object Label2: TLabel
                        Left = 141
                        Top = 15
                        Width = 64
                        Height = 13
                        Caption = 'Aniversário'
                      end
                      object dbePzCarencia: TDBEdit
                        Left = 82
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOCARENCIA'
                        DataSource = ds
                        TabOrder = 0
                      end
                      object dbePzAniversario: TDBEdit
                        Left = 210
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOANIVERSARIO'
                        DataSource = ds
                        TabOrder = 1
                      end
                    end
                  end
                  object pnlPrazoLiq: TPanel
                    Left = 1
                    Top = 63
                    Width = 271
                    Height = 62
                    Align = alTop
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    TabOrder = 1
                    object sttPrzLiq: TStaticText
                      Left = 16
                      Top = 3
                      Width = 120
                      Height = 17
                      Caption = 'Prazo de Liquidação'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object pnlPrazoLiqDet: TPanel
                      Left = 2
                      Top = 18
                      Width = 267
                      Height = 42
                      Align = alBottom
                      BevelOuter = bvLowered
                      Color = clSilver
                      TabOrder = 1
                      object Label3: TLabel
                        Left = 13
                        Top = 15
                        Width = 61
                        Height = 13
                        Caption = 'Aplicação '
                      end
                      object Label5: TLabel
                        Left = 141
                        Top = 15
                        Width = 48
                        Height = 13
                        Caption = 'Resgate'
                      end
                      object dbePzLiqAplicacao: TDBEdit
                        Left = 83
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOLIQAPLIC'
                        DataSource = ds
                        TabOrder = 0
                      end
                      object dbePzLiqResgate: TDBEdit
                        Left = 210
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'PZOLIQRESG'
                        DataSource = ds
                        TabOrder = 1
                      end
                    end
                  end
                  object pnlQuantidadeDec: TPanel
                    Left = 1
                    Top = 187
                    Width = 271
                    Height = 62
                    Align = alTop
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    TabOrder = 3
                    object sttQtdDec: TStaticText
                      Left = 15
                      Top = 3
                      Width = 122
                      Height = 17
                      Caption = 'Quantidade decimais'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object pnlQuantidadeDecDet: TPanel
                      Left = 2
                      Top = 18
                      Width = 267
                      Height = 42
                      Align = alBottom
                      BevelOuter = bvLowered
                      Color = clSilver
                      TabOrder = 1
                      object Label9: TLabel
                        Left = 13
                        Top = 15
                        Width = 66
                        Height = 13
                        Caption = 'Quantidade'
                      end
                      object Label10: TLabel
                        Left = 141
                        Top = 15
                        Width = 60
                        Height = 13
                        Caption = 'Valor Cota'
                      end
                      object dbeQtdDec: TDBEdit
                        Left = 83
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'QTDDECQTD'
                        DataSource = ds
                        TabOrder = 0
                        OnExit = dbeQtdDecExit
                      end
                      object dbeValorCota: TDBEdit
                        Left = 210
                        Top = 11
                        Width = 44
                        Height = 21
                        DataField = 'QTDDECVALOR'
                        DataSource = ds
                        TabOrder = 1
                      end
                    end
                  end
                end
                object pnlParametrosDet: TPanel
                  Left = 274
                  Top = 1
                  Width = 401
                  Height = 247
                  Align = alClient
                  TabOrder = 1
                  object pgcParametrosDet: TPageControl
                    Left = 1
                    Top = 1
                    Width = 399
                    Height = 245
                    ActivePage = tbsOutros
                    Align = alClient
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Style = tsFlatButtons
                    TabOrder = 0
                    object tbsCarteiras: TTabSheet
                      Caption = 'Carteiras'
                      ImageIndex = 4
                      object pnlCarteiras: TPanel
                        Left = 0
                        Top = 0
                        Width = 391
                        Height = 214
                        Align = alClient
                        BevelOuter = bvLowered
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        object Label7: TLabel
                          Left = 8
                          Top = 10
                          Width = 73
                          Height = 13
                          Caption = 'Carteira SPC'
                        end
                        object lblCarteira: TLabel
                          Left = 8
                          Top = 53
                          Width = 121
                          Height = 13
                          Caption = 'Carteira Investimento'
                        end
                        object dblCarteiraSPC: TwwDBLookupCombo
                          Left = 8
                          Top = 26
                          Width = 295
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCARTEIRASPC'#9'50'#9'Descrição'#9'F')
                          DataField = 'IDCARTEIRASPC'
                          DataSource = ds
                          LookupTable = qryCarteiraSPC
                          LookupField = 'IDCARTEIRASPC'
                          Options = [loColLines, loRowLines, loTitles]
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                        object dblCarteiraInvest: TwwDBLookupCombo
                          Left = 8
                          Top = 69
                          Width = 295
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCCARTINVEST'#9'50'#9'Descrição'#9'F')
                          DataField = 'IDCARTEIRAINVEST'
                          DataSource = ds
                          LookupTable = qryCarteiraInvest
                          LookupField = 'IDCARTEIRAINVEST'
                          Options = [loColLines, loRowLines, loTitles]
                          TabOrder = 1
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                      end
                    end
                    object tbsAtualizacao: TTabSheet
                      Caption = 'Atualização'
                      ImageIndex = 1
                      object pnlAtualizacao: TPanel
                        Left = 0
                        Top = 0
                        Width = 391
                        Height = 214
                        Align = alClient
                        BevelOuter = bvLowered
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        object Label23: TLabel
                          Left = 8
                          Top = 7
                          Width = 65
                          Height = 13
                          Caption = 'Data Início'
                        end
                        object Label28: TLabel
                          Left = 8
                          Top = 52
                          Width = 64
                          Height = 13
                          Caption = 'Cota Início'
                        end
                        object Label29: TLabel
                          Left = 8
                          Top = 96
                          Width = 209
                          Height = 13
                          Caption = 'Regra de Atualização (a Integralizar)'
                        end
                        object Label30: TLabel
                          Left = 8
                          Top = 144
                          Width = 210
                          Height = 13
                          Caption = 'Índice de Atualização (a Integralizar)'
                        end
                        object dtpInicioAtualizacao: TCMDateTimePicker
                          Left = 8
                          Top = 21
                          Width = 120
                          Height = 21
                          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                          CalendarAttributes.Font.Color = clWindowText
                          CalendarAttributes.Font.Height = -11
                          CalendarAttributes.Font.Name = 'MS Sans Serif'
                          CalendarAttributes.Font.Style = []
                          ButtonStyle = cbsCustom
                          DataField = 'DATAINICIOFUNDO'
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
                        end
                        object DbEdValorCota: TDBRealEdit
                          Left = 8
                          Top = 66
                          Width = 179
                          Height = 21
                          Alignment = taRightJustify
                          Lines.Strings = (
                            '0,00000000')
                          TabOrder = 1
                          WordWrap = False
                          IntDigits = 9
                          DecDigits = 8
                          NumberFormat = fNumber
                          Signal = False
                          DataField = 'VLRCOTAINICIAL'
                          DataSource = ds
                        end
                        object dblRegraAtuCota: TCMDBLookupCombo
                          Left = 8
                          Top = 112
                          Width = 258
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'NOMEREGRA'#9'35'#9'Descrição'#9'F')
                          DataField = 'IDREGRA'
                          DataSource = ds
                          LookupTable = qryRegraInvest
                          LookupField = 'IDREGRA'
                          Options = [loTitles]
                          Style = csDropDownList
                          TabOrder = 2
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                        object dblMoeCorCota: TCMDBLookupCombo
                          Left = 8
                          Top = 160
                          Width = 258
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'MOESIGLA'#9'10'#9'Sigla'#9'F'
                            'MOEDESC'#9'20'#9'Descrição'#9'F')
                          DataField = 'MOECORCOTA'
                          DataSource = ds
                          LookupTable = qryMoeCorCot
                          LookupField = 'MOECODIGO'
                          Options = [loColLines, loRowLines, loTitles]
                          Style = csDropDownList
                          TabOrder = 3
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                      end
                    end
                    object tbsPerformance: TTabSheet
                      Caption = 'Taxas'
                      object pnlTaxas: TPanel
                        Left = 0
                        Top = 0
                        Width = 391
                        Height = 214
                        Align = alClient
                        BevelOuter = bvLowered
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        object Label19: TLabel
                          Left = 8
                          Top = 8
                          Width = 76
                          Height = 13
                          Caption = 'Performance '
                        end
                        object Label21: TLabel
                          Left = 104
                          Top = 7
                          Width = 129
                          Height = 13
                          Caption = 'Índice de Performance'
                        end
                        object Label18: TLabel
                          Left = 79
                          Top = 26
                          Width = 10
                          Height = 13
                          Caption = '%'
                        end
                        object Label17: TLabel
                          Left = 9
                          Top = 53
                          Width = 80
                          Height = 13
                          Caption = 'Administração'
                        end
                        object Label20: TLabel
                          Left = 79
                          Top = 71
                          Width = 10
                          Height = 13
                          Caption = '%'
                        end
                        object dblMoeCodigo: TwwDBLookupCombo
                          Left = 104
                          Top = 21
                          Width = 225
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'MOEDESC'#9'20'#9'Moeda'#9'F')
                          DataField = 'MOECODIGO'
                          DataSource = ds
                          LookupTable = qryINDICE
                          LookupField = 'MOECODIGO'
                          Options = [loColLines, loRowLines, loTitles]
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                        object dbeTaxaPerformace: TDBRealEdit
                          Left = 8
                          Top = 22
                          Width = 64
                          Height = 21
                          Alignment = taRightJustify
                          Lines.Strings = (
                            '0,00')
                          TabOrder = 1
                          WordWrap = False
                          IntDigits = 3
                          DecDigits = 2
                          NumberFormat = fNumber
                          Signal = False
                          DataField = 'PERCTXPERFORM'
                          DataSource = ds
                        end
                        object dbeTaxaAdministracao: TDBRealEdit
                          Left = 9
                          Top = 67
                          Width = 64
                          Height = 21
                          Alignment = taRightJustify
                          Lines.Strings = (
                            '0,0000')
                          TabOrder = 2
                          WordWrap = False
                          IntDigits = 3
                          DecDigits = 4
                          NumberFormat = fNumber
                          Signal = False
                          DataField = 'PERCTXADM'
                          DataSource = ds
                        end
                      end
                    end
                    object tbsImpostos: TTabSheet
                      Caption = 'Impostos'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ImageIndex = 3
                      ParentFont = False
                      object pnlImpostos: TPanel
                        Left = 0
                        Top = 0
                        Width = 391
                        Height = 214
                        Align = alClient
                        BevelOuter = bvLowered
                        TabOrder = 0
                        object GroupBox1: TGroupBox
                          Left = 7
                          Top = 5
                          Width = 201
                          Height = 65
                          Caption = 'Provisiona'
                          TabOrder = 0
                          object dbcProvisionaIR: TDBCheckBox
                            Left = 31
                            Top = 31
                            Width = 83
                            Height = 17
                            Caption = 'IR'
                            DataField = 'STAPROVISIONAIR'
                            DataSource = ds
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            ValueChecked = 'S'
                            ValueUnchecked = 'N'
                          end
                          object dbcProvisionaIOF: TDBCheckBox
                            Left = 133
                            Top = 31
                            Width = 58
                            Height = 17
                            Caption = 'IOF'
                            DataField = 'STAPROVISIONAIOF'
                            DataSource = ds
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            ValueChecked = 'S'
                            ValueUnchecked = 'N'
                          end
                        end
                      end
                    end
                    object tbsOutros: TTabSheet
                      Caption = 'Outros'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ImageIndex = 2
                      ParentFont = False
                      object pnloutros: TPanel
                        Left = 0
                        Top = 0
                        Width = 391
                        Height = 214
                        Align = alClient
                        BevelOuter = bvLowered
                        TabOrder = 0
                        object Label13: TLabel
                          Left = 8
                          Top = 8
                          Width = 112
                          Height = 13
                          Caption = 'Categoria do Fundo'
                        end
                        object lblTipoCota: TLabel
                          Left = 8
                          Top = 52
                          Width = 74
                          Height = 13
                          Caption = 'Tipo de Cota'
                        end
                        object Label16: TLabel
                          Left = 8
                          Top = 177
                          Width = 110
                          Height = 13
                          Caption = 'Prazo Amortização '
                          Enabled = False
                        end
                        object lb1: TLabel
                          Left = 131
                          Top = 177
                          Width = 158
                          Height = 13
                          Caption = 'Qtd. de Cotas a Subscrever'
                          Enabled = False
                        end
                        object dblCategFundo: TwwDBLookupCombo
                          Left = 8
                          Top = 23
                          Width = 300
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'NOMECATEGFUNDO'#9'20'#9'Descrição'#9'F')
                          DataField = 'IDCATEGORIAFUNDO'
                          DataSource = ds
                          LookupTable = qryCategFundo
                          LookupField = 'IDCATEGORIAFUNDO'
                          Options = [loColLines, loRowLines, loTitles]
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                          ShowMatchText = True
                        end
                        object dblTipoCota: TwwDBLookupCombo
                          Left = 8
                          Top = 67
                          Width = 300
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCTIPOCOTA'#9'20'#9'Descrição'#9'F')
                          LookupTable = QryTipoCota
                          LookupField = 'IDTIPOCOTA'
                          Options = [loRowLines, loTitles]
                          TabOrder = 1
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = False
                          ShowMatchText = True
                        end
                        object dbrgFUNDO: TDBRadioGroup
                          Left = 8
                          Top = 96
                          Width = 300
                          Height = 74
                          Caption = 'Fundo'
                          Color = clBtnFace
                          DataField = 'STAFUNDO'
                          DataSource = ds
                          Items.Strings = (
                            'Aberto'
                            'Fechado')
                          ParentColor = False
                          TabOrder = 2
                          Values.Strings = (
                            '0'
                            '1')
                          OnClick = dbrgFUNDOClick
                        end
                        object dbePZOAMORTIZACAO: TDBEdit
                          Left = 8
                          Top = 192
                          Width = 53
                          Height = 21
                          Color = clSilver
                          DataField = 'PZOAMORTIZACAO'
                          DataSource = ds
                          Enabled = False
                          TabOrder = 3
                        end
                        object dbeQTDTOTINTEGRALIZA: TDBRealEdit
                          Left = 131
                          Top = 192
                          Width = 177
                          Height = 21
                          Alignment = taRightJustify
                          Color = clSilver
                          Enabled = False
                          Lines.Strings = (
                            '0,00')
                          TabOrder = 4
                          WordWrap = False
                          IntDigits = 10
                          DecDigits = 2
                          NumberFormat = fNumber
                          Signal = False
                          DataField = 'QTDTOTINTEGRALIZA'
                          DataSource = ds
                        end
                      end
                    end
                  end
                end
              end
            end
            object tbsAnbid: TTabSheet
              Caption = 'ANBID'
              ImageIndex = 3
              object pnlAnbid: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 249
                Align = alClient
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object lblClassAnbid: TLabel
                  Left = 14
                  Top = 56
                  Width = 80
                  Height = 13
                  Caption = 'Classificação '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 14
                  Top = 10
                  Width = 44
                  Height = 13
                  Caption = 'Código '
                end
                object dblkClassAnbid: TCMDBLookupCombo
                  Left = 14
                  Top = 71
                  Width = 475
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCLASSIFANBID'#9'60'#9'Descrição'#9'F')
                  DataField = 'IDCLASSIFANBID'
                  DataSource = ds
                  LookupTable = qryClassAnbid
                  LookupField = 'IDCLASSIFANBID'
                  Options = [loColLines, loRowLines, loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dbeCodAnbid: TwwDBEdit
                  Left = 14
                  Top = 25
                  Width = 155
                  Height = 21
                  DataField = 'CODANBID'
                  DataSource = ds
                  MaxLength = 18
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object tbsCetip: TTabSheet
              Caption = 'CETIP'
              ImageIndex = 4
              object pnlCetip: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 249
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Label11: TLabel
                  Left = 14
                  Top = 58
                  Width = 67
                  Height = 13
                  Caption = 'Contraparte'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 14
                  Top = 10
                  Width = 79
                  Height = 13
                  Caption = 'Código Fundo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbeContrCetip: TDBEdit
                  Left = 14
                  Top = 73
                  Width = 251
                  Height = 21
                  DataField = 'CONTRCETIP'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object dbeCodFdoCetip: TDBEdit
                  Left = 14
                  Top = 25
                  Width = 121
                  Height = 21
                  DataField = 'CODFUNCETIP'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object tbsIntegra: TTabSheet
              Caption = 'Integração'
              ImageIndex = 4
              object pnlIntegracao: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 249
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object pnlBloqInt: TPanel
                  Left = 1
                  Top = 1
                  Width = 674
                  Height = 26
                  Align = alTop
                  Alignment = taRightJustify
                  TabOrder = 0
                  object pnlMensBloqInt: TPanel
                    Left = 261
                    Top = 1
                    Width = 412
                    Height = 24
                    Align = alClient
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Caption = 'Integra'
                    Color = 9953674
                    TabOrder = 0
                  end
                  object Panel37: TPanel
                    Left = 1
                    Top = 1
                    Width = 260
                    Height = 24
                    Align = alLeft
                    Alignment = taLeftJustify
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    TabOrder = 1
                    object chkFlgContabFinan: TDBCheckBox
                      Tag = 5
                      Left = 8
                      Top = 4
                      Width = 225
                      Height = 17
                      Hint = 
                        'Este parâmetros impedem que seja executada a integração contábil' +
                        ' e financeira '
                      Alignment = taLeftJustify
                      Caption = 'Contábil / Financeiro'
                      DataField = 'FLGCONTABFINAN'
                      DataSource = ds
                      TabOrder = 0
                      ValueChecked = 'N'
                      ValueUnchecked = 'S'
                      OnClick = chkFlgContabFinanClick
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 696
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        DropdownMenu = pmnExcluir
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 524
      DockPos = 669
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 355
      DockPos = 500
    end
    inline fraMensagem: TfraMensagem
      Width = 329
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 329
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 170
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 168
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 171
          Width = 157
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 155
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 247
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Top = 50
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNDOINVEST'
      'set'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST,'
      '  CNPJFUNDO = :CNPJFUNDO,'
      '  STAEXCLUSIVO = :STAEXCLUSIVO,'
      '  PZOCARENCIA = :PZOCARENCIA,'
      '  PZOANIVERSARIO = :PZOANIVERSARIO,'
      '  PZOLIQAPLIC = :PZOLIQAPLIC,'
      '  PZOLIQRESG = :PZOLIQRESG,'
      '  QTDDECQTD = :QTDDECQTD,'
      '  QTDDECVALOR = :QTDDECVALOR,'
      '  STAFUNDO = :STAFUNDO,'
      '  PZOAMORTIZACAO = :PZOAMORTIZACAO,'
      '  PERCTXPERFORM = :PERCTXPERFORM,'
      '  PERCTXADM = :PERCTXADM,'
      '  CODFUNCETIP = :CODFUNCETIP,'
      '  STAPROVISIONAIR = :STAPROVISIONAIR,'
      '  STAPROVISIONAIOF = :STAPROVISIONAIOF,'
      '  CONTRCETIP = :CONTRCETIP,'
      '  IDCATEGORIAFUNDO = :IDCATEGORIAFUNDO,'
      '  DATAINICIOFUNDO = :DATAINICIOFUNDO,'
      '  PZOCOTAPLIC = :PZOCOTAPLIC,'
      '  PZOCOTRESG = :PZOCOTRESG,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  IDREGRA = :IDREGRA,'
      '  VLRCOTAINICIAL = :VLRCOTAINICIAL,'
      '  MOECORCOTA = :MOECORCOTA,'
      '  DTAVIGENCIA = :DTAVIGENCIA,'
      '  IDCARTEIRASPC = :IDCARTEIRASPC,'
      '  QTDTOTINTEGRALIZA = :QTDTOTINTEGRALIZA,'
      '  IDCLASSIFANBID = :IDCLASSIFANBID,'
      '  IDADMFDOINVEST = :IDADMFDOINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  CODISIN = :CODISIN,'
      '  CODANBID = :CODANBID,'
      '  FLGCONTABFINAN = :FLGCONTABFINAN'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST'
      ' ')
    InsertSQL.Strings = (
      'insert into HISTFUNDOINVEST'
      
        '  (DESCFUNDOINVEST, IDGESTORCARTEIRA, MOECODIGO, IDCARTEIRAINVES' +
        'T, IDTIPOFUNDOINVEST,'
      
        '   CNPJFUNDO, STAEXCLUSIVO, PZOCARENCIA, PZOANIVERSARIO, PZOLIQA' +
        'PLIC, PZOLIQRESG,'
      
        '   QTDDECQTD, QTDDECVALOR, STAFUNDO, PZOAMORTIZACAO, PERCTXPERFO' +
        'RM, PERCTXADM,'
      
        '   CODFUNCETIP, STAPROVISIONAIR, STAPROVISIONAIOF, CONTRCETIP, I' +
        'DCATEGORIAFUNDO,'
      
        '   DATAINICIOFUNDO, PZOCOTAPLIC, PZOCOTRESG, DATACOTIZACAO, IDRE' +
        'GRA, VLRCOTAINICIAL,'
      
        '   MOECORCOTA, DTAVIGENCIA, IDCARTEIRASPC, QTDTOTINTEGRALIZA, ID' +
        'CLASSIFANBID,'
      
        '   IDADMFDOINVEST, IDCUSTODIANTE, CODISIN, CODANBID, IDFUNDOINVE' +
        'ST, :FLGCONTABFINAN)'
      'values'
      
        '  (:DESCFUNDOINVEST, :IDGESTORCARTEIRA, :MOECODIGO, :IDCARTEIRAI' +
        'NVEST,'
      
        '   :IDTIPOFUNDOINVEST, :CNPJFUNDO, :STAEXCLUSIVO, :PZOCARENCIA, ' +
        ':PZOANIVERSARIO,'
      
        '   :PZOLIQAPLIC, :PZOLIQRESG, :QTDDECQTD, :QTDDECVALOR, :STAFUND' +
        'O, :PZOAMORTIZACAO,'
      
        '   :PERCTXPERFORM, :PERCTXADM, :CODFUNCETIP, :STAPROVISIONAIR, :' +
        'STAPROVISIONAIOF,'
      
        '   :CONTRCETIP, :IDCATEGORIAFUNDO, :DATAINICIOFUNDO, :PZOCOTAPLI' +
        'C, :PZOCOTRESG,'
      
        '   :DATACOTIZACAO, :IDREGRA, :VLRCOTAINICIAL, :MOECORCOTA, :DTAV' +
        'IGENCIA,'
      
        '   :IDCARTEIRASPC, :QTDTOTINTEGRALIZA, :IDCLASSIFANBID, :IDADMFD' +
        'OINVEST,'
      
        '   :IDCUSTODIANTE, :CODISIN, :CODANBID, :IDFUNDOINVEST, :FLGCONT' +
        'ABFINAN)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTFUNDOINVEST'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 266
    Top = 50
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'HISTFUNDOINVEST.DESCFUNDOINVEST'
      'PESSOA.NOME'
      'CATEGORIAFUNDO.NOMECATEGFUNDO'
      'ADMFDOINVEST.DESADMFDOINVEST'
      'HISTFUNDOINVEST.DTAVIGENCIA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Gestor'
      'Categoria'
      'Administrador'
      'Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTFUNDOINVEST'
      'PESSOA'
      'CATEGORIAFUNDO'
      'TIPOFUNDOINVEST'
      'ADMFDOINVEST')
    CamposChave.Strings = (
      'HISTFUNDOINVEST.IDFUNDOINVEST'
      'HISTFUNDOINVEST.DTAVIGENCIA'
      'HISTFUNDOINVEST.IDADMFDOINVEST')
    Filtro.Strings = (
      
        'HISTFUNDOINVEST.IDCATEGORIAFUNDO = CATEGORIAFUNDO.IDCATEGORIAFUN' +
        'DO(+)'
      
        'HISTFUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOI' +
        'NVEST'
      'HISTFUNDOINVEST.IDGESTORCARTEIRA = PESSOA.IDPESSOA(+)'
      'HISTFUNDOINVEST.IDADMFDOINVEST = ADMFDOINVEST.IDADMFDOINVEST (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
      '40'
      '100'
      '18')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 262
  end
  inherited ImlPadrao: TImageList
    Left = 277
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084840000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000084000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000008400000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000008400000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000008400000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 291
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   HF.DESCFUNDOINVEST   , HF.IDGESTORCARTEIRA  , HF.MOECODIGO   ' +
        '   ,'
      
        '   HF.IDCARTEIRAINVEST  , HF.IDTIPOFUNDOINVEST , HF.CNPJFUNDO   ' +
        '      , HF.STAEXCLUSIVO   ,'
      
        '   HF.PZOCARENCIA       , HF.PZOANIVERSARIO    , HF.PZOLIQAPLIC ' +
        '      , HF.PZOLIQRESG     ,'
      
        '   HF.QTDDECQTD         , HF.QTDDECVALOR       , HF.STAFUNDO    ' +
        '      , HF.PZOAMORTIZACAO ,'
      
        '   HF.PERCTXPERFORM     , HF.PERCTXADM         , HF.CODFUNCETIP ' +
        '      , HF.STAPROVISIONAIR,'
      
        '   HF.STAPROVISIONAIOF  , HF.CONTRCETIP        , HF.IDCATEGORIAF' +
        'UNDO  , HF.DATAINICIOFUNDO,'
      
        '   HF.PZOCOTAPLIC       , HF.PZOCOTRESG        , HF.DATACOTIZACA' +
        'O     , HF.IDREGRA        ,'
      
        '   HF.VLRCOTAINICIAL    , HF.MOECORCOTA        , HF.DTAVIGENCIA ' +
        '      , HF.IDCARTEIRASPC,'
      
        '   HF.QTDTOTINTEGRALIZA , HF.IDFUNDOINVEST     , HF.IDCLASSIFANB' +
        'ID    , HF.IDADMFDOINVEST,'
      
        '   HF.IDCUSTODIANTE     , HF.CODISIN           , HF.CODANBID    ' +
        '      , HF.FLGCONTABFINAN  '
      'FROM'
      '   HISTFUNDOINVEST HF'
      'WHERE'
      '   HF.IDFUNDOINVEST = :IDFUNDOINVEST AND'
      
        '   (((:DTAVIGENCIA IS NOT NULL) AND (HF.DTAVIGENCIA = TO_DATE(:D' +
        'TAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39'))) OR'
      '     (:DTAVIGENCIA IS NULL))'
      'ORDER BY HF.DTAVIGENCIA DESC'
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
      ' ')
    ControlType.Strings = (
      'IDGESTORCARTEIRA;CustomEdit;dblGestorCarteira')
    Left = 240
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptResult
      end>
    object qryDTAVIGENCIA: TDateTimeField
      Tag = 30
      DisplayLabel = 'Data de Vigência'
      DisplayWidth = 22
      FieldName = 'DTAVIGENCIA'
      Origin = 'BASEDADOS.HISTFUNDOINVEST.DTAVIGENCIA'
    end
    object qryDESCFUNDOINVEST: TStringField
      Tag = 1
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryNomeGestor: TStringField
      Tag = 99
      DisplayLabel = 'Gestor'
      DisplayWidth = 26
      FieldKind = fkLookup
      FieldName = 'NomeGestor'
      LookupDataSet = qryGestorCart
      LookupKeyFields = 'IDGESTORCARTEIRA'
      LookupResultField = 'NOME'
      KeyFields = 'IDGESTORCARTEIRA'
      Size = 60
      Lookup = True
    end
    object qryIDGESTORCARTEIRA: TFloatField
      Tag = 2
      DisplayLabel = 'Gestor'
      DisplayWidth = 18
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryMOECODIGO: TFloatField
      Tag = 3
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      Tag = 4
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDTIPOFUNDOINVEST: TFloatField
      Tag = 5
      DisplayWidth = 18
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryCNPJFUNDO: TStringField
      Tag = 6
      DisplayWidth = 20
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qrySTAEXCLUSIVO: TStringField
      Tag = 7
      DisplayWidth = 13
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPZOCARENCIA: TFloatField
      Tag = 8
      DisplayWidth = 12
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object qryPZOANIVERSARIO: TFloatField
      Tag = 9
      DisplayWidth = 15
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object qryPZOLIQAPLIC: TFloatField
      Tag = 10
      DisplayWidth = 11
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object qryPZOLIQRESG: TFloatField
      Tag = 11
      DisplayWidth = 11
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object qryQTDDECQTD: TFloatField
      Tag = 12
      DisplayWidth = 11
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object qryQTDDECVALOR: TFloatField
      Tag = 13
      DisplayWidth = 13
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object qrySTAFUNDO: TStringField
      Tag = 14
      DisplayWidth = 9
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPZOAMORTIZACAO: TFloatField
      Tag = 15
      DisplayWidth = 16
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object qryPERCTXPERFORM: TFloatField
      Tag = 16
      DisplayWidth = 15
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object qryPERCTXADM: TFloatField
      Tag = 17
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object qryCODFUNCETIP: TStringField
      Tag = 18
      DisplayWidth = 30
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qrySTAPROVISIONAIR: TStringField
      Tag = 19
      DisplayWidth = 16
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySTAPROVISIONAIOF: TStringField
      Tag = 20
      DisplayWidth = 17
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCONTRCETIP: TStringField
      Tag = 21
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryIDCATEGORIAFUNDO: TFloatField
      Tag = 22
      DisplayWidth = 18
      FieldName = 'IDCATEGORIAFUNDO'
      Visible = False
    end
    object qryDATAINICIOFUNDO: TDateTimeField
      Tag = 23
      DisplayWidth = 18
      FieldName = 'DATAINICIOFUNDO'
      Visible = False
    end
    object qryPZOCOTAPLIC: TFloatField
      Tag = 24
      DisplayWidth = 12
      FieldName = 'PZOCOTAPLIC'
      Visible = False
    end
    object qryPZOCOTRESG: TFloatField
      Tag = 25
      DisplayWidth = 12
      FieldName = 'PZOCOTRESG'
      Visible = False
    end
    object qryDATACOTIZACAO: TDateTimeField
      Tag = 26
      DisplayWidth = 18
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object qryVLRCOTAINICIAL: TFloatField
      Tag = 28
      DisplayWidth = 14
      FieldName = 'VLRCOTAINICIAL'
      Visible = False
    end
    object qryIDREGRA: TFloatField
      Tag = 27
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Visible = False
    end
    object qryMOECORCOTA: TFloatField
      Tag = 29
      DisplayWidth = 12
      FieldName = 'MOECORCOTA'
      Visible = False
    end
    object qryIDCARTEIRASPC: TFloatField
      Tag = 31
      FieldName = 'IDCARTEIRASPC'
      Visible = False
    end
    object qryQTDTOTINTEGRALIZA: TFloatField
      Tag = 32
      FieldName = 'QTDTOTINTEGRALIZA'
      Visible = False
    end
    object qryIDCLASSIFANBID: TFloatField
      Tag = 33
      FieldName = 'IDCLASSIFANBID'
      Visible = False
    end
    object qryIDADMFDOINVEST: TFloatField
      Tag = 34
      FieldName = 'IDADMFDOINVEST'
      Visible = False
    end
    object qryIDCUSTODIANTE: TFloatField
      Tag = 35
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryCODISIN: TStringField
      Tag = 36
      FieldName = 'CODISIN'
      Visible = False
      Size = 14
    end
    object qryCODANBID: TFloatField
      Tag = 37
      FieldName = 'CODANBID'
      Visible = False
    end
    object qryIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryFLGCONTABFINAN: TStringField
      Tag = 38
      FieldName = 'FLGCONTABFINAN'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 592
    Top = 65531
  end
  object qryTipoFundo: TwwQuery
    AfterOpen = qryTipoFundoAfterOpen
    BeforePost = qryTipoFundoBeforePost
    AfterPost = qryTipoFundoAfterPost
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV'
      'FROM TIPOFUNDOINVEST ')
    ValidateWithMask = True
    Left = 64
    Top = 202
    object qryTipoFundoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryTipoFundoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT G.IDGESTORCARTEIRA, P.IDPESSOA, P.NOME, P.NUMDOCUMENTO, T' +
        '.MASCARA, T.FISICAJURIDICA'
      'FROM   PESSOA P, GESTORCARTEIRA G, DOCPESSOA D, TIPODOCPESSOA T'
      'WHERE'
      '      (P.IDPESSOA       = G.IDGESTORCARTEIRA)'
      'AND   (D.IDPESSOA       = P.IDPESSOA)'
      'AND   (T.IDDOCUMENTO    = D.IDDOCUMENTO)'
      'AND   (T.IDREGRA = -1)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 247
    object qryGestorCartNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryGestorCartIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'GESTORCARTEIRA.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
    object qryGestorCartNUMDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 25
    end
    object qryGestorCartMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      FixedChar = True
      Size = 30
    end
    object qryGestorCartFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      FixedChar = True
      Size = 1
    end
  end
  object qryCarteiraInvest: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select * From CarteiraInvest')
    ValidateWithMask = True
    Left = 416
    Top = 75
    object qryCarteiraInvestDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraInvestIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryCarteiraInvestFLGCARTPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCARTPROP'
      Origin = 'CARTEIRAINVEST.FLGCARTPROP'
      Visible = False
    end
    object qryCarteiraInvestFLGCALCDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCALCDIARIO'
      Origin = 'CARTEIRAINVEST.FLGCALCDIARIO'
      Visible = False
      Size = 1
    end
    object qryCarteiraInvestDATAINICIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'CARTEIRAINVEST.DATAINICIO'
      Visible = False
    end
    object qryCarteiraInvestFLGTRATALOTE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATALOTE'
      Origin = 'CARTEIRAINVEST.TRGDTINCLUSAO'
      Visible = False
      Size = 1
    end
    object qryCarteiraInvestTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'CARTEIRAINVEST.TRGUSERINCLUSAO'
      Visible = False
    end
    object qryCarteiraInvestTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'CARTEIRAINVEST.FLGTRATALOTE'
      Visible = False
      Size = 30
    end
    object qryCarteiraInvestIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'CARTEIRAINVEST.IDPLANOPREV'
      Visible = False
    end
    object qryCarteiraInvestIDPATROCINADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATROCINADORA'
      Origin = 'CARTEIRAINVEST.IDPATROCINADORA'
      Visible = False
    end
    object qryCarteiraInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'CARTEIRAINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryCarteiraInvestIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'CARTEIRAINVEST.IDMERCADO'
      Visible = False
    end
    object qryCarteiraInvestFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'CARTEIRAINVEST.FLGORDMOVINV'
      Visible = False
      Size = 1
    end
  end
  object qryINDICE: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select * From MOEDA')
    ValidateWithMask = True
    Left = 608
    Top = 237
    object qryINDICEMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryINDICEMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
    object qryINDICEIDUSUARIOINCLUSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'MOEDA.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryINDICEMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Visible = False
      Size = 10
    end
    object qryINDICEMOEPERIODICIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
    object qryINDICEMOEINATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Visible = False
      Size = 1
    end
    object qryINDICEFLGPERCVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object qryINDICEFATORCONVERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'FATORCONVERSAO'
      Origin = 'MOEDA.FATORCONVERSAO'
      Visible = False
    end
    object qryINDICEDATAINICIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
      Visible = False
    end
    object qryINDICEDATAFIM: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
      Visible = False
    end
    object qryINDICEMOEDAREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'MOEDAREFERENCIA'
      Origin = 'MOEDA.MOEDAREFERENCIA'
      Visible = False
    end
    object qryINDICETRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'MOEDA.TRGDTINCLUSAO'
      Visible = False
    end
    object qryINDICETRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'MOEDA.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryINDICEFLGTIPOPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOPRAZO'
      Origin = 'MOEDA.FLGTIPOPRAZO'
      Visible = False
      Size = 1
    end
    object qryINDICEFLGPERIODO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERIODO'
      Origin = 'MOEDA.FLGPERIODO'
      Visible = False
      Size = 1
    end
  end
  object qryCategFundo: TwwQuery
    AfterOpen = qryTipoFundoAfterOpen
    BeforePost = qryTipoFundoBeforePost
    AfterPost = qryTipoFundoAfterPost
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDCATEGORIAFUNDO, NOMECATEGFUNDO'
      'FROM CATEGORIAFUNDO'
      'ORDER BY NOMECATEGFUNDO')
    ValidateWithMask = True
    Left = 600
    Top = 186
    object qryCategFundoNOMECATEGFUNDO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'NOMECATEGFUNDO'
      Origin = 'BASEDADOS.CATEGORIAFUNDO.NOMECATEGFUNDO'
      FixedChar = True
      Size = 10
    end
    object qryCategFundoIDCATEGORIAFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCATEGORIAFUNDO'
      Origin = 'BASEDADOS.CATEGORIAFUNDO.IDCATEGORIAFUNDO'
      Visible = False
    end
  end
  object qryRegraInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      GR.DESCRICAO = '#39'INVESTIMENTO'#39' AND'
      
        '      (((:IDTIPOREGRA IS NOT NULL) AND (TR.IDTIPOREGRA = :IDTIPO' +
        'REGRA)) OR'
      '        (:IDTIPOREGRA IS NULL))'
      'ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 621
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraInvestNOMEREGRA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraInvestIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryMoeCorCot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC, MOESIGLA'
      'FROM MOEDA'
      'WHERE MOESIGLA LIKE '#39'INV_%'#39' OR '
      '      MOESIGLA LIKE '#39'%CDI%'#39
      'ORDER BY MOESIGLA')
    ValidateWithMask = True
    Left = 568
    Top = 341
    object qryMoeCorCotMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoeCorCotMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'BASEDADOS.MOEDA.MOEDESC'
    end
    object qryMoeCorCotMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryUpdFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FUNDOINVEST'
      'SET DESCFUNDOINVEST   = :DESCFUNDOINVEST,'
      '    IDGESTORCARTEIRA  = :IDGESTORCARTEIRA,'
      '    MOECODIGO         = :MOECODIGO,'
      '    IDCARTEIRAINVEST  = :IDCARTEIRAINVEST,'
      '    IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST,'
      '    CNPJFUNDO         = :CNPJFUNDO,'
      '    STAEXCLUSIVO      = :STAEXCLUSIVO,'
      '    PZOCARENCIA       = :PZOCARENCIA,'
      '    PZOANIVERSARIO    = :PZOANIVERSARIO,'
      '    PZOLIQAPLIC       = :PZOLIQAPLIC,'
      '    PZOLIQRESG        = :PZOLIQRESG,'
      '    QTDDECQTD         = :QTDDECQTD,'
      '    QTDDECVALOR       = :QTDDECVALOR,'
      '    STAFUNDO          = :STAFUNDO,'
      '    PZOAMORTIZACAO    = :PZOAMORTIZACAO,'
      '    PERCTXPERFORM     = :PERCTXPERFORM,'
      '    PERCTXADM         = :PERCTXADM,'
      '    CODFUNCETIP       = :CODFUNCETIP,'
      '    STAPROVISIONAIR   = :STAPROVISIONAIR,'
      '    STAPROVISIONAIOF  = :STAPROVISIONAIOF,'
      '    CONTRCETIP        = :CONTRCETIP,'
      '    IDCATEGORIAFUNDO  = :IDCATEGORIAFUNDO,'
      '    DATAINICIOFUNDO   = TO_DATE(:DATAINICIOFUNDO,'#39'DD/MM/YYYY'#39'),'
      '    PZOCOTAPLIC       = :PZOCOTAPLIC,'
      '    PZOCOTRESG        = :PZOCOTRESG,'
      '    DATACOTIZACAO     = TO_DATE(:DATACOTIZACAO,'#39'DD/MM/YYYY'#39'),'
      '    IDREGRA           = :IDREGRA,'
      '    VLRCOTAINICIAL    = :VLRCOTAINICIAL,'
      '    MOECORCOTA        = :MOECORCOTA,'
      
        '    DTAVIGENCIA       = TO_DATE(:DTAVIGENCIA,'#39'DD/MM/YYYY HH24:MI' +
        ':SS'#39'),'
      '    IDCARTEIRASPC     = :IDCARTEIRASPC,'
      '    QTDTOTINTEGRALIZA = :QTDTOTINTEGRALIZA,'
      '    IDCLASSIFANBID    = :IDCLASSIFANBID,'
      '    IDADMFDOINVEST    = :IDADMFDOINVEST,'
      '    IDCUSTODIANTE     = :IDCUSTODIANTE,'
      '    CODISIN           = :CODISIN,'
      '    CODANBID          = :CODANBID,'
      '    FLGCONTABFINAN    = :FLGCONTABFINAN'
      'WHERE'
      '    IDFUNDOINVEST     = :IDFUNDOINVEST')
    ValidateWithMask = True
    Left = 534
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAEXCLUSIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCARENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOANIVERSARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQRESG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECQTD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOAMORTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXPERFORM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXADM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODFUNCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIOF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTRCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCATEGORIAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINICIOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTRESG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECORCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRASPC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDTOTINTEGRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSIFANBID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADMFDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODISIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODANBID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCONTABFINAN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object qryInsFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FUNDOINVEST'
      
        '       (IDFUNDOINVEST, DESCFUNDOINVEST, IDGESTORCARTEIRA, MOECOD' +
        'IGO, IDCARTEIRAINVEST, IDTIPOFUNDOINVEST,'
      
        '        CNPJFUNDO, STAEXCLUSIVO, PZOCARENCIA, PZOANIVERSARIO, PZ' +
        'OLIQAPLIC, PZOLIQRESG,'
      
        '        QTDDECQTD, QTDDECVALOR, STAFUNDO, PZOAMORTIZACAO, PERCTX' +
        'PERFORM, PERCTXADM, CODFUNCETIP,'
      
        '        STAPROVISIONAIR, STAPROVISIONAIOF, CONTRCETIP, IDCATEGOR' +
        'IAFUNDO, DATAINICIOFUNDO,'
      
        '        PZOCOTAPLIC, PZOCOTRESG, DATACOTIZACAO, IDREGRA, VLRCOTA' +
        'INICIAL,'
      
        '        MOECORCOTA, DTAVIGENCIA, IDCARTEIRASPC, QTDTOTINTEGRALIZ' +
        'A, IDCLASSIFANBID, IDADMFDOINVEST,'
      '        IDCUSTODIANTE, CODISIN, CODANBID, FLGCONTABFINAN)'
      
        'VALUES (:IDFUNDOINVEST, :DESCFUNDOINVEST, :IDGESTORCARTEIRA, :MO' +
        'ECODIGO, :IDCARTEIRAINVEST, :IDTIPOFUNDOINVEST,'
      
        '        :CNPJFUNDO, :STAEXCLUSIVO, :PZOCARENCIA, :PZOANIVERSARIO' +
        ', :PZOLIQAPLIC, :PZOLIQRESG,'
      
        '        :QTDDECQTD, :QTDDECVALOR, :STAFUNDO, :PZOAMORTIZACAO, :P' +
        'ERCTXPERFORM, :PERCTXADM, :CODFUNCETIP,'
      
        '        :STAPROVISIONAIR, :STAPROVISIONAIOF, :CONTRCETIP, :IDCAT' +
        'EGORIAFUNDO, TO_DATE(:DATAINICIOFUNDO,'#39'DD/MM/YYYY'#39'),'
      
        '        :PZOCOTAPLIC, :PZOCOTRESG, TO_DATE(:DATACOTIZACAO,'#39'DD/MM' +
        '/YYYY'#39'), :IDREGRA, :VLRCOTAINICIAL,'
      
        '        :MOECORCOTA, TO_DATE(:DTAVIGENCIA,'#39'DD/MM/YYYY HH24:MI:SS' +
        #39'), :IDCARTEIRASPC, :QTDTOTINTEGRALIZA,'
      
        '        :IDCLASSIFANBID, :IDADMFDOINVEST, :IDCUSTODIANTE, :CODIS' +
        'IN, :CODANBID, :FLGCONTABFINAN)'
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
    ValidateWithMask = True
    Left = 450
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAEXCLUSIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCARENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOANIVERSARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQRESG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECQTD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOAMORTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXPERFORM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXADM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODFUNCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIOF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTRCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCATEGORIAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINICIOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTRESG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECORCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRASPC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDTOTINTEGRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSIFANBID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADMFDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODISIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODANBID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCONTABFINAN'
        ParamType = ptInput
      end>
  end
  object qryInsHistFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTFUNDOINVEST'
      
        '       (IDFUNDOINVEST, DESCFUNDOINVEST, IDGESTORCARTEIRA, MOECOD' +
        'IGO, IDCARTEIRAINVEST, IDTIPOFUNDOINVEST,'
      
        '        CNPJFUNDO, STAEXCLUSIVO, PZOCARENCIA, PZOANIVERSARIO, PZ' +
        'OLIQAPLIC, PZOLIQRESG,'
      
        '        QTDDECQTD, QTDDECVALOR, STAFUNDO, PZOAMORTIZACAO, PERCTX' +
        'PERFORM, PERCTXADM, CODFUNCETIP,'
      
        '        STAPROVISIONAIR, STAPROVISIONAIOF, CONTRCETIP, IDCATEGOR' +
        'IAFUNDO, DATAINICIOFUNDO,'
      
        '        PZOCOTAPLIC, PZOCOTRESG, DATACOTIZACAO, IDREGRA, VLRCOTA' +
        'INICIAL,'
      
        '        MOECORCOTA, DTAVIGENCIA, IDCARTEIRASPC, QTDTOTINTEGRALIZ' +
        'A,'
      
        '        IDCLASSIFANBID, IDADMFDOINVEST, IDCUSTODIANTE, CODISIN, ' +
        'CODANBID, FLGCONTABFINAN)'
      
        'VALUES (:IDFUNDOINVEST, :DESCFUNDOINVEST, :IDGESTORCARTEIRA, :MO' +
        'ECODIGO, :IDCARTEIRAINVEST, :IDTIPOFUNDOINVEST,'
      
        '        :CNPJFUNDO, :STAEXCLUSIVO, :PZOCARENCIA, :PZOANIVERSARIO' +
        ', :PZOLIQAPLIC, :PZOLIQRESG,'
      
        '        :QTDDECQTD, :QTDDECVALOR, :STAFUNDO, :PZOAMORTIZACAO, :P' +
        'ERCTXPERFORM, :PERCTXADM, :CODFUNCETIP,'
      
        '        :STAPROVISIONAIR, :STAPROVISIONAIOF, :CONTRCETIP, :IDCAT' +
        'EGORIAFUNDO, TO_DATE(:DATAINICIOFUNDO,'#39'DD/MM/YYYY'#39'),'
      
        '        :PZOCOTAPLIC, :PZOCOTRESG, TO_DATE(:DATACOTIZACAO,'#39'DD/MM' +
        '/YYYY'#39'), :IDREGRA, :VLRCOTAINICIAL,'
      
        '        :MOECORCOTA, TO_DATE(:DTAVIGENCIA,'#39'DD/MM/YYYY HH24:MI:SS' +
        #39'), :IDCARTEIRASPC, :QTDTOTINTEGRALIZA,'
      
        '        :IDCLASSIFANBID, :IDADMFDOINVEST, :IDCUSTODIANTE, :CODIS' +
        'IN, :CODANBID, :FLGCONTABFINAN)')
    ValidateWithMask = True
    Left = 374
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAEXCLUSIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCARENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOANIVERSARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOLIQRESG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECQTD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDECVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOAMORTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXPERFORM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCTXADM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODFUNCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAPROVISIONAIOF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTRCETIP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCATEGORIAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINICIOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PZOCOTRESG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECORCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRASPC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDTOTINTEGRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSIFANBID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDADMFDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODISIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODANBID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCONTABFINAN'
        ParamType = ptInput
      end>
  end
  object pmnExcluir: TPopupMenu
    Left = 312
    Top = 2
    object mnuHistorico: TMenuItem
      Caption = 'Histórico'
      OnClick = mnuHistoricoClick
    end
    object mnuFundo: TMenuItem
      Caption = 'Fundo'
      OnClick = mnuFundoClick
    end
  end
  object qryCarteiraSPC: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT * '
      'FROM CARTEIRASPC'
      'ORDER BY DESCARTEIRASPC')
    ValidateWithMask = True
    Left = 496
    Top = 73
    object qryCarteiraSPCDESCARTEIRASPC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.DESCARTEIRASPC'
      Size = 60
    end
    object qryCarteiraSPCIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.IDCARTEIRASPC'
      Visible = False
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 571
    Top = 287
  end
  object qryClassAnbid: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CLASSIFANBID'
      'WHERE DATAVIGENCIA IN (SELECT MAX(DATAVIGENCIA)'
      '                    FROM CLASSIFANBID'
      
        '                    WHERE DATAVIGENCIA <= TO_DATE(:DTAVIGENCIA,'#39 +
        'DD/MM/YYYY'#39'))'
      '   AND CLASSIFANALIT = '#39'A'#39
      'ORDER BY CODCLASSIFANBID'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 547
    Top = 119
    ParamData = <
      item
        DataType = ftString
        Name = 'DTAVIGENCIA'
        ParamType = ptInput
      end>
  end
  object qryAdmFdoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.IDADMFDOINVEST, A.DESADMFDOINVEST, P.IDPESSOA, P.NUMDOC' +
        'UMENTO, T.MASCARA, T.FISICAJURIDICA'
      'FROM   PESSOA P, ADMFDOINVEST A, DOCPESSOA D, TIPODOCPESSOA T'
      'WHERE (P.IDPESSOA       = A.IDADMFDOINVEST)'
      'AND   (D.IDPESSOA       = P.IDPESSOA)'
      'AND   (T.IDDOCUMENTO    = D.IDDOCUMENTO)'
      'AND   (T.IDREGRA = -1)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 59
    Top = 303
    object qryAdmFdoInvestDESADMFDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESADMFDOINVEST'
      Origin = 'BASEDADOS.ADMFDOINVEST.DESADMFDOINVEST'
      Size = 100
    end
    object qryAdmFdoInvestIDADMFDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDADMFDOINVEST'
      Origin = 'BASEDADOS.ADMFDOINVEST.IDADMFDOINVEST'
      Visible = False
    end
    object qryAdmFdoInvestIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryAdmFdoInvestNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.PESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryAdmFdoInvestMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      FixedChar = True
      Size = 30
    end
    object qryAdmFdoInvestFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      FixedChar = True
      Size = 1
    end
  end
  object dsGestorCart: TwwDataSource
    AutoEdit = False
    DataSet = qryGestorCart
    Left = 126
    Top = 258
  end
  object Pessoa: TPessoa
    MudaCaption = True
    TipoPessoa = tpJuridica
    SubTipo = stInstFinanceira
    MostraFoto = True
    UsaPessoaFisica = False
    SaveModuloRespon = False
    ObrigaDocumento = True
    Left = 585
    Top = 56
  end
  object dsAdmFdoInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryAdmFdoInvest
    Left = 126
    Top = 306
  end
  object QryCustodiante: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCUSTODIANTE, C.SGLCUSTODIANTE, P.IDPESSOA, P.NUMDOCUM' +
        'ENTO, T.MASCARA, T.FISICAJURIDICA'
      'FROM   PESSOA P, CUSTODIANTE C, DOCPESSOA D, TIPODOCPESSOA T'
      'WHERE (P.IDPESSOA       = C.IDCUSTODIANTE)'
      'AND   (D.IDPESSOA       = P.IDPESSOA)'
      'AND   (T.IDDOCUMENTO    = D.IDDOCUMENTO)'
      'AND   (T.IDREGRA = -1)'
      'ORDER BY P.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 59
    Top = 367
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
    object QryCustodianteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
    object QryCustodianteNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.PESSOA.NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object QryCustodianteMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QryCustodianteFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsCustodiante: TwwDataSource
    AutoEdit = False
    DataSet = QryCustodiante
    Left = 142
    Top = 362
  end
  object qryNivelRisco: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RISCOFUNDOINVEST'
      ''
      ' ')
    ValidateWithMask = True
    Left = 491
    Top = 287
    object qryNivelRiscoNOMERISCOFUNDO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'NOMERISCOFUNDO'
      Origin = 'BASEDADOS.RISCOFUNDOINVEST.NOMERISCOFUNDO'
      Size = 60
    end
    object qryNivelRiscoIDRISCOFUNDOINVES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRISCOFUNDOINVES'
      Origin = 'BASEDADOS.RISCOFUNDOINVEST.IDRISCOFUNDOINVES'
      Visible = False
    end
    object qryNivelRiscoSIGLARISCOFUNDO: TStringField
      DisplayWidth = 20
      FieldName = 'SIGLARISCOFUNDO'
      Origin = 'BASEDADOS.RISCOFUNDOINVEST.SIGLARISCOFUNDO'
      Visible = False
    end
  end
end
