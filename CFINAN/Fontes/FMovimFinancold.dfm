inherited frmMovimFinanc: TfrmMovimFinanc
  Left = 175
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Movimento Financeiro'
  ClientHeight = 510
  ClientWidth = 740
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 424
    inherited pnlMestre: TPanel
      Width = 730
      Height = 159
      object lblMoeda: TLabel
        Left = 5
        Top = 42
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object lblHistPad: TLabel
        Left = 5
        Top = 118
        Width = 48
        Height = 13
        Caption = 'Usuário:'
      end
      object lblCaixaBanco: TLabel
        Left = 5
        Top = 5
        Width = 133
        Height = 13
        Caption = 'Conta Bancária / Caixa'
      end
      object lblData: TLabel
        Left = 450
        Top = 5
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object lblDocumento: TLabel
        Left = 439
        Top = 42
        Width = 130
        Height = 13
        Caption = 'Número do Documento'
      end
      object lblValorMoeda: TLabel
        Left = 135
        Top = 42
        Width = 127
        Height = 13
        Caption = 'Valor em Outra Moeda'
      end
      object lblValor: TLabel
        Left = 285
        Top = 42
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object lblHistorico: TLabel
        Left = 135
        Top = 82
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object Label7: TLabel
        Left = 5
        Top = 82
        Width = 95
        Height = 13
        Caption = 'Histórico Padrão'
      end
      object Label8: TLabel
        Left = 240
        Top = 118
        Width = 32
        Height = 13
        Caption = 'Data:'
      end
      object dbeDataLanc: TCMDateTimePicker
        Left = 448
        Top = 19
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCFINAN'
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
        TabOrder = 2
        OnExit = dbeDataLancExit
      end
      object dblcHistPad: TwwDBLookupCombo
        Left = 5
        Top = 96
        Width = 111
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'HISTPADFINAN'
        DataSource = ds
        LookupTable = qryHistorico
        LookupField = 'HISTPADFINAN'
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcHistPadExit
      end
      object dblcPortador: TwwDBLookupCombo
        Left = 5
        Top = 19
        Width = 196
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODPORTADOR'
        DataSource = ds
        LookupTable = qryPortador
        LookupField = 'CODPORTADOR'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcPortadorExit
      end
      object dbeDocumento: TwwDBEdit
        Left = 438
        Top = 57
        Width = 131
        Height = 21
        DataField = 'NUMCHQBORDERO'
        DataSource = ds
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeHistorico: TwwDBEdit
        Left = 133
        Top = 96
        Width = 436
        Height = 21
        DataField = 'HISTORICO'
        DataSource = ds
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrEntradaSaida: TDBRadioGroup
        Left = 225
        Top = 5
        Width = 201
        Height = 36
        Columns = 2
        DataField = 'ENTRADASAIDA'
        DataSource = ds
        Items.Strings = (
          '&Entrada'
          '&Saida')
        TabOrder = 1
        Values.Strings = (
          'E'
          'S')
        OnChange = dbrEntradaSaidaChange
      end
      object dbrConcilia: TDBRadioGroup
        Left = 580
        Top = 5
        Width = 146
        Height = 80
        Caption = 'Status Conciliação'
        DataField = 'STATUSCONCILIA'
        DataSource = ds
        Items.Strings = (
          '&Não Conciliado'
          '&Conciliado'
          'Não &Identificado'
          'Na Ca&sa')
        TabOrder = 3
        Values.Strings = (
          'N'
          'X'
          'I'
          'C')
        OnExit = dbrConciliaExit
      end
      object edMoeda: TEdit
        Left = 5
        Top = 57
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object dbeValorCorrente: TRealEdit
        Left = 285
        Top = 57
        Width = 139
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object dbeValorMoeda: TRealEdit
        Left = 135
        Top = 57
        Width = 139
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        OnEnter = dbeValorMoedaEnter
        OnExit = dbeValorMoedaExit
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object cbNaoContabiliza: TCheckBox
        Left = 580
        Top = 97
        Width = 130
        Height = 17
        Caption = 'Não &Contabilizar'
        TabOrder = 10
      end
      object dbeUsuario: TDBEdit
        Left = 5
        Top = 134
        Width = 225
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TRGUSERINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 11
      end
      object dbeData: TDBEdit
        Left = 240
        Top = 134
        Width = 153
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TRGDTINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 12
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 164
      Width = 730
      Height = 255
      Tabs.Strings = (
        'Rateios'
        'Contabilização')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdContabil')
      inherited Dock973: TDock97 [0]
        Width = 722
        object lblModulo: TLabel [0]
          Left = 90
          Top = 9
          Width = 220
          Height = 13
          Caption = 'Sistema que originou este lançamento:'
        end
        object lblNomeModulo: TLabel [1]
          Left = 321
          Top = 3
          Width = 385
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 636
        Height = 196
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 632
        Height = 196
        inherited tbsDet: TTabSheet
          Caption = 'Rateios'
          inherited dbgrdDet: TwwDBGrid
            Width = 624
            Height = 168
            Selected.Strings = (
              'NOME'#9'25'#9'Atividade'#9'F'
              'NOME_1'#9'30'#9'Centro de Responsabilidade'#9'F'
              'DESCRICAO'#9'35'#9'Tipo de Recebimento/Desembolso'#9'F'
              'MOESIGLA'#9'5'#9'Sigla'#9'F'
              'VALOROUTRAMOEDA'#9'10'#9'Valor Outra Moeda'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
              'CODTIPDOC'#9'10'#9'Código Documento'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
          end
          inherited pnlControlesDet: TPanel
            Width = 624
            Height = 168
            object pgcRateio: TPageControl
              Left = 0
              Top = 0
              Width = 624
              Height = 168
              ActivePage = tbsRateioBasico
              Align = alClient
              TabOrder = 0
              object tbsRateioBasico: TTabSheet
                Caption = 'Básico'
                object lblUnidNegoc: TLabel
                  Left = 5
                  Top = 3
                  Width = 54
                  Height = 13
                  Caption = 'Atividade'
                end
                object lblCentroRespon: TLabel
                  Left = 306
                  Top = 3
                  Width = 160
                  Height = 13
                  Caption = 'Centro de Responsabilidade'
                end
                object lblTipoRD: TLabel
                  Left = 5
                  Top = 39
                  Width = 196
                  Height = 13
                  Caption = 'Tipo de Recebimento/Desembolso'
                end
                object Label9: TLabel
                  Left = 306
                  Top = 39
                  Width = 112
                  Height = 13
                  Caption = 'Tipo de Documento'
                end
                object lblMoedaDet: TLabel
                  Left = 5
                  Top = 78
                  Width = 39
                  Height = 13
                  Caption = 'Moeda'
                end
                object lblValorOutDet: TLabel
                  Left = 152
                  Top = 78
                  Width = 127
                  Height = 13
                  Caption = 'Valor em Outra Moeda'
                end
                object lblValorDet: TLabel
                  Left = 306
                  Top = 78
                  Width = 124
                  Height = 13
                  Caption = 'Valor Moeda Corrente'
                end
                object Label1: TLabel
                  Left = 464
                  Top = 78
                  Width = 92
                  Height = 13
                  Caption = 'Centro de Custo'
                end
                object dblcUnidNegoc: TwwDBLookupCombo
                  Left = 5
                  Top = 17
                  Width = 292
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'NOME')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsDet
                  LookupTable = qryUnidNegoc
                  LookupField = 'UNIDNEGOC'
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
                object dblcCentroRespon: TwwDBLookupCombo
                  Left = 306
                  Top = 17
                  Width = 310
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'NOME'
                    'CODCENTRORESPON'#9'10'#9'CODCENTRORESPON')
                  DataField = 'CODCENTRORESPON'
                  DataSource = dsDet
                  LookupTable = qryCentroRespon
                  LookupField = 'CODCENTRORESPON'
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnChange = dbrEntradaSaidaChange
                end
                object dblcTipoRD: TwwDBLookupCombo
                  Left = 5
                  Top = 54
                  Width = 292
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'DESCRICAO'
                    'RECPAG'#9'1'#9'RECPAG'
                    'CODTIPRECDES'#9'15'#9'CODTIPRECDES')
                  DataField = 'CODTIPRECDES'
                  DataSource = dsDet
                  LookupTable = qryTipoRD
                  LookupField = 'CODTIPRECDES'
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnChange = dblcTipoRDChange
                  OnCloseUp = dblcTipoRDCloseUp
                end
                object dblcTipoDocumento: TwwDBLookupCombo
                  Left = 306
                  Top = 54
                  Width = 310
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'Descrição'#9'F'
                    'CODTIPDOC'#9'10'#9'Código'#9'F')
                  DataField = 'CODTIPDOC'
                  DataSource = dsDet
                  LookupTable = qryTipoDocumento
                  LookupField = 'CODTIPDOC'
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
                object edMoedaDet: TEdit
                  Left = 5
                  Top = 92
                  Width = 140
                  Height = 21
                  Enabled = False
                  TabOrder = 4
                end
                object dbeValorMoedaDet: TRealEdit
                  Left = 152
                  Top = 92
                  Width = 145
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 5
                  WordWrap = False
                  OnExit = dbeValorMoedaDetExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = True
                end
                object dbeValorDet: TRealEdit
                  Left = 306
                  Top = 92
                  Width = 151
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 6
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = True
                end
                object dblcCentroCusto: TwwDBLookupCombo
                  Left = 464
                  Top = 92
                  Width = 152
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'NOME'
                    'CODCENTRORESPON'#9'10'#9'CODCENTRORESPON')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsDet
                  LookupTable = qryCCusto
                  LookupField = 'CODCENTROCUSTO'
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object tbsPrevidenciario: TTabSheet
                Caption = 'Previdenciário'
                ImageIndex = 1
                object Label20: TLabel
                  Left = 8
                  Top = 8
                  Width = 54
                  Height = 13
                  Caption = 'Programa'
                end
                object Label18: TLabel
                  Left = 311
                  Top = 8
                  Width = 73
                  Height = 13
                  Caption = 'Patrocinador'
                end
                object Label19: TLabel
                  Left = 8
                  Top = 56
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object dblcPrograma: TwwDBLookupCombo
                  Left = 8
                  Top = 22
                  Width = 281
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
                  DataField = 'IDPROGRAMA'
                  DataSource = dsDet
                  LookupTable = qryPrograma
                  LookupField = 'IDPROGRAMA'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dblcPatrocinadorRateio: TwwDBLookupCombo
                  Left = 311
                  Top = 22
                  Width = 281
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
                  DataField = 'IDPATRO'
                  DataSource = dsDet
                  LookupTable = qryPatro
                  LookupField = 'IDPESSOA'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dblcPlanoPrevRateio: TwwDBLookupCombo
                  Left = 8
                  Top = 70
                  Width = 281
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'NOME')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsDet
                  LookupTable = qryPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  TabOrder = 2
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
        end
        object tbsContabil: TTabSheet
          Caption = 'Contabilização'
          object dbgrdContabil: TwwDBGrid
            Left = 0
            Top = 0
            Width = 624
            Height = 168
            Selected.Strings = (
              'PLACONTA'#9'18'#9'Conta Contábil'
              'PLANOME'#9'20'#9'Nome da Conta'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'NOME_1'#9'20'#9'Centro de Custo'
              'NOME'#9'20'#9'Atividade'
              'LACDEBCRE'#9'1'#9'D/C'
              'LACVALOR'#9'10'#9'Valor Moeda Corrente'
              'LACVALHIST'#9'10'#9'Valor Outra Moeda'
              'LACHIST1'#9'40'#9'Histórico'
              'LACHIST2'#9'40'#9'Histórico'
              'LACHIST3'#9'40'#9'Histórico')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContabil
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlContabil: TPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 168
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object pgcContabil: TPageControl
              Left = 0
              Top = 0
              Width = 624
              Height = 168
              ActivePage = tbsBasicoContab
              Align = alClient
              TabOrder = 0
              object tbsBasicoContab: TTabSheet
                Caption = 'Básico'
                object lblValorMoedaCon: TLabel
                  Left = 8
                  Top = 86
                  Width = 107
                  Height = 13
                  Caption = 'Valor Outra Moeda'
                end
                object lblValorCorrenteCon: TLabel
                  Left = 156
                  Top = 86
                  Width = 124
                  Height = 13
                  Caption = 'Valor Moeda Corrente'
                end
                object lblSubConta: TLabel
                  Left = 218
                  Top = 2
                  Width = 60
                  Height = 13
                  Caption = 'Sub-Conta'
                end
                object lblCCusto: TLabel
                  Left = 311
                  Top = 2
                  Width = 92
                  Height = 13
                  Caption = 'Centro do Custo'
                end
                object lblAtividade: TLabel
                  Left = 470
                  Top = 2
                  Width = 112
                  Height = 13
                  Caption = 'Atividade (Projetos)'
                end
                object dbccConta: TCMProcuraMaskContabil
                  Left = 6
                  Top = 3
                  Width = 209
                  Height = 77
                  Caption = ' Conta Contábil '
                  TabOrder = 4
                  OnExit = dbccContaExit
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsContabil
                  DataField = 'PLACONTA'
                  Mensagens.EmBranco = 'não pode estar em branco'
                  Mensagens.NaoExiste = 'não existe'
                  Mensagens.Sintetica = 'não pode ser sintética'
                  Mensagens.Analitica = 'não pode ser analítica'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  Plano = 0
                  Status = scSoAtiva
                end
                object reValorMoedaCon: TRealEdit
                  Left = 6
                  Top = 101
                  Width = 139
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 0
                  WordWrap = False
                  OnExit = reValorMoedaConExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object reValorCorrenteCon: TRealEdit
                  Left = 156
                  Top = 101
                  Width = 139
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object gbHistorico: TGroupBox
                  Left = 307
                  Top = 38
                  Width = 310
                  Height = 84
                  Caption = 'Histórico'
                  TabOrder = 2
                  object dbeHist1: TwwDBEdit
                    Left = 9
                    Top = 14
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST1'
                    DataSource = dsContabil
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeHist2: TwwDBEdit
                    Left = 9
                    Top = 36
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST2'
                    DataSource = dsContabil
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeHist3: TwwDBEdit
                    Left = 9
                    Top = 58
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST3'
                    DataSource = dsContabil
                    TabOrder = 2
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object dbgDebitoCredito: TDBRadioGroup
                  Left = 220
                  Top = 38
                  Width = 76
                  Height = 42
                  DataField = 'LACDEBCRE'
                  DataSource = dsContabil
                  Items.Strings = (
                    'Débito'
                    'Crédito')
                  TabOrder = 3
                  Values.Strings = (
                    'D'
                    'C')
                end
                object dblcSubConta: TwwDBLookupCombo
                  Left = 218
                  Top = 16
                  Width = 86
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                    'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
                  DataField = 'CODSUBCONTA'
                  DataSource = dsContabil
                  LookupTable = qrySubConta
                  LookupField = 'CODSUBCONTA'
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnEnter = dblcSubContaEnter
                end
                object dblcCCusto: TwwDBLookupCombo
                  Left = 311
                  Top = 16
                  Width = 146
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Centro de Custo'#9'F'
                    'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsContabil
                  LookupTable = qryCCusto
                  LookupField = 'CODCENTROCUSTO'
                  Style = csDropDownList
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnEnter = dblcCCustoEnter
                end
                object dblcAtividade: TwwDBLookupCombo
                  Left = 461
                  Top = 16
                  Width = 155
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'NOME')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsContabil
                  LookupTable = qryUnidNegoc
                  LookupField = 'UNIDNEGOC'
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object tbsPrevidenciarioContab: TTabSheet
                Caption = 'Previdenciário'
                ImageIndex = 1
                object Label2: TLabel
                  Left = 8
                  Top = 16
                  Width = 73
                  Height = 13
                  Caption = 'Patrocinador'
                end
                object Label3: TLabel
                  Left = 8
                  Top = 64
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object dblcPatrocinadorContabil: TwwDBLookupCombo
                  Left = 8
                  Top = 32
                  Width = 321
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
                  DataField = 'IDPATRO'
                  DataSource = dsContabil
                  LookupTable = qryPatro
                  LookupField = 'IDPESSOA'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dblcPlanoPrevContabil: TwwDBLookupCombo
                  Left = 8
                  Top = 80
                  Width = 323
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'NOME')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsContabil
                  LookupTable = qryPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 740
    inherited Toolbar971: TToolbar97
      object sbtnEstornar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Es&tornar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnEstornarClick
      end
      object sbtnMudaStatus: TToolbarButton97
        Left = 300
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Stat&us'
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
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
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FF030303030303030303
          03030303030303040403030303030303030303030303030303F8F8FF03030303
          03030303030303030303040202040303030303030303030303030303F80303F8
          FF030303030303030303030303040202020204030303030303030303030303F8
          03030303F8FF0303030303030303030304020202020202040303030303030303
          0303F8030303030303F8FF030303030303030304020202FA0202020204030303
          0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
          040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
          03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
          FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
          0303030303030303030303FA0202020403030303030303030303030303F8FF03
          03F8FF03030303030303030303030303FA020202040303030303030303030303
          0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
          03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
          030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
          0202040303030303030303030303030303F8FF03F8FF03030303030303030303
          03030303FA0202030303030303030303030303030303F8FFF803030303030303
          030303030303030303FA0303030303030303030303030303030303F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnMudaStatusClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 471
    Width = 740
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90005
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from movimfinanc')
    Left = 376
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 512
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 160
    Top = 216
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update movimfinanc'
      'set'
      '  CODLANCFINANC = :CODLANCFINANC,'
      '  IDMODULO = :IDMODULO,'
      '  HISTPADFINAN = :HISTPADFINAN,'
      '  MOECODIGO = :MOECODIGO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  CODPORTADOR = :CODPORTADOR,'
      '  VALORLANCFINAN = :VALORLANCFINAN,'
      '  NUMCHQBORDERO = :NUMCHQBORDERO,'
      '  DATALANCFINAN = :DATALANCFINAN,'
      '  DATACONCILIACAO = :DATACONCILIACAO,'
      '  ENTRADASAIDA = :ENTRADASAIDA,'
      '  HISTORICO = :HISTORICO,'
      '  STATUSCONCILIA = :STATUSCONCILIA,'
      '  VALOROUTRAMOEDA = :VALOROUTRAMOEDA,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  CODLANCFINANC = :OLD_CODLANCFINANC')
    InsertSQL.Strings = (
      'insert into movimfinanc'
      '  (CODLANCFINANC, IDMODULO, HISTPADFINAN, MOECODIGO, PLNCODIGO, '
      'IDUSUARIOINCLUSAO, '
      '   CODPORTADOR, VALORLANCFINAN, NUMCHQBORDERO, DATALANCFINAN, '
      'DATACONCILIACAO, '
      '   ENTRADASAIDA, HISTORICO, STATUSCONCILIA, VALOROUTRAMOEDA, '
      'IDPESSOA)'
      'values'
      
        '  (:CODLANCFINANC, :IDMODULO, :HISTPADFINAN, :MOECODIGO, :PLNCOD' +
        'IGO, '
      ':IDUSUARIOINCLUSAO, '
      '   :CODPORTADOR, :VALORLANCFINAN, :NUMCHQBORDERO, '
      ':DATALANCFINAN, :DATACONCILIACAO, '
      
        '   :ENTRADASAIDA, :HISTORICO, :STATUSCONCILIA, :VALOROUTRAMOEDA,' +
        ' '
      ':IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from movimfinanc'
      'where'
      '  CODLANCFINANC = :OLD_CODLANCFINANC')
    Left = 440
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PORTADORCONTA.DESCRICAO'
      'MOVIMFINANC.DATALANCFINAN'
      'MOVIMFINANC.VALORLANCFINAN'
      'MOVIMFINANC.ENTRADASAIDA'
      'MOVIMFINANC.STATUSCONCILIA'
      'MOVIMFINANC.NUMCHQBORDERO'
      'MOVIMFINANC.HISTORICO'
      'HISTORICOFINAN.DESCRICAO'
      'MOVIMFINANC.VALOROUTRAMOEDA'
      'MOVIMFINANC.CODLANCFINANC'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Banco/Caixa'
      'Data do Lançamento'
      'Valor Moeda Corrente'
      'E/S'
      'Status Conciliação'
      'Número do Documento'
      'Histórico'
      'Histórico Padrão'
      'Valor Outra Moeda'
      'Código do Lançamento'
      'Sistema de Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOVIMFINANC'
      'PORTADORCONTA'
      'HISTORICOFINAN'
      'MODULO')
    CamposChave.Strings = (
      'MOVIMFINANC.CODLANCFINANC')
    Filtro.Strings = (
      'PORTADORCONTA.CODPORTADOR=MOVIMFINANC.CODPORTADOR'
      'HISTORICOFINAN.HISTPADFINAN=MOVIMFINANC.HISTPADFINAN'
      'MODULO.IDMODULO=MOVIMFINANC.IDMODULO')
    Mascaras.Strings = (
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      ''
      ''
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '15'
      '10'
      '10')
    Left = 704
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 408
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 344
    Top = 216
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 592
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 648
    Top = 8
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.*, U.NOME, C.NOME, T.DESCRICAO, I.MOESIGLA'
      
        'FROM RATEIOFINANC R, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEM' +
        'B T, MOEDA I'
      
        'WHERE R.CODLANCFINANC = 0 AND T.CODTIPRECDES = R.CODTIPRECDES AN' +
        'D T.RECPAG = R.RECPAG AND'
      
        '      T.IDPESSOA = R.IDPESSOA AND U.UNIDNEGOC = R.UNIDNEGOC AND ' +
        'U.IDPESSOA = R.IDPESSOA AND I.MOECODIGO(+) = R.MOECODIGO AND'
      
        '      C.CODCENTRORESPON = R.CODCENTRORESPON AND C.IDPESSOA = R.I' +
        'DPESSOA')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 480
    object qryDetNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 25
    end
    object qryDetNOME_1: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 30
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Recebimento/Desembolso'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryDetMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 5
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryDetVALOROUTRAMOEDA: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryDetCODTIPDOC: TFloatField
      DisplayLabel = 'Código Documento'
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
      Visible = False
    end
    object qryDetUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryDetCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryDetRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryDetCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryDetMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryDetTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetLOTETRANSMISSAO: TFloatField
      FieldName = 'LOTETRANSMISSAO'
      Visible = False
    end
    object qryDetIDRATEIOFINANC: TFloatField
      FieldName = 'IDRATEIOFINANC'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIOFINANC'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDRATEIOFINANC = :IDRATEIOFINANC,'
      '  CODLANCFINANC = :CODLANCFINANC,'
      '  IDPATRO = :IDPATRO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  MOECODIGO = :MOECODIGO,'
      '  VALOR = :VALOR,'
      '  VALOROUTRAMOEDA = :VALOROUTRAMOEDA,'
      '  CODTIPDOC = :CODTIPDOC'
      'where'
      '  IDRATEIOFINANC = :OLD_IDRATEIOFINANC')
    InsertSQL.Strings = (
      'insert into RATEIOFINANC'
      
        '  (IDPESSOA, IDEMPRESA, IDPROGRAMA, IDPLANOPREV, IDRATEIOFINANC,' +
        ' CODLANCFINANC, '
      
        '   IDPATRO, CODCENTROCUSTO, UNIDNEGOC, CODTIPRECDES, RECPAG, COD' +
        'CENTRORESPON, '
      '   MOECODIGO, VALOR, VALOROUTRAMOEDA, CODTIPDOC)'
      'values'
      
        '  (:IDPESSOA, :IDEMPRESA, :IDPROGRAMA, :IDPLANOPREV, :IDRATEIOFI' +
        'NANC, :CODLANCFINANC, '
      
        '   :IDPATRO, :CODCENTROCUSTO, :UNIDNEGOC, :CODTIPRECDES, :RECPAG' +
        ', :CODCENTRORESPON, '
      '   :MOECODIGO, :VALOR, :VALOROUTRAMOEDA, :CODTIPDOC)')
    DeleteSQL.Strings = (
      'delete from RATEIOFINANC'
      'where'
      '  IDRATEIOFINANC = :OLD_IDRATEIOFINANC')
    Left = 544
  end
  object qryHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HISTORICOFINAN')
    ValidateWithMask = True
    Left = 40
    Top = 128
  end
  object qryPortador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PORTADORCONTA')
    ValidateWithMask = True
    Left = 96
    Top = 48
  end
  object dsContabil: TwwDataSource
    AutoEdit = False
    DataSet = qryContabil
    Left = 672
    Top = 408
  end
  object qryUnidNegoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * from unidnegocio')
    ValidateWithMask = True
    Left = 224
    Top = 128
  end
  object qryTipoRD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT* from tiporecebdesemb ORDER BY RECPAG,DESCRICAO')
    ValidateWithMask = True
    Left = 440
    Top = 264
  end
  object qryCentroRespon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from centrespon')
    ValidateWithMask = True
    Left = 440
    Top = 248
  end
  object qryCotacaoMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA FROM COTACAOM' +
        'OEDA C, MOEDA M ')
    ValidateWithMask = True
    Left = 536
    Top = 200
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update movimfinanc'
      'set'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLACONTA = :PLACONTA,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACVALOR = :LACVALOR,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGERENCIAL = :LACTIPCONVGERENCIAL,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLICACAO = :LACORIGEMAPLICACAO,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  LACVALHIST = :LACVALHIST'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO and'
      '  LACNUMLAN = :OLD_LACNUMLAN')
    InsertSQL.Strings = (
      'insert into movimfinanc'
      
        '  (PLNCODIGO, LACNUMLAN, LACDEBCRE, HITCODHIST, IDPESSOA, IDEMPR' +
        'ESA, CODSUBCONTA, '
      
        '   IDMODULO, UNIDNEGOC, IDUSUARIOINCLUSAO, CODCENTROCUSTO, PLACO' +
        'NTA, PLANO, '
      
        '   LACTIPO, LACNUMDOC, LACHIST1, LACHIST2, LACHIST3, LACHIST4, L' +
        'ACHIST5, '
      
        '   LACVALOR, LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGERENCI' +
        'AL, LACVALGERENCIAL, '
      
        '   LACTIPCONVGEREN1, LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN' +
        '2, LACATOUTMOEDA, '
      '   LACORIGEMAPLICACAO, TIPCODIGO, LACVALHIST)'
      'values'
      
        '  (:PLNCODIGO, :LACNUMLAN, :LACDEBCRE, :HITCODHIST, :IDPESSOA, :' +
        'IDEMPRESA, '
      
        '   :CODSUBCONTA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :COD' +
        'CENTROCUSTO, '
      
        '   :PLACONTA, :PLANO, :LACTIPO, :LACNUMDOC, :LACHIST1, :LACHIST2' +
        ', :LACHIST3, '
      
        '   :LACHIST4, :LACHIST5, :LACVALOR, :LACTIPCONVOFICIAL, :LACVALO' +
        'FICIAL, '
      
        '   :LACTIPCONVGERENCIAL, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :L' +
        'ACVALGEREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLICACAO, '
      '   :TIPCODIGO, :LACVALHIST)')
    DeleteSQL.Strings = (
      'delete from movimfinanc'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO and'
      '  LACNUMLAN = :OLD_LACNUMLAN')
    Left = 672
    Top = 360
  end
  object qryCCusto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from centcust where (2=1)')
    ValidateWithMask = True
    Left = 536
    Top = 184
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.NOMESUBCONTA,S.CODSUBCONTA'
      'FROM CONTASXSUBC C, SUBCONTA S'
      'WHERE (RTRIM(C.PLACONTA) = :pPLACONTA) AND'
      '      (C.PLANO = :pPLANO) AND'
      '      (S.IDPESSOA = :pIDPESSOA) AND'
      '      (C.CODSUBCONTA = S.CODSUBCONTA) AND'
      '      (C.IDPESSOA = S.IDPESSOA)'
      'ORDER BY S.NOMESUBCONTA'
      '')
    ValidateWithMask = True
    Left = 384
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'pPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAuxTipoRD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SUBCONTA')
    ValidateWithMask = True
    Left = 440
    Top = 232
  end
  object qryModulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from modulo')
    ValidateWithMask = True
    Left = 200
    Top = 216
  end
  object dsModulo: TwwDataSource
    AutoEdit = False
    DataSet = qryModulo
    Left = 248
    Top = 216
  end
  object qryParamContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 48
  end
  object qryParamFinanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 304
    Top = 128
  end
  object qryParamGlobal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 216
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LC.*,U.NOME,CC.NOME,P.PLANOME'
      'FROM'
      '   LANCAMENTO LC, UNIDNEGOCIO U, CENTCUST CC, PLANOCONTA P'
      'WHERE'
      '   LC.PLNCODIGO = 0 AND U.UNIDNEGOC(+) = LC.UNIDNEGOC AND'
      
        '   CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO AND U.IDPESSOA(+) = ' +
        'LC.IDPESSOA AND'
      
        '   CC.IDEMPRESA(+) = LC.IDEMPRESA AND P.PLANO = LC.PLANO AND P.P' +
        'LACONTA = LC.PLACONTA'
      ' '
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 672
    Top = 456
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilPLANOME: TStringField
      DisplayLabel = 'Nome da Conta'
      DisplayWidth = 20
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryContabilIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilLOTETRANSMISSAO: TFloatField
      FieldName = 'LOTETRANSMISSAO'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 200
  end
  object updDet1: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIOFINANC'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODLANCFINANC = :CODLANCFINANC,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  MOECODIGO = :MOECODIGO,'
      '  VALOR = :VALOR,'
      '  VALOROUTRAMOEDA = :VALOROUTRAMOEDA,'
      '  IDRATEIOFINANC = :IDRATEIOFINANC,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA'
      'where'
      '  IDRATEIOFINANC = :OLD_IDRATEIOFINANC')
    InsertSQL.Strings = (
      'insert into RATEIOFINANC'
      
        '  (IDPESSOA, CODLANCFINANC, UNIDNEGOC, CODTIPRECDES, RECPAG, COD' +
        'CENTRORESPON, '
      
        '   MOECODIGO, VALOR, VALOROUTRAMOEDA, IDRATEIOFINANC, CODCENTROC' +
        'USTO, IDEMPRESA)'
      'values'
      
        '  (:IDPESSOA, :CODLANCFINANC, :UNIDNEGOC, :CODTIPRECDES, :RECPAG' +
        ', :CODCENTRORESPON, '
      
        '   :MOECODIGO, :VALOR, :VALOROUTRAMOEDA, :IDRATEIOFINANC, :CODCE' +
        'NTROCUSTO, '
      '   :IDEMPRESA)')
    DeleteSQL.Strings = (
      'delete from RATEIOFINANC'
      'where'
      '  IDRATEIOFINANC = :OLD_IDRATEIOFINANC')
    Left = 448
    Top = 48
  end
  object dsDet1: TwwDataSource
    AutoEdit = False
    DataSet = qryDet1
    Left = 496
    Top = 48
  end
  object qryDet1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.*, U.NOME, C.NOME, T.DESCRICAO, I.MOESIGLA'
      
        'FROM RATEIOFINANC R, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEM' +
        'B T, MOEDA I'
      'WHERE (1 = 2)')
    UpdateObject = updDet1
    ValidateWithMask = True
    Left = 536
    Top = 48
  end
  object qryNil: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 184
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 536
    Top = 168
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, P.RAZAOSOCIAL'
      'FROM PESSOA P, PATRO PT'
      'WHERE (P.IDPESSOA = PT.IDPESSOA)'
      'ORDER BY P.RAZAOSOCIAL '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 456
    object qryPatroRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PATRO.IDPESSOA'
      Visible = False
    end
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PlanPrevContabil'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 600
    Top = 456
    object qryPlanoPrevNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANPREV".IDPLANOPREV'
      Visible = False
    end
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROGRAMA,'
      '       DESCPROGRAMA'
      'FROM Programa'
      'ORDER BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 464
    Top = 456
    object qryProgramaDESCPROGRAMA: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryProgramaIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
  end
  object qryTipoDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'From TipoDocRecPag'
      'Where RECPAG= :RecPag'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'RecPag'
        ParamType = ptInput
      end>
  end
end
