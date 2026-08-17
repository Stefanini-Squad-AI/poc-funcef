inherited frmCondicaoDifTrab: TfrmCondicaoDifTrab
  Left = 101
  Top = 40
  Width = 1079
  Height = 538
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Condição Diferenciada de Trabalho'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1063
    Height = 414
    inherited pnlMestre: TPanel
      Width = 1061
      Height = 56
      object lblMatricula: TLabel
        Left = 8
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblNome: TLabel
        Left = 192
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedtMatricula: TwwDBEdit
        Left = 67
        Top = 3
        Width = 121
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtNome: TwwDBEdit
        Left = 232
        Top = 2
        Width = 465
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtSitFunc: TwwDBEdit
        Left = 8
        Top = 27
        Width = 217
        Height = 21
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtCargo: TwwDBEdit
        Left = 232
        Top = 27
        Width = 465
        Height = 21
        Color = clGray
        DataField = 'TITULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 57
      Width = 1061
      Height = 356
      Tabs.Strings = (
        'Condição Diferenciada')
      inherited pgctrlDetalhe: TPageControl
        Width = 963
        Height = 297
        inherited tbsDet: TTabSheet
          Caption = 'Condição Diferenciada'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 955
            Height = 269
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Tipo de Condição'
              'DTINICIOCONDIF'#9'10'#9'Data Início'
              'DTFIMCONDIF'#9'10'#9'Data Fim')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 955
            Height = 269
            object pgctrlSubDet: TPageControl
              Left = 0
              Top = 0
              Width = 955
              Height = 269
              ActivePage = tbsDadosGerais
              Align = alClient
              TabOrder = 0
              object tbsDadosGerais: TTabSheet
                Caption = 'Dados Gerais'
                object lblDataIni: TLabel
                  Left = 16
                  Top = 0
                  Width = 65
                  Height = 13
                  Caption = 'Data Início'
                end
                object lblDataFim: TLabel
                  Left = 125
                  Top = 0
                  Width = 51
                  Height = 13
                  Caption = 'Data Fim'
                end
                object lblTpCondicao: TLabel
                  Left = 232
                  Top = 0
                  Width = 101
                  Height = 13
                  Caption = 'Tipo de Condição'
                end
                object grbFatorRisco: TGroupBox
                  Left = 8
                  Top = 40
                  Width = 1233
                  Height = 215
                  Caption = 'Fatores de Risco'
                  TabOrder = 3
                  object lblAgenteNocivo: TLabel
                    Left = 16
                    Top = 19
                    Width = 85
                    Height = 13
                    Caption = 'Agente Nocivo'
                  end
                  object lblUtilEPC: TLabel
                    Left = 16
                    Top = 56
                    Width = 103
                    Height = 13
                    Caption = 'Utilização do EPC'
                  end
                  object lblUtilEPI: TLabel
                    Left = 16
                    Top = 95
                    Width = 99
                    Height = 13
                    Caption = 'Utilização do EPI'
                  end
                  object lblDescEPI: TLabel
                    Left = 184
                    Top = 95
                    Width = 100
                    Height = 13
                    Caption = 'Descrição do EPI'
                  end
                  object lblItenExposicao: TLabel
                    Left = 16
                    Top = 133
                    Width = 147
                    Height = 13
                    Caption = 'Intensidade da Exposição'
                  end
                  object lblTecMedicao: TLabel
                    Left = 16
                    Top = 169
                    Width = 117
                    Height = 13
                    Caption = 'Técnica de Medição'
                  end
                  object dbgrdArXCondifer: TwwDBGrid
                    Left = 424
                    Top = 16
                    Width = 798
                    Height = 188
                    Selected.Strings = (
                      'DESCRICAO'#9'30'#9'Agente Nocivo'
                      'UTILEPC2'#9'15'#9'Utilização do EPC'
                      'UTILEPI2'#9'15'#9'Utilização do EPI'
                      'DESCEPI'#9'20'#9'Descrição do EPI'
                      'IEXPOSICAO'#9'20'#9'Intensidade da Exposição'
                      'MEDICAO'#9'20'#9'Técnica de Medição')
                    IniAttributes.Delimiter = ';;'
                    TitleColor = clBtnFace
                    OnCellChanged = dbgrdArXCondiferCellChanged
                    FixedCols = 0
                    ShowHorzScrollBar = True
                    DataSource = dsArxCondifer
                    ReadOnly = True
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
                  object btnInserirARXC: TBitBtn
                    Left = 376
                    Top = 24
                    Width = 33
                    Height = 27
                    TabOrder = 7
                    OnClick = btnInserirARXCClick
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
                  object btnExcluirARXC: TBitBtn
                    Left = 376
                    Top = 51
                    Width = 33
                    Height = 27
                    Cancel = True
                    TabOrder = 8
                    OnClick = btnExcluirARXCClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                      8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                      88888887788888778F88887991919191088888788888888878F8879919191919
                      108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                      19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                      19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                      190878F877787778887887917F919F71908887F88788878887F8879919191919
                      1088878F88888888878888799191919108888878FF88888F7888888779999977
                      8888888778FFFF77888888888777778888888888877777888888}
                    NumGlyphs = 2
                    Spacing = -1
                  end
                  object dbcmbUtilEPC: TwwDBComboBox
                    Left = 16
                    Top = 70
                    Width = 156
                    Height = 21
                    ShowButton = True
                    Style = csDropDown
                    MapList = True
                    AllowClearKey = False
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Não Aplicável'#9'0'
                      'Eficaz'#9'1'
                      'Não Eficaz'#9'2')
                    Sorted = False
                    TabOrder = 2
                    UnboundDataType = wwDefault
                  end
                  object dbcmbUtilEPI: TwwDBComboBox
                    Left = 16
                    Top = 109
                    Width = 156
                    Height = 21
                    ShowButton = True
                    Style = csDropDown
                    MapList = True
                    AllowClearKey = False
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Não Aplicável'#9'0'
                      'Eficaz'#9'1'
                      'Não Eficaz'#9'2')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                  end
                  object dblkcmbAgenteRisco: TwwDBLookupCombo
                    Left = 16
                    Top = 33
                    Width = 353
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'80'#9'Descrição')
                    LookupTable = CdsAgenteRisco
                    LookupField = 'IDAGENTERISCO'
                    TabOrder = 1
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dbedtIntenExpo: TwwDBEdit
                    Left = 16
                    Top = 147
                    Width = 393
                    Height = 21
                    TabOrder = 5
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbedtDescEPI: TwwDBEdit
                    Left = 184
                    Top = 109
                    Width = 225
                    Height = 21
                    TabOrder = 4
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbedtTecMedicao: TwwDBEdit
                    Left = 16
                    Top = 183
                    Width = 393
                    Height = 21
                    TabOrder = 6
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object grbReqEPI: TGroupBox
                  Left = 8
                  Top = 256
                  Width = 1233
                  Height = 138
                  Caption = 'Requisitos EPI'
                  TabOrder = 4
                  object chkReqEPI01: TCheckBox
                    Left = 24
                    Top = 26
                    Width = 585
                    Height = 29
                    Caption = 'chkReqEPI01'
                    TabOrder = 0
                  end
                  object chkReqEPI02: TCheckBox
                    Left = 24
                    Top = 58
                    Width = 585
                    Height = 33
                    Caption = 'chkReqEPI02'
                    TabOrder = 1
                  end
                  object chkReqEPI03: TCheckBox
                    Left = 24
                    Top = 98
                    Width = 585
                    Height = 25
                    Caption = 'chkReqEPI03'
                    TabOrder = 2
                  end
                  object chkReqEPI04: TCheckBox
                    Left = 624
                    Top = 24
                    Width = 601
                    Height = 27
                    Caption = 'chkReqEPI04'
                    TabOrder = 3
                  end
                  object chkReqEPI05: TCheckBox
                    Left = 624
                    Top = 64
                    Width = 569
                    Height = 17
                    Caption = 'chkReqEPI05'
                    TabOrder = 4
                  end
                end
                object dtpDtFim: TCMDateTimePicker
                  Left = 125
                  Top = 14
                  Width = 103
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTFIMCONDIF'
                  DataSource = dsCondifer
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
                object dtpDtInicio: TCMDateTimePicker
                  Left = 16
                  Top = 14
                  Width = 103
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTINICIOCONDIF'
                  DataSource = dsCondifer
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
                object dblkcmbTipoCond: TwwDBLookupCombo
                  Left = 233
                  Top = 14
                  Width = 305
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'80'#9'Descrição')
                  DataField = 'IDTIPCONDICAO'
                  DataSource = dsCondifer
                  LookupTable = CdsTipCond
                  LookupField = 'IDTIPCONDICAO'
                  TabOrder = 2
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = True
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1053
      end
      inherited Dock974: TDock97
        Left = 967
        Height = 297
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1063
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 140
        Caption = '&Procurar Empregado'
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 461
    Width = 1063
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'P.NOME'
      'F.MATRICULA'
      'P.NUMDOCUMENTO'
      'C.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'CARGO C'
      'FUNCIONARIO F'
      'SITFUNC SF')
    CamposChave.Strings = (
      'F.IDPESSOA')
    Filtro.Strings = (
      'F.IDPESSOA = P.IDPESSOA'
      'F.IDCARGO = C.IDCARGO(+)'
      'F.IDSITFUNC = SF.IDSITFUNC(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '18'
      '25'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsCondifer
  end
  object CdsCondifer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 176
  end
  object CdsTipCond: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 176
  end
  object dsCondifer: TwwDataSource
    DataSet = CdsCondifer
    Left = 512
    Top = 224
  end
  object CdsArxCondifer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = CdsArXCondiferAfterPost
    AfterDelete = CdsArXCondiferAfterDelete
    Left = 677
    Top = 175
  end
  object dsArxCondifer: TwwDataSource
    AutoEdit = False
    DataSet = CdsArxCondifer
    Left = 680
    Top = 224
  end
  object CdsAgenteRisco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 429
    Top = 175
  end
end
