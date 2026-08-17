inherited FrmMTRecebMerc: TFrmMTRecebMerc
  Left = 375
  Top = 69
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Recebimento de Mercadoria'
  ClientHeight = 491
  ClientWidth = 721
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 405
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 109
      Width = 719
      Height = 295
      Tabs.Strings = (
        'Itens Recebidos'
        'Agregados da Nota'
        'Integração Contas a Pagar'
        'Integração Contabilidade')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 621
        Height = 236
        inherited tbsDet: TTabSheet
          Tag = 99
          Caption = 'Itens Recebidos'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 613
            Height = 208
            Selected.Strings = (
              'PLANPREV'#9'18'#9'Plano Prev.'#9'F'
              'NUMSOLCOMPRA'#9'7'#9'Nº SCI'#9'F'
              'NUMOC'#9'8'#9'O.C.'#9'F'
              'QTDERECEBDEVOL'#9'10'#9'Quantidade'#9'F'
              'FLGDESTINO'#9'6'#9'Destino'#9'F'
              'CODARTIGO'#9'14'#9'Código Item'#9'F'
              'DESCPROD'#9'30'#9'Descrição do Item'#9'F'
              'CODMEDIDA'#9'4'#9'Unid.'#9'F'
              'VLRUNITARIO'#9'11'#9'Valor Unitário'#9'F'
              'VALORTOTAL'#9'10'#9'Valor Total'#9'F'
              'VLRESTOQUE'#9'13'#9'Valor do Estoque'#9'F'
              'CODCENTROCUSTO'#9'13'#9'Centro de Custo'#9'F'
              'CODFISCAL'#9'10'#9'Código Fiscal'#9'F'
              'DATAVALIDADE'#9'10'#9'Validade'#9'F'
              'CODALMOXARIFADO'#9'10'#9'Almoxarifado'#9'F'
              'CODCENTRORESPON'#9'10'#9'C.Respon.'#9'F'
              'UNIDNEGOC'#9'10'#9'Atividade'#9'F'
              'CODTIPRECDES'#9'15'#9'Tipo Desemb.'#9'F'
              'CODCOR'#9'5'#9'Cor'#9'F'
              'CODTAMANHO'#9'4'#9'Tam.'#9'F'
              'NUMRESERVA'#9'21'#9'Compromisso ~ Orçamentário'#9'F')
            KeyOptions = [dgAllowDelete]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
            TitleLines = 2
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 613
            Height = 208
            object pgclDadosItem: TPageControl
              Tag = 99
              Left = 0
              Top = 18
              Width = 613
              Height = 201
              ActivePage = tbsDadosGerais
              TabOrder = 0
              object tbsDadosGerais: TTabSheet
                Caption = '&Gerais'
                object Label2: TLabel
                  Left = 8
                  Top = 2
                  Width = 34
                  Height = 13
                  Caption = 'Artigo'
                end
                object Label12: TLabel
                  Left = 112
                  Top = 2
                  Width = 58
                  Height = 13
                  Caption = 'Descrição'
                end
                object Label13: TLabel
                  Left = 320
                  Top = 2
                  Width = 90
                  Height = 13
                  Caption = 'Qtde. Recebida'
                end
                object lblUnidMed: TLabel
                  Left = 432
                  Top = 2
                  Width = 53
                  Height = 13
                  Caption = 'Un. Med.'
                end
                object lbvalorUN: TLabel
                  Left = 488
                  Top = 2
                  Width = 78
                  Height = 13
                  Caption = 'Valor Unitário'
                end
                object lblDestEdit: TLabel
                  Left = 288
                  Top = 50
                  Width = 120
                  Height = 13
                  Caption = 'Almoxarifado Destino'
                end
                object Label6: TLabel
                  Left = 8
                  Top = 98
                  Width = 113
                  Height = 13
                  Caption = 'Classificação Fiscal'
                end
                object lblDtValidade: TLabel
                  Left = 136
                  Top = 98
                  Width = 99
                  Height = 13
                  Caption = 'Data de Validade'
                end
                object lbvalorTot: TLabel
                  Left = 272
                  Top = 98
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object dblkpcmbArtigo: TwwDBLookupCombo
                  Left = 8
                  Top = 16
                  Width = 97
                  Height = 21
                  Hint = 'Lista de Codigos Cadastrados '
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODARTIGO'#9'14'#9'Código')
                  DataField = 'CODARTIGO'
                  DataSource = dsDet
                  LookupTable = cdsArtigo
                  LookupField = 'CODARTIGO'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblkpcmbArtigoCloseUp
                end
                object dblcUnidMedida: TwwDBLookupCombo
                  Left = 432
                  Top = 16
                  Width = 50
                  Height = 21
                  Hint = 'Unidades de Conversão deste Produto'
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODMEDIDA'#9'4'#9'Código'
                    'FATOR'#9'10'#9'Fator'
                    'DESCMEDIDA'#9'25'#9'Decrição')
                  DataField = 'CODMEDIDA'
                  DataSource = dsDet
                  LookupTable = cdsUnidMed
                  LookupField = 'CODMEDIDA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnDropDown = dblcUnidMedidaDropDown
                  OnEnter = dblcUnidMedidaEnter
                end
                object dbedQtdeEnt: TDBRealEdit
                  Left = 320
                  Top = 16
                  Width = 105
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,0000')
                  TabOrder = 2
                  WordWrap = False
                  OnExit = dbedValUNExit
                  IntDigits = 10
                  DecDigits = 4
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QTDERECEBDEVOL'
                  DataSource = dsDet
                end
                object dbedValUN: TDBRealEdit
                  Left = 488
                  Top = 16
                  Width = 105
                  Height = 21
                  Alignment = taRightJustify
                  Color = clWhite
                  Lines.Strings = (
                    '0,0000')
                  TabOrder = 4
                  WordWrap = False
                  OnExit = dbedValUNExit
                  IntDigits = 10
                  DecDigits = 6
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRUNITARIO'
                  DataSource = dsDet
                end
                object GpDotOrc: TGroupBox
                  Left = 394
                  Top = 94
                  Width = 188
                  Height = 49
                  Caption = ' Compromisso Orçamentário '
                  TabOrder = 11
                  object BtnOrcamento: TSpeedButton
                    Left = 148
                    Top = 16
                    Width = 26
                    Height = 24
                    Glyph.Data = {
                      F6000000424DF600000000000000760000002800000010000000100000000100
                      0400000000008000000000000000000000001000000010000000000000000000
                      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                      77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
                      87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
                      FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
                      0E070F757770000000E070FFF707777777007700007777777777}
                    OnClick = BtnOrcamentoClick
                  end
                  object dbedtNumReserva: TwwDBEdit
                    Left = 16
                    Top = 18
                    Width = 132
                    Height = 21
                    DataField = 'NUMRESERVA'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                    OnExit = dbedtNumReservaExit
                  end
                end
                object dbrgECA: TDBRadioGroup
                  Left = 8
                  Top = 48
                  Width = 265
                  Height = 38
                  Columns = 3
                  DataField = 'FLGDESTINO'
                  DataSource = dsDet
                  DragMode = dmAutomatic
                  Items.Strings = (
                    '&Estoque'
                    '&Ativo Fixo'
                    '&Custo')
                  TabOrder = 5
                  TabStop = True
                  Values.Strings = (
                    'E'
                    'A'
                    'C')
                  OnExit = dbrgECAExit
                end
                object dblcCCusto: TwwDBLookupCombo
                  Left = 288
                  Top = 64
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Descrição'
                    'CODCENTROCUSTO'#9'10'#9'Código')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsDet
                  LookupTable = CdsCentroCusto
                  LookupField = 'CODCENTROCUSTO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkpcmbAlmoxa: TwwDBLookupCombo
                  Left = 288
                  Top = 64
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCALMOX'#9'40'#9'Descrição'
                    'CODALMOXARIFADO'#9'10'#9'Código')
                  DataField = 'CODALMOXARIFADO'
                  DataSource = dsDet
                  LookupTable = cdsAlmox
                  LookupField = 'CODALMOXARIFADO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblkpcmbAlmoxaCloseUp
                end
                object dblkpcmbClasFisc: TwwDBLookupCombo
                  Left = 8
                  Top = 112
                  Width = 110
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODFISCAL'#9'4'#9'Código'
                    'DESCCLASSIFISCAL'#9'50'#9'Descrição')
                  DataField = 'CODFISCAL'
                  DataSource = dsDet
                  LookupTable = cdsClasFisc
                  LookupField = 'CODFISCAL'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 8
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dbedDataValidade: TCMDateTimePicker
                  Left = 136
                  Top = 112
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAVALIDADE'
                  DataSource = dsDet
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
                  TabOrder = 9
                  OnExit = dbedDataValidadeExit
                end
                object dblkpcmbDesc: TwwDBLookupCombo
                  Left = 112
                  Top = 16
                  Width = 199
                  Height = 21
                  Hint = 'Lista de Artigos Cadastrados por Descrição'
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Descrição'#9'F'
                    'CODARTIGO'#9'14'#9'Código'#9'F')
                  DataField = 'CODARTIGO'
                  DataSource = dsDet
                  LookupTable = cdsArtigo
                  LookupField = 'CODARTIGO'
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dblkpcmbDescChange
                  OnCloseUp = dblkpcmbDescCloseUp
                end
                object reValorTotal: TRealEdit
                  Left = 272
                  Top = 112
                  Width = 109
                  Height = 21
                  Alignment = taRightJustify
                  Enabled = False
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 10
                  WordWrap = False
                  OnExit = reValorTotalExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
              end
              object tbsAgregItem: TTabSheet
                Tag = 99
                Caption = '&Agregados do Item'
                inline FrameAgregItem: TFrameAgregados
                  Width = 605
                  Height = 173
                  Align = alClient
                  inherited pnlTitulo: TPanel
                    Width = 605
                  end
                  inherited grdAgreg: TwwDBGrid
                    Width = 605
                    Height = 104
                  end
                  inherited plnEdAgreg: TPanel
                    Top = 127
                    Width = 605
                    Height = 46
                    inherited Label25: TLabel
                      Left = 8
                      Top = 2
                    end
                    inherited Label24: TLabel
                      Left = 136
                      Top = 2
                    end
                    inherited Label23: TLabel
                      Left = 264
                      Top = 2
                    end
                    inherited edAliquota: TDBRealEdit
                      Left = 8
                      Top = 16
                      Width = 113
                      Lines.Strings = ()
                    end
                    inherited edBaseCalc: TDBRealEdit
                      Left = 136
                      Top = 16
                      Width = 113
                      Lines.Strings = ()
                    end
                    inherited edValorAgreg: TDBRealEdit
                      Left = 264
                      Top = 16
                      Width = 113
                      Lines.Strings = ()
                      OnExit = FrameAgregItemedValorAgregExit
                    end
                  end
                  inherited dsAgregados: TwwDataSource
                    Top = 32
                  end
                  inherited cdsAgregados: TCMClientDataSet
                    Top = 32
                  end
                  inherited sqlImpostoxProd: TCMSqlParams
                    Top = 32
                  end
                  inherited cdsImpostoxProd: TCMClientDataSet
                    Left = 264
                    Top = 32
                  end
                end
              end
              object tbsIntegraCAP: TTabSheet
                Tag = 99
                Caption = 'Rateio para o Contas a Pagar'
                object lblCResp: TLabel
                  Left = 16
                  Top = 18
                  Width = 160
                  Height = 13
                  Caption = 'Centro de Responsabilidade'
                end
                object lblAtiv: TLabel
                  Left = 16
                  Top = 66
                  Width = 108
                  Height = 13
                  Caption = 'Atividade / Projeto'
                end
                object lblTipoDesemb: TLabel
                  Left = 16
                  Top = 114
                  Width = 116
                  Height = 13
                  Caption = 'Tipo de Desembolso'
                end
                object dblcCentRespon: TwwDBLookupCombo
                  Left = 16
                  Top = 32
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Nome')
                  DataField = 'CODCENTRORESPON'
                  DataSource = dsDet
                  LookupTable = cdsCentRespon
                  LookupField = 'CODCENTRORESPON'
                  Options = [loColLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblcAtividade: TwwDBLookupCombo
                  Left = 16
                  Top = 80
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Nome')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsDet
                  LookupTable = cdsUnidNegoc
                  LookupField = 'UNIDNEGOC'
                  Options = [loColLines, loTitles]
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblcTipoDesemb: TwwDBLookupCombo
                  Left = 16
                  Top = 128
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'Descrição')
                  DataField = 'CODTIPRECDES'
                  DataSource = dsDet
                  LookupTable = cdsTipoRecebDesemb
                  LookupField = 'CODTIPRECDES'
                  Options = [loColLines, loTitles]
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
          end
        end
        object TabAgregNota: TTabSheet
          Tag = 99
          Caption = 'Agregados da Nota'
          ImageIndex = 1
          inline FrameAgregNota: TFrameAgregados
            Width = 613
            Height = 208
            Align = alClient
            inherited pnlTitulo: TPanel
              Width = 613
            end
            inherited grdAgreg: TwwDBGrid
              Width = 613
              Height = 136
              Selected.Strings = (
                'CODTIPOCUSTAGREG'#9'10'#9'Cód. Tipo de ~ Custo Agregado'
                'CODTRATFISCE'#9'1'#9'Cód. Tratamento Fiscal ~ de Entrada'
                'DESCCUSTAGREG'#9'60'#9'Descrição'
                'PERCVALOR'#9'1'#9'Percentual / ~ Valor'
                'FLGBASE'#9'1'#9'Imposto incide na Base de ~ Cálculo de Outro Imposto'
                'IDAGRNFRECDEV'#9'10'#9'Identif. do Agregado ~da nota'
                'IDNFRECEBDEVOL'#9'10'#9'Ident. de NF de Recebimento / ~Devolução'
                'IDNFCOMPLEMENTAR'#9'10'#9'Ident. da NF'
                'PERCENT'#9'10'#9'Alíquota do ~ Agregado'
                'BASE'#9'10'#9'Base de Cálculo~do Agregado'
                'VALOR'#9'10'#9'Valor do Agregado'
                'VLRRECUPERADO'#9'10'#9'Valor Recuperado'
                
                  'ACUMBASE'#9'10'#9'     N- Não acumula para base ~M- Acumula a cada mês' +
                  #9'F')
            end
            inherited plnEdAgreg: TPanel
              Top = 159
              Width = 613
              Height = 49
              inherited edAliquota: TDBRealEdit
                Lines.Strings = (
                  '0,00')
              end
              inherited edBaseCalc: TDBRealEdit
                Lines.Strings = (
                  '0,00')
              end
              inherited edValorAgreg: TDBRealEdit
                Lines.Strings = (
                  '0,00')
                OnExit = FrameAgregNotaedValorAgregExit
              end
            end
            inherited dsAgregados: TwwDataSource
              Left = 56
              Top = 56
            end
            inherited cdsAgregados: TCMClientDataSet
              Top = 56
            end
            inherited sqlImpostoxProd: TCMSqlParams
              Left = 176
              Top = 32
            end
            inherited cdsImpostoxProd: TCMClientDataSet
              Top = 48
            end
          end
        end
        object TabCAP: TTabSheet
          Tag = 99
          Caption = 'Integração Contas a Pagar'
          ImageIndex = 2
          object Label11: TLabel
            Left = 8
            Top = 2
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label14: TLabel
            Left = 136
            Top = 2
            Width = 134
            Height = 13
            Caption = 'Histórico Complementar'
          end
          object LblFormaPag: TLabel
            Left = 344
            Top = 162
            Width = 73
            Height = 13
            Caption = 'Observação '
          end
          object Label16: TLabel
            Left = 344
            Top = 42
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label17: TLabel
            Left = 344
            Top = 82
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object Label18: TLabel
            Left = 440
            Top = 2
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Label21: TLabel
            Left = 344
            Top = 122
            Width = 208
            Height = 13
            Caption = 'Contas/Caixa e forma de Pagamento'
          end
          object Label20: TLabel
            Left = 8
            Top = 66
            Width = 251
            Height = 13
            Caption = 'Linha Digitável (Parte Superior do Bloquete)'
          end
          object Label19: TLabel
            Left = 8
            Top = 106
            Width = 256
            Height = 13
            Caption = 'Código de Barras (Parte Inferior do Bloquete)'
          end
          object cbEnglobParc: TCheckBox
            Left = 8
            Top = 40
            Width = 281
            Height = 17
            Caption = 'Este documento será parcelado ou englobado'
            TabOrder = 0
          end
          object dbeDataVenc: TCMDateTimePicker
            Left = 8
            Top = 16
            Width = 114
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCTO'
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
            TabOrder = 1
          end
          object EdHist: TEdit
            Left = 136
            Top = 16
            Width = 289
            Height = 21
            MaxLength = 60
            TabOrder = 2
          end
          object DblcCodForma: TwwDBLookupCombo
            Left = 344
            Top = 96
            Width = 264
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            LookupTable = cdsFormaPag
            LookupField = 'CODFORMA'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbclTipoDoc: TwwDBLookupCombo
            Left = 344
            Top = 56
            Width = 265
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'
              'CODTIPDOC'#9'10'#9'Código')
            LookupTable = CdsTipoDoc
            LookupField = 'codtipdoc'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dbclTipoDocCloseUp
          end
          object memObsCap: TMemo
            Left = 344
            Top = 176
            Width = 264
            Height = 41
            MaxLength = 1000
            ScrollBars = ssVertical
            TabOrder = 5
          end
          object edRef: TEdit
            Left = 440
            Top = 16
            Width = 169
            Height = 21
            MaxLength = 30
            TabOrder = 6
          end
          object GpConta: TGroupBox
            Left = 8
            Top = 152
            Width = 322
            Height = 65
            Caption = 'Conta Bancária '
            TabOrder = 7
            object Label22: TLabel
              Left = 16
              Top = 18
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 144
              Top = 18
              Width = 52
              Height = 13
              Caption = 'Nº Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 72
              Top = 18
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object BtnBuscaContaCor: TSpeedButton
              Left = 280
              Top = 32
              Width = 25
              Height = 23
              Hint = 'Altera Conta Bancária'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33033333333333333F7F3333333333333000333333333333F777333333333333
                000333333333333F777333333333333000333333333333F77733333333333300
                033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                333333773FF77333333333370007333333333333777333333333}
              NumGlyphs = 2
              OnClick = BtnBuscaContaCorClick
            end
            object lblDescTipoConta: TLabel
              Left = 208
              Top = 18
              Width = 97
              Height = 13
              AutoSize = False
              Caption = '- - - - - - - - - - - - '
            end
            object edtBanco: TEdit
              Left = 16
              Top = 32
              Width = 42
              Height = 21
              TabOrder = 0
            end
            object edtAgencia: TEdit
              Left = 72
              Top = 32
              Width = 56
              Height = 21
              TabOrder = 1
            end
            object edtConta: TEdit
              Left = 144
              Top = 32
              Width = 137
              Height = 21
              TabOrder = 2
            end
          end
          object dblcPortForma: TwwDBLookupCombo
            Left = 344
            Top = 136
            Width = 264
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            LookupTable = CdsContaCaixa
            LookupField = 'CODPORTFORMA'
            Style = csDropDownList
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object EdLinhaDig: TEdit
            Left = 8
            Top = 80
            Width = 289
            Height = 21
            TabOrder = 9
            Text = 'EdLinhaDig'
          end
          object EdCodBarra: TEdit
            Left = 8
            Top = 120
            Width = 289
            Height = 21
            TabOrder = 10
            Text = 'EdCodBarra'
          end
        end
        object tabContab: TTabSheet
          Tag = 99
          Caption = 'Integração Contabilidade'
          ImageIndex = 3
          object dbgContab: TwwDBGrid
            Left = 0
            Top = 0
            Width = 613
            Height = 201
            Selected.Strings = (
              'LACNUMLAN'#9'6'#9'Lanç.'
              'LACDEBCRE'#9'1'#9'D/C'
              'PLACONTA'#9'18'#9'Conta'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'LACVALOR'#9'10'#9'Valor'
              'LACNUMDOC'#9'15'#9'Documento'
              'LACHIST1'#9'40'#9'Histórico 1'
              'LACHIST2'#9'40'#9'Histórico 2'
              'UNIDNEGOC'#9'10'#9'Atividade/Projeto'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContab
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
        end
      end
      inherited Dock973: TDock97
        Width = 711
      end
      inherited Dock974: TDock97
        Left = 625
        Height = 236
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 719
      Height = 108
      object lblNumDoc: TLabel
        Left = 16
        Top = 66
        Width = 130
        Height = 13
        Caption = 'Número da Nota Fiscal'
      end
      object lblBarra: TLabel
        Left = 160
        Top = 84
        Width = 7
        Height = 13
        Caption = '/'
      end
      object lblValor: TLabel
        Left = 224
        Top = 66
        Width = 149
        Height = 13
        Caption = 'Valor Total da Nota Fiscal'
      end
      object lblEmissao: TLabel
        Left = 384
        Top = 10
        Width = 96
        Height = 13
        Caption = 'Data de Emissão'
      end
      object lblData: TLabel
        Left = 520
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Data de Entrada'
      end
      object dbenNumDoc: TDBRealEdit
        Left = 16
        Top = 80
        Width = 142
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMNF'
        DataSource = ds
      end
      object dblcFornCli: TCMProcuraForCli
        Left = 8
        Top = 8
        Width = 363
        Height = 48
        Caption = ' Favorecido '
        TabOrder = 0
        OnExit = dblcFornCliExit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Fornecedor em branco'
        Mensagens.NaoExiste = 'Fornecedor não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        OnChange = dblcFornCliChange
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object mskNumNF: TMaskEdit
        Left = 16
        Top = 80
        Width = 142
        Height = 21
        TabOrder = 1
      end
      object dbeCompl: TwwDBEdit
        Left = 168
        Top = 80
        Width = 44
        Height = 21
        DataField = 'COMPLNF'
        DataSource = ds
        MaxLength = 3
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValorCorrente: TDBRealEdit
        Left = 224
        Top = 80
        Width = 154
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        OnExit = dbeValorCorrenteExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRNOTAFISCAL'
        DataSource = ds
      end
      object chkCap: TCheckBox
        Left = 424
        Top = 82
        Width = 225
        Height = 17
        Caption = 'Não integrar com o Contas a Pagar'
        TabOrder = 4
      end
      object dbeDataEmi: TCMDateTimePicker
        Left = 384
        Top = 24
        Width = 122
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEMISNF'
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
        TabOrder = 5
        OnChange = dbeDataEmiChange
      end
      object dbeDataLanc: TCMDateTimePicker
        Left = 520
        Top = 24
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAENTDEVOL'
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
        TabOrder = 6
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
  end
  inherited Dock971: TDock97
    Top = 452
    Width = 721
    object lbAlterar: TLabel [0]
      Left = 24
      Top = 3
      Width = 229
      Height = 29
      Caption = 'Aguarde alteração...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 549
      DockPos = 735
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 380
      DockPos = 566
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 71
  end
  inherited ds: TwwDataSource
    Left = 433
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 520
    Top = 151
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 128
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 391
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NFRECEBDEVOL'
      'PESSOA')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 261
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnFind = CmeDetalheFind
    Left = 451
    Top = 311
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsItemNota
    Left = 664
    Top = 103
  end
  object cdsClasFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasFisc'
    Left = 558
    Top = 108
  end
  object cdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAlmox'
    Left = 620
    Top = 63
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
    ProviderName = 'DspCentroCusto'
    Left = 373
    Top = 140
  end
  object cdsAgregNotaTela: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAgregNota'
    Left = 390
    Top = 95
  end
  object cdsUnidMed: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspUnidMed'
    Left = 622
    Top = 48
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArtigo'
    Left = 285
    Top = 76
  end
  object dsAgregItem: TwwDataSource
    Left = 627
    Top = 103
  end
  object dsAgregNota: TwwDataSource
    DataSet = cdsAgregNotaTela
    Left = 617
    Top = 103
  end
  object cdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 593
    Top = 15
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 84
  end
  object cdsTipoRecebDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 582
    Top = 92
  end
  object MsContaCor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.CONTACORRENTE'
      'CONTABANCARIA.TIPOCONTA'
      'CONTABANCARIA.FLGCONTAPREF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Banco'
      'Num. Banco'
      'Num Agência'
      'Conta Corrente'
      'Tipo'
      'Preferencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO'
      'AGENCIABANCARIA'
      'CONTABANCARIA')
    CamposChave.Strings = (
      'CONTABANCARIA.IDCBANCARIA'
      'CONTABANCARIA.CONTACORRENTE'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.TIPOCONTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA'
      'CONTABANCARIA.IDPESSOA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15'
      '15'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 335
    Top = 7
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 461
    Top = 92
  end
  object dsContab: TwwDataSource
    AutoEdit = False
    DataSet = CdsContab
    Left = 605
    Top = 68
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 574
    Top = 79
  end
  object CdsCAP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 204
    Top = 95
  end
  object cdsNFCompl: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 540
    Top = 119
  end
  object CdsAgregNFCompl: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 518
    Top = 97
  end
  object cdsItemNota: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspItemNota'
    AfterOpen = cdsItemNotaAfterOpen
    Left = 474
    Top = 8
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 127
  end
  object cdsAgregItemTela: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 111
  end
  object spFormaPag: TCMSqlParams
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG'
      'WHERE  (RECPAG = '#39'P'#39')'
      '   AND (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCRICAO')
    ClientDataSet = cdsFormaPag
    Left = 653
    Top = 324
  end
  object spContaCaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39' AND'
      'NVL (FLGATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY 2')
    ClientDataSet = CdsContaCaixa
    Left = 653
    Top = 308
  end
  object cdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 132
  end
  object CdsContaCaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 277
    Top = 124
  end
  object CdsValTotAgreg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 706
    Top = 95
  end
  object CdsAgregAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 653
    Top = 15
  end
  object dsNFCompl: TwwDataSource
    AutoEdit = False
    DataSet = cdsNFCompl
    Left = 597
    Top = 92
  end
  object spContaCor: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      
        '       C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C' +
        '.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO'
      
        'FROM PESSOA PA, PESSOA PB, CONTABANCARIA C, AGENCIABANCARIA A, B' +
        'ANCO B'
      'WHERE (C.IDPESSOA = :IDPESSOA)  AND'
      '      (C.FLGCONTAPREF = 1)       AND'
      '      (C.IDAGENCIA = A.IDPESSOA(+)) AND'
      '      (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '      (A.IDPESSOA = PA.IDPESSOA(+)) AND'
      '      (B.IDPESSOA = PB.IDPESSOA(+))')
    Left = 655
    Top = 287
  end
  object CdsOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsOCAfterOpen
    Left = 589
    Top = 172
  end
  object spOC: TCMSqlParams
    SQL.Strings = (
      'select'
      '     SI.IDPLANOPREV,'
      '     '
      
        '     (SELECT NOME FROM PLANPREVCONTABIL PPC WHERE PPC.IDPLANOPRE' +
        'V = SI.IDPLANOPREV) AS PLANOPREV,'
      '     SI.IDPATRO,'
      '     SI.IDPROGRAMA,'
      ''
      '     I.NUMOC,'
      '     I.CODARTIGO,'
      '     I.CODMEDIDA,'
      '     I.IDPRODVARI,'
      '     I.IDITEMOC,'
      '     SI.NUMSOLCOMPRA,'
      
        '     SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI)' +
        ',1,60) AS DESCPROD,'
      '     '
      '     I.QTDEPEDIDA, '
      ''
      ''
      '     I.VALORUN,'
      '     P.CODFISCALPADRAO,'
      '     P.CODGRUPOPROD,'
      '     A.CODCOR,'
      '     A.CODTAMANHO,'
      '     S.CODALMOXARIFADO,'
      '     S.UNIDNEGOC,'
      '     S.CODCENTRORESPON,'
      '     S.CODCENTROCUSTO,'
      '     S.CUSTOESTOQUE,'
      '     S.IDPESSOA,'
      '     G.CODTIPRECDES,'
      '     G.RECPAG,'
      '     I.IDRESERVAORCAMEN,'
      '     AL.CODCUSTEIO,'
      '     O.DATAOC,'
      '     RP.FLGOK,'
      '     RP.IDPROCESSO,'
      '     CO.*,'
      '     TT.TOTALIOC AS QTDE,'
      '     TP.TOTALPEND AS QTDEPENDENTE'
      ''
      'from ITEMOC I, OC O, SCITEMOC SO, ITEMSOLI SI,'
      '     PRODUTO P, ARTIGO A, SOLICOMP S, GRUPPROD G,'
      
        '     CONVER CI, CONVER CS, PRODVARI PV, RADINSTPROCESSO RP, ALMO' +
        'X AL, COTACOES CO,'
      '    ('
      '     SELECT'
      '         SO.IDITEMSOLI,'
      '         SUM(SB.QTDEBAIXADA) AS QTDEBAIXADA'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          SOLIBAIXADAS SB,'
      '          ITEMOC I,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (O.IDFORCLI = :pforne)'
      '        AND (O.IDPESSOA = :pempresa)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '        AND (SI.IDITEMSOLI = SB.IDITEMSOLI(+))'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMSOLI) SB,'
      '    ('
      '     SELECT'
      '         SO.IDITEMOC,'
      '         SUM(SB.QTDEBAIXADA * CS.FATOR / CI.FATOR) AS TOTALSB'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          SOLIBAIXADAS SB,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = :pforne)'
      '        AND (O.IDPESSOA = :pempresa)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '        AND (SO.IDITEMSOLI = SB.IDITEMSOLI(+))'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '      GROUP BY SO.IDITEMOC) TB,'
      '    ('
      '     SELECT'
      '         SO.IDITEMOC, PP.IDPLANOPREV,'
      '         SUM(SI.QTDEPEDIDA * CS.FATOR / CI.FATOR) AS TOTALIOC'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O,'
      '          PLANPREVCONTABIL PP'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = :pforne)'
      '        AND (O.IDPESSOA = :pempresa)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI   = SO.IDITEMSOLI)'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '        AND (SI.IDPLANOPREV(+) = PP.IDPLANOPREV)'
      '      GROUP BY SO.IDITEMOC, PP.IDPLANOPREV) TT,'
      '     ('
      '     SELECT'
      '         SI.IDITEMSOLI, PP.IDPLANOPREV,'
      '         SUM(SI.QTDEPENDENTE * CS.FATOR / CI.FATOR) AS TOTALPEND'
      '      FROM'
      '          ITEMSOLI SI,'
      '          SCITEMOC SO,'
      '          ITEMOC I,'
      '          CONVER CI,'
      '          CONVER CS,'
      '          PRODUTO P,'
      '          ARTIGO A,'
      '          OC O,'
      '          PLANPREVCONTABIL PP'
      '      WHERE'
      '            (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '        AND (I.CODARTIGO     = A.CODARTIGO)'
      '        AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '        AND (O.IDFORCLI = :pforne)'
      '        AND (O.IDPESSOA = :pempresa)'
      '        AND (O.NUMOC    = I.NUMOC)'
      '        AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '        AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '        AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '        AND (SI.IDITEMSOLI   = SO.IDITEMSOLI)'
      '        AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '        AND (I.IDITEMOC = SO.IDITEMOC)'
      
        '        AND (((I.QTDEPEDIDA - I.QTDERECEBIDA) > 0) OR (NVL(I.QTD' +
        'ERECEBIDA,0) = 0))'
      '        AND (SI.IDPLANOPREV(+) = PP.IDPLANOPREV)'
      '      GROUP BY SI.IDITEMSOLI, PP.IDPLANOPREV) TP'
      ''
      'where (I.FLGITEMATENDIDO = '#39'F'#39' )'
      '  AND (O.IDFORCLI = :pforne)'
      '  AND (O.IDPESSOA = :pempresa)'
      '  AND (O.NUMOC    = I.NUMOC)'
      '  AND (I.IDITEMOC = SO.IDITEMOC)'
      '  AND (SI.IDITEMSOLI = SO.IDITEMSOLI)'
      '  AND (SI.NUMSOLCOMPRA = SO.NUMSOLCOMPRA)'
      '  AND (I.IDITEMOC = SO.IDITEMOC)'
      '  AND (I.CODARTIGO     = A.CODARTIGO)'
      '  AND (P.CODPRODUTO    = A.CODPRODUTO)'
      '  AND (SO.NUMSOLCOMPRA = S.NUMSOLCOMPRA)'
      '  AND (P.CODGRUPOPROD  = G.CODGRUPOPROD)'
      '  AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CI.CODMEDIDA    = I.CODMEDIDA)'
      '  AND (CS.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CS.CODMEDIDA    = SI.CODMEDIDA)'
      '  AND (I.IDPRODVARI    = PV.IDPRODVARI(+))'
      '  AND (RP.IDPROCESSO(+)= O.IDPROCESSO)'
      '  AND ((O.IDPROCESSO IS NULL) OR ((O.IDPROCESSO IS NOT NULL)))'
      '  AND (I.IDITEMOC = CO.IDITEMOC(+))'
      '  AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      '  AND (S.IDPESSOA = AL.IDPESSOA)'
      '  AND (SB.IDITEMSOLI(+)= SI.IDITEMSOLI)'
      '  AND (TB.IDITEMOC(+)  = SO.IDITEMOC)'
      '  AND (TT.IDITEMOC(+)     = I.IDITEMOC)'
      '  AND (TT.IDITEMOC(+)     = I.IDITEMOC)'
      '  AND (TP.IDITEMSOLI = SI.IDITEMSOLI)'
      '  AND (SI.QTDEPENDENTE > 0)'
      '  AND (I.IDITEMOC = CO.IDITEMOC(+))'
      '  AND (SI.IDPLANOPREV(+) = TP.IDPLANOPREV)'
      '  AND (TP.IDPLANOPREV = TT.IDPLANOPREV)'
      ''
      'ORDER BY O.NUMOC, DESCPROD'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 665
    Top = 225
  end
  object dsOC: TwwDataSource
    AutoEdit = False
    DataSet = CdsOC
    Left = 605
    Top = 84
  end
  object spGetEstado: TCMSqlParams
    SQL.Strings = (
      'SELECT CI.IDESTADO,  '
      '       E.CODESTADO,  '
      '       E.IDPAIS,'
      '       P.NUMDOCUMENTO'
      ' FROM  PESSOA P,     '
      '       ENDPESS EN,   '
      '       ESTADO E,     '
      '       CIDADES CI    '
      ' WHERE (P.IDPESSOA =  :IDFORCLI)'
      '   AND (P.IDENDCOMERCIAL = EN.IDENDERECO)'
      '   AND (E.IDESTADO = CI.IDESTADO)'
      '   AND (EN.IDCIDADES = CI.IDCIDADES)'
      ' ')
    Left = 655
    Top = 367
  end
  object CdsAtivoFixo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 489
    Top = 159
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA'
      'RESERVAORCAMEN.IDRESERVAORCAMEN')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número do Compromisso'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nº da Conta Orçamentária'
      'Nome da Conta Orçamentária'
      'Observação'
      'Id. Reserva')
    SensivelACaixa.Strings = (
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
      'RESERVAORCAMEN'
      'RADINSTPROCESSO'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO'
      
        '((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK IS NUL' +
        'L))'
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '25'
      '60'
      '50'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 637
    Top = 84
  end
  object sqlParamGlobal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  MOEDACORRENTE '
      'FROM PARAMGLOBAL WHERE IDPESSOA = :IDEMPRESA'
      ''
      ' ')
    ClientDataSet = cdsParamGlobal
    Left = 357
    Top = 100
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 127
  end
  object cdsParAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 549
    Top = 55
  end
  object SqlCompOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   RESERVAORCAMEN.IDRESERVAORCAMEN,'
      '   RESERVAORCAMEN.NUMRESERVA,'
      '   RESERVAORCAMEN.VLRRESERVA'
      'FROM'
      '   RESERVAORCAMEN,'
      '   RADINSTPROCESSO,'
      '   CONTASORCAMEN'
      'WHERE '
      '   ( RESERVAORCAMEN.FLGRESERVA = '#39'A'#39' ) AND'
      '   ( RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39' ) AND'
      
        '   ( RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO )' +
        ' AND'
      
        '   ( ((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK I' +
        'S NULL)) ) AND'
      
        '   ( CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAME' +
        'N ) AND'
      
        '   ( CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAME' +
        'N ) AND'
      '   ( RESERVAORCAMEN.NUMRESERVA = :NUMRESERVA )')
    ClientDataSet = cdsCompOrc
    Left = 531
    Top = 85
  end
  object cdsCompOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 595
    Top = 117
  end
  object SqlCdsItemsComOC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      I.IDPLANOPREV,'
      '      I.IDPATRO,'
      '      I.IDPROGRAMA,'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDITEMOC,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,'
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      I.IDPRODVARI,'
      '      I.IDRESERVAORCAMEN,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      P.CODGRUPOPROD,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      (0) AS QTDETOTAL,'
      '     '
      '      IT.QTDEPENDENTE,'
      '      IT.QTDEPEDIDA,'
      '      IT.NUMSOLCOMPRA,'
      '      I.CODMEDIDA AS CODMEDORI,'
      '      '
      '      '#39'T'#39' AS FLGPARCTOT,'
      '      (0) AS CODCUSTEIO,'
      '      (0) AS CODCUSTEIOLOGIN,'
      '      (0) AS CODALMOXARIFADOLOGIN,'
      '      ('#39'          '#39') AS CODCENTROCUSTOLOGIN,'
      '      NF.DATAENTDEVOL,'
      '      RO.NUMRESERVA,'
      '      RO.VLRRESERVA,'
      '      (0) AS IDSEGREGACRITER,'
      '      (0) AS NUMSOLCOMPRA,'
      '      PC.NOME AS PLANPREV'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      NFRECEBDEVOL NF,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV,'
      '      ITEMSOLI IT,'
      '      SCITEMOC SO,'
      '      PLANPREVCONTABIL PC,'
      '      RESERVAORCAMEN RO,'
      '      PESSOA PT,'
      '      SOLIBAIXADAS SB'
      'WHERE'
      '        ( I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '    AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)'
      '    AND ( I.CODARTIGO = A.CODARTIGO)'
      '    AND (IT.IDITEMSOLI = SB.IDITEMSOLI)'
      '    AND (I.IDITENSRECDEV = SB.IDITENSRECDEV)'
      ''
      '    AND ( SO.IDITEMOC     = I.IDITEMOC )'
      '    AND ( SO.IDITEMSOLI   = IT.IDITEMSOLI)'
      '    AND ( SO.NUMSOLCOMPRA = IT.NUMSOLCOMPRA)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      '    AND (RO.IDRESERVAORCAMEN(+) = I.IDRESERVAORCAMEN )'
      '    AND (I.IDPLANOPREV(+) = IT.IDPLANOPREV)'
      '    AND (IT.IDPLANOPREV = PC.IDPLANOPREV)'
      '    AND ((I.IDPESSOA = PT.IDPESSOA) OR (I.IDPESSOA IS NULL))'
      ''
      ''
      ' ')
    Left = 397
    Top = 43
  end
  object wwQueryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 385
    Top = 276
  end
end
